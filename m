Return-Path: <linux-media+bounces-30766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC5A97ADC
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 01:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62824461114
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD852C2591;
	Tue, 22 Apr 2025 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eOPSGLbo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3A9476;
	Tue, 22 Apr 2025 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363119; cv=none; b=ROdf0u4D7sl5HNxBPCWVeYH5jA7Bx4dRxZMModgL8oypGX3wWedhR0rUs0YDVDLrnMnhKuow7G/GGnjbMXoDgDuTBZeaPISmGF+IlCXPVZ2G96gy0XXe4Tktl9GE+Pu5Ss2pRxqEor+GrWS7WtTE0nZ5yO4VPJk9Y2dMb0gyZJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363119; c=relaxed/simple;
	bh=FL5En/dLy4zeOnwuuG6OIWOr8qeBBzE0k/ehSxsVGAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+amArNU6bnm1xjFNGJCxfWhV1//wi2oYmbS9HSL26zD6lBo0fR+3EPaDdDL/upBlnR/CTi7UUPhgS6XK1ziyelWT/kCMk2XB7f8SMxJVqUDnSz/9X/pZWvxEa0ugix6+tF4XHaNaWehcHxZM+M5sf8ERgJTw4cMkMfkzsi7Pfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eOPSGLbo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2181816A;
	Wed, 23 Apr 2025 01:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745363115;
	bh=FL5En/dLy4zeOnwuuG6OIWOr8qeBBzE0k/ehSxsVGAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOPSGLbo2IiCZaUTW4iE14SYcLgGCbtVbE6eBd95bNDqyMkXdifWW8omJ//X0hKfN
	 ugUn6eauz8CSwpmwgXvklVds5CyZU6a/CWaU7K7JbzoHJamjaa+z8byJgkhmk+trvf
	 G9j30riMdCE45dzR8gLgbOM+2fSlCYUcNY+OBOZQ=
Date: Wed, 23 Apr 2025 02:05:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
Message-ID: <20250422230513.GX17813@pendragon.ideasonboard.com>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org>
 <20250422180630.GJ17813@pendragon.ideasonboard.com>
 <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>

On Wed, Apr 23, 2025 at 06:50:10AM +0800, Ricardo Ribalda wrote:
> On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart wrote:
> > On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
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
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
> > >  1 file changed, 19 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
> > >  #endif
> > >
> > >       /* Parse the Video Class control descriptor. */
> > > -     if (uvc_parse_control(dev) < 0) {
> > > +     ret = uvc_parse_control(dev);
> > > +     if (ret < 0) {
> > > +             ret = -ENODEV;
> >
> > Why do you set ret to -ENODEV here...
> >
> > >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> > >               goto error;
> > >       }
> > >
> > >       /* Parse the associated GPIOs. */
> > > -     if (uvc_gpio_parse(dev) < 0) {
> > > +     ret = uvc_gpio_parse(dev);
> > > +     if (ret < 0) {
> > >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> > >               goto error;
> > >       }
> > > @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
> > >       }
> > >
> > >       /* Register the V4L2 device. */
> > > -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> > > +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
> > > +     if (ret < 0)
> >
> > ... but not here ? The code below is also not very consistant.
> 
> For all the "external" functions I was looking into populating their
> error code to probe(). Other drivers (check vivid for example) do
> exactly this.
> 
> There is more value in returning the real cause of the error (ENOMEM,
> EINVAL) that the plain ENODEV.

Yes, I got that, my question was why you override the return value of
e.g. uvc_parse_control() or uvc_scan_device() with -ENODEV, but not for
e.g. uvc_gpio_parse() or v4l2_device_register(). There's no explanation
in the commit message regarding why they're treated differently.

> > >               goto error;
> > >
> > >       /* Scan the device for video chains. */
> > > -     if (uvc_scan_device(dev) < 0)
> > > +     if (uvc_scan_device(dev) < 0) {
> > > +             ret = -ENODEV;
> > >               goto error;
> > > +     }
> > >
> > >       /* Initialize controls. */
> > > -     if (uvc_ctrl_init_device(dev) < 0)
> > > +     if (uvc_ctrl_init_device(dev) < 0) {
> > > +             ret = -ENODEV;
> > >               goto error;
> > > +     }
> > >
> > >       /* Register video device nodes. */
> > > -     if (uvc_register_chains(dev) < 0)
> > > +     if (uvc_register_chains(dev) < 0) {
> > > +             ret = -ENODEV;
> > >               goto error;
> > > +     }
> > >
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > >       /* Register the media device node */
> > > -     if (media_device_register(&dev->mdev) < 0)
> > > +     ret = media_device_register(&dev->mdev);
> > > +     if (ret < 0)
> > >               goto error;
> > >  #endif
> > >       /* Save our data pointer in the interface data. */
> > > @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
> > >  error:
> > >       uvc_unregister_video(dev);
> > >       kref_put(&dev->ref, uvc_delete);
> > > -     return -ENODEV;
> > > +     return ret;
> > >  }
> > >
> > >  static void uvc_disconnect(struct usb_interface *intf)

-- 
Regards,

Laurent Pinchart

