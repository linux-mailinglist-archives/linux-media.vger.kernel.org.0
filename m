Return-Path: <linux-media+bounces-26733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1FFA41146
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457BF3B4156
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C59F15747D;
	Sun, 23 Feb 2025 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OhIbd8k8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4FB2111
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740339075; cv=none; b=I3tUNce1arvvAoXRLpy3MksCs30z3bxR/JIWBJfX3NqsUX4fKZePmAAmCRXBzKyBHGkB5HIAeOerL6yOj9IF6mOg6ovFGYeMcMTUXUlP8qEQAKyWjhNwC5X3QI9A2W9VnG5TTk+p5GPVkt4rQPziwBnaryDkOCajHH7uyaAl46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740339075; c=relaxed/simple;
	bh=2Z1NwK/0454h8TNoUg0Cadh1/HjjvpP+PU6GhxtzGok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB3D0OTwUSYuJuSWIalG8CGBH0trYLJbhGsNI0qrGaAibK3/tT56JJFxe1r/8pdLsNBhe91xE7bwF2wAGEGDGKEmtXYGUES7Y82FjF2BKzaw4oSMHDekhEuj0/t1inWz2+aOAIrWCh0sQmuGdjxQ+4iRDIk5gi5ZfdAPFYcK5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OhIbd8k8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A8FA4DC;
	Sun, 23 Feb 2025 20:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740338985;
	bh=2Z1NwK/0454h8TNoUg0Cadh1/HjjvpP+PU6GhxtzGok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhIbd8k8FTxyVYv6eHbewoSn6jUTSFTCAiF3Nx+pf+PZ+8TLbuol6jrjuptOEOle/
	 x5QbLXtSqzTyjMHcfr5MXW1b0ngtAvO1Oel3x6s5Kl66IiVbdAWADuXFT2VYq217m8
	 VUYGpLu91XsYu3iBQ0Kf9P+PxT/Mhq7r3QZTfk6A=
Date: Sun, 23 Feb 2025 21:30:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] media: uvcvideo: Drop the uvc_driver structure
Message-ID: <20250223193054.GA22632@pendragon.ideasonboard.com>
References: <20250223150557.25148-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCush=-=De9vVa5HGq0hgsgzPXxivAm3iOF_Dde17OqLHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCush=-=De9vVa5HGq0hgsgzPXxivAm3iOF_Dde17OqLHw@mail.gmail.com>

On Sun, Feb 23, 2025 at 08:05:33PM +0100, Ricardo Ribalda wrote:
> On Sun, 23 Feb 2025 at 16:06, Laurent Pinchart wrote:
> >
> > The uvc_driver structure used to contain more fields, but those got
> > removed in commit ba2fa99668bb ("[media] uvcvideo: Hardcode the
> > index/selector relationship for XU controls"). The structure is now just
> > a wrapper around usb_driver. Drop it.
> >
> > Fixes: ba2fa99668bb ("[media] uvcvideo: Hardcode the index/selector relationship for XU controls")
>
> Do we really want to declare a fix here?

I don't mind dropping it. Backports are not important.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 35 +++++++++++++++---------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  7 ------
> >  2 files changed, 17 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index deadbcea5e22..84e931959198 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -37,6 +37,8 @@ static unsigned int uvc_quirks_param = -1;
> >  unsigned int uvc_dbg_param;
> >  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> >
> > +static struct usb_driver uvc_driver;
> > +
> >  /* ------------------------------------------------------------------------
> >   * Utility functions
> >   */
> > @@ -546,7 +548,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >                 return -EINVAL;
> >         }
> >
> > -       if (usb_driver_claim_interface(&uvc_driver.driver, intf, dev)) {
> > +       if (usb_driver_claim_interface(&uvc_driver, intf, dev)) {
> >                 uvc_dbg(dev, DESCR,
> >                         "device %d interface %d is already claimed\n",
> >                         dev->udev->devnum,
> > @@ -556,7 +558,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >
> >         streaming = uvc_stream_new(dev, intf);
> >         if (streaming == NULL) {
> > -               usb_driver_release_interface(&uvc_driver.driver, intf);
> > +               usb_driver_release_interface(&uvc_driver, intf);
> >                 return -ENOMEM;
> >         }
> >
> > @@ -779,7 +781,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >         return 0;
> >
> >  error:
> > -       usb_driver_release_interface(&uvc_driver.driver, intf);
> > +       usb_driver_release_interface(&uvc_driver, intf);
> >         uvc_stream_delete(streaming);
> >         return ret;
> >  }
> > @@ -1922,8 +1924,7 @@ static void uvc_delete(struct kref *kref)
> >                 struct uvc_streaming *streaming;
> >
> >                 streaming = list_entry(p, struct uvc_streaming, list);
> > -               usb_driver_release_interface(&uvc_driver.driver,
> > -                       streaming->intf);
> > +               usb_driver_release_interface(&uvc_driver, streaming->intf);
> >                 uvc_stream_delete(streaming);
> >         }
> >
> > @@ -3196,17 +3197,15 @@ static const struct usb_device_id uvc_ids[] = {
> >
> >  MODULE_DEVICE_TABLE(usb, uvc_ids);
> >
> > -struct uvc_driver uvc_driver = {
> > -       .driver = {
> > -               .name           = "uvcvideo",
> > -               .probe          = uvc_probe,
> > -               .disconnect     = uvc_disconnect,
> > -               .suspend        = uvc_suspend,
> > -               .resume         = uvc_resume,
> > -               .reset_resume   = uvc_reset_resume,
> > -               .id_table       = uvc_ids,
> > -               .supports_autosuspend = 1,
> > -       },
> > +static struct usb_driver uvc_driver = {
> > +       .name           = "uvcvideo",
> > +       .probe          = uvc_probe,
> > +       .disconnect     = uvc_disconnect,
> > +       .suspend        = uvc_suspend,
> > +       .resume         = uvc_resume,
> > +       .reset_resume   = uvc_reset_resume,
> > +       .id_table       = uvc_ids,
> > +       .supports_autosuspend = 1,
> >  };
> >
> >  static int __init uvc_init(void)
> > @@ -3215,7 +3214,7 @@ static int __init uvc_init(void)
> >
> >         uvc_debugfs_init();
> >
> > -       ret = usb_register(&uvc_driver.driver);
> > +       ret = usb_register(&uvc_driver);
> >         if (ret < 0) {
> >                 uvc_debugfs_cleanup();
> >                 return ret;
> > @@ -3226,7 +3225,7 @@ static int __init uvc_init(void)
> >
> >  static void __exit uvc_cleanup(void)
> >  {
> > -       usb_deregister(&uvc_driver.driver);
> > +       usb_deregister(&uvc_driver);
> >         uvc_debugfs_cleanup();
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b63720e21075..b4ee701835fc 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -632,10 +632,6 @@ struct uvc_fh {
> >         unsigned int pending_async_ctrls;
> >  };
> >
> > -struct uvc_driver {
> > -       struct usb_driver driver;
> > -};
> > -
> >  /* ------------------------------------------------------------------------
> >   * Debugging, printing and logging
> >   */
> > @@ -686,9 +682,6 @@ do {                                                                        \
> >   * Internal functions.
> >   */
> >
> > -/* Core driver */
> > -extern struct uvc_driver uvc_driver;
> > -
> >  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> >
> >  /* Video buffers queue management. */
> >
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b

-- 
Regards,

Laurent Pinchart

