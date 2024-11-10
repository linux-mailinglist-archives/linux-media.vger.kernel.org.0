Return-Path: <linux-media+bounces-21218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921889C319D
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 11:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF7DB20C2E
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 10:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3466B153BC1;
	Sun, 10 Nov 2024 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCQ6oGwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361FC1487E9
	for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731234753; cv=none; b=I5SxFD7njqDIZyu4ZutmebgIeyutCxTFoBvsBE4BWxWiYtj2vwJLMvrMS1+JtVV41r5LefZ/3K+LOU7b1rGkf5CN9U8bZLYGeWoMyI7ptszvo6FueIbwvU4XypzUgghYwES8atosgB2WK9LkdeLbKBlKv8mtJUy/ic4p4jwgK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731234753; c=relaxed/simple;
	bh=J2XiAhydIozcnyAMj8QfIvt5whk9HNNtRwXjctb94oA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5CN5KhtBicEvKsO66yllqPuJ6tRros9BpEZGh/91MJMeV8RsWKqkU8kIpHQ9T0MqxtGzecUxq/mP7FuiTc0lebp7N++y9Y/SvgiNJnqtpaB7Hy5VZQxhCjVqxAoU7tWDbYpi9ZaC4Rnh9erJeaSFyJCKP5yhewqbFdtpYHeFC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCQ6oGwd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdda5cfb6so36509395ad.3
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731234751; x=1731839551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6UOXmYifn5gAY5jgAY5WuaQ+hV2HAz4kyyeMS5Ib9ME=;
        b=JCQ6oGwdj+0rCQXfn1wN7VxqcYBcl511DLXUGAbJJ34XesYIUqYXLUUpeiJ23jOZwd
         WRlkcnI1anw+DMxD8018VYjrm4d39/MbqX7nwXj9ycv+nyZGmRWWP1lnomughplwBuXB
         1VwbHYhTRM85B6D/lBvS5MlKLsyf2eQE+7qY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731234751; x=1731839551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UOXmYifn5gAY5jgAY5WuaQ+hV2HAz4kyyeMS5Ib9ME=;
        b=FY1D0yrSmbl5h7w31AOavUuvMqnVDTycgSPixtQxJ4UI8yENwPd8KOXcuTOKlHWuZQ
         4cxaIKZBtw//Ann8Bl0Wl1i2oM1LSA7fKfslPMbrmIE3giACp54LiCXInoMz6jIX45tt
         nBbLBQn7Qjh9KpSPUbmJQI87+30ErZR4Jb9J5O48WfAV99SE9dUtUwc77hZ7D5BeLjdV
         XcC51R6q1immulF5sE0la+peBr+UwPPxAIv76QfRL4yFXKKhrnNbmuRH15cTa26Ax/W4
         7/CxrwiQyL9ZHPpuesOzWPg3gcXXloPmMPNuj9k8ePBcTGHs5zYlje5HLOliSj+3niVn
         wuDg==
X-Forwarded-Encrypted: i=1; AJvYcCX5XVB/Vj9ynQNrxjdKTphN5TIpYURnB4et+wTvMV37kRpmVVael1ReX8UwaGUR8ysmHIet64zJh/RI0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAWEBcnPyVCCVyyNKDaUeYzTfTsLogsgHbf5rYyv1azpn0cPg
	GAe3lGbrbV5jPcIxhRvq+RW+HM5hsZP/ZBrbacy0/t9wRQ3Z5sri44iLKRiUjjOpzn27QlY+1H8
	=
X-Google-Smtp-Source: AGHT+IHPgLz0tCL2IbyGAJpU6uclVhvmkr47xkhBimCehdVYMG0IKV4eKxZi4SPC3Nw9Er9qJI2yqw==
X-Received: by 2002:a17:902:f607:b0:20b:c258:2a74 with SMTP id d9443c01a7336-211835420d2mr135799005ad.29.1731234751296;
        Sun, 10 Nov 2024 02:32:31 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddd621sm57679055ad.61.2024.11.10.02.32.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 02:32:29 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so2686387a12.1
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 02:32:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHD/j3nvHK8KdEa2e3BXjTSDfDlS79I3Zj1rrgSHgJ5ZePrCBMiSTXSOjF84A5DHAeB6cQME2aBHnxcQ==@vger.kernel.org
X-Received: by 2002:a17:90b:2642:b0:2e2:e4d3:3401 with SMTP id
 98e67ed59e1d1-2e9b16ab979mr12110572a91.20.1731234749101; Sun, 10 Nov 2024
 02:32:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com> <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110110257.5160a7d1@foz.lan>
In-Reply-To: <20241110110257.5160a7d1@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 10 Nov 2024 11:32:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCvYo8=x_QAeg0_S=_H=R1EgM9xLUy4DXURcuEadYcQjQQ@mail.gmail.com>
Message-ID: <CANiDSCvYo8=x_QAeg0_S=_H=R1EgM9xLUy4DXURcuEadYcQjQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Sun, 10 Nov 2024 at 11:03, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Sat, 9 Nov 2024 17:29:54 +0100
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > >
> > > I think that should sort the issue, assuming that 1. above holds true.
> > >
> > > One downside is that this stops UVC button presses from working when
> > > not streaming. But userspace will typically only open the /dev/video#
> > > node if it plans to stream anyways so there should not be much of
> > > a difference wrt button press behavior.
> >
> > I do not personally use the button, but it is currently implemented as
> > a standard HID device.
>
> IMO, controlling the privacy via evdev is the best approach then. There's
> no need for a RW control neither at subdev or at device level. It could
> make sense a Read only to allow apps to read, but still it shall be up to
> the Kernel to protect the stream if the button is pressed.
>
> > Making it only work during streamon() might be
> > a bit weird.
> > I am afraid that if there is a button we should keep the current behaviour.
>
> Privacy matters only when streaming. IMO the Kernel check for it needs to
> be done at DQBUF time and at read() calls, as one can enable/disable the
> camera while doing videoconf calls. I do that a lot with app "soft" buttons,
> and on devices that physically support cutting the video.
>
> I don't trust myself privacy soft buttons, specially when handled in userspace,
> so what I have are webcam covers (and a small stick glued at a laptop camera
> that has a too small sensor for a webcam cover). I only remove the cover/stick
> when I want to participate on videoconf with video enabled with the builtin
> camera.
>
> Regards

I think we are mixing up concepts here.

On one side we have the uvc button. You can see one here
https://www.sellpy.dk/item/2Yk1ZULbki?utm_source=google&utm_medium=cpc&utm_campaign=17610409619&gad_source=1&gclid=Cj0KCQiA0MG5BhD1ARIsAEcZtwR9-09ZtTIVNbVknrZCtCd7ezVM8YFw1yQXfs81FWhofg9eW-iBrsIaAopVEALw_wcB
That button is not represented as a hid device. We do not know how the
user will use this button. They could even use it to start an app when
pressed.

On the other side we have  the privacy gpio. The chassis has a switch
that is connected to the camera and to the SOC. You can see one here:
https://support.hp.com/ie-en/document/ish_3960099-3335046-16 .We link
the camera with a gpio via the acpi table. When the user flips the
button, the camera produces black frames and the SOC gets an IRQ. The
IRQ is used to display a message like "Camera off" and the value of
the GPIO can be checked when an app is running to tell the user:
"Camera not available, flip the privacy button if you want to use it."
Userspace cannot change the value of the gpio. It is read-only,
userspace cannot override the privacy switch. The privacy gpio is
represented with a control in /dev/videoX This patchset wants to move
it to /dev/v4l2-subdevX

To make things more complicated. Recently some cameras are starting to
have their own privacy control without the need of an external gpio.
This is also represented as a control in /dev/videoX.


Now that we have these 3 concepts in place:

Today a uvc camera is powered up when /dev/videoX is open(), not when
it is streaming. This means that if we want to get an event for the
privacy gpio we have to powerup the camera, which results in power
consumption. This can be fixed by moving the control to a subdevice
(technically the gpio is not part of the camera, so it makes sense).

If we only powerup the camera during streamon we will break the uvc
button, and the async controls.



>
> Thanks,
> Mauro



-- 
Ricardo Ribalda

