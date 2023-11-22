Return-Path: <linux-media+bounces-779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E08D7F43F2
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E027B2101B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B6558118;
	Wed, 22 Nov 2023 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k/fsABOx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9D9B2
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:32:33 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-679dd3055faso16032266d6.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700649152; x=1701253952; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nBpspFpw0wYhl7ifL6tUUdN7tL1Ofok89vNbvxhOgUA=;
        b=k/fsABOxSPGtZ9lKeNf2kxUnOb0eURVdimUOoz6KcneXmcSyOf99Ms2XEenRp93T6g
         QUBeNIIlagZSAhaoA4n+rIjE6qlZzW02bFoa8jYCw+2wnsi4c54KjYyMR2IybZw7EARh
         8pP1/0w/OjN5znOT7xwapcXOf8qto6cXm47cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649152; x=1701253952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBpspFpw0wYhl7ifL6tUUdN7tL1Ofok89vNbvxhOgUA=;
        b=XL87gTn6gPmGYwoSXfFcXnUhEYVfyzJRcD5JKqZ31BGNBOa9dJFtIivuDIvPhtdPUy
         Tp5vV00eJ3ZG+1cnVezUAL6VJ3J9dP8EuN9PLN7fdS9f0ep86kQj6NWaIdqKn/dlKr+x
         MhXu92/TWtNVt9aGdisXsDXIMKr/NjDn40sSV8ryKsmy+pKzuAbeFuFxDf7yRZA+E2Tj
         7cTmEpbHBx9twseORDlCRTPeCUhDCQDNdfKAYXfTfTmz0GR2VgQ7sU63dCSdEGebVRb/
         jRjudSgXcmhY4XBItFkJkn838JpDbR7FYF8Zc78p3A0iX9OhCq/TI2ZIGpgsr8Tb3Pjk
         xBaQ==
X-Gm-Message-State: AOJu0YzeNFeCowDOvN6XjxG+4jBIN5A9tt/wK/rj9VfptnEXL85Ba5bi
	pZLta5cQkfFSpum9MmNyg7/N1ptCZpYfvc2nnDpmYw==
X-Google-Smtp-Source: AGHT+IFNzLZhzA4ar8H3X+k6l57J6Mg/R9svFUwoN5HWB36n8XUKK3Yn7w815ZMfa+dgtI9F7880Kw==
X-Received: by 2002:a05:6214:40b:b0:66d:bbfb:839b with SMTP id z11-20020a056214040b00b0066dbbfb839bmr2110810qvx.41.1700649152328;
        Wed, 22 Nov 2023 02:32:32 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id a1-20020a05620a438100b0077bd79682c4sm4328838qkp.5.2023.11.22.02.32.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 02:32:31 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-679dd3055faso16031686d6.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:32:31 -0800 (PST)
X-Received: by 2002:a05:6214:f27:b0:679:f3b2:ef4c with SMTP id
 iw7-20020a0562140f2700b00679f3b2ef4cmr2086266qvb.38.1700649150941; Wed, 22
 Nov 2023 02:32:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org> <ZV3XDtUKJPuGLhw9@valkosipuli.retiisi.eu>
In-Reply-To: <ZV3XDtUKJPuGLhw9@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 11:32:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCuXXD_GWadSJo43zxscGAOPzxhODK=TKixn0OPn7z_tCw@mail.gmail.com>
Message-ID: <CANiDSCuXXD_GWadSJo43zxscGAOPzxhODK=TKixn0OPn7z_tCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Do not halt the device after disconnect
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 22 Nov 2023 at 11:25, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Nov 21, 2023 at 07:53:49PM +0000, Ricardo Ribalda wrote:
> > usb drivers should not call to any usb_() function after the
> > .disconnect() callback has been triggered.
> >
> > If the camera is streaming, the uvc driver will call usb_set_interface or
> > usb_clear_halt once the device is being released. Let's fix this issue.
> >
> > This is probably not the only driver affected with this kind of bug, but
> > until there is a better way to do it in the core this is the way to
> > solve this issue.
> >
> > When/if a different mechanism is implemented in the core to solve the
> > lifetime of devices we will adopt it in uvc.
> >
> > Trace:
> > [ 1065.389723] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
> > [ 1065.390160] drivers/media/usb/uvc/uvc_driver.c:2264 uvc_disconnect exit
> > [ 1065.433956] drivers/media/usb/uvc/uvc_v4l2.c:659 uvc_v4l2_release enter
> > [ 1065.433973] drivers/media/usb/uvc/uvc_video.c:2274 uvc_video_stop_streaming enter
> > [ 1065.434560] drivers/media/usb/uvc/uvc_video.c:2285 uvc_video_stop_streaming exit
> > [ 1065.435154] drivers/media/usb/uvc/uvc_v4l2.c:680 uvc_v4l2_release exit
> > [ 1065.435188] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c |  2 ++
> >  drivers/media/usb/uvc/uvc_video.c  | 45 ++++++++++++++++++++++++--------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  3 files changed, 32 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 08fcd2ffa727..413c32867617 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2257,6 +2257,8 @@ static void uvc_disconnect(struct usb_interface *intf)
> >               return;
> >
> >       uvc_unregister_video(dev);
> > +     /* Barrier needed to synchronize with uvc_video_stop_streaming(). */
> > +     smp_store_release(&dev->disconnected, true);
> >       kref_put(&dev->ref, uvc_delete);
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 28dde08ec6c5..032b44e45b22 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -2243,28 +2243,39 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
> >       return ret;
> >  }
> >
> > -void uvc_video_stop_streaming(struct uvc_streaming *stream)
> > +static void uvc_video_halt(struct uvc_streaming *stream)
> >  {
> > -     uvc_video_stop_transfer(stream, 1);
> > +     unsigned int epnum;
> > +     unsigned int pipe;
> > +     unsigned int dir;
> >
> >       if (stream->intf->num_altsetting > 1) {
>
> Doesn't this imply the device is using isochronous mode?

I haven't changed the behaviour for halt, it is just that git diff is
being a bit too creative here:

Basically it is doing:

void video_halt() {
   if (is_isoc()) {
     usb_set_interface(stream->dev->udev, stream->intfnum, 0);
     return;
   }
   usb_clear_halt();
}

instead of the old:

void video_halt() {
   if (is_isoc()) {
     usb_set_interface(stream->dev->udev, stream->intfnum, 0);
   }  else {
      usb_clear_halt();
   }
}

Thanks!
>
> >               usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > -     } else {
> > -             /*
> > -              * UVC doesn't specify how to inform a bulk-based device
> > -              * when the video stream is stopped. Windows sends a
> > -              * CLEAR_FEATURE(HALT) request to the video streaming
> > -              * bulk endpoint, mimic the same behaviour.
> > -              */
> > -             unsigned int epnum = stream->header.bEndpointAddress
> > -                                & USB_ENDPOINT_NUMBER_MASK;
> > -             unsigned int dir = stream->header.bEndpointAddress
> > -                              & USB_ENDPOINT_DIR_MASK;
> > -             unsigned int pipe;
> > -
> > -             pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
> > -             usb_clear_halt(stream->dev->udev, pipe);
> > +             return;
> >       }
> >
> > +     /*
> > +      * UVC doesn't specify how to inform a bulk-based device
>
> Then this comment doesn't look right. What about the code? This isn't
> mentioned in the commit message either.
>
> > +      * when the video stream is stopped. Windows sends a
> > +      * CLEAR_FEATURE(HALT) request to the video streaming
> > +      * bulk endpoint, mimic the same behaviour.
> > +      */
> > +     epnum = stream->header.bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
> > +     dir = stream->header.bEndpointAddress & USB_ENDPOINT_DIR_MASK;
> > +     pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
> > +     usb_clear_halt(stream->dev->udev, pipe);
> > +}
> > +
> > +void uvc_video_stop_streaming(struct uvc_streaming *stream)
> > +{
> > +     uvc_video_stop_transfer(stream, 1);
> > +
> > +     /*
> > +      * Barrier needed to synchronize with uvc_disconnect().
> > +      * We cannot call usb_* functions on a disconnected USB device.
> > +      */
> > +     if (!smp_load_acquire(&stream->dev->disconnected))
> > +             uvc_video_halt(stream);
> > +
> >       uvc_video_clock_cleanup(stream);
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 6fb0a78b1b00..4318ce8e31db 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -559,6 +559,8 @@ struct uvc_device {
> >       unsigned int users;
> >       atomic_t nmappings;
> >
> > +     bool disconnected;
> > +
> >       /* Video control interface */
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       struct media_device mdev;
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

