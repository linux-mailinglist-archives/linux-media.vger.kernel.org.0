Return-Path: <linux-media+bounces-2190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36BE80E36F
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 05:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 916C5282D82
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 04:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E801D510;
	Tue, 12 Dec 2023 04:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4lier0E6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99805A6
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 20:45:13 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54f4a933ddcso7815a12.0
        for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 20:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702356312; x=1702961112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXpPo5NG1prk5EHl+RqUBy0UlrM2U3MxLLiGKQ/pfMQ=;
        b=4lier0E6iasuaDaYdnoEjBa6tXilnS/R/GkOU35u8lHQgIDGAA5F3CS6QciGW4fE34
         geGNXz49D1dBbDUD/1YjVKVHaLNt3YOJX1ILTLMEuZeheTxi0E9/F9k3hDv+pY5rbNCf
         QYpHLuljZISK3sNHhCiq0FY8/O+xYnmNhHA4dfxX9O/ixqFNE8QN/LYM2WR1K6n9THFY
         W+yTzVURrEMMMze1t/xZpHD2lEZ8GdCRc651E0Hn6QpRF73ZUtGL2TDLBSXHstJUUuvu
         P6yO5Dicozch2t6PPHJvvCN/mwkfTD4EubOuZ2KCgQLxRp52Sdtil3uVdemItfJdTRM2
         dg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702356312; x=1702961112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXpPo5NG1prk5EHl+RqUBy0UlrM2U3MxLLiGKQ/pfMQ=;
        b=kpuAZT8nXWiTRs2E+Xn9u6uMVWSkwvXm+Kod+vke8nuiZZQCgk0F5mCtwYrAfKVWE7
         3D44EDsIDVUngml1VCiDfiRYlLm5I2aFzJnNH+tPjlD/6lswR9UJ+Yx3iM+vG+7kA4Xx
         33IRqLMb6Pa1Bp6L6Ywx8xYAXWdNCGQ1PSi7UvimXKdybiZBD2w23QFFwMkNute3hLaB
         K1FKPOwkUTHUtYvnV17BsZ5zaZMs1ubN3V0SRJCRmTX5jeUBvgGfaV4OMo+wk0SVwI7y
         P0CY2I7NM1n7dhPT/BhMGyHDbYTPWvM67Mmkley8uAPOAf7TyuaJdDayJ8hjsMf5RrnY
         NH6A==
X-Gm-Message-State: AOJu0YwXgttsMbLIs/D95Eb1OC8g4+birrPM1k2Hyl1+tkbHh2vpEbi2
	FhL8PQqzwH3SE0Q63F6Rmztbg1mzFAAEyqdUwA3I/g==
X-Google-Smtp-Source: AGHT+IEg0cViTj3hD/omLNe7RQqf0Pfr+XOJu87uce5P1pXI/eaS22cHY0ZBd0SHlprDvfJCn0psNoX46f6uTTIXItI=
X-Received: by 2002:a50:c092:0:b0:543:fb17:1a8 with SMTP id
 k18-20020a50c092000000b00543fb1701a8mr260568edf.3.1702356311936; Mon, 11 Dec
 2023 20:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com> <20231201071907.3080126-12-yunkec@google.com>
 <20231208160055.GL25616@pendragon.ideasonboard.com>
In-Reply-To: <20231208160055.GL25616@pendragon.ideasonboard.com>
From: Yunke Cao <yunkec@google.com>
Date: Tue, 12 Dec 2023 13:45:00 +0900
Message-ID: <CANqU6FfFadXUnU8DveoQgL5TuYv1ok3Z3ZkATmZsL4JSRV0a=Q@mail.gmail.com>
Subject: Re: [PATCH v14 11/11] media: uvcvideo: document UVC v1.5 ROI
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thanks for the review!

On Sat, Dec 9, 2023 at 1:00=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Fri, Dec 01, 2023 at 04:19:02PM +0900, Yunke Cao wrote:
> > Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> It would be useful to point here to the userspace code that uses those
> controls. A link to the appropriate Chrome OS git tree would be useful,
> to showcase a real user.

Does https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:sr=
c/platform2/camera/hal/usb/
work?
Do you think we need the link in both the commit message and this .rst file=
?

>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> > Changelog since v11:
> > - No change.
> > Changelog since v10:
> > - Added Reviewed-by from Sergey.
> > Changelog since v9:
> > - No change.
> > Changelog since v8:
> > - No change.
> > Changelog since v7:
> > - Fix documentation for automatic exposure based on comment in v7.
> >
> >  .../userspace-api/media/drivers/uvcvideo.rst  | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/D=
ocumentation/userspace-api/media/drivers/uvcvideo.rst
> > index aab4304e6bb5..3dc062221f8b 100644
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
> > @@ -255,3 +256,64 @@ Argument: struct uvc_xu_control_query
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
> > +     independent of the field of view, not impacted by any cropping or
> > +     scaling.
> > +
> > +     Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` t=
o query
> > +     the range of rectangle sizes. The left/top coordinates of a minim=
um or
> > +     maximum rectangle are always 0. For example, a device can have a =
minimum
> > +     ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.
>
> Is that actually true ? The UVC 1.5 specification states
>
>     GET_MAX shall return the current Window as specified by
>     CT_DIGITAL_WINDOW_CONTROL.
>
> And the window can have non-zero left and right coordinates.
>

Ah, you are right. I think I will just remove "The left/top
coordinates of a minimum or maximum rectangle are always 0."

> > +
> > +     Setting a ROI allows the camera to optimize the capture for the r=
egion.
> > +     The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determi=
nes
> > +     the detailed behavior.
> > +
> > +
> > +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
> > +     This determines which, if any, on board features should track to =
the
>
> s/on board/on-board/
>
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
> > +      - Setting this to true causes automatic exposure to track the re=
gion of
>
> Maybe "Setting this bit causes..." as those values are bit flags, not
> booleans. Same below.
>

Sounds good.

> > +     interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
> > +      - Setting this to true causes automatic iris to track the region=
 of
> > +     interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > +      - Setting this to true causes automatic white balance to track t=
he region
> > +     of interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
> > +      - Setting this to true causes automatic focus adjustment to trac=
k the
> > +     region of interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > +      - Setting this to true causes automatic face detection to track =
the
> > +     region of interest instead of the whole image.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > +      - Setting this to true enables automatic face detection and trac=
king. The
> > +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be upda=
ted by
> > +     the driver.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> > +      - Setting this to true enables automatic image stabilization. Th=
e
> > +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be upda=
ted by
> > +     the driver.
> > +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > +      - Setting this to true enables automatically capture the specifi=
ed region
>
> I wonder what this means, the UVC 1.5 specification doesn't document
> this bit clearly :-(
>

I have no idea :-( . I haven't seen any camera module in Chrome OS
attempt to implement this bit, either.

Best,
Yunke

> > +     with higher quality if possible.
>
> --
> Regards,
>
> Laurent Pinchart

