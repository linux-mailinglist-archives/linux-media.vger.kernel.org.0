Return-Path: <linux-media+bounces-27348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0FBA4C4DD
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 272DA7A929C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B44C214A79;
	Mon,  3 Mar 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JBrOnoY5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBAF15855E;
	Mon,  3 Mar 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741015108; cv=none; b=Ow8O1j0TmdIzemuCglGpximQjtFXn1tR7DslCU2fH/JdSqcODW1Kx8CWSiippO0xXfrUZllcWkLcEbLQRj1h5rG3MGwqfUQCNUfdGp7b6jy6CAaGXppB1GXKHHNXMnNA77RGl5DzF8N3Y38t7/9CCfNIE+8GXB2IBU7s0+Gytp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741015108; c=relaxed/simple;
	bh=/HQqaOxmQjTOU9QyIQ+Q//w7j9/nF5iJlhcwlMTOh7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7ETcMWvHKbnU2Rrg3HolLDp/R4kAL9SuyJbEsR1mVUYtTVGnODZFM1kCgEtj1Q5Dv388oZ3kneokXeNA0LRuWj9PpjP7fb/x/9aozSbmr+3wWhRB3+0mFWQR9GHuVpftZMlOgqjiG8RRnOC2FQNTSmofH/SgKLloeyjvcVNpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JBrOnoY5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 677F02D5;
	Mon,  3 Mar 2025 16:16:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741015014;
	bh=/HQqaOxmQjTOU9QyIQ+Q//w7j9/nF5iJlhcwlMTOh7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBrOnoY5GYaBPQe4qz5oiKxOw6+UTrKCb1zwo+tA9DropmN9BLFW52zUkk+lWRJAt
	 eDvlD0u2rtwsadsmQ77J2h99gPPC74po89DH8SSNPo4yJTtK4qma36M7dWRefY58mT
	 HFdawMdP/ubdnz7+7Ui+ypUN4ytLr2BX6iReSB9I=
Date: Mon, 3 Mar 2025 17:18:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix deferred probing error
Message-ID: <20250303151804.GF32048@pendragon.ideasonboard.com>
References: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>
 <20250223143617.GA27463@pendragon.ideasonboard.com>
 <CANiDSCupq4A=ctR=Kkp7VxB+gvw=Z8MdDZHDShVMMAzms0VUAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCupq4A=ctR=Kkp7VxB+gvw=Z8MdDZHDShVMMAzms0VUAg@mail.gmail.com>

On Sun, Feb 23, 2025 at 08:32:24PM +0100, Ricardo Ribalda wrote:
> On Sun, 23 Feb 2025 at 15:36, Laurent Pinchart wrote:
> > On Wed, Jan 29, 2025 at 12:39:46PM +0000, Ricardo Ribalda wrote:
> > > uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> > > have not yet been probed. This return code should be propagated to the
> > > caller of uvc_probe() to ensure that probing is retried when the required
> > > GPIOs become available.
> > >
> > > Currently, this error code is incorrectly converted to -ENODEV,
> > > causing some internal cameras to be ignored.
> > >
> > > This commit fixes this issue by propagating the -EPROBE_DEFER error.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index a10d4f4d9f95..73a7f23b616c 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2253,9 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
> > >       }
> > >
> > >       /* Parse the associated GPIOs. */
> > > -     if (uvc_gpio_parse(dev) < 0) {
> > > +     ret = uvc_gpio_parse(dev);
> > > +     if (ret < 0) {
> > >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> > > -             goto error;
> > > +             goto error_retcode;
> > >       }
> > >
> > >       dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> > > @@ -2328,9 +2329,11 @@ static int uvc_probe(struct usb_interface *intf,
> > >       return 0;
> > >
> > >  error:
> > > +     ret = -ENODEV;
> > > +error_retcode:
> >
> > This isn't very nice. Could we instead also propagate error codes from
> > other locations in the uvc_probe() function ? If you want to minimize
> > changes, you can initialize ret to -ENODEV, and turn the (ret < 0) check
> > for uvc_gpio_parse() to a (ret) check.
> 
> Not very nice, but easy to backport to stables. What about a follow-up
> change like this:

How about the nicer fix for mainline, and a simpler to backport one for
stable ? The main focus should be on mainline, not backports.

> index c93abe2367aa..8c67feca1688 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2261,7 +2261,7 @@ static int uvc_probe(struct usb_interface *intf,
>         ret = uvc_gpio_parse(dev);
>         if (ret < 0) {
>                 uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> -               goto error_retcode;
> +               goto error;
>         }
> 
>         dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> @@ -2285,24 +2285,32 @@ static int uvc_probe(struct usb_interface *intf,
>         }
> 
>         /* Register the V4L2 device. */
> -       if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> +       ret = v4l2_device_register(&intf->dev, &dev->vdev);
> +       if (ret < 0)
>                 goto error;
> 
>         /* Scan the device for video chains. */
> -       if (uvc_scan_device(dev) < 0)
> +       if (uvc_scan_device(dev) < 0) {
> +               ret = -ENODEV;
>                 goto error;
> +       }
> 
>         /* Initialize controls. */
> -       if (uvc_ctrl_init_device(dev) < 0)
> +       if (uvc_ctrl_init_device(dev) < 0) {
> +               ret = -ENODEV;
>                 goto error;
> +       }
> 
>         /* Register video device nodes. */
> -       if (uvc_register_chains(dev) < 0)
> +       if (uvc_register_chains(dev) < 0) {
> +               ret = -ENODEV;
>                 goto error;
> +       }
> 
>  #ifdef CONFIG_MEDIA_CONTROLLER
>         /* Register the media device node */
> -       if (media_device_register(&dev->mdev) < 0)
> +       ret = media_device_register(&dev->mdev);
> +       if (ret < 0)
>                 goto error;
>  #endif
>         /* Save our data pointer in the interface data. */
> @@ -2334,8 +2342,6 @@ static int uvc_probe(struct usb_interface *intf,
>         return 0;
> 
>  error:
> -       ret = -ENODEV;
> -error_retcode:
>         uvc_unregister_video(dev);
>         kref_put(&dev->ref, uvc_delete);
>         return ret;
> 
> > >       uvc_unregister_video(dev);
> > >       kref_put(&dev->ref, uvc_delete);
> > > -     return -ENODEV;
> > > +     return ret;
> > >  }
> > >
> > >  static void uvc_disconnect(struct usb_interface *intf)
> > >
> > > ---
> > > base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
> > > change-id: 20250129-uvc-eprobedefer-b5ebb4db63cc
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> 
> Let me know what do you think so I can send a v2 with the change
> proposed by Doug.
> 
> Regards!

-- 
Regards,

Laurent Pinchart

