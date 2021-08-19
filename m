Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1B03F1384
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 08:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhHSG1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 02:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhHSG1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 02:27:48 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2E4C061756
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 23:27:13 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id b7so6278947iob.4
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytAdw+4HbwxOixwhqqwAmgZxwbQ6ZemJDjSd2P3wFF4=;
        b=BEC7/EhVvY7tvtV8oDyQd/m6axDnb0FgYYWumjx5Z2vf7CzIwceIWsKbqaNqdjRVHX
         I/8fp4pRY0VAaVkCilTbyRxB/is1D9ghUazxqokeWtm42jO2HTJ9fX3ZyJ0ZV/pV0681
         v5RYXQrDD9UiC63u0Sj56ayUkebKlM6w7o9Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytAdw+4HbwxOixwhqqwAmgZxwbQ6ZemJDjSd2P3wFF4=;
        b=bk8ZC9La9SjaoaN0oiziRcL0r/W7KBg2kwVRDmFeI7xVXt+l8HXSEoLfI+AYXWeFC8
         d3z5F/rFFXS6+guM2zsNH5xLy/mgL5ZUn+xgo4kfZV9fcojlzT2PJtmzbYQkfH7T2v0H
         T8PSOMe0XNmfU3HjuepVDyEKVGKEXFj+oeW65Wv0/pmxgtfRybfIu0gN2IbN97dmZ6a1
         iHyc59poXAZ/XH4QCoQ45HZ3iGxSjCXY6a2aKbkOuNcCQx5bHarn/uMEnlsbyEDkkLmc
         wmIC0NzkeehNVPU/hEOqgu3GvD4xKx04hKOgzlHF/F7gmLVu2/P0tPSrfcyLJPL1fYxY
         XVzQ==
X-Gm-Message-State: AOAM530vWEQFQq/0Y8NV95CVwuehXhIAjLqMTHyIrNgDx+PrVo5mbFN2
        XLKPG4sFz7GdONZzdvdsjjSnKEc3cgei3g==
X-Google-Smtp-Source: ABdhPJybQRFO+MYtjtr7QjM44NUxplAQdg3hcO7fyGoEYvmr9AcZ1ctLeRmQIC/zsOpxh8gW72EWSQ==
X-Received: by 2002:a6b:f416:: with SMTP id i22mr10204909iog.162.1629354432478;
        Wed, 18 Aug 2021 23:27:12 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id w4sm1153387ior.2.2021.08.18.23.27.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 23:27:11 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id z1so6279180ioh.7
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 23:27:11 -0700 (PDT)
X-Received: by 2002:a6b:6603:: with SMTP id a3mr10605555ioc.68.1629354431072;
 Wed, 18 Aug 2021 23:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210818203502.269889-1-ribalda@chromium.org> <YR2INUYJSZCnBiC0@pendragon.ideasonboard.com>
In-Reply-To: <YR2INUYJSZCnBiC0@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 19 Aug 2021 08:27:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCuP3OS7Z9UmHApPMmt0X3yrAoKVShEZgZ1oCvPgYshUSA@mail.gmail.com>
Message-ID: <CANiDSCuP3OS7Z9UmHApPMmt0X3yrAoKVShEZgZ1oCvPgYshUSA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Quirk for hardware with invalid sof
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for your prompt reply

On Thu, 19 Aug 2021 at 00:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Aug 18, 2021 at 10:35:02PM +0200, Ricardo Ribalda wrote:
> > The hardware timestamping code has the assumption than the device_sof
> > and the host_sof run at the same frequency (1 KHz).
> >
> > Unfortunately, this is not the case for all the hardware. Add a quirk to
> > support such hardware.
> >
> > Note on how to identify such hardware:
> > When running with "yavta -c /dev/videoX" Look for periodic jumps of the
> > fps. Eg:
> >
> > 30 (6) [-] none 30 614400 B 21.245557 21.395214 34.133 fps ts mono/SoE
> > 31 (7) [-] none 31 614400 B 21.275327 21.427246 33.591 fps ts mono/SoE
> > 32 (0) [-] none 32 614400 B 21.304739 21.459256 34.000 fps ts mono/SoE
> > 33 (1) [-] none 33 614400 B 21.334324 21.495274 33.801 fps ts mono/SoE
> > 34 (2) [-] none 34 614400 B 21.529237 21.527297 5.130 fps ts mono/SoE
> > 35 (3) [-] none 35 614400 B 21.649416 21.559306 8.321 fps ts mono/SoE
> > 36 (4) [-] none 36 614400 B 21.678789 21.595320 34.045 fps ts mono/SoE
> > ...
> > 99 (3) [-] none 99 614400 B 23.542226 23.696352 33.541 fps ts mono/SoE
> > 100 (4) [-] none 100 614400 B 23.571578 23.728404 34.069 fps ts mono/SoE
> > 101 (5) [-] none 101 614400 B 23.601425 23.760420 33.504 fps ts mono/SoE
> > 102 (6) [-] none 102 614400 B 23.798324 23.796428 5.079 fps ts mono/SoE
> > 103 (7) [-] none 103 614400 B 23.916271 23.828450 8.478 fps ts mono/SoE
> > 104 (0) [-] none 104 614400 B 23.945720 23.860479 33.957 fps ts mono/SoE
> >
> > They happen because the delta_sof calculated at
> > uvc_video_clock_host_sof(), wraps periodically, as both clocks drift.
>
> That looks plain wrong. First of all, the whole purpose of the SOF clock
> is to have a shared clock between the host and the device. It makes no
> sense for a device to have a free-running "SOF" clock. Given the log
> above, the issue occurs so quickly that it doesn't seem to be a mere
> drift of a free running clock. Could you investigate this more carefully
> ?

In my test the dev_sof runs at 887.91Hz and the dev_sof at 1000.35Hz.
If I plot the difference of both clocks host_sof - (dev_sof % 2048), I
get this nice graph
https://imgur.com/a/5fQnKa7


I agree that it makes not sense to have a free-running "SOF", but the
manufacturer thinks otherwise :)

Best regards

>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > v2: Fix typo in frequency
> >
> >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> >  drivers/media/usb/uvc/uvc_video.c  | 11 +++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  3 files changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 9a791d8ef200..d1e6cba10b15 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2771,6 +2771,15 @@ static const struct usb_device_id uvc_ids[] = {
> >         .bInterfaceSubClass   = 1,
> >         .bInterfaceProtocol   = 0,
> >         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
> > +     /* Logitech HD Pro Webcam C922 */
> > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             = 0x046d,
> > +       .idProduct            = 0x085c,
> > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   = 1,
> > +       .bInterfaceProtocol   = 0,
> > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
> >       /* Chicony CNF7129 (Asus EEE 100HE) */
> >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 6d0e474671a2..760ab015cf9c 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -518,13 +518,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       /* To limit the amount of data, drop SCRs with an SOF identical to the
> >        * previous one.
> >        */
> > -     dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > +     if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> > +             dev_sof = usb_get_current_frame_number(stream->dev->udev);
> > +     else
> > +             dev_sof = get_unaligned_le16(&data[header_size - 2]);
> > +
> >       if (dev_sof == stream->clock.last_sof)
> >               return;
> >
> >       stream->clock.last_sof = dev_sof;
> >
> > -     host_sof = usb_get_current_frame_number(stream->dev->udev);
> > +     if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> > +             host_sof = dev_sof;
> > +     else
> > +             host_sof = usb_get_current_frame_number(stream->dev->udev);
> >       time = uvc_video_get_time();
> >
> >       /* The UVC specification allows device implementations that can't obtain
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index cce5e38133cd..89d909661915 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -209,6 +209,8 @@
> >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > +#define UVC_QUIRK_INVALID_DEVICE_SOF 0x00002000
> > +
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
