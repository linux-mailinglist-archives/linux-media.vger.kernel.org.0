Return-Path: <linux-media+bounces-32411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E93AB5903
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 17:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F4137188E909
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDAB2BEC31;
	Tue, 13 May 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9wDUak4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4572BE7A0
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151208; cv=none; b=Fi5H/R1cISmQ/WEw7401KMkk9R6vDB41gfGnSXUBrz70zxWWhkBTpHscvV0gug2GvrsDys64QPtt0PiHutZRmR6cRe7ESEyWUc05/Giophk8QvQK2sGNbu6+v79Ee1OGn9WQ7dujDnPMwmbhujqFJzlXhdgp+2pWqPPInA6SIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151208; c=relaxed/simple;
	bh=EXf8CXJA+KGF4MTIP8ZW5RfW4nXpg3xQrdGF82ut11k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t90i53K+xb8uTbaKje86uYoVKrgKsuMcNhnD1GZlBoCDUHog077I3yG2WsxbHgQV5JLSW2+7kT4Yic4fS1UC1k7i4sMrIIV9cmrDjQ8IXsw/Riae+lw2fxkTsShdvdNzXqHg0Dz5xp/AR0ZwPTVILaXz6pOlCOhiYQTThIpUxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9wDUak4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so65298705e9.3
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151204; x=1747756004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGm1s4FjOQu15fzsHG9ZhyojliSZSAlqCmPExLub3gA=;
        b=m9wDUak4gfy/NH5K8y3ZnxV6yn3uZMQOHRAsCriQVm82SypIDT1eYx5AeQVL0SYjZ9
         fGVC7SthUW69CJiQP6gFxdixFz6oWmnm3TgIzvZqJnv8AFzmDIcWtmmC83NqFQDhY1Bl
         xg80qQSNdpixauJAQTBbN2c+A68ZNBlWztSx4GU52jImwDBMO+J1VIDP4Ch59/zMss0K
         A+DwO2D/b2dNUvsqb7Gc5mwz3fGSP0E4kPcjEMK6saJV4wkXDmkSZL8o6fZzmMsKIRuv
         1pIiLeL/74/GBmMqnWE83bjdqny8gBOHfyrkMLFG+qCg3hpUP84eF6CmwWT+mu9xM4Gh
         NO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151204; x=1747756004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGm1s4FjOQu15fzsHG9ZhyojliSZSAlqCmPExLub3gA=;
        b=wVk/wbah+eqfuF1/XO+V4B5FjfDLD9L2DSFjIJlR0t/gkPFnGmNFVUtXn1DEj3aUX0
         64kWKUA77GYafDH2rV93V8B0hgMvVyN2y6eHxGbqmwgEe5tgAX2Qd41pdBqkQVVHsDc6
         gp0JRMC900OxLg/PeJOauaRCT7dY0PegRmoZKUidSoxRi5PAPzuShKlxYjS4MV1ayCR1
         tqYkuDcELWmPXe2Wgi1pFNpAw8IGpzxk/OdwgjoLFgQSmvAea7aPUU1bpZl9guUKqXSI
         Fk5YqVb+64rQjNpXs2linjADdaTFG4D8lgC5IUvrp4Oz/2qFf5OiO22iUSNnw8ag6IOc
         dClA==
X-Gm-Message-State: AOJu0YzNSIH6Jsnqoc443kU2FC+wr/jQfQQ8YvCPIY39cpBnbUuA2Vfd
	HvpKYQT9MQ49aeRg9n4stMBEqwzMVM3d8i8jr/ocXY0cnjsQZqJXpY/tkrwEU8o=
X-Gm-Gg: ASbGncuefW287uvmu3trtrSchdUqPkCT5LsfryPMHoduP4wb4G91AVDjVspCnSZxhg7
	PMdkcdFg4lcAOh/cdbdNQO1/aEKNtpZqYOc1wFxKDBw3a6M1SFeEYTzwvQeGvywGyn3yE1nJ+D2
	zcDQ18auK/Tz+4XoE0WberBmjiAmlwrgcFWxHQBNdvqcUNWvPqoNid3uu8r2JfSnyG7v45H/VbB
	LbUnu0LqfkoEdq+lTQR9QisgprOEeQ46wbMXHItWUooJM7DMGKj8d/3wauL+ONSC5PfQiUhZWPW
	KwZWl5YIH/IlSA+sOxLnTd9Nq0IWCWoyBrx1O14pjK7ufSmfejhBK+hjgvse2ix8LmsLncpuY7p
	xg+e7xSoydksQ
X-Google-Smtp-Source: AGHT+IHp/EyEZ33e67Om03bIuE88oWOcEc2nr1b1QY7mJTKv5Gt8XxFki5LkpJlMAoKHk8KDU1xxxA==
X-Received: by 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-442d6ddec16mr149637965e9.29.1747151203876;
        Tue, 13 May 2025 08:46:43 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dc1sm211862865e9.34.2025.05.13.08.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:46:43 -0700 (PDT)
Message-ID: <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
Date: Tue, 13 May 2025 16:46:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> For sake of simplicity it makes sense to register async notifier
> for all type of subdevices, both CAMSS components and sensors.
> 
> The case of sensors not connected to CAMSS is extraordinary and
> degenerate, it does not deserve any specific optimization.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 976b70cc6d6a..4e91e4b6ef52 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct camss *camss;
> -	int num_subdevs;
>   	int ret;
>   
>   	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
> @@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> -	num_subdevs = camss_of_parse_ports(camss);
> -	if (num_subdevs < 0) {
> -		ret = num_subdevs;
> +	ret = camss_of_parse_ports(camss);
> +	if (ret < 0)
>   		goto err_v4l2_device_unregister;
> -	}
>   
>   	ret = camss_register_entities(camss);
>   	if (ret < 0)
> @@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_register_subdevs;
>   	}
>   
> -	if (num_subdevs) {
> -		camss->notifier.ops = &camss_subdev_notifier_ops;
> -
> -		ret = v4l2_async_nf_register(&camss->notifier);
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to register async subdev nodes: %d\n",
> -				ret);
> -			goto err_media_device_unregister;
> -		}
> -	} else {
> -		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
> -		if (ret < 0) {
> -			dev_err(dev, "Failed to register subdev nodes: %d\n",
> -				ret);
> -			goto err_media_device_unregister;
> -		}
> +	camss->notifier.ops = &camss_subdev_notifier_ops;
> +	ret = v4l2_async_nf_register(&camss->notifier);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to register async subdev nodes: %d\n", ret);
> +		goto err_media_device_unregister;
>   	}
>   
>   	return 0;

If I've understood the intent here, don't think this is right.

For cases where we want to run CSID TPG or standalone TPG we would not 
necessarily have a sensor connected.

---
bod

