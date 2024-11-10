Return-Path: <linux-media+bounces-21221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C89C31B9
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 12:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84091F21429
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 11:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59880155A4E;
	Sun, 10 Nov 2024 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y49R5ShB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A3155352
	for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731236405; cv=none; b=UhaEb8U1jAtELWKHIaPnJ0FxEMg9YBmCU7BisIfb8hsOTK3+/ar66QgQ3gFtgGbnB6iopYJbg9/SgabStoY3SgneuXHGtOhrehSW5IutstNpGfg8TIDw+Ema8ftmiULyZnx/BVQN3XqJxtN+bdgDmefW+EOvgkKTZNnNepmpZmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731236405; c=relaxed/simple;
	bh=hd9MxZmaHUtz1GKr3sObWuJOomwjoTrZHnjIWaw4wx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQeLxQlAjt9OAA1rNk4yYDldr6AFsVutkAFH5vpAhKCFKkDu6kJLQ0kXSj0Qvt5KFZLNiMdqKKFVrULZRji4AY+V3GXLafTwIwpGf9+wIwWGPei0e3ujYbsuJF6v1Zg8i2diaZzS/S0+jgsWcgLJmnzJgNsPb9t3Ga1jOe5z3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y49R5ShB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2854897b3a.1
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 03:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731236403; x=1731841203; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMpDe5w9iUW90NujS3qbzllTGg6PQPGBsS1EJKhPt2k=;
        b=Y49R5ShBpStS3zhtWL9wl8VtZj3DJaZ9zvVZUVI4lbq7Z/m9JftBtaVcUB3b9eZT4U
         bBGDPy4MJH2uJD528dz1/qxTq2paGDJuAClkfn3cu1yEHBuovL88ChI9QXpmrCrvWmFL
         tXqr5/r2c4hgatxiVQgGz/hPbcLpjtePrwDs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731236403; x=1731841203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMpDe5w9iUW90NujS3qbzllTGg6PQPGBsS1EJKhPt2k=;
        b=nv3bal4Gitsm18y4yJd+chZNUybBr9xYG6TR3cecHUtFkTiA9shL4w4RzdxEGGnHdE
         QoDLM06h2DOsd61Wg4vuNpJWth7XQ3OsGiDngx0CuSb5zFFVB/0l4FJmSVMDq40r9cmS
         L0V8G/iIjRt2lAXTkFkSaC+J3nYBGyyDxPWXioOhfaCOuabPbmZZ/dvpraNgzAX/xVnS
         v1CXW8g9+5LMB9riL8fUdUH47eg0nigzmLPZl4bRWm11/2MytbQzUtiZaZsqCHOsfe0i
         AJm7dGG3oU7Ksfc/Tll8VpMvZQ8dAU5daVGxIwj+CHoetQpA3NO4WmtA//q9rcdUiOcX
         SH7A==
X-Forwarded-Encrypted: i=1; AJvYcCUMLXg2kd/GfBpt3Bn4eDaO95w3+9dJyZLwSdtyBJqBX1+9iUNTTnJxN7vRdLvqUrw7NlFq0oM/l1ClZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVc7XTiusLJ30flG7dNsraykEbZ4biMjMOcL7XClrGOTY4HOB
	A+heQNY0WJ+L5dTykNiIi0GEI+qRm/KNEraq1rvxGrDZPBs0MTH0t2kpfcngWKmtPE4KdwGR4s4
	=
X-Google-Smtp-Source: AGHT+IEV9F7t6nckCg2M4SQc8OLUy2NSncSni/YgRGJ+gny19GKV8ed17f0xeYIFbQXnuOY0UC0EXQ==
X-Received: by 2002:a05:6a00:1788:b0:71e:21:d2d8 with SMTP id d2e1a72fcca58-724132a1251mr13509110b3a.7.1731236403196;
        Sun, 10 Nov 2024 03:00:03 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f644db5sm6530314a12.55.2024.11.10.03.00.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 03:00:02 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so2737497a12.0
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 03:00:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU73OnTbh9sucy2733VW3yzBfyKjaAh0TC7G80kOdEDatFEsL65EFl2kpduBK/QurM58g4GH51g/JQ07Q==@vger.kernel.org
X-Received: by 2002:a17:90b:53c6:b0:2e2:cf5c:8edf with SMTP id
 98e67ed59e1d1-2e9b170eaf9mr12405962a91.9.1731236401269; Sun, 10 Nov 2024
 03:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com> <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110110257.5160a7d1@foz.lan> <CANiDSCvYo8=x_QAeg0_S=_H=R1EgM9xLUy4DXURcuEadYcQjQQ@mail.gmail.com>
In-Reply-To: <CANiDSCvYo8=x_QAeg0_S=_H=R1EgM9xLUy4DXURcuEadYcQjQQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 10 Nov 2024 11:59:48 +0100
X-Gmail-Original-Message-ID: <CANiDSCsE5A+gH5gVuZBPJZ=Jnxer2-44AWUG+OaV73mr=0SoFA@mail.gmail.com>
Message-ID: <CANiDSCsE5A+gH5gVuZBPJZ=Jnxer2-44AWUG+OaV73mr=0SoFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Nov 2024 at 11:32, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Mauro
>
> On Sun, 10 Nov 2024 at 11:03, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Sat, 9 Nov 2024 17:29:54 +0100
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >
> > > >
> > > > I think that should sort the issue, assuming that 1. above holds true.
> > > >
> > > > One downside is that this stops UVC button presses from working when
> > > > not streaming. But userspace will typically only open the /dev/video#
> > > > node if it plans to stream anyways so there should not be much of
> > > > a difference wrt button press behavior.
> > >
> > > I do not personally use the button, but it is currently implemented as
> > > a standard HID device.
> >
> > IMO, controlling the privacy via evdev is the best approach then. There's
> > no need for a RW control neither at subdev or at device level. It could
> > make sense a Read only to allow apps to read, but still it shall be up to
> > the Kernel to protect the stream if the button is pressed.
> >
> > > Making it only work during streamon() might be
> > > a bit weird.
> > > I am afraid that if there is a button we should keep the current behaviour.
> >
> > Privacy matters only when streaming. IMO the Kernel check for it needs to
> > be done at DQBUF time and at read() calls, as one can enable/disable the
> > camera while doing videoconf calls. I do that a lot with app "soft" buttons,
> > and on devices that physically support cutting the video.
> >
> > I don't trust myself privacy soft buttons, specially when handled in userspace,
> > so what I have are webcam covers (and a small stick glued at a laptop camera
> > that has a too small sensor for a webcam cover). I only remove the cover/stick
> > when I want to participate on videoconf with video enabled with the builtin
> > camera.
> >
> > Regards
>
> I think we are mixing up concepts here.
>
> On one side we have the uvc button. You can see one here
> https://www.sellpy.dk/item/2Yk1ZULbki?utm_source=google&utm_medium=cpc&utm_campaign=17610409619&gad_source=1&gclid=Cj0KCQiA0MG5BhD1ARIsAEcZtwR9-09ZtTIVNbVknrZCtCd7ezVM8YFw1yQXfs81FWhofg9eW-iBrsIaAopVEALw_wcB
> That button is not represented as a hid device. We do not know how the
That button is NOW represented as a hid device. sorry :)
> user will use this button. They could even use it to start an app when
> pressed.
>
> On the other side we have  the privacy gpio. The chassis has a switch
> that is connected to the camera and to the SOC. You can see one here:
> https://support.hp.com/ie-en/document/ish_3960099-3335046-16 .We link
> the camera with a gpio via the acpi table. When the user flips the
> button, the camera produces black frames and the SOC gets an IRQ. The
> IRQ is used to display a message like "Camera off" and the value of
> the GPIO can be checked when an app is running to tell the user:
> "Camera not available, flip the privacy button if you want to use it."
> Userspace cannot change the value of the gpio. It is read-only,
> userspace cannot override the privacy switch. The privacy gpio is
> represented with a control in /dev/videoX This patchset wants to move
> it to /dev/v4l2-subdevX
>
> To make things more complicated. Recently some cameras are starting to
> have their own privacy control without the need of an external gpio.
> This is also represented as a control in /dev/videoX.
>
>
> Now that we have these 3 concepts in place:
>
> Today a uvc camera is powered up when /dev/videoX is open(), not when
> it is streaming. This means that if we want to get an event for the
> privacy gpio we have to powerup the camera, which results in power
> consumption. This can be fixed by moving the control to a subdevice
> (technically the gpio is not part of the camera, so it makes sense).
>
> If we only powerup the camera during streamon we will break the uvc
> button, and the async controls.
>
>
>
> >
> > Thanks,
> > Mauro
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

