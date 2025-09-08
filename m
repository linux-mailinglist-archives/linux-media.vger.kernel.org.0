Return-Path: <linux-media+bounces-42031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A29B493D0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 17:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E505F4C0ADF
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E9E30F801;
	Mon,  8 Sep 2025 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kdk9aelH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC030E0F7;
	Mon,  8 Sep 2025 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346049; cv=none; b=gS4Smn5+3vQP48HPCV4gqwIXHaj87n8CEtfQv48vxeFYtDprsVlhFBba+7RcWZj9lTXeJ6EcIeLUSljqtm+5+I8gXYiZzEJwPjZAVxVJVwG6yhUbl3vqY6gynutgdSsrlMNJPbGG5KrOfLHHRh5Vgg5I0uzommlcAmVnICaLWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346049; c=relaxed/simple;
	bh=6hsHhAMzzpx9axcYsxclqZUNVuayYOO6Scs9OMAFiAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSL2QMG4hpL9K1Y459rUFNt9esuVIiZDgkXAxgmYkQa3McolCRextx8s3W4dmoQ0vVm+hGW+D5csuyohl8VW3NBZOjaDN1633EM60sCljH4aRNvu2CRtBgTI4ydBaZpwYZ+EzXqQWeOjytLjHb/y7/xWO9JhD7TbhkDjm7P/n34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kdk9aelH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-99-126-nat.elisa-mobile.fi [85.76.99.126])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9497EC71;
	Mon,  8 Sep 2025 17:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757345973;
	bh=6hsHhAMzzpx9axcYsxclqZUNVuayYOO6Scs9OMAFiAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdk9aelHrbady5scSiDf8dTVOAtFzUtzs3o+qTmCGmpkN/oV9YBxHG3okNzs+/fuI
	 phf1WKKap6HOpL/W9u6Bg2+gowCLeZE+dUmJioGU319h2rxJ87GIG2WPlXXBoHltqs
	 XslPC1gdqYbUnjqcPI75nxxqk19hkh6tbnLs9gEE=
Date: Mon, 8 Sep 2025 17:40:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 01/10] media: v4l: ctrls: add a control for
 flash/strobe duration
Message-ID: <20250908154024.GJ26062@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-1-d58d5a694afc@linux.dev>
 <20250907185512.GA4105@pendragon.ideasonboard.com>
 <3neurtcv24b3djg5p5q2snw7lmmgyzky4y7vyuuid7hvb7tepg@ypheu6ephunl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3neurtcv24b3djg5p5q2snw7lmmgyzky4y7vyuuid7hvb7tepg@ypheu6ephunl>

On Mon, Sep 08, 2025 at 04:41:30PM +0200, Richard Leitner wrote:
> On Sun, Sep 07, 2025 at 08:55:12PM +0200, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 05:05:06PM +0200, Richard Leitner wrote:
> > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > control, as the timeout defines a limit after which the flash is
> > > "forcefully" turned off again.
> > > 
> > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > of the flash/strobe pulse.
> > 
> > It took me a while to understand the difference between the
> > V4L2_CID_FLASH_TIMEOUT and V4L2_CID_FLASH_DURATION controls, as I
> > wondered how a device could implement different duration and timeout
> > values. Then I realized that the timeout control is meant for flash
> > controllers, while the duration control is meant for the source of the
> > flash controller's external hardware strobe signal, typically the camera
> > sensor. I'd like this to be more explicit, here and in the
> > documentation. Here's a proposal for an updated commit message:
> 
> Thanks for that proposal! Sorry for not writing clear documentation on
> this. I think I was too deep in the topic for too long and couldn't
> step back enough to write something that would make sense on a first read

No need to apologize, it happens all the time, everywhere, and to
everybody (myself included). Writing documentation is hard. That makes
reviews from people not familiar with the topic important.

> > ----
> > Add a V4L2_CID_FLASH_DURATION control to set the duration of a
> > flash/strobe pulse. This controls the length of the flash/strobe pulse
> > output by device (typically a camera sensor) and connected to the flash
> > controller. This is different to the V4L2_CID_FLASH_TIMEOUT control,
> > which is implemented by the flash controller and defines a limit after
> > which the flash is "forcefully" turned off again.
> > ----
> > 
> > This could probably be improved, but it's good enough for me for the
> > commit message.
> 
> Thanks. I will adopt it for the next version of the series.
> 
> > On a side note, I think we could have reused the V4L2_CID_FLASH_TIMEOUT
> > control for this purpose, even if the name isn't the best match, as the
> > two usages are implemented on different devices (flash controller vs.
> > camera sensor). We have no shortage of control ID space, so a separate
> > control ID is fine too, and probably clearer (as long as we document it
> > clearly).
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> > >  include/uapi/linux/v4l2-controls.h        | 1 +
> > >  2 files changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > index 1ea52011247accc51d0261f56eab1cf13c0624a0..f9ed7273a9f3eafe01c31b638e1c8d9fcf5424af 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >  	case V4L2_CID_FLASH_FAULT:		return "Faults";
> > >  	case V4L2_CID_FLASH_CHARGE:		return "Charge";
> > >  	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
> > > +	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
> > >  
> > >  	/* JPEG encoder controls */
> > >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index f836512e9debbc65d62a9fe04069b056be42f7b2..a5b7c382d77118eb7966385c5b22d5a89bc2b272 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1186,6 +1186,7 @@ enum v4l2_flash_strobe_source {
> > >  
> > >  #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
> > >  #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
> > > +#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
> > >  
> > >  
> > >  /* JPEG-class control IDs */

-- 
Regards,

Laurent Pinchart

