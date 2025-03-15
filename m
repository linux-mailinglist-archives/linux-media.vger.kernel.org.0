Return-Path: <linux-media+bounces-28313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C849A632AA
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 23:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70B69171674
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15BA1A23AD;
	Sat, 15 Mar 2025 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwlIkrsK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A11898F8
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742076752; cv=none; b=mZn7xCcbAyON4TVx5mPvdA848FB/6hDKXv5SY9jZnWMaB03rs/7u8b52VhkGpbF9JNpjcdkU6iKcrGHgmrm9jQnYeZO/sU/1DtO7Ec794Z/yLbzIiM47jQmhuxICiij672aZBburgquWe7U44+pez0i0BvhT308B7m7T+5E+4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742076752; c=relaxed/simple;
	bh=AbfRiX8RVFqOFoCsayUQ+4gsMBCVg9Bx2V97pbmn/ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkhnrWFnC6ExAX5BrEIaD50Jt5K7V/dtxMRd+SJeyU8my5uOayQkR8HGk96u1BeG33GpDlNXrMqvuQChTDuTL9Qz7ORd6UjolWN5okjEeAo4TXehPuB+rqoCnSiH7WK3FrgceuxPP/M0QScz3fS5nnHSsPqs7+JKQfZbYCUVrOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwlIkrsK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so6395130a12.1
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742076749; x=1742681549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K69xiOHM/qRbliIaVR/ArftjJvpA28tCNB3S+53wIxM=;
        b=jwlIkrsKo8XAZx1DnSt2BxY9AF5B7GpzElBTBlHAU2mUAbtRt5p1f/BwDDOU6SFZ/d
         jOyt7khq/mmnYY+H6yuFp4hL7dYIid4k54Q+CRjbCEF/NyDoRftRL8eUJumvyouMuo8j
         GPhtvQLGNi9cPr6XMaSokxFAc1fDV1/NMmtbrwN01VtrS3eKPyO95T60Kf1yXKjnvnQE
         uCuFP0lqQ/qAYqIABLS3ykrXpiLyN+e72d1ADC/rndmWJXb7aUM/D/ZA7AjX4bR74hdt
         kOExUGicXxwlgA0S0jzWIgJBykaCBO8YkzA1ao5IXgg4Xfex+TNx26Xns1fx3cRnfitq
         eF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742076749; x=1742681549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K69xiOHM/qRbliIaVR/ArftjJvpA28tCNB3S+53wIxM=;
        b=HbPFd02bDSCW36YfdjKaHywhy5xMOrRIfIvZd3tOUN+HQxuyzSPePWb3jWnbD90Iab
         uesfIrnB/clG/EOsxHa85WQHraZ+/pO8wmOgdd07zcvkIW9cNvx0y/cZIGO/OfHqVnm5
         Fbbb+8Q0fDdjQlvZAC6xjltbNhvFHpgfDxT90jg+h3rpBlorFvFu9BbuyzHblRUwk9P5
         u1RK1XJIbEUkmkLfOKPKz1fdLgB8YaRJ4IN2WKDXyYjHx5M82bBiqJL+PacNlqJPsm1m
         mr5DKkH3rXoLciTlQVWjvxCW3riP+w65Dk6mpgXrui3z7XHJuTtxzApg+OyFEDJBJ1WZ
         VxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhBHyNct+mZFXlH0Fg7f4aIAVAYT8hQDCfjkx3Edqe9CrAeBDb7AEqJ0bWbO1f7wjt2+kslWiIgxqWMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ64tfP3JusWwSvCfOHZef9UKboJqU+TWcleiZklh9ZEOhhTUa
	2LajX1eKN52b55r+dBjRu5c9CVdjFcT+hhBo4BNBTYCF8Yin30zS0H/2h5OyO3A=
X-Gm-Gg: ASbGncvN9bbHgbUMdFgy0wa/xnudqbpQ6NL8Wo/Xs20Q/QfvDC1m/4wPVgWKI4rZaLo
	tlQfxtmMcF5ZVedoMrYOuMirC/Lj6swx+4ypn/EM98gIc4WE3B/aSIcu4MwtqENF88hON/hcHBG
	u++HblFOMH2cSI6MnofbjnBp0mV5f097sBTZ/XHGqdzwfy/oiqAY3rPyRY9IH48BAA1ziqEj0rs
	6cMCj7hXBVMSHh9dKOaKasAO/Xv4wGmhI708CnoSryVBVE0wRPlq2ylnzSynniS+h0/mHtQ5CJR
	SsRr3XPzvqxA8NIOrAf/jhyBsJfqUE1cymTYID1UCRdbN32c9/KnWQa7Ap9qPzRC12LTnLdAgkC
	ZqCXjjsc5xBaWI9Oc1KOfxhzqEwEjQu05IkRDt9lwUBZVcP7VDEt/GEC9zvznbE+YoR1pW3WPV4
	Nw8OmQT5R53ea7bZkg5Pc51xFeS7Uo4I8=
X-Google-Smtp-Source: AGHT+IEde7yq84g7bnvL47e6hKytzy5E2GINPp61Ok55OVA9encNCswENHjve3U58EAInuUoAXyWwQ==
X-Received: by 2002:a05:6402:350f:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5e8aebe639cmr7930513a12.0.1742076748613;
        Sat, 15 Mar 2025 15:12:28 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e67bsm3687624a12.15.2025.03.15.15.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 15:12:28 -0700 (PDT)
Message-ID: <5e3b287f-26a4-4e99-a1dc-67d91b9b6e72@linaro.org>
Date: Sat, 15 Mar 2025 22:12:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Get the OF clock rate
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315220936.2477-1-bryan.odonoghue@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250315220936.2477-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2025 22:09, Bryan O'Donoghue wrote:
> Add support to get the mclk rate specified in dts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/i2c/ov02c10.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 094651228763..236623b26da0 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -647,11 +647,6 @@ static int ov02c10_get_pm_resources(struct device *dev)
>   	if (ov02c10->reset)
>   		fsleep(1000);
>   
> -	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
> -	if (IS_ERR(ov02c10->img_clk))
> -		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
> -				     "failed to get imaging clock\n");
> -
>   	for (i = 0; i < ARRAY_SIZE(ov02c10_supply_names); i++)
>   		ov02c10->supplies[i].supply = ov02c10_supply_names[i];
>   
> @@ -840,11 +835,22 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
>   		return dev_err_probe(dev, -EPROBE_DEFER,
>   				     "waiting for fwnode graph endpoint\n");
>   
> -	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> -	if (ret) {
> +	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(ov02c10->img_clk)) {
>   		fwnode_handle_put(ep);
> -		return dev_err_probe(dev, ret,
> -				     "reading clock-frequency property\n");
> +		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
> +				     "failed to get imaging clock\n");
> +	}
> +
> +	if (ov02c10->img_clk) {
> +		mclk = clk_get_rate(ov02c10->img_clk);
> +	} else {
> +		ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> +		if (ret) {
> +			fwnode_handle_put(ep);
> +			return dev_err_probe(dev, ret,
> +					     "reading clock-frequency property\n");
> +		}
>   	}
>   
>   	if (mclk != OV02C10_MCLK) {

I completely forgot to include this logic.

We need this one get get the clock frequency from dts.

Thanks to kuruczgy[m] on #aarch64-laptops for testing.

---
bod

