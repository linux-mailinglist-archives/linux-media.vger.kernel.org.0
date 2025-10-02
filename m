Return-Path: <linux-media+bounces-43537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E83BB2C54
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 10:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49E3F4246B3
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 08:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347782D239B;
	Thu,  2 Oct 2025 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jNA4/TK3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74E208CA;
	Thu,  2 Oct 2025 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392415; cv=none; b=VQ4+dfP7Gj7QyTR8y2Iiov3lwKE9MNzfjOwLSF+Hap05ROywMXo/kp4KvHbqCamvhFVba37WYUbVEyn0zkm2Qv3pY1VOSB2wECzk1zND6as4pD9oZHq+pK84VztGG9VvOFd2cBEzqQV8HIcIvojredNOvQeaWm6vrCLxXPkArlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392415; c=relaxed/simple;
	bh=LYBxpvG4GsirP480o2Qg+ZasVLpxAcnoTORF94FBFkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PD3x1FFv4EtZRMRgVFmauEjzibPU7QaaZcZoWV/d404ZI7Aa1zhB2KiKFMZ6CxSO80fZ0+1QCIGd4jEhgnJi05zkDAhvstvq4uNwagcBSt+Zmuf+6U0GgvAUSCQMVw3pTvN/m5Nt+CK9x+UJM7auGjrZCGmiHxRKjoOqAJ2gCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jNA4/TK3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759392411;
	bh=LYBxpvG4GsirP480o2Qg+ZasVLpxAcnoTORF94FBFkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jNA4/TK3XbUqcfns14QYCxIrMJl6UClvARaH4rkiiyqAGChoD8O/9NBVTUmRuVEBj
	 vhZQFqB2y+72V+REWDgsTN1rzCUTVB19xMa5POYYTm9+NOM0nUsObwq4PwPq5HQ9AN
	 ul6McVeGg135Nuxvnnc3ZTZ3h6GeD3kIVusHn+hRlGbqkU2WYpEznTnU8hLVOlHgzw
	 w0u/6vtta1FI0sHN+y9o0CUW0rta3YQwgvJIZTlqjPV1hecwL2b5k1FmF4hqn33GaP
	 b6JWepkWs9EgXJlkI5t5zf2x4RuScMbD0OsF9fjJASRRWKdJJ9yngTqHGge4rPqRgr
	 6TfHPa5tXluMA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 018BB17E0C54;
	Thu,  2 Oct 2025 10:06:50 +0200 (CEST)
Message-ID: <494d4bed-4357-48a1-9313-2b1b70e8e699@collabora.com>
Date: Thu, 2 Oct 2025 10:06:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
To: Anthony McGivern <anthony.mcgivern@arm.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
 "hverkuil@kernel.org" <hverkuil@kernel.org>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "Kieran Bingham (kieran.bingham@ideasonboard.com)"
 <kieran.bingham@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
 <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
 <20250930101626.GE25784@pendragon.ideasonboard.com>
 <2efcfe19bafd1276e9fc71b72e251443f313d693.camel@collabora.com>
 <413937a1-bf4c-4926-945f-7df39869f215@arm.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <413937a1-bf4c-4926-945f-7df39869f215@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Anthony, hi all,

On 10/2/25 09:42, Anthony McGivern wrote:
> 
> Hi all,
> 
> On 30/09/2025 13:58, Nicolas Dufresne wrote:
>> Hi Laurent,
>>
>> Le mardi 30 septembre 2025 à 13:16 +0300, Laurent Pinchart a écrit :
>>> On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
>>>> On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
>>>>> On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
>>>>>> Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
>>>>>> contex. It extends 'struct media_entity_context' and is intended to be
>>>>>> extended by drivers that can store driver-specific information
>>>>>> in their derived types.
>>>>>>
>>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>
>>>>> I am interested in how the sub-device context will handle the
>>>>> Streams API? Looking at the commits the
>>>>> v4l2_subdev_enable/disable_streams functions still appear to operate
>>>>> on the main sub-device only. I take it we would have additional
>>>>> context-aware functions here that can fetch the subdev state from
>>>>> the sub-device context, though I imagine some fields will have to be
>>>>> moved into the context such as s_stream_enabled, or even
>>>>> enabled_pads for non stream-aware drivers?
>>>>
>>>> mmm good question, I admit I might have not considered that part yet.
>>>>
>>>> Streams API should go in a soon as Sakari's long awaited series hits
>>>> mainline, and I will certainly need to rebase soon, so I'll probably
>>>> get back to this.
>>>>
>>>> Have you any idea about how this should be designed ?
> 
> Hmm, while I haven't thought of a full implementation I did some testing
> where I added a v4l2_subdev_context_enable_streams and it's respective
> disable_streams. These would provide the v4l2_subdev_context so that
> when the subdev state was fetched it would retrieve it from the context.
> I think this would work with the streams API, however for drivers that don't
> support this it will not since the fields such as enabled_pads are located
> in the v4l2_subdev struct itself. Assuming these fields are only used in the
> V4L2 core (haven't checked this fully) potentially they could be moved into
> subdev state?
> 
> There were some other areas that I found when trying to implement this
> in the driver we are working on, for example media_pad_remote_pad_unique()
> only uses the media_pad struct, meaning multi-context would not work here,
> atleast in the way I expected. Perhaps this is where we have some differing
> thoughts on how it would be used. See some details below about the driver we
> are working on.
> 
>>>
>>> Multi-context is designed for memory to memory pipelines, as inline
>>> pipelines can't be time-multiplexed (at least not without very specific
>>> hardware designs that I haven't encountered in SoCs so far). In a
>>
>> I probably don't understand what you mean here, since I know you are well aware
>> of the ISP design on RK3588. It has two cores, which allow handling up to 2
>> sensors inline, but once you need more stream, you should have a way to
>> reconfigure the pipeline and use one or both cores in a m2m (multi-context)
>> fashion to extend its capability (balancing the resolutions and rate as usual).
>>
>> Perhaps you mean this specific case is already covered by the stream API
>> combined with other floating proposal ? I think most of us our missing the big
>> picture and just see organic proposals toward goals documented as un-related,
>> but that actually looks related.
>>
>> Nicolas
>>
>>> memory-to-memory pipeline I expect the .enable/disable_streams()
>>> operation to not do much, as the entities in the pipeline operate based
>>> on buffers being queued on the input and output video devices. We may
>>> still need to support this in the multi-context framework, depending on
>>> the needs of drivers.
>>>
>>> Anthony, could you perhaps share some information about the pipeline
>>> you're envisioning and the type of subdev that you think would cause
>>> concerns ?
> 
> I am currently working on a driver for the Mali-C720 ISP. See the link
> below for the developer page relating to this for some details:
> 
> https://developer.arm.com/Processors/Mali-C720AE
> 
> To summarize, it is capable of supporting up to 16 sensors, either through
> streaming inputs or memory-to-memory modesn and uses a hardware context manager
> to schedule each context to be processed. There are four video inputs, each
> supporting four virtual channels. On the processing side, there are two parallel
> processing pipelines, one optimized for human vision and the other for computer
> vision. These feed into numerous output pipelines, including four crop+scaler
> pipes who can each independently select whether to use the HV or CV pipe as
> its input.
> 
> As such, our driver has a multi-layer topology to facilitate this configurability.
> With some small changes to Libcamera I have all of the output pipelines implemented
> and the media graph is correctly configured, but we would like to update the driver
> to support multi-context.
> 
> My understanding intially was each context could have it's own topology configured
> while using the same sub-devices. For example, context 0 may link our crop+scaler

+1

I agree that having a notion of topology/graph partition/graph
configuration in the context will facilitate the support for the vast
amount of possible configurations and use cases that modern image
processing pipelines offer.

I had a chat with Jacopo yesterday and (I think) we found that the media
graph configuration (routing, linking, ...) could be embedded in the
media context (maybe in the form of a media state).

Best regards,
Michael

> pipes to human vision, whereas context 1 uses computer vision. Similarly, our input
> sub-device uses internal routing to route from the desired sensor to it's context.
> It would by my thoughts that the input sub-device here would be shared across every
> context but could route the sensor data to the necessary contexts. With the current
> implementation, we make large use of the streams API and have many links to configure
> based on the usecase so in our case any multi-context integration would also need
> to support this.
> 
> Anthony
> 


