Return-Path: <linux-media+bounces-50371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A556D0FE60
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C0D930383BF
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CAD26059D;
	Sun, 11 Jan 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQc1UAiD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69E239E7E;
	Sun, 11 Jan 2026 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165619; cv=none; b=SVDTX3UyOO+TwsqkTDphyGbHQirJii+oYE2zte15U4himL6srril59rS0YJ4gRooW2kpf5c/rDCsSZVZuenmrjRWpJ7z5D1YVFmmCyTuP0mAthwbk2QP61961wVTDC/3mkD0eXw0u0YYO5xIO9T4JqQB1e5uHzD6G2eF3HhJLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165619; c=relaxed/simple;
	bh=e0/sNEQAtuyYWVbM8PITHUUQVWLzsuYaXId9q2Wnd2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1pFRLN6T63AjLycuq7fn089KUprTe0lEM66OjnuRHyHMcXz38alxiI0G+Njhb7iJC9kLhmkVgn/QVAD6zmDidQjLSauJV7IBC1Z4gurBEhcsHBG/PwF98DB0H5HwUYF8DHLufszGAD3aYNvII5kOyLQE5M1MFjrn1nlbS3tS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQc1UAiD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D72C4CEF7;
	Sun, 11 Jan 2026 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165618;
	bh=e0/sNEQAtuyYWVbM8PITHUUQVWLzsuYaXId9q2Wnd2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aQc1UAiD5K+o4hF8HhOYvQc7QTUcnNQggsy9mgC85df0YkMBkQ4dtTpOM5hSmVs62
	 tCTkpygxrbSar40QqY2xJoqrJ3vrojjj+ShEcDRt+rzPHK4OeOEaLcEs6z2tzPk7AP
	 ThTgek8J1y6tNJvg/AZTwPCx7kRtLMNcDqSbjmpa/euekC7wa1MsHvFHkaDKRnCOs5
	 TjmoEzFnS0nTNeTxnNdRVdzSaOMmB6g8TQwcDewFosn+rysvFi7niNcwkBt/ELKhIF
	 Z9gNZbf8cViAafgBVFsdgZEJJGu0b/jElVb13FnNWPvFrPhpUHqPxpSWQMuv6d99hk
	 BVT7FkVCCmu5Q==
Message-ID: <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
Date: Sun, 11 Jan 2026 21:06:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] media: iris: don't specify min_acc_length in the
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
 <i1eMEm9fSpXb30tw6zP_FKeXfJr4sD7bS88njLCMUniDy_QNsOiVn5w41aA0zXnLaVRNFLaLrHgr73Yo2XV5lQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>   3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index d77fa29f44fc..878e61aa77c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
> 
> +#include <linux/soc/qcom/ubwc.h>
> +
>   #include "iris_hfi_common.h"
>   #include "iris_hfi_gen2.h"
>   #include "iris_hfi_gen2_packet.h"
> @@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
> 
>   void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
>   {
> +	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
>   	u32 payload = 0;
> 
>   	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
> @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->mal_length;
> +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_MAL_LENGTH,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8d8cdb56a3c7..3c5f3f68b722 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
> 
>   struct ubwc_config_data {
>   	u32	max_channels;
> -	u32	mal_length;
>   	u32	highest_bank_bit;
>   	u32	bank_swzl_level;
>   	u32	bank_swz2_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248..c70cfc2fc553 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
> -	.mal_length = 32,
>   	.highest_bank_bit = 16,
>   	.bank_swzl_level = 0,
>   	.bank_swz2_level = 1,
> 
> --
> 2.47.3
> 
> 

This code is fine but, I still suggest changing the 64b postfix in 
qcom_ubwc_min_acc_length_64b and just having the function return the 
size for the platform as _that_ is the more sustainable way.

Up to you.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

