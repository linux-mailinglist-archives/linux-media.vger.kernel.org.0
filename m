Return-Path: <linux-media+bounces-42030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E61EB493C5
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 17:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B02C204D4A
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19A630F816;
	Mon,  8 Sep 2025 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MuV7tvoA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC930DD02;
	Mon,  8 Sep 2025 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345968; cv=none; b=jEv5K52DRtEJobIetJtYTb+OxI+e0/YK1bTi3m9LuhZ9RD0qz/dJkKxQNoPtUZji/9ZMl2j9wAxtWdUl7EUjwkOYGpH2eYLh/NWJBH6ajhXb5DaDOsnnAdkCrEiGS9Gwcs7FqkMjzNw+HzWqLgrsA5yRhCWWhGapgv66KTR8IJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345968; c=relaxed/simple;
	bh=/ylPFLYK/yvlWwa7TA4cs83+xAOWP4nLel4h9Qssd+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejPYCPTiMito0zF9W091efIqvDun22DvAGTDcMDw6FhbImHC+l8X0AFjBCmbcLkjOoQ3Yx1z3VUHSkSiBSfpg1Be7Dxeb+gSCJ31lc+th5KqOCCg/LBkgg32ZElcd6xOOVHSU9GvR6HjT48UliYKgZ2ue0RsxspIzVcQ8Bo9aKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MuV7tvoA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-99-126-nat.elisa-mobile.fi [85.76.99.126])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6361BC71;
	Mon,  8 Sep 2025 17:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757345891;
	bh=/ylPFLYK/yvlWwa7TA4cs83+xAOWP4nLel4h9Qssd+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MuV7tvoAgwnHEY1PECWL5Pkq2SbWYuo6zvYuKQKFcCX/Q8c7KbpUYdYTCLp746RFI
	 7nsdxXSSUld+usQlItDrYPiifgknGGFdHvWnydFAMPMf/wCZ9fAKIESnvfnaq8Ptk4
	 aDngq/DoaOQ/+CCg4SybWCwk6tD3i2zWzrKXT3b0=
Date: Mon, 8 Sep 2025 17:39:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 02/10] media: v4l2-flash: add support for flash/strobe
 duration
Message-ID: <20250908153219.GI26062@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-2-d58d5a694afc@linux.dev>
 <20250907190520.GB4105@pendragon.ideasonboard.com>
 <2u6jncxsvlzbs5d6uhxslxnyvtidagspb3rfxsnhm3beb5saa5@ctq2cftpcwry>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2u6jncxsvlzbs5d6uhxslxnyvtidagspb3rfxsnhm3beb5saa5@ctq2cftpcwry>

On Mon, Sep 08, 2025 at 04:15:48PM +0200, Richard Leitner wrote:
> On Sun, Sep 07, 2025 at 09:05:20PM +0200, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 05:05:07PM +0200, Richard Leitner wrote:
> > > Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
> > > flash led class.
> > 
> > I don't think this is a good idea, based on the reasoning explained in
> > the review of 01/10. If V4L2_CID_FLASH_DURATION is meant to indicate the
> > duration of the external flash/strobe pulse signal, it should be
> > implemented by the source of the signal, and for external strobe mode
> > only. The flash controller, which receives the flash/strobe pulse,
> > should implement the timeout control.
> 
> You're right. From that point of view it makes no sense to have this
> functions in v4l2-flash-led-class.c. I'll move the implementation to
> ov9282 for v9.
> 
> If I do so I guess the patch already merged by Lee needs reverting?
> 6a09ae828198 (leds: flash: Add support for flash/strobe duration, 2025-05-07)
> Should the revert be included in this series then?

The revert can be merged separately. Let's first finalize this series,
and then send the revert, just in case over changes to the LED API may
be needed.

> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > index 355595a0fefac72c2f6941a30fa430d37dbdccfe..875d56d7190592c1e5ab7acd617b76dcec8792da 100644
> > > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > @@ -29,6 +29,7 @@ enum ctrl_init_data_id {
> > >  	INDICATOR_INTENSITY,
> > >  	FLASH_TIMEOUT,
> > >  	STROBE_SOURCE,
> > > +	FLASH_DURATION,
> > >  	/*
> > >  	 * Only above values are applicable to
> > >  	 * the 'ctrls' array in the struct v4l2_flash.
> > > @@ -298,6 +299,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> > >  		 * microamperes for flash intensity units.
> > >  		 */
> > >  		return led_set_flash_brightness(fled_cdev, c->val);
> > > +	case V4L2_CID_FLASH_DURATION:
> > > +		/*
> > > +		 * No conversion is needed as LED Flash class also uses
> > > +		 * microseconds for flash duration units.
> > > +		 */
> > > +		return led_set_flash_duration(fled_cdev, c->val);
> > >  	}
> > >  
> > >  	return -EINVAL;
> > > @@ -424,6 +431,14 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
> > >  		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
> > >  				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> > >  	}
> > > +
> > > +	/* Init FLASH_DURATION ctrl data */
> > > +	if (has_flash_op(fled_cdev, duration_set)) {
> > > +		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
> > > +		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
> > > +		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
> > > +		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
> > > +	}
> > >  }
> > >  
> > >  static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,
> > > @@ -543,6 +558,16 @@ static int __sync_device_with_v4l2_controls(struct v4l2_flash *v4l2_flash)
> > >  			return ret;
> > >  	}
> > >  
> > > +	if (ctrls[FLASH_DURATION]) {
> > > +		if (WARN_ON_ONCE(!fled_cdev))
> > > +			return -EINVAL;
> > > +
> > > +		ret = led_set_flash_duration(fled_cdev,
> > > +					     ctrls[FLASH_DURATION]->val);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > >  	/*
> > >  	 * For some hardware arrangements setting strobe source may affect
> > >  	 * torch mode. Synchronize strobe source setting only if not in torch

-- 
Regards,

Laurent Pinchart

