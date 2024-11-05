Return-Path: <linux-media+bounces-20946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AED9BD0BF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A776E286B9B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6028A16631C;
	Tue,  5 Nov 2024 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D650vEmT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1694915CD78
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730821015; cv=none; b=UUdWVtBfwfCxU+ySckN6w/2jjNjAe66Ra4Ars94bW8tcP9B1zuFGBhP9yF5lkUhek5qBWJcEL4Dkk9zRj46taIOQXsW8TNZFhXp8LXPgcANWiOexlmDLPuhj7Prs4mj8ZRa0Hp871PCcdgtfpbG7HVJ8Rf1T+LeYOkerEDxSl7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730821015; c=relaxed/simple;
	bh=aOsZwqmB0KpZlBipWrBUXvdGKccveZF1oHmlW64bCgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFunoBWr0yaAP81mHAsn4AVimzjBXZ+59ugbTyokA0GEVlo5DRd35GII1PnqYi8s/1gFNGQTMa8FzXmYrFDWLIApIjifoHKHGbhEnxJfJjEL68tv/HEahRz17gv5hkCklnrbGxUeHhzO2kWB5aFh5HKXQt14xeBXRAJPtiOJmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D650vEmT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ca388d242so56331125ad.2
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730821013; x=1731425813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5gYhyNkQSfvX8YoGKzdMuoui6AtbcgZ00ytCvX4WlVI=;
        b=D650vEmT7mc4gx2Mhe8REb2Md6bS1HEB771DRpp7sm4kHoaJ9XYWLt/25WFjp7B/QE
         19+4qaabNWX45njNnv/lHtS6Jv0vAdibLReZHfSLilPmpBToMtCuepo3ET7Bc3ivYFKK
         dlsHcaR2E8Hf5EzjezkPGQLlmiD6E1eWiYCRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730821013; x=1731425813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gYhyNkQSfvX8YoGKzdMuoui6AtbcgZ00ytCvX4WlVI=;
        b=bTkHQ+7k/PfzHwDgqHOd7+vQKuhdAcIQxu7ikL/fl/DSckmvqHbamtBHHtRH8kLpVq
         t7BsEmOOJBfz03a/qIZmYUCgA6yUF0fkMImP+6QpbEVffx2zHAgcaZHgDehwTosEgo0a
         y/PiDEMCv4tFvvIECZxg2+gTCk72myHMrw0vpreqL104LLnCz+XG8ihmnyDz7fb4p/Xr
         6uV4XQxWez0Fv4gz594Gf1opj1AJw99jCPUgDtEZKBuMk9V4s8wmqAUhfkm1q3O2qnUt
         4fMcZauX31sm8R7xEKC0ZDF46AytEr/2Jku6vf5k48Fg0gv4L3tKhK+rwAHQuF9VN5gw
         o5tg==
X-Forwarded-Encrypted: i=1; AJvYcCVDD9hBO92efbq31sdo/EE2sjRnZr3YPkGJnLjrPsJU1Lg623gNBiePnjeVED01bTFieKkulAIyVjTPHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymm2NIZC3hR/DQxLxxmD8RfqgUGcwTOC0u+RdG3Zx+bz9bqJmr
	PPybSIg4qpWzTp5XkTWcSjG4GKvQz9OdxSJ96cpCXo0qSEli/58WJAcTMT9T8rIJLnyHjZzSWf4
	=
X-Google-Smtp-Source: AGHT+IHiVuHu8z1pVhIGfBerAc/zuVYd9fW/C4jeQAJK6hEI6VQs3lkfKGYMl8wgyzo1szFYmxcRBQ==
X-Received: by 2002:a17:903:440d:b0:20e:55b0:3607 with SMTP id d9443c01a7336-2111af1cbbcmr205888875ad.2.1730821013060;
        Tue, 05 Nov 2024 07:36:53 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057069e7sm80389145ad.95.2024.11.05.07.36.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 07:36:52 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so4250269a91.2
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 07:36:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiDRHGfIagy+HhLHJwETfof6i7uRVP8Da9Ia3BGd6fDNEQzc11JXILBQPak//K50bb/+0YQ1h6Xx7aPA==@vger.kernel.org
X-Received: by 2002:a17:90b:2247:b0:2e2:cf63:224c with SMTP id
 98e67ed59e1d1-2e94c52f356mr22199796a91.35.1730821011691; Tue, 05 Nov 2024
 07:36:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org> <20241105144340.GQ27775@pendragon.ideasonboard.com>
In-Reply-To: <20241105144340.GQ27775@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 5 Nov 2024 16:36:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCvtaFxPvsJRQRo3RG54RZef2crs1Vk5TkA9XdoZNoqr5w@mail.gmail.com>
Message-ID: <CANiDSCvtaFxPvsJRQRo3RG54RZef2crs1Vk5TkA9XdoZNoqr5w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Remove refcounted cleanup
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, 5 Nov 2024 at 15:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Nov 05, 2024 at 02:32:39PM +0000, Ricardo Ribalda wrote:
> > After commit c9ec6f173636 ("media: uvcvideo: Stop stream during unregister")
> > we have some guarantee that userspace will not be able to access any of
> > our internal structures after disconnect().
> >
> > This means that we can do the cleanup at the end of disconnect and make
> > the code more resilient to races.
> >
> > This change will also enable the use of devres functions in more parts
> > of the code.
>
> That's the wrong direction, let's not go there, especially given that
> this doesn't fix anything. Strong nack on my side, especially given how
> many of your previous patches introduced race conditions. It's not

They have also fixed some race conditions... keep the discussion
professional please.

I think this only proves that uvc code is quite complicated. It also
lacks a lot of consistency with the rest of the drivers in media (and
in the kernel in general)
that is exactly what this patch tries to fix.


> broken, don't touch it. A better use of your time would be to fix the
> unplug race issue at the subsystem level.

Now memory is allocated during uvc_probe(), but it is not freed until
after disconnect() if userspace has a videodevice open.
Luckily userspace now cannot interfere with the driver after
disconnect(), so lets make use of that property to simplify the code.

As the commit message says, with this change we can start using devm_
functions and we will have less chances to make mistakes
Eg: no  more
- this cleanout belongs to uvc_register_video_device vs uvc_delete
- devm_ function fails because it is called too late

This patch fixes a class of bugs. I would really appreciate it if you
can review it.
I have moved it to its own patchset:
https://patchwork.linuxtv.org/project/linux-media/patch/20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org/
I am planning to send more patches on top of it making use of devres


Regards!

>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 24 +++++-------------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 -
> >  2 files changed, 5 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index a96f6ca0889f..2735fccdf454 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1868,16 +1868,12 @@ static int uvc_scan_device(struct uvc_device *dev)
> >  /*
> >   * Delete the UVC device.
> >   *
> > - * Called by the kernel when the last reference to the uvc_device structure
> > - * is released.
> > - *
> > - * As this function is called after or during disconnect(), all URBs have
> > + * As this function is called during disconnect(), all URBs have
> >   * already been cancelled by the USB core. There is no need to kill the
> >   * interrupt URB manually.
> >   */
> > -static void uvc_delete(struct kref *kref)
> > +static void uvc_delete(struct uvc_device *dev)
> >  {
> > -     struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
> >       struct list_head *p, *n;
> >
> >       uvc_status_cleanup(dev);
> > @@ -1919,14 +1915,6 @@ static void uvc_delete(struct kref *kref)
> >       kfree(dev);
> >  }
> >
> > -static void uvc_release(struct video_device *vdev)
> > -{
> > -     struct uvc_streaming *stream = video_get_drvdata(vdev);
> > -     struct uvc_device *dev = stream->dev;
> > -
> > -     kref_put(&dev->ref, uvc_delete);
> > -}
> > -
> >  /*
> >   * Unregister the video devices.
> >   */
> > @@ -2009,7 +1997,7 @@ int uvc_register_video_device(struct uvc_device *dev,
> >       vdev->v4l2_dev = &dev->vdev;
> >       vdev->fops = fops;
> >       vdev->ioctl_ops = ioctl_ops;
> > -     vdev->release = uvc_release;
> > +     vdev->release = video_device_release_empty;
> >       vdev->prio = &stream->chain->prio;
> >       if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> >               vdev->vfl_dir = VFL_DIR_TX;
> > @@ -2045,7 +2033,6 @@ int uvc_register_video_device(struct uvc_device *dev,
> >               return ret;
> >       }
> >
> > -     kref_get(&dev->ref);
> >       return 0;
> >  }
> >
> > @@ -2160,7 +2147,6 @@ static int uvc_probe(struct usb_interface *intf,
> >       INIT_LIST_HEAD(&dev->entities);
> >       INIT_LIST_HEAD(&dev->chains);
> >       INIT_LIST_HEAD(&dev->streams);
> > -     kref_init(&dev->ref);
> >       atomic_set(&dev->nmappings, 0);
> >
> >       dev->udev = usb_get_dev(udev);
> > @@ -2300,7 +2286,7 @@ static int uvc_probe(struct usb_interface *intf,
> >
> >  error:
> >       uvc_unregister_video(dev);
> > -     kref_put(&dev->ref, uvc_delete);
> > +     uvc_delete(dev);
> >       return -ENODEV;
> >  }
> >
> > @@ -2319,7 +2305,7 @@ static void uvc_disconnect(struct usb_interface *intf)
> >               return;
> >
> >       uvc_unregister_video(dev);
> > -     kref_put(&dev->ref, uvc_delete);
> > +     uvc_delete(dev);
> >  }
> >
> >  static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 07f9921d83f2..feb8de640a26 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -578,7 +578,6 @@ struct uvc_device {
> >
> >       /* Video Streaming interfaces */
> >       struct list_head streams;
> > -     struct kref ref;
> >
> >       /* Status Interrupt Endpoint */
> >       struct usb_host_endpoint *int_ep;
> >
> > ---
> > base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> > change-id: 20241105-uvc-rmrefcount-010d98d496c5
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

