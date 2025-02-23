Return-Path: <linux-media+bounces-26734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A520A41147
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5560B170E3B
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A5818DF7C;
	Sun, 23 Feb 2025 19:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RBP76z27"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046B3FB3B
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740339164; cv=none; b=Sx1gBtpDvDjeGTCarF7SBTYLpvJACVAe2UQLc4DMSX5AVk+9IQ+LTg5BlwesheWGkBgLbGdtNp4B11/DkAR2hrEfsXKIcfvE/dtlzWzxXkWGaAhKfmoCqSTw3Qeli10A2d0/O+qyUTIb0W0D7kxLGI821o0/xc1tfT775h2q0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740339164; c=relaxed/simple;
	bh=ZAUvJY754rggryTC2ahWK68Vo7OkVEGJzzBE/hxnpps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+YFtx41nKQTemciaE43uJPxrRQoP8P3aFkQfgxj++AAfFUjhjhmm9Jl9GyqgPM0MwWk0LG1tb/P/njP9bFEEHtJtVR8TTMHUsNKKg09NWDkLYj4W+SatQIoG2V5qk86AD4LkmjK1/MKE0/pePr5I176oe0FfUi7+XkpOLeQpd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RBP76z27; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54622e97753so3462433e87.0
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740339160; x=1740943960; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7zznMgxYxrARWKQINL/Oo45oo2+34QKcLqU//MIFPe8=;
        b=RBP76z27J5FfFcyONBiH0OqCFu00vePVAOup+GYnCvn9ALzWNZqJSBRI4jZ+EwlESk
         FdbCLhAhMFplpRK4RWSSnpxcZqX+maojTeRwmWOP2giJY4tRRBPmk/lfSSxZHzqRfOhi
         ExVICm58l0U0QsZJ0XNvl2N0g7Wqc9EjKalEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740339160; x=1740943960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zznMgxYxrARWKQINL/Oo45oo2+34QKcLqU//MIFPe8=;
        b=dyvhFiDmpJui6LCwBdeQHFyDFj/MYIpJb4TLJkqYRnWGL8l6YVsXmlZbzjJon+MU4t
         TSe9OpIHcBv8+dcIXOYsjGnF4uPNR62r6nHi4vqeOiEGHLFFIP4A7iCf0xThR7haE5a2
         Lox+97VQMXcOBMWu2btxS4d6ZGSSJRj1BugsPtzC0iPCB7J3WbLoL+mqJ4Tfu6xuwGY7
         m8hVeaXVHEqUSvEFQY7MnyiHMdDOMEXaaNrDe3cnrLOZ6epGeY41gSLAUaEIg2f5sLju
         BEKXaK5qdoHq784IaYv8G7GahX5HqWU63uAjRjgDjAnUGRmuqBtgIKIYrlR1j79/LiGr
         nfHg==
X-Forwarded-Encrypted: i=1; AJvYcCVYnsB7V4958zi0xll409gicC4p+GGX4asoeY42mspgfGTFphh/tuKsyVYgL7uO7osT574PEV8aiiieYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxminaAyGtjF9QAwTdvjGBeNivJJQcFLLIV825rIkR/FMcBkrTc
	Y78yIHmWz4j8a7gglFgEvvetJmpQouxrVsV432+0FSnmBbOy0T6xV2dAo/6Asd0m5/RGXpyeDlU
	BQA==
X-Gm-Gg: ASbGnctrXcUWJ/Jn5iCSSnPjcGjIQvHaajKqyC1vCGz7fDBRM8MJHQNek9EqT+sFp2T
	1mwia5somsJoNYDgrdLhP41wlbtk06u6Q9hZHBNqfl6na6UgG8mg/b04Dul01IIZJqzyP2Y+tDg
	BDVUOVvWf+mb7pdKBRVE8D312vfueMWd0pKos7H8tyxbwU03aEbQyMB7Ar+kmeSzUuoCPSluJQd
	d4bjMP0pD1ysBfND0BO/WKWNO+C/wOTt3O5B1wRUWCoAinaB3qbK9nvt/I86AFwZCEyx42nb1JV
	EZl5JeEQOpux0Rb4eQ8kOR0+JH9Oie+9nfch/zmGhn16ZABqD27VaLScAKVF1g/A
X-Google-Smtp-Source: AGHT+IEhf+0JpWWlaemYooi0bseYfg9NlAHSfgCJLEsirkTeyP/qAb1rGibd77xSqF7MHabDnCCqwA==
X-Received: by 2002:a05:6512:1090:b0:545:ec1:9fd3 with SMTP id 2adb3069b0e04-546e418d344mr5544991e87.9.1740339160398;
        Sun, 23 Feb 2025 11:32:40 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54531d76843sm2548877e87.84.2025.02.23.11.32.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 11:32:38 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54622e97753so3462418e87.0
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 11:32:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXa9pAPJ2waMSWFWC5QAmmyat9jMM3fODbXax6twZEgh8hbkQLDtGZZ1jv1OWVjFQEQY4/2Ue5dPL91fA==@vger.kernel.org
X-Received: by 2002:a05:6512:138c:b0:545:2cb2:8b25 with SMTP id
 2adb3069b0e04-54838c72c15mr3279598e87.14.1740339157875; Sun, 23 Feb 2025
 11:32:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org> <20250223143617.GA27463@pendragon.ideasonboard.com>
In-Reply-To: <20250223143617.GA27463@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 20:32:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCupq4A=ctR=Kkp7VxB+gvw=Z8MdDZHDShVMMAzms0VUAg@mail.gmail.com>
X-Gm-Features: AWEUYZk4BCUlhZfDAEyMq_DXEXIN0g964L9anV-yYjRBNI9yv9NV-k2f4kKSGpc
Message-ID: <CANiDSCupq4A=ctR=Kkp7VxB+gvw=Z8MdDZHDShVMMAzms0VUAg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix deferred probing error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Feb 2025 at 15:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Jan 29, 2025 at 12:39:46PM +0000, Ricardo Ribalda wrote:
> > uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> > have not yet been probed. This return code should be propagated to the
> > caller of uvc_probe() to ensure that probing is retried when the required
> > GPIOs become available.
> >
> > Currently, this error code is incorrectly converted to -ENODEV,
> > causing some internal cameras to be ignored.
> >
> > This commit fixes this issue by propagating the -EPROBE_DEFER error.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index a10d4f4d9f95..73a7f23b616c 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2253,9 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
> >       }
> >
> >       /* Parse the associated GPIOs. */
> > -     if (uvc_gpio_parse(dev) < 0) {
> > +     ret = uvc_gpio_parse(dev);
> > +     if (ret < 0) {
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> > -             goto error;
> > +             goto error_retcode;
> >       }
> >
> >       dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> > @@ -2328,9 +2329,11 @@ static int uvc_probe(struct usb_interface *intf,
> >       return 0;
> >
> >  error:
> > +     ret = -ENODEV;
> > +error_retcode:
>
> This isn't very nice. Could we instead also propagate error codes from
> other locations in the uvc_probe() function ? If you want to minimize
> changes, you can initialize ret to -ENODEV, and turn the (ret < 0) check
> for uvc_gpio_parse() to a (ret) check.

Not very nice, but easy to backport to stables. What about a follow-up
change like this:

index c93abe2367aa..8c67feca1688 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2261,7 +2261,7 @@ static int uvc_probe(struct usb_interface *intf,
        ret = uvc_gpio_parse(dev);
        if (ret < 0) {
                uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
-               goto error_retcode;
+               goto error;
        }

        dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
@@ -2285,24 +2285,32 @@ static int uvc_probe(struct usb_interface *intf,
        }

        /* Register the V4L2 device. */
-       if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
+       ret = v4l2_device_register(&intf->dev, &dev->vdev);
+       if (ret < 0)
                goto error;

        /* Scan the device for video chains. */
-       if (uvc_scan_device(dev) < 0)
+       if (uvc_scan_device(dev) < 0) {
+               ret = -ENODEV;
                goto error;
+       }

        /* Initialize controls. */
-       if (uvc_ctrl_init_device(dev) < 0)
+       if (uvc_ctrl_init_device(dev) < 0) {
+               ret = -ENODEV;
                goto error;
+       }

        /* Register video device nodes. */
-       if (uvc_register_chains(dev) < 0)
+       if (uvc_register_chains(dev) < 0) {
+               ret = -ENODEV;
                goto error;
+       }

 #ifdef CONFIG_MEDIA_CONTROLLER
        /* Register the media device node */
-       if (media_device_register(&dev->mdev) < 0)
+       ret = media_device_register(&dev->mdev);
+       if (ret < 0)
                goto error;
 #endif
        /* Save our data pointer in the interface data. */
@@ -2334,8 +2342,6 @@ static int uvc_probe(struct usb_interface *intf,
        return 0;

 error:
-       ret = -ENODEV;
-error_retcode:
        uvc_unregister_video(dev);
        kref_put(&dev->ref, uvc_delete);
        return ret;


>
> >       uvc_unregister_video(dev);
> >       kref_put(&dev->ref, uvc_delete);
> > -     return -ENODEV;
> > +     return ret;
> >  }
> >
> >  static void uvc_disconnect(struct usb_interface *intf)
> >
> > ---
> > base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
> > change-id: 20250129-uvc-eprobedefer-b5ebb4db63cc
>
> --
> Regards,
>
> Laurent Pinchart

Let me know what do you think so I can send a v2 with the change
proposed by Doug.

Regards!

-- 
Ricardo Ribalda

