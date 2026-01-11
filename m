Return-Path: <linux-media+bounces-50374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B7D0FEAD
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EF0A3067074
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D46269811;
	Sun, 11 Jan 2026 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSMkfACm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC10255F2C;
	Sun, 11 Jan 2026 21:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165771; cv=none; b=sBDwnyMv3/pr1pkhVuRIlHmFWXR05nvq45BRp4CLOL4JpShdUJYdEV9c0II04nZs6MZIsWgCgCL7qok6snHAciKBQy5e+bii6VXxmbo1YkyH3pMSlnqjM0AAsJEawcnFDoEXyZqAz5LCB2hZRemaQrP3f0KUPgMg4RBAmYXhpgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165771; c=relaxed/simple;
	bh=0/7jhlT6Y72LixL3oBSb6TvGdg8UZ7w8JhWlvkJc11w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdJ9ddkfTwDuqC1KK1uk+k+cEVJ3MsxPxw/BXiZ/4lygMVuJZ03ARdy9OTGmPntoulZXIfOPCxbeeo9E9tUhiP8XW/TBHNJ+ZWltT/YmbEZiQ+7NsCxILABYy8praNWzpq6z31FzuUw5Q6PZwatHoBPObUBT3M0ouomGH5xcilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSMkfACm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AB5C4CEF7;
	Sun, 11 Jan 2026 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165770;
	bh=0/7jhlT6Y72LixL3oBSb6TvGdg8UZ7w8JhWlvkJc11w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GSMkfACmyDhvVysJTPsHpeWhPMiuMLKT1obqd8jO7NwaI86RrmXW/MEgWXTu4fOU+
	 lYJ75gW5yfxen+qeU4Aq+jxkIakXQki6KkyB1Y/X5r2vp1owKykZfHjbE4IqRT0VzL
	 bc1+vrxbCGHAlww3BIFYnZEYTAvkGr4r6Upb9Gzvr7NC/9ATdFlJh7HehQTuyvNI6P
	 q78N1Rf8+r+42g86Gpf+eEX6nac0vk3BPtehxZwLGbaXZGdsezAHJTIS9DnHRp17hR
	 xFwAque8JRmuJ/qmwR5uF5R0NjNz35pst+tCRxuN5t64mMoXKQumGTHwZAXgAL02AS
	 oJvKsILm5bN6w==
Message-ID: <99662036-be8a-42b3-9d41-3b23cce06f65@kernel.org>
Date: Sun, 11 Jan 2026 21:09:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] media: iris: don't specify bank_spreading in the
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
 <0rv5rcbrLx-PCzwW9nW3A4bmxMALtxDkmIa57h3RMHEuQ3feRQK0JHAQU5KexSjx9pKq7IVjoPzLF2SYfXGX8Q==@protonmail.internalid>
 <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> The UBWC bank spreading is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
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
> index a880751107c7..9945c939cd29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_spreading;
> +	payload = ubwc->ubwc_bank_spread;
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SPREADING,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9f9ee67e4732..f99fcbb8fced 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
> 
>   struct ubwc_config_data {
>   	u32	max_channels;
> -	u32	bank_spreading;
>   };
> 
>   struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 0f06066d814a..c967db452dec 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
> -	.bank_spreading = 1,
>   };
> 
>   static struct tz_cp_config tz_cp_config_sm8550 = {
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

