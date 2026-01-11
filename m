Return-Path: <linux-media+bounces-50372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FED0FE71
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB82B305499E
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB988264617;
	Sun, 11 Jan 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1tpI5/7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8321DED49;
	Sun, 11 Jan 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165666; cv=none; b=H3JkeYbxMyLdE9++8Qjl30HaRJkpCkwFUE1qkzDj2+d7jwkV1bIT0DgSlm/duznDcmUn7qd7FPUIV1VII67BAQvudHbtFnLPbBs4XMu8g3ZEqwbewmNXHCna1G7UPk/8OSsiIrr1tnXppZV2sKtUvgseQBWYrZzIFLq6kvz6ByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165666; c=relaxed/simple;
	bh=OdxmsRPXnHcx0yijXVUQTXydd4xO+WrEel40b3AAZ5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JY5om/Vm/yncdfANIo9AuUBZJZqEjqEUsAwEizicmbi0K2nuk3xj+wl0Omv6vFoBWosZfKsLhFfBuS1HJtkcYsMOIyL8qTqxjEXk6iRj1dcxGzi/iFHqgYCNh3/NpjZpaBWGL0hS0g7t6EqKz64FzxJop8OUMWum6nqatEfW4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1tpI5/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A805C4CEF7;
	Sun, 11 Jan 2026 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165665;
	bh=OdxmsRPXnHcx0yijXVUQTXydd4xO+WrEel40b3AAZ5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1tpI5/7kwZ8DjCoKxsc04CHE2au85y8uYQ40a+elmjWkPUetjEGdlAcxerJ7Wvk0
	 EIbOCuOxGMpS0W1GONJ34X1J+swgdsQN/cO1VRTIxuCqtcBIgdfSJXPGcRLP766Ary
	 QSZyRm/HNb2Oj2g8acUsspVnBj0j1ZhbYqwHiw/pf5R4xT+AWUo6QTy8RovWjjVr9n
	 nxOJ7pMdWmhbcAgO5x67eQlkFwxdAUsOdjbJ50Zqva0Cm1PCeZWZcukFhigCVF2hC+
	 SAkuUqYwzAnREQ73zNC/Klm6o7rruTnFznkbT9rwp8vZB9tug97FTmDg4+J6uObsb4
	 lv9G+UxF5aD0g==
Message-ID: <524414d4-c918-44ee-a4e4-151e3ef6dc6e@kernel.org>
Date: Sun, 11 Jan 2026 21:07:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
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
 <I2gt0_k4RzSgxLIBxLHVhuy6g3gZaFDpQtGGf-nRwQkU_uyRaua8pU0r7rO7ZaJVtCrEILeJzCeq7hPZuZFXvA==@protonmail.internalid>
 <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>   3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 878e61aa77c3..a4e60e9d32a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
> +	payload = ubwc->highest_bank_bit;
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_HBB,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 3c5f3f68b722..8421711dbe60 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
> 
>   struct ubwc_config_data {
>   	u32	max_channels;
> -	u32	highest_bank_bit;
>   	u32	bank_swzl_level;
>   	u32	bank_swz2_level;
>   	u32	bank_swz3_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c70cfc2fc553..5ae996d19ffd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
> -	.highest_bank_bit = 16,
>   	.bank_swzl_level = 0,
>   	.bank_swz2_level = 1,
>   	.bank_swz3_level = 1,
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

