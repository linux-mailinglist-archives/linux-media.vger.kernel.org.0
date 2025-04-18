Return-Path: <linux-media+bounces-30523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF2DA9335E
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2074D8E4A96
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D30B25A2B4;
	Fri, 18 Apr 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXPfdHP+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87B1F416D
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 07:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960651; cv=none; b=OMpfQPfw6E7pXmygJyYTY3GqmVH3sAkajADFbFKqoBv6d+J/1J24++fi8x2jEUlrFrrZ+y5lXpf8gk2mszlvXFmwG9PdFlj0u/OtnuaOYYLtMjueHyuobfyaB3F8RqdSncaGUhFRv+37sMXGkfN8s+P+muqQJumoUCqrVhd2s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960651; c=relaxed/simple;
	bh=1NYAZ9s3FN912r5R1+nyOhEXkSHN8iTTBsPkviYmqIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McSli/jp2t9H3C5XJlD9drQSdl9iGQh/Tr8jvWwuuwI8LgK15JiOCy2JQd5xnWEXbeC2ZU6Ooo9kAatBEeoXR19DV79q3CzDEYxD1ggMyXxhY0zVvrZlUpjLP81TF3yhfS2mzRiCgveuS3KstKybO4oz7HI2UbUyymSCCvx28q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXPfdHP+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39efc1365e4so116469f8f.1
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 00:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744960648; x=1745565448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvGO0qefvKjUH/UIq4IcUVMh3abWe/Yo1dAdnvmOivg=;
        b=mXPfdHP+89ocyglTl1dPcUl2BBsJErkbeXWXqsg2OZeQmXflxHkEFDIrQs0zPOT8iU
         S0Y426bhV3fouyw/K56M91oJMLdj+/ddD96NxK8T81qDIhHi1SEy9BcCCQX+MHWx7jsC
         mY3CcfbQWJbiXHbxd4r3jMz9zlTOeHWWmpccBkbg4TPjeNsc75wIKTnwAlGam0TArsDv
         MK9HbtCaoiPgUC4zB0rMn5avJ5/NUINJCCz9siwD6D3qPqbMPhwUwAgb5qcP8pcJtSA/
         /lExW6oes87d7gy1peO+zuKiBh9rZwoe8ulucjKfKyWdRXZMKJa0ytIU02bzCU3hsBpC
         Ruxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960648; x=1745565448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvGO0qefvKjUH/UIq4IcUVMh3abWe/Yo1dAdnvmOivg=;
        b=HvDq5W6gCLW27kOP7DPfLbjhE560FM4SR6JQGjuvmtYCfGaFqANRArZbNs/jUKfhd9
         ijTbVkCClZsUIzywM6Gcab/IQIqwSbJcpheFUDJ4LG901pYWtPADtYnDkImYOjMyborE
         t7DsZjk+YT6A4mSuXRUgvsrSvptAkPhKGwe15sJUIszNVZFrAj9jEG1UsVTIgMr61W2b
         gPX+voTKV/7XW56yYlHf+PgYUh78jNnVc1MVt7zGfUhulipX+lJ/U0OBxvJgVjHXV2NV
         +tEnUptHHR06PwO86mWBEoqaYEbHng0G+aI8Z62rszDRLTQ0ttEHeYAAugumD4JNn+6F
         E4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQeQNoY1J2XxOZ2hrSTPYlieWIwbCwkN7dVDHmXx7wZaOGGEFCKWuBXVy3XghdiwEAnxI2MOaL4Atk7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX05puL0K5+F/MDmbFPnjb0ftqeibENHVoyuwVlZpTXpe4NEHT
	kSUtHAfymguw+SvKXQhiw199rxy9fbxIMlut5TCOq8wKq9UvtXzcfSwvvxlcteY=
X-Gm-Gg: ASbGncvRdbBVm4f97Hk0mqnjlkq7sOxiZxGuenQTTTZldgQ30xrRl7qCvnPRTZP9kpH
	w0dPidf6wq/RxE8PUqU9xMvoaIDJsyBnvMQcvuUXWTLBVztmduMYDlgbl4C5OBs4uQDGRApQOQX
	b4uLLvGMSPk64PfHmw9MS1ERZPo/85lyrB10Phh61EdtNj6ECTv/vEL7KZB9WHhbw3keKTL3piI
	SGlxsjk73mjeI+CZKTKoPURHvu1/AK3/0VFK7+1xMDmPv+nTttjHLufl4OXEokZsSTV6g/X0O53
	hpHXVqMk3g1Og5mkh+u0+T9Q2LWR1PZb3+ZHdc6qJiH89bkceXMpPsA+IAhCSKfqRa2rl+S96ic
	IVLdsnA==
X-Google-Smtp-Source: AGHT+IFrbkI7BRFQfNl6ji1CHGR4492NPN5WPdfXqNCSKuMlVcr/3YVSjwhWaQNknXlP4E/Z6hB9pQ==
X-Received: by 2002:a05:6000:40df:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39efba51048mr1234524f8f.24.1744960648222;
        Fri, 18 Apr 2025 00:17:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433303sm1881239f8f.24.2025.04.18.00.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 00:17:27 -0700 (PDT)
Message-ID: <a29cdbe9-f980-4912-9aea-14d8942fb941@linaro.org>
Date: Fri, 18 Apr 2025 08:17:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph
 DPHY v2.0.1 init sequence
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
 <20250417145819.626733-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250417145819.626733-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/2025 15:58, Loic Poulain wrote:
> This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
> The table is extracted from downstream camera driver.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |  1 +
>   2 files changed, 90 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e..1857c802cf70 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
>   	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 2.0.1 2PH DPHY mode */

I'd be grateful if the comment could be more specific here:

https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c?ref_type=heads#L427

Process node and "mission mode" if you can find it would be appreciated.

> +static const struct
> +csiphy_lane_regs lane_regs_qcm2290[] = {
> +	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x000c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0064, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0730, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x072c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0734, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x073c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x071c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0700, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0704, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x070c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0738, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0764, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0230, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x022c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0234, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0228, 0x04, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x023c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x021c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0200, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0204, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x020c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0238, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0264, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0430, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0428, 0x04, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x040C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0464, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0630, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x062c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0634, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0628, 0x04, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x063c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x061c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0600, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0604, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x060C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0638, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 2.1.2 2PH DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_sm8550[] = {
> @@ -744,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
>   	bool ret = false;
>   
>   	switch (version) {
> +	case CAMSS_2290:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> @@ -829,6 +914,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_sdm845[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>   		break;
> +	case CAMSS_2290:
> +		regs->lane_regs = &lane_regs_qcm2290[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   		regs->lane_regs = &lane_regs_sm8250[0];
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a..377707d91ff2 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -78,6 +78,7 @@ enum pm_domain {
>   
>   enum camss_version {
>   	CAMSS_660,
> +	CAMSS_2290,
>   	CAMSS_7280,
>   	CAMSS_8x16,
>   	CAMSS_8x53,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

