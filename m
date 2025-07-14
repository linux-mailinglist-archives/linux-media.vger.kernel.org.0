Return-Path: <linux-media+bounces-37697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CDB0468B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870293B5CAB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062AB265CB3;
	Mon, 14 Jul 2025 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WKf88vQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFCC24C060
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514390; cv=none; b=Py9SH2LRbzCyFPa/vCA2U02jt1JzZW0PBsAP1rLQAYRysa5dtRBpFgHL0fjGgIWuizv6Ita3yPp7szuTamSZriYS7IG1XvhEDrjwL2VatxdVb7klJGrn+4/hhNVZqX42nORHAJ7/8xkvz/+P6Pj8wIFZbFoSG8MuNc6nk+xg4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514390; c=relaxed/simple;
	bh=9dt4Id7QdMdz0Ry4Rbk+m8yJjN2Det9Z6ZBegcBti5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7Y/s1TIaO0cFqdP6IjnF0QtlnXoNN1PPOoXXPINfoCK2AMsovtEu7sfsQig7s8VQrWAqbY4wxYMw3ND1eMtPOmjvT0I6sd291ytlbMdhDN44s/yEjv1CI3AHBMxzSSfPbVsJWX8UCy5cuQJS66YTlKL0aH8TaiCMnN5hApti0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WKf88vQ8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553d52cb80dso4174410e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752514387; x=1753119187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MdPtX9RwpQ3ik/HxF0lzEQ4LW/v3zlMrbszI/qKMcIA=;
        b=WKf88vQ81DQNNzOAU3Jn23qf44NZfJPLtA+bAj1Q3QMRE1bqqiHwidY2n/RgcSStNX
         jbocioYcBXR6ngMy86sRiAJmFmthibaIgXhBXnExepVwzkLjJwm7zVp2A1KxqmHNmIbU
         mtZ/eUuSWqN4Ct4b43R3NncSnIXWReX3B0f0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514387; x=1753119187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdPtX9RwpQ3ik/HxF0lzEQ4LW/v3zlMrbszI/qKMcIA=;
        b=Pluk9yOF1B96/qABl09u4AlW123oDW9eFqyux63NRuqi1M68v++M+fyinY/e5JSMrI
         bx5OaAhjLU4YOWzD0nEp0Elo72qt1B9P5rR2AV8MlxXjPLGOu7rREQGDmBDvB603jw+d
         6ABTRbOOpGHg7AYR0ZoLYPkjr/ftaQJFlAMIOFJH5nACVS7xVbWq3i+Ci5HekoJLeCSr
         N7OceDZ0sRO3acCyNwoQzsDngiRBoJUlvcUbYJuNvZBjWeA6KAdYSEmc+x+pCR36z8L6
         NeuvzqcE0wifoxBz1vj0VdByx7ApB+/kkSuG3mH/qIorT7c3pnvbzLycJtrs9UjpXL2H
         sk0g==
X-Forwarded-Encrypted: i=1; AJvYcCV0R8ZAfk1Mfpys5867MDmyhAWWriAV2qQYzh0mLQX163auhm6yV67gl0cnf8OUT9+7kGX8ZfwRZYWSIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHs4VtYY5+0ceBels0bJZt+DqSOE7F9dhkpGMZtpzIAzP5yfuQ
	O2qly2x4DYxVL6t0OnM7RSn3kvzYn3Jpci4UtsdgsVCR80gyiLbhqJ14ZNpuyoqoRZyS1FUVezz
	MTb0K2A==
X-Gm-Gg: ASbGncuxQzoxWr8PH06zeQ9hrqYVe9D57hio2zK2K+rJtd04zVlwo3st/6stPzuHDnR
	YdeMW5Adh74/jxiyKx1yYoW8Yxi0KyETYNhEz8hB6Z69kBGJqCPNMMVw3nUkzEy1upCGpp6xtgy
	Mt3ae5pVdsWnkVfT9u/COL2YDHgqtFCT7Yt7+3/s/KozBv2LQV5mQ1UgLq5QxF+DfpU6B5z7gHh
	a5HQN+4CqSOXXPK0iemOZcoSGYN9XV91P+Q4y+4b3JeSPEYIj43phEUVhFn0DzbjP3DUHRos9t9
	B6AizuMJ8axYGZ4EXje2Y0FbbY9KWLgSimmls8j8+B49oTegvcx9spTOKcVtn3aCpuPe3xIlGcz
	oMAgu3dcoYVQDT+dI6YVJ3Vsleqe+xZa6Zj6zq3LVmonJnherwCr5UYaXuM2K
X-Google-Smtp-Source: AGHT+IHUCoE73aSLHg6ZulwHCjsOgiLDhwHkJrBtIfRaIK4NZlDD9cUpNMSe7YNbEdqieuWc9awJaw==
X-Received: by 2002:a05:6512:10c6:b0:553:2969:1d54 with SMTP id 2adb3069b0e04-55a1c45de3amr180279e87.8.1752514386422;
        Mon, 14 Jul 2025 10:33:06 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d0ef3sm2022499e87.137.2025.07.14.10.33.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 10:33:05 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55516abe02cso4484196e87.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 10:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHDE01Sjs0CTYbdAOLLH/bmsHqWTZN7eFe25IoWfqgp8McOnSk+Tx9Dfn1t/U0RrQ7x85Zn7dyhw98WQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3f12:b0:553:2308:1ac5 with SMTP id
 2adb3069b0e04-55a1c43e72cmr168872e87.4.1752514384822; Mon, 14 Jul 2025
 10:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org> <20250714145935.GL8243@pendragon.ideasonboard.com>
 <CANiDSCt=cS9_BsEvo8fEpRDfud9nob2nzgDR6CvmcFczZurG2w@mail.gmail.com>
 <20250714162700.GA20231@pendragon.ideasonboard.com> <CANiDSCstp18Ee6JXtuOEgyZyg9=NsMPvbrkHHrN0KydLXqAO3A@mail.gmail.com>
 <20250714170740.GC20231@pendragon.ideasonboard.com>
In-Reply-To: <20250714170740.GC20231@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 19:32:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsv2jmsQXVrSCrdsJR8YzJiriH4OLubFZU0F3x8hRDZSg@mail.gmail.com>
X-Gm-Features: Ac12FXz8Ep_cFoOB4Vj2cnp5MYrYJ6Hv42XDDoCFKgaYR_-NFLo1lG7Ye27Dj3Q
Message-ID: <CANiDSCsv2jmsQXVrSCrdsJR8YzJiriH4OLubFZU0F3x8hRDZSg@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 19:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 14, 2025 at 06:42:14PM +0200, Ricardo Ribalda wrote:
> > On Mon, 14 Jul 2025 at 18:27, Laurent Pinchart wrote:
> > > On Mon, Jul 14, 2025 at 06:21:05PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 14 Jul 2025 at 17:00, Laurent Pinchart wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > >
> > > > > A bit of a stupid question, or rather a question that I wonder why I
> > > > > didn't think of before.
> > > >
> > > > I believe we discussed this in the very beginning, when I just enabled
> > > > V4L2_META_FMT_D4XX for all the devices.
> > >
> > > Sorry if that was the case, it was a while ago.
> > >
> > > > We thought that it could break applications. Imagine an APP that can
> > > > work with D4XX but not with other formats: if it tries to parse MSXU
> > > > format it might crash.
> > >
> > > How so, if V4L2_META_FMT_D4XX and V4L2_META_FMT_UVC_MSXU_1_5 identify
> > > the same format ?
> >
> > D4XX uses vendor IDs from MSXU (0x80000000-2) [1]. There is no
> > guarantee that other vendors will collide with that ID.
>
> I assume you mean "will not collide" ? There's also no guarantee that
> different vendors implementing the MSXU won't use vendor-specific
> metadata with colliding IDs, is there ?

New apps will have to implement mechanisms to make sure that the data
is valid for them, but old apps did not have to care about id
collisions or unknown IDs.
They might even use the output of VIDIOC_ENUM_FMT to decide if a camera is D4XX.


>
> > Also, we do not know how apps will behave with IDs that they do not
> > know or with sizes that they have not been tested with.
>
> The change won't cause any regression for those apps when using Intel
> D4xx devices.

You are correct, but they might crash with notebooks internal cameras
and those cannot be easily disconnected.

At this stage I believe the current approach is the safest.


>
> > [1] https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/pixfmt-meta-d4xx.html#id8
> >
> > > > > On Mon, Jul 07, 2025 at 06:34:04PM +0000, Ricardo Ribalda wrote:
> > > > > > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > > > > > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > > > > > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > > > > > V4L2_META_FMT_D4XX copies the whole metadata section.
> > > > > >
> > > > > > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > > > > > devices, but it is useful to have the whole metadata payload for any
> > > > > > device where vendors include other metadata, such as the one described by
> > > > > > Microsoft:
> > > > > > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> > > > > >
> > > > > > This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> > > > > > identical to V4L2_META_FMT_D4XX.
> > > > >
> > > > > Wouldn't it be simpler for everybody to just
> > > > >
> > > > > #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('D', '4', 'X', 'X') /* UVC MSXU metadata */
> > > > > #define V4L2_META_FMT_D4XX      V4L2_META_FMT_UVC_MSXU_1_5 /* For backward compatibility */
> > > > >
> > > > > ? I'm a bit uncomfortable with committing to a UABI with two different
> > > > > 4CCs for the exact same format.
> > > > >
> > > > > > Let the user enable this format with a quirk for now. This way they can
> > > > > > test if their devices provide useful metadata without rebuilding the
> > > > > > kernel. They can later contribute patches to auto-quirk their devices.
> > > > > > We will also work in methods to auto-detect devices compatible with this
> > > > > > new metadata format.
> > > > > >
> > > > > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > > > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> > > > > >  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++++++++++++
> > > > > >  MAINTAINERS                                        |  1 +
> > > > > >  drivers/media/usb/uvc/uvc_metadata.c               |  4 ++++
> > > > > >  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
> > > > > >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> > > > > >  include/uapi/linux/videodev2.h                     |  1 +
> > > > > >  7 files changed, 32 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > > index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..0de80328c36bf148051a19abe9e5241234ddfe5c 100644
> > > > > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > > @@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
> > > > > >      metafmt-pisp-fe
> > > > > >      metafmt-rkisp1
> > > > > >      metafmt-uvc
> > > > > > +    metafmt-uvc-msxu-1-5
> > > > > >      metafmt-vivid
> > > > > >      metafmt-vsp1-hgo
> > > > > >      metafmt-vsp1-hgt
> > > > > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > > > > > new file mode 100644
> > > > > > index 0000000000000000000000000000000000000000..dd1c3076df243d770a13e7f6d07c3296a269e16a
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > > > > > @@ -0,0 +1,23 @@
> > > > > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > > > > +
> > > > > > +.. _v4l2-meta-fmt-uvc-msxu-1-5:
> > > > > > +
> > > > > > +***********************************
> > > > > > +V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
> > > > > > +***********************************
> > > > > > +
> > > > > > +Microsoft(R)'s UVC Payload Metadata.
> > > > > > +
> > > > > > +
> > > > > > +Description
> > > > > > +===========
> > > > > > +
> > > > > > +V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
> > > > > > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > > > > > +metadata in the `buffer[]` field, not just the first 2-12 bytes.
> > > > > > +
> > > > > > +The metadata format follows the specification from Microsoft(R) [1].
> > > > > > +
> > > > > > +.. _1:
> > > > > > +
> > > > > > +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index 658543062bba3b7e600699d7271ffc89250ba7e5..fdde1d37ed2ef9058e3ea3417bec25afe454dfc0 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -25827,6 +25827,7 @@ S:    Maintained
> > > > > >  W:   http://www.ideasonboard.org/uvc/
> > > > > >  T:   git git://linuxtv.org/media.git
> > > > > >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> > > > > > +F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > > > > >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > > >  F:   drivers/media/common/uvc.c
> > > > > >  F:   drivers/media/usb/uvc/
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > > index 4bcbc22f47e67c52baf6e133f240131ff3d32a03..77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > > @@ -195,6 +195,10 @@ void uvc_meta_init(struct uvc_device *dev)
> > > > > >           !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
> > > > > >               dev->meta_formats[i++] = dev->info->meta_format;
> > > > > >
> > > > > > +     if (dev->quirks & UVC_QUIRK_MSXU_META &&
> > > > > > +         !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC_MSXU_1_5))
> > > > > > +             dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
> > > > > > +
> > > > > >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> > > > > >       dev->meta_formats[i++] = 0;
> > > > > >  }
> > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > index b3c094c6591e7a71fc00e1096bcf493a83f330ad..616adc417c62a58686beccbc440a5dfac0a2d588 100644
> > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > @@ -77,6 +77,7 @@
> > > > > >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00008000
> > > > > >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> > > > > >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> > > > > > +#define UVC_QUIRK_MSXU_META          0x00040000
> > > > > >
> > > > > >  /* Format flags */
> > > > > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > index be94a79b976e3de4eb957f5d2584ec6d4230469e..993b36417b4655456ce545cb42a41b55b98e4d6c 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > @@ -1463,6 +1463,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > > > > >       case V4L2_META_FMT_VSP1_HGO:    descr = "R-Car VSP1 1-D Histogram"; break;
> > > > > >       case V4L2_META_FMT_VSP1_HGT:    descr = "R-Car VSP1 2-D Histogram"; break;
> > > > > >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> > > > > > +     case V4L2_META_FMT_UVC_MSXU_1_5:        descr = "UVC MSXU Metadata"; break;
> > > > > >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> > > > > >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> > > > > >       case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A Parameters"; break;
> > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > > > > index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..863bc5b7dec32303e852d7e9c3891011ce5a3d71 100644
> > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > @@ -867,6 +867,7 @@ struct v4l2_pix_format {
> > > > > >  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
> > > > > >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> > > > > >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> > > > > > +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
> > > > > >  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> > > > > >
> > > > > >  /* Vendor specific - used for RK_ISP1 camera sub-system */
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

