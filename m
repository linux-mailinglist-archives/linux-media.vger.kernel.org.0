Return-Path: <linux-media+bounces-20609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF49B6E09
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 21:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89D81F2181C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 20:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA97213EE0;
	Wed, 30 Oct 2024 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FAGdueiH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A561E131A
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730321255; cv=none; b=KgLOWIFkJ2aDoTe2S+zZwMUi8gqGAay5gSrqh5GSocYlkIxI2aowPfFf30WTTk4j7vKOqTFLtXX+ZHMqjpIA0AJgAEsMF0kyc3xDnQX1RkQra3bZfSPPQrhccCModuzWagvVQYQ48jW5sWxeYnjwJYwYAdVwgpySYGKhMtw3G9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730321255; c=relaxed/simple;
	bh=I3vsmOzgclqoqfmLg5ufr0SU5GsxHBFUWZrBrA/TGts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvJ0PM5G+kMj70qP8wtb4jPDNyHBkbyi/+SLaQdajdLqJNESolKdwI68tuY/Zlzc1KuX3A1lwzuF0ihiUXUgpOhfhUgcIj65DhMgvJum065qMS6iy0zkx6uVC6eZrP45R5zx0qiWv/OGHSbiJGGgnSD/kXq6PW+jY+9nZTGAbVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FAGdueiH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20caea61132so2304515ad.2
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 13:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730321252; x=1730926052; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SzzKjN2VOTrWLiiKka7ssyNPK1L48qKyaTrQyd5IbBY=;
        b=FAGdueiH0bmM71QYbnzJaECj9n+13frltPcn+ny4nh89axQTQQ1QBUVJ5C5faVPNMQ
         hJfsgxLKj1QMdm+Fj6ZT0B6/MF/n49EJggkeU2OvdtM4cRH9+trtJIgJNCK6aieH5dF2
         EU70c9qtAX+FEq/d9PKQmHsu6D5cI7WycA/so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730321252; x=1730926052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzzKjN2VOTrWLiiKka7ssyNPK1L48qKyaTrQyd5IbBY=;
        b=ElwhIHjJ0uiFryVB8Ux6OCxOm73Tq33+pGbvgGW9uGpw7Y6EH5rKlqv0oo4kkFR3jp
         5Cb/G15esFdPIwz67I2xsc/PWdHpUrkRaYL1av3OV617YjXU1bmv3OdFLu+QDvR0r5j6
         LbN71MUougzrokScTGf7qHleEzWTER0QY6s0gKM35DDqCvwffq05WBbIBpKTGxNURvXh
         haIX4fLaUbpSwA430/l9RKd4dFfnzuKpDqcrWTWwERoVsZtyRZZd1PhaYQ6j7HgphAE8
         rC6I4pgzJwaGofGGIO3N8QrTRiRXviRP/7Pg9814kueEuvaXEOuUeLu6Bbn+x4SDywun
         3AHg==
X-Forwarded-Encrypted: i=1; AJvYcCWedHQlz5Wuos+tFDxShTJd9EHXr1Fu5Lxs8mDYVb2z+fQK5efpoOfDJ+zppRhCcJU84mu/9+y0WLjKag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9lfywQMcTvw9T/gX+aLeWiEq6fW0Nwgh7EblnIBKeMqWoPuU
	lWEYFhEF3CZyQmDBWw04Sw3xWq+cluU//QR+eO0/d+qo03lhUQjLvoh734kYkbXCjP8/Z2x7h80
	=
X-Google-Smtp-Source: AGHT+IEi0TLF+Q6ojMsR4+FkLwCG7xORaHRnwZV87iqDy0Z0933sOOREOvQVV6zPvxiAWpnP4T9HNA==
X-Received: by 2002:a17:902:db0d:b0:20b:b238:9d02 with SMTP id d9443c01a7336-210c6c1ea92mr260917435ad.33.1730321251941;
        Wed, 30 Oct 2024 13:47:31 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c081asm42395ad.201.2024.10.30.13.47.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 13:47:31 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so187856a91.0
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 13:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZiA0Z8h/4jC5G93ApQbv61jygtrNzzuy6eDHpCfDAT2bV7MstNaxImhPLVBALuGJ1a7KqX4wyVGIhGg==@vger.kernel.org
X-Received: by 2002:a17:90a:e016:b0:2e2:d5fc:2848 with SMTP id
 98e67ed59e1d1-2e8f104a71bmr18777990a91.4.1730321249958; Wed, 30 Oct 2024
 13:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
 <ZyJB4Kxn3Gm79_MH@valkosipuli.retiisi.eu> <CANiDSCvGTGo+O14Z=pL=CaZo-9DrzVJ-JwD5GG0Z=cJDTcUG4w@mail.gmail.com>
In-Reply-To: <CANiDSCvGTGo+O14Z=pL=CaZo-9DrzVJ-JwD5GG0Z=cJDTcUG4w@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Oct 2024 21:47:17 +0100
X-Gmail-Original-Message-ID: <CANiDSCvMyp-13=4DUbau-2K5F2kURy3Mgvf-ZQxSqoAJ3yU93g@mail.gmail.com>
Message-ID: <CANiDSCvMyp-13=4DUbau-2K5F2kURy3Mgvf-ZQxSqoAJ3yU93g@mail.gmail.com>
Subject: Re: UVC: Privacy gpio as subdevice
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 30 Oct 2024 at 16:04, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Sakari
>
> On Wed, 30 Oct 2024 at 15:25, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Ricardo,
> >
> > On Wed, Oct 30, 2024 at 02:03:18PM +0100, Ricardo Ribalda wrote:
> > > Hi Hans (de Goede, but others are welcome as well :) )
> > >
> > > Some notebooks have a button to disable the camera (not to be mistaken
> > > with the mechanical cover). This is a standard GPIO linked to the
> > > camera via the ACPI table.
> > >
> > > 4 years ago we added support for this button in UVC via the Privacy control.
> > > This has two issues:
> > > - If the camera has its own privacy control, it will be masked
> > > - We need to power-up the camera to read the privacy control gpio.
> > >
> > > We tried to fix the power-up issues implementing "granular power
> > > saving" but it has been more complicated than anticipated....
> > >
> > > Last year, we proposed a patchset to implement the privacy gpio as a
> > > subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> > >
> > > I think it is a pretty clean solution and makes sense to use a
> > > subdevice for something that is a sub device of the camera :).
> > >
> > > Before moving forward, Laurent and I would like to hear your opinion.
> >
> > I remember we discussed this and I wasn't very enthusiastic about the
> > proposal but thinking about it again, there are situations where this is
> > the only feasible solution, including on raw cameras with a privacy GPIO,
> > besides the first issue you brought up above.
> >
> > Regarding the second one, why would you need to power on the camera to get
> > the GPIO's value?
>
> In order to read the control, you need to open the device, and once
> you open the device the device is powered up:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_v4l2.c#n621
>
> In a perfect world it would only be powered up during streamon(), but
> uvc is a complicated monster:
> - We have delayed controls
> - We have buttons
> If we only power up the device during streamon those things would not
> work properly.
>
> I think I have a solution for delayed controls...assuming the device
> implements the standard properly.
> I have no solution to support buttons :(. Luckily not that many
> cameras have that today
>
> Regards!
>
>
> >
> > I'll review the set.

If you have time to review something, please take a look instead at:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/tree/uvc-subdevice?ref_type=heads

Once I test that on real hardware is what I plan to send to the ML.

It has support for the ancillary link and it is a bit cleaner.

Thanks!


> >
> > While in the case of UVC it's fairly clear what the sub-device is related
> > to, but for the general case it'd be good to have an ancillary link there.
> >
> > --
> > Regards,
> >
> > Sakari Ailus
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

