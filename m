Return-Path: <linux-media+bounces-22135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131589DA406
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 922C6B2166B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91E218C936;
	Wed, 27 Nov 2024 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ePtpbDGd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E2C1114;
	Wed, 27 Nov 2024 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696499; cv=none; b=OxUE8TpoJIK6gKbZoYm6/UOWtfSwApdhi7qT39n2nZxG/bB13Y4Y0R2cGvLOQNzUesqY57jbGsqN8qrWqwleRejoOUk8s8Zg6PhUXAFlrs0LldEt8n/IQu1l2RPLxcAIZl8IEtGNuF9UmCaRWCkz8ZlpJ/lgESaCt64MpMLePMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696499; c=relaxed/simple;
	bh=Ze4jFSr20glq2KKoEzubGfLgmXPognZt9fc7rqvDDaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBq9WDon5MGo9zXqhTNRCBNhQpS1v2RztySelBZO+U6cgbAdvrjj26vn0cGAK8THvK16I4zt3uxrlp9+egY9cuf6/qQT3OFXjzybqUdzGSkwE55W3Oe629ga2ecZbX+9qlsyJUHLHiKH/aZyvmlTD5Vb8YMuEEwYU3qzE8IOk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ePtpbDGd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E3B978C;
	Wed, 27 Nov 2024 09:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732696472;
	bh=Ze4jFSr20glq2KKoEzubGfLgmXPognZt9fc7rqvDDaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePtpbDGd5oHd9r6b/JsfGFZvqas1LznKEs6X1vKa1qcmKnQLQp3TQD8JtXcGebyCh
	 6o3XIuysKyPIYxmn1GTLSr+fwiYw6RMEvsl3JQh0n40EmDScnr2L32RYx9VapGSepm
	 w/Z67XwZhBCAhKVX2na5J+dCBSoNjBaGzEmRIy+o=
Date: Wed, 27 Nov 2024 10:34:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: uvcvideo: Support partial control reads
Message-ID: <20241127083444.GV5461@pendragon.ideasonboard.com>
References: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
 <20241120-uvc-readless-v4-1-4672dbef3d46@chromium.org>
 <20241126180616.GL5461@pendragon.ideasonboard.com>
 <CANiDSCuZkeV7jTVbNhnty8bMszUkb6g9czJfwDvRUFMhNdFp2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuZkeV7jTVbNhnty8bMszUkb6g9czJfwDvRUFMhNdFp2Q@mail.gmail.com>

On Tue, Nov 26, 2024 at 07:12:53PM +0100, Ricardo Ribalda wrote:
> On Tue, 26 Nov 2024 at 19:06, Laurent Pinchart wrote:
> > On Wed, Nov 20, 2024 at 03:26:19PM +0000, Ricardo Ribalda wrote:
> > > Some cameras, like the ELMO MX-P3, do not return all the bytes
> > > requested from a control if it can fit in less bytes.
> > > Eg: Returning 0xab instead of 0x00ab.
> > > usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> > >
> > > Extend the returned value from the camera and return it.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index cd9c29532fb0..482c4ceceaac 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -79,6 +79,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > >       if (likely(ret == size))
> > >               return 0;
> > >
> > > +     /*
> > > +      * In UVC the data is usually represented in little-endian.
> >
> > I had a comment about this in the previous version, did you ignore it on
> > purpose because you disagreed, or was it an oversight ?
> 
> I rephrased the comment. I added "usually" to make it clear that it
> might not be the case for all the data types. Like composed or xu.

Ah, that's what you meant by "usually". I read it as "usually in
little-endian, but could be big-endian too", which confused me.

Data types that are not integers will not work nicely with the
workaround below. How do you envision that being handled ? Do you
consider that the device will return too few bytes only for integer data
types, or that affected devices don't have controls that use compound
data types ? I don't see what else we could do so I'd be fine with such
a heuristic for this workaround, but it needs to be clearly explained.

> I also r/package/packet/
> 
> Did I miss another comment?
> 
> > > +      * Some devices return shorter USB control packets that expected if the
> > > +      * returned value can fit in less bytes. Zero all the bytes that the
> > > +      * device have not written.
> >
> > s/have/has/
> >
> > And if you meant to start a new paragraph here, a blank line is missing.
> > Otherwise, no need to break the line before 80 columns.
> 
> The patch is already in the uvc tree. How do you want to handle this?

The branch shared between Hans and me can be rebased, it's a staging
area.

> > > +      * We exclude UVC_GET_INFO from the quirk. UVC_GET_LEN does not need to
> > > +      * be excluded because its size is always 1.
> > > +      */
> > > +     if (ret > 0 && query != UVC_GET_INFO) {
> > > +             memset(data + ret, 0, size - ret);
> > > +             dev_warn_once(&dev->udev->dev,
> > > +                           "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> > > +                           uvc_query_name(query), cs, unit, ret, size);
> > > +             return 0;
> > > +     }
> > > +
> > >       if (ret != -EPIPE) {
> > >               dev_err(&dev->udev->dev,
> > >                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",

-- 
Regards,

Laurent Pinchart

