Return-Path: <linux-media+bounces-22944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 603BD9E9A5D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6161881E82
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DE21BEF8E;
	Mon,  9 Dec 2024 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MPDPf4R3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5A3597B
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757752; cv=none; b=qdiPie2baJsTirR66pz1oIu6NyCd+Eyr1j26Rc71buV1ZOdpDWrqmd9XdNeHgaXRYv4Q5k10+Bi0RGQ+5a0lR22Z1tQLGkdk7oXRjJ21zc4NNxelraD6rpl0aNNaGp3jFQUnnLAMW1ehlJfhChB3kIHp1jy6ot9P1nnpzBVDpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757752; c=relaxed/simple;
	bh=e/7ppiXyE2bFji2DbmrW2m2o9qtifu9hg/k0DBCP/IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlwQYkWU9faWggBs1EifeJcTQhP3TnYvTImjuzE2F4Ge46+03T3+9d2/Mg6+reOMyaxD5IVyN+hq+i5qBRgA/3V2+BY3wr45Fd5LV1EoHlQ8Y0Y1Vp8rfUOVHYWkBN8Smz1g1xYHye5lOrcU0fdAqpc1/TOkrWjyH78G6s8nL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MPDPf4R3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216634dd574so4408615ad.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733757749; x=1734362549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k13rlXoGpiagaLgzB2bt6QaSqrl1LnLToosBhhhXPa4=;
        b=MPDPf4R3ExXlWa68FmVvBRvT3GGdlxVBxsRvhgavKcqJ994txQVksMYlKxj+Jcsa/u
         PF1DaVBf0bvdTd1rCXix9kRrE0MSbM+i3NzVfxguGu1PoRFVrQK7CDk15Of8Pgi8p0do
         0ZHbvuEoyhYjlYsYgUBbQHUhq8k9Eqgj0g7iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757749; x=1734362549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k13rlXoGpiagaLgzB2bt6QaSqrl1LnLToosBhhhXPa4=;
        b=YEEwWwNongI9Qd5+FqMxHLz3D8jRsFRtHVMm9Mf2CUdUcIcJJJOSW48r7d162RvfwF
         9z22cSSLGK+qz+XrtfOMRLCgIKUTlPSi6o/IyByPD4o6ac4SBkBYFiHu3R9HczuOTvut
         nHjXNaOa4T5t/J2ryXmeG05fNS7qVwvoZNen+NStQ8pu0CUOhdKdD8+ivUKKLDLI/i/6
         AdlWsw24PpZt/W44Rpbw6uhalCy6kQyBRE6PT4dWcXGAewak3lNoeZCPhKuMhmlST1ZB
         lE4KbeTDztPN1yyagTGzFVAydk4VpUtJeeBRAF2oLOdKZjjTFJpyRHiOQD2zxYQuxFLS
         yEyA==
X-Forwarded-Encrypted: i=1; AJvYcCXaIb4Qnypf6bpmKWMYFNG7ZKtB8Djep5lH547YPVREzMSIOkEv6/0wL0QRQVRfmeFqOx1mQl0kIa4TAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkf4bmyARG1eU72Is9IuyI/bxQybkYBtDaTm7maySL81mVX0P
	LHJesKIkLTXmADThp35UuGBgdclykOAHz+uMq/IHtHZd4oUoIw7vHMIVfZq7D5v/HQwl3MqjKFc
	=
X-Gm-Gg: ASbGncvi4ckx/zaB1qANSWtAMidVmbSMq9sSV7AoWvTnRrj8fcHtBFXR1ITt2SVQx3+
	fidoSnSEbIXRrHHiBjxMAHr4U2xHc+gz/y7PvYk+y4nuEom6VuohHyGJL38VnPFKvub0GlaRSsk
	ce5llNYxtRk+xBTMSm248Fc6fvOTR9Qal3TsDbCqpDIYvqk0Szrc4x+PS0e5AkkNvuqVPQOTSny
	x/4rNROZY/QfzjglJkmFQhwX8tOv6YChXj7yPW6OiZzPdDLzCBVQklGnKkFycIwerGFlmJ3F3qJ
	iVv3S3F7D1d2
X-Google-Smtp-Source: AGHT+IHJi8MVRNMrbOGfrZQQlFaTu++Ruzv6I3ZKhw/KygjdjOLfZZlUBb6Cswt6FjCr7Eekt0miNA==
X-Received: by 2002:a17:902:f78a:b0:216:311e:b1ce with SMTP id d9443c01a7336-21669ff444amr11621235ad.32.1733757749338;
        Mon, 09 Dec 2024 07:22:29 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21613079c56sm58614455ad.27.2024.12.09.07.22.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:22:27 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so2110733a91.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlIgd4soRvdCUGigyVy3+71ExdjDw0FLwTfsmGD1lNPrt/8jSxteMkyPUW59o6yWXkOC7pFdsUp/niTg==@vger.kernel.org
X-Received: by 2002:a17:90b:4d06:b0:2ee:c9b6:c26a with SMTP id
 98e67ed59e1d1-2efcf138420mr1295203a91.11.1733757746400; Mon, 09 Dec 2024
 07:22:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-19-64cfeb56b6f8@chromium.org> <13a3c23e-7a8a-4957-bdd7-d8de2844b904@redhat.com>
In-Reply-To: <13a3c23e-7a8a-4957-bdd7-d8de2844b904@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 16:22:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCsphbdkHePXManvtR_i4iSUmHkFXQLzZGSc7BJ900c1Hw@mail.gmail.com>
X-Gm-Features: AZHOrDn0N1TZg5Q94fWHeePIo8PqMNl6cI-URvT0Qt10Fcm3cJjtpHyddN1HXmM
Message-ID: <CANiDSCsphbdkHePXManvtR_i4iSUmHkFXQLzZGSc7BJ900c1Hw@mail.gmail.com>
Subject: Re: [PATCH v15 19/19] media: uvcvideo: document UVC v1.5 ROI
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 9 Dec 2024 at 15:36, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> > From: Yunke Cao <yunkec@google.com>
> >
> > Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >
> > An example of a userspace implementing this feature can be found at:
> > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > --->  .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > index a290f9fadae9..1cdcd45907a3 100644
> > --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > @@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
> >       UVC_CTRL_DATA_TYPE_BOOLEAN      Boolean
> >       UVC_CTRL_DATA_TYPE_ENUM         Enumeration
> >       UVC_CTRL_DATA_TYPE_BITMASK      Bitmask
> > +     UVC_CTRL_DATA_TYPE_RECT         Rectangular area
> >
> >
> >  UVCIOC_CTRL_QUERY - Query a UVC XU control
> > @@ -255,3 +256,66 @@ Argument: struct uvc_xu_control_query
> >       __u8    query           Request code to send to the device
> >       __u16   size            Control data size (in bytes)
> >       __u8    *data           Control value
> > +
> > +
> > +Driver-specific V4L2 controls
> > +-----------------------------
> > +
> > +The uvcvideo driver implements the following UVC-specific controls:
> > +
> > +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
> > +     This control determines the region of interest (ROI). ROI is a
> > +     rectangular area represented by a struct :c:type:`v4l2_rect`. The
> > +     rectangle is in global sensor coordinates and pixel units. It is
>
> Maybe: "The rectangle is in global sensor coordinates using pixel units" ?
>
> being "in pixel units" sounds a bit weird and had me confused for a moment.
>
> > +     independent of the field of view, not impacted by any cropping or
> > +     scaling.
> > +
> > +     Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
> > +     the range of rectangle sizes.
> > +
> > +     Setting a ROI allows the camera to optimize the capture for the region.
> > +     The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
> > +     the detailed behavior.
> > +
> > +     An example of use of this control, can be found in the:
> > +     `Chrome OS USB camera HAL.
> > +     <https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/>`
>
> Hmm, not sure we want this in the API documentation. OTOH why not ? Anyone else
> have an opinion on this ?

Laurent requested this:
https://lore.kernel.org/linux-media/20231218034413.GN5290@pendragon.ideasonboard.com/

>
> > +
> > +
> > +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
> > +     This determines which, if any, on-board features should track to the
> > +     Region of Interest specified by the current value of
> > +     ``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
> > +
> > +     Max value is a mask indicating all supported Auto Controls.
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE``
> > +      - Setting this bit causes automatic exposure to track the region of
> > +     interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
> > +      - Setting this bit causes automatic iris to track the region of interest
> > +        instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > +      - Setting this bit causes automatic white balance to track the region
> > +     of interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
> > +      - Setting this bit causes automatic focus adjustment to track the region
> > +        of interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > +      - Setting this bit causes automatic face detection to track the region of
> > +        interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > +      - Setting this bit enables automatic face detection and tracking. The
> > +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> > +     the driver.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> > +      - Setting this bit enables automatic image stabilization. The
> > +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> > +     the driver.
>
> This one I do not understand. Since the ROI is not a crop, I don't see how
> this interacts with image-stabilization. Typically digital image-stabilization
> uses a moving slightly smaller crop of the full sensor rectangle which it moves
> around in realtime to compensate for camera movements.
>
> So I wonder what this is expected to do. Does this set the ROI to the image
> stabilization crop ? I guess that combined with reading back the ROI that might be
> somewhat useful to follow what the image stabilization code is doing.
>
> OTOH this does not seem useful for using as region for AEC / AWB ?

Unfortunately, the standard is not very verbose about this:
https://ibb.co/VppnQ43

What about:

- ``Image Stabilization`` bit from the UVC's bmAutoControls Region of
Interest Control.

?


>
>
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > +      - Setting this bit enables automatically capture the specified region
> > +        with higher quality if possible.
> >
>
> Otherwise this looks good to me. But I would still like to see
> a discussion about using UVC custom ctrls instead of something standardized
> for this. Although I guess maybe that already happened before I got involved ?

Seems like both Hans V and Laurent preferred uvc custom controls:

https://lore.kernel.org/linux-media/a0fe2b49-12b7-8eaf-c3ef-7af1a247e595@xs4all.nl/

>
> Regards,
>
> Hans
>


-- 
Ricardo Ribalda

