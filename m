Return-Path: <linux-media+bounces-22105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133D9D9B87
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59EE3B24000
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6659E1D89ED;
	Tue, 26 Nov 2024 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hNZHBOEP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2C1D79A5
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638494; cv=none; b=hLOJ27Gck4OXTVWgZ1n66oLMpWp3olOnAOmBxVwLaaOLWP5SjOK0oSa3+hTYsl+U1+vcslX4p8A3P40LMFYkWyp4V4lcUh+8XplBfYlazzHjmYYc4qjJzHpWc1oIp21C+VLKJcta2bZt4R7gGgxvBEFtuBTZ2VdOgS7stOolPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638494; c=relaxed/simple;
	bh=/VFh394bqpoPVPaVYrZD7casHaZGYWi9G0Bs0UrwOhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiGkCx8q0tcCJnrmAK6AOttJPi4zBqZI9iKvsLUj80FCu8DGhjhJpKEA7wqWogSHwXz1I4/cv1OuWsDovPhZb1QESY/P2YprTJKPl1K2wr5K5VDYxYWFxik5mEpGr0h9BbFc2x68lAJYiFSws28hz9/3o6vSD4enDc1CkMsyVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hNZHBOEP; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7d4fb2cd1ecso161294a12.0
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638492; x=1733243292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VFh394bqpoPVPaVYrZD7casHaZGYWi9G0Bs0UrwOhs=;
        b=hNZHBOEP9pOES91PMQz+vaLcGN+STMP3MgflYC0MLr5XxjUy0agk80ApNXka0kXg4x
         bNx520+tvjiFLMhm7u7WJVKfMYnw2VsXCp3hbVm+sga2r7IKz5clfFNTiLBaEmwwcQR8
         wGCXj2+i1mRNzC9VzS6kgORCLLXune/sFOnvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638492; x=1733243292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VFh394bqpoPVPaVYrZD7casHaZGYWi9G0Bs0UrwOhs=;
        b=SGF5jed3qfBdlXYj8nTk2AgRHEJbHI3rggMnSCR5MlJP27aIx1zMmR4kva0GH/fYtT
         M5IWIQd3jbeOVHlzhhfwKB3jBWihQcNKm670BPATZYuEUjnjbA1D0Cfvn7xP0qA55/r1
         ArlI71p3XUBJ0m+V4GyhDyOv/NGsUesZCiggnZk2Q3ZtxS1ehRXind9SDRD7/whxtzTC
         UJjxVi2QApE+rjj6tbQdSQr1rcwO1PeKAxlfZo1CRN72l2oydnwS3dcBPo6/UZiaRNVe
         Mq7RMTAxuH9DA6pWmyR02u38Ir3zEISJlLU5BmA6LN5lquN1NBdayxtB7GDWUtbupyYS
         fIqA==
X-Forwarded-Encrypted: i=1; AJvYcCXM3qr2YRg8JEaZSMuhL10pht8QovrpI2agyMNeus+I2X3hSv/Ba05aZ/rRihP38eFs9r/WpM7YiaaImg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycurOryDwe6Rq6I0+MhR5p1ICaOoymIzuAqNcJIG73lYFs71F/
	Kunv1G7mbRKFKmYvAwj4wVOHv5b0oFJekm5yS3miRIAdo4sKi8iurCKBmjzgu841jbUgORWebBI
	=
X-Gm-Gg: ASbGncui2IItb09RoLeB8T2hPejoDzCzzFiwS+R0V3RCauo4B+f2wDxehaa7r4sunxx
	dvx1PM6Xqfh43e4H0pKbA6dUU+zRJ9/Y20oAM5uzoXf/0/Odmsp5/GKGory831At06k0OcUzOZC
	8jkgO9tBa4ZXWSxOUXPNEjq+HmlQLunSns0Kxw/0Zx3T1C/0pOEyG9u6csUD8IN08oeJVIJCNwk
	6mzPRqG/iktA/HiYbXRebEmdGORJfpfBeM45u8IMeYZYjT3B98Fww3Bcjhpq1DIjFCYCnlwyTLv
	y/qdn8Ps+1Eq
X-Google-Smtp-Source: AGHT+IHaA2kG7qm3JqLOhy5MAODje1/FhE2eMKG3kF72jRbbcBQ4NjfIKZT6EBB+qZ3GeK7XeZKFng==
X-Received: by 2002:a17:90b:2ecd:b0:2ea:5823:c150 with SMTP id 98e67ed59e1d1-2eb0e8660b8mr22034749a91.30.1732638492396;
        Tue, 26 Nov 2024 08:28:12 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead0334b2csm12562383a91.24.2024.11.26.08.28.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 08:28:11 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ea68cd5780so4920497a91.3
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:28:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5FA5yAzCQbgtKYSpfvwcCQbp+uP0r/8bvLSd/F4DlEMvR7wgyvdP8TL1AheBG/s9MGynPk3bTIjVrDg==@vger.kernel.org
X-Received: by 2002:a17:90b:1a8c:b0:2ea:65a1:9861 with SMTP id
 98e67ed59e1d1-2eb0e8856ebmr21070959a91.37.1732638490136; Tue, 26 Nov 2024
 08:28:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <bd68178f-1de9-491f-8209-f67065d29283@redhat.com> <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com> <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
 <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com> <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
 <5a199058-edab-4f9d-9e09-52305824f3bf@redhat.com> <20241125131428.GD32280@pendragon.ideasonboard.com>
 <233eaf78-49f1-43c1-b320-c75cfc04103f@redhat.com> <20241125213521.GV19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125213521.GV19381@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 17:27:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com>
Message-ID: <CANiDSCvfnNKG8KUQEeBsr3JhWjUE+nBr4BTaR-sfaQQV9ZqSwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a evdev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Nov 2024 at 22:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Nov 25, 2024 at 03:41:19PM +0100, Hans de Goede wrote:
> > Hi,
> >
> > On 25-Nov-24 2:14 PM, Laurent Pinchart wrote:
> > > On Mon, Nov 25, 2024 at 01:01:14PM +0100, Hans de Goede wrote:
> > >> On 18-Nov-24 5:47 PM, Ricardo Ribalda wrote:
> > >>> On Mon, 18 Nov 2024 at 16:43, Hans de Goede wrote:
> > >>>> On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
> > >>>>> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> >
> > <snip>
> >
> > >>>>>> Is there any ACPI- or WMI-provided information that could assist=
 with
> > >>>>>> associating a privacy GPIO with a camera ?
> > >>
> > >> I just realized I did not answer this question from Laurent
> > >> in my previous reply.
> > >>
> > >> No unfortunately there is no ACPI- or WMI-provided information that
> > >> could assist with associating ACPI/WMI camera privacy controls with
> > >> a specific camera. Note that these are typically not exposed as a GP=
IO,
> > >> but rather as some vendor firmware interface.
> > >>
> > >> Thinking more about this I'm starting to believe more and more
> > >> that the privacy-control stuff should be handled by libcamera
> > >> and then specifically by the pipeline-handler, with some helper
> > >> code to share functionality where possible.
> > >>
> > >> E.g. on IPU6 equipped Windows laptops there may be some ACPI/WMI
> > >> driver which provides a /dev/input/event# SW_CAMERA_LENS_COVER node.
> > >
> > > Using an event device means that the user would need permissions to
> > > access it. Would distributions be able to tell the device apart from
> > > other event devices such as mouse/keyboard, where a logged user may n=
ot
> > > have permission to access all event devices in a multi-seat system ?
> >
> > input events modaliases contain a lot of info, including what sort
> > of events they report, e.g. :
> >
> > [hans@shalem uvc]$ cat /sys/class/input/input36/modalias
> > input:b0003v046Dp405Ee0111-e0,1,2,3,4,11,14,k71,72,73,74,75,77,78,79,7A=
,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8E,8F,90,96,98,9B,9C=
,9E,9F,A1,A3,A4,A5,A6,A7,A8,A9,AB,AC,AD,AE,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA=
,BB,BC,BD,BE,BF,C0,C1,C2,CC,CE,CF,D0,D1,D2,D4,D8,D9,DB,DF,E0,E1,E4,E5,E6,E7=
,E8,E9,EA,EB,F0,F1,F4,100,110,111,112,113,114,115,116,117,118,119,11A,11B,1=
1C,11D,11E,11F,161,162,166,16A,16E,172,174,176,177,178,179,17A,17B,17C,17D,=
17F,180,182,183,185,188,189,18C,18D,18E,18F,190,191,192,193,195,197,198,199=
,19A,19C,1A0,1A1,1A2,1A3,1A4,1A5,1A6,1A7,1A8,1A9,1AA,1AB,1AC,1AD,1AE,1AF,1B=
0,1B1,1B7,1BA,240,241,242,243,244,245,246,247,248,249,24A,24B,24C,24D,250,2=
51,260,261,262,263,264,265,r0,1,6,8,B,C,a20,m4,l0,1,2,3,4,sfw
> >
> > So I believe that we can create a udev rule which matches on input
> > devices with SW_CAMERA_LENS_COVER functionality and set a uaccess
> > tag on those just like it is done for /dev/video# nodes.
> >
> > Or we can just use a specific input-device-name (sub) string
> > and match on that.
> >
> > This may require using a separate input_device with just
> > the SW_CAMERA_LENS_COVER functionality in some of the laptop
> > ACPI / WMI drivers, but that is an acceptable compromise IMHO.
>
> As long as it's doable I'm OK with it.
>
> > (we don't want to report privacy sensitive input events on
> > these nodes to avoid keylogging).
> >
> > > Would compositors be able to ignore the device to let libcamera handl=
e
> > > it ?
> >
> > input devices can be opened multiple times and we want the compositor
> > to also open it to show camera on/off OSD icons / messages.
>
> I'm not sure we want that though, as the event should be associated with
> a particular camera in messages. It would be better if it still went
> through libcamera and pipewire.

For OSD we do not necessarily need to know what camera the GPIO is
associated with.

We just want to give instant feedback about a button on their device.
Eg in ChromeOS we just say: "camera off" not "user facing camera off"


>
> > If opened multiple times all listeners will get the events.
> >
> > >>>>>> We could include the evdev in the MC graph. That will of course =
only be
> > >>>>>> possible if the kernel knows about that association in the first=
 place.
> > >>>>>> At least the 1st category of devices would benefit from this.
> > >>>>
> > >>>> Yes I was thinking about adding a link to the MC graph for this to=
o.
> > >>>>
> > >>>> Ricardo I notice that in this v3 series you still create a v4l2-su=
bdev
> > >>>> for the GPIO handling and then add an ancillary link for the GPIO =
subdev
> > >>>> to the mc-graph. But I'm not sure how that is helpful. Userspace w=
ould
> > >>>> still need to do parent matching, but then match the evdev parent =
to
> > >>>> the subdev after getting the subdev from the mc. In that case it m=
ight
> > >>>> as well look at the physical (USB-interface) parent of the MC/vide=
o
> > >>>> node and do parent matching on that avoiding the need to go throug=
h
> > >>>> the MC at all.
> > >>>>
> > >>>> I think using the MC could still be useful by adding a new type of
> > >>>> ancillary link to the MC API which provides a file-path as info to
> > >>>> userspace rather then a mc-link and then just directly provide
> > >>>> the /dev/input/event# path through this new API?
> > >
> > > I don't think we need that. MC can model any type of entity and repor=
t
> > > the device major:minor. That plus ancillary links should give us most=
 of
> > > what we need, the only required addition should be a new MC entity
> > > function.
> >
> > Ah interesting yes that should work nicely.
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

