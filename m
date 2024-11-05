Return-Path: <linux-media+bounces-20930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E22419BCC5F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19EC2831DF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51921D54DA;
	Tue,  5 Nov 2024 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e0JHdOwn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5731420A8;
	Tue,  5 Nov 2024 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808539; cv=none; b=jxPL1gdRDm8Ufiv7jdetwnuo+0XF23lDZA34m+SIAIkdzWhREVRxwQ4miGyR/UE5H5ibOiyDktsCgi7Uix6MLTHhFKWHEG1uyT34bfMMYcYGMZ8PJjYStgh8LsvS+Ma3lVeWAeVEwaEpm2N5TSYvNzuWcO0uY3icD2Bjul7XOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808539; c=relaxed/simple;
	bh=95Qa/TvAACuA2x/3YKK016YgNA7xhuFc6EjqGL19ZVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q263Wv3KV96LATRxFTRpMJcc+VFS5xPvDyXVDjfyLkF9G4PUffzBNqiGHRaeGxRoVRuYi1AU72XmRi9C1tWfLUQ6NUtmNSXYhIjAqm4wwVCxsrXcwqsOK6JodJl1h88xPI1gi44mG58a9ByyN7CH3Yedn+qsSCgNzgpj3LWcQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e0JHdOwn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C11F24AD;
	Tue,  5 Nov 2024 13:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730808528;
	bh=95Qa/TvAACuA2x/3YKK016YgNA7xhuFc6EjqGL19ZVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e0JHdOwnxozN6BY65vXEN3ofIxPN4aalBqYLzXJeHqnDF4wZilppnX46BKKUCUT2p
	 epHlDNMltMpcuNmTK5XI9GQgXV92N6a9LrCjEz0mC197vIEa3ZnTHRn1Iwor/ZDJoo
	 WWfFb/1008RzL5OnP2yBB+IuvmVSAJSjdUlpspg4=
Message-ID: <9becfc3f-1dfa-46d3-8afe-81c8e6b59800@ideasonboard.com>
Date: Tue, 5 Nov 2024 14:08:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: platform: Add c3 mipi csi2 driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-2-f774a39e6774@amlogic.com>
 <ejz2o35uenq4bq6ifepgpu2tsfkjrylmtvxx5ysqab5ydodtvx@zb4m24sk6fcb>
 <7c6cdb7b-705c-4744-a28e-866dbda094ac@amlogic.com>
 <qbr4bzggnnkj5lakfpbgmgrfgeuy6tatljkjiwijeradklm7cw@hblicnc6wtvl>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <qbr4bzggnnkj5lakfpbgmgrfgeuy6tatljkjiwijeradklm7cw@hblicnc6wtvl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/11/2024 13:39, Jacopo Mondi wrote:

>>> Could you clarify what other streams you plan to support ? As you
>>> support routing I presume you are preparing to capture
>>> multiple streams of data like image + embedded data, or to support
>>> sensors which sends data on different virtual channels ?
>>>
>>> How do you see this driver evolve ? Will it be augmented with an
>>> additional source pad directed to a video device where to capture
>>> embedded data from ?
>>>
>>> I'm wondering because if PAD_SINK become multiplexed, you won't be
>>> allowed to set a format there. It only works now because you have a
>>> single stream.
>>>
>>> Speaking of which, as you prepare to support multiple streams, I would
>>> specify the stream number when calling v4l2_subdev_state_get_format().
>>>
>>>           fmt = v4l2_subdev_state_get_format(state, format->pad, 0);
>>>
>> Thanks for your suggestion.
>>
>> But this MIPI CSI2 hardware module doesn't have the ability to separate data
>> , such as image + embedded data.
>>
>> So there are no plans to support other streams.
> 
> I see. Now that I've reviewed the adapter subdevice path I realized
> that it's the adapter that can split data based on VC/DT to either the
> ISP direct path or to DDR.
> 
> The CSI-2 RX then transports streams as received from the sensor
> directly to the adapter.
> 
> In order to support capturing embedded data to DDR in the adapter the
> embedded data stream needs a representation in this subdevice as well,
> so that the source pad is multiplexed as well and the adapter receives
> two streams that it can eventually split.
> 
> 
>        Sensor         CSI-2Rx         Adapter
>     +-----------+     +------+       +--------+
>     0-- ED --\  |     |      |       |     /->0---> Embedded Data (DDR)
>     |         ->0====>0 ==== 0 ====> 0====|   |
>     0-- I ---/  |     |      |       |     \->0--->    Image (ISP)
>     +-----------+     +------+       +--------+
> 
> When going to support embedded data capture this driver should create
> two routes and allow enabling/disabling the embedded data one.

This depends on the hardware. What's the bus between the CSI-2 rx and 
the adapter? If it's a custom bus that basically allows passing forward 
anything received from the CSI-2 bus, then the user should be free to 
configure any routes in the CSI-2 RX subdevice.

The adapter subdev, however, as it is limited by the HW, should only 
support two streams if that is what the hardware supports.

> Tomi in cc for inputs.
> 
> For now, if you don't support capturing embedded data, I would remove
> routing support from here and from the adapter.

Right, if the drivers only support a single stream, just drop the 
routing support.

  Tomi


