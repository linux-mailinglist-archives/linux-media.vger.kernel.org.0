Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7222E0F2A
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 21:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgLVUFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 15:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgLVUFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 15:05:13 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEBCC0613D3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 12:04:32 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id w12so13033633ilm.12
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 12:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSpk1zeEhDoLh5bsqq9yVPc9+N8b5efRRkRUskDUITI=;
        b=OzEGGHjPaieGGNgo9hNTR3cBHieBD02D+rN7pHRGJKCRpDUhTPl/MMoJwYkm2hWagX
         cNpmbhk7cPy484245N5AlLMh3d0ucZJ9H6UBMTb5q/VBlPwRhl5gfktBkK0RMUGfrsi3
         D961UyhCIA3N+uNFF3j99t8mVBY2N8U3k1Gmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSpk1zeEhDoLh5bsqq9yVPc9+N8b5efRRkRUskDUITI=;
        b=W10+ujRT/3BO/isOEpj3ZUZVw0ItcadT9++Rwr7MzNiTbzZ+E7yKtZSf3k6pNt7VzE
         as8tuhCEUN6iRowCH3i3eBBCWTN9YlRTWO4lnE/0mXqeu+BNITy+lRTo2vCHOQ88myL2
         639dKR2dCu9nAfZi1HJe8Jmn0vk7/FQiBK3x1TGsMA31eEIsPnKsvmxFfeC2AaC8ROZa
         6YzkfoSDHrCq+TBfzqvaFP8/xhkItIK0AO4T2hGTJ9MXI00x6C0Ln1bR3uk78PzSVIrY
         bi2s7XlBr/EnU9sl+qT+tEunx2HdCOf4NhBroJmP1XvG7zSnaIyNVIYg+y3N/Y3fx7/u
         17rg==
X-Gm-Message-State: AOAM5330poYlxeNVBZU6WZ7KYr9sUj7ZIn/lcDV/AUFlRfbozqy0lrk1
        RCYtKOlK5epCQIzYMvI9+bTk56FpJOz4Ngb5
X-Google-Smtp-Source: ABdhPJzYU+/AW2CDfTRDS5zwtSwnZD3AOsX8Nb0qh/5ziSG61w7N4Wciysuc4+YaoqdytO55+5u7fA==
X-Received: by 2002:a92:de09:: with SMTP id x9mr22265863ilm.257.1608667471771;
        Tue, 22 Dec 2020 12:04:31 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id t22sm16579176ill.35.2020.12.22.12.04.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 12:04:31 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id u12so13070132ilv.3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 12:04:30 -0800 (PST)
X-Received: by 2002:a92:1b43:: with SMTP id b64mr21353866ilb.71.1608667470394;
 Tue, 22 Dec 2020 12:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20201221164819.792019-1-ribalda@chromium.org> <20201221164819.792019-10-ribalda@chromium.org>
 <X+HKpxzbVC29lNlk@pendragon.ideasonboard.com>
In-Reply-To: <X+HKpxzbVC29lNlk@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 22 Dec 2020 21:04:19 +0100
X-Gmail-Original-Message-ID: <CANiDSCv_+Usx4QkG4ypGWbCKvusiugYGgeNRYP8GZJ_pvuhjEQ@mail.gmail.com>
Message-ID: <CANiDSCv_+Usx4QkG4ypGWbCKvusiugYGgeNRYP8GZJ_pvuhjEQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Laurent

Thanks for your review!

On Tue, Dec 22, 2020 at 11:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Dec 21, 2020 at 05:48:16PM +0100, Ricardo Ribalda wrote:
> > Some devices, can only read the privacy_pin if the device is
>
> s/devices,/devices/
>
> > streaming.
> >
> > This patch implement a quirk for such devices, in order to avoid invalid
> > reads and/or spurious events.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 57 ++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_queue.c  |  3 ++
> >  drivers/media/usb/uvc/uvcvideo.h   |  4 +++
> >  3 files changed, 61 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 72516101fdd0..7af37d4bd60a 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <linux/atomic.h>
> > +#include <linux/dmi.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > @@ -1472,6 +1473,17 @@ static int uvc_parse_control(struct uvc_device *dev)
> >  /* -----------------------------------------------------------------------------
> >   * Privacy GPIO
> >   */
>
> There should be a blank line here.
>
> > +static bool uvc_gpio_is_streaming(struct uvc_device *dev)
> > +{
> > +     struct uvc_streaming *streaming;
> > +
> > +     list_for_each_entry(streaming, &dev->streams, list) {
> > +             if (uvc_queue_streaming(&streaming->queue))
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> >
> >
>
> But not too blank lines here.
>
> >  static u8 uvc_gpio_update_value(struct uvc_device *dev,
> > @@ -1499,7 +1511,12 @@ static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> >       if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> >               return -EINVAL;
> >
> > +     if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) &&
> > +         !uvc_gpio_is_streaming(dev))
> > +             return -EBUSY;
> > +
> >       *(uint8_t *)data = uvc_gpio_update_value(dev, entity);
> > +
> >       return 0;
> >  }
> >
> > @@ -1528,19 +1545,50 @@ static struct uvc_entity *uvc_gpio_find_entity(struct uvc_device *dev)
> >       return NULL;
> >  }
> >
> > -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > +void uvc_privacy_gpio_event(struct uvc_device *dev)
> >  {
> > -     struct uvc_device *dev = data;
> >       struct uvc_entity *unit;
> >
> > +
> >       unit = uvc_gpio_find_entity(dev);
> >       if (!unit)
> > -             return IRQ_HANDLED;
> > +             return;
> >
> >       uvc_gpio_update_value(dev, unit);
> > +}
> > +
> > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > +{
> > +     struct uvc_device *dev = data;
> > +
> > +     /* Ignore privacy events during streamoff */
> > +     if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> > +             if (!uvc_gpio_is_streaming(dev))
> > +                     return IRQ_HANDLED;
>
> I'm still a bit concerned of race conditions. When stopping the stream,
> vb2_queue.streaming is set to 0 after calling the driver's .stop_stream()
> handler. This means that the device will cut power before
> uvc_gpio_is_streaming() can detect that streaming has stopped, and the
> GPIO could thus trigger an IRQ.

On the affected devices I have not seen this. I guess it takes some
time to discharge. Anyway I am implementing a workaround. Tell me if
it is too ugly.

>
> You mentioned that devices have a pull-up or pull-down on the GPIO line.
> As there are only two devices affected, do you know if it's a pull-up or
> pull-down ? Would it be worse to expose that state to userspace than to
> return -EBUSY when reading the control ?

The module has a 100K pull up. This is, it will return "Privacy = 0".

We cannot return the default value, as it would make the user believe
that the privacy is in a different state that currently is.
In other words, userspace needs to know at all times if the privacy is
in : unknow_state, on, off.

>
> > +
> > +     uvc_privacy_gpio_event(dev);
> > +
> >       return IRQ_HANDLED;
> >  }
> >
> > +static const struct dmi_system_id privacy_valid_during_streamon[] = {
> > +     {
> > +             .ident = "HP Elite c1030 Chromebook",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Jinlon"),
> > +             },
> > +     },
> > +     {
> > +             .ident = "HP Pro c640 Chromebook",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Dratini"),
> > +             },
> > +     },
> > +     { } /* terminate list */
> > +};
> > +
> >  static int uvc_gpio_parse(struct uvc_device *dev)
> >  {
> >       struct uvc_entity *unit;
> > @@ -1577,6 +1625,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
> >
> >       list_add_tail(&unit->list, &dev->entities);
> >
> > +     if (dmi_check_system(privacy_valid_during_streamon))
> > +             dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
>
> This will also match any external UVC camera plugged to one of the
> affected systems, right ? It shouldn't matter in practice as those
> devices won't have a GPIO entity.

I did think about that but did not make it explicit in the code.
Adding a comment.

>
> I suppose we can't match on VID:PID instead because the same VID:PID is
> used in both devices affected by this issue, and devices immune to it ?

The problem with VID:PID, is that the manufacturer can decide to
change the camera module and then the quirk will not work.

We cannot rely ONLY in VID:PID as these modules are also used in other
models not affected by the quirk.

I believe that it is also correct to rely on the dmi, as the quirk is
caused for the way the camera module is wired, which is on the
motherboard.


>
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > index cd60c6c1749e..e800d491303f 100644
> > --- a/drivers/media/usb/uvc/uvc_queue.c
> > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > @@ -337,9 +337,12 @@ int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
> >  int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> >  {
> >       int ret;
> > +     struct uvc_streaming *stream = uvc_queue_to_stream(queue);
>
> Please swap the two lines.
>
> >
> >       mutex_lock(&queue->mutex);
> >       ret = vb2_streamon(&queue->queue, type);
> > +     if (stream->dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> > +             uvc_privacy_gpio_event(stream->dev);
>
> Even when vb2_streamon() failed ?
>
> >       mutex_unlock(&queue->mutex);
> >
> >       return ret;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 079a407ebba5..32c1ba246d97 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -209,6 +209,7 @@
> >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > +#define UVC_QUIRK_PRIVACY_DURING_STREAM      0x00002000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > @@ -826,6 +827,9 @@ extern const struct v4l2_file_operations uvc_fops;
> >  int uvc_mc_register_entities(struct uvc_video_chain *chain);
> >  void uvc_mc_cleanup_entity(struct uvc_entity *entity);
> >
> > +/* Privacy gpio */
> > +void uvc_privacy_gpio_event(struct uvc_device *dev);
> > +
> >  /* Video */
> >  int uvc_video_init(struct uvc_streaming *stream);
> >  int uvc_video_suspend(struct uvc_streaming *stream);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
