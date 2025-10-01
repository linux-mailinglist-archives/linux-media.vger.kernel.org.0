Return-Path: <linux-media+bounces-43515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A01BB204F
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 00:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDDC43BD44A
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 22:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704EC29BD89;
	Wed,  1 Oct 2025 22:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP0a3Qqp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05941EDA0E;
	Wed,  1 Oct 2025 22:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759359064; cv=none; b=uXEOYy73m3ohAmC9p4Vn3qR8mT4uQgOQxZO+HHxBDYPeB+7RZi8UqIMS5Wp8X7XCH9N56UO53MlyuBzWxX05o2kYhju/BFwHZ1il9CKpJbJIzEpsxZ2sumH2sJPR4cbRTkOvx/lI6lgp8pHyivq6Ad3vXTgNaic+kezci5Xa3AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759359064; c=relaxed/simple;
	bh=Djttqk34ER0ESBVMxJyaiYFqTEzXCahiRxMf3hRH2Oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9pk52m1cjZiqgLNmOKg5f0QYmCDrSxt+HYKXEeUpkxLpHnJfL3gZl6V5yz1KtlRj2TEUxrqxDW8VpRUpC5/tymJT/T8NaTIakVc3Jbg43XW9Zwf61kN8EyByaUvrk8ICjWccGkqa9rhJpfxW8vaVtks8YyhkaO13RFtbmjIPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP0a3Qqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75619C4CEF1;
	Wed,  1 Oct 2025 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759359064;
	bh=Djttqk34ER0ESBVMxJyaiYFqTEzXCahiRxMf3hRH2Oc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mP0a3Qqp2QqhSJm3i+wDuUnRynY8sc/MjG3vEo99gw/TbhVETUxAjhECEYmKbXOxF
	 lVvsouqHtMki5eXTblaAKMMyWF/OqhkmWa2zEBUSbi5EASSRHLCW19zkAA614WgVvc
	 fllCLk7wxQJVm966yJVWOSWAII24KnkJEH6SCbq8B80Al5B99P53/9ivNa/i6Cd1kq
	 BGvjhQh0iTf2LZTbGbzTjR62KOt7lWOofh3bUR6xIT54aD44b1CBMiu1YNyKrEN5jo
	 pGTc/QVCqn+TnZWwDgJiBkNnxdKRAfhs/iG0G0H7CkbsCJxTm4v+5Egfw/hlu9ukNf
	 Tnuwih/5gyATA==
Message-ID: <d27cf59a-69eb-4852-a4e8-e09951fb9e8e@kernel.org>
Date: Wed, 1 Oct 2025 23:51:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: iris: Add support for AV1 format in iris
 decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
 <ciT-_Uhd77qHG2ygz64U1Y_BIRryYOJ0J97aNJSn0hZ0uCc4PFCMgeO4RQCvMclHNKtyEToguFv2NVe-pRyUjA==@protonmail.internalid>
 <20251001-av1_irisdecoder-v1-3-9fb08f3b96a0@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251001-av1_irisdecoder-v1-3-9fb08f3b96a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2025 20:00, Deepa Guthyappa Madivalara wrote:
> Extend iris decoder driver to support format V4L2_PIX_FMT_AV1.
> This change updates the format enumeration (VIDIOC_ENUM_FMT)
> and allows setting AV1 format via VIDIOC_S_FMT for gen2 and beyond.
> Gen1 iris hardware decoder does not support AV1 format.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  1 +
>   .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 23 ++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_sm8250.c      | 17 +++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 25 ++++++----------------
>   6 files changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aa1f795f5626c1f76a32dd650302633877ce67be..bbfe7a0851ea94fb7041a868b4df8b2ec63bf427 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -138,6 +138,7 @@ enum hfi_codec_type {
>   	HFI_CODEC_DECODE_HEVC			= 3,
>   	HFI_CODEC_ENCODE_HEVC			= 4,
>   	HFI_CODEC_DECODE_VP9			= 5,
> +	HFI_CODEC_DECODE_AV1			= 7,
>   };
> 
>   enum hfi_picture_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..f1883ffc138fd975fb76d4e45904ee04e196cd20 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -19,6 +19,7 @@ enum iris_fmt_type {
>   	IRIS_FMT_H264,
>   	IRIS_FMT_HEVC,
>   	IRIS_FMT_VP9,
> +	IRIS_FMT_AV1,
>   };
> 
>   struct iris_fmt {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112eed25faea027a34c719c89d6c3897..9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -214,6 +214,8 @@ struct iris_platform_data {
>   	u64 dma_mask;
>   	const char *fwname;
>   	u32 pas_id;
> +	struct iris_fmt *inst_iris_fmts;
> +	u32 inst_iris_fmts_size;
>   	struct platform_inst_caps *inst_caps;
>   	struct platform_inst_fw_cap *inst_fw_caps_dec;
>   	u32 inst_fw_caps_dec_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..12dfbb79da4838069fd0c2b00c539f4a17e300ba 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -19,6 +19,25 @@
>   #define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
> 
> +static struct iris_fmt platform_fmts_sm8550_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_AV1] = {
> +		.pixfmt = V4L2_PIX_FMT_AV1,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	}
> +};
> +
>   static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = PROFILE_H264,
> @@ -760,6 +779,8 @@ struct iris_platform_data sm8550_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> @@ -852,6 +873,8 @@ struct iris_platform_data sm8650_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu33_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 16486284f8acccf6a95a27f6003e885226e28f4d..8fc27069a06d1480eccdbb0d41ed0f03f1328ec6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -17,6 +17,21 @@
>   #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>   #define BITRATE_STEP		100
> 
> +static struct iris_fmt platform_fmts_sm8250_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	}
> +};
> +
>   static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>   	{
>   		.cap_id = PIPE,
> @@ -337,6 +352,8 @@ struct iris_platform_data sm8250_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu-1.0/venus.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>   	.inst_caps = &platform_inst_cap_sm8250,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..be8d2d48c82f385e4f46807f7e0dd52e469927cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -67,26 +67,12 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>   	kfree(inst->fmt_src);
>   }
> 
> -static const struct iris_fmt iris_vdec_formats[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -};
> -
>   static const struct iris_fmt *
>   find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   {
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> +	unsigned int size = inst->core->iris_platform_data->inst_iris_fmts_size;
> +	const struct iris_fmt *fmt =
> +			inst->core->iris_platform_data->inst_iris_fmts;
>   	unsigned int i;
> 
>   	for (i = 0; i < size; i++) {
> @@ -103,8 +89,9 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   static const struct iris_fmt *
>   find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   {
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> +	unsigned int size = inst->core->iris_platform_data->inst_iris_fmts_size;
> +	const struct iris_fmt *fmt =
> +			inst->core->iris_platform_data->inst_iris_fmts;
> 
>   	if (index >= size || fmt[index].type != type)
>   		return NULL;
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

