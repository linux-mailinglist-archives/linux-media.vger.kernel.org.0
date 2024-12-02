Return-Path: <linux-media+bounces-22427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D94479E01DA
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994CF28277D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 12:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81042207A3C;
	Mon,  2 Dec 2024 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmA6ZQVI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E1207A2A
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141315; cv=none; b=P2fjuiWHTPDh6nu1xB6b8ArBDTPdFdHYo8dU0qXwfsj/uBp6dCMlHN877B4wX3HKp+eBRYARSROrjMBgndaRPs1hq2etsPQr7ma+57GJztqSgPowtXtwSiqGUYCIWObZe48cBg5rwBd5N7QxhuI3yTc+o/hYeaVlQUOR9ao3Kgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141315; c=relaxed/simple;
	bh=C1wq6c0mHMdc9VmbV4dPEaXH+AagKHJtDMHuWWXf5fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6WWuPg5jfViZ8rBgvjfb1BFU3V7EfUW0EZNT1HLRA9vThxoG3gJt5l9TduorhpMnACVasfjrFS/L7N4vvhgjZMkhd470aNMw5hdk4RIIGLXeSbPJAs8KUBtxyw3obHmDwVfWpJoFIizsfomy++++ciUfnDIZNz3uAywtzToxEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmA6ZQVI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733141312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMOSeVMY1cbVocwmarJcRyRV5ri/bJhxkBF9Dys0uY=;
	b=SmA6ZQVI/fOiDLdld6V9xmeenSGy/qHZtaBXiJetyjaxauBucfdPZUoHcvurbUCR7FV9FC
	QbKNzCwjydW2lyKoI14awgZ60NBxeueN1wXsmN2wlYAr+Jy/6ft9BDFYl5YmNLhDkUr6Vq
	e65MczdJLOk4rPUAFWrSu7bR92q09PY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368--qFNmP4dN4KBgeR2IeJZfw-1; Mon, 02 Dec 2024 07:08:31 -0500
X-MC-Unique: -qFNmP4dN4KBgeR2IeJZfw-1
X-Mimecast-MFC-AGG-ID: -qFNmP4dN4KBgeR2IeJZfw
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d0d2fa9e61so1662022a12.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 04:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141310; x=1733746110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FMOSeVMY1cbVocwmarJcRyRV5ri/bJhxkBF9Dys0uY=;
        b=HVUvfdLTNdy7v3kg+bHL4mlhb2COR+sqXkrFkwbyaty4UZ7lpeD6jyjA/DnGE0o2sS
         A9+MWh4p+cB6Bk+T1Q7xxvMZXdoxAAP5hvWoTL88nfvxHKTRVb5wkrFBujBX/DZJPxoL
         H0PiQcm4hQA9LEJpvzmztI0KZSxVqY11Islami8emwEFZ0fs8PKT5B6UdYxzIQKD+NTd
         WTt6QA9zTD8rhduMGW8ToED6QOOPXFb045NZXUhU3iVllCbdzAQ3t9O931WNHnsAcvxz
         enxbxBKjhpEmHkmGjB1OUr4pTes7FD5W1Pqm1pQCasoGF7ElqVKLNGfXwGiW/b8N02yh
         xbDg==
X-Forwarded-Encrypted: i=1; AJvYcCUNtdpZ1caF2IjnN+EX8JT2eYB9SUwf0qGMNiitsdG2wDuTm/QYAgk5tA2QEBaB+J6cjSl0o3HdozkZlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLP174++XCYeLPYcgLbgyQSvyBAoNB1iEcNMRFjYyRD4989MOj
	7euva+SKLDC9lPQdmYqdISRgQBRZsOsrqRW4zhRxCX0waA/S8wMZjc7voZ/mHomuF2WTbQxC+CX
	wNBvsK1LYNhjq5xF1+iQjS2ghHhdvuerw7HMqUwC0TJWZMQLsfhMFXInkmx2P
X-Gm-Gg: ASbGncvihhEWt1bMBIfELWFY7y9a6v7EhAkPzcl42tZQbH5oRvTK+e3FM0HCe5nvWkg
	3kcb0husu3xCdOqyVqLWIHcqUwsF6bYYKDaLMu8zy8/G9SKtEj1LlAlC5g8bzHbR+WOTjR9r28j
	2afjL4cN2SKbNDu1XNYARY+GUB7L+xwSP4N2Zr6QzoOi0zLSJAaucW1Gd1vW6Z/s79xglGZKofL
	WtpYABs7+lP9rpvoy7axa3CyFpAw2DGL1DZzo6ZawHOUMCaJvHCbw==
X-Received: by 2002:a17:907:940d:b0:a9e:85f8:2a49 with SMTP id a640c23a62f3a-aa5945345c9mr2224920066b.8.1733141310253;
        Mon, 02 Dec 2024 04:08:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfgYYcsQDbDkGzEPsFI5C+i/hssRFuLXp/f5oNxls3R9bybGimSIbB1/JBOTHvVDRWJjMVeg==
X-Received: by 2002:a17:907:940d:b0:a9e:85f8:2a49 with SMTP id a640c23a62f3a-aa5945345c9mr2224916666b.8.1733141309804;
        Mon, 02 Dec 2024 04:08:29 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6dadsm503192466b.132.2024.12.02.04.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 04:08:29 -0800 (PST)
Message-ID: <06e35b4e-a0f3-483f-843c-66c0b12e6cd0@redhat.com>
Date: Mon, 2 Dec 2024 13:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a
 evdev
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 stable@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com>
 <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
 <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com>
 <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
 <5a199058-edab-4f9d-9e09-52305824f3bf@redhat.com>
 <20241125131428.GD32280@pendragon.ideasonboard.com>
 <233eaf78-49f1-43c1-b320-c75cfc04103f@redhat.com>
 <20241125213521.GV19381@pendragon.ideasonboard.com>
 <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com>
 <20241126165049.GH5461@pendragon.ideasonboard.com>
 <CANiDSCu2FJiJP+e+gjWySQRUkKUxXYv2C70kRct2io7yetY56Q@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCu2FJiJP+e+gjWySQRUkKUxXYv2C70kRct2io7yetY56Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Nov-24 6:12 PM, Ricardo Ribalda wrote:
> On Tue, 26 Nov 2024 at 17:51, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Tue, Nov 26, 2024 at 05:27:57PM +0100, Ricardo Ribalda wrote:
>>> On Mon, 25 Nov 2024 at 22:35, Laurent Pinchart wrote:
>>>> On Mon, Nov 25, 2024 at 03:41:19PM +0100, Hans de Goede wrote:
>>>>> On 25-Nov-24 2:14 PM, Laurent Pinchart wrote:
>>>>>> On Mon, Nov 25, 2024 at 01:01:14PM +0100, Hans de Goede wrote:
>>>>>>> On 18-Nov-24 5:47 PM, Ricardo Ribalda wrote:
>>>>>>>> On Mon, 18 Nov 2024 at 16:43, Hans de Goede wrote:
>>>>>>>>> On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
>>>>>>>>>> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
>>>>>
>>>>> <snip>
>>>>>
>>>>>>>>>>> Is there any ACPI- or WMI-provided information that could assist with
>>>>>>>>>>> associating a privacy GPIO with a camera ?
>>>>>>>
>>>>>>> I just realized I did not answer this question from Laurent
>>>>>>> in my previous reply.
>>>>>>>
>>>>>>> No unfortunately there is no ACPI- or WMI-provided information that
>>>>>>> could assist with associating ACPI/WMI camera privacy controls with
>>>>>>> a specific camera. Note that these are typically not exposed as a GPIO,
>>>>>>> but rather as some vendor firmware interface.
>>>>>>>
>>>>>>> Thinking more about this I'm starting to believe more and more
>>>>>>> that the privacy-control stuff should be handled by libcamera
>>>>>>> and then specifically by the pipeline-handler, with some helper
>>>>>>> code to share functionality where possible.
>>>>>>>
>>>>>>> E.g. on IPU6 equipped Windows laptops there may be some ACPI/WMI
>>>>>>> driver which provides a /dev/input/event# SW_CAMERA_LENS_COVER node.
>>>>>>
>>>>>> Using an event device means that the user would need permissions to
>>>>>> access it. Would distributions be able to tell the device apart from
>>>>>> other event devices such as mouse/keyboard, where a logged user may not
>>>>>> have permission to access all event devices in a multi-seat system ?
>>>>>
>>>>> input events modaliases contain a lot of info, including what sort
>>>>> of events they report, e.g. :
>>>>>
>>>>> [hans@shalem uvc]$ cat /sys/class/input/input36/modalias
>>>>> input:b0003v046Dp405Ee0111-e0,1,2,3,4,11,14,k71,72,73,74,75,77,78,79,7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8E,8F,90,96,98,9B,9C,9E,9F,A1,A3,A4,A5,A6,A7,A8,A9,AB,AC,AD,AE,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF,C0,C1,C2,CC,CE,CF,D0,D1,D2,D4,D8,D9,DB,DF,E0,E1,E4,E5,E6,E7,E8,E9,EA,EB,F0,F1,F4,100,110,111,112,113,114,115,116,117,118,119,11A,11B,11C,11D,11E,11F,161,162,166,16A,16E,172,174,176,177,178,179,17A,17B,17C,17D,17F,180,182,183,185,188,189,18C,18D,18E,18F,190,191,192,193,195,197,198,199,19A,19C,1A0,1A1,1A2,1A3,1A4,1A5,1A6,1A7,1A8,1A9,1AA,1AB,1AC,1AD,1AE,1AF,1B0,1B1,1B7,1BA,240,241,242,243,244,245,246,247,248,249,24A,24B,24C,24D,250,251,260,261,262,263,264,265,r0,1,6,8,B,C,a20,m4,l0,1,2,3,4,sfw
>>>>>
>>>>> So I believe that we can create a udev rule which matches on input
>>>>> devices with SW_CAMERA_LENS_COVER functionality and set a uaccess
>>>>> tag on those just like it is done for /dev/video# nodes.
>>>>>
>>>>> Or we can just use a specific input-device-name (sub) string
>>>>> and match on that.
>>>>>
>>>>> This may require using a separate input_device with just
>>>>> the SW_CAMERA_LENS_COVER functionality in some of the laptop
>>>>> ACPI / WMI drivers, but that is an acceptable compromise IMHO.
>>>>
>>>> As long as it's doable I'm OK with it.
>>>>
>>>>> (we don't want to report privacy sensitive input events on
>>>>> these nodes to avoid keylogging).
>>>>>
>>>>>> Would compositors be able to ignore the device to let libcamera handle
>>>>>> it ?
>>>>>
>>>>> input devices can be opened multiple times and we want the compositor
>>>>> to also open it to show camera on/off OSD icons / messages.
>>>>
>>>> I'm not sure we want that though, as the event should be associated with
>>>> a particular camera in messages. It would be better if it still went
>>>> through libcamera and pipewire.
>>>
>>> For OSD we do not necessarily need to know what camera the GPIO is
>>> associated with.
>>>
>>> We just want to give instant feedback about a button on their device.
>>> Eg in ChromeOS we just say: "camera off" not "user facing camera off"
>>
>> That may be true of Chrome OS, but in general, other systems may want to
>> provide more detailed information. I wouldn't model the API and
>> architecture just on Chrome OS.
> 
> It is not about ChromeOS, it is about the use case.
> 
> We were talking about 2 usecases:
> - instant feedback for a button. Actor: OSD / composer
> - this camera is disabled, please use other camera or enable it: Actor
> camera app, or camera "service" (read pipewire, libcamera, or the
> permission handler for snap)
> 
> There are some examples showing that for "instant feedback" there is
> no need to link the event to the camera:
> - there is hardware where this is not possible to establish the link.
> - ChromeOS does not show the camera name (when it has enough
> information to do so)
> - I believe Hans mentioned that Windows does not show the camera name.
> - (Hans, are you wiring SW_CAMERA_LENS_COVER to the user right now?)
> Do you know of a system where this info is needed?

I would like to see this wired up in GNOME but I'm not aware of
anyone actively working on this.

I expect that for GNOME a simple OSD with a camera icon with / without
a cross through it will suffice and I expect such a simple implementation
to directly talk to libinput at the compositor level.

If GNOME does ever wants to show a label on the OSD with a description
of which camera it applies to, like it currently does for volume up/down/
mute keys which affect the current default sound output), then I would
expect it to talk to pipewire to get the events instead of directly
through libinput.

Either scenario can be supported with the SW_CAMERA_LENS_COVER userspace
API, so IMHO this is an implementation detail which can be left up to
whomever implements this for GNOME.

FWIW if I were to implement this myself I would go for the simple solution
of not showing a camera description like ChromeOS is currently doing.

Regards,

Hans



