Return-Path: <linux-media+bounces-21207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3679C2DF4
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 15:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D66C282884
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 14:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B3A199248;
	Sat,  9 Nov 2024 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ANVYYxH8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AB0198A22
	for <linux-media@vger.kernel.org>; Sat,  9 Nov 2024 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731164284; cv=none; b=tBkB1gyZoshUMIp6c6C3DOuU1JMXRkoaTv1yf406TQdpInquhS7cjwGqLLDFkfxEYlUY5vH7NJSEgW/Wyc7t2h1T7HdXrZL1o3OpOyo46i87gt0Fvk+vVyi8iD8qvu2XMx1PV+Ml1uNLxSIk+hbeM8W17S78XCWVXmImTN+Kklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731164284; c=relaxed/simple;
	bh=oSnduhoBR156YusuARF8GO3Jne+e+yprCQZ54qkw2lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfkXBE/tx3a5ElpTHKtQQBH91QN4ZUIlQMYw4fMDqoRIBKoAw84Vjw4aRluTOol8OsVEM3rqrbaSOgBdpDSCtBJYDG8jfxU5s/djWEpCZJ59JVaL8djtAI3OZ0sCE1s6/mLanirl6VU2xGMiIDTrvHXnZ0kSlRrQIIvhiRkX2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ANVYYxH8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20e6981ca77so37166655ad.2
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2024 06:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731164281; x=1731769081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KfYz33uuEhgqRZQnurXoAB+cUCCPukFSgwJh3oWY/Og=;
        b=ANVYYxH8aJPnis0NlyLDoT8nRIA+uzdBrlG89/yyJtpCDR0TgAopVu5usIczvXRmAC
         3gyVET7A7mjbYASYPp94rQzH0YGJ94fP5G5tZCbq+xLtK67uE1gmJ7AOcPhSc0uX5CnB
         LJFZizucp7qJyyz4jm+l1g6ZjsTphBPQZEDWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731164281; x=1731769081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfYz33uuEhgqRZQnurXoAB+cUCCPukFSgwJh3oWY/Og=;
        b=FxN4yXjfXNcok0Uz6ngepbK/w7dgMm19QlV7eHyv0BTrngXLpmdlUKUqeuh83RQPbx
         GpTnglE5T6EkLoqkgRklipV9ymAmO3Thfo+vk91yjGiYXhhKLs7R+McWMdi3XUxUEnSo
         aYifLEeQ3IC/Ms7letBGSpuRDMi71gNGwbhJu8eNMsCdzlvywyi6dMFmkA0voly5ajVa
         RJXcFuZj/S+OLTalrskxaJ1mj6GQMMuMwBRM2WCT/tPLRxRRCklJ+C5JLVMrrqWCxSNJ
         PdIG3oX89DuLHnmzrxkfvDaSvU08vfbg2shPSQ4cYocIyLgWNd+dmnyQVQDlx3v3R6AZ
         S8tA==
X-Forwarded-Encrypted: i=1; AJvYcCWNLz3itsMRTwVqeUC1IjWlikl9E6lmYD41/dt2ISk4mriziC0fqYGSP6r44XSIu17VhebMfI8QK5hGrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkBNi1pbIPbjUvd3/OLeggyoT9DjWbwFcHVJYZUrhO4bIJh824
	lEO1ksfwOXAadsiZ72qmBWRgHKxBXhv2JTGufKm6wto4RufdlPGEKI5IjWPw1RzKXDGtYRJvI7g
	=
X-Google-Smtp-Source: AGHT+IEvHdHtdn09RQXN1LAGney9EQZaBStOBqzYhFPw5y+dvDMy2lBcZuFkTH9m69rjUuzis23XXg==
X-Received: by 2002:a17:90b:3bc7:b0:2e2:c64c:a1c9 with SMTP id 98e67ed59e1d1-2e9b1740f5bmr8912272a91.24.1731164281041;
        Sat, 09 Nov 2024 06:58:01 -0800 (PST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f52cacsm5441056a91.6.2024.11.09.06.57.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 06:58:00 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cdb889222so33752625ad.3
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2024 06:57:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV214j7bIGzmCgnr7MImsJa6HzHogYx8KXjZYDShJoYaEDwSI4V545jEZV5excWCcJZYVGToZvEXryUCg==@vger.kernel.org
X-Received: by 2002:a17:902:d482:b0:207:4c7c:743b with SMTP id
 d9443c01a7336-21183328fdcmr78600905ad.0.1731164279294; Sat, 09 Nov 2024
 06:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org> <20241109150420.359bd50f@foz.lan>
In-Reply-To: <20241109150420.359bd50f@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 9 Nov 2024 15:57:45 +0100
X-Gmail-Original-Message-ID: <CANiDSCtVqLp49OHHrTsd3+m+5TB0Z0McghkNR=paKvmDKh6pDw@mail.gmail.com>
Message-ID: <CANiDSCtVqLp49OHHrTsd3+m+5TB0Z0McghkNR=paKvmDKh6pDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Sat, 9 Nov 2024 at 15:05, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 08 Nov 2024 20:25:44 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > Some notebooks have a button to disable the camera (not to be mistaken
> > with the mechanical cover). This is a standard GPIO linked to the
> > camera via the ACPI table.
> >
> > 4 years ago we added support for this button in UVC via the Privacy control.
> > This has two issues:
> > - If the camera has its own privacy control, it will be masked
> > - We need to power-up the camera to read the privacy control gpio.
> >
> > We tried to fix the power-up issues implementing "granular power
> > saving" but it has been more complicated than anticipated....
> >
> > Last year, we proposed a patchset to implement the privacy gpio as a
> > subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> >
> > I think it is a pretty clean solution and makes sense to use a
> > subdevice for something that is a sub device of the camera :).
> >
> > This is an attempt to continue with that approach.
> >
> > Tested on gimble:
> > gimble-rev3 ~ # v4l2-ctl --all -d /dev/v4l-subdev0
>
> No matter if internally implemented as a subdevice or not,
> UVC is not a MC-centric device[1].
>
> It means that UVC can be compiled without media controller support,
> and that its functionality shall be visible via /dev/video* nodes.
>
> So, whatever internal implementation it is used, it shall not require
> config MEDIA_CONTROLLER and the control shall be visible via
> /dev/video*.
>
> Moving privacy control out of /dev/video would mean that this will break
> support for it on existing applications, which is a big nack. Now, it would
> be acceptable to have this visible via V4L2 and subdev APIs.

I have googled a bit, and it seems that the only users of this feature
is ChromeOS, so I do not expect any existing applications to be
impacted.

I can keep the old API, but that does not solve the issue when the
camera supports the privacy control and it is also attached to a GPIO.

I do not see a big requirement to depend on the MEDIA_CONTROLLER to
use the privacy GPIO. Remember that this feature is not part of the
camera itself, it is an external GPIO.

What about trying the subdevice approach, and if we break any app,
implement both APIs (legacy and subdevice)?

Please note that If a device has an internal Privacy control it will
still work via /dev/videoX.
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/glossary.html#term-MC-centric
>
> Regards,
> Mauro
>
> > Driver Info:
> >         Driver version   : 6.6.56
> >         Capabilities     : 0x00000000
> > Media Driver Info:
> >         Driver name      : uvcvideo
> >         Model            : HP 5M Camera: HP 5M Camera
> >         Serial           : 0001
> >         Bus info         : usb-0000:00:14.0-6
> >         Media version    : 6.6.56
> >         Hardware revision: 0x00009601 (38401)
> >         Driver version   : 6.6.56
> > Interface Info:
> >         ID               : 0x0300001d
> >         Type             : V4L Sub-Device
> > Entity Info:
> >         ID               : 0x00000013 (19)
> >         Name             : GPIO
> >         Function         : Unknown sub-device (00020006)
> >
> > Camera Controls
> >
> >                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only, volatile
> >
> > gimble-rev3 ~ # media-ctl  -p
> > Media controller API version 6.6.56
> >
> > Media device information
> > ------------------------
> > driver          uvcvideo
> > model           HP 5M Camera: HP 5M Camera
> > serial          0001
> > bus info        usb-0000:00:14.0-6
> > hw revision     0x9601
> > driver version  6.6.56
> >
> > Device topology
> > - entity 1: HP 5M Camera: HP 5M Camera (1 pad, 1 link)
> >             type Node subtype V4L flags 1
> >             device node name /dev/video0
> >         pad0: Sink
> >                 <- "Extension 8":1 [ENABLED,IMMUTABLE]
> >
> > - entity 4: HP 5M Camera: HP 5M Camera (0 pad, 0 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video1
> >
> > - entity 8: Extension 8 (2 pads, 2 links, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >         pad0: Sink
> >                 <- "Extension 4":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 -> "HP 5M Camera: HP 5M Camera":0 [ENABLED,IMMUTABLE]
> >
> > - entity 11: Extension 4 (2 pads, 2 links, 0 routes)
> >              type V4L2 subdev subtype Unknown flags 0
> >         pad0: Sink
> >                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 -> "Extension 8":0 [ENABLED,IMMUTABLE]
> >
> > - entity 14: Processing 2 (2 pads, 2 links, 0 routes)
> >              type V4L2 subdev subtype Unknown flags 0
> >         pad0: Sink
> >                 <- "Camera 1":0 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 -> "Extension 4":0 [ENABLED,IMMUTABLE]
> >
> > - entity 17: Camera 1 (1 pad, 1 link, 0 routes)
> >              type V4L2 subdev subtype Sensor flags 0
> >         pad0: Source
> >                 -> "Processing 2":0 [ENABLED,IMMUTABLE]
> >
> > - entity 19: GPIO (0 pad, 0 link, 0 routes)
> >              type V4L2 subdev subtype Decoder flags 0
> >              device node name /dev/v4l-subdev0
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v2:
> > - Rebase on top of https://patchwork.linuxtv.org/project/linux-media/patch/20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org/
> > - Create uvc_gpio_cleanup and uvc_gpio_deinit
> > - Refactor quirk: do not disable irq
> > - Change define number for MEDIA_ENT_F_GPIO
> > - Link to v1: https://lore.kernel.org/r/20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org
> >
> > ---
> > Ricardo Ribalda (5):
> >       media: uvcvideo: Factor out gpio functions to its own file
> >       Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
> >       media: uvcvideo: Create ancillary link for GPIO subdevice
> >       media: v4l2-core: Add new MEDIA_ENT_F_GPIO
> >       media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity
> >
> > Yunke Cao (1):
> >       media: uvcvideo: Re-implement privacy GPIO as a separate subdevice
> >
> >  .../userspace-api/media/mediactl/media-types.rst   |   4 +
> >  drivers/media/usb/uvc/Makefile                     |   3 +-
> >  drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +----
> >  drivers/media/usb/uvc/uvc_driver.c                 | 123 +-------------
> >  drivers/media/usb/uvc/uvc_entity.c                 |  20 ++-
> >  drivers/media/usb/uvc/uvc_gpio.c                   | 187 +++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_video.c                  |   4 +
> >  drivers/media/usb/uvc/uvcvideo.h                   |  34 ++--
> >  drivers/media/v4l2-core/v4l2-async.c               |   3 +-
> >  include/uapi/linux/media.h                         |   1 +
> >  10 files changed, 252 insertions(+), 167 deletions(-)
> > ---
> > base-commit: 4353256f5487e0c5c47e8ff764bf4f9e679fb525
> > change-id: 20241030-uvc-subdev-89f4467a00b5
> >
> > Best regards,
>
>
>
> Thanks,
> Mauro



-- 
Ricardo Ribalda

