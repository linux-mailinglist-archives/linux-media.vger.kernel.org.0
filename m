Return-Path: <linux-media+bounces-7436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F188288151C
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 17:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68E381F21827
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5306054746;
	Wed, 20 Mar 2024 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXVPuvRs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8253E0D
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710950506; cv=none; b=qhspv8YFU/iSZRGGNdUs5Gr7+ONCKFMD1lV/v/kOujSjOOgiaXKUmuo+De9d1VQLP01YjPHSTuPvKRixUNxl9E5vhrqIBe7Yl7dvlFjQqU6BPxojHCGSHEJCoYs2eVz2zk4RPozezqWb7UyUbQgMO1N+IKy+LZYguxIgXTsFnJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710950506; c=relaxed/simple;
	bh=kJOH+rnAS2hEXejfUJZwazxTlSB8DY7It82kT/meYn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSp03qq3b7qbWFLkG48GS4DK3P7u68DM21BKcUc180wq3+UiqkuPcbTGDxyu8bvxr56oTO1la7eLL0OW1x7df3B1/aQNaIJJskbGMFEiOWnvwPo6I1lHhl96SChqODvA3u8N9w547ZwR65fQFHFLcpaoPCMnTzTDBJuYUPZnDxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXVPuvRs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-414633f7a52so22251595e9.0
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710950503; x=1711555303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kL96kx3LN/9lm4lbLyIo1jNh4JW+F+59O3JF2oZwblI=;
        b=zXVPuvRs+uJ0obHjQjKp+UmikjjlQfiX3SSIrw2+PtFnxYp8pLjxy6Axv4OQcwsZP7
         zfBxqAFSQVfHfqMuB1PnWGhf0sGExhi7DTfff2KMJumzQcKfdYI29u08uaODET1zNUJW
         XNynpWwpGwfar+sgccAMpPE6LdWE4hxFtl9EPUy4iREkHml6OcDfn2vGWVcVOFKhLWmt
         jm3BESgVJB0Fdm4KwT88CpPrzxkRurtIpI7xgLJm5bfg8w5wYhN3Tvd04lUTfzu8ehGm
         ZdpQBiZccqXv/pMdWS1dzPd+uI4aekwQ+KSXRiKywcDurPosN4OFthxMJL3sRmhLmxij
         YIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950503; x=1711555303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kL96kx3LN/9lm4lbLyIo1jNh4JW+F+59O3JF2oZwblI=;
        b=uNj/iSzWE8cYWUDsBNwSN46aEOgdl4Ql7pvmKF6yyzdTMPrAhZhsWSHCVGgQ321y0W
         T2I0Lcy7mgQM+iqSWAEin2WxqkUEf9YkbsNcXwkosMY9uzHF/eoczFtPgKxG69IyrDh3
         bRPhAeniE760R7WklKQvebMHfwj1dcyTQRf1oeqKovm84d6DmzTnN3HfQpfVPzofu0Vh
         zF4q0vkgyFod0Cph5psTWt9kzTBTZH/2o3JG2ahV3EzhPqRRHSGCOu947igTP6ovJnxi
         SS8XD7YKSAmV7Y8CDTrQvUkPDLEBDPUq5DzOfMyPrk6NFIueRKbAnVLKY+ERgLxYa5Xz
         7akw==
X-Forwarded-Encrypted: i=1; AJvYcCW1EqDWJ6/uBD4+2ZSFWIbJEkj3hZ5fwTmad/7pVk25bQ3OzYG+rVev+szL/FwMOOYN0B+ktkD3R6dvrhE5llnzkOmRoJlNW3qEsPg=
X-Gm-Message-State: AOJu0Yxf5tt76MFKLoNkTeeHhhd6AhE4kL/kA++1Bf0j+5jlTuDU4nFn
	0N1eBzwKHhPhvdJIx274yky1vzFkhGbO9lf1I/lstD5Tbx/oM7E8/j56TzeWRl0=
X-Google-Smtp-Source: AGHT+IFIN6YIRXMa/mq1RLwjoKatqeyjBY5gl4ZOfUmSTIK1vlAArNKVYBMmbIRFvVAbqPe8dmgSPg==
X-Received: by 2002:a5d:560e:0:b0:33e:bfd0:335c with SMTP id l14-20020a5d560e000000b0033ebfd0335cmr12054591wrv.51.1710950503210;
        Wed, 20 Mar 2024 09:01:43 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id dd15-20020a0560001e8f00b0033ce727e728sm14983529wrb.94.2024.03.20.09.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 09:01:42 -0700 (PDT)
Message-ID: <944ff951-53dc-40f6-a7b0-5ecfc2cd4771@linaro.org>
Date: Wed, 20 Mar 2024 16:01:41 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] media: qcom: camss: Add sm8550 support
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-9-quic_depengs@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-9-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> Add in functional logic throughout the code to support the SM8550.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    | 19 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csiphy.c  |  1 +
>   drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++++++
>   .../media/platform/qcom/camss/camss-video.c   |  1 +
>   4 files changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index eb27d69e89a1..e9203dc15798 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -590,6 +590,25 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   			csid->base = camss->vfe[id].base + VFE_480_LITE_CSID_OFFSET;
>   		else
>   			csid->base = camss->vfe[id].base + VFE_480_CSID_OFFSET;
> +	} else if (camss->res->version == CAMSS_8550) {
> +		/* for titan 780, CSID lite registers are inside the VFE lite region,
> +		 * between the VFE "top" and "bus" registers. this requires
> +		 * VFE to be initialized before CSID
> +		 */
> +		if (id >= 2)
> +			csid->base = camss->vfe[id].base;

Hard-coded magic numbers are definitely out.

If you need to differentiate - please include something in the struct 
resources so that the flag is always available and we don't have to 
start doing funky magic index/magic number gymnastics.

> +		else {
> +			csid->base =
> +				devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
> +			if (id != 0)
> +				csid->top_base = camss->csid[0].top_base;
> +			else
> +				csid->top_base =
> +					devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
> +		}

What is the point of hooking the TOP base just to clear our the status 
registers ?

We take no meaningful action in the ISR that I can see.


> +
> +		if (IS_ERR(csid->base))
> +			return PTR_ERR(csid->base);
>   	} else {
>   		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
>   		if (IS_ERR(csid->base))
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 45b3a8e5dea4..f35af0dd2147 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -579,6 +579,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8550:
>   		csiphy->formats = csiphy_formats_sdm845;
>   		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index d875237cf244..ff115c5521c6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -226,6 +226,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8550:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -296,6 +297,10 @@ int vfe_reset(struct vfe_device *vfe)
>   
>   	reinit_completion(&vfe->reset_complete);
>   
> +	// The reset has been moved to csid in 8550

Please run checkpatch.pl on your code before submission C++ are not allowed.

---
bod

