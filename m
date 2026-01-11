Return-Path: <linux-media+bounces-50370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15ECD0FE42
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B3683053304
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BBE25A645;
	Sun, 11 Jan 2026 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtKdEy1I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE298500963;
	Sun, 11 Jan 2026 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165542; cv=none; b=TAcmLHlta4VXnNYatJMx/25PwGlEs2J20qQYj/IoxiEXPWRgUUrv40YaIpwG8BhcPOznQ5/Ivgb4JFo0Jifl8sujjDsIA5u7JtmD4GRPhntGPbyn0B2tSTfC6wmeiarQMmsH1VjpyjPe1MZMOXszj/+KyG+M/u70ckl4ZsFCQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165542; c=relaxed/simple;
	bh=cAYliiNA8SLRvSWdlx6nI/Y2kpsMyFDFJQVvBbaYjTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEstahzcOpnPCNK+E6BULiEfDenOoByn+qD6l6UX3uWBODUfu/YZ+NJTQm4+0Kcgq/aPNg/c2kVBsr25wNdK6GaOAh+VPaKJdkYg62pSMlrZL8m78rYMMLiWmAytaxYRj8JLhmOqpbX8saZhtz621QKUpMc5CJ7NLMaNiNqpqJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtKdEy1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A802C4CEF7;
	Sun, 11 Jan 2026 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165542;
	bh=cAYliiNA8SLRvSWdlx6nI/Y2kpsMyFDFJQVvBbaYjTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rtKdEy1IVFdkQz8oemqb4Yg7DwiCin1gwsMpRcOY2kUFSU0IUDpJ43pfSDvU/T4uo
	 DsdhyV7ZW0bWQ68QCwGpWmS7tr3D0YvXPErgw8Wyw8p3X5V+xCR6gnJdEDPIcS2AVo
	 WCtjWaSjHD9A+H/fT1SpJ8rBbcGwXm0BkQUqcalqbXOnvfH4JdegHMRDIar/tyowv4
	 SI0hWcrO+D4K5Z3Vc9HUuOILaAWJHq8RMsyHTw5khYdKViXkslLJJiqzJCnuahn3P1
	 WX0fv/wb4QWC7Xlzx+0Gh2r94Hy1TIDixoiJAZrmM3bzhpXQBe4GxTrX7RvfsLxiMz
	 OtbcU1oBUUoig==
Message-ID: <bd95734f-5c38-46d0-a3f3-e88f85d384f5@kernel.org>
Date: Sun, 11 Jan 2026 21:05:35 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
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
 <s5qWCzqArtZJ__Z5g_Op86qPiA_J5OUkdeknnroNURmDWWR4-FvpsYpevQffI_wcobL40Rz9T71z3TBgVw32dw==@protonmail.internalid>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/linux/soc/qcom/ubwc.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..50d891493ac8 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>   	return ret;
>   }
> 
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);
> +}
> +
>   #endif /* __QCOM_UBWC_H__ */
> 
> --
> 2.47.3
> 
> 

Why not have this function return either 64 if the above is true or 32 
if not, then rename to qcom_ubwc_min_acc_length() ?

You could imagine some function SoC having a 128b length for argument's 
sake, it would make more sense just to modify this function then instead 
of all of the callsites.

---
bod

