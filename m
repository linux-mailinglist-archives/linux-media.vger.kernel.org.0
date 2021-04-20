Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8663651A8
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 06:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhDTEzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 00:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhDTEzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 00:55:07 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064C5C061763
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 21:54:35 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w18so43469891edc.0
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 21:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFIkJ2fkl9LC0QMBhUlEdtBeZKjOJi1lQiDp3v4zRCQ=;
        b=nmK2lL6z+fNNFNFweN/mY7XmHviUetgxARCEO+u7HbHS0leKwOlxrL5OnCJqLEFzQb
         y7Oia113JfJT/2uMjTKYOh7zDdSumpZJWDpWpflxfj0/MsdM82MZilrb6QL7EDZ9Mdep
         toSkRTawvyAo0Vv0K934c0AogTfXCoEfneAkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFIkJ2fkl9LC0QMBhUlEdtBeZKjOJi1lQiDp3v4zRCQ=;
        b=R3qL0ENLxeXM5enIreFnzPzvbYFQgHSma+bTdNTem7ya7daRpwHIryIvHdro53SwVP
         SDeHT4phiCshb8yubzteaU8R0ViPA5gaJkBm9S4sIaVEXb64zuCA3Ast/FmcPwG/Mr/C
         FJ4f22X6kYrT7mVnMpoDrwwa44gfjpsvVfb0GfB6lZB6ZbNz/4EFOVsGr8HEPPntGUF9
         Wa3DTk5z1En/97oIW40pot3xNlw1zWzm2wuAzeUbA2vqw7NEq+0RxqSa3RxnHgeM7Qe2
         75o9j4/tkU0XAWB9UB1lndvBaDmykyNM9XtXS6tXRQxxXnH1GXJ/mjNZWb2myAFyYFel
         75oQ==
X-Gm-Message-State: AOAM533+veFqhLNd/WcZ3KzGhyZseimdn8zBvlHjsbeMhpXh3aMMD/8d
        fM5/PJqhunfiYdB8HvVNYsELpFCOS/AePw==
X-Google-Smtp-Source: ABdhPJwHJGz9F0HitzjaR2G72hDafgsef5A8UlwRwcBqhGlv7yW5rodP6M7Sptb+DGdsu7YSBXjw6Q==
X-Received: by 2002:aa7:dcd3:: with SMTP id w19mr5445992edu.157.1618894474255;
        Mon, 19 Apr 2021 21:54:34 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id m14sm5080770edr.45.2021.04.19.21.54.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 21:54:33 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id x7so36129178wrw.10
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 21:54:33 -0700 (PDT)
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr18718192wrd.159.1618894472584;
 Mon, 19 Apr 2021 21:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201221164819.792019-1-ribalda@chromium.org> <20201221164819.792019-10-ribalda@chromium.org>
 <X+HKpxzbVC29lNlk@pendragon.ideasonboard.com> <CANiDSCv_+Usx4QkG4ypGWbCKvusiugYGgeNRYP8GZJ_pvuhjEQ@mail.gmail.com>
 <X+L6KSlpKERPAxsm@pendragon.ideasonboard.com> <CANiDSCsvOdB7oAGBwupb_UrV=SND96Pc2AuWu=dPAbTA-boXhQ@mail.gmail.com>
 <CANiDSCvMWtWUJT76T_4ksoc9bA0ev14kGs1S8Ashw+06iPw6tA@mail.gmail.com>
In-Reply-To: <CANiDSCvMWtWUJT76T_4ksoc9bA0ev14kGs1S8Ashw+06iPw6tA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 20 Apr 2021 13:54:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5By3GVrzww4AvnhCOdBxdC6udu5=kBCVk_yr6aZ7M1wQg@mail.gmail.com>
Message-ID: <CAAFQd5By3GVrzww4AvnhCOdBxdC6udu5=kBCVk_yr6aZ7M1wQg@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 23, 2020 at 9:56 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi again
>
> On Wed, Dec 23, 2020 at 9:31 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi Laurent
> >
> > On Wed, Dec 23, 2020 at 9:05 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Tue, Dec 22, 2020 at 09:04:19PM +0100, Ricardo Ribalda wrote:
> > > > On Tue, Dec 22, 2020 at 11:30 AM Laurent Pinchart wrote:
> > > > > On Mon, Dec 21, 2020 at 05:48:16PM +0100, Ricardo Ribalda wrote:
> > > > > > Some devices, can only read the privacy_pin if the device is
> > > > >
> > > > > s/devices,/devices/
> > > > >
> > > > > > streaming.
> > > > > >
> > > > > > This patch implement a quirk for such devices, in order to avoid invalid
> > > > > > reads and/or spurious events.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  drivers/media/usb/uvc/uvc_driver.c | 57 ++++++++++++++++++++++++++++--
> > > > > >  drivers/media/usb/uvc/uvc_queue.c  |  3 ++
> > > > > >  drivers/media/usb/uvc/uvcvideo.h   |  4 +++
> > > > > >  3 files changed, 61 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > index 72516101fdd0..7af37d4bd60a 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > @@ -7,6 +7,7 @@
> > > > > >   */
> > > > > >
> > > > > >  #include <linux/atomic.h>
> > > > > > +#include <linux/dmi.h>
> > > > > >  #include <linux/gpio/consumer.h>
> > > > > >  #include <linux/kernel.h>
> > > > > >  #include <linux/list.h>
> > > > > > @@ -1472,6 +1473,17 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > > > >  /* -----------------------------------------------------------------------------
> > > > > >   * Privacy GPIO
> > > > > >   */
> > > > >
> > > > > There should be a blank line here.
> > > > >
> > > > > > +static bool uvc_gpio_is_streaming(struct uvc_device *dev)
> > > > > > +{
> > > > > > +     struct uvc_streaming *streaming;
> > > > > > +
> > > > > > +     list_for_each_entry(streaming, &dev->streams, list) {
> > > > > > +             if (uvc_queue_streaming(&streaming->queue))
> > > > > > +                     return true;
> > > > > > +     }
> > > > > > +
> > > > > > +     return false;
> > > > > > +}
> > > > > >
> > > > > >
> > > > >
> > > > > But not too blank lines here.
> > > > >
> > > > > >  static u8 uvc_gpio_update_value(struct uvc_device *dev,
> > > > > > @@ -1499,7 +1511,12 @@ static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > >       if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > +     if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) &&
> > > > > > +         !uvc_gpio_is_streaming(dev))
> > > > > > +             return -EBUSY;
> > > > > > +
> > > > > >       *(uint8_t *)data = uvc_gpio_update_value(dev, entity);
> > > > > > +
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > @@ -1528,19 +1545,50 @@ static struct uvc_entity *uvc_gpio_find_entity(struct uvc_device *dev)
> > > > > >       return NULL;
> > > > > >  }
> > > > > >
> > > > > > -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > > > > > +void uvc_privacy_gpio_event(struct uvc_device *dev)
> > > > > >  {
> > > > > > -     struct uvc_device *dev = data;
> > > > > >       struct uvc_entity *unit;
> > > > > >
> > > > > > +
> > > > > >       unit = uvc_gpio_find_entity(dev);
> > > > > >       if (!unit)
> > > > > > -             return IRQ_HANDLED;
> > > > > > +             return;
> > > > > >
> > > > > >       uvc_gpio_update_value(dev, unit);
> > > > > > +}
> > > > > > +
> > > > > > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > > > > > +{
> > > > > > +     struct uvc_device *dev = data;
> > > > > > +
> > > > > > +     /* Ignore privacy events during streamoff */
> > > > > > +     if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> > > > > > +             if (!uvc_gpio_is_streaming(dev))
> > > > > > +                     return IRQ_HANDLED;
> > > > >
> > > > > I'm still a bit concerned of race conditions. When stopping the stream,
> > > > > vb2_queue.streaming is set to 0 after calling the driver's .stop_stream()
> > > > > handler. This means that the device will cut power before
> > > > > uvc_gpio_is_streaming() can detect that streaming has stopped, and the
> > > > > GPIO could thus trigger an IRQ.
> > > >
> > > > On the affected devices I have not seen this. I guess it takes some
> > > > time to discharge. Anyway I am implementing a workaround. Tell me if
> > > > it is too ugly.
> > > >
> > > > > You mentioned that devices have a pull-up or pull-down on the GPIO line.
> > > > > As there are only two devices affected, do you know if it's a pull-up or
> > > > > pull-down ? Would it be worse to expose that state to userspace than to
> > > > > return -EBUSY when reading the control ?
> > > >
> > > > The module has a 100K pull up. This is, it will return "Privacy = 0".
> > > >
> > > > We cannot return the default value, as it would make the user believe
> > > > that the privacy is in a different state that currently is.
> > > > In other words, userspace needs to know at all times if the privacy is
> > > > in : unknow_state, on, off.
> > >
> > > This seems to be the core of the issue: we're trying to shove 3 states
> > > into a boolean. Would this call for turning the V4L2_CID_PRIVACY control
> > > into a menu ? Or maybe setting V4L2_CTRL_FLAG_INACTIVE ? Returning
> > > -EBUSY when the control is read while not streaming, and not generating
> > > an event that tells the control value becomes unknown, seems like a hack
> > > designed to work with a single userspace implementation.
> > >
> >
> > I think that the V4L2_CTRL_FLAG_INACTIVE seems more correct. I will
> > see how can I wire that up.
>
> Let me correct myself here. FLAG_INACTIVE is also not a good idea.
>
> you need two ioctls to read the value:
> -queryctrl()
> -g_ctrl()
> and you cannot send both at the same time.
>
> I guess we need to keep the -EBUSY or move to a menu. Since we will
> probably delay this patch for  a while. I will resend based on -EBUSY
> at the end of my patchset, so it can be easily ignored if we find a
> better solution.

Hi Laurent, Kieran,

Would it be okay to keep the behavior as suggested by Ricardo?

Best regards,
Tomasz

>
> Thanks!
>
> >
> >
> > > As the rest of the series is getting ready, I'd propose merging it
> > > without this patch until we figure out what should be done to support
> > > these lovely devices. Would that work for you ?
> >
> > Yes that sounds good to me. Thanks!
> >
> >
> > >
> > > > > > +
> > > > > > +     uvc_privacy_gpio_event(dev);
> > > > > > +
> > > > > >       return IRQ_HANDLED;
> > > > > >  }
> > > > > >
> > > > > > +static const struct dmi_system_id privacy_valid_during_streamon[] = {
> > > > > > +     {
> > > > > > +             .ident = "HP Elite c1030 Chromebook",
> > > > > > +             .matches = {
> > > > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > > > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Jinlon"),
> > > > > > +             },
> > > > > > +     },
> > > > > > +     {
> > > > > > +             .ident = "HP Pro c640 Chromebook",
> > > > > > +             .matches = {
> > > > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > > > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Dratini"),
> > > > > > +             },
> > > > > > +     },
> > > > > > +     { } /* terminate list */
> > > > > > +};
> > > > > > +
> > > > > >  static int uvc_gpio_parse(struct uvc_device *dev)
> > > > > >  {
> > > > > >       struct uvc_entity *unit;
> > > > > > @@ -1577,6 +1625,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
> > > > > >
> > > > > >       list_add_tail(&unit->list, &dev->entities);
> > > > > >
> > > > > > +     if (dmi_check_system(privacy_valid_during_streamon))
> > > > > > +             dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
> > > > >
> > > > > This will also match any external UVC camera plugged to one of the
> > > > > affected systems, right ? It shouldn't matter in practice as those
> > > > > devices won't have a GPIO entity.
> > > >
> > > > I did think about that but did not make it explicit in the code.
> > > > Adding a comment.
> > > >
> > > > > I suppose we can't match on VID:PID instead because the same VID:PID is
> > > > > used in both devices affected by this issue, and devices immune to it ?
> > > >
> > > > The problem with VID:PID, is that the manufacturer can decide to
> > > > change the camera module and then the quirk will not work.
> > > >
> > > > We cannot rely ONLY in VID:PID as these modules are also used in other
> > > > models not affected by the quirk.
> > > >
> > > > I believe that it is also correct to rely on the dmi, as the quirk is
> > > > caused for the way the camera module is wired, which is on the
> > > > motherboard.
> > >
> > > I can't comment on the hardware side as I lack details. Using the
> > > VID:PID only seems a problem indeed. We could combine DMI and VID:PID,
> > > but that wouldn't make a difference in practice, so I suppose this is
> > > good enough.
> > >
> > > > > > +
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > > > > > index cd60c6c1749e..e800d491303f 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_queue.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > > > > > @@ -337,9 +337,12 @@ int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
> > > > > >  int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> > > > > >  {
> > > > > >       int ret;
> > > > > > +     struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> > > > >
> > > > > Please swap the two lines.
> > > > >
> > > > > >
> > > > > >       mutex_lock(&queue->mutex);
> > > > > >       ret = vb2_streamon(&queue->queue, type);
> > > > > > +     if (stream->dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> > > > > > +             uvc_privacy_gpio_event(stream->dev);
> > > > >
> > > > > Even when vb2_streamon() failed ?
> > > > >
> > > > > >       mutex_unlock(&queue->mutex);
> > > > > >
> > > > > >       return ret;
> > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > index 079a407ebba5..32c1ba246d97 100644
> > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > @@ -209,6 +209,7 @@
> > > > > >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> > > > > >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> > > > > >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > > > > > +#define UVC_QUIRK_PRIVACY_DURING_STREAM      0x00002000
> > > > > >
> > > > > >  /* Format flags */
> > > > > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > > > > > @@ -826,6 +827,9 @@ extern const struct v4l2_file_operations uvc_fops;
> > > > > >  int uvc_mc_register_entities(struct uvc_video_chain *chain);
> > > > > >  void uvc_mc_cleanup_entity(struct uvc_entity *entity);
> > > > > >
> > > > > > +/* Privacy gpio */
> > > > > > +void uvc_privacy_gpio_event(struct uvc_device *dev);
> > > > > > +
> > > > > >  /* Video */
> > > > > >  int uvc_video_init(struct uvc_streaming *stream);
> > > > > >  int uvc_video_suspend(struct uvc_streaming *stream);
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> >
> >
> > --
> > Ricardo Ribalda
>
>
>
> --
> Ricardo Ribalda
