Return-Path: <linux-media+bounces-35518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FFEAE2802
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 10:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734FF17C625
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 08:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B750A1E25F2;
	Sat, 21 Jun 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usDfD9E2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7691D90C8;
	Sat, 21 Jun 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494456; cv=none; b=WcFNCzw9Txp0xsWUKZRuYEOHu+HsHnUqwKwAGU4y8d4dOR8cXLaTFBCwfnEwKoAp/RvwejwpIufvzvnrxo2SicmXWY1ol/lliiFXy5HNfyV9ovVYRf0Z5+jwvm9io8aBYwr88eSz/5cM6nQpFhwCGWoO/lYamTC42iV3aLNAg3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494456; c=relaxed/simple;
	bh=/5Hpg8KrlY0TtZYD1tpvh5iwJBB1TL1dxEhLbAG56c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9InRJWBRH8Dio6WX69FtC1iB+1DFtWFXLc+4UHlUhEvN4WBnFvwHDHqfVUG5H4kYBkq78tRayTWQtTScpov4jxA6VS8CvluJWEwzqcY3yzt7TIJdMb/XG2lWDua9o5nNPouNH2dQjtOsjRhjcSkCgWqZoeDFIas/gb42uhcPTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usDfD9E2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2FEC4CEE7;
	Sat, 21 Jun 2025 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750494455;
	bh=/5Hpg8KrlY0TtZYD1tpvh5iwJBB1TL1dxEhLbAG56c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=usDfD9E2xVNS/Meq1PMjJm2qPUwWu8ckqBOKU72acrvskCMZox+CM3x9M8cpL5WhF
	 oWbRoZgLyVBOvEirbfqDFpQmLAww16ag/JbXan2qFLulRkgInqJ3XkSV01z8Y6vl5Q
	 h0wE4YQw2fmZJ9CV/83052JnRHmli2uWD6DgSxZlcoeVqPuMJdx0gGWOI0CclttHBj
	 Ln5KoEDkiRWSKTTLnJJZ0V4AOWO0/u84p9tSzyvtr03Gyqvn8gm58dfGAFbvbPZofA
	 BclNWkXkOcWSzFeokKrp/khMVZ/Qjy54gmHRJPVVeZ2pR1oEjk6Rxb2ClmXOTzAKRc
	 ZthnAyPxq7sWQ==
Message-ID: <e18649fb-a6f1-4fe8-8973-3348435f02ad@kernel.org>
Date: Sat, 21 Jun 2025 10:27:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 41/55] media: i2c: ov8865: Use the v4l2 helper for
 obtaining the clock
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, sakari.ailus@linux.intel.com,
 akinobu.mita@gmail.com, stanislaw.gruszka@linux.intel.com,
 hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
 andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
 dave.stevenson@raspberrypi.com, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, jonas@kwiboo.se,
 kieran.bingham@ideasonboard.com, khalasa@piap.pl,
 prabhakar.csengg@gmail.com, mani@kernel.org, m.felsch@pengutronix.de,
 martink@posteo.de, mattwmajewski@gmail.com, matthias.fend@emfend.at,
 mchehab@kernel.org, michael.riesch@collabora.com, naush@raspberrypi.com,
 nicholas@rothemail.net, nicolas.dufresne@collabora.com,
 paul.elder@ideasonboard.com, dan.scally@ideasonboard.com, pavel@kernel.org,
 petrcvekcz@gmail.com, rashanmu@gmail.com, ribalda@chromium.org,
 rmfrfs@gmail.com, zhengsq@rock-chips.com, slongerbeam@gmail.com,
 sylvain.petinot@foss.st.com, s.nawrocki@samsung.com,
 tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <273d77cc78cbe9fd144f96e68407f0f7b41d3895.1750352394.git.mehdi.djait@linux.intel.com>
 <20250619215744.GS22102@pendragon.ideasonboard.com>
 <20250619215951.GA32257@pendragon.ideasonboard.com>
 <aFZmPOqYz0Rgv5H0@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aFZmPOqYz0Rgv5H0@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Jun-25 9:58 AM, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Jun 20, 2025 at 12:59:51AM +0300, Laurent Pinchart wrote:
>> On Fri, Jun 20, 2025 at 12:57:46AM +0300, Laurent Pinchart wrote:
>>> Hi Mehdi,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Jun 19, 2025 at 07:59:34PM +0200, Mehdi Djait wrote:
>>>> devm_clk_get() fails on ACPI-based platforms, where firmware does not
>>>> provide a direct reference to the clock producer.
>>>>
>>>> Replace devm_clk_get() with the new v4l2 helper
>>>> devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
>>>> platforms to retrieve a reference to the clock producer from firmware.
>>>>
>>>> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>>>
>>>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>>>> index 95ffe7536aa6..5cc278c3e169 100644
>>>> --- a/drivers/media/i2c/ov8865.c
>>>> +++ b/drivers/media/i2c/ov8865.c
>>>> @@ -2956,7 +2956,6 @@ static int ov8865_probe(struct i2c_client *client)
>>>>  	struct ov8865_sensor *sensor;
>>>>  	struct v4l2_subdev *subdev;
>>>>  	struct media_pad *pad;
>>>> -	unsigned int rate = 0;
>>>>  	unsigned int i;
>>>>  	int ret;
>>>>  
>>>> @@ -3019,39 +3018,14 @@ static int ov8865_probe(struct i2c_client *client)
>>>>  
>>>>  	/* External Clock */
>>>>  
>>>> -	sensor->extclk = devm_clk_get(dev, NULL);
>>>> -	if (PTR_ERR(sensor->extclk) == -ENOENT) {
>>>> -		dev_info(dev, "no external clock found, continuing...\n");
>>>> -		sensor->extclk = NULL;
>>>> -	} else if (IS_ERR(sensor->extclk)) {
>>>> +	sensor->extclk = devm_v4l2_sensor_clk_get(dev, NULL);
>>>> +	if (IS_ERR(sensor->extclk)) {
>>>>  		dev_err(dev, "failed to get external clock\n");
>>>>  		ret = PTR_ERR(sensor->extclk);
>>
>> Actually, I'd take this as an opportunity to write
>>
>>  		ret = dev_err_probe(dev, PTR_ERR(sensor->extclk),
>> 				    "failed to get external clock\n");
> 
> Wouldn't printing this kind of a message fit for devm_v4l2_sensor_clk_get()
> and consequently be removed from drivers?

+1 to that suggestion having the helper always log an error on errors
and then being able to just directly return an error without needing
to log would be great.

Note the helper really should use dev_err_probe() for these errors,
so that if devm_clk_get() ever starts returning -EPROBE_DEFER that
will be handled properly.

Otherwise this looks good to me. Mehdi thank you for your work on this!

Regards,

Hans



