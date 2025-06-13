Return-Path: <linux-media+bounces-34721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515AAD8754
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87112189C70E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8856279DCC;
	Fri, 13 Jun 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkWxwgKX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A6279DCD
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805906; cv=none; b=UHwh8J5SOIUNOW8gDq1ePQ4bgQa+4z4Un4D4vkzSYx+WQrWN5/x/94wlkYOP4iNBPm9hsrP9T6kRr6f2rTVcI7ONq5lPJFpdAz/K5/XlbVVlu/e6NFa1UTZHuLw0WOb6B2IbRkvTN5YqpsYuU9FFhgPbwyxskOrj+mG2jqk1lHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805906; c=relaxed/simple;
	bh=TV1FztWZiEx8Nmx82z1NsBxnQPMDh5iMV+BMlvNojEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPY+IpIhHcBBmHp5Pyn1FJXQBYTnP86Jro+wex95LoZ3Uf/3V+bfhBTnnqZ4B8FaVWs7AGbEEW6jB9IobNQrbRd3LaO1YZvoA4HP/PaxHQ2nEIE8CJaJo5nYB0oQwEHiaNBhyodp3+paW0Ljq6sNMG88vGGQN3VnsZgLMqxrs6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkWxwgKX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so22141695e9.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805903; x=1750410703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O6NptWpipTQWlr/fPbc6lvca1xldNu8/PQfnl8OHYY=;
        b=HkWxwgKXufj3F6VkmSKYrAaxl2Ssr/uf1WvZcabxXMWkrDh++T+ObZtVRACUJVba4b
         FYzw0Ki0tcITAgFCCRuLUurklx8oeFLybpDsBuotE1mwLpMy9CtFmV3pKp0JMCaybjF0
         +aXal1qTWLAjNWZK/zmojOF83Y/41piXjnmKStyL12yfnsgDLrR/j159Hv1U/MZBh8oV
         wS5VFZJp00DZyfO61TI2wnmkDdU/YYyOcFZviz3lnYj0d7JRr6yiAgqiA4e1Cv+nJ9xB
         snPQRWFvxO7B255DNJT83vIyb0wrgbJXAbzV2Cr1qg/xK/AVc65iU/NLOvnFzIJF1F/R
         cDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805903; x=1750410703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3O6NptWpipTQWlr/fPbc6lvca1xldNu8/PQfnl8OHYY=;
        b=OlbVd2QZ+X84reJ+lsEILZGQKiCar26Lt0HQGe5XxcdtUHuaEC+HX1+/g6YOCNDtNZ
         7cA6BvBsU1C3167MV/tI5xHAABxEf/gjBko9e70voOIuM32lk0+o2Z54kLdtwbKPGrmw
         uokKayAG7vvlilK6hqF0xGzwpZPUgUZUmisJXKSTQ7JEYr7ZhyfefNjpRYw/dCaL3u3q
         ZD5p4C8f8XNSxe1/OA3Wvhsq0UQF4UfrqQEKwVfy4ip9XMdUxpNqhcnA2JWGyT9Vwz94
         ZEzcdcry6S/hdciDMcpHdOaErJzaqnwjjFib8Q6etBfa4DfjejbTSP+xX5Ll/XJ0IvTu
         wzAw==
X-Gm-Message-State: AOJu0YwX/ETIOCDSaL4nXhEtOD7gip169HhWcFCT5C5c4NmhKZA8uCPz
	2EhvM1xz8cg6LmkxNHz1j47G9aMBwa4JHhKvNN1PZ9uNRJbjNA5Y7PyfOGONZzsOsD0=
X-Gm-Gg: ASbGncsaBo3Id7ei6eciL0k+7E8SFx38P+4IgU27Qdq9WE+XI8MIxl3cRaNXxqwAZ+7
	+1W7iJshrQqopy/QNXAUp47adFfOKy6xVWzGP4PYVl7ZBz1+kQMq+z+uDKojhu79fw0UmLArFiy
	adt3bt2C7N6NtM5NrYvWb00wGX3tgIyxVUkquAclpxavVkHTZ5N8DdhVfT/+AWXIcIXd6EERyiu
	izCBC6zA0YbBGXUop/7Eze2YrHxs+5YpjpsXMXlcW7cbh7HKGKPszM15uWkVG26gyHc5nLPFWGP
	WwMGHDqN5QBnzeT4mEQBTGhnqATdMBQGU4Ew9C5TAfKVde+ATaeq8bi7EjpLi3ulx8P0R7c5EgA
	bG8+rnJiJupDBpykVYZ/5TTpDLXo=
X-Google-Smtp-Source: AGHT+IEzGoAxSrX5B4bAAH+4miTpPGNl7GoNX7sspn9ukMqVx2E+rcl0sYAz9i1eJmygYV9ut9AlDg==
X-Received: by 2002:a05:600c:3f96:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-45334a80815mr27028255e9.10.1749805902651;
        Fri, 13 Jun 2025 02:11:42 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e1838fasm45585435e9.38.2025.06.13.02.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:11:42 -0700 (PDT)
Message-ID: <91792283-8b61-42f8-b16d-e7f468325b42@linaro.org>
Date: Fri, 13 Jun 2025 10:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <zBer3I3HLlZQo2k4k2sL3uFKCBxznED-ZHOnvQLXBVcNUBIy9DndjcOE1TxMSdb8Kkpj9xCmWGPpX9mdLHE-uA==@protonmail.internalid>
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

Degenerate is an odd word to use.
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
I'm a little concerned about changing the current flow. Have you tested 
this out without sensors attached, the TPG on rb5 for example ?

---
bod

