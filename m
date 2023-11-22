Return-Path: <linux-media+bounces-786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC87F44F7
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E328150E
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458E8584E9;
	Wed, 22 Nov 2023 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="io2stwu1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7B21A2
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:35:44 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-42135f8e08fso40130781cf.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700652943; x=1701257743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nKCzP1gjVynV6gUUEtVMbrveg7//HaaaERWD1+hGAUY=;
        b=io2stwu1GohT+Y7HAaxEe6XCWwjpCP1xlhvARYV66ykrPWWZFNRViznC9ijEFzbfFL
         nVc7dFkg+y3vq9pu5ahCzDEVWYl7/1EBPuHoSCNCIX5SMG+N164ueh4eXdCTgnKcaVKd
         SetdLbL9d1syMj9WY+hXNiQc/NtyFbo8HdRHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700652943; x=1701257743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKCzP1gjVynV6gUUEtVMbrveg7//HaaaERWD1+hGAUY=;
        b=YTddDMCnn/YCQ0AQuA1YucMub2IFlLuohIZdMnN9he1iWoPg+x7JiqVmIDdxF8/Vid
         k29NrBhtL1i/UBT151PfxD8z2ZGQ2AP/40bol4sVJFdqfsJj8ftn5L1ztZBbGP5nOOr1
         Ojd8BSKgUfwY/uOJXb14oUirEWPsmMBUD4wCsLYYs5up/2YoATl6LcqqSj8e5CTv8wWg
         l1ClvPmvESrpxjvmEkGsBiT47JwIcLS9zCPv3YKb0gpy8c6YWfGi+xlt4gSHLl+CVEhn
         ia0XaTQ/pXEbKRQPfAE3dklNKgJoqmNqc3jVU/fKlJ6IQDMp7hDDYDBFbEILafyuUm8/
         Zu7A==
X-Gm-Message-State: AOJu0Yws7PMX1dI5bP0/2gg+1R5OLo+Ed7/lKB3rsHqHTUFh2eitJl8+
	ZpnxoM0hRvQfqZ9K9xglxbEkJL8/eWCwG/ad9E1XBg==
X-Google-Smtp-Source: AGHT+IFZWAGMCD2bL5hxIkCEgW6/Ur8iouzsPjCgRdCcAoTNifsbcDlZuBcQnBmWelFlO44+jVd6Wg==
X-Received: by 2002:ac8:7fd3:0:b0:423:756c:93f0 with SMTP id b19-20020ac87fd3000000b00423756c93f0mr2021398qtk.67.1700652943210;
        Wed, 22 Nov 2023 03:35:43 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id k21-20020ac84795000000b0041812703b7esm4345155qtq.52.2023.11.22.03.35.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 03:35:42 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-77d6b28aa9aso10219985a.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:35:41 -0800 (PST)
X-Received: by 2002:a05:6214:27ed:b0:679:f232:b938 with SMTP id
 jt13-20020a05621427ed00b00679f232b938mr2365229qvb.8.1700652941316; Wed, 22
 Nov 2023 03:35:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org> <ZV3XDtUKJPuGLhw9@valkosipuli.retiisi.eu>
 <CANiDSCuXXD_GWadSJo43zxscGAOPzxhODK=TKixn0OPn7z_tCw@mail.gmail.com> <ZV3gHn8CuK_JJZbu@valkosipuli.retiisi.eu>
In-Reply-To: <ZV3gHn8CuK_JJZbu@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 12:35:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCsoJR+eaj=7cxrZ0EWiBT7sWQSSqRcB-HdRvhbKmD26cA@mail.gmail.com>
Message-ID: <CANiDSCsoJR+eaj=7cxrZ0EWiBT7sWQSSqRcB-HdRvhbKmD26cA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Do not halt the device after disconnect
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 22 Nov 2023 at 12:04, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Wed, Nov 22, 2023 at 11:32:16AM +0100, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Wed, 22 Nov 2023 at 11:25, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Thank you for the patch.
> > >
> > > On Tue, Nov 21, 2023 at 07:53:49PM +0000, Ricardo Ribalda wrote:
> > > > usb drivers should not call to any usb_() function after the
> > > > .disconnect() callback has been triggered.
> > > >
> > > > If the camera is streaming, the uvc driver will call usb_set_interface or
> > > > usb_clear_halt once the device is being released. Let's fix this issue.
> > > >
> > > > This is probably not the only driver affected with this kind of bug, but
> > > > until there is a better way to do it in the core this is the way to
> > > > solve this issue.
> > > >
> > > > When/if a different mechanism is implemented in the core to solve the
> > > > lifetime of devices we will adopt it in uvc.
> > > >
> > > > Trace:
> > > > [ 1065.389723] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
> > > > [ 1065.390160] drivers/media/usb/uvc/uvc_driver.c:2264 uvc_disconnect exit
> > > > [ 1065.433956] drivers/media/usb/uvc/uvc_v4l2.c:659 uvc_v4l2_release enter
> > > > [ 1065.433973] drivers/media/usb/uvc/uvc_video.c:2274 uvc_video_stop_streaming enter
> > > > [ 1065.434560] drivers/media/usb/uvc/uvc_video.c:2285 uvc_video_stop_streaming exit
> > > > [ 1065.435154] drivers/media/usb/uvc/uvc_v4l2.c:680 uvc_v4l2_release exit
> > > > [ 1065.435188] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c |  2 ++
> > > >  drivers/media/usb/uvc/uvc_video.c  | 45 ++++++++++++++++++++++++--------------
> > > >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> > > >  3 files changed, 32 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 08fcd2ffa727..413c32867617 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2257,6 +2257,8 @@ static void uvc_disconnect(struct usb_interface *intf)
> > > >               return;
> > > >
> > > >       uvc_unregister_video(dev);
> > > > +     /* Barrier needed to synchronize with uvc_video_stop_streaming(). */
> > > > +     smp_store_release(&dev->disconnected, true);
> > > >       kref_put(&dev->ref, uvc_delete);
> > > >  }
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index 28dde08ec6c5..032b44e45b22 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -2243,28 +2243,39 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
> > > >       return ret;
> > > >  }
> > > >
> > > > -void uvc_video_stop_streaming(struct uvc_streaming *stream)
> > > > +static void uvc_video_halt(struct uvc_streaming *stream)
> > > >  {
> > > > -     uvc_video_stop_transfer(stream, 1);
> > > > +     unsigned int epnum;
> > > > +     unsigned int pipe;
> > > > +     unsigned int dir;
> > > >
> > > >       if (stream->intf->num_altsetting > 1) {
> > >
> > > Doesn't this imply the device is using isochronous mode?
> >
> > I haven't changed the behaviour for halt, it is just that git diff is
> > being a bit too creative here:
> >
> > Basically it is doing:
> >
> > void video_halt() {
> >    if (is_isoc()) {
> >      usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> >      return;
> >    }
> >    usb_clear_halt();
> > }
> >
> > instead of the old:
> >
> > void video_halt() {
> >    if (is_isoc()) {
> >      usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> >    }  else {
> >       usb_clear_halt();
> >    }
> > }
> >
> > Thanks!
>
> Oops. I missed the removal of the else branch altogether while reading the
> patch.
>
> Shouldn't you also ensure the disconnect callback won't return until the
> streaming has been stopped here?

This patch is just for calls after .disconnect. It will not protect
for concurrent calls.

I have sent a v4 making this explicit. We still need:

media: uvcvideo: Lock video streams and queues while unregistering

or similar.

Thanks!

>
> > >
> > > >               usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > > > -     } else {
> > > > -             /*
> > > > -              * UVC doesn't specify how to inform a bulk-based device
> > > > -              * when the video stream is stopped. Windows sends a
> > > > -              * CLEAR_FEATURE(HALT) request to the video streaming
> > > > -              * bulk endpoint, mimic the same behaviour.
> > > > -              */
> > > > -             unsigned int epnum = stream->header.bEndpointAddress
> > > > -                                & USB_ENDPOINT_NUMBER_MASK;
> > > > -             unsigned int dir = stream->header.bEndpointAddress
> > > > -                              & USB_ENDPOINT_DIR_MASK;
> > > > -             unsigned int pipe;
> > > > -
> > > > -             pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
> > > > -             usb_clear_halt(stream->dev->udev, pipe);
> > > > +             return;
> > > >       }
> > > >
> > > > +     /*
> > > > +      * UVC doesn't specify how to inform a bulk-based device
> > >
> > > Then this comment doesn't look right. What about the code? This isn't
> > > mentioned in the commit message either.
> > >
> > > > +      * when the video stream is stopped. Windows sends a
> > > > +      * CLEAR_FEATURE(HALT) request to the video streaming
> > > > +      * bulk endpoint, mimic the same behaviour.
> > > > +      */
> > > > +     epnum = stream->header.bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
> > > > +     dir = stream->header.bEndpointAddress & USB_ENDPOINT_DIR_MASK;
> > > > +     pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
> > > > +     usb_clear_halt(stream->dev->udev, pipe);
> > > > +}
> > > > +
> > > > +void uvc_video_stop_streaming(struct uvc_streaming *stream)
> > > > +{
> > > > +     uvc_video_stop_transfer(stream, 1);
> > > > +
> > > > +     /*
> > > > +      * Barrier needed to synchronize with uvc_disconnect().
> > > > +      * We cannot call usb_* functions on a disconnected USB device.
> > > > +      */
> > > > +     if (!smp_load_acquire(&stream->dev->disconnected))
> > > > +             uvc_video_halt(stream);
> > > > +
> > > >       uvc_video_clock_cleanup(stream);
> > > >  }
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 6fb0a78b1b00..4318ce8e31db 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -559,6 +559,8 @@ struct uvc_device {
> > > >       unsigned int users;
> > > >       atomic_t nmappings;
> > > >
> > > > +     bool disconnected;
> > > > +
> > > >       /* Video control interface */
> > > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > >       struct media_device mdev;
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

