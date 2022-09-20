Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED585BDEBA
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 09:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbiITHrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 03:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiITHqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 03:46:48 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80FBA1B5
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 00:46:36 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 78so1707275pgb.13
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=/OghJBretaJI6T2eb98K7pe0V1APXnx/K5zbwzrnOus=;
        b=egFRWqKxulVFVewqEq1TG+ub8w5EHWw8SaRMRYA9BywHYGkEQj5FKcZCpLvM1YgNi3
         YLaA5CbF0KNTV84YAF1FLdH+8qg1aNXRqf7HVcZ/uuQdCUmiOGFCpLZJxjl5ormuNpSU
         ySk9H6QeA3mEm0Zi5A6eDKWO8Bpcc+hYGWz5IkB9YS2nhubsKGzM9NWvrPa2qddUtsup
         r3i8EgXarNewRrXi4wbLSVAyy2aqNDeT652igXJli5a8mMSOkRKTaRiZNLbDIYdpJX9U
         sSNdiLG8KSuiHhc+fC6RFXYNveLFo4MYcQ+k6h39dFcmwGUelBz/d2eXPx4dL89ayOWP
         KfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/OghJBretaJI6T2eb98K7pe0V1APXnx/K5zbwzrnOus=;
        b=DwsMRQtD+gESbqzES6oAkOrUmfaS6+VK2SwAgSWNEgPuM7ME0RyJJx/nBEMxBfaL2Z
         4PRGzPudQIL19QH9czKdCJ6PhIioEcOay5/DjDdDnwx3U4Ojlr7QKWWwi1qmZrEkSc1x
         SXAj2ye1C+6I5whV0BLMbzk78uVLKK6ey4BAMOIyqfhRUZ+uctl7QT0KRA3dCJbhMJ1H
         ZbMFduDy5PTlR2D1bZTnUtdqN1CISEMRt4/EL+8EwjzAQxthc+Qw9oHcWTxMML0QhbWq
         2EtQB2IKaTJQjrTUnpwKRIJ/PAIatjGcBYgVJqZGbsIJbsL9RT/Eg4N8da26Ei60Gu5/
         gBCw==
X-Gm-Message-State: ACrzQf3xBc9DL1LVg7KJr05ZBjSl9vBTUqlnK7O2ENiTIFfgNeYaOS3p
        ImQaX0E96iiA733SFR0B/lsqcs/Q8h7SIUujIZaDPQ==
X-Google-Smtp-Source: AMsMyM6pUC1IjQ9Vruh6I+MJV5X/QEF3rr9oLKlgz2XfzaRfIHKu7uhI1+uHhrl/E7jfE0F7KbqZq7ixV3glV3A0nE0=
X-Received: by 2002:a05:6a00:4c11:b0:53e:4f07:fce9 with SMTP id
 ea17-20020a056a004c1100b0053e4f07fce9mr23270193pfb.66.1663659996120; Tue, 20
 Sep 2022 00:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-8-yunkec@google.com>
 <YwaHYqb2oaHIrK0E@pendragon.ideasonboard.com>
In-Reply-To: <YwaHYqb2oaHIrK0E@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 20 Sep 2022 16:46:24 +0900
Message-ID: <CANqU6Fdf3Lg_xPSKtyG3aP=Pz3ZmEp4fzs6nboSGmbccymocGQ@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] media: uvcvideo: document UVC v1.5 ROI
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review!

On Thu, Aug 25, 2022 at 5:17 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Tue, Jun 28, 2022 at 04:57:05PM +0900, Yunke Cao wrote:
> > Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  .../userspace-api/media/drivers/uvcvideo.rst  | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/D=
ocumentation/userspace-api/media/drivers/uvcvideo.rst
> > index a290f9fadae9..ee4c182aa274 100644
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
> > @@ -255,3 +256,63 @@ Argument: struct uvc_xu_control_query
> >       __u8    query           Request code to send to the device
> >       __u16   size            Control data size (in bytes)
> >       __u8    *data           Control value
> > +
>
> You can add a second blank line here, as above the "Extension Unit (XU)
> support" title.
>
> > +Private V4L2 controls
>
> "Driver-specific V4L2 controls" would be better, those controls are not
> private.
>
> > +---------------------
> > +
> > +A few UVC specific V4L2 control IDs are listed below.
>
> s/UVC specific/UVC-specific/
>
> But I'd write
>
> The uvcvideo driver implements the following UVC-specific controls:
>
> > +
> > +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
> > +     This control determines the region of interest (ROI). ROI is an
>
> s/is an/is a/
>
> > +     rectangular area represented by a struct :c:type:`v4l2_rect`. The
> > +     rectangle is in global sensor coordinates and pixel units. It is
> > +     independent of the field of view, not impacted by any cropping or
> > +     scaling.
> > +
> > +     Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` t=
o query
> > +     the range of rectangle sizes. For example, a device can have a mi=
nimum
> > +     ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.
>
> Minimum and maximum values for rectangles are ill-defined. Are the top
> and left coordinates always 0 ? If so that should be documented.
>
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
> > +     Region of Interest specified by the current value of
> > +     ``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
> > +
> > +     Max value is a mask indicating all supported Auto
> > +     Controls.
>
> No need to wrap this line.
>
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``
>
> s/V4L2/V4L2_UVC/
>
> Same below.
>
> > +      - Setting this to true enables automatic exposure time for the s=
pecified
>
> s/exposure time/exposure/ (as it can also include gain)
>
> > +     region.
>
> It's not that it enables automatic exposure for the specified region, is
> that it causes the automatic exposure to track the region of interest
> instead of the whole image. Same below.
>

I see. Thanks for clarifying. I will update this and the comments above in =
the
next version.

> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IRIS``
> > +      - Setting this to true enables automatic iris aperture for the s=
pecified
> > +     region.
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > +      - Setting this to true enables automatic white balance adjustmen=
t for the
> > +     specified region.
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_FOCUS``
> > +      - Setting this to true enables automatic focus adjustment for th=
e
> > +     specified region.
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > +      - Setting this to true enables automatic face detection for the
> > +     specified region.
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > +      - Setting this to true enables automatic face detection and trac=
king. The
> > +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be upda=
ted by
> > +     the driver.
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> > +      - Setting this to true enables automatic image stabilization. Th=
e
> > +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be upda=
ted by
> > +     the driver.
>
> How so ?


If I read the UVC specification correctly, the ROI rectangles are
volatile when these two
flags are set.
"This RoI should be the same as specified in most recent SET_CUR except in =
the
case where the =E2=80=98Auto Detect and Track=E2=80=99 and/or =E2=80=98Imag=
e Stabilization=E2=80=99
bit have been set."
(4.2.2.1.20 Digital Region of Interest (ROI) Control)

Maybe it's better to say "updated by the hardware" instead of driver?

>
>
> > +    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > +      - Setting this to true enables automatically capture the specifi=
ed region
> > +     with higher quality if possible.
>
> Could you please clarify this one ? I'm not sure to understand what it
> means.

Sorry, it's not very clear to me either... I just added it because there's =
a
"Higher Quality" in the specification.

Best,
Yunke

>
> --
> Regards,
>
> Laurent Pinchart
