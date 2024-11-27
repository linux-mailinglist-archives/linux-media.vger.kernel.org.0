Return-Path: <linux-media+bounces-22157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C89DA59B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56345164824
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AF61974F4;
	Wed, 27 Nov 2024 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H5uJhEC+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89141957F8
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702812; cv=none; b=fikw4AQwO/T5mHYAjYKJpfwqEaMeVioPNmMGvA8eib4aw7xYCNuFRBktdGQhxMAmOLpIP39PL/coFzexQWAhj2uTQr7PRs0DBwFD96D7LBW0iRFhovz/4vv3fN2r3of+QqG2SDXYEyZO09GxPNEEYyJLRBtBjmE2LSWZbv+Leqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702812; c=relaxed/simple;
	bh=8r5vCCz3A7owBJYWh+nbdral5EKpJhok9PThU26k4nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXJzBbeTcfMsR4UuuscciO+fY2ZgRh+INSqpwgENeIkAfsLadMF2Sd6p//NbF7kFM4w4dov4U6FsCrRLi30BOadaLF7O+s+9Hb4z42r0L9nyU3ABTYjOqlMwoZHneCSJ6Xp/9fKcB2kJP8srCq1TpDhZZeUiFMjqXgTjUFWio/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H5uJhEC+; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fc1f1748a3so2963501a12.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 02:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732702810; x=1733307610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94aDzij1Sd3lW/XcYirCTixFdk5KYMfgdRn5F74gnPs=;
        b=H5uJhEC+uNZRGVra/ZwGUBsKn8PLAX+IUtbRZF6ZOizHeE6YK0BeKbVGrj0BbXISxa
         SrlFnWYBpaUkVudESEcJb7sBsgJFEartH3T0D98DY+0IvogAGt/pnj8+Hhe+nz0v9vY5
         kqbV6B6XtDjHdV0+EVoOitC/qxnUopjUNCBL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702810; x=1733307610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94aDzij1Sd3lW/XcYirCTixFdk5KYMfgdRn5F74gnPs=;
        b=hSm6460liTQYll5UISE+xYQe/7sv2ux5BiSeICYtTVx2NgEqAjnBPvM14YikIG/TB4
         CN3sVUXnxUq9QOH1OJ+6MXDHmDQFs2uiSKi8JDC8sJg7923AD6lS7GaRrW6ZwrYT2rHv
         /wS9P2vKRvODwH3/lpl2/HFkSyCTQsFYdWg9Qs9IqebEUTGS3Wv1+JIcRbG1A61siFyi
         BGPosfPTIoT1HR5rfLtzWj0NIKWS/lNmZEc2UdTBKtf7lCw+PxfCcm4SgVZ3O2EeQuq2
         VX3dT4U5Fz33hZkK4hC6uH+F6o8+3fP6z5tZUGqx7sKSAqDV7DRJe9U6Uvm7Vi5qvZCF
         I5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUsbhwolSVdZY7KvfLj5Ypc2v640eWH25CLr0m9pI9rxeTf+GHUZd0qrIntNmz9YfjdwOu8hCuO9tDRdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4IBx4INFP2z47pCzngVlVMLxHVvOZA53SQh9YgP4T0laNDmD
	JfelboJTMudyS4BGSQHNtfZNTp+DKkLAAdRHgyn2vLoNzzKG3M59gLyISTaOU9+l6tGXXTom9t0
	=
X-Gm-Gg: ASbGncsWhOjKiV+K4APHyy0H4CMg6OxD1LYuK4JadAsK79G673HMUChorBb4nIySH6o
	G/oyRpaSkEpbAAH+/GgZYqsr7To42a0LieI4D8DXdf4K0loJJJ2bYmMy0h36rg1Tkxci37J12aY
	Bgb7Uch4j0eiKIORKYSeLbQU4S4QZh+9EShnJ77lFksUzNI76H0afcgvMM3aDsZO3/2L8fyhRJb
	W8Mq/eORxzbnB4loIb0a7SaYLbh0IVc6FC2dlO6uLmcESzjXEuccl1BK2GoWo3wyjFnjXhNeXnG
	6Cqk45aRaG+EQJtx
X-Google-Smtp-Source: AGHT+IHtkOpy+uRVk2kql+/Zn77K9CNMxaplMJtf8wzDWd/vhXD7wvU6GvVZaPeXJZuEbxsQhSSMLw==
X-Received: by 2002:a05:6a20:9185:b0:1cf:3677:1c4a with SMTP id adf61e73a8af0-1e0e0ac3705mr3868558637.16.1732702810007;
        Wed, 27 Nov 2024 02:20:10 -0800 (PST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com. [209.85.210.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b21sm9862401b3a.36.2024.11.27.02.20.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:20:08 -0800 (PST)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7251abe0e69so2257573b3a.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 02:20:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjJ8r11nvrH3YMM/73xZ2ufGojsQMtt2vQ++27NeGbotoct1GZt7wRfiDjYf+VFVT6Unbhv2dx9yF/4Q==@vger.kernel.org
X-Received: by 2002:a05:6a00:1396:b0:724:62b3:58da with SMTP id
 d2e1a72fcca58-72530043fe3mr3288577b3a.6.1732702807121; Wed, 27 Nov 2024
 02:20:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-1-eb8722531b8c@chromium.org> <20241127091153.GA31095@pendragon.ideasonboard.com>
 <CANiDSCs36Ndyjz52aYA0SHef8JVQc=FvtDNk8xQwR=30m652Gg@mail.gmail.com> <20241127094212.GF31095@pendragon.ideasonboard.com>
In-Reply-To: <20241127094212.GF31095@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 11:19:55 +0100
X-Gmail-Original-Message-ID: <CANiDSCuukO7kQw=VHyHS3ir3y4mCERbnRoUTTTSoRHZkMpLBdg@mail.gmail.com>
Message-ID: <CANiDSCuukO7kQw=VHyHS3ir3y4mCERbnRoUTTTSoRHZkMpLBdg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: Do not set an async control owned by
 other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 10:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Nov 27, 2024 at 10:25:48AM +0100, Ricardo Ribalda wrote:
> > On Wed, 27 Nov 2024 at 10:12, Laurent Pinchart wrote:
> > > On Wed, Nov 27, 2024 at 07:46:10AM +0000, Ricardo Ribalda wrote:
> > > > If a file handle is waiting for a response from an async control, avoid
> > > > that other file handle operate with it.
> > > >
> > > > Without this patch, the first file handle will never get the event
> > > > associated to that operation.
> > >
> > > Please explain why that is an issue (both for the commit message and for
> > > me, as I'm not sure what you're fixing here).
> >
> > What about something like this:
> >
> > Without this patch, the first file handle will never get the event
> > associated with that operation, which can lead to endless loops in
> > applications. Eg:
> > If an application A wants to change the zoom and to know when the
> > operation has completed:
> > it will open the video node, subscribe to the zoom event, change the
> > control and wait for zoom to finish.
> > If before the zoom operation finishes, another application B changes
> > the zoom, the first app A will loop forever.
>
> So it's related to the userspace-visible behaviour, there are no issues
> with this inside the kernel ?

It is also required by the granular PM patchset.


>
> Applications should in any case implement timeouts, as UVC devices are
> fairly unreliable. What bothers me with this patch is that if the device
> doesn't generate the event, ctrl->handle will never be reset to NULL,
> and the control will never be settable again. I think the current
> behaviour is a lesser evil.

The same app can set the control as many times as it wants, and if
that app closes the next patch will clean out the handle.
Maybe I should invert the patches?


>
> > > What may be an issue is that ctrl->handle seem to be accessed from
> > > different contexts without proper locking :-S
> >
> > Isn't it always protected by ctrl_mutex?
>
> Not that I can tell. At least uvc_ctrl_status_event_async() isn't called
> with that lock held. uvc_ctrl_set() seems OK (a lockedep assert at the
> beginning of the function wouldn't hurt).

ctrl->handle = NULL in uvc_ctrl_status_event_async() is completely redundant.

The only place we set the value of the handle is in uvc_ctrl_set, and
that can only happen for controls with mappings.
I am sending another patch to remove that set to make it clear.

>
> As uvc_ctrl_status_event_async() is the URB completion handler, a
> spinlock would be nicer than a mutex to protect ctrl->handle.
>
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 4fe26e82e3d1..5d3a28edf7f0 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -1950,6 +1950,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > >       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> > > >               return -EACCES;
> > > >
> > > > +     /* Other file handle is waiting a response from this async control. */
> > > > +     if (ctrl->handle && ctrl->handle != handle)
> > > > +             return -EBUSY;
> > > > +
> > > >       /* Clamp out of range values. */
> > > >       switch (mapping->v4l2_type) {
> > > >       case V4L2_CTRL_TYPE_INTEGER:
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

