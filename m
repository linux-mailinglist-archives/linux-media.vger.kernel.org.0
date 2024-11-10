Return-Path: <linux-media+bounces-21219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB49C31A4
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 11:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD79628187D
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 10:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAD91547E4;
	Sun, 10 Nov 2024 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iiIZo3JE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E814F12D
	for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731235083; cv=none; b=Ekwmz8Y1frOBEWeIYR61mLth056Zr513Th8STL6AuWNsqoC2Nugoc9pAUM/0oi3QjF6y753v27fpPxkOG9oj2Tlmj9k/Z0t5b3yN4q7UytKAhUYVEKxJU9MrvcmawdkN6v77YJFHTzZSKx/zq1ATj8u7zCHSOlkoR6W0Yb+TP1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731235083; c=relaxed/simple;
	bh=O5mVQaKDvwOJc7a5XxnU2xSnmQ+whwxsl1yxUHgnFWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iy0J1Ah9YJG42Q9qVioi8xcVDthuJcB1N4ktByxY29DM0tgN1SvnlUxUlp6agqnAA0Fufzw/Agvv3IGduKsrObVd04ffNECc04IXfpvEW2EWjqSWc8TOdJ0EHawnANSr18/7gxGcxlUlVCUoBVEenPUDlPFkQGxD8YKQHNM9qOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iiIZo3JE; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so2828934b3a.0
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731235081; x=1731839881; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OavQNoExwrB2RaimjnilBITwbfjdSP2yPFFHgkfcTBk=;
        b=iiIZo3JEF61585gibFFae1p5TZ6Te20EWD1Bg8xLOeVw2DTnwvRPX674hg1B3KE8z8
         HtJOQyabLtT+ukQbLd+6pwiNYOaD5In5xKeENlEUUl99nGGdFu86ckIWGuMbT2MHWH+n
         cteIX3GQuy2pHjIcsyVaRNEED9Ieoj3svJ3d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731235081; x=1731839881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OavQNoExwrB2RaimjnilBITwbfjdSP2yPFFHgkfcTBk=;
        b=PZR5uZ7W8hb5c3VENx8D7XQFQG9nYwkVUyqq8XK5PR4Mo8mPDrXPoh87a+1C9iAlQe
         L1o6+B95vRsCf2LIDYoLiU0QlKj3ZjZxqW3riReEUNqd1rNvHLiacTUbZwUG1y2IDqm3
         vrOlEve8AozbR3iRWUghw+LRUN8o3z8eu6gqwzJX+kuh10In4wDPxPN6BIeFcLFZtMuH
         vSoPMp/dtSXh7lJ++4hCdWVje/OuUuAMpbK4CNI6xO9VpzI5U/sYmIWsEuew5x5mMbE1
         A4duSTNiFCm4AQMeZGwNzEJILit4ldOu4+Y3yLPZ/OYMFPszcSKLicAEW1ZXmgqrNoaf
         sfRg==
X-Forwarded-Encrypted: i=1; AJvYcCUCmetRxubFelLKkwOeg6/Qxb+U2kUrcAk7uLghC4eMMDaIuoMi2ATDiI1WNhdVm//vM/cFrnfhEQTrsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5nibOWWhIwl9OsJU6Q0vUdX3LkvVBz5GtltzgGWmW1z/00gfA
	1RByKQYWLyRfPDyjAvuCAL0oiT6vXNFgw9ThcX08Ra9+xXkTgWS04X1sADmNTbmRkFS8+e56hdQ
	=
X-Google-Smtp-Source: AGHT+IE4OU2q9PtnMgfcI0yg+GhWs1E7s7vR5WLL8IxPB0tSWGnq3YsgMfEbyX1yGPBGdOWLsK62wA==
X-Received: by 2002:aa7:88c9:0:b0:71e:592d:6fa9 with SMTP id d2e1a72fcca58-7241327b6a4mr11771911b3a.1.1731235081411;
        Sun, 10 Nov 2024 02:38:01 -0800 (PST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a6c542sm7100324b3a.189.2024.11.10.02.37.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 02:37:59 -0800 (PST)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so2782991a91.1
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 02:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIwLeIHOiDCO1OrE8TnjAb1iXY4uLvGAMWIEqH2AVKZoGRSHgBGjFBMHpfJ3uxaZUfuoGMUR6jt78/AA==@vger.kernel.org
X-Received: by 2002:a17:90b:5307:b0:2e2:d7db:41fc with SMTP id
 98e67ed59e1d1-2e9b1720246mr13676256a91.10.1731235079120; Sun, 10 Nov 2024
 02:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com> <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110110257.5160a7d1@foz.lan> <2fd9053f-34b6-4e97-a898-98fd71a485e8@xs4all.nl>
In-Reply-To: <2fd9053f-34b6-4e97-a898-98fd71a485e8@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 10 Nov 2024 11:37:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCt=Qht8CwAxCkpn=5owtQ_JBUkK+9yaLsZ5W2RJJxbz8A@mail.gmail.com>
Message-ID: <CANiDSCt=Qht8CwAxCkpn=5owtQ_JBUkK+9yaLsZ5W2RJJxbz8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Nov 2024 at 11:29, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 10/11/2024 11:02, Mauro Carvalho Chehab wrote:
> > Em Sat, 9 Nov 2024 17:29:54 +0100
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >
> >>>
> >>> I think that should sort the issue, assuming that 1. above holds true.
> >>>
> >>> One downside is that this stops UVC button presses from working when
> >>> not streaming. But userspace will typically only open the /dev/video#
> >>> node if it plans to stream anyways so there should not be much of
> >>> a difference wrt button press behavior.
> >>
> >> I do not personally use the button, but it is currently implemented as
> >> a standard HID device.
> >
> > IMO, controlling the privacy via evdev is the best approach then. There's
> > no need for a RW control neither at subdev or at device level. It could
> > make sense a Read only to allow apps to read, but still it shall be up to
> > the Kernel to protect the stream if the button is pressed.
> >
> >> Making it only work during streamon() might be
> >> a bit weird.
> >> I am afraid that if there is a button we should keep the current behaviour.
> >
> > Privacy matters only when streaming. IMO the Kernel check for it needs to
> > be done at DQBUF time and at read() calls, as one can enable/disable the
> > camera while doing videoconf calls. I do that a lot with app "soft" buttons,
> > and on devices that physically support cutting the video.
>
> We could add a vb2_s_privacy(bool privacy) function to vb2 to tell vb2 if the privacy
> mode is on. And if so, take action. E.g. calling QBUF/DQBUF would return a -EACCES error.
>
> That will ensure consistent behavior for all drivers that have a privacy function.

I am not against adding a feature like this, but we still need a way
to notify userspace about a change of the privacy state when the user
presses it.
Controls are great for this.

>
> Note that there are two types of privacy GPIO: one that triggers when a physical
> cover is moved, blocking the sensor, and one that is a button relying on software
> to stop streaming video. In the first case it is informative, but you can keep
> streaming.

I am curious who implements a software privacy switch. I would
definitely use a physical cover in those devices.

Chromebooks only support physical cover and hardware privacy switch. I
have not seen software privacy switches.

>
> Regards,
>
>         Hans
>
> >
> > I don't trust myself privacy soft buttons, specially when handled in userspace,
> > so what I have are webcam covers (and a small stick glued at a laptop camera
> > that has a too small sensor for a webcam cover). I only remove the cover/stick
> > when I want to participate on videoconf with video enabled with the builtin
> > camera.
> >
> > Regards
> >
> > Thanks,
> > Mauro
> >
>


-- 
Ricardo Ribalda

