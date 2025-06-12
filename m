Return-Path: <linux-media+bounces-34579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62FAD693D
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4CC3AF029
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 07:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC23211499;
	Thu, 12 Jun 2025 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypM+PAJf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140020FAB2
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713832; cv=none; b=tIgaQeckas1Wg4c0I1Wd8r2IzVsyEy00gAVPs723ZrFimlbV+DFoUNfLbIGpvoEKqP/kLKIyor3IHDuiXXBZ7jvOGi9C/edZ8qRm+1hEI2euaCuMpSnt8oc/w3/pOiZzLSvW463AokBmGcN92RqM+OmCbz8aVsvIPDG0qM/XFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713832; c=relaxed/simple;
	bh=IU1p/IhvhGd0RyDOhdF8b84u2MP0frN/i4FGc+o9J5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+JdvX7ElFvnAew/1d9cZEgdltyCgvMRnWdmNQbtUQGrumYkSuo2t6BKlULty9p0y707mqkcI/9XM1C1h6Vb1B7BYnw8MBX5X7Al72LJGNn/kayBlipU5ij6nn5e8O4pyF75cJnTTX4PQJkVzyCqcqkMGeECdbtaoyJ3YTiPmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypM+PAJf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a51d552de4so413764f8f.0
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749713828; x=1750318628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W43XvGoEP8mkSB47crpooGunoOi4UYJdDSFj0MKmJkw=;
        b=ypM+PAJflQXGCo1+0omtyB45HfCOLs5kgLtB6/L+hEfrGkRdTR91llsn+fMLmfc2BE
         6aZ68JwcZmQ+3NfVtuUFN50zDlWjY0zxZeCViuxLghwFWojNvsMCdTjqEnIr9Snwv0MI
         6tRWLxYQHduxSsRB+FVt12CIqXb8ZE3X0O+7b8EsPmMLCXA5Aq2IM74BzEkSn4xk+v1y
         uHNsLibhlZpMoLQFOC7GzkIWZu+JYhUAj8mk0Oi3bvjqhZd9CGTNNe0X09Ru1RyQTGPd
         93Vwgo3u2exUUurkZAroXbCbZfVPNoj0Tx7yt+/wQsgjUCJv3tLi4+8NFlKXyMsD4kjH
         X0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713828; x=1750318628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W43XvGoEP8mkSB47crpooGunoOi4UYJdDSFj0MKmJkw=;
        b=Q6QVg16TkJckK0/Ztms10pN/eKbMKXOJ9vRYqhxbw8tr5IcxXOKliidvTOq1aBNqA8
         R9wCYvv1PYbV3pLXtFtbcXfCP0PLCCUXnUbjr6Umtjbkblvxzo0JzeYh/PCUx9iMt0FE
         +x7Eh7hWVLWUi8zNJQcBnPh3Ez8A6dCL1hVW0uH9xq2sBDDpT4rIc1Lw9cpgfqnYVsH4
         1J9RP/8u2rPntaZjzKz+ArU9jk+7Ir32Lyt7wvJ347WOA+hlWdY/Toshd2sGuhc0Fp6H
         /Wp2nJ9O2Fy3JlbNB5tOgAu7c5Laj2FUWabR7ZeqYVoVO1a7pFi1S9w9bFVcF5BWqN8s
         d9tg==
X-Forwarded-Encrypted: i=1; AJvYcCVAEdZM5RxRdq23f5s4PPnPXK30V/RQe4n8SI6caA1pQrESECTR/yYafNw0AwpRx8Vv0eG7bvFsvYb5GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVNwslrf8q87tgVKJLEtjwP4/VEVc2xOtRs66XpE4NED0gWxpv
	YIdGSb0s5sH3+UgAzrTJxD2cvwdGPibGDn+yMCw9kc/32ivMezyNpa+ErGhx8pCKo0w=
X-Gm-Gg: ASbGncvVgij9kYUqUK0L8Nw6d/H23pjWBNa2hvG4tyDA20ilb7vIzFLVH2ctUa7P7eG
	x+ylrsyKQCuyjf411B7860sVMAhweChGoMyGu0+RzFBSRPd3o0mu6vC78yoWUPNiJ5tf6h1/y3d
	GbF/j9EyTFhzNkubGOIlq+AkfkbmN8Iu3tNyYmVp1ZWu/yggNvGRIj6d5AnRV176xbrxTIBRxbo
	sVQOQlRq3xC6eNfqZE5czwyV1upJrctsUMP3m4VMKCZpTjdeCunr68B2ZAakRkCl8nNpSkOEn+l
	cPND7DqypiidhweG3YggeK4YaC8uBCC6nOnIJ4W8eh/llV5NWyNBV7+pB9nEyEF30LgGk7wlf5R
	R1Ty7MA5vjbRqmSQu1z7ZvHq1gfQ=
X-Google-Smtp-Source: AGHT+IHL4AezVSzGCixMV23SR740pNZ45p8eWh/53EzPvM97Z+b2K3Gong4H2VnocQPS1Igv8w15Jw==
X-Received: by 2002:a05:6000:248a:b0:3a4:c6bc:995b with SMTP id ffacd0b85a97d-3a56075a226mr1774989f8f.35.1749713828299;
        Thu, 12 Jun 2025 00:37:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm11881445e9.24.2025.06.12.00.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:37:07 -0700 (PDT)
Message-ID: <9e992d51-1939-48b5-9798-7811a0c50033@linaro.org>
Date: Thu, 12 Jun 2025 08:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] media: qcom: camss: remove subdev resource argument
 from msm_csiphy_subdev_init()
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250612011531.2923701-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
> The removed argument is directly and unambiguously derived from other
> ones.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 6 +++---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 5 +----
>   drivers/media/platform/qcom/camss/camss.c        | 1 -
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae..1ba3fc2e33ac 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -569,16 +569,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>   
>   /*
>    * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
> + * @camss: CAMSS device
>    * @csiphy: CSIPHY device
> - * @res: CSIPHY module resources table
>    * @id: CSIPHY module id
>    *
>    * Return 0 on success or a negative error code otherwise
>    */
>   int msm_csiphy_subdev_init(struct camss *camss,
> -			   struct csiphy_device *csiphy,
> -			   const struct camss_subdev_resources *res, u8 id)
> +			   struct csiphy_device *csiphy, u8 id)
>   {
> +	const struct camss_subdev_resources *res = &camss->res->csiphy_res[id];
>   	struct device *dev = camss->dev;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	int i, j;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c44..d82dafd1d270 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -113,11 +113,8 @@ struct csiphy_device {
>   	struct csiphy_device_regs *regs;
>   };
>   
> -struct camss_subdev_resources;
> -
>   int msm_csiphy_subdev_init(struct camss *camss,
> -			   struct csiphy_device *csiphy,
> -			   const struct camss_subdev_resources *res, u8 id);
> +			   struct csiphy_device *csiphy, u8 id);
>   
>   int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   			       struct v4l2_device *v4l2_dev);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0d05f52a6e92..695f113472a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3074,7 +3074,6 @@ static int camss_init_subdevices(struct camss *camss)
>   
>   	for (i = 0; i < camss->res->csiphy_num; i++) {
>   		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -					     &res->csiphy_res[i],
>   					     res->csiphy_res[i].csiphy.id);
>   		if (ret < 0) {
>   			dev_err(camss->dev,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

