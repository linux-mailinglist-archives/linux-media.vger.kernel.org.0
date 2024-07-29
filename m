Return-Path: <linux-media+bounces-15425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D393F01D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD3A1F22B79
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1D513CA95;
	Mon, 29 Jul 2024 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DjhHNEkJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33482328B6;
	Mon, 29 Jul 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722242910; cv=none; b=MY4wAzXQlZ02ACJIkuE7H0POesjLr12uDoY+HC2/S+Kve1mMaLt/PQWneMwl83csf3HbeQ+I0zjiIBN52gL8r5J4wcGeovjFR48+t+EQ6yFzZ3gKiBJIOWVu3f38VYg3TV8iXY1UbwibS0CQMD8VFUc5QzAEyRG31L0m9KrdJH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722242910; c=relaxed/simple;
	bh=MlEFOPmaJKPHejSEj4rZBeQgNBABJESsADXLRYP/rV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSt6i5e39atcEqSntSCLsCxpAXFsLcllho5CkRbaUpL0J7u0GAWX7WGJuNJVuoVn57TTBkyeX58X0UmShEDXt8w6QuVhhdcPX8phaK4M4xq63xUPkZQTTL9EGNuLyquVulkE9FIAf4oxdIPxHLj0e4Gp6fEebDHco51RN7QXHKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DjhHNEkJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66457596;
	Mon, 29 Jul 2024 10:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722242859;
	bh=MlEFOPmaJKPHejSEj4rZBeQgNBABJESsADXLRYP/rV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DjhHNEkJb/6nkjo8qdca/iB3zkzF2Zh5rRbKUQ+atoCkLShBE+Otbo+wbiJ3x4xrM
	 qV0aOxPAFk6DyzUnuMmIfKkQEmSF8Y3N3wI4/JeHOHsulDN0UrWcfMm9mApWXfWV9K
	 IGB+RSO7QAtKL1+gSyYIo7A9mt5jsizh0veLgxoo=
Message-ID: <f521ed1b-17ce-4ccb-b14e-53fe5fbfee64@ideasonboard.com>
Date: Mon, 29 Jul 2024 14:18:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com>
 <4me3tw572feft3x4dn3ritpr6avss6ebupixrg7qrlsy5z6kny@mqeoqhr7uh2x>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <4me3tw572feft3x4dn3ritpr6avss6ebupixrg7qrlsy5z6kny@mqeoqhr7uh2x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 29/07/24 1:42 pm, Jacopo Mondi wrote:
> Hi Umang
>
> On Mon, Jul 29, 2024 at 11:35:35AM GMT, Umang Jain wrote:
>> The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.
> How is this related to this change ? The value to which the GPIO is
> initialized to in probe is the physical level.
>
> What matters is the gpio line active level, which should be described
> in the sensor's datasheet. What's the active level of the reset gpio
> line ?

The XCLR active level is "Low" at the init time. It is set to "high" 
during power-on / normal operation

>
>> However, the reset-gpio logical value is set to 1 in during power-on
>> and to 0 on power-off. This is incorrect as the reset line
>> cannot be high during power-on and low during power-off.
> If the line is physically high or low only depends on how the active
> level is specified in DTS, not by the logical value provided to
> gpiod_set_value[_cansleep]()

True.

AS far as I can see, the DT binding schema specifies 'reset-gpios:' - 
without the active level

The active level is I suppose, intentionally left to the DT implementation ?

>> Rectify the logical value of reset-gpio so that it is set to
>> 0 during power-on and to 1 during power-off.
> This is correct, the reset line should be set to logical 0 (inactive)
> during power on and to logical 1 (active) when powering off. However
> the GPIO active state should have been specified in bindings and as
> this driver has been mainline quite some time, this change will break
> .dtbo already used succesfully with previous kernel releases.
>
> Is this an issue ?

Yes, if the patch is accepted, the Device-tree implementation for IMX335 
will need to be adjusted accordingly. This can be an issue definitely - 
but on the other hand, this attempts to rectify a mistake, no?

>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/media/i2c/imx335.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
>> index cd150606a8a9..878d88b5f476 100644
>> --- a/drivers/media/i2c/imx335.c
>> +++ b/drivers/media/i2c/imx335.c
>> @@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
>>   	usleep_range(500, 550); /* Tlow */
>>
>>   	/* Set XCLR */
>> -	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
>> +	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
>>
>>   	ret = clk_prepare_enable(imx335->inclk);
>>   	if (ret) {
>> @@ -1184,7 +1184,7 @@ static int imx335_power_on(struct device *dev)
>>   	return 0;
>>
>>   error_reset:
>> -	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
>> +	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
>>   	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
>>
>>   	return ret;
>> @@ -1201,7 +1201,7 @@ static int imx335_power_off(struct device *dev)
>>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>   	struct imx335 *imx335 = to_imx335(sd);
>>
>> -	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
>> +	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
>>   	clk_disable_unprepare(imx335->inclk);
>>   	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
>>
>> --
>> 2.45.0
>>
>>


