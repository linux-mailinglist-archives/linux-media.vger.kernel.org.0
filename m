Return-Path: <linux-media+bounces-24808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887FA12A66
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 19:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C507161F07
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 18:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B021D5CC6;
	Wed, 15 Jan 2025 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcQvsbNP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634424A7E5;
	Wed, 15 Jan 2025 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736964112; cv=none; b=WOq8YAeHpeYSm6IM2Arq7HdFenBuxwCRV62uUz3TBKnylsAUS6DJkAlUkaNzlv3sd/EsnwT/cm0oF39aKuQICjOScvevg+gqefXhXgqFWzkL/MWteRhAiG3L3YeoEssQgzS1iHJMKkhtDRZXEI+gk2WaxZUzzX7FuYAxD2ZzoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736964112; c=relaxed/simple;
	bh=7AzXyM6KQLvHDwme0ozSkHFX9zoMaG7xLA+75jXGodQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHlNPk5NCoklbX2+U+mDQ1qFjEJ4NR/vb8gx9Y4Rr/AB+y+0CN1PLPg5X3j4joOaJP0LBJHikOig7YutGT0AbQNH1wDGoDXCSgM4y4mzn/4CQvP4VJ3SwqXN+YW3g6lE75K3h4x//Hq55Zn13dVTSzYaMLHFAPzZUcqpFhFD9MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcQvsbNP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43621d27adeso49117855e9.2;
        Wed, 15 Jan 2025 10:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736964109; x=1737568909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VczfqdZ4whJ4aH1I/uHwQhdIrVi0r59xlQ64CG5z0Mg=;
        b=QcQvsbNP+mWBBn25lQMJc3CPYMcLubYVH8f7KIWOMsFRA1j9mrLZL6MBWprZvJjSNi
         eg3hkwb8f/cR6nlQr2v/sKAQ5NQ96bBvVbxy+/woTWhRjeWtKEooqX10MpFFKns+3bo3
         0uNbthJszMBYbIoQHlvfDWO9idmTARuRgYDwzQTpfSRuoX4rh+CMvrLtzwE1svRUZm8Q
         mN1+iR+JYIRPVmMb+x+R5rHaP2yGO+dfA835ltvLnPKEENur6etrLPAbMam8PEAnDp2T
         1ql8UPazXHN4pplv3pQDB2s4O9GrKZlLio9byDxfeFeUNVXhHdO4jatt+XgIUrzx5iXM
         mEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736964109; x=1737568909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VczfqdZ4whJ4aH1I/uHwQhdIrVi0r59xlQ64CG5z0Mg=;
        b=leMGettOAzWSHchLJyk+FhkeurbBh+HpIMd8fcNAvtoz/iDaS8FLOCXhcSDXlI2POr
         p9kGBjFPtWc0BqmYDJhljKDVMaY6RXpRlyPbblzby8OdeH9vtTQGieFQrSxw+e8jIquu
         ukZ/vzrONW8Yc97LGKPK9GsBZFARfNeNThYb9eLqSk/kKeAZsHj3mXLS5SVO5eBfk43a
         la/hnEClCQ4L7bFX2lRLrfviRtjRhBOMHcj7yJsjhqjmokXiWD7mA1/zEHI8zOHpoudN
         2PcKeWxBhe3uvkzZaClldOM7T7pBNV52xPpJHCo2HSOdGr/pxGgGrFMCM8WPrPKHRei9
         im9w==
X-Forwarded-Encrypted: i=1; AJvYcCUII8AhTsVkX41kjWgq31Is290aFxlsRmLHF/ZwTNUvcddvb1G7bMUxeaHrSZukKWaemPsEgi8G8oty@vger.kernel.org, AJvYcCUgLqg8+SPbyraAxYnaQbonvIK8WSl8uLW50q2CIRrxyYDbY1XGrPjLoo2cQpbogP4WBbhBywqpUiw2OQWKzA==@vger.kernel.org, AJvYcCWLk82wTrcbH7kEh18MAjPfL5bYIH2GaCbakgQYOjQCPGluQ6Ib2cVmey+Lwux482/jFmIyNXgVfrINFw7i@vger.kernel.org, AJvYcCXxyS8gCWiL9oC2giiKcFQrrvk6HhaDxmFNX3M3Eg0TkbrD6dLFGzsRPEZEHx2WxqB2YsRgcCRv77YLWC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1ow49os3KBK2arcP+OiPnKfCp+bSUVj0wygkPsfjlgUuQiti
	3NUHYBnH6hUufsmPTDyf1YYm48fEKP2B3dlYKBNQmsmaBm+KcRxu
X-Gm-Gg: ASbGncstldH1Kgs1YhaL6Rvdamzxg/gsskyRSfS3vYRvt6YABChjIr6a4ZOCkmLpm1W
	EkMld2Z58ZHYXKcGmZg6nuyDytWZTIcjwiOr2kK0jJbQOamdvsf4mseIxuTctTc9VjS4MwJM9lw
	xW7W3+Dh3Q7Lv4rzvmo60pTGUiNVgLtaALB4v8w3eBtZzRAX/WaQU6giZ1E8mFhFgoncYRevNxf
	n6nsMoTA2skWB6tHJaKFuCJu37I+F9G5eBXKpz5Sj4UZfxk/M1GZolHwJ/EiawVBkcOTM32Y9g2
	I6RuAGHX5loE1jRDsS75ZQBqC5RdNBN94oUHzIs=
X-Google-Smtp-Source: AGHT+IE8P45XCPo0nxLHUv2u+tTz5U65fgpuDud/80vjVcjrVVHE6UQRFTAIGb6elydWnTGA5t4Vdw==
X-Received: by 2002:adf:b1d9:0:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38a87308c2bmr22096268f8f.41.1736964108442;
        Wed, 15 Jan 2025 10:01:48 -0800 (PST)
Received: from ?IPV6:2a02:2f04:910e:5100:7f33:5cd:6667:af9? ([2a02:2f04:910e:5100:7f33:5cd:6667:af9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0b1sm18396717f8f.12.2025.01.15.10.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 10:01:47 -0800 (PST)
Message-ID: <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
Date: Wed, 15 Jan 2025 20:01:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vladimir.zapolskiy@linaro.org, hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-6-quic_depengs@quicinc.com>
Content-Language: en-US
From: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
In-Reply-To: <20250108143733.2761200-6-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/8/25 16:37, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> A .data field in the csiphy device structure allows us to extend out the
> register layout of the three phase capable CSIPHY layer.
> 
> Move the existing lane configuration structure to an encapsulating
> structure -> struct csiphy_device_regs which is derived from the .data
> field populated at PHY init time, as opposed to calculated at lane
> configuration.
> 
> Reviewed-by: default avatarVladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Nit: Something's not right with this tag.

---
Best Regards, Laurentiu

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 54 ++++++++++---------
>   .../media/platform/qcom/camss/camss-csiphy.h  |  6 +++
>   2 files changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index b283df7634bb..39cc7109ccf0 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -470,32 +470,10 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
>   static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   				     u8 settle_cnt)
>   {
> -	const struct csiphy_lane_regs *r;
> -	int i, array_size;
> +	const struct csiphy_lane_regs *r = csiphy->regs->lane_regs;
> +	int i, array_size = csiphy->regs->lane_array_size;
>   	u32 val;
>   
> -	switch (csiphy->camss->res->version) {
> -	case CAMSS_7280:
> -		r = &lane_regs_sm8250[0];
> -		array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8250:
> -		r = &lane_regs_sm8250[0];
> -		array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8280XP:
> -		r = &lane_regs_sc8280xp[0];
> -		array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> -		break;
> -	case CAMSS_845:
> -		r = &lane_regs_sdm845[0];
> -		array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	default:
> -		WARN(1, "unknown cspi version\n");
> -		return;
> -	}
> -
>   	for (i = 0; i < array_size; i++, r++) {
>   		switch (r->csiphy_param_type) {
>   		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> @@ -588,6 +566,34 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
>   
>   static int csiphy_init(struct csiphy_device *csiphy)
>   {
> +	struct device *dev = csiphy->camss->dev;
> +	struct csiphy_device_regs *regs;
> +
> +	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
> +	if (!regs)
> +		return -ENOMEM;
> +
> +	csiphy->regs = regs;
> +
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		regs->lane_regs = &lane_regs_sdm845[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		regs->lane_regs = &lane_regs_sm8250[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		break;
> +	case CAMSS_8280XP:
> +		regs->lane_regs = &lane_regs_sc8280xp[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		break;
> +	default:
> +		WARN(1, "unknown csiphy version\n");
> +		return -ENODEV;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 49393dfd5215..4d731597fed7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -85,6 +85,11 @@ struct csiphy_subdev_resources {
>   	const struct csiphy_formats *formats;
>   };
>   
> +struct csiphy_device_regs {
> +	const struct csiphy_lane_regs *lane_regs;
> +	int lane_array_size;
> +};
> +
>   struct csiphy_device {
>   	struct camss *camss;
>   	u8 id;
> @@ -103,6 +108,7 @@ struct csiphy_device {
>   	struct csiphy_config cfg;
>   	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
>   	const struct csiphy_subdev_resources *res;
> +	struct csiphy_device_regs *regs;
>   };
>   
>   struct camss_subdev_resources;


