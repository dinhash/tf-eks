resource "aws_eks_cluster" "eks" {
  name     = "k8s-v2"
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = [var.subnet_id_1, var.subnet_id_2]
    endpoint_public_access = true
    # security_group_ids = [ "value" ]
    # public_access_cidrs = [ "value" ]
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]

  version = "1.22"
}


resource "aws_iam_role" "eks-iam-role" {
  name = "eks-iam-role"

  path = "/"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-iam-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-iam-role.name
}