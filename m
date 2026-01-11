Return-Path: <linux-media+bounces-50376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430FD0FEC9
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAF423055779
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14F92673A5;
	Sun, 11 Jan 2026 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I44hA7vb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23512257845;
	Sun, 11 Jan 2026 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165844; cv=none; b=ksWAD4boWrvLgSWCd4TzM4AvkXN3NG2XFGIaXXc+FgOBYVZ5JA1PMyXbKfKcGwOzznpTJe4IFTI7SmUxqhm2/Eoonp2IkDMIXpsosUZ8TMYbOkIyuhcRVfsAfNLDTxhawOW5g+D4DVUYW9NbFMd8ONweSYcQciHHFHj91+A750U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165844; c=relaxed/simple;
	bh=WqFU50m/OyhqgZvSHbEJ4aKEsuxX2yYUFm9IKQ1ptZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9lL/6nN+KaUT85xQ+mVVL+qfu4QQGH2BvyOOoI92omXFmYnbnJ39fFIelFAhmWcPxtTu4d1JCYLIQRztTKrkpf62gcSL7Nk1N7Ncyfoc1wxdf/h4Bkb1cnIBf7WzJpp/ySogFSXsqG+hFZLmuG9N20Ox6iZnA49a9A8X9b1Qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I44hA7vb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5EDC4CEF7;
	Sun, 11 Jan 2026 21:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165844;
	bh=WqFU50m/OyhqgZvSHbEJ4aKEsuxX2yYUFm9IKQ1ptZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I44hA7vb8mnKL2syz2J8NjW3Dze1aeQSO3cXS7haeBvwYyIUMYlnlUlu83Omx4IVE
	 VIKMlDpAGEkAE29gKpCRF4HE3uqiENb46eDJjCws+Bp3pPK8pn/sYm5E39szNcJIY2
	 6smxZEs61DroFFQ0PcLZQhIB+L8kw9t83WKEfZPd1N7sPK9hZg+p/oeGMxp9Blg7nd
	 dugg0oqbPzJa2Fa40IurP0xearExeDwqP/5RTFFYHOZzEJhBvoyr5jTwanBg+rl2Nb
	 aUhjo5jPC/FylU2KdJlKj+GG1oxTChIWQg6iYH/ScTJZOEVR1s+MxC+5C8VgAvKRjx
	 2DMUDW+40HeAg==
Message-ID: <1a2ad0cf-4f07-4f48-af17-5fc022d3fb64@kernel.org>
Date: Sun, 11 Jan 2026 21:10:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
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
 <vAOrry4hBgy7cpUq3cFv850-E5z3bj4pw-tNuc-_BimXl6B_6j4F-ISdIELVavCsb4LycRLyrfilNz5ASenRXQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:38, Dmitry Baryshkov wrote:
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
>   2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 4abaf4615cea..3b0e9e3cfecb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -71,9 +71,6 @@ struct tz_cp_config {
>   	u32 cp_nonpixel_size;
>   };
> 
> -struct ubwc_config_data {
> -};
> -
>   struct platform_inst_caps {
>   	u32 min_frame_width;
>   	u32 max_frame_width;
> @@ -218,7 +215,6 @@ struct iris_platform_data {
>   	struct tz_cp_config *tz_cp_config_data;
>   	u32 core_arch;
>   	u32 hw_response_timeout;
> -	struct ubwc_config_data *ubwc_config;
>   	u32 num_vpp_pipe;
>   	bool no_aon;
>   	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index e78cda7e307d..5c4f108c14a2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
> 
> -static struct ubwc_config_data ubwc_config_sm8550 = {
> -};
> -
>   static struct tz_cp_config tz_cp_config_sm8550 = {
>   	.cp_start = 0,
>   	.cp_size = 0x25800000,
> @@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
>   	.tz_cp_config_data = &tz_cp_config_sm8550,
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
>   	.tz_cp_config_data = &tz_cp_config_sm8550,
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
>   	.tz_cp_config_data = &tz_cp_config_sm8550,
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = NUM_MBS_8K * 2,
> @@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
>   	.tz_cp_config_data = &tz_cp_config_sm8550,
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 2,
>   	.max_session_count = 16,
>   	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

