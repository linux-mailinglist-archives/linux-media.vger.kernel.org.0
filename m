Return-Path: <linux-media+bounces-50373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD143D0FE81
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37BB9300CF00
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94C526561E;
	Sun, 11 Jan 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsQHCNuO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8B255F2C;
	Sun, 11 Jan 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165741; cv=none; b=XszR8IRtyzwMeIdN466DOc14KRAQNM654Kq0fV19uJ8AihbntT/GiYlNe4d+TYYCJlCngbrBwQlFuM8Xj5r5PS7V2HM9kHC/VnO8DwzSpT6ReNUn61ThFgIbry6tMWD32hAEGBnJMqYo9V9JjgzrJBX1yTjuT5ecmD6fpGj1tf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165741; c=relaxed/simple;
	bh=2JYsoP/eV3h32LTildoY/7IEvkyzEPNOMadmy8Yckws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gshRC3U3PPsYokgqRSrQlOjWJGEDpuC4y3GxZpXWc37suNq5uZm6hy+Ly8C1+Aukn7H4bfrkO98pthl1QxXw6+3q6qDxakFIYirEfRmswh1fw56FiMnRoW/t3pdphQHnXAE7OIoqsrXuEVbreQgkVF4kDH8gGt0lKp/rHpKXBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsQHCNuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B933EC4CEF7;
	Sun, 11 Jan 2026 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165741;
	bh=2JYsoP/eV3h32LTildoY/7IEvkyzEPNOMadmy8Yckws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SsQHCNuOYvySVfkYxnTY5SPx2RMUAIS6ZIF57w1wpDALoJ/XL/5mMjNz2jLNDwQKP
	 nbUfemNOTEL+Ojecy4OkX2wOlD1Rd+mX7PETy+BdCZmuapHSBWxD5ScztPNv5mCO38
	 SH1W12YDUWTopiCK0mHTv7FdDc7FpMjjTEDg5tUXiAmO0U2q+s/i0vnlN2lC9/J7xl
	 CO/tnosm0+IsBweH1EYSk5l0d5ZoSUs214fMU1oODLjg+Mun+MLIwqVrV4MO6yfWem
	 WfDn809OMk+tqs0/gN98gJ2Tn9SkLDtZgV3QZngBICQuS+xfj1txpIz+I81YJg5VWg
	 n5mz0kMQE51kA==
Message-ID: <d204ad46-46b0-4b65-960e-ff63c98f3505@kernel.org>
Date: Sun, 11 Jan 2026 21:08:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <kK4SZcvZX-W32fTTc8iF22EfFp_sMd2anQI0XQbVtUxUtgJ3EX9Pazy4CPYfEn88UqmZ2oSHyAUGfKC2yoeXTQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
>   3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a4e60e9d32a4..a880751107c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
>   				    HFI_HOST_FLAGS_NONE,
> @@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
>   				    HFI_HOST_FLAGS_NONE,
> @@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8421711dbe60..9f9ee67e4732 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,9 +73,6 @@ struct tz_cp_config {
> 
>   struct ubwc_config_data {
>   	u32	max_channels;
> -	u32	bank_swzl_level;
> -	u32	bank_swz2_level;
> -	u32	bank_swz3_level;
>   	u32	bank_spreading;
>   };
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ae996d19ffd..0f06066d814a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
> -	.bank_swzl_level = 0,
> -	.bank_swz2_level = 1,
> -	.bank_swz3_level = 1,
>   	.bank_spreading = 1,
>   };
> 
> 
> --
> 2.47.3
> 
> 

Nice.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

