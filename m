Return-Path: <linux-media+bounces-18668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEAD987E22
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 08:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405971F23A2E
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 06:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECE9175D5D;
	Fri, 27 Sep 2024 06:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M6ACNmxu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73606381B1
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727417374; cv=none; b=A3oq9rbtO3LuNIcdQBBG1cyVna5of5Iablyqt8EH6Ktb9z1dIMPCJqoAzcF7hgz2/Sw0Msh37axcEIbm5QcTlDm14TrVXF7o/RBYY/+977qhUtyze0anJWgiOflBOH4M1QSdFgzChCNb8bkCxJn8RNmbr8kaUxrycw/t1v6GusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727417374; c=relaxed/simple;
	bh=Kx9p7KAXHEb1W87nvLBVV7UJ9XGp3iPC5gxdEK1znf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6bc808b+TTa1/KbjZPVKJjULzc/4aBZiVYFohC105pzv0h6CEuQPmen0+nINkCBN40k2c9KtMdRsRt1n5oJ1GuUudJC9tj+YWlvk9MXpmRBDsVdor8S5q5GP35F70RaVzE3itiddusDyaWl+FhvH8C/Fv5we+kEhIWSVsfjaP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M6ACNmxu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-208e0a021cfso15758785ad.0
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727417371; x=1728022171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qmOMe5qK2Lg+Es6RT+a0fd+2XWPUEHna9V7jTHkY51o=;
        b=M6ACNmxu7V2iAPVch8/4ujYL13WGILhDewxNujMQVbpHfyNd51PRT7X8NLIoJyT67L
         N5XD1E8sU8MduLA4j0XXimf0loWMm6wcMyp8Hshm6K5Npk6YxYMXhskWYb5hpy33gd3C
         2PGMovTdVGBzRElDLNGOXEvQMCi97WEEni0Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727417371; x=1728022171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmOMe5qK2Lg+Es6RT+a0fd+2XWPUEHna9V7jTHkY51o=;
        b=nvWCawYsJAZptb2xwgMO9ijBb4B+HveLpegGY1+zqIiTUwKb5eYtZMfJgfRHWuvtt3
         MYpPtjzKtBfeRVnAilt3fBvTJpcM86vKaA/tWT/xrgQT86fCOuw+EbXpY20CCgpQ6BL+
         ZPCszJcSpK/KCtzsq7piQYCeNhjBws7fNCX1STr4o+orKGn3i0+5uLQ2wREH2ZMTjlp9
         aIqGRaETg8GXaE4IH3ezjHXwfOO2wivWAGUs1ciLRD+qgWaJxVeJtPnWHaNwCrOu9UuG
         kc6q/hhMxJjz1q+xK+fztpiBicL/hp3x78yL145L63fSI+2i4ck92mfi7TEtAnMdEn7r
         5Rew==
X-Forwarded-Encrypted: i=1; AJvYcCVwD9+GL+MzI+DJSArMUu1QNnauNKHL7YS0bevp/RIgxNzq6+L/bArHjMqr4aUr0Pk0IauyDepOWhUydw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgcuzuf4dAX3dteV7k65F/hhM+s4dER7rWqNmHoX3GlfptdazQ
	/FkSYY0R8/WTlD547N1D0kav7rqbLE5JKnfcjTlJ42bJ7AFGBNUCcTT4ZvhqlqT2IeCjubPksUY
	=
X-Google-Smtp-Source: AGHT+IF/6Ih3tj+Yt6ha+lrSa/Z5Sm8tRrAqS/HuQZumW38l+1TcBHa2wqWcL7VDDZgliUs7iF/ZZQ==
X-Received: by 2002:a17:902:db09:b0:205:7c76:4b2c with SMTP id d9443c01a7336-20b37bedbfcmr40568635ad.48.1727417371359;
        Thu, 26 Sep 2024 23:09:31 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e5183dsm7019875ad.256.2024.09.26.23.09.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 23:09:28 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-719ba0654f9so1471176b3a.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 23:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW53VgisBChumiRmgQCzxOKHJogRhUQIXrsJqgdwooc+mgsgtwN6QJiKBBaNWCP1WgmuBSM/J0K6GBtww==@vger.kernel.org
X-Received: by 2002:a05:6a00:14c6:b0:714:241d:a323 with SMTP id
 d2e1a72fcca58-71b26057a1fmr4051856b3a.17.1727417367137; Thu, 26 Sep 2024
 23:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926-guenter-mini-v7-0-690441953d4a@chromium.org>
 <20240926-guenter-mini-v7-1-690441953d4a@chromium.org> <20240926143940.GI21788@pendragon.ideasonboard.com>
In-Reply-To: <20240926143940.GI21788@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 08:09:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCvObXTU7kFAXqY5_Jz0BQayZDuV1ozwMTW8zC3FyRoo6g@mail.gmail.com>
Message-ID: <CANiDSCvObXTU7kFAXqY5_Jz0BQayZDuV1ozwMTW8zC3FyRoo6g@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] media: uvcvideo: Refactor the status irq API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 26 Sept 2024 at 16:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Sep 26, 2024 at 05:49:57AM +0000, Ricardo Ribalda wrote:
> > There are two different use-cases of uvc_status():
> >
> > - adding/removing a user when the camera is open/closed
> > - stopping/starting when the camera is suspended/resumed
> >
> > Make the API reflect these two use-cases and move all the refcounting
> > and locking logic to the uvc_status.c file.
> >
> > No functional change is expected from this patch.
> >
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 13 ++--------
> >  drivers/media/usb/uvc/uvc_status.c | 53 ++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c   | 22 +++++-----------
> >  drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
> >  4 files changed, 65 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index f0febdc08c2d..31e8942f1ef8 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2116,7 +2116,6 @@ static int uvc_probe(struct usb_interface *intf,
> >       INIT_LIST_HEAD(&dev->streams);
> >       kref_init(&dev->ref);
> >       atomic_set(&dev->nmappings, 0);
> > -     mutex_init(&dev->lock);
> >
> >       dev->udev = usb_get_dev(udev);
> >       dev->intf = usb_get_intf(intf);
> > @@ -2288,10 +2287,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
> >       /* Controls are cached on the fly so they don't need to be saved. */
> >       if (intf->cur_altsetting->desc.bInterfaceSubClass ==
> >           UVC_SC_VIDEOCONTROL) {
> > -             mutex_lock(&dev->lock);
> > -             if (dev->users)
> > -                     uvc_status_stop(dev);
> > -             mutex_unlock(&dev->lock);
> > +             uvc_status_suspend(dev);
> >               return 0;
> >       }
> >
> > @@ -2322,12 +2318,7 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
> >                               return ret;
> >               }
> >
> > -             mutex_lock(&dev->lock);
> > -             if (dev->users)
> > -                     ret = uvc_status_start(dev, GFP_NOIO);
> > -             mutex_unlock(&dev->lock);
> > -
> > -             return ret;
> > +             return uvc_status_resume(dev);
> >       }
> >
> >       list_for_each_entry(stream, &dev->streams, list) {
> > diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> > index a78a88c710e2..e438ae5af2e8 100644
> > --- a/drivers/media/usb/uvc/uvc_status.c
> > +++ b/drivers/media/usb/uvc/uvc_status.c
> > @@ -257,6 +257,8 @@ int uvc_status_init(struct uvc_device *dev)
> >       unsigned int pipe;
> >       int interval;
> >
> > +     mutex_init(&dev->status_lock);
> > +
> >       if (ep == NULL)
> >               return 0;
> >
> > @@ -302,18 +304,22 @@ void uvc_status_cleanup(struct uvc_device *dev)
> >       kfree(dev->status);
> >  }
> >
> > -int uvc_status_start(struct uvc_device *dev, gfp_t flags)
> > +static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
> >  {
> > +     lockdep_assert_held(&dev->status_lock);
> > +
> >       if (dev->int_urb == NULL)
> >               return 0;
> >
> >       return usb_submit_urb(dev->int_urb, flags);
> >  }
> >
> > -void uvc_status_stop(struct uvc_device *dev)
> > +static void uvc_status_stop(struct uvc_device *dev)
> >  {
> >       struct uvc_ctrl_work *w = &dev->async_ctrl;
> >
> > +     lockdep_assert_held(&dev->status_lock);
> > +
> >       /*
> >        * Prevent the asynchronous control handler from requeing the URB. The
> >        * barrier is needed so the flush_status change is visible to other
> > @@ -350,3 +356,46 @@ void uvc_status_stop(struct uvc_device *dev)
> >        */
> >       smp_store_release(&dev->flush_status, false);
> >  }
> > +
> > +int uvc_status_resume(struct uvc_device *dev)
> > +{
> > +     guard(mutex)(&dev->status_lock);
> > +
> > +     if (dev->status_users)
> > +             return  uvc_status_start(dev, GFP_NOIO);
>
> Double space afer return. I'll fix when applying.
>
> > +
> > +     return 0;
> > +}
> > +
> > +void uvc_status_suspend(struct uvc_device *dev)
> > +{
> > +     guard(mutex)(&dev->status_lock);
> > +
> > +     if (dev->status_users)
> > +             uvc_status_stop(dev);
> > +}
> > +
> > +int uvc_status_get(struct uvc_device *dev)
> > +{
> > +     int ret = 0;
> > +
> > +     guard(mutex)(&dev->status_lock);
> > +
> > +     if (!dev->status_users)
> > +             ret = uvc_status_start(dev, GFP_KERNEL);
> > +     if (!ret)
> > +             dev->status_users++;
>
> Thanks for the scoped guard, we can write
>
>         if (!dev->status_users) {
>                 int ret = uvc_status_start(dev, GFP_KERNEL);
>                 if (ret)
>                         return ret;
>         }
>
>         dev->status_users++;
>
>         return 0;
>
> which I think is nicer to read. If that's fine with you I'll do this
> locally, not need to a new version.

Thanks! indeed it looks nicer :)
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +
> > +     return ret;
> > +}
> > +
> > +void uvc_status_put(struct uvc_device *dev)
> > +{
> > +     guard(mutex)(&dev->status_lock);
> > +
> > +     if (dev->status_users == 1)
> > +             uvc_status_stop(dev);
> > +     WARN_ON(!dev->status_users);
> > +     if (dev->status_users)
> > +             dev->status_users--;
> > +}
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f4988f03640a..97c5407f6603 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -628,20 +628,13 @@ static int uvc_v4l2_open(struct file *file)
> >               return -ENOMEM;
> >       }
> >
> > -     mutex_lock(&stream->dev->lock);
> > -     if (stream->dev->users == 0) {
> > -             ret = uvc_status_start(stream->dev, GFP_KERNEL);
> > -             if (ret < 0) {
> > -                     mutex_unlock(&stream->dev->lock);
> > -                     usb_autopm_put_interface(stream->dev->intf);
> > -                     kfree(handle);
> > -                     return ret;
> > -             }
> > +     ret = uvc_status_get(stream->dev);
> > +     if (ret) {
> > +             usb_autopm_put_interface(stream->dev->intf);
> > +             kfree(handle);
> > +             return ret;
> >       }
> >
> > -     stream->dev->users++;
> > -     mutex_unlock(&stream->dev->lock);
> > -
> >       v4l2_fh_init(&handle->vfh, &stream->vdev);
> >       v4l2_fh_add(&handle->vfh);
> >       handle->chain = stream->chain;
> > @@ -670,10 +663,7 @@ static int uvc_v4l2_release(struct file *file)
> >       kfree(handle);
> >       file->private_data = NULL;
> >
> > -     mutex_lock(&stream->dev->lock);
> > -     if (--stream->dev->users == 0)
> > -             uvc_status_stop(stream->dev);
> > -     mutex_unlock(&stream->dev->lock);
> > +     uvc_status_put(stream->dev);
> >
> >       usb_autopm_put_interface(stream->dev->intf);
> >       return 0;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b7d24a853ce4..07f9921d83f2 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -563,8 +563,6 @@ struct uvc_device {
> >
> >       const struct uvc_device_info *info;
> >
> > -     struct mutex lock;              /* Protects users */
> > -     unsigned int users;
> >       atomic_t nmappings;
> >
> >       /* Video control interface */
> > @@ -586,6 +584,8 @@ struct uvc_device {
> >       struct usb_host_endpoint *int_ep;
> >       struct urb *int_urb;
> >       struct uvc_status *status;
> > +     struct mutex status_lock; /* Protects status_users */
> > +     unsigned int status_users;
> >       bool flush_status;
> >
> >       struct input_dev *input;
> > @@ -752,8 +752,10 @@ int uvc_register_video_device(struct uvc_device *dev,
> >  int uvc_status_init(struct uvc_device *dev);
> >  void uvc_status_unregister(struct uvc_device *dev);
> >  void uvc_status_cleanup(struct uvc_device *dev);
> > -int uvc_status_start(struct uvc_device *dev, gfp_t flags);
> > -void uvc_status_stop(struct uvc_device *dev);
> > +int uvc_status_resume(struct uvc_device *dev);
> > +void uvc_status_suspend(struct uvc_device *dev);
> > +int uvc_status_get(struct uvc_device *dev);
> > +void uvc_status_put(struct uvc_device *dev);
> >
> >  /* Controls */
> >  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

