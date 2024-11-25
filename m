Return-Path: <linux-media+bounces-21997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D5B9D86BB
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CA30165022
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FC61ABEC6;
	Mon, 25 Nov 2024 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cXsH3ErB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E918872F
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732542250; cv=none; b=DKKeZkyOzUaeM6gYqfv2k0aj7MygAADDGSYwASmJU/ahsL/176dAawBx3K28Z4CKIGZdw0aLX6mlyJIaP0XZ1/Vwq9ED4lXfkyZWp+fwN36ZK94W+PTnMZC8gP45EJbegKzyiua989Rh35FfIFx9MCczRQAI1HypHEgxHHsVheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732542250; c=relaxed/simple;
	bh=NdpHPl91yCIP6m0C14SiDShavK1QjUgunTuuG3bOhFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWxWsDiozXAXzqune26i1WRCwN2RSBG7DRe8XZpzmlauXZ80FlO/94UZiG5gOlYPnbE21dBgF7nof+E4xXm1Tw48gKdcWOohSqM622Mr+XqnGH91OppiB0UiyyM86Z+1UXf1khKQCjYCkEZjahrqx0fxLpha/ilOtVLSl+AJP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cXsH3ErB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732542247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhhNcg4tt2EmSYnWuYxYmElmP5/JIvyr3LxTavuF7BY=;
	b=cXsH3ErBhRffNEwN3JOFu2ELeWVvxL9xVSqPhnxk+sC8IaLefES7WJXtOZKOwV2IK/R1bv
	1Qe40gbN8VB33442fpBE9wf0UuqdD9cwdTcgREvwI0f33VoaRGfLsRfei59Lru1CuTVTNK
	wDuJHEXHLQKXqhA/blfCv8YC1gBS0S0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-f4O72JSyMvmt6-R_60Y4wg-1; Mon, 25 Nov 2024 08:44:06 -0500
X-MC-Unique: f4O72JSyMvmt6-R_60Y4wg-1
X-Mimecast-MFC-AGG-ID: f4O72JSyMvmt6-R_60Y4wg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa538575f0fso149065566b.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 05:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732542245; x=1733147045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhhNcg4tt2EmSYnWuYxYmElmP5/JIvyr3LxTavuF7BY=;
        b=jmYE6rIS4sgfTliGb7xmNz4ZWmfE2e08EDFx/wZYUhEWaSkMtOAbiITwKRVKnYzN3P
         4FjIVe34nRXUgd+flmg1HNR+lIT3DM9h13I+19bqOIAEAtAKC2EgmsriHoTdOm6NpJg2
         IC72tSo0hlcmGNnZsnw64rpSFXdScrcF1kqRgU85+QPmWAYTYZdw3CWtfq3gFgz/moPN
         w5J6WGqfH/f7kKp7thSn2r1qxWsRJyWgPVUFBPqhuZ/AOabOAms+LzQ9F7dHXcgIhZDP
         8UFGJxVQ2Z/ic6uyxcobefFHdVRt50tECTyz0GkhlHVpiXRBsCtWjpA8HtZ9mltmOudl
         JjXw==
X-Forwarded-Encrypted: i=1; AJvYcCXw6cH0HeGQ1nShdazzg4eWY3nMr4SQQNEjjuPb0xi2GqQisZzuBbCyjpiG7YTYCChlJlLIfOTlo0EOfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrGLI59mxEpeKTxsrIu6+ncJnnkrABh/lKHVu9BCbVyLNY/Xlg
	ZV6Ai6utkq8mVY6TLQmbu+L0gluGYDghs6MQzPMF7Rl9QXo8EMpDHnvlFo7sI4Qt+wczvkVVWAS
	b3O50KK8F/xfcrg7f4J3MuhiySmb5irNrdjbe0nsLGusbtr3P+KY2HD796kuH
X-Gm-Gg: ASbGnctRI1Bj2gAZbobrXN86hDqPV3xTV7yua3RND/qCSOYll+91G/RrQYbfAL9RcU+
	hN3WtQQzEs5UV90SzTKUP7aMIxHoqP+CWoBBGzxk1dBuAjIPysrsYuCKCoXvIuT32WJL3MDwpkw
	hKzlYdSLy2gh3jUdFzQ4rMBvXD+OctBUOqxLPJejrlKbTlKpNyvYljHj7rioFKqoLFoRpAiGs0p
	+KU6IvD4uf/9n6TqpsjaKb0oZwZrlAApZmkpEeyI4d1bthjp8Th3QA5iWECYsuB/B2W4OB+X4WN
	3ke3N+81BMiP4De+WyfHZMntEgLWjOPfZmekXH2nsqUEWLyqZzZJa9paspVPeBZbqnY5WlhCYd0
	+vuoPoJryhsiy9h7lBxek0ggW
X-Received: by 2002:a17:907:7639:b0:a9a:3cec:b322 with SMTP id a640c23a62f3a-aa509d3fd2amr1095068166b.45.1732542244925;
        Mon, 25 Nov 2024 05:44:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI1u01TNhqvUqYHqTS4lo03ToXCKST9SdpaSegeiA7kHV4Twp87DS4sYBUS8u3Ao7Hu2Ds1g==
X-Received: by 2002:a17:907:7639:b0:a9a:3cec:b322 with SMTP id a640c23a62f3a-aa509d3fd2amr1095065666b.45.1732542244558;
        Mon, 25 Nov 2024 05:44:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28f88bsm465710466b.2.2024.11.25.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:44:04 -0800 (PST)
Message-ID: <33e7dbc8-0d29-4905-a28c-e562151a837a@redhat.com>
Date: Mon, 25 Nov 2024 14:44:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110151426.GD6002@pendragon.ideasonboard.com>
 <CANiDSCsTNuQRXwMqA_YmX4MJ-A8eTi_rEpkd+Qv=Qwbbrj18Yg@mail.gmail.com>
 <123bfac4-389a-400a-8104-afc27124b75d@redhat.com>
 <20241125125834.GC32280@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241125125834.GC32280@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Nov-24 1:58 PM, Laurent Pinchart wrote:
> On Mon, Nov 25, 2024 at 01:39:05PM +0100, Hans de Goede wrote:
>> Hi Ricardo,
>>
>> On 10-Nov-24 5:07 PM, Ricardo Ribalda wrote:
>>> On Sun, 10 Nov 2024 at 16:14, Laurent Pinchart
>>> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> <snip>
>>
>>>>>> Here is what I have in mind for this:
>>>>>>
>>>>>> 1. Assume that the results of trying a specific fmt do not change over time.
>>>>>>
>>>>>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
>>>>>>    enum-frame-sizes -> enum-frame-rates tripplet results
>>>>>>    (constrain what userspace requests to these)
>>>>>>
>>>>>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
>>>>>>    3 levels nested loop for this) on probe() and cache the results
>>>>>>
>>>>>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
>>>>>>    the requested fmt to one from our cached fmts
>>>>>>
>>>>>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
>>>>>>    what we expect based on the cache, and otherwise return -EIO.
>>>>>
>>>>> Can we start powering up the device during try/set fmt and then
>>>>> implement the format caching as an improvement?
>>>>
>>>> This sounds worth trying. We'll need to test it on a wide range of
>>>> devices though, both internal and external.
>>>
>>> For what is worth, we have been running something similar to
>>> https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
>>> in ChromeOS and it has worked fine....
>>>
>>> But I am pretty sure that it has issues with async controls :S
>>
>> Interesting that is actually a lot more aggressive (as in doing a
>> usb_autopm_put_interface() often) then what I expected when you said:
>>
>> "Can we start powering up the device during try/set fmt"
>>
>> As I mentioned in my other emails what I think would worth nicely
>> is delay the initial usb_autopm_get_interface() till we need it
>> and then just leave the camera on till /dev/video# gets closed.
>>
>> That idea is based on dividing apps in 2 groups:
>>
>> 1. Apps just temporarily opening /dev/video# nodes for discovery,
>> where we ideally would not power-up the camera.
>>
>> 2. Apps (could even be the same app) opening /dev/video# for
>> a longer time because it actually want to use the camera
>> at the moment of opening and which close the /dev/video# node
>> when done with the camera.
>>
>> Your code seems to also covers a 3th group of apps:
>>
>> 3. Apps opening /dev/video# for a long time, while not using
>> it all the time.
>>
>> Although it would be nice to also cover those, IMHO those are
>> not well behaved apps and I'm not sure if we need to cover those.
> 
> Is that right ? Isn't it better for an application to keep the device
> open to avoid open delays or even open failures when it wants to use the
> device ?

Keeping devices open has advantages and disadvantages. E.g. keeping
/dev/input/event# nodes open will also typically lead to e.g.
touchscreens staying powered on.

Generally speaking it is not unheard of to expect userspace to
behave in a certain way for things like this for power-consumption
reasons.

I guess the question is how far do we want to go inside the uvc
driver to avoid userspace needing to close the /dev/video# nodes
when unused.

Ricardo's patch from here:

https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/

goes all the way and if I understand Ricardo correctly this is
already in use in ChromeOS ?

So we could also go with this. Maybe put it behind a Kconfig option
for a while ?

AFAICT the only thing which needs to be figured out there is async
controls.

I think we can simply set a long autosuspend delay on devices with
async controls to deal with that ?

I have a Logitech QuickCam Orbit (non AF) UVC camera which has
pan + tilt controls and AFAICT these work fine with v4l2-ctl
which immediately closes the /dev/video# node after the set-ctrl
command. But I'm not sure if I have tested this without the camera
streaming at the time. Anyways that is at least one camera I can test.

Regards,

Hans



