Return-Path: <linux-media+bounces-28304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F50A63281
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CE0716D9C6
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 20:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C94E19E994;
	Sat, 15 Mar 2025 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRS1vfF4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24DD197A8E
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742071317; cv=none; b=UWT+yJU54CYuRHZLq9WaQIryuCog8XWZ7S/c9BzMhFd8bQAwjOCDBW5q4lAEfnwYvTJ4AXCbDlIzTKSKdW/xVfGnY74jYj0HEQdy0jsG2yPpV+/ptnhqDvVO+wt0VRVLFoEdMqM0KNBLPQXCzkJ4UUf0rWarH5ovAIsigjU2hGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742071317; c=relaxed/simple;
	bh=RIfWPAChHSz72gjZlLc5ExR+4priFBZzw6RH4JqDIIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAGVB/FMJrunz0VhCNwO4o59UmYS9SYsFs6mGl1YFouC7lj7Zv9IxQ4Ov5wJmnupGqX1oHggYo17pjpMqg5iZnDu+VCRfTBuMWoj6O+uelw3YGJn2s56pFIauuN84sNS7QQUfzoDkbM0vmzWgOOBENgcOnrDONw7LWkt7UsJYsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRS1vfF4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742071314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4Qe5ZHqU6rDGRDls+HimnRJmloPfqlgU4TV25ZVEhI=;
	b=GRS1vfF43H2/4ZX4FQygxLtAlOKFw30iFjY4dsUIgqHrMULqe+F/sD2rH7iC1GA62TVJ3P
	q3j3h2pC9PQL2505vCmN8LSEmNzYi9svq46V4DzcdSCn8ge7UGw3U3qpJHjA5QiFre/J6F
	hdQg1Y/gti7FRw9FbUBE2D7SES2Sydg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-f8Ff-3rSNtiifY4yd59OVg-1; Sat, 15 Mar 2025 16:41:53 -0400
X-MC-Unique: f8Ff-3rSNtiifY4yd59OVg-1
X-Mimecast-MFC-AGG-ID: f8Ff-3rSNtiifY4yd59OVg_1742071312
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5dd82d541so3086849a12.2
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742071312; x=1742676112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4Qe5ZHqU6rDGRDls+HimnRJmloPfqlgU4TV25ZVEhI=;
        b=O/ifWTHCihZ6gLtum/aenD5WD+ti2pPcTJy1ahljG6DopfwtOEsBvymMNb9HNHwEYR
         lLwR1XFLCLKNiXOHZGvPgJ3Wv88Kupok6jvYbABtcFADlBSbnToPobjMmDr0xsNx+0Ul
         iGRqRAE05IWogmbHcXIGNdo3Q7uioIj1aRUs6M72Mg8gEztPvKWDc/fCs0ZgJmcrfcAJ
         ZCfA20vIcuFwOBLbMyUMs7XGdK7kJOaErNR6wnCgZoQADMczJA4hRO08WsxkVysf0jqU
         4UHSWOMUpGpex8P56n9SUjDlWlZn/vkNWUfW+t31yGMJNUb1bJgVXkCklFuHo+vLIonv
         areA==
X-Forwarded-Encrypted: i=1; AJvYcCW0zTGE72/FAED/NdKr/PZymsuwBMcZ3AgE0wA1Z31DxuJy2iLB8HrHXZ9oI17xpgGrOb1nVuoygB1a8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmY67cNWj8ley54DlLyXZdldDEiR9n8+WmszFHYs6d+lslgXOf
	R8xC5zwMMFDC6bMZMNJRrIRtIcGZWjN8JVjUF7NwVzcVVV8//pYeWiqWLGRl32ronHm4nLmB6vi
	MTJ4mBVCszyj8RVJ2E4xc/Aa0Z9AhtL9k6L3DDs3tBF1QcuYNSaWaxTGAX4zu
X-Gm-Gg: ASbGncvrCN99mwXXttNQnNGizbDdiFAMmvTx7QU6pr6PAtzGfRjYi8MeQbMXPTx7W9C
	lIcDi1Lvt2XWz+Lq60uXheBcxpW0kPtebk+QxO3kuFKZEW2gNleO2b1sjiuPwlqrKPVCpa6beRv
	/lqBZBRSAAJgtmEXPiejG3IDppqsXUCdsvVBxUC3Uwu4BFGxQMwb4qdnJCFWv/J+RVFYuCD2FTs
	iQt55HsI4D2bmppQqHn3BdNFmjUYlbJnX+Xj+t/nkCI4DYOHIGCMoeXkQgcW/y+yQ9Ovu8wub3c
	2Bj+oOAKdoK9yWsjQjoj1TeF/aca6panXVIJF0q5NR2WcGaRExJesb4nZtEiPWywgjs6FGES70O
	jUZPUzaHSCFgRowPBpDM1DBExycAlQLWXeY9W76Zwr5lrU8J6srKN8LdlnRv7HH4DWw==
X-Received: by 2002:a05:6402:234b:b0:5e5:b7d2:d425 with SMTP id 4fb4d7f45d1cf-5e89f649a64mr6121793a12.8.1742071311914;
        Sat, 15 Mar 2025 13:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY3weskrZYAQRCVvrsHUwcR79JrjnTxZfDfISbvxNwPSkNAkcwchMx6ZpSkZpbAdg0W7uk4w==
X-Received: by 2002:a05:6402:234b:b0:5e5:b7d2:d425 with SMTP id 4fb4d7f45d1cf-5e89f649a64mr6121775a12.8.1742071311521;
        Sat, 15 Mar 2025 13:41:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e5ebsm3592751a12.2.2025.03.15.13.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 13:41:50 -0700 (PDT)
Message-ID: <4115af83-3574-421d-93a9-650ece7523dd@redhat.com>
Date: Sat, 15 Mar 2025 21:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: i2c: ov02c10: Support full range of power
 rails
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-2-bryan.odonoghue@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250315134009.157132-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Mar-25 2:40 PM, Bryan O'Donoghue wrote:
> Use regulator_bulk_* to get the array of potential power rails for the
> ov02c10.
> 
> The original IPU6 sensor from Intel only has code for avdd but on other
> systems such as Qualcomm Co-Pilot laptops we need to manage avdd, dvdd and
> dovdd with regulator_bulk_enable/disable.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Ack for this change, is it ok if I squash this into the upcoming v10 ?

Regards,

Hans


> ---
>  drivers/media/i2c/ov02c10.c | 38 ++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 5626aa2fe62c..f6542cdf7472 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -366,6 +366,12 @@ static const struct ov02c10_mode supported_modes[] = {
>  	},
>  };
>  
> +static const char * const ov02c10_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  struct ov02c10 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -380,8 +386,8 @@ struct ov02c10 {
>  	struct v4l2_ctrl *exposure;
>  
>  	struct clk *img_clk;
> -	struct regulator *avdd;
>  	struct gpio_desc *reset;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov02c10_supply_names)];
>  
>  	/* Current mode */
>  	const struct ov02c10_mode *cur_mode;
> @@ -632,6 +638,7 @@ static int ov02c10_get_pm_resources(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int i;
>  
>  	ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov02c10->reset))
> @@ -645,28 +652,26 @@ static int ov02c10_get_pm_resources(struct device *dev)
>  		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
>  				     "failed to get imaging clock\n");
>  
> -	ov02c10->avdd = devm_regulator_get(dev, "avdd");
> -	if (IS_ERR(ov02c10->avdd))
> -		return dev_err_probe(dev, PTR_ERR(ov02c10->avdd),
> -				     "failed to get avdd regulator\n");
> +	for (i = 0; i < ARRAY_SIZE(ov02c10_supply_names); i++)
> +		ov02c10->supplies[i].supply = ov02c10_supply_names[i];
>  
> -	return 0;
> +	return devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02c10_supply_names),
> +				       ov02c10->supplies);
>  }
>  
>  static int ov02c10_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> -	int ret = 0;
>  
>  	gpiod_set_value_cansleep(ov02c10->reset, 1);
>  
> -	if (ov02c10->avdd)
> -		ret = regulator_disable(ov02c10->avdd);
> +	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +			       ov02c10->supplies);
>  
>  	clk_disable_unprepare(ov02c10->img_clk);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int ov02c10_power_on(struct device *dev)
> @@ -681,13 +686,12 @@ static int ov02c10_power_on(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (ov02c10->avdd) {
> -		ret = regulator_enable(ov02c10->avdd);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to enable avdd: %d", ret);
> -			clk_disable_unprepare(ov02c10->img_clk);
> -			return ret;
> -		}
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> +				    ov02c10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators: %d", ret);
> +		clk_disable_unprepare(ov02c10->img_clk);
> +		return ret;
>  	}
>  
>  	gpiod_set_value_cansleep(ov02c10->reset, 0);


