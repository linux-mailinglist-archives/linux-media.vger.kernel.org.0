Return-Path: <linux-media+bounces-21540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65F9D14DB
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 16:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 687A4B25575
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 15:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5071AF0A0;
	Mon, 18 Nov 2024 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlZXL0L5"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2D17758
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731944610; cv=none; b=L7d5BqEiVAFP/M3gqC9rbNs9a2XxB3TBfhaNrVx8fC/wbiGHRvSFkaNH0WNvw5ZKo7nIgKMMRz1Yj1nRFI2nN6FiCOFlHu8XoJDOnlhUEDHo/UtvUGraTCUAYCyxgRAa3Uzwd0cMXDgue1kCDboVAABxI1Nwo2jvA4lBRPc7384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731944610; c=relaxed/simple;
	bh=kmLspr/TfXjF5l2U6hL+xCEE6zYiyBcGzwc927Syjug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSRh4Pah4OCtDX3fungYs60cxFpPGdRw0yQAzkU4UtoFhk6uv2W2VJDY79nw6zFf3v22zxb4H0h2JAZphl8nCbKoMnRcM46fpEkPLDIpQP0pcheOHk+l9+H9AENEHuKK+dy2PrrQOS2jcFxjXRU+MBwVVLXJ9pHOdBAIXTrxlF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlZXL0L5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731944606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtd5yYpXYuU0zMquKYBb0VdE5zAjcIAGhK0PJ8FyRIE=;
	b=RlZXL0L5V76E9kPOqR864Ji+G2J6bbbk+7oEifx7hWtcr9W1xorPojG0tW4gQ5h/eSLkBb
	bYT0QENqlIIdyUbO4HTEEXO47e7Bx+bZZWyJSnSD9ADcETJPVltICk0p3sOthY6VNDHSC8
	VAHCc4qgOAYslnTx8PvA/pgArDi87AI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-8-18wlW_Psm-1hjzIxs9ZA-1; Mon, 18 Nov 2024 10:43:24 -0500
X-MC-Unique: 8-18wlW_Psm-1hjzIxs9ZA-1
X-Mimecast-MFC-AGG-ID: 8-18wlW_Psm-1hjzIxs9ZA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99efe7369dso439181266b.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 07:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731944603; x=1732549403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtd5yYpXYuU0zMquKYBb0VdE5zAjcIAGhK0PJ8FyRIE=;
        b=icIeO2OcWPd/XS+If0K1mhiPpE4vLOb/zLmDDpJt8Bcnmgb01IzCPhlgf7zjWvoJbq
         dtbEqCV+vYZqiRdme99bYiY5NvpTJnttVs4kbrPNVl5o8hJUwGS8biG3uQFuSOCcTwXd
         lHfak5WttzrZEb77tRPUlw7uG646Uw4MvOniZoDJnJhsIBE2t3Z9l0k56fUEHB9BGxrU
         L1nMFy8mGfOV+E6q0psjEaxTMn/nj8XGyfK6iqWHQdsoI5p306dPJrNwbkfGCRqPCDNF
         piWqYGhxz1+TUKof8a03X+EkeRG0t8UIzwDK4eT22+k+Qwk2kVwUVbYiFdp5IkTgXbvo
         awDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2oOWuMUHMsvYLwwye2rnTb0Kmq8KcBZ0KStW50kMgLxCbnX1OAGLo6v7Wu7e8JCNT0mJgQ0ar7Mcyww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxC7PD7+xlB3B4RmlE+N2RjsT0NLjhEF64eQ1rVAUxg1VpfcC
	ozV3P1aTrztGAPvbUF5kDAFMWKZWWPaFQ/R96OQODZwJ0f4ERXtXkK+JbGee3fZDUm+JHA7fWYZ
	eTLRICQ/NXpKnVNzLpjRU6LfdLtDp97vfU3qcd8YjMR4Unn3EsGvUNopHRMKw
X-Received: by 2002:a17:907:9813:b0:a9e:c266:4e82 with SMTP id a640c23a62f3a-aa48185c694mr1389265866b.6.1731944603405;
        Mon, 18 Nov 2024 07:43:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe2meeP6SpTocOWZZ6rmK1+J4wwZY5db7QvB10T0l2AOhBcA2wyLcRIDCJaECUGyPNOr894A==
X-Received: by 2002:a17:907:9813:b0:a9e:c266:4e82 with SMTP id a640c23a62f3a-aa48185c694mr1389262466b.6.1731944602971;
        Mon, 18 Nov 2024 07:43:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df571a1sm553179666b.80.2024.11.18.07.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 07:43:22 -0800 (PST)
Message-ID: <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com>
Date: Mon, 18 Nov 2024 16:43:21 +0100
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
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <bd68178f-1de9-491f-8209-f67065d29283@redhat.com>
 <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com>
 <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hello,
>>
>> On Thu, Nov 14, 2024 at 08:21:26PM +0100, Ricardo Ribalda wrote:
>>> On Wed, 13 Nov 2024 at 18:57, Hans de Goede wrote:
>>>> On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
>>>>> Some notebooks have a button to disable the camera (not to be mistaken
>>>>> with the mechanical cover). This is a standard GPIO linked to the
>>>>> camera via the ACPI table.
>>>>>
>>>>> 4 years ago we added support for this button in UVC via the Privacy control.
>>>>> This has three issues:
>>>>> - If the camera has its own privacy control, it will be masked.
>>>>> - We need to power-up the camera to read the privacy control gpio.
>>>>> - Other drivers have not followed this approach and have used evdev.
>>>>>
>>>>> We tried to fix the power-up issues implementing "granular power
>>>>> saving" but it has been more complicated than anticipated...
>>>>>
>>>>> This patchset implements the Privacy GPIO as a evdev.
>>>>>
>>>>> The first patch of this set is already in Laurent's tree... but I
>>>>> include it to get some CI coverage.
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>> Changes in v3:
>>>>> - CodeStyle (Thanks Sakari)
>>>>> - Re-implement as input device
>>>>
>>>> Thank you for your enthusiasm for my suggestion to implement this
>>>> as an input device.
>>>
>>> I wanted to give it a try... and it turned out to be quite simple to
>>> implement. I thought it could be a good idea to share it, so we can
>>> have something tangible to talk about ;).
>>>
>>>> As I mentioned in my reply in the v2 thread, the goal of my
>>>> enumeration of various way camera privacy-controls are exposed to
>>>> userspace today is to try and get everyone to agree on a single
>>>> userspace API for this.
>>>>
>>>> Except for this v3 patch-set, which I take as an implied vote
>>>> from you (Ricardo) for the evdev SW_CAMERA_LENS_COVER approach,
>>>> we have not heard anything on this subject from Sakari or Laurent
>>>> yet. So for now I would like to first focus on / circle back to
>>>> the userspace API discussion and then once we have a plan for
>>>> the userspace API we can implement that for uvcvideo.
>>>>
>>>> First lets look at the API question top down, iow what use-cases
>>>> do we expect there to be for information about the camera-privacy
>>>> switch state:
>>>>
>>>> a) Having an app which is using (trying to use) the camera show
>>>> a notification to the user that the camera is turned-off by
>>>> a privacy switch .
>>>>
>>>> Ricardo, AFAICT this is the main use-case for chrome-os, do I have
>>>> this right ?
>>>
>>> b) is as important as a) for us.  If you do not give instant feedback
>>> to the user when they change the status of the camera they might not
>>> be able to find the button later on :)
>>
>> How do you handle cameras that suffer from
>> UVC_QUIRK_PRIVACY_DURING_STREAM ?
> 
> For those b) does not work.

I already suspected as much, but it is good to have this
confirmed.

I'm afraid that from a userspace API pov cameras with a GPIO
which only works when powered-on need to be treated the same as
cameras which only have UVC_CT_PRIVACY_CONTROL IOW in this case
keep exporting V4L2_CID_PRIVACY instead of switching to evdev
with SW_CAMERA_LENS_COVER.

Unfortunately this will make the GPIO handling code in the UVC
driver somewhat more involved since now we have both uAPI-s for
GPIOs depending on UVC_QUIRK_PRIVACY_DURING_STREAM.

But I think that this makes sense, this way we end up offering
2 uAPIs depending on the hw capabilities:

1. evdev with SW_CAMERA_LENS_COVER which always reports a reliable
state + events on the state changing without needing to power-up
the camera.

2. V4L2_CID_PRIVACY for the case where the camera needs to be
powered-on (/dev/video opened) and where the ctrl possibly needs
to be polled.

Assuming we can all agree on this split based on hw capabilities
I think that we must document this somewhere in the media subsystem
documentation. We can then also write down there that
SW_CAMERA_LENS_COVER only applies to internal cameras.

>>>> b) Showing on on-screen-display (OSD) with a camera /
>>>> crossed-out-camera icon when the switch is toggled, similar to how
>>>> muting speakers/mic show an OSD . Laptop vendor Windows add-on
>>>> software does this and I know that some users have been asking
>>>> for this.
>>>>
>>>> Then lets look at the question bottom-up which hardware interfaces
>>>> do we have exposing this information:
>>>>
>>>> 1. Internal UVC camera with an input privacy GPIO resource in
>>>> the ACPI fwnode for the UVC camera, with the GPIO reporting
>>>> the privacy-switch state. Found on some chrome-books
>>
>> Ricardo, is this found only in ACPI-based (x86) chromebooks, or also in
>> DT-based chromebooks ?
> 
> I am only aware of ACPI models using this feature today. But there
> might be DT devices in the future that will use this feature.
> AFAIK the code should support ACPI and DT.
> 
>>
>> Can we assume that the UVC module will not be powered off (and therefore
>> disappear from USB) when the privacy switch is toggled to disable the
>> camera ?
> 
> That is true today, but I cannot be sure that some vendor becomes
> creative and wire things in a weird way. We usually catch this things
> early in the process and solve them, but I cannot predict the future
> (yet :P)

FWIW note that dropping the UVC module of the bus is definitely
a thing on Windows laptops, but there the camera on/off events
are handled by the embedded-controller and reported through
some vendor WMI/ACPI interface rather then being handled by
the UVC driver.

So not really relevant to the discussion wrt the UVC driver,
but still good to keep in mind.

>>>> 2. Laptop firmware (EC/ACPI/WMI) which reports privacy-switch
>>>> state, without a clear 1:1 relation between the reported state and
>>>> which camera it applies to. In this case sometimes the whole UVC
>>>> camera module (if it is UVC) is simply dropped of the bus when
>>>> the camera is disabled through the privacy switch, removing
>>>> the entire /dev/video# node for the camera. Found on many windows
>>>> laptops.
>>>>
>>>> 3. UVC cameras which report privacy-switch status through
>>>> a UVC_CT_PRIVACY_CONTROL. Found on ... ?
>>>
>>> Some logitech cameras and also internal ones.
>>>
>>>> Note this will only work while the camera is streaming and
>>>> even then may require polling of the ctrl because not all
>>>> cameras reliably send UVC status messages when it changes.
>>>> This renders this hardware interface as not usable
>>
>> In general I agree, but maybe the situation is better with the UVC
>> cameras that implement UVC_CT_PRIVACY_CONTROL ?
>>
>> Note that, in theory, and as far as I understand, it should be possible
>> to get the UVC_CT_PRIVACY_CONTROL events when the camera is not
>> streaming, if the device implement remote wakeup. In practice that's
>> hardly ever the case, among the ~450 sets of USB descriptors I've
>> collected over time, only 8 report support for remote wakeup in the
>> configuration descriptor's bmAttributes field, and I'm not even sure we
>> could trust those devices to implement this feature correctly.
> 
> I would bet that they simply copied the descriptor from another
> project and did not test it.
> 
>>
>> Ricardo, do you know if the internal UVC cameras used in chromebooks
>> that implement UVC_CT_PRIVACY_CONTROL support remote wakeup to notify
>> changes in the privacy control when the camera is suspended ?
> 
> Today we only rely on the gpio privacy.
> 
> Some camera vendors even emulate the control:
> Instead of having a gpio and a sensor, they look at the frame and if
> it is very dark, they zero it out completely and set
> UVC_CT_PRIVACY_CONTROL to 1.

My 2 cents here are that given the wide variety of hardware that
even if some hw reliably provides status interrupts for
UVC_CT_PRIVACY_CONTROL we cannot rely on that and we certainly
cannot rely on remote wakeup being present *and* reliabe.

So I really think that for UVC_CT_PRIVACY_CONTROL we should
stick with V4L2_CID_PRIVACY.

>>>> Currently there are 2 ways this info is being communicated
>>>> to userspace, hw-interfaces 1. + 3. are exposed as a v4l2
>>>> privacy-ctrl where as hw-if 2. uses and input evdev device.
>>>>
>>>> The advantage of the v4l2 privacy-ctrl is that it makes it
>>>> very clear which camera is controlled by the camera
>>>> privacy-switch.
>>>>
>>>> The disadvantage is that it will not work for hw-if 2,
>>>> because the ACPI / WMI drivers have no v4l2 device to report
>>>> the control on. We could try to add some magic glue code,
>>>> but even then with e.g. IPU6 cameras it would still be
>>>> unclear which v4l2(sub)device we should put the control on
>>>> and if a UVC camera is just dropped from the bus there is
>>>> no /dev/video# device at all.
>>
>> Is there any ACPI- or WMI-provided information that could assist with
>> associating a privacy GPIO with a camera ?
>>
>>>> Using an input device does not has this disadvantage and
>>>> it has the advantage of not requiring to power-up the camera
>>>> as currently happens with a v4l2 ctrl on a UVC camera.
>>
>> API-wise, and with the current uvcvideo implementation, I agree. We
>> could of course also try to improve the uvcvideo driver to not power the
>> device unless it is streaming (depending on whether or not the known
>> drawbacks are considered acceptable).
>>
>> Devices in the 3rd category will still need to be powered up to report
>> the status of the privacy control, as well as some devices in the 1st
>> category (see patch 8/8 in this series that introduces
>> UVC_QUIRK_PRIVACY_DURING_STREAM).
>>
>>>> But using an input device makes it harder to determine
>>>> which camera the privacy-switch applies to.
>>
>> We could include the evdev in the MC graph. That will of course only be
>> possible if the kernel knows about that association in the first place.
>> At least the 1st category of devices would benefit from this.

Yes I was thinking about adding a link to the MC graph for this too.

Ricardo I notice that in this v3 series you still create a v4l2-subdev
for the GPIO handling and then add an ancillary link for the GPIO subdev
to the mc-graph. But I'm not sure how that is helpful. Userspace would
still need to do parent matching, but then match the evdev parent to
the subdev after getting the subdev from the mc. In that case it might
as well look at the physical (USB-interface) parent of the MC/video
node and do parent matching on that avoiding the need to go through
the MC at all.

I think using the MC could still be useful by adding a new type of
ancillary link to the MC API which provides a file-path as info to
userspace rather then a mc-link and then just directly provide
the /dev/input/event# path through this new API?

I guess that extending the MC API like this might be a bit of
a discussion. But it would already make sense to have this for
the existing input device for the snapshot button.

>>>> We can specify
>>>> that SW_CAMERA_LENS_COVER only applies to device internal
>>>> cameras, but then it is up to userspace to determine which
>>>> cameras that are.
>>>
>>> I am working on wiring up this to userspace right now.. I will report
>>> back if it cannot do it.

Ricardo, great, thank you!

>>>> Another problem with using an input device is that it will
>>>> not work for "UVC cameras which report privacy-switch status
>>>> through a UVC_CT_PRIVACY_CONTROL." since those need the camera
>>>> on and even then need to be polled to get a reliable reading.
>>>>
>>>> Taking this all into account my proposal would be to go
>>>> with an input device and document that SW_CAMERA_LENS_COVER
>>>> only applies to device internal cameras.
>>>>
>>>> This should work well for both use-cases a) and b) described
>>>> above and also be easy to support for both hw interfaces
>>>> 1. and 2.
>>>>
>>>> My proposal for hw-if 3. (UVC_CT_PRIVACY_CONTROL) would be
>>>> to keep reporting this as V4L2_CID_PRIVACY. This means it
>>>> will not work out of the box for userspace which expects
>>>> the input device method, but giving the limitations of
>>>> this hw interface I think that requiring userspace to have
>>>> to explicitly support this use-case (and e.g. poll the
>>>> control) is a good thing rather then a bad thing.
>>>>
>>>> Still before moving forward with switching the hw-if 1.
>>>> case to an input device as this patch-series does I would
>>>> like to hear input from others.
>>>>
>>>> Sakari, Laurent, any comments ?
>>
>> Assuming the kernel could report the association between an evdev and
>> camera, we would need to report which evdev SW_CAMERA_LENS_COVER
>> originates from all the way from the evdev to the consumer of the event.
>> How well is that supported in standard Linux system architectures ? If
>> I'm not mistaken libinput will report the originating device, but how
>> far up the stack is it propagated ? And which component would we expect
>> to consume those events, should the camera evdev be managed by e.g.
>> libcamera ?

Good questions. Looking back at our 2 primary use-cases:

a) Having an app which is using (trying to use) the camera show
a notification to the user that the camera is turned-off by
a privacy switch.

b) Showing on on-screen-display (OSD) with a camera /
crossed-out-camera icon when the switch is toggled, similar to how
muting speakers/mic show an OSD. Laptop vendor Windows add-on
software does this and I know that some users have been asking
for this.

I think we have everything to do b) in current compositors
like gnome-shell. Using an evdev with SW_CAMERA_LENS_COVER
would even be a lot easier for b) then the current
V4L2_CID_PRIVACY API.

a) though is a lot harder. We could open up access to
the relevant /dev/input/event# node using a udev uaccess
tag so that users who can access /dev/video# nodes also
get raw access to that /dev/input/event# node and then
libcamera could indeed provide this information that way.
I think that is probably the best option.

At least for the cases where the camera on/off switch
does not simply make the camera completely disappear.

That case is harder. atm that case is not handled at all
though. So even just getting b) to work for that case
would be nice / an improvement.

Eventually if we give libcamera access to event#
nodes which advertise SW_CAMERA_LENS_COVER (and no other
privacy sensitive information) then libcamera could even
separately offer some API for apps to just get that value
if there is no camera to associate it with.

Actually thinking more about it libcamera probably might
be the right place for some sort of "no cameras found
have you tried hitting your camera privacy-switch" API.
That is some API to query if such a message should be
shown to the user. But that is very much future work.

Regards,

Hans




