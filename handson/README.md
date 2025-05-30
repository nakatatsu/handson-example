# lambda-web-api モジュール 概要説明書

## 目的
- 公開用WEB APIを動作させるためのAWS Lambdaリソースを構築する

## 期待すること
- インターネットから直接アクセス可能なREST APIエンドポイントを提供すること
- Function URLsを用いてLambda関数を呼び出す
- CloudWatchによる監視とロギングが可能であること
- ハンズオンのため、Pythonで書かれた簡単なLambda関数のデプロイメントパッケージ（実際のコード）を含める

## 禁止事項
- VPCを新規作成してはいけない
- CI/CDパイプラインの構築は含めない
- API Gatewayリソースを作成してはいけない


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.12.1 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | = 2.7.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.97.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.7.1 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.97.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/lambda_function) | resource |
| [aws_lambda_function_url.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/lambda_function_url) | resource |
| [archive_file.lambda_zip](https://registry.terraform.io/providers/hashicorp/archive/2.7.1/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | 環境名 | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | プロジェクト名 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
