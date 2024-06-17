Return-Path: <linux-media+bounces-13388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31390A6EB
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EFC32817A1
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 07:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A75618C33E;
	Mon, 17 Jun 2024 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bwo2pKW4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6638186E26
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718608942; cv=none; b=MYYViq86MMPcQ2z2MROyTUFRc+RaWh0CTLU8aqjx3znAOG39C3ZLdy2m35NLsb7cbVpXek4W0P+iMTJPD/VMlGSlvoUkENKzVk2uDriTPp6/u5yzdNbsp7zT1SOuNFHuuH2llp3QSRMjw+hLWuJa0F/0X684lQq7iPkWcHLj7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718608942; c=relaxed/simple;
	bh=EFNldt9oc31BBroDOkUyJUbk2o4DNigh/XsiF4ogy9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWYYTJlCAZgWUWZ5K2BfzlC8zDZhbPmnPX9SfnnVIn8edgM3KgUIEQBfo1pUbrO9xrI8epq+PS41NLdce//YxPrtHEdftgS/ilJTojzoD7kOnDMY+8kT+D3tr6lwkYO45E8UUl5YwBn1W+zW61D0KERdPbBHgeH4VPdpqu51gjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bwo2pKW4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cc7e85b4bso3356070a12.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718608939; x=1719213739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aFFKDT/kzIPthRB43TtXXoQ3gwMY3tRaFeq+i+fnC0=;
        b=Bwo2pKW4rOtXLwLPjS7PDmJdvj9vjfE+EbgfV+xdRTHr//YFIH901rMLBorduG2993
         XJFCBG16Zkg4TI3gWsaybcS/IrMxQ97gpbMSmydIuDH2Rn77Y+QsHnX+wTFd/qxmwsTa
         Js8mY3OdPzcs4MJw1HqP3oZrfhZ1HJG1YMTvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718608939; x=1719213739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aFFKDT/kzIPthRB43TtXXoQ3gwMY3tRaFeq+i+fnC0=;
        b=AQnWbwE90y8LB8IBFJttqbGwQJY4oFSgSpQ1V2rJZQMl/98W8YLGA7j/GCwYHbY2Oc
         SWZTm4M6cgRBUTtR0ZCrT2mOmD+++8nydD3zAPE04lB3NkANwiLdYTDhc5lJfD0L/ega
         1m/JB28ZSiRb3xlcMk+e7cehSebz4O6tRxiNW88FNpw9dzB/TQYKAQiRIVrM2ktWBbvP
         JEfVK1lMjwMjLe+2fRrGz0qbM63WbASXYfVI7Z3O3i2nEIB4zXEwRzMP7wqLQCzud03c
         4XclMTpWxIssXuW+kx+fSSkt3DbHvHBv8UgFNWkCM5LCJ9FJk3aC+CdkBxKH22Ut5R/2
         gRNw==
X-Forwarded-Encrypted: i=1; AJvYcCUi8BI5jAS/BopGTaubU6as8gY9ch1fVogEutZY0JtGz+7di+tDvb8K1joTPWgbLQ2sPY2clBJUYVnExYhA1ryEzDRYfdgbQ5jE17s=
X-Gm-Message-State: AOJu0YwvgTAr8WQuvjUGhKV2L2BkmItut17tMk3/pPWuCa2ADWwAO/Ur
	bbzll3tRBAIjm81roMp0aU4cTBsnYn1WDUNhKVsxCQycKqzQCmPbq7shGa6XEpoVQzhSG3uKSRY
	=
X-Google-Smtp-Source: AGHT+IHyL/4AH6CZryB2kBvgKhTBmiaWSuAQuEsWPKJRFHtwqX2PrYF2MHDR80tQAERUOasVrtyIWw==
X-Received: by 2002:a50:d49a:0:b0:57c:6a05:afd0 with SMTP id 4fb4d7f45d1cf-57cbd8f19abmr6706894a12.14.1718608938680;
        Mon, 17 Jun 2024 00:22:18 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72e9d90sm6026401a12.56.2024.06.17.00.22.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:22:18 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cb9efd8d1so1150839a12.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 00:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZhMC8mOWBeASxqyroWjryiVl1JLU26ojQxt3jwCEOOZY796sgdw20D9nSg3nlb92ilhbETZWKeT7gSRtGd6Ppu469i3eHE2bs1OA=
X-Received: by 2002:a17:906:b28a:b0:a6f:1d4e:734f with SMTP id
 a640c23a62f3a-a6f608bbab5mr562399266b.36.1718608937530; Mon, 17 Jun 2024
 00:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-1-7b7fdc3b21b3@chromium.org> <20240616235410.GN4782@pendragon.ideasonboard.com>
In-Reply-To: <20240616235410.GN4782@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Jun 2024 09:22:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCueAU6R_NDKQcFMOTqtrYB7QAQL6oUQanR=-dTnhsaTbQ@mail.gmail.com>
Message-ID: <CANiDSCueAU6R_NDKQcFMOTqtrYB7QAQL6oUQanR=-dTnhsaTbQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] media: uvcvideo: Stop stream during unregister
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 17 Jun 2024 at 01:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Jun 14, 2024 at 12:41:27PM +0000, Ricardo Ribalda wrote:
> > uvc_unregister_video() can be called asynchronously from
> > uvc_disconnect(). If the device is still streaming when that happens, a
> > plethora of race conditions can occur.
> >
> > Make sure that the device has stopped streaming before exiting this
> > function.
> >
> > If the user still holds handles to the driver's file descriptors, any
> > ioctl will return -ENODEV from the v4l2 core.
> >
> > This change makes uvc more consistent with the rest of the v4l2 drivers
> > using the vb2_fop_* and vb2_ioctl_* helpers.
>
> As I've said many times before, this issue needs a fix in the V4L2 core,
> ideally with support in the cdev core. It seems I'll have to do it
> myself ?

 vb2_video_unregister_device() already patched this issue. We are just
porting that solution to UVC, because uvc is not using the vb2
helpers.
I don't see why being more consistent with the rest of the v4l2 driver
makes it a bad thing.

I am reverting the ChromeOS solution for this race condition and
applying this patch instead:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/5632459/1
That is going to test this patch in some million devices in some days.

This change is self-contained, fixes a real problem, makes the driver
consistent and will be tested by lots of users. We could land this
patch and help our users until there is a solution in cdev.
I would argue that even with a solution in cdev this is not a bad patch.

> ideally with support in the cdev core. It seems I'll have to do it
> myself ?

I can help reviewing and testing ;)

Regards!


>
> > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index bbd90123a4e7..55132688e363 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1908,11 +1908,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
> >       struct uvc_streaming *stream;
> >
> >       list_for_each_entry(stream, &dev->streams, list) {
> > +             /* Nothing to do here, continue. */
> >               if (!video_is_registered(&stream->vdev))
> >                       continue;
> >
> > +             /*
> > +              * For stream->vdev we follow the same logic as:
> > +              * vb2_video_unregister_device().
> > +              */
> > +
> > +             /* 1. Take a reference to vdev */
> > +             get_device(&stream->vdev.dev);
> > +
> > +             /* 2. Ensure that no new ioctls can be called. */
> >               video_unregister_device(&stream->vdev);
> > -             video_unregister_device(&stream->meta.vdev);
> > +
> > +             /* 3. Wait for old ioctls to finish. */
> > +             mutex_lock(&stream->mutex);
> > +
> > +             /* 4. Stop streaming. */
> > +             uvc_queue_release(&stream->queue);
> > +
> > +             mutex_unlock(&stream->mutex);
> > +
> > +             put_device(&stream->vdev.dev);
> > +
> > +             /*
> > +              * For stream->meta.vdev we can directly call:
> > +              * vb2_video_unregister_device().
> > +              */
> > +             vb2_video_unregister_device(&stream->meta.vdev);
> > +
> > +             /*
> > +              * Now both vdevs are not streaming and all the ioctls will
> > +              * return -ENODEV.
> > +              */
> >
> >               uvc_debugfs_cleanup_stream(stream);
> >       }
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

