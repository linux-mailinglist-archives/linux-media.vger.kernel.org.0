Return-Path: <linux-media+bounces-3328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC5826F9B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 14:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DCF8B222DE
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 13:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112BF45968;
	Mon,  8 Jan 2024 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gtd7+FUM"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518A45031;
	Mon,  8 Jan 2024 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704720028;
	bh=QYd9GIPj6yyAuJwISI2LWTxi+abe2yiVsoONvxWbh24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gtd7+FUMSxNPU4IZDo2Fttv7mljlMYc8huzmLgpplc1nZi4LYvZAhjsdkzz+asZY6
	 nU6cWUXJJqQp9hgFNoiddXv2Yx7TPsIZwZma3qXuz3szibNA8DxvsHtcbWFYcHQt4l
	 OyufnWT8UyERf7bKIZknTRwcmALuIWy23fJFvCNTwtocDKJS7VXo89sERBDVx33Isp
	 PaC2pe+QUpdORZQdVWVKVUJGhMm+mfrP66PfVWu7FRN0g2yK54E/f2sCB96fG7MKdE
	 E4y38HJX0F3Vi6EtqPzjP6zPdB9BKTge9Y+nNjsSoigm6M/RRtYlJc1LbGkcFYVxBk
	 dSXhpB3BtEIpQ==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 089943782047;
	Mon,  8 Jan 2024 13:20:27 +0000 (UTC)
Message-ID: <3da48ce6-52fb-482d-ad23-e59adeb51c32@collabora.com>
Date: Mon, 8 Jan 2024 14:20:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: i2c: add MAX96714 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: kernel@collabora.com
References: <20231208143359.469049-1-julien.massot@collabora.com>
 <20231208143359.469049-4-julien.massot@collabora.com>
 <d2e4e887-5b82-40de-aef9-f5f6a228fbd3@kernel.org>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <d2e4e887-5b82-40de-aef9-f5f6a228fbd3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/8/23 18:18, Krzysztof Kozlowski wrote:
> On 08/12/2023 15:33, Julien Massot wrote:
>> This driver handle the MAX96714 deserializer in tunnel mode.
>> The CSI output will replicate all the CSI traffic capture by
>> the remote serializer.
>>
>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> 
> ...
> 
>> +static int max96714_get_hw_resources(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	priv->regmap = devm_regmap_init_i2c(priv->client,
>> +					    &max96714_regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return PTR_ERR(priv->regmap);
>> +
>> +	priv->gpiod_pwdn = devm_gpiod_get_optional(&priv->client->dev, "enable",
>> +						   GPIOD_OUT_HIGH);
>> +	if (IS_ERR(priv->gpiod_pwdn))
>> +		return dev_err_probe(dev, PTR_ERR(priv->gpiod_pwdn),
> 
> A powerdown GPIO is not an enable GPIO. Please use correct name - see
> gpio-consumers-common.yaml
Ok I will rename it 'pwdn' instead.
Thanks,

-- 
Julien Massot

