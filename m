Return-Path: <linux-media+bounces-59198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CivCLA+52no5QEAu9opvQ
	(envelope-from <linux-media+bounces-59198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:09:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D35438A59
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4244303A904
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B423A381E;
	Tue, 21 Apr 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk6rIM3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473C39EF2D;
	Tue, 21 Apr 2026 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762089; cv=none; b=QnHNCNf9njw9rsaSe2HdRtI3V14PVa6tRplvmHsopR6jLoO2QhlcTaqoZqavhsbTKByuTjjcGiqq4cxI9xGcPzC0JznYepro2zmgG6EK/CJErAZff0N3uRPg1/gdLGnMOUjg4nj9dC26+EZBHLmcReWxJPbIAXOYn23SoffWEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762089; c=relaxed/simple;
	bh=y2l5cG81ggfdTqp/98j+ySPKuHYC3t/apoia6ktakV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtuF/B/uGOprecUrnoNo1Hep9ucvrx4kjAxo523drMWrkG5gxMscsr6W7oCEHonUkQWKf1CI/WbMyXsz/vjAae2CmDu5ARAXpZd86dqq1s5Yq0JBMpDFNiNRd4qOhdVCjI5D0prDmRrEWi/T3nYxSyqQhOQOQQZZoF4sZLUzuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk6rIM3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FB2C2BCB0;
	Tue, 21 Apr 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776762089;
	bh=y2l5cG81ggfdTqp/98j+ySPKuHYC3t/apoia6ktakV8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rk6rIM3Zfu+DvFut1XZe0UgM3zI6NhfCYb6udqMeTUx4UZg6w1/8R0JuJIbHD+lQA
	 AmcsHQgP/SLckUjk8yGmmm53jG0yWrtmLb0a2/tq7WXap+oe4okcsYWB712Nsu395z
	 k8JrIfpOliMCMBPrT/aUbD+VKTlzdTywRTgK6HIwDDHQ7Sb4RxEnEN9LZBaCpMFl3r
	 gTthnmqi4mltdGhCDbud+obttoeIWfd6z8rzos06JuAjQBcz47J1h5z6xTvlnzXMO/
	 LYvlUO2ORXasBTWtq6gCzXL0ngWAh2rOQlrP1e1emI4AFx6tLJOeSJyc9OahAzmWJl
	 Ll40wB2o02jsg==
Message-ID: <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
Date: Tue, 21 Apr 2026 10:01:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <lWwJ9pbXoZXg350L9fA8Sx-qznLud6KXnJlBTFNBLZQXEwKZeI50KGzJPDq43FO2QtbisF9pyxxeVTXX-WvN0Q==@protonmail.internalid>
 <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59198-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71D35438A59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 07:41, Vishnu Reddy wrote:
> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
> num_comv count unconditionally when calculating the COMV buffer size.
> This resulted in an oversized COMV buffer allocation throughout decode
> session, wasting memory regardless of actual number of buffers required.

You should define what a COMV buffer is before talking about how you are 
changing it, i.e. define the term Co-located Motion Vector (CMOV) and 
then use the abbreviation CMOV liberally as you wish.

> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
> replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it

"These derive num_cmove dynamically"

> uses inst->fw_min_count once the firmware has reported its minimum buffer
> requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
> initialization before firmware has communicated its requirements. This
> aligns the COMV buffer size to the actual count needed rather than always
> allocating with fixed VIDEO_MAX_FRAME value.
> 
> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
> COMV size calculation to use MIN_BUFFERS even before firmware had reported
> its actual requirements. Fix this by initializing fw_min_count to 0.
> 
> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
> to 6.16MB per decode session, significantly reducing memory consumption.

Cool nice fix.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 +++++++++++++++++++---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>   3 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..f433065e08b2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>   	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>   	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
> 
> -	inst->fw_min_count = MIN_BUFFERS;
> +	inst->fw_min_count = 0;
> 
>   	f = inst->fmt_src;
>   	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 9270422c1601..57237543b229 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>   	u32 height = f->fmt.pix_mp.height;
>   	u32 width = f->fmt.pix_mp.width;
> 
> +	if (inst->codec == V4L2_PIX_FMT_H264)
> +		return hfi_buffer_comv_h264d(width, height, num_comv);
> +	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		return hfi_buffer_comv_h265d(width, height, num_comv);
> +
> +	return 0;
> +}
> +
> +static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +	u32 num_comv;
> +
> +	num_comv = inst->fw_min_count ? inst->fw_min_count : inst->buffers[BUF_OUTPUT].min_count;

Please just if/else this though its far easier to read/understand that way.

> +
>   	if (inst->codec == V4L2_PIX_FMT_H264)
>   		return hfi_buffer_comv_h264d(width, height, num_comv);
>   	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> @@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>   		if (inst->fw_caps[DRAP].value)
>   			return 0;
>   		else
> -			return hfi_buffer_comv_av1d(width, height, num_comv);
> +			return hfi_buffer_comv_av1d(width, height,
> +						    num_comv + AV1D_COMV_BUFFER_OVERHEAD);
>   	}
> 
>   	return 0;
> @@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> 
>   	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
>   		{BUF_BIN,         iris_vpu_dec_bin_size             },
> -		{BUF_COMV,        iris_vpu_dec_comv_size            },
> +		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
>   		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
>   		{BUF_LINE,        iris_vpu_dec_line_size            },
>   		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
> @@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
> 
>   	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
>   		{BUF_BIN,         iris_vpu_dec_bin_size         },
> -		{BUF_COMV,        iris_vpu_dec_comv_size        },
> +		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
>   		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
>   		{BUF_LINE,        iris_vpu4x_dec_line_size      },
>   		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 12640eb5ed8c..7a9cc1c92da3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -110,6 +110,7 @@ struct iris_inst;
>   #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
>   #define AV1D_NUM_HW_PIC_BUF    16
>   #define AV1D_NUM_FRAME_HEADERS 16
> +#define AV1D_COMV_BUFFER_OVERHEAD 7

Whats this ? Why is there a new seven byte overhead ? Does it represent 
a header, an alignment ?

An overhead can mean anything.

>   #define SIZE_AV1D_SEQUENCE_HEADER 768
>   #define SIZE_AV1D_METADATA        512
>   #define SIZE_AV1D_FRAME_HEADER    1280
> 
> ---
> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
> change-id: 20260421-optimize_comv_buffer-ae7107673609
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 



