Return-Path: <linux-media+bounces-50369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1832D0FE27
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41A1F30142CE
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 21:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AEF24886E;
	Sun, 11 Jan 2026 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBlHjjsh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAB500963;
	Sun, 11 Jan 2026 21:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165403; cv=none; b=nJf8DDONBqaWeIqVRWL4w2ILhhOWEAgKj5a/gyR77sMEprF+wF3SUmvGmdIXe4H5/EpmPgwjByoY9VxJOMpZ1WKEzv6mkEXKHj/QY+ikpD281/6IvmgBXiBWtPFAG4jQzoagvjN+tdrvKkApFvU8+fIfgN8qA/x76b3S8LJ/wYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165403; c=relaxed/simple;
	bh=98SF4EWDPtPWNz2NGKy6Q4k9fisJSYi7J5ndWT0pWOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NILYBcZbFUAN6ebFsFjhlGc4QO5GAj/99h6dt/CbH8M3cuRTERMcGGljqTeSAuLr11Ah3JXiNeT/ibMr+3XwZfWqqyjnZ18nSWAXG01iY4VUHczDintD/2B4jqtKDPubux++WvBgHRluvrhcNIQFbWVvO1z5j3T0530aQHjXaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBlHjjsh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E41C4CEF7;
	Sun, 11 Jan 2026 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768165403;
	bh=98SF4EWDPtPWNz2NGKy6Q4k9fisJSYi7J5ndWT0pWOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dBlHjjshBzEfzfnSG45GSFz8aW+CrrDYdFV45vH4eBEYfHuWBXTNwIZXBq+9M2S+6
	 ZK2Zn8xwWCJyq6AGbII8K1kSVReN3xH/zbbLxquv93S1JzrNHhxv/5hWUKs8WoDpcL
	 FQZHOtMgyqIUwh+jxMaTrjsHzbbdgChin0lAK1KMBCpge+xD80soRMd2L9mEYX2AIY
	 Hf9sJF3cdPM7U3QzxBZVHHSnzWWaoV+H17aSvV7QMeyXHn9AcQ2a2Mc4vCx98EZC4n
	 j/r/ZqYrjf9Oy0dGkMxaVsIQTmPB9/GPzQWuzOtZKx1uzupzKyrTOP2c3BweNUKgKa
	 HV1W0KmXn6x+Q==
Message-ID: <40046fe6-4b30-4f12-a5ca-f85d27cf935e@kernel.org>
Date: Sun, 11 Jan 2026 21:03:16 +0000
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
Does that indentation pass checkpatch ?

I assume so but, please check.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

