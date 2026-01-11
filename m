Return-Path: <linux-media+bounces-50375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDE0D0FEA3
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC0D73018838
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A085248893;
	Sun, 11 Jan 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBbcYic4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895631DED49;
	Sun, 11 Jan 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165794; cv=none; b=tQ1WlhMgkzZyMa+uzrzU1K1yMBtnhqRm3FohxRU9KMkSyeXMlk6ep/DeKpqIaauJKjyRw9g9utPUR7pXOjg3lkpHx2u+BDA8odjm1WRoSYEBL0dtwNW1druREWY5pKijvjgQYEnGPEESf0OeYt6IT3qqeyBG9xty5dBLFM3+Atc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165794; c=relaxed/simple;
	bh=evt7Ag7Q9d8aZ/ZISRuru4052MUIwKG4sjvVktf3fDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUX5DPin1th2Z/ZzGdcJNk779B78EWPKMj0AdywDp1QSd7lc8JS8WNBkwjmXOiwjAJZHjeI3pGLN52ESIXjYVrjSKpo7v5juj/pLkDJmn0xhyukljaVCq+T0jo5LgdIFtVUW/jyXGClr6Q18gLF9x56f7ZtcnEwmQn8xk9F43R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBbcYic4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E00C4CEF7;
	Sun, 11 Jan 2026 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165794;
	bh=evt7Ag7Q9d8aZ/ZISRuru4052MUIwKG4sjvVktf3fDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pBbcYic4lN69UdNR7vC3HOiUWR44F1IbsbLJxT8oEX9lB9d+0axm1tYkNZxY0VnVn
	 ByLgkhl5AbnsgClpilH/KvbNj8URxAvv59JTm6qek84n0KSNSQFglGLSIo7KWl7zJm
	 KkTXO3jn408S+o/r902OoAlzokGGJHM5x+LtX7ELIr7flwW9ZAiQbQTpruYx7ZmPkB
	 v7CZQolYdNRUbsfFCuFqfYd6GHV+hwrSY95pZaYjcOHzrehbqfEsRYzVgQd5XDPxAH
	 njPY9ddirHRKUQ5sv/tBZzB5va9SAPDGJusoLeLO5OmDLwkEr3sMrvjKrJRCrIh4UL
	 EhmsCPI9+mt2g==
Message-ID: <658b4273-f4ce-4d9e-a7e0-d2a61371a37a@kernel.org>
Date: Sun, 11 Jan 2026 21:09:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: don't specify max_channels in the
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
 <1n2csnpGsoDM0B5Y26jLEt42O1LiT-1qhJLOq6SZv6v_riV0MiVw1p0TsRrBWw4kY3NKpldSR6mw_KUz7CPb7w==@protonmail.internalid>
 <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:38, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>   3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_MAX_CHANNELS,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f99fcbb8fced..4abaf4615cea 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -72,7 +72,6 @@ struct tz_cp_config {
>   };
> 
>   struct ubwc_config_data {
> -	u32	max_channels;
>   };
> 
>   struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c967db452dec..e78cda7e307d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>   };
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
> -	.max_channels = 8,
>   };
> 
>   static struct tz_cp_config tz_cp_config_sm8550 = {
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

