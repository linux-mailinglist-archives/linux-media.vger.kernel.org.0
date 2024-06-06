Return-Path: <linux-media+bounces-12659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E668FE7E9
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 498CF2839B2
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DC4195FE7;
	Thu,  6 Jun 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KPMoVINz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA766194A7B;
	Thu,  6 Jun 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717680867; cv=none; b=pMUGWvlFiduAS+NNOG/A0SNMvx5Vyh/TCkxj22SVk0jzhlqnhVFa9tYUNPwnVB7XY6u3rXRD7/Y+wJIp1zqnGtx3R2JfzFY4lpFxUb1PwA7CpiSPvS88VMc8Yxv/1oNToNM7FGcU5oGFzn+n3UF85NDVHDFLZJ0xlA30QkBlfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717680867; c=relaxed/simple;
	bh=dQ6yhjfZfplamzfb30U5qvWrBbL+8+7pqVQuhytkwuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyCBXGX5BQ2OlHLeb+AYWbY/hEU+A48rPPs9kbG/aOYjHSuTaDMHNTC+5kdfGSg72KMZooMJjd2h6HqIZL/plHkt1hZXsX3m30c3Se10TdQTiLZmmZz2f3Dv8CeykJZHT8hCx05vl5yFqBqiVFNhOc16LkDz1r6QxkUkkZQAz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KPMoVINz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39A55720;
	Thu,  6 Jun 2024 15:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717680853;
	bh=dQ6yhjfZfplamzfb30U5qvWrBbL+8+7pqVQuhytkwuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KPMoVINzAPoS5J0dcDdD1uWm6AxjD5xyfR7XACFTURyOa6nvFnqRHAErSJfXQUEyY
	 yOfYmIS5BUc2VD14RRTpjNQXrStSqqGnIaKZv9bV+IUgk7DoGafLjfLvQewBBa/P41
	 KPYGz+7DHXkibjuWpi9zDZLEGK7fWXRF4oVhM/3U=
Message-ID: <8d67c3b3-a3a6-4733-ac0d-ddd2c244d790@ideasonboard.com>
Date: Thu, 6 Jun 2024 16:34:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add support for MAX96714/F and MAX96717/F GMSL2
 ser/des
To: Julien Massot <julien.massot@collabora.com>, sakari.ailus@iki.fi,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
 conor+dt@kernel.org
References: <20240430131931.166012-1-julien.massot@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240430131931.166012-1-julien.massot@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/04/2024 16:19, Julien Massot wrote:
> Change since v6:
>    - Remove mention of C-PHY for MAX96717, this serializer is D-PHY only
>    - Remove bus-type requirement for MAX96717
>    - Minor changes requested by Sakari
>    - Workaround a MAX96717 issue, which occurs when stopping
>      the CSI source before stopping the MAX96717 CSI receiver.
> 
> Power management is not included in this patchset. The GMSL link is
> not always resuming when the deserializer is suspended without
> suspending the serializer.
> 
> Change since v5:
>   - Reverse fallback logic: max9671{4,7} can fallback to max9671{4,7}F
>   - use const instead of enum for max9671{4,7}f compatible as suggested
> 
> Change since v4:
>   - Add support for MAX96717 and MAX96714 and use them as a fallback for
>     MAX96717F and MAX96714F respectively
>   - The drivers are now compatible with MAX96717 and MAX96714 since no change in
>     the logic is needed
>   - Reference 'i2c-gate' instead of 'i2c-controller' in the bindings
> 
> Change since v3:
> - bindings
>    - Renamed bindings to drop the 'f' suffix
>    - Add bus type to MAX96717 and remove from MAX9674
>    - Add lane-polarities to both bindings
> 
> - drivers
>    - Address changes requested by Sakari in v3
>    - use v4l2_subdev_s_stream_helper for MAX96714
>    - do not init regmap twice in the MAX96714 driver
>    - Fix compilations on 32 bits platforms
> 
> Change since v2:
> - Convert drivers to use CCI helpers
> - Use generic node name
> - Use 'powerdown' as gpio name instead of 'enable'
> - Add pattern generator support for MAX96714
> 
> These patches add support for Maxim MAX96714F deserializer and
> MAX96717F serializer.
> 
> MAX96714F has one GMSL2 input port and one CSI2 4 lanes output port,
> MAX96717F has one CSI2 input port and one GMSL2 output port.
> 
> The drivers support the tunnel mode where all the
> CSI2 traffic coming from an imager is replicated through the deserializer
> output port.
> 
> Both MAX96714F and MAX96717F are limited to a 3Gbps forward link rate
> leaving a maximum of 2.6Gbps for the video payload.

(I see this mail turned out to be a collection of thoughts rather than 
clear questions... Bear with me =))

I know I'm very late to this party, and perhaps these topics have 
already been discussed, but as I will most likely be doing some GMSL 
work in the future I wanted to ask these questions. My main 
questions/concerns are related to the i2c and the representation of the 
links in the DT.

First, I know these particular devices are one input, one output 
serializer and deserializer, so there's not much to do wrt. i2c 
translation/gating. But even here I wonder how does one support a case 
where a single local i2c bus would have two deserializer devices (with 
different i2c addresses), connected to two identical camera modules?

Controlling the deserializers would work fine, but as the serializers 
and the remote peripherals (sensor) would answer to identical i2c 
addresses, it would conflict and not work.

If I understand the HW docs right, a way (maybe there are others?) to 
handle this would be:
- deser probes, but keeps the link disabled by default
- deser reads the initial serializer i2c address from the DT, but also a 
new address which we want the serializer to have (which doesn't conflict 
with the other serializer)
- deser enables the link and immediately (how to be sure the other deser 
driver doesn't do this at the same time?) sends a write to the 
serializer's DEV_ADDR, changing the serializer's i2c address.
- deser can now add the serializer linux i2c device, so that the 
serializer can probe
- the serializer should prevent any remote i2c transactions until it has 
written the SRC_A/B and DST_A/B registers, to get translation for the 
remote peripherals (or maybe the deser driver should do this part too).

Am I on the right track with the above?

Now, maybe having such a HW config, two deserializers on a single i2c 
bus, doesn't happen in real life, but this issue comes up with 
multi-port deserializers. And while those deserializers are different 
devices than what's added in this series, the serializers used may be 
the same as here. This means the serializer drivers and DT bindings 
should be such that multi-port deserializers can be supported.

As I said, I'm late (and new) to this party, and struggling to consume 
and understand all the related specs and drivers, so I hope you can give 
some insight into how all this might be implemented in the future =).

Have you looked at the FPD-Link drivers (ds90ub9xx)? The i2c management 
is a bit different with those (with my current understanding, a bit 
saner...), but I wonder if similar style would help here, or if the 
i2c-atr could be utilized. It would be nice (but I guess not really 
mandatory in any way) to have similar style in DT bindings for all 
ser-des solutions.

To summarize the i2c management on both FPD-Link and GMSL (if I have 
understood it right):

In FPD-Link the deserializer does it all: it has registers for the 
serializer i2c aliases, and for i2c address translation (per port). So 
when the deser probes, it can program suitable i2c addresses (based on 
data from DT), which will be the addresses visible on the main i2c bus, 
and thus there are never any conflicts.

In addition to that, the drivers utilize i2c-atr, which means that new 
linux i2c busses are created for each serializer. E.g. the deser might 
be, say, on i2c bus 4, and also the serializers, via their i2c aliases, 
would be accessible bus 4. When the serializer drivers probe they will 
create new i2c busses with i2c-atr. So with a 4 port deserializer we 
might get i2c busses 5, 6, 7 and 8. The linux i2c devices for remote 
peripherals (sensors mainly) would be created on these busses with their 
real i2c addresses. When a sensor driver does an i2c write to its 
device, the i2c-atr will catch the write, change the address according 
to the translation table, and do an actual write on the i2c bus 4. This 
would result in the deser HW to catch this write, switch the address 
back to the "real" one, and send it to the appropriate serializer, which 
would then send the i2c transaction on its i2c bus.

In GMSL the deser just forwards everything it sees on the i2c bus, if a 
port is enabled. The deser has no other support related to i2c. The 
serializers have DEV_ADDR register which can be used to change the 
address the serializers respond to, and the serializers also have i2c 
translation for two remote peripherals.

But if the i2c translation is used, it would mean that, say, the sensor 
driver would need to use the "virtual" address, not the real one to 
communicate with the sensor device, which doesn't sound right...

You have used i2c-gate for both the deser and the ser. I don't have 
experience with i2c-gate, but how can we manage the serializer i2c 
address and the i2c address translation with it?

One difference with the FPD-Link and this series' DT bindings is that I 
have a "links" node in the deser, instead of just adding the serializers 
under an i2c node. In FPD-Link case this allowed me to better represent 
the hardware and the configuration needed.

So... Perhaps my bottom line question is: do we need something similar 
to what the FPD-Link uses (links, i2c-atr) to fully support GMSL 
devices? And also, if we merge the DT bindings in this series, will we 
have gone into a corner wrt. how we can manage the i2c?

  Tomi


