Return-Path: <linux-media+bounces-47316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97799C6B378
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 19:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C2484E407F
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFBA2D5A0C;
	Tue, 18 Nov 2025 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y6Ldg65m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929F1270557
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490669; cv=none; b=egKyxzDlW02sUUJymRDZwcMXkF9EsQXFUXEU/TGdXAeZWj0nM5hIs95xaFcKyzJ+5nmQHbnFRgVTQvs9qbFj38aVqjn4jEUbca1GnD4c1ovG4gbyfdMPD+6LkIUaSBqUZ3XiNOu8KKc2dTNQK9Eb5lQP9QSk9C20rJvksLzNjwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490669; c=relaxed/simple;
	bh=P3BkHutUzZpErH606PWVYArfOtRbKMR0WpEHsrNUd6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOif90mSr5Wm2AS9L4WA4Fy1N9zrjD60jiPgjWdZwh8UZ1n36gtCmc1cwu8nfIg/e8UcO2wzIOWRl4OXBADpzCiCrzgpsX0f6YbgCtF3gxy/1L/QRox7leMgUvNXmV1gT6rM3T0bpY6gEdvBcLSuO0NWFEyOMTBOq9HRAgzZBNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y6Ldg65m; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5958232f806so5702331e87.0
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763490665; x=1764095465; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VhYP8Yr2Bs/L0pguVS42Jfu20UdXEvyQ6QTbcMCUyc8=;
        b=Y6Ldg65mbpfO/CNpSKcfDTp1z+GIkHzTb9EKUpE3X1HEJbWKZgPZ7U+lUFtpZcoB91
         /tAHH4v5wmOOWUAf7PD9zzwCfANL3d1thoIWASXgcQEQH9+d1meDdlP/vhSAiYJqSoU2
         lX5LGM+rALODHqPV8mmlYEUyxW/Otyh9iFaD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490665; x=1764095465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhYP8Yr2Bs/L0pguVS42Jfu20UdXEvyQ6QTbcMCUyc8=;
        b=MRfWb9IvuqTUY8enRLOUUQ3I8yxenPcqWqVwMOUJXCgH4govgneUOt8UbR1lOkbOLd
         g2OeeDq16Dw39y2Ixv6HpgwJVHmevTNyUCohk/kMJxqE73/4NH3tFf32bS0qLUbfK6SG
         7U8xuB649l0MVspoTGq/W9x3BYrC+1jOavgvQ5x7zcBo5r3XW83BTrwfc9SB8o/5J3Sx
         sbJ1b9qQxDP3PAhzOth5XbyqygSM9bpKh3hLZSzLvn2wZLJ1TBxaKK72X8wh6cHzvDzX
         +sRRJQc9WnMpV0wqtoHBqHp8ngi1KKFwi+I1RWG7P7Vh9x8O0HC29c1RXKf61A3chA0z
         74Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWlKCD8xdroVDstMSAUiuvC8ouypELf+Hvf0tdMKtwHi16TkddKc8osGedelQ6G333pljDhkIEKYF57qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWK9Zr5LcqGvNkjAnt07eynDP1lrVwpz2POOHWrlpquGL3g6+q
	pc53pGUCexQ7jomllbmFK/0140V5DNiJFV/AMFjnaBzaWsdRhBRuoyz9kMD8jR0DrP1RxkEXNRb
	tdaNq5g==
X-Gm-Gg: ASbGncuvkg9f9yQpgm0JJ/0gvoXkGUHw8vw7HyqAOPpOtFn5Je7GUJ+aGUyLwmzoExR
	xjiip9xEktXSuTWN0+4fX2RpFbv4W/4HWJ6F455W0TrtRSwNSOOn/MPTgtp5yHcLwAxsFHACrEY
	dJSpweInWvhQ6EeoV/rQMqz9uzrZJYGcEuiD4nM96P4gsK36qc8YlepqAxGGq3m4fme1vpeWCkj
	+2F9c17jLFRa0aZCbA5azWBSSB59EHGC8OGzjRr2ntlqW4PQ6vSUGJZ2RJ9QmPE/hK55eqmyAPt
	xwsah1JwOaqkZYZzlpxBYTQ7XQJgjKpodTwhyY15kTUrbi7RPvYYNjQeTRcCnEiPYb3geQdB3/z
	ZtVBsNi4pvkcqKpHq57eHur9ymhtebeF3N5P88F2tfYRLANLxDuj+8LGgnjJlCcXGlsPxmB+A9y
	OGdtlGgYCR8LPtoYpyNOpPk/OPldTrsbFpgc/RSDMZQ0V1Rt/4c9DGQlAIdgA=
X-Google-Smtp-Source: AGHT+IFUkW4Z2c15lNXP95oGua6AujIBBde3ozN86lKfFCbMXjpH6qzXzg75p6jx1VG9q7VK0fpfMg==
X-Received: by 2002:a05:6512:104f:b0:594:3340:1b63 with SMTP id 2adb3069b0e04-5958423391cmr6263374e87.49.1763490665453;
        Tue, 18 Nov 2025 10:31:05 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400269sm4144146e87.51.2025.11.18.10.31.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:31:03 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5958232f806so5702288e87.0
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:31:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcopWmvp6WvZUNlz29fDpp92FO2+uf4mkiZiX5WiAQ75zzTm/RXh30bdB636OFhnoUHlwBSqbAMuKS/A==@vger.kernel.org
X-Received: by 2002:a05:6512:2342:b0:595:8200:9f8f with SMTP id
 2adb3069b0e04-595841b7044mr5328031e87.18.1763490663342; Tue, 18 Nov 2025
 10:31:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu> <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
 <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu> <381cf376-72b0-4a5f-a99e-524f6d83a2d0@kernel.org>
 <374afd7b45297979278d02f6b06abaed35c12eae.camel@irl.hu>
In-Reply-To: <374afd7b45297979278d02f6b06abaed35c12eae.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 19:30:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCtZw48bHc7m7aVPX8jFubkPYc-NKXtcWg1_rdiCMVXLnw@mail.gmail.com>
X-Gm-Features: AWmQ_bkMHdZVf0LVzn1ijYbE1e_BvdtuDPL2POQEtFyju11rtqGYEj2xQq-UrxY
Message-ID: <CANiDSCtZw48bHc7m7aVPX8jFubkPYc-NKXtcWg1_rdiCMVXLnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>
Cc: Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

On Tue, 18 Nov 2025 at 16:36, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Hans,
>
> On Tue, 2025-11-18 at 15:26 +0100, Hans de Goede wrote:
>
> >
> > > > Do you have a compelling use-case for turning off the privacy LED?
> > > >
> > >
> > > As a pet camera, it is useful to be able to turn off the LED.
> > > In some cases, it can also eliminate unwanted reflections.
> > > Some cameras may have blue LED, and if someone hates blue LEDs..
> >
> > And almost all cameras already do not allow manually overriding the LED
> > turning on while streaming. There is a very low-tech solution for this,
> > put some black isolation tape over the LED :)
> >
>
> Yes, this is also a good and stable solution. :)
>
> > > > My core goal is simple: if the camera is in use, the privacy LED must
> > > > be ON. If the LED is ON unexpectedly, it serves as a clear indication
> > > > that something unusual is happening.
> >
> > ...
> >
> > > > No freedom is lost. This change simply increases the
> > > > trustworthiness/reliability of your device.
> > >
> > > It will decrease to the extent that fewer people will know that such an
> > > option exists because they will not read the description of the
> > > module's parameters.
> >
> > People currently already will not know that the option exists.
> >
> > Seeing the current LED controls on Logitech cams requires 2 manual steps:
> >
> > 1. Install uvcdynctrl which maps the custom GUIDs to the LED controls
> >    Note distros do not install this be default
> > 2. Use either a GUI v4l2-control app like qv4l2ucp or gtk-v4l, or
> >    v4l-ctrl -l to list controls and then change the setting.
> >
> > So there already is close to 0 discoverability for this Logitech
> > only feature.
>
> This is not completely true.
> The cameractrls uses these extensions and controls with
> uvc_xu_control_query() and has over 140k downloads on Flathub alone.
>
> >
> > For the new MIPI cameras on laptops we have deliberately made it
> > impossible to disable the privacy LED while streaming even though
> > it is often controlled by a separate GPIO because of privacy reasons.
> >
> > For the same privacy reasons I fully agree with Ricardo that this should
> > be behind a module option. Which replaces step 1. with creating
> > a /etc/modprobe.d/uvc.conf file, so just about as much work.
> >
>
> I agree that this will be useful. The module parameter is also simpler
> than per-V4L2 control permission management. And the latter is not
> needed in other cases, I think.
>
> However, if allow_privacy_override is enabled, would it be worth
> mapping these controls by the kernel?
> So uvcdynctrl or cameractrls would not be needed for this control.

If allow_privacy_override is enabled and there is a standard control
in include/uapi/linux/v4l2-controls.h that supports such control: I
have no issue adding the mapping for it.

Right now we only have V4L2_CID_PRIVACY which is a boolean and has
usually been used to tell if the privacy shutter is on or off, not to
configure the LED.

In any case, the default value of allow_privacy_override should be
false. I would even argue that the best approach is to block all the
known LED config controls after a deprecation period.
Check: https://lore.kernel.org/linux-media/CANiDSCuv8UG6TMx6pK348okK+NYzAorPEgPYzoRCEZiBDgPP=A@mail.gmail.com/

> >
>
> Regards,
> Gergo



-- 
Ricardo Ribalda

