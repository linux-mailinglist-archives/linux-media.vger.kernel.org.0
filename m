Return-Path: <linux-media+bounces-7943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC488E915
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 16:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B4FDB342B3
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C74315A4B1;
	Wed, 27 Mar 2024 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="slKqacT9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506815A49D;
	Wed, 27 Mar 2024 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546779; cv=none; b=qU3fQ9DD+Miahl+j5kemLbD2OUk4nqdf629wRTN43GWzswvzpMN11ZY4dSbMqiI5HqFA49jfILlEB2XnuIRWSNFcjcYssVfjY/n3mLkxkZkwteiBR0lZhezPPgvesFoUyqdtbWwBkIXK4urEMUCTdfMPw1GuSFgFnZvP7raqc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546779; c=relaxed/simple;
	bh=Lnw8cIiBs+O40yjo1ufrZb5WN5DBmkkwAzvuNbimVrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFBEBvB+p2BMrDJ2kxUVXhm2jXgRZCm8yX0xRX/3IcnGcR10XVFIVwfqKBJPLKfht046OGH1PU/kOZReX0u6qB53RXiA5Du62W4AA83ntuvx86liOyc6HRAiDPKH+QKhetqfIP6PovzAHVfHj4rWN+rL9u1zlTZynyrj8d/bKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=slKqacT9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B43871571;
	Wed, 27 Mar 2024 14:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711546743;
	bh=Lnw8cIiBs+O40yjo1ufrZb5WN5DBmkkwAzvuNbimVrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=slKqacT9DcBW9nNYjsiITE5c6aisQDlvuG+S3a5K6VbSisR2c1rSosDVSgFgND5cQ
	 YCua2SOjxE7Va4dtyrjXg9unuyU853m7RZpV+M4Dhh+raEmZb/HGKXNXz6MVdInHL8
	 OX4AUDQUvjgG2jojRa3y7S4rSpFGjESw7fUUogN0=
Message-ID: <a338c5a0-3239-4fb1-9af1-a127bcef366a@ideasonboard.com>
Date: Wed, 27 Mar 2024 15:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-subdev: Support enable/disable_streams for
 single-pad subdevs
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240325-single-pad-enable-streams-v1-1-142e19896a72@ideasonboard.com>
 <20240325125055.GC23988@pendragon.ideasonboard.com>
 <ZgF10EVLrfF7cl57@kekkonen.localdomain>
 <0ad9841d-bb51-4512-9388-f9ce36372677@ideasonboard.com>
 <ZgG5xt07XQ7DJ1_W@kekkonen.localdomain>
 <e497a7a2-a973-4059-8981-1ea83ea3dd30@ideasonboard.com>
 <ZgP5A0sN9FCoIoPs@kekkonen.localdomain>
 <44e3f07f-9374-414e-a6db-a744127477b1@ideasonboard.com>
 <ZgQf_LX1ohYykGjv@kekkonen.localdomain>
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
In-Reply-To: <ZgQf_LX1ohYykGjv@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2024 15:32, Sakari Ailus wrote:
> Heissulivei,
> 
> On Wed, Mar 27, 2024 at 01:06:42PM +0200, Tomi Valkeinen wrote:
>> On 27/03/2024 12:46, Sakari Ailus wrote:
>>> Heippa,
>>>
>>> On Mon, Mar 25, 2024 at 07:56:46PM +0200, Tomi Valkeinen wrote:
>>>> On 25/03/2024 19:52, Sakari Ailus wrote:
>>>>> Moi,
>>>>>
>>>>> On Mon, Mar 25, 2024 at 03:43:01PM +0200, Tomi Valkeinen wrote:
>>>>>> On 25/03/2024 15:02, Sakari Ailus wrote:
>>>>>>> Moi,
>>>>>>>
>>>>>>> Thanks for the patch.
>>>>>>>
>>>>>>> On Mon, Mar 25, 2024 at 02:50:55PM +0200, Laurent Pinchart wrote:
>>>>>>>> Hi Tomi,
>>>>>>>>
>>>>>>>> On Mon, Mar 25, 2024 at 02:43:23PM +0200, Tomi Valkeinen wrote:
>>>>>>>>> Currently a subdevice with a single pad, e.g. a sensor subdevice, must
>>>>>>>>> use the v4l2_subdev_video_ops.s_stream op, instead of
>>>>>>>>> v4l2_subdev_pad_ops.enable/disable_streams. This is because the
>>>>>>>>> enable/disable_streams machinery requires a routing table which a subdev
>>>>>>>>> cannot have with a single pad.
>>>>>>>>>
>>>>>>>>> Implement enable/disable_streams support for these single-pad subdevices
>>>>>>>>> by assuming an implicit stream 0 when the subdevice has only one pad.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>>>>> ---
>>>>>>>>> Even though I did send this patch, I'm not sure if this is necessary.
>>>>>>>>> s_stream works fine for the subdevs with a single pad. With the upcoming
>>>>>>>>> internal pads, adding an internal pad to the subdev will create a
>>>>>>>>> routing table, and enable/disable_streams would get "fixed" that way.
>>>>>>>
>>>>>>> I'd like to get rid of a redundant way to control streaming.
>>>>>>
>>>>>> We can't get rid of it anyway, can we? We're not going to convert old
>>>>>> drivers to streams.
>>>>>
>>>>> I'd expect to do that but it'd take a long time. That being said, I think
>>>>> we need to consider devices without pads (VCMs) so it may well be this
>>>>> would remain after all.
>>>>>
>>>>>>
>>>>>> For new drivers, yes, we shouldn't use s_stream. But is the answer for new
>>>>>> sensor drivers this patch, or requiring an internal pad?
>>>>>
>>>>> For new drivers I'd like to see an internal pad in fact.
>>>>> {enable,disable}_streams is still internal to the kernel.
>>>>
>>>> So, you think this patch should be dropped?
>>>
>>> No, no. Not all sub-device drivers with pads are camera sensor drivers. :-)
>>
>> Hmm, alright. So we want to support enable/disable_streams for sub-devices
>> with multiple source pads but no routing (so probably no sink pads)?
> 
> That should be allowed indeed, in order to move from s_stream() to
> {enable,disable}_streams().
> 
>>
>>>>>>>>> So perhaps the question is, do we want to support single-pad subdevs in
>>>>>>>>> the future, in which case something like this patch is necessary, or
>>>>>>>>> will all modern source subdev drivers have internal pads, in which
>>>>>>>>> case this is not needed...
>>>>>>>>
>>>>>>>> I think the latter would be best. I however can't guarantee we won't
>>>>>>>> have valid use cases for (enable|disable)_streams on single-pad subdevs
>>>>>>>> though, so you patch could still be interesting.
>>>>>>>
>>>>>>> Instead of the number of pads, could we use instead the
>>>>>>> V4L2_SUBDEV_FL_STREAMS flag or whether g_routing op is supported to
>>>>>>> determine the need for this?
>>>>>>
>>>>>> Maybe, but are they better? Do you see some issue with checking for the
>>>>>> number of pads? I considered a few options, but then thought that the most
>>>>>> safest test for this case is 1) one pad 2) enable/disable_streams
>>>>>> implemented.
>>>>>
>>>>> I think I'd actually prefer {enable,disable}_streams in fact.
>>>>
>>>> Hmm, sorry, now I'm confused =). What do you mean with that?
>>>
>>> I'd use V4L2_SUBDEV_FL_STREAMS flag instead of the number of pads. The
>>> number of pads is less related to routing.
>>
>> Well, with one pad you cannot have routing =).
>>
>> In this patch I used sd->enabled_streams to track the enabled streams, but
>> if we need to support multiple pads, I'll have to invent something new for
>> that.
> 
> What exactly do you think needs to be changed? This is just about starting
> and stopping streaming using a different sent of callbacks, right?

The helpers track which streams are enabled, so we need some place to 
store the enabled streams.

For V4L2_SUBDEV_FL_STREAMS we have that in state->stream_configs for 
each stream. For the one-source-pad case we have a subdev wide 
sd->enabled_streams to store that. But we don't have any place at the 
moment to store if a pad is enabled.

  Tomi


