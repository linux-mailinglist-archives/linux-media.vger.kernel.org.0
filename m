Return-Path: <linux-media+bounces-22107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 190209D9C34
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD57C2830FF
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23311DC720;
	Tue, 26 Nov 2024 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hKjVGJ+N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F81DB52D
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641183; cv=none; b=PyjlVvf6lkMRrRdtcJtmQY9GR1xemE3U6uOgfLNz2QAI98ntYQv6Xe47ApUPxQ/Mr1icYZdkVenquZxN20elOG1uKeRo88goxjLWHRCmsZ+xe6BJB1VfhxWlUwniNgImJTcFyF/tcYN101jM4FPn3/7ty06jWefP3XOJjo8deds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641183; c=relaxed/simple;
	bh=qxoO3tvBuQwZZF9s98gg9knZUe+ZLIzvTjZCizy8si8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbhP3LGIMrlXiBnCwPg93nCDxpLmIddt1B5jRpY/ajHamJWzBk1eNA0CIsrbUALjOuPIMkLtRi5Nvi18rV2+T+kqYr/0wbu3BafAwrMsBxOmQhiU8OUA9rGtzAxVWWpdCFkD2nbwxwPSB1lSNifJZU2pE/Q5jpvT4gFN/ZIj+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hKjVGJ+N; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7251d20e7f2so1160476b3a.0
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732641181; x=1733245981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTG01zGWgr5O6SvTZ8H+vvf1z7ySIbUUzWK9jPJkjGs=;
        b=hKjVGJ+NhgDvPGRNSQuGNk/Q77Qn4aBMlTaxkeTSZlPizeV/ICUQnmbAqXsAD2R2KV
         jFTIhq7sAuUtjacZwP5nFSJ4ctrqx4HJZRDx1vSJSrvSYGZlEQfzCmOo0rkXq49rYnIy
         QuU4FuryuXSaVmj34xhp5bnzNEG2Ez9UnBbK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732641181; x=1733245981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTG01zGWgr5O6SvTZ8H+vvf1z7ySIbUUzWK9jPJkjGs=;
        b=TunLNqf1s0Opf5CdC8G7qohogdCHVgmFoHd0BI5XjqVZdfY2xm+2biL2Z5DeCZIz6l
         MZXUivhRDDu0aaKwqaY7j/GQiUwTKNU1aU9ZEJSoQVr/QbcsC2l+vxvWI5tSpsf7H0ih
         ol84yIB5TcRdyWqDji/YTQIj7eRiIzWviIf6qD+z8VN6k574GrRoPsO14d8YSDXYsxWD
         mVVmzZBSDxyWzuOhHdrz/hFtE/onh+wLRlkLNF2f/RDa3Ns3YBnAnB7ddvhxBxonhGGR
         C9JEUMLoDuhFkq1upIXUDbvGXpxcnJ0jN48oe5fP9NVkIuOPxSi9oxNnUjuPuG+6Y9x+
         IItg==
X-Forwarded-Encrypted: i=1; AJvYcCU7I4gysYxXfXjh9YqWKVl3sdxCOXLu96pJGgDMC0xAaMsOwfv+NyvSepMpp9WiqYBVUkwnKCHhQCBQjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQscVV2HaXKv911I/Jlw7M3jv0igt6zi0f6O3kZCxUrmCFzpcS
	0C/Df+CuP5IjL1q8GDV4HhdhexWEgBy/JNuM8wjvs4ZziIfP3HvGx7ik7SmXxuMjSHU7iNBDS2k
	=
X-Gm-Gg: ASbGncvCWAKnJuyYY8HY1fP4It8thGz18IQThgFwy/KWGei6kcJWahFRlOKiNGjNB4A
	a9em3gRkdVeNR4rep2u9Je1qrVPHEQ5odWk+Mq4tB0X3IryBpO3XUdSaLyziRblpvSK59CqYFKa
	H+ywr41n1tW6rTYLDOQsO+WUmG2Qfn7LdFoL8Rq020Rj6SozoTiT0e/LUVL1MYvLMK7vMg67DOF
	LT2+w4pRY98rdZamAyl7OzIvn0AxxxA2EHhM95WM3GMraxPB0O7qGjgpfsNRTL4WKVXzPlv63Sb
	8TZK6SU6cJ4XMQPY
X-Google-Smtp-Source: AGHT+IFBOUzh0MbpSwqHtQXA9ijJHtOEddehiffbCEPM6wHAg/b5RKCPgSWYlTDoS5hM04d6yoH3fg==
X-Received: by 2002:a17:902:ec88:b0:20c:9d8d:1f65 with SMTP id d9443c01a7336-2129fd2198amr258390785ad.30.1732641180667;
        Tue, 26 Nov 2024 09:13:00 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc2ab8csm86650875ad.277.2024.11.26.09.12.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 09:13:00 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso4844614b3a.3
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 09:12:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWluoz7Uzw/bvuQeH88kAW2ZFV7q499LOz0MzgoYu+/4HjsRtV1eR0eVXjvhgtEA2uQINMFE8bE0a6Lpw==@vger.kernel.org
X-Received: by 2002:a05:6a00:a38f:b0:724:ed8f:4d35 with SMTP id
 d2e1a72fcca58-724ed8f4d70mr19724084b3a.26.1732641178069; Tue, 26 Nov 2024
 09:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com> <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
 <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com> <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
 <5a199058-edab-4f9d-9e09-52305824f3bf@redhat.com> <20241125131428.GD32280@pendragon.ideasonboard.com>
 <233eaf78-49f1-43c1-b320-c75cfc04103f@redhat.com> <20241125213521.GV19381@pendragon.ideasonboard.com>
 <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com> <20241126165049.GH5461@pendragon.ideasonboard.com>
In-Reply-To: <20241126165049.GH5461@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 18:12:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCu2FJiJP+e+gjWySQRUkKUxXYv2C70kRct2io7yetY56Q@mail.gmail.com>
Message-ID: <CANiDSCu2FJiJP+e+gjWySQRUkKUxXYv2C70kRct2io7yetY56Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a evdev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Nov 2024 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Nov 26, 2024 at 05:27:57PM +0100, Ricardo Ribalda wrote:
> > On Mon, 25 Nov 2024 at 22:35, Laurent Pinchart wrote:
> > > On Mon, Nov 25, 2024 at 03:41:19PM +0100, Hans de Goede wrote:
> > > > On 25-Nov-24 2:14 PM, Laurent Pinchart wrote:
> > > > > On Mon, Nov 25, 2024 at 01:01:14PM +0100, Hans de Goede wrote:
> > > > >> On 18-Nov-24 5:47 PM, Ricardo Ribalda wrote:
> > > > >>> On Mon, 18 Nov 2024 at 16:43, Hans de Goede wrote:
> > > > >>>> On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
> > > > >>>>> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > > >
> > > > <snip>
> > > >
> > > > >>>>>> Is there any ACPI- or WMI-provided information that could as=
sist with
> > > > >>>>>> associating a privacy GPIO with a camera ?
> > > > >>
> > > > >> I just realized I did not answer this question from Laurent
> > > > >> in my previous reply.
> > > > >>
> > > > >> No unfortunately there is no ACPI- or WMI-provided information t=
hat
> > > > >> could assist with associating ACPI/WMI camera privacy controls w=
ith
> > > > >> a specific camera. Note that these are typically not exposed as =
a GPIO,
> > > > >> but rather as some vendor firmware interface.
> > > > >>
> > > > >> Thinking more about this I'm starting to believe more and more
> > > > >> that the privacy-control stuff should be handled by libcamera
> > > > >> and then specifically by the pipeline-handler, with some helper
> > > > >> code to share functionality where possible.
> > > > >>
> > > > >> E.g. on IPU6 equipped Windows laptops there may be some ACPI/WMI
> > > > >> driver which provides a /dev/input/event# SW_CAMERA_LENS_COVER n=
ode.
> > > > >
> > > > > Using an event device means that the user would need permissions =
to
> > > > > access it. Would distributions be able to tell the device apart f=
rom
> > > > > other event devices such as mouse/keyboard, where a logged user m=
ay not
> > > > > have permission to access all event devices in a multi-seat syste=
m ?
> > > >
> > > > input events modaliases contain a lot of info, including what sort
> > > > of events they report, e.g. :
> > > >
> > > > [hans@shalem uvc]$ cat /sys/class/input/input36/modalias
> > > > input:b0003v046Dp405Ee0111-e0,1,2,3,4,11,14,k71,72,73,74,75,77,78,7=
9,7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8E,8F,90,96,98,9=
B,9C,9E,9F,A1,A3,A4,A5,A6,A7,A8,A9,AB,AC,AD,AE,B0,B1,B2,B3,B4,B5,B6,B7,B8,B=
9,BA,BB,BC,BD,BE,BF,C0,C1,C2,CC,CE,CF,D0,D1,D2,D4,D8,D9,DB,DF,E0,E1,E4,E5,E=
6,E7,E8,E9,EA,EB,F0,F1,F4,100,110,111,112,113,114,115,116,117,118,119,11A,1=
1B,11C,11D,11E,11F,161,162,166,16A,16E,172,174,176,177,178,179,17A,17B,17C,=
17D,17F,180,182,183,185,188,189,18C,18D,18E,18F,190,191,192,193,195,197,198=
,199,19A,19C,1A0,1A1,1A2,1A3,1A4,1A5,1A6,1A7,1A8,1A9,1AA,1AB,1AC,1AD,1AE,1A=
F,1B0,1B1,1B7,1BA,240,241,242,243,244,245,246,247,248,249,24A,24B,24C,24D,2=
50,251,260,261,262,263,264,265,r0,1,6,8,B,C,a20,m4,l0,1,2,3,4,sfw
> > > >
> > > > So I believe that we can create a udev rule which matches on input
> > > > devices with SW_CAMERA_LENS_COVER functionality and set a uaccess
> > > > tag on those just like it is done for /dev/video# nodes.
> > > >
> > > > Or we can just use a specific input-device-name (sub) string
> > > > and match on that.
> > > >
> > > > This may require using a separate input_device with just
> > > > the SW_CAMERA_LENS_COVER functionality in some of the laptop
> > > > ACPI / WMI drivers, but that is an acceptable compromise IMHO.
> > >
> > > As long as it's doable I'm OK with it.
> > >
> > > > (we don't want to report privacy sensitive input events on
> > > > these nodes to avoid keylogging).
> > > >
> > > > > Would compositors be able to ignore the device to let libcamera h=
andle
> > > > > it ?
> > > >
> > > > input devices can be opened multiple times and we want the composit=
or
> > > > to also open it to show camera on/off OSD icons / messages.
> > >
> > > I'm not sure we want that though, as the event should be associated w=
ith
> > > a particular camera in messages. It would be better if it still went
> > > through libcamera and pipewire.
> >
> > For OSD we do not necessarily need to know what camera the GPIO is
> > associated with.
> >
> > We just want to give instant feedback about a button on their device.
> > Eg in ChromeOS we just say: "camera off" not "user facing camera off"
>
> That may be true of Chrome OS, but in general, other systems may want to
> provide more detailed information. I wouldn't model the API and
> architecture just on Chrome OS.

It is not about ChromeOS, it is about the use case.

We were talking about 2 usecases:
- instant feedback for a button. Actor: OSD / composer
- this camera is disabled, please use other camera or enable it: Actor
camera app, or camera "service" (read pipewire, libcamera, or the
permission handler for snap)

There are some examples showing that for "instant feedback" there is
no need to link the event to the camera:
- there is hardware where this is not possible to establish the link.
- ChromeOS does not show the camera name (when it has enough
information to do so)
- I believe Hans mentioned that Windows does not show the camera name.
- (Hans, are you wiring SW_CAMERA_LENS_COVER to the user right now?)
Do you know of a system where this info is needed?

My problem is that I do not see where libcamera fits for the "instant
feedback" usecase:
- libcamera will be running as a service and telling the UI that the
camera is disabled? how will it communicate with the OS?
- the OS will run a "libcamera helper" every second to get the switch
status for every camera?
- the OS will wait for an input event and run a "libcamera helper" to
find the correlation with the camera?

I think it is simpler that the OS just waits for an
SW_CAMERA_LENS_COVER event and display "camera off". The same way it
waits for "caps lock" today

In any case:
-  for uvc, it seems like it is easy to go from evdev to videodev (and
the other way around). Check my previous email
- udev seems to have a lot of information about the evdev to configure
the permissions in a way that cover most (all?) of the
usecases/architectures


>
> > > > If opened multiple times all listeners will get the events.
> > > >
> > > > >>>>>> We could include the evdev in the MC graph. That will of cou=
rse only be
> > > > >>>>>> possible if the kernel knows about that association in the f=
irst place.
> > > > >>>>>> At least the 1st category of devices would benefit from this=
.
> > > > >>>>
> > > > >>>> Yes I was thinking about adding a link to the MC graph for thi=
s too.
> > > > >>>>
> > > > >>>> Ricardo I notice that in this v3 series you still create a v4l=
2-subdev
> > > > >>>> for the GPIO handling and then add an ancillary link for the G=
PIO subdev
> > > > >>>> to the mc-graph. But I'm not sure how that is helpful. Userspa=
ce would
> > > > >>>> still need to do parent matching, but then match the evdev par=
ent to
> > > > >>>> the subdev after getting the subdev from the mc. In that case =
it might
> > > > >>>> as well look at the physical (USB-interface) parent of the MC/=
video
> > > > >>>> node and do parent matching on that avoiding the need to go th=
rough
> > > > >>>> the MC at all.
> > > > >>>>
> > > > >>>> I think using the MC could still be useful by adding a new typ=
e of
> > > > >>>> ancillary link to the MC API which provides a file-path as inf=
o to
> > > > >>>> userspace rather then a mc-link and then just directly provide
> > > > >>>> the /dev/input/event# path through this new API?
> > > > >
> > > > > I don't think we need that. MC can model any type of entity and r=
eport
> > > > > the device major:minor. That plus ancillary links should give us =
most of
> > > > > what we need, the only required addition should be a new MC entit=
y
> > > > > function.
> > > >
> > > > Ah interesting yes that should work nicely.
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

