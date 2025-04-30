Return-Path: <linux-media+bounces-31388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BADAA459E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E1379A495B
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28915214A6E;
	Wed, 30 Apr 2025 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X9455uFD"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC88216E23
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002288; cv=none; b=Hg1ZaEpWONVrtgRgGQKpYDC34w8YXh0nM/gSUkgdTpVj48xiSsIlGNVZB294vWzKbF1ZPOEo8JISTHo/LH2MUFw0rQpGg6bz5wUSaniqVspjbUW60+G7VCr/sA1Lun8W7n1FjFdxcEdMe2Ho9TdHl+PzXsonrX2+LXEx5GCZg8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002288; c=relaxed/simple;
	bh=3hJIWEz/tMEntYl2Z5rZWF+3utBSrdD+a8jANC9Y5wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWgXSAmE8wZ3qV01sFRqznA50xbFO3jZTOfBRBjBFpDhE3cDHl6zqbFq8dXLP6XM+7eh+M5Avt7PVS9QPuQ2N90ODrJhp7Zgv0vz9+1EZk7CdBQtn6rTbCuPAuGA8KSjT1qkJV7eRZWgV446tMTZ0fv0azAqfNSZQZu7uda7gas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X9455uFD; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 30 Apr 2025 10:37:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746002271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GmmLAoenAXMvd5HQQrNyQLm1JEq196aDUFttDU9EE+g=;
	b=X9455uFDY33xHDfWnIc84P6y5DA/VD7Gj+WGa/ZqPdI53fH78o6VSpOEQtmNF3EeOkTNiJ
	Wgj6GfIzjZAZzw/EPbdVCO6ZLO0hTHHdWEsWTW61grZytx5jR/pFyFs8apSqCgLfBSX2x8
	LaiyjuXYOFR3ECPkr54ahsidskO/20E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 3/9] media: v4l2-flash: add support for flash/strobe
 duration
Message-ID: <zpmfhi6fzg3zhwifpi2kmstn4soex4fvg5jhha2me73r76bhgo@j2bfwdza23xs>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-3-2105ce179952@linux.dev>
 <aBHeIBbFRkZ4P82E@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHeIBbFRkZ4P82E@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks for your quick feedback!

On Wed, Apr 30, 2025 at 08:24:00AM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Tue, Apr 29, 2025 at 02:59:08PM +0200, Richard Leitner wrote:
> > Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
> > flash led class.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > index 355595a0fefac72c2f6941a30fa430d37dbdccfe..963b549480f6eb3b9eb0d80696a764de7ffcc1a2 100644
> > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > @@ -298,6 +298,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> >  		 * microamperes for flash intensity units.
> >  		 */
> >  		return led_set_flash_brightness(fled_cdev, c->val);
> > +	case V4L2_CID_FLASH_DURATION:
> > +		/*
> > +		 * No conversion is needed as LED Flash class also uses
> > +		 * microseconds for flash duration units.
> > +		 */
> > +		return led_set_flash_duration(fled_cdev, c->val);
> >  	}
> >  
> >  	return -EINVAL;
> > @@ -424,6 +430,13 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
> >  		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
> >  				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> >  	}
> > +
> > +	/* Init FLASH_DURATION ctrl data */
> > +	if (has_flash_op(fled_cdev, timeout_set)) {
> > +		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
> > +		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
> > +		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
> > +		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
> 
> Has this been compile tested? :-)

Oooh... Damn. That's embarrasing. SORRY! There should have been at least
another '}' in this patch.... Seems I somehow messed up my last rebase.

Will fix that in v4. Sorry again :-/

> 
> >  }
> >  
> >  static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

regards;rl

