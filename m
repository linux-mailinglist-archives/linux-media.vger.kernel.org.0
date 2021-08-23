Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367D73F480A
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 11:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhHWJ5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhHWJ5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 05:57:38 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4FEC061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 02:56:55 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id j18so20968147ioj.8
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7qpHpDcmlssC+BWCGansOtr3RWREEfeLz55ok9vf5I=;
        b=ljrQuWngrN8qnDeDj+bxoCw9EfvW6Juvc6XKshtI5AejrC2id/FR5pNthhyRoZLhNM
         gs9XCFvYU3q3yUACGjE3xxEEKZJAJe96Ctz5K4GI7RcJmoK2uh2j+X81d06py9pwt4Bb
         sykXGAinrpMCwS9bsiOyBDGniUV55QQGPvIfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7qpHpDcmlssC+BWCGansOtr3RWREEfeLz55ok9vf5I=;
        b=oF2GwrDt2EvGUVnEKmC9KtdaiAqP0H6vCglKJULUMBlC2vfvgj9g1Ov0uZil98oBQ3
         lDWHw48nzGHVHRnGPZLnQJaN05Xp8qocK/hYJAlaNh0PLPjRHeX/6hkFyELb2rYCb6JB
         oXteXQ1CgxvbwOXxjoiSHAC9ct4SsFR8VR8OJyIl2xL+9HJV61SNr1JDJsYg7sgIYh4z
         Q0jVGFw5FqQDz9kHLB5JEbeKysoXFYFtLO4Avfw9wCQ8VCjxiNJvp7FcmFWnWXmkhY1g
         cYUv6E1x4nrSDhzrc6x6lEi41phaPDFoqIzf6prwpND7gRzCt+KUtl6FqavA7D5znWev
         JxvQ==
X-Gm-Message-State: AOAM530DOytrWVYZyxXya65OeSonSjcLerH12F/sLRe/4XhfpI+Iy3Rc
        +LKWI/GNxx8HXLI4RoveT3ao0t9Zc6dnBQ==
X-Google-Smtp-Source: ABdhPJywGDYRDA+LbsZoKN2YffYoMOau+6I73GUnOAshTynmvTEY0pLvSJILf2FhQQRa+0Taaf8nlg==
X-Received: by 2002:a02:7f48:: with SMTP id r69mr28682763jac.17.1629712614983;
        Mon, 23 Aug 2021 02:56:54 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id v14sm8615937ilc.65.2021.08.23.02.56.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 02:56:54 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id h29so16529438ila.2
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 02:56:54 -0700 (PDT)
X-Received: by 2002:a92:da4c:: with SMTP id p12mr21550457ilq.89.1629712613838;
 Mon, 23 Aug 2021 02:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210818203502.269889-1-ribalda@chromium.org> <YR2INUYJSZCnBiC0@pendragon.ideasonboard.com>
 <CANiDSCuP3OS7Z9UmHApPMmt0X3yrAoKVShEZgZ1oCvPgYshUSA@mail.gmail.com>
 <YR4yRfEmMvsAXRfu@pendragon.ideasonboard.com> <CANiDSCvStwDkkW7FLwTmogsH45292gugAvZfuoss3aJ9RzOAQw@mail.gmail.com>
 <YR5nhmF3MXdjtCvs@pendragon.ideasonboard.com> <CANiDSCtPGCnQNuGUxDbbQPgtj3a_6eOtaABXk=39Y7b-03gQNA@mail.gmail.com>
 <YSL/q9A5F7W9r92E@pendragon.ideasonboard.com>
In-Reply-To: <YSL/q9A5F7W9r92E@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 23 Aug 2021 11:56:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtYFRNzUio8vujd_Pppz=WUZTj4sYrJwwXwRuewWEMasw@mail.gmail.com>
Message-ID: <CANiDSCtYFRNzUio8vujd_Pppz=WUZTj4sYrJwwXwRuewWEMasw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Quirk for hardware with invalid sof
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 23 Aug 2021 at 03:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Aug 19, 2021 at 04:46:38PM +0200, Ricardo Ribalda wrote:
> > On Thu, 19 Aug 2021 at 16:15, Laurent Pinchart wrote:
> > > On Thu, Aug 19, 2021 at 01:31:32PM +0200, Ricardo Ribalda wrote:
> > > > On Thu, 19 Aug 2021 at 12:28, Laurent Pinchart wrote:
> > > > > On Thu, Aug 19, 2021 at 08:27:00AM +0200, Ricardo Ribalda wrote:
> > > > > > On Thu, 19 Aug 2021 at 00:22, Laurent Pinchart wrote:
> > > > > > > On Wed, Aug 18, 2021 at 10:35:02PM +0200, Ricardo Ribalda wrote:
> > > > > > > > The hardware timestamping code has the assumption than the device_sof
> > > > > > > > and the host_sof run at the same frequency (1 KHz).
> > > > > > > >
> > > > > > > > Unfortunately, this is not the case for all the hardware. Add a quirk to
> > > > > > > > support such hardware.
> > > > > > > >
> > > > > > > > Note on how to identify such hardware:
> > > > > > > > When running with "yavta -c /dev/videoX" Look for periodic jumps of the
> > > > > > > > fps. Eg:
> > > > > > > >
> > > > > > > > 30 (6) [-] none 30 614400 B 21.245557 21.395214 34.133 fps ts mono/SoE
> > > > > > > > 31 (7) [-] none 31 614400 B 21.275327 21.427246 33.591 fps ts mono/SoE
> > > > > > > > 32 (0) [-] none 32 614400 B 21.304739 21.459256 34.000 fps ts mono/SoE
> > > > > > > > 33 (1) [-] none 33 614400 B 21.334324 21.495274 33.801 fps ts mono/SoE
> > > > > > > > 34 (2) [-] none 34 614400 B 21.529237 21.527297 5.130 fps ts mono/SoE
> > > > > > > > 35 (3) [-] none 35 614400 B 21.649416 21.559306 8.321 fps ts mono/SoE
> > > > > > > > 36 (4) [-] none 36 614400 B 21.678789 21.595320 34.045 fps ts mono/SoE
> > > > > > > > ...
> > > > > > > > 99 (3) [-] none 99 614400 B 23.542226 23.696352 33.541 fps ts mono/SoE
> > > > > > > > 100 (4) [-] none 100 614400 B 23.571578 23.728404 34.069 fps ts mono/SoE
> > > > > > > > 101 (5) [-] none 101 614400 B 23.601425 23.760420 33.504 fps ts mono/SoE
> > > > > > > > 102 (6) [-] none 102 614400 B 23.798324 23.796428 5.079 fps ts mono/SoE
> > > > > > > > 103 (7) [-] none 103 614400 B 23.916271 23.828450 8.478 fps ts mono/SoE
> > > > > > > > 104 (0) [-] none 104 614400 B 23.945720 23.860479 33.957 fps ts mono/SoE
> > > > > > > >
> > > > > > > > They happen because the delta_sof calculated at
> > > > > > > > uvc_video_clock_host_sof(), wraps periodically, as both clocks drift.
> > > > > > >
> > > > > > > That looks plain wrong. First of all, the whole purpose of the SOF clock
> > > > > > > is to have a shared clock between the host and the device. It makes no
> > > > > > > sense for a device to have a free-running "SOF" clock. Given the log
> > > > > > > above, the issue occurs so quickly that it doesn't seem to be a mere
> > > > > > > drift of a free running clock. Could you investigate this more carefully
> > > > > > > ?
> > > > > >
> > > > > > In my test the dev_sof runs at 887.91Hz and the dev_sof at 1000.35Hz.
> > > > > > If I plot the difference of both clocks host_sof - (dev_sof % 2048), I
> > > > > > get this nice graph https://imgur.com/a/5fQnKa7
> > > > > >
> > > > > > I agree that it makes not sense to have a free-running "SOF", but the
> > > > > > manufacturer thinks otherwise :)
> > > > >
> > > > > In that case there's no common clock between the device and the host,
> > > > > which means that clock recovery is impossible. The whole timestamp
> > > > > computation should be bypassed, and the driver should use the system
> > > > > timestamp instead.
> > > >
> > > > Or said differently. The clock recovery is susceptible to the jitter
> > > > in the frame acquisition.
> > > >
> > > > If you have no jitter, the clock recovered will match the reality, and
> > > > if you have bad jitter, it will be as bad as system timestamp.
> > >
> > > The whole point of the clock recovery code is to convert a precise
> > > timestamp, expressed using a device clock that the host has no access
> > > to, to a system clock. This can only be done if the relationship between
> > > the two clocks can be inferred, and the UVC specifies a mechanism to
> > > allow this by using a common clock, in the form of the SOF counter. If
> > > we don't have that, we're essentially screwed, and can't use the
> > > algorithm implemented in the driver at all. I'd much rather skip is
> > > completely in that case, instead of trying to hack the algorithm itself.
> >
> > Considering T(f) as the time between the usb package (f) is received
> > and uvc_video_clock_decode()
> > If the jitter between the different T(f)s is under one unit of our
> > clock (1 msec) the accuracy of the "hacked" algorithm and the real
> > algorithm is exactly the same.
> >
> > We can agree that 1 msec is a "lot" of time. And if our system has a
> > worse latency than that, the hacked algorithm will not be worse than
> > system timestamping.
> >
> > So in most of the situations this patch will produce better timestamps
> > than the current code and never worse than now...
>
> How can it produce better timestamps if it's missing the crucial
> information that provides the correlation of timestamps between the
> device and host side ?

Because in a system with a latency jitter under 1msec sof_device and
sof_host you already know that information: sof_host = sof_device

It is a special case of the general problem.

>
> > Anyway, I have tried to ping the vendor to see if there is something
> > that I could be doing wrong, lets see what they reply.
> >
> > > On a side note, I think the whole clock recovery implementation should
> > > move from the uvcvideo driver to userspace, where we'll have the ability
> > > to perform floating point computation. The kernel implementation is
> > > crude, it should be replaced with a linear regression.
> >
> > Agree, but instead of a linear regression, a resampling algorithm.
>
> A linear regression is likely a good enough resampling algorithm in this
> case, but I'd be curious to see if someone could do better.
>
> > > > So this patch will still be better than nothing.
> > > >
> > > > > I still find it hard to believe that a Logitech camera would get this
> > > > > wrong.
> > > >
> > > > I guess I can send you a device, or give you access to mine remotely
> > > > if you do not believe me :)
> > > >
> > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > ---
> > > > > > > > v2: Fix typo in frequency
> > > > > > > >
> > > > > > > >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> > > > > > > >  drivers/media/usb/uvc/uvc_video.c  | 11 +++++++++--
> > > > > > > >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> > > > > > > >  3 files changed, 20 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > index 9a791d8ef200..d1e6cba10b15 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > @@ -2771,6 +2771,15 @@ static const struct usb_device_id uvc_ids[] = {
> > > > > > > >         .bInterfaceSubClass   = 1,
> > > > > > > >         .bInterfaceProtocol   = 0,
> > > > > > > >         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
> > > > > > > > +     /* Logitech HD Pro Webcam C922 */
> > > > > > > > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > > > > > > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > > > > > +       .idVendor             = 0x046d,
> > > > > > > > +       .idProduct            = 0x085c,
> > > > > > > > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > > > > > > > +       .bInterfaceSubClass   = 1,
> > > > > > > > +       .bInterfaceProtocol   = 0,
> > > > > > > > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
> > > > > > > >       /* Chicony CNF7129 (Asus EEE 100HE) */
> > > > > > > >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > > > > > >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > > index 6d0e474671a2..760ab015cf9c 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > > > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > > @@ -518,13 +518,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> > > > > > > >       /* To limit the amount of data, drop SCRs with an SOF identical to the
> > > > > > > >        * previous one.
> > > > > > > >        */
> > > > > > > > -     dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > > > > > > > +     if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> > > > > > > > +             dev_sof = usb_get_current_frame_number(stream->dev->udev);
> > > > > > > > +     else
> > > > > > > > +             dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > > > > > > > +
> > > > > > > >       if (dev_sof == stream->clock.last_sof)
> > > > > > > >               return;
> > > > > > > >
> > > > > > > >       stream->clock.last_sof = dev_sof;
> > > > > > > >
> > > > > > > > -     host_sof = usb_get_current_frame_number(stream->dev->udev);
> > > > > > > > +     if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> > > > > > > > +             host_sof = dev_sof;
> > > > > > > > +     else
> > > > > > > > +             host_sof = usb_get_current_frame_number(stream->dev->udev);
> > > > > > > >       time = uvc_video_get_time();
> > > > > > > >
> > > > > > > >       /* The UVC specification allows device implementations that can't obtain
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > > index cce5e38133cd..89d909661915 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > > @@ -209,6 +209,8 @@
> > > > > > > >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> > > > > > > >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> > > > > > > >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > > > > > > > +#define UVC_QUIRK_INVALID_DEVICE_SOF 0x00002000
> > > > > > > > +
> > > > > > > >
> > > > > > > >  /* Format flags */
> > > > > > > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
