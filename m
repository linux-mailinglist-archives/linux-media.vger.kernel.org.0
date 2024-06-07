Return-Path: <linux-media+bounces-12708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEED8FFE92
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 11:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1B6288DF2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 09:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030EF15B551;
	Fri,  7 Jun 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="x92Cqnkw"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654217C6C;
	Fri,  7 Jun 2024 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717750905; cv=none; b=QWdxdKWnBaY4xYJbLo0Zrijhm6X05VmDb37aMArqiYoak5Y7OR26Vts4HIgJN6+fRIQGXDczr3OxB4odQNf4pFbLM/R3MgktAL/M26j9tqm1fUimW3IHfqFAbmImjaWKdB6/M1Qyc6j1etn14xSETG5BdcZdAbqR7BlUQKmcShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717750905; c=relaxed/simple;
	bh=EjTsCi6jwm2prkoLiQgRPgr43kd0Bd7Ce+YdKLkZ1Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPrchR/UeoE6nbVKBZtTxVThU2qw4QQqcUBysq6d8ogMX8+w5/eordgh0fU+fWNfJdvN2LjMmo/69B3U6Otqj1y9IKgwiXCW3+lJh9wKp5cFE0bP3PEuou9ttQJanRXJqle3lQZlCANzb9IkCPNm58j2tY2Mh7vRxgpNy9mke9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=x92Cqnkw; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717750901;
	bh=EjTsCi6jwm2prkoLiQgRPgr43kd0Bd7Ce+YdKLkZ1Lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=x92Cqnkw3Sp3kGMbmV+uk5ry8Xm3qZURdzYVczJRxEMRfs7SU2QzQsGK200EwyD28
	 3CkDER4n6kNHZVzsWWT7/zRSnQznxr9RiP6uXj0Bip6lbxmCnUyBzNT238vPNvkYMJ
	 fqjlEtRb1fgZ4ZMr6uUVOqzYZpaU3R7uDlphmJ/li81sIWZMN+pWLLc5CcDf24sQOD
	 unzjLtb04YEO6eU/w4QFsoUEOb6NBObvhx/sjxq/7GEYgsKB1Sx2tdUl27NeHjcFYe
	 H/9EaXl34oxfuIVZg8YUXTMORF2DMOGpmeKXnsWH9B/Mmhnsp4s2CdAXoewltvN+H5
	 Dc3htIznPYDqw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C1433781022;
	Fri,  7 Jun 2024 09:01:41 +0000 (UTC)
Message-ID: <8231caaa-463f-4afb-b9af-8aaab48dcc4f@collabora.com>
Date: Fri, 7 Jun 2024 11:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add support for MAX96714/F and MAX96717/F GMSL2
 ser/des
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, sakari.ailus@iki.fi,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
 conor+dt@kernel.org
References: <20240430131931.166012-1-julien.massot@collabora.com>
 <8d67c3b3-a3a6-4733-ac0d-ddd2c244d790@ideasonboard.com>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <8d67c3b3-a3a6-4733-ac0d-ddd2c244d790@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tomi,

On 6/6/24 3:34 PM, Tomi Valkeinen wrote:
> Hi,
> 
> On 30/04/2024 16:19, Julien Massot wrote:
>> Change since v6:
>>    - Remove mention of C-PHY for MAX96717, this serializer is D-PHY only
>>    - Remove bus-type requirement for MAX96717
>>    - Minor changes requested by Sakari
>>    - Workaround a MAX96717 issue, which occurs when stopping
>>      the CSI source before stopping the MAX96717 CSI receiver.
>>
>> Power management is not included in this patchset. The GMSL link is
>> not always resuming when the deserializer is suspended without
>> suspending the serializer.
>>
>> Change since v5:
>>   - Reverse fallback logic: max9671{4,7} can fallback to max9671{4,7}F
>>   - use const instead of enum for max9671{4,7}f compatible as suggested
>>
>> Change since v4:
>>   - Add support for MAX96717 and MAX96714 and use them as a fallback for
>>     MAX96717F and MAX96714F respectively
>>   - The drivers are now compatible with MAX96717 and MAX96714 since no 
>> change in
>>     the logic is needed
>>   - Reference 'i2c-gate' instead of 'i2c-controller' in the bindings
>>
>> Change since v3:
>> - bindings
>>    - Renamed bindings to drop the 'f' suffix
>>    - Add bus type to MAX96717 and remove from MAX9674
>>    - Add lane-polarities to both bindings
>>
>> - drivers
>>    - Address changes requested by Sakari in v3
>>    - use v4l2_subdev_s_stream_helper for MAX96714
>>    - do not init regmap twice in the MAX96714 driver
>>    - Fix compilations on 32 bits platforms
>>
>> Change since v2:
>> - Convert drivers to use CCI helpers
>> - Use generic node name
>> - Use 'powerdown' as gpio name instead of 'enable'
>> - Add pattern generator support for MAX96714
>>
>> These patches add support for Maxim MAX96714F deserializer and
>> MAX96717F serializer.
>>
>> MAX96714F has one GMSL2 input port and one CSI2 4 lanes output port,
>> MAX96717F has one CSI2 input port and one GMSL2 output port.
>>
>> The drivers support the tunnel mode where all the
>> CSI2 traffic coming from an imager is replicated through the deserializer
>> output port.
>>
>> Both MAX96714F and MAX96717F are limited to a 3Gbps forward link rate
>> leaving a maximum of 2.6Gbps for the video payload.
> 
> (I see this mail turned out to be a collection of thoughts rather than 
> clear questions... Bear with me =))
> 
> I know I'm very late to this party, and perhaps these topics have 
> already been discussed, but as I will most likely be doing some GMSL 
> work in the future I wanted to ask these questions. My main 
> questions/concerns are related to the i2c and the representation of the 
> links in the DT.
> 
> First, I know these particular devices are one input, one output 
> serializer and deserializer, so there's not much to do wrt. i2c 
> translation/gating. But even here I wonder how does one support a case 
> where a single local i2c bus would have two deserializer devices (with 
> different i2c addresses), connected to two identical camera modules?
> 
> Controlling the deserializers would work fine, but as the serializers 
> and the remote peripherals (sensor) would answer to identical i2c 
> addresses, it would conflict and not work.
> 
> If I understand the HW docs right, a way (maybe there are others?) to 
> handle this would be:
> - deser probes, but keeps the link disabled by default
> - deser reads the initial serializer i2c address from the DT, but also a 
> new address which we want the serializer to have (which doesn't conflict 
> with the other serializer)
> - deser enables the link and immediately (how to be sure the other deser 
> driver doesn't do this at the same time?) sends a write to the 
> serializer's DEV_ADDR, changing the serializer's i2c address.
> - deser can now add the serializer linux i2c device, so that the 
> serializer can probe
> - the serializer should prevent any remote i2c transactions until it has 
> written the SRC_A/B and DST_A/B registers, to get translation for the 
> remote peripherals (or maybe the deser driver should do this part too).
> 
> Am I on the right track with the above?
Yes this is the recommended way, and at least the only one I know from 
Analog device
https://www.analog.com/media/en/technical-documentation/user-guides/gmsl2-general-user-guide.pdf
6.2.3.1.4.1Camera Setup – Two Serializers to One Deserializer
If we faced a scenario where we need to rewrite the serializers 
addresses, then we will need
a way to synchronize the link startup and probing the serializers one by 
one to rewrite the
I2C address.

> 
> Now, maybe having such a HW config, two deserializers on a single i2c 
> bus, doesn't happen in real life, but this issue comes up with 
> multi-port deserializers. And while those deserializers are different 
> devices than what's added in this series, the serializers used may be 
> the same as here. This means the serializer drivers and DT bindings 
> should be such that multi-port deserializers can be supported.

The serializer is supporting i2c-atr as well so the dt-binding can be
improved to handle this scenario perhaps in an exclusive way.
(not using i2c-gate and i2c-atr at the same time)

> 
> As I said, I'm late (and new) to this party, and struggling to consume 
> and understand all the related specs and drivers, so I hope you can give 
> some insight into how all this might be implemented in the future =).
> 
> Have you looked at the FPD-Link drivers (ds90ub9xx)? The i2c management 
> is a bit different with those (with my current understanding, a bit 
> saner...), but I wonder if similar style would help here, or if the 
> i2c-atr could be utilized. It would be nice (but I guess not really 
> mandatory in any way) to have similar style in DT bindings for all 
> ser-des solutions.
> 
> To summarize the i2c management on both FPD-Link and GMSL (if I have 
> understood it right):
> 
> In FPD-Link the deserializer does it all: it has registers for the 
> serializer i2c aliases, and for i2c address translation (per port). So 
> when the deser probes, it can program suitable i2c addresses (based on 
> data from DT), which will be the addresses visible on the main i2c bus, 
> and thus there are never any conflicts.
> 
> In addition to that, the drivers utilize i2c-atr, which means that new 
> linux i2c busses are created for each serializer. E.g. the deser might 
> be, say, on i2c bus 4, and also the serializers, via their i2c aliases, 
> would be accessible bus 4. When the serializer drivers probe they will 
> create new i2c busses with i2c-atr. So with a 4 port deserializer we 
> might get i2c busses 5, 6, 7 and 8. The linux i2c devices for remote 
> peripherals (sensors mainly) would be created on these busses with their 
> real i2c addresses. When a sensor driver does an i2c write to its 
> device, the i2c-atr will catch the write, change the address according 
> to the translation table, and do an actual write on the i2c bus 4. This 
> would result in the deser HW to catch this write, switch the address 
> back to the "real" one, and send it to the appropriate serializer, which 
> would then send the i2c transaction on its i2c bus.
> 
> In GMSL the deser just forwards everything it sees on the i2c bus, if a 
> port is enabled. The deser has no other support related to i2c. The 
> serializers have DEV_ADDR register which can be used to change the 
> address the serializers respond to, and the serializers also have i2c 
> translation for two remote peripherals.
That's correct, the deser also have the DIS_REM_CC configuration, to not
propagate the I2C requests on a particular link. As I understand from the
datasheet this settings require a link reset to be applied, so we can't
use it as a select/unselect method for an I2C mux.

> 
> But if the i2c translation is used, it would mean that, say, the sensor 
> driver would need to use the "virtual" address, not the real one to 
> communicate with the sensor device, which doesn't sound right...
> 
> You have used i2c-gate for both the deser and the ser. I don't have 
> experience with i2c-gate, but how can we manage the serializer i2c 
> address and the i2c address translation with it?
If we want to add support for I2C ATR on the serializer side then we
may want to declare the device on another node than 'i2c-gate', 'i2c-atr'
for example.

> 
> One difference with the FPD-Link and this series' DT bindings is that I 
> have a "links" node in the deser, instead of just adding the serializers 
> under an i2c node. In FPD-Link case this allowed me to better represent 
> the hardware and the configuration needed.
> 
> So... Perhaps my bottom line question is: do we need something similar 
> to what the FPD-Link uses (links, i2c-atr) to fully support GMSL 
> devices? And also, if we merge the DT bindings in this series, will we 
> have gone into a corner wrt. how we can manage the i2c?

Fully supporting the GMSL2 devices is an ambitious task that this
patchset doesn't address.

I wanted to first tackle a simple scenario, where we don't need links nodes.
Dual and Quad GMSL devices will probably deserve their own
bindings and drivers, and at this point we can discuss if there is a 
requirement
to increase the complexity of the binding.

We can of course add an i2c-atr node to the MAX96717 binding,
without breaking the dt-binding compatibility.

About the links node, as you know the GMSL2 deserializer doesn't allow 
to write and
i2c-alias or a per link I2C control.

We can add later a per link configuration e.g:
- GMSL1 backward compatibility
- Pixel/tunnel mode
- Forward channel rate 6/3 Gbps

We can choose to add those configurations either in a link node, similar 
to FPD Link devices
or directly as a port properties, no strong opinion on that.
> 
>   Tomi
> 

-- 
Julien

