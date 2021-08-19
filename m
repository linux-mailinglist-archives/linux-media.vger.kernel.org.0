Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFE23F1747
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 12:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238305AbhHSK3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 06:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238275AbhHSK3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 06:29:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C06C061756;
        Thu, 19 Aug 2021 03:28:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A08D92A8;
        Thu, 19 Aug 2021 12:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629368908;
        bh=lISKDYc3o051GT2hAejf1dhaRCqMYCISVMvV1v3RQUk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KTdwkC4mOQtcsHBgqbiZMiU5XKqdlU4woOiYdokhfElJEzjgttCIwhuOfokKVKTBL
         PJGpvFc6vRyqkX5tg1G17GeTvrGfX/VixfInmVxVmxPpTxHrl11FpapM6pQixnwXAd
         K9GChX7OWuLxrbWT9a41DkXcdzep6kk2xfoXVzRU=
Date:   Thu, 19 Aug 2021 13:28:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Quirk for hardware with invalid sof
Message-ID: <YR4yRfEmMvsAXRfu@pendragon.ideasonboard.com>
References: <20210818203502.269889-1-ribalda@chromium.org>
 <YR2INUYJSZCnBiC0@pendragon.ideasonboard.com>
 <CANiDSCuP3OS7Z9UmHApPMmt0X3yrAoKVShEZgZ1oCvPgYshUSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuP3OS7Z9UmHApPMmt0X3yrAoKVShEZgZ1oCvPgYshUSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Aug 19, 2021 at 08:27:00AM +0200, Ricardo Ribalda wrote:
> On Thu, 19 Aug 2021 at 00:22, Laurent Pinchart wrote:
> > On Wed, Aug 18, 2021 at 10:35:02PM +0200, Ricardo Ribalda wrote:
> > > The hardware timestamping code has the assumption than the device_sof
> > > and the host_sof run at the same frequency (1 KHz).
> > >
> > > Unfortunately, this is not the case for all the hardware. Add a quirk to
> > > support such hardware.
> > >
> > > Note on how to identify such hardware:
> > > When running with "yavta -c /dev/videoX" Look for periodic jumps of the
> > > fps. Eg:
> > >
> > > 30 (6) [-] none 30 614400 B 21.245557 21.395214 34.133 fps ts mono/SoE
> > > 31 (7) [-] none 31 614400 B 21.275327 21.427246 33.591 fps ts mono/SoE
> > > 32 (0) [-] none 32 614400 B 21.304739 21.459256 34.000 fps ts mono/SoE
> > > 33 (1) [-] none 33 614400 B 21.334324 21.495274 33.801 fps ts mono/SoE
> > > 34 (2) [-] none 34 614400 B 21.529237 21.527297 5.130 fps ts mono/SoE
> > > 35 (3) [-] none 35 614400 B 21.649416 21.559306 8.321 fps ts mono/SoE
> > > 36 (4) [-] none 36 614400 B 21.678789 21.595320 34.045 fps ts mono/SoE
> > > ...
> > > 99 (3) [-] none 99 614400 B 23.542226 23.696352 33.541 fps ts mono/SoE
> > > 100 (4) [-] none 100 614400 B 23.571578 23.728404 34.069 fps ts mono/SoE
> > > 101 (5) [-] none 101 614400 B 23.601425 23.760420 33.504 fps ts mono/SoE
> > > 102 (6) [-] none 102 614400 B 23.798324 23.796428 5.079 fps ts mono/SoE
> > > 103 (7) [-] none 103 614400 B 23.916271 23.828450 8.478 fps ts mono/SoE
> > > 104 (0) [-] none 104 614400 B 23.945720 23.860479 33.957 fps ts mono/SoE
> > >
> > > They happen because the delta_sof calculated at
> > > uvc_video_clock_host_sof(), wraps periodically, as both clocks drift.
> >
> > That looks plain wrong. First of all, the whole purpose of the SOF clock
> > is to have a shared clock between the host and the device. It makes no
> > sense for a device to have a free-running "SOF" clock. Given the log
> > above, the issue occurs so quickly that it doesn't seem to be a mere
> > drift of a free running clock. Could you investigate this more carefully
> > ?
> 
> In my test the dev_sof runs at 887.91Hz and the dev_sof at 1000.35Hz.
> If I plot the difference of both clocks host_sof - (dev_sof % 2048), I
> get this nice graph https://imgur.com/a/5fQnKa7
> 
> 
> I agree that it makes not sense to have a free-running "SOF", but the
> manufacturer thinks otherwise :)

In that case there's no common clock between the device and the host,
which means that clock recovery is impossible. The whole timestamp
computation should be bypassed, and the driver should use the system
timestamp instead.

I still find it hard to believe that a Logitech camera would get this
wrong.

> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > v2: Fix typo in frequency
> > >
> > >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> > >  drivers/media/usb/uvc/uvc_video.c  | 11 +++++++++--
> > >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> > >  3 files changed, 20 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 9a791d8ef200..d1e6cba10b15 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2771,6 +2771,15 @@ static const struct usb_device_id uvc_ids[] = {
> > >         .bInterfaceSubClass   = 1,
> > >         .bInterfaceProtocol   = 0,
> > >         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
> > > +     /* Logitech HD Pro Webcam C922 */
> > > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +       .idVendor             = 0x046d,
> > > +       .idProduct            = 0x085c,
> > > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +       .bInterfaceSubClass   = 1,
> > > +       .bInterfaceProtocol   = 0,
> > > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
> > >       /* Chicony CNF7129 (Asus EEE 100HE) */
> > >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index 6d0e474671a2..760ab015cf9c 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -518,13 +518,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> > >       /* To limit the amount of data, drop SCRs with an SOF identical to the
> > >        * previous one.
> > >        */
> > > -     dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > > +     if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> > > +             dev_sof = usb_get_current_frame_number(stream->dev->udev);
> > > +     else
> > > +             dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > > +
> > >       if (dev_sof == stream->clock.last_sof)
> > >               return;
> > >
> > >       stream->clock.last_sof = dev_sof;
> > >
> > > -     host_sof = usb_get_current_frame_number(stream->dev->udev);
> > > +     if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> > > +             host_sof = dev_sof;
> > > +     else
> > > +             host_sof = usb_get_current_frame_number(stream->dev->udev);
> > >       time = uvc_video_get_time();
> > >
> > >       /* The UVC specification allows device implementations that can't obtain
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index cce5e38133cd..89d909661915 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -209,6 +209,8 @@
> > >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> > >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> > >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > > +#define UVC_QUIRK_INVALID_DEVICE_SOF 0x00002000
> > > +
> > >
> > >  /* Format flags */
> > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001

-- 
Regards,

Laurent Pinchart
