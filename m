Return-Path: <linux-media+bounces-7638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48702886E9C
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 15:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255EF1C21A34
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 14:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBAF47F7F;
	Fri, 22 Mar 2024 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CGovZLtp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DC48F61
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711117909; cv=none; b=ciUH1xSipO1dUcr1VmjwwAleiqcZl5hlc97tRpl1lFfwWkXWKiqOUNzLS+Tquj+mS8llTy+QpWqFMej30DEJYkqxYX3cImf5iIWWOauEIN8Z8szYQ2mPzl1S8pC/TWQ87t118E6mZBf8Qmzv4Tx5nGsVapv4SSWHQydQBRBJhSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711117909; c=relaxed/simple;
	bh=81JWXaN4zSZphvP4OGl+YLtvB+XiNt0tXooV3wq4kpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3BizCHDKF4wKF8ESsCy0ZkFHcCncCkNZMBH5CoydZbNwWsTNJcLvOvblKaX7yKOg6nSbIxcQyjuZvZzniYRKkxCR6QRbbA12y78vObPur1yWC6YucvtCILlxCnEyBnK6O+bVrO7j4xkzvLvKPUI/zIphgZgZ0DH/awNdt0pGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CGovZLtp; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42f52226f9bso9920511cf.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711117906; x=1711722706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ipnZgJCgfy92rPSoIHDfgGJrIxjcDuTd5k7VhbzBSkg=;
        b=CGovZLtpM6AgzuWfBsJEaelv6MeQhbACQJZgHWUH7nHakAnQQWpZTf9tI3ce6GwVwG
         tq+76lyoEcCWSra7Q09hPx3pCe2JFeqBKFmz/9XyRctfq7x3Ynls4hpp7YeL9bXLe1tY
         uspCNkaqzYwz3P8TCpV6dLAGF++p2DR/fAJJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711117906; x=1711722706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipnZgJCgfy92rPSoIHDfgGJrIxjcDuTd5k7VhbzBSkg=;
        b=Uo8G+QrppwC6KgSn1yim5Pgx01CO37xnw+Q8nvqQUgNnhDjP/3miz42OGJege6OOfz
         luL7z/Tz/h+Dm5mniSI/zhrSK3x3x6e86JnCSYqVXTIKmfPS8TMH+BYwzL6/M8dDJzlv
         8YVSjcBjEqC4n4vljyK225mJIQThFkguP8iFYnGXp66DzXzaa2LvCYU1vv6FihtiXdSW
         9bv7A1E39GF/niyqeaxPIeMhMIpP4iX7pJMGh0ZfxpP7vv9RhIczhCBdEeIoI8NW68P7
         MLVVYZ496kR7M9FaDLblPmhphzuMa0X0n3XOMMt9YPlvPqmOgCpb0KAgmSQK2pEgn/2V
         qRjA==
X-Forwarded-Encrypted: i=1; AJvYcCViZhSCK3dNeyiMcM0jspn4+gk7mww1JNLZQhaxA8U1mguHFl2L6Q/+87pba7PWT7+sfb3fZlV3EPwgaZ/ZfVFbLeD0HCWzLKmLEmI=
X-Gm-Message-State: AOJu0YyA7jLoM0UIZIxUltCIT0SEw/ldYhsi+zmGNEj/rjF2F2jYSR0r
	1Q/y4Xtp4zbAYCHOx2aR2zL+BqUzSs2mnaVKKHbGk4M9UtHMVJ5kezhfRbFiobNzCNP4AkAkl6Q
	=
X-Google-Smtp-Source: AGHT+IGsHnpSN/vIhfOsOmL0mulMuf0vXudVa10mCvI03A6IGkaP5NIy2nEwA3+/FAwDrkQFspjodg==
X-Received: by 2002:a05:622a:451:b0:430:e4c9:ccae with SMTP id o17-20020a05622a045100b00430e4c9ccaemr2722230qtx.60.1711117906060;
        Fri, 22 Mar 2024 07:31:46 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id cb27-20020a05622a1f9b00b00430eb19dd06sm904924qtb.91.2024.03.22.07.31.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 07:31:45 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-69675e3be15so94366d6.1
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 07:31:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtuMSXy+PGnmCPGjfFc73GkUU7HruTk7F3I2ePa9kCkiqByUA9k3i77JEqkcKoCBQxpijJK40/CIExyxccJZKoJ0Yt386eGVksx8c=
X-Received: by 2002:ad4:4707:0:b0:696:6f2b:a224 with SMTP id
 qb7-20020ad44707000000b006966f2ba224mr1215671qvb.52.1711117904887; Fri, 22
 Mar 2024 07:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
 <20231122-guenter-mini-v5-3-15d8cd8ed74f@chromium.org> <20231122133330.GE3909@pendragon.ideasonboard.com>
 <CANiDSCunxALoBJg-u_s=A1Zi-NF3SaNRFhv3=2jTx0oeAPrCZw@mail.gmail.com> <20240322141902.GV18799@pendragon.ideasonboard.com>
In-Reply-To: <20240322141902.GV18799@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Mar 2024 15:31:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCvkaYzz=CdO8TrC8XVy2xoEXSAY+ijM+2VLf8iod1kPkQ@mail.gmail.com>
Message-ID: <CANiDSCvkaYzz=CdO8TrC8XVy2xoEXSAY+ijM+2VLf8iod1kPkQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: uvcvideo: Do not use usb_* functions after .disconnect
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 22 Mar 2024 at 15:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Nov 22, 2023 at 03:59:10PM +0100, Ricardo Ribalda wrote:
> > On Wed, 22 Nov 2023 at 14:33, Laurent Pinchart wrote:
> > > On Wed, Nov 22, 2023 at 11:45:49AM +0000, Ricardo Ribalda wrote:
> > > > usb drivers should not call to any I/O function after the
> > > > .disconnect() callback has been triggered.
> > > > https://www.kernel.org/doc/html/latest/driver-api/usb/callbacks.html#the-disconnect-callback
> > > >
> > > > If an application is receiving frames form a camera and the device is
> > > > disconnected: the device will call close() after the usb .disconnect()
> > > > callback has been called. The streamoff path will call usb_set_interface
> > > > or usb_clear_halt, which is not allowed.
> > > >
> > > > This patch only solves the calls to close() *after* .disconnect() is
> > > > being called.
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
> > > > index d5dbf2644272..d78640d422f4 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2266,6 +2266,8 @@ static void uvc_disconnect(struct usb_interface *intf)
> > > >               return;
> > > >
> > > >       uvc_unregister_video(dev);
> > > > +     /* Barrier needed to pair with uvc_video_stop_streaming(). */
> > > > +     smp_store_release(&dev->disconnected, true);
> > >
> > > I can't think this would be such a hot path that we really need barriers
> > > in the driver.
> >
> > Using the same variable from two contexts without any sync feels weird.
> >
> > Your concern is that there will be a big penalty by using the
> > barriers? This is only used in stop_streaming and the shutdown path.
>
> What I meant is that lockless concurrency is much harder to get right
> than locked concurrency. Unless there's an important reason not to use
> lock (which would I think need to be related to performance, and I don't
> see that being an issue here), I think using locks will be less
> error-prone and more maintainable. That's the KISS approach to
> concurrency (even if it doesn't directly address lockless concurrency, I
> like the approach advocated by Sima in
> https://blog.ffwll.ch/2022/07/locking-engineering.html).

Gotcha, :)

I thought you wanted to remove the locking all together.

Something like:
> +     if (!stream->dev->disconnected)
> +             uvc_video_halt(stream);

(Which will likely work btw :P)



>
> > > >       kref_put(&dev->ref, uvc_delete);
> > > >  }
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index 28dde08ec6c5..f5ef375088de 100644
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
> > > > +      * Barrier needed to pair with uvc_disconnect().
> > > > +      * We cannot call usb_* functions on a disconnected USB device.
> > > > +      */
> > > > +     if (!smp_load_acquire(&stream->dev->disconnected))
> > > > +             uvc_video_halt(stream);
> > > > +
> > > >       uvc_video_clock_cleanup(stream);
> > > >  }
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index ba8f8c1f2c83..5b1a3643de05 100644
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
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

