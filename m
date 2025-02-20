Return-Path: <linux-media+bounces-26457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5FA3DA1F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1E31889430
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACBA1DFD98;
	Thu, 20 Feb 2025 12:33:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D6A1E511
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054793; cv=none; b=AR0i2B0VlCqA2otcbnox4lyrCN/OxD87sJeOEPEVMOxEmTy374n7Pi/zNpksxKep0n0436OeMKrA2bN+Mvwzt/IBX+b2zUaBlWS0jtVOLy8py8bTyLlnqNXYJLIwkLEAjQ3bHrSbaNnBQJt7IgPeSd6alxh6Dnn+chjXn5Bfp7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054793; c=relaxed/simple;
	bh=iTNQrLR8Cnawx1yhyjpCB0LJ318SiGQAqx32erwThEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFoBAEV+bMZGzYEdEFaR937k5q4cnjdW6AIWqCO4tz5sm2HiCzYkZZRnPJgDQTq2s7FdFu9svbNjiP2TpA8u+oenteDq7qK3x9JrjoQ+r68w3uu4fbKhcMLk4+X9hI9t4CJ71F86JY/K1HUIdi+NuxPVTYRm7M0+kBdHCf/G/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3786CC4CED1;
	Thu, 20 Feb 2025 12:33:08 +0000 (UTC)
Message-ID: <a818e5d6-d553-416b-badd-2cbce525988f@xs4all.nl>
Date: Thu, 20 Feb 2025 13:33:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
 <2her7s6acicbzk7pkknflckhp46klxqzplyr4bw2daz6dw4rb4@pzx3gki6uorj>
 <20250220121112.GC22240@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250220121112.GC22240@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/20/25 13:11, Laurent Pinchart wrote:
> On Thu, Feb 20, 2025 at 12:34:23PM +0100, Jacopo Mondi wrote:
>> Hi Hans
>>    thanks for organizing this
>>
>> On Thu, Feb 20, 2025 at 11:24:30AM +0100, Hans Verkuil wrote:
>>> [Repost because I mixed up a Lyon and Nice, and to provide more info on the other
>>>  events that take place in Nice. Also added Kevin Hilman to the CC list.]
>>>
>>> Hi all,
>>>
>>> We want to organize a Media Summit this year as well to meet each other face-to-face.
>>> We try to co-locate with an existing conference, and this year there are two options:
>>>
>>> 1) Co-locate with the Embedded Recipes conference in Nice in France which is held on May 14-16:
>>>
>>>    https://embedded-recipes.org/2025/
>>>
>>>    So a media summit would probably take place on May 11 or 12.
>>>
>>>    This conference is a one room, one track format. But the room holds up to 200
>>>    people and the expectation is that it is not a problem to get tickets for it.
>>>    And we might be able to reserve some tickets for us as well.
>>>
>>>    There is a libcamera workshop on Friday, and AFAIK a pipewire workshop on the same day.
>>>    GStreamer plans an event during the weekend after ER.
>>>
>>> 2) Co-locate with the Open Source Summit Europe in Amsterdam which is held on August 25-27.
>>>
>>>    https://events.linuxfoundation.org/open-source-summit-europe/
>>>
>>>    The Embedded Linux Conference Europe is part of that event. The summit would
>>>    probably be on August 24 or 28.
> 
> Do I assume correctly we would organize it by ourselves like the
> previous years, finding sponsors and renting a meeting room somewhere,
> and not relying on the Linux Foundation ?

For ER certainly, for OSSE it is always worth to check what the LF charges for a
room. If only to have a comparison.

Regards,

	Hans

> 
>>> I know that getting permission to travel is still a problem for many, which is why we
>>> try to co-locate with a larger event.
>>>
>>> So: if you are a core media maintainer or an active media developer, and want to join
>>> the Media Summit, which of these two options would work for you?
>>
>> I know I will be in Nice, not sure about Amsterdam yet.
>>
>> The co-location of a libcamera, pipewire and gstreamer events also
>> makes me lean towards Nice as a better choice for the media summit.
> 
> Likewise, I know I'll be in Nice. I can probably make it to Amsterdam
> too if needed.>
>>>
>>> If possible, I would like to get an idea of what I can expect in about two weeks time.
>>> I'll send out a reminder in about a week as well.
>>>
>>> Feel free to forward this if you know other people who might be interested.
>>>
>>> If you haven't been to one of these Media Summits before, then you can find the report
>>> on last year's summit here:
>>>
>>> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
>>>
>>> That should give you an idea of what to expect.
> 


