Return-Path: <linux-media+bounces-21675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539A9D3F45
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCB65B331BA
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649761CB320;
	Wed, 20 Nov 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hf3ND7ru"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0A44C74;
	Wed, 20 Nov 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114434; cv=none; b=sVGDVwKTbIh5CuRn3OSGiTg5Y4BPIqgXGM2VFmdiN7IZzLzB7tWfPp6VctvUrPqOT64/rTdWP4LQalEJD9cQdCbWOxQ69Rhhv5SaWvgFf+HaXoE7SmLuHkTibAnP4prMlCV++4vkJ4Fh+Zfu2lVf9fPeaScVp+/d8XoFlikmRkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114434; c=relaxed/simple;
	bh=mEidYxqzvijE7R/rD2WNYR7lU8E3yrAz7qB1aBUi8Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kj20bVtw9wJEFqO41MbEzO02BsSJYy2iSwF9ceetZA3WvKKvE8Cp6ZUKifG+pkPwqvi4XKfC+tzFJBv0ey9t9uPKzmltssfmSVLFF3/UnbT0+ti0nVv/tQsQmoJ//5i7gd+W7qjPx/01MRbgznQux4G9KDM/cVJsN8wPxHZrTsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hf3ND7ru; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0B6F55A;
	Wed, 20 Nov 2024 15:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732114413;
	bh=mEidYxqzvijE7R/rD2WNYR7lU8E3yrAz7qB1aBUi8Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hf3ND7ruDmEKp58wFrpBgo+Lx2JlykKOzp+WKJgDMQUzRIBf6VrZE2NrlQZPnWak4
	 A0gsnIs+VjTYZ0A/QwyhBg7hCVCpGB2RKsfy8SYeJb7+wDmkMIKqPMrLskZo3ij7Py
	 AC6zcvZNcfot3XX3/QqburwIEkxHnOQZ+vUDE2K0=
Date: Wed, 20 Nov 2024 16:53:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Support partial control reads
Message-ID: <20241120145341.GX12409@pendragon.ideasonboard.com>
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
 <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org>
 <20241120140526.GW12409@pendragon.ideasonboard.com>
 <CANiDSCvazZ4Y3OZ9X7chU-_N-4HbeQKUh23eOWkmkAxGaks2QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvazZ4Y3OZ9X7chU-_N-4HbeQKUh23eOWkmkAxGaks2QA@mail.gmail.com>

On Wed, Nov 20, 2024 at 03:43:22PM +0100, Ricardo Ribalda wrote:
> On Wed, 20 Nov 2024 at 15:05, Laurent Pinchart wrote:
> > On Mon, Nov 18, 2024 at 05:16:51PM +0000, Ricardo Ribalda wrote:
> > > Some cameras, like the ELMO MX-P3, do not return all the bytes
> > > requested from a control if it can fit in less bytes.
> > > Eg: Returning 0xab instead of 0x00ab.
> > > usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> > >
> > > Extend the returned value from the camera and return it.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index cd9c29532fb0..e165850397a0 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -76,8 +76,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > >
> > >       ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > >                               UVC_CTRL_CONTROL_TIMEOUT);
> > > -     if (likely(ret == size))
> > > +     if (ret > 0) {
> > > +             if (size == ret)
> > > +                     return 0;
> >
> > Why is this within the ret > 0 block ? I would write
> >
> >         if (likely(ret == size))
> >                 return 0;
> >
> >         if (ret > 0) {
> >
> > > +
> > > +             /*
> > > +              * In UVC the data is represented in little-endian by default.
> >
> > By default, or always ?
> >
> > > +              * Some devices return shorter control packages that expected
> >
> > What's a "control package" ?
> 
> usb control transfers.

Ah, did you mean "packet" instead of "package" ?

> > I think you meants "than expected", not "that expected".
> >
> > > +              * if the return value can fit in less bytes.
> > > +              * Zero all the bytes that the device have not written.
> > > +              */
> >
> > Do we want to apply this workaround to GET_INFO and GET_LEN, or can we
> > restrict it to GET_CUR, GET_MIN, GET_MAX and GET_RES ?
> 
> I believe that the original behaviour before
> a763b9fb58be ("media: uvcvideo: Do not return positive errors in
> uvc_query_ctrl()")
> was used for all types. I think the safest thing to do is to go back
> to the old behaviour.

I don't see how reverting that commit would help, or how that's related
to the question at hand.

I understand the device you're dealing with shortens transfers for
integer values when they would contain leading 0x00 bytes. The
workaround should be OK when retrieving the control value or its limits
and resolution. I wonder if it would be dangerous for GET_INFO, which
retrieves a bitmask. Does the device you've tested this with skip the
MSB for GET_INFO as well ?

Conceptually GET_LEN could be similarly excluded from the workaround,
but it will never take this code path as it's a 1 byte value.

> Let me know what you prefer.
> 
> > > +             memset(data + ret, 0, size - ret);
> > > +             dev_warn_once(&dev->udev->dev,
> > > +                           "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> > > +                           uvc_query_name(query), cs, unit, ret, size);
> > >               return 0;
> > > +     }
> > >
> > >       if (ret != -EPIPE) {
> > >               dev_err(&dev->udev->dev,

-- 
Regards,

Laurent Pinchart

