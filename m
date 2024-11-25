Return-Path: <linux-media+bounces-21998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD49D887D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91AD8B35949
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B9F1AF0A1;
	Mon, 25 Nov 2024 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UzfCl3WX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA919258B
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732542656; cv=none; b=MmmYKuH3T4KNceTgOh1LD0V1/r2uGl9pnZhc8TbbKgYkmAT0BHwvj7cXQ4oeoEBnwdFVQaopo9kynhFiIDILabHTnGH7o4FAAPoHkSsnRCthLQmWyjlOXOTyWm5rqQLyuk2x4YU+mvjjMh3mf/c5bfCwpZJ8n2BCLqgjMCD6eR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732542656; c=relaxed/simple;
	bh=ilHRhOQtmU52tJoi5rkYul1Wi+LJB1Spyhoz3pG+2eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVIe2hul/ZedQCYS19SVDiAphKRSSgJaHi5+9CxJhuK+72I1s1r4gq7Hh9myJ+W1aF4WhTmSay4wm7wQ/FXS8JZJbmuMzA8O/iH/wR4OXDUcWLu/kM4/axkSh3g29sIqYY68/X8uQl2OYuzlRgA/rCTmILJQ2sge4G+SFbJ8UBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UzfCl3WX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2127d4140bbso40256675ad.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732542654; x=1733147454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cDipKvIOUX7uzCSO1YayfVZOqbIm+XO2gEj1lWmD+x0=;
        b=UzfCl3WX3ZtaBfJ+hDm0B0/ai5qn+FF89wlyfpXW300kqGXGdlsRr8SeAvXiDQp5cO
         nKwJsUpn4tG/hLsppa18XJZL03+xhcU0AFXOPJh8bECwjt/fZ4BUECxyBO1CuUo9oqH3
         4bzWcL2hoWuJTw1slqtq3zDALc+t4JnH9CArA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732542654; x=1733147454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDipKvIOUX7uzCSO1YayfVZOqbIm+XO2gEj1lWmD+x0=;
        b=EQ5TJ7pS3fqiRHqRQfPHze3xyoqE/hdGKman3ucmN6dz5/Abc7it3m/Kx2+5o7Y3EW
         5bziI+pAIYrMm1YD4ivRtcCtgb8JL3HJtw7g6j9pr6vTZKEwVUc2lP2AogtN83ZqujsA
         7H5CiAQ/2cF8+VjIBhJgeLmQfxv6Wrrt2lCzoRQSjOrd1k0J1+a4+punAKVyxCuvOgrK
         gUBIunee5fSulRA8NZYl363E+vhqzSaIGDzdjmIgjxftJSH+Re2ogBs9usB86oHk+ZEy
         cqF5wzLojx5TThTPH8JfTh0Jb4XfzAAFLCpq776sUaWs5NG908nKOd5XNVQFzwF26P4s
         VDGw==
X-Forwarded-Encrypted: i=1; AJvYcCWTAFy8Kjkzv1RYoCxKQEsW66YIhu2LbnapBcbBep6T1jKzH/p4DAvbFD7NXG9LKKBTa4IAQ1FUyPqCnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3p2JlylFhvUNkDUyJRzR28a1nNDg1F9PjgO3USF+sEEWjr42v
	PfFJgnXDHaua3pbs7OrmuSSJ+BveAW7qZV+9ceS7c6fJiULodQF8vWZP/VWmS2ZFfwADNgc4YXs
	=
X-Gm-Gg: ASbGncu56e620tzFGiEXL6EmLVUKBp/pGtuhCp6PENHe0WRoLiFN4tRP54U1YjZw5i3
	QC/dN7CLvoNz1C5sLMGWMPMhcnE0NASfFJy4rCAVk93ucCB1jod/EDvvfkAgeunIOa+QmeYzsWn
	pMkaaT4XRbPjZdFfwADB5nGZAp+NLv37XXrRZCPddDZQNeWy3awNI0Qqjkr6eU/J+WydAmux1DD
	HJJhs8Cmsa7YTHj9Bl87lvczj5ASGfnlGnjuSU2nlCcLc6ahcJU3pq/ZOXDjQP1CctQC8cwKvbK
	QUnBVpArpoudDJIB
X-Google-Smtp-Source: AGHT+IEJL2gfCAu0/lTzvRRR3wlWqAX/Zg4ljEOFMepinW13M0s+2lTTS6TfxVWzP3mZ29FMcAIM4g==
X-Received: by 2002:a17:902:f681:b0:212:37e:3fd4 with SMTP id d9443c01a7336-2129f2b7457mr165713225ad.57.1732542653730;
        Mon, 25 Nov 2024 05:50:53 -0800 (PST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfeb4esm65103305ad.164.2024.11.25.05.50.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:50:53 -0800 (PST)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fc2b84bc60so816416a12.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 05:50:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPzUUj7W+z0qVCd9gMgR0rz2YsSF0sqxSGC7ykBYqm8bvv8bM0KRdZ58sUk6IUwxmLFwf9x6sqAiyq1Q==@vger.kernel.org
X-Received: by 2002:a05:6a21:4890:b0:1e0:c243:cffc with SMTP id
 adf61e73a8af0-1e0c243d07amr6508648637.36.1732542652324; Mon, 25 Nov 2024
 05:50:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com> <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110151426.GD6002@pendragon.ideasonboard.com> <CANiDSCsTNuQRXwMqA_YmX4MJ-A8eTi_rEpkd+Qv=Qwbbrj18Yg@mail.gmail.com>
 <123bfac4-389a-400a-8104-afc27124b75d@redhat.com> <20241125125834.GC32280@pendragon.ideasonboard.com>
 <33e7dbc8-0d29-4905-a28c-e562151a837a@redhat.com>
In-Reply-To: <33e7dbc8-0d29-4905-a28c-e562151a837a@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Nov 2024 14:50:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCv0U=i2ZSd0abfP1JYrY-HVKa5t_7qAea+9KCog5P2PVg@mail.gmail.com>
Message-ID: <CANiDSCv0U=i2ZSd0abfP1JYrY-HVKa5t_7qAea+9KCog5P2PVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 14:44, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 25-Nov-24 1:58 PM, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 01:39:05PM +0100, Hans de Goede wrote:
> >> Hi Ricardo,
> >>
> >> On 10-Nov-24 5:07 PM, Ricardo Ribalda wrote:
> >>> On Sun, 10 Nov 2024 at 16:14, Laurent Pinchart
> >>> <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> <snip>
> >>
> >>>>>> Here is what I have in mind for this:
> >>>>>>
> >>>>>> 1. Assume that the results of trying a specific fmt do not change over time.
> >>>>>>
> >>>>>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
> >>>>>>    enum-frame-sizes -> enum-frame-rates tripplet results
> >>>>>>    (constrain what userspace requests to these)
> >>>>>>
> >>>>>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
> >>>>>>    3 levels nested loop for this) on probe() and cache the results
> >>>>>>
> >>>>>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
> >>>>>>    the requested fmt to one from our cached fmts
> >>>>>>
> >>>>>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
> >>>>>>    what we expect based on the cache, and otherwise return -EIO.
> >>>>>
> >>>>> Can we start powering up the device during try/set fmt and then
> >>>>> implement the format caching as an improvement?
> >>>>
> >>>> This sounds worth trying. We'll need to test it on a wide range of
> >>>> devices though, both internal and external.
> >>>
> >>> For what is worth, we have been running something similar to
> >>> https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
> >>> in ChromeOS and it has worked fine....
> >>>
> >>> But I am pretty sure that it has issues with async controls :S
> >>
> >> Interesting that is actually a lot more aggressive (as in doing a
> >> usb_autopm_put_interface() often) then what I expected when you said:
> >>
> >> "Can we start powering up the device during try/set fmt"
> >>
> >> As I mentioned in my other emails what I think would worth nicely
> >> is delay the initial usb_autopm_get_interface() till we need it
> >> and then just leave the camera on till /dev/video# gets closed.
> >>
> >> That idea is based on dividing apps in 2 groups:
> >>
> >> 1. Apps just temporarily opening /dev/video# nodes for discovery,
> >> where we ideally would not power-up the camera.
> >>
> >> 2. Apps (could even be the same app) opening /dev/video# for
> >> a longer time because it actually want to use the camera
> >> at the moment of opening and which close the /dev/video# node
> >> when done with the camera.
> >>
> >> Your code seems to also covers a 3th group of apps:
> >>
> >> 3. Apps opening /dev/video# for a long time, while not using
> >> it all the time.
> >>
> >> Although it would be nice to also cover those, IMHO those are
> >> not well behaved apps and I'm not sure if we need to cover those.
> >
> > Is that right ? Isn't it better for an application to keep the device
> > open to avoid open delays or even open failures when it wants to use the
> > device ?
>
> Keeping devices open has advantages and disadvantages. E.g. keeping
> /dev/input/event# nodes open will also typically lead to e.g.
> touchscreens staying powered on.
>
> Generally speaking it is not unheard of to expect userspace to
> behave in a certain way for things like this for power-consumption
> reasons.
>
> I guess the question is how far do we want to go inside the uvc
> driver to avoid userspace needing to close the /dev/video# nodes
> when unused.
>
> Ricardo's patch from here:
>
> https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
>
> goes all the way and if I understand Ricardo correctly this is
> already in use in ChromeOS ?

It is in use on just some devices. I try to not diverge from upstream if I can.

>
> So we could also go with this. Maybe put it behind a Kconfig option
> for a while ?

I can try to work on a new version of the patch, including support for
async controls the way I described in my previous email.
Let me know what you think.

>
> AFAICT the only thing which needs to be figured out there is async
> controls.
>
> I think we can simply set a long autosuspend delay on devices with
> async controls to deal with that ?
>
> I have a Logitech QuickCam Orbit (non AF) UVC camera which has
> pan + tilt controls and AFAICT these work fine with v4l2-ctl
> which immediately closes the /dev/video# node after the set-ctrl
> command. But I'm not sure if I have tested this without the camera
> streaming at the time. Anyways that is at least one camera I can test.
>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

