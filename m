Return-Path: <linux-media+bounces-22006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AB9D87F2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BB8290CF7
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14521AF0CB;
	Mon, 25 Nov 2024 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMgqobii"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167B1AF0DB
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544884; cv=none; b=V1QuSzyVC8O7yGIFccjA0ODsCbrbx59y5YMJ67XyzO0ViWjmU52waDDb9iHhaCKHQsEZnGaajrvTrFjIspNPvbECQSaiBK4DV7al4XJxJ1E4OuOEzylG3m7ZNPlP2GiZB3/hKql2/f6e1uI3RSnFBVBfgksTpyfSDQIkJb90S2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544884; c=relaxed/simple;
	bh=wHrARFq5pjA+AXga2A8NGIdgg6vpSIG8/JvcZdp9ZTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWGfYLuiuJBlzSYoSL1ylsQJ/PbOqjz9nTjrmLJqZ0YjozCKGXzoaKL2sb45NL6ZIUXU4DcEwzgEPNtyYs6wJSJ2eGt6IJVSLrRJMSaVYtigugi7ENPaCKC4woWCrB0Zx3F/aVD0jkVQEv6OjH06WvqvLhbjgqHew0zYCgUfmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMgqobii; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-432d866f70fso41843105e9.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732544881; x=1733149681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwCdh/lVFSl+tyIgtOc72WNgOOnH15cv8cN3/KVwlSs=;
        b=aMgqobiiPADIDrMjhWBcN2OU2BSkcAZfumU8bWlcTasfreOGWLIfOxTwfUUWspzZ0d
         UBiutX7xRTyBZzwHO37F4fXqbtPoIDZZ5Ksfl+IJWY7qlhEbrVNq6XUdK7kl7imFz4rO
         2PEz82T9sRdEPq7/n1k+N+SQiIWkarP6culb0odqadi+QxhpBT/N+dECSf2MPOSK6mIE
         KHycMFJ7GJfGXkP9GsWe9T2plMT3BSERl9IgK6I/DyWWBevEL/uQnjqPPMz/uxpMwRzz
         76I325flqgUF6fIUC7xRyJ50JOEPXqL9WiSTFVRNQDkBZeqgr8HTWjMjVta3MviTwpqU
         nPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544881; x=1733149681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwCdh/lVFSl+tyIgtOc72WNgOOnH15cv8cN3/KVwlSs=;
        b=KPHsFDT0Bsfsnbg7kecuheBrzMiQSEZIRzLpSXCtcFEr7m0Xj3ft7d/fytDi1bgYMT
         CvipxLT1Uh8wAC9twITLZ/wvjm5KerUyn+yz0kjnJF+k/p0crgMlWewN6AmWAgSYSjwA
         2i1zdaFNdeuv+Q9/VmWLh44tjNQ9mvykMF1fWnQeDEczFOszBcEgzBMggSs5KWebBE77
         588tfJm5hnc/ssVdZoqYWvvVV1bBcvYRKb1eeBe4wlxymp9RbqFC6Czsv/cfzTFSZzME
         rcP9r9rYWmc/yXw6DsLfl7PFRdFz1fL9VKIysNdz/fO0JP/9/ETz6rlFkQOHoDNFPQG+
         EEWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNy/9hwXvdJlnIEmsBk5WN+KavYjbe2SMvlcrJbV2UrFA+kEWaJ2bKc5XPQ7VwiqND99DZtifl0FSd6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOnA/njbZHWPsULvekp5/dkCvit7ONjU7226bG5Du5tbnpKrWY
	f5pYR5aP27V7CQxDH7D7lNmoenm0HGL/vIhtk6L+decpTamm+x23eMSjUJl4GPM=
X-Gm-Gg: ASbGnct7nH++mGn6l8brVcNyOCGocnMzGb11AD7CD17VXDKBhofdMyd2WxNfcmtPXJT
	5scMZOpAlVveod8z4mLY95tVaTTNNt4uvSCNdLb95HUbGJVEKteOlhyucAhCLhdZ9RStqQjb7Nl
	HQqRAq3N0qIZJdZ7ywt02cn0aPnQZ0wCpOPGEH/PI0sioLXsww3tnq+DSAk4MshQOxOC+moAvav
	dXOEFM8fLXXLjHITeM1dAppvy5F90EXAQZRp+mMTqZ3+J1MwhTWUJqJdJDJAnI=
X-Google-Smtp-Source: AGHT+IHKFtw2FkrVFJBqO69N4BGShQKgr544JrHs0mrkZfzSa0FQpSavaB/3c2ze4SNlzhuV4W4AWg==
X-Received: by 2002:a05:600c:3b94:b0:433:6cf9:5e65 with SMTP id 5b1f17b1804b1-433ce4af3bfmr106924175e9.29.1732544880864;
        Mon, 25 Nov 2024 06:28:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b0139b22sm198293355e9.0.2024.11.25.06.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:28:00 -0800 (PST)
Message-ID: <b2d34144-bad0-4d12-86eb-08d17d9f2120@linaro.org>
Date: Mon, 25 Nov 2024 14:27:59 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: qcom: camss: Sort camss version enums and
 compatible strings
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112173032.2740119-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 17:30, Vikram Sharma wrote:
> Sort CAMSS version enums and compatible strings alphanumerically.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 10 +++++-----
>   drivers/media/platform/qcom/camss/camss-vfe.c          |  6 +++---
>   drivers/media/platform/qcom/camss/camss.c              |  2 +-
>   drivers/media/platform/qcom/camss/camss.h              |  4 ++--
>   4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index df7e93a5a4f6..7d2490c9de01 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,10 +505,6 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   	u32 val;
>   
>   	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		r = &lane_regs_sdm845[0][0];
> -		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
> -		break;
>   	case CAMSS_8250:
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -517,6 +513,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   		r = &lane_regs_sc8280xp[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
>   		break;
> +	case CAMSS_845:
> +		r = &lane_regs_sdm845[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
> +		break;
>   	default:
>   		WARN(1, "unknown cspi version\n");
>   		return;
> @@ -557,9 +557,9 @@ static bool csiphy_is_gen2(u32 version)
>   	bool ret = false;
>   
>   	switch (version) {
> -	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_845:
>   		ret = true;
>   		break;
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index d801275228b0..f9e64cbacb20 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -334,11 +334,11 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   			return sink_code;
>   		}
>   		break;
> -	case CAMSS_8x96:
>   	case CAMSS_660:
> -	case CAMSS_845:
> +	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_845:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -1693,9 +1693,9 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> -	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_845:
>   		ret = 16;
>   		break;
>   	default:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 12778846b2ca..2d8efed51912 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2692,10 +2692,10 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
> -	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ }
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index c50cf7dc81f2..bdc11d6d2203 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -77,13 +77,13 @@ enum pm_domain {
>   };
>   
>   enum camss_version {
> +	CAMSS_660,
>   	CAMSS_8x16,
>   	CAMSS_8x53,
>   	CAMSS_8x96,
> -	CAMSS_660,
> -	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_845,
>   };
>   
>   enum icc_count {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

