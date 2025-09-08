Return-Path: <linux-media+bounces-42023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D2B49105
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 16:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F407200A09
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6CF3081A7;
	Mon,  8 Sep 2025 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kIVx4nia"
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943497082A
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757340958; cv=none; b=WkU3ruV/5J5RNnU8nNUAp8rtITx8kVdixbNLFknPZDqhbxR0/8Sgvj4b/WKUf+H4KDX83tB8lR8scYZR0Czqhy9bwkmO966ddQn5Ll2ga0LD8627TnJCswVeArRgQdD7Eqak1CFfII/pPSGHw2t6roh3/61hnal8j2FB52rlf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757340958; c=relaxed/simple;
	bh=c18bqHtHLd49/U33Hm+QLoiMQvLoFeDb1158Y3RufR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnbKpf4/xYcCQMOK4Pv4deHPAgVL7O54L/wGEGzhZ6qZnscA/9BYZ2owfM81t3GiQpdLlgsyazhvnmhMKSESER9Gmgmd6iSFE/XvpSzYZUn3fhFRgZT3YEouFyYVPVmYOq4kjuWasp32ly/65aqTCx9AWjKI5LmEp/VRmKnRfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kIVx4nia; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 8 Sep 2025 16:15:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757340954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKqYPVwJIlTia7YGoo/RRLeAT0a8xetxvt+j1li7Od0=;
	b=kIVx4nia7Dmdo6eLv4i0++4Fmq0glqtURT3yTsBRc215mhV1QN96A8Ws0sDotD89JqgnZS
	KUbPf555DqEq2m2O9eytxnEMsmAri/OCAR5dfiFbRoGzsagYjE8sv3GlHQ1FBubZgwbYnr
	AXFbLXn8ELgbIerAYV5omGSc8gVKbrU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Lee Jones <lee@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 02/10] media: v4l2-flash: add support for flash/strobe
 duration
Message-ID: <2u6jncxsvlzbs5d6uhxslxnyvtidagspb3rfxsnhm3beb5saa5@ctq2cftpcwry>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-2-d58d5a694afc@linux.dev>
 <20250907190520.GB4105@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907190520.GB4105@pendragon.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Sun, Sep 07, 2025 at 09:05:20PM +0200, Laurent Pinchart wrote:
> Hi Richard,
> 
> Thank you for the patch.
> 
> On Mon, Sep 01, 2025 at 05:05:07PM +0200, Richard Leitner wrote:
> > Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
> > flash led class.
> 
> I don't think this is a good idea, based on the reasoning explained in
> the review of 01/10. If V4L2_CID_FLASH_DURATION is meant to indicate the
> duration of the external flash/strobe pulse signal, it should be
> implemented by the source of the signal, and for external strobe mode
> only. The flash controller, which receives the flash/strobe pulse,
> should implement the timeout control.

You're right. From that point of view it makes no sense to have this
functions in v4l2-flash-led-class.c. I'll move the implementation to
ov9282 for v9.

If I do so I guess the patch already merged by Lee needs reverting?
6a09ae828198 (leds: flash: Add support for flash/strobe duration, 2025-05-07)
Should the revert be included in this series then?

> 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > index 355595a0fefac72c2f6941a30fa430d37dbdccfe..875d56d7190592c1e5ab7acd617b76dcec8792da 100644
> > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > @@ -29,6 +29,7 @@ enum ctrl_init_data_id {
> >  	INDICATOR_INTENSITY,
> >  	FLASH_TIMEOUT,
> >  	STROBE_SOURCE,
> > +	FLASH_DURATION,
> >  	/*
> >  	 * Only above values are applicable to
> >  	 * the 'ctrls' array in the struct v4l2_flash.
> > @@ -298,6 +299,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
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
> > @@ -424,6 +431,14 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
> >  		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
> >  				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> >  	}
> > +
> > +	/* Init FLASH_DURATION ctrl data */
> > +	if (has_flash_op(fled_cdev, duration_set)) {
> > +		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
> > +		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
> > +		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
> > +		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
> > +	}
> >  }
> >  
> >  static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,
> > @@ -543,6 +558,16 @@ static int __sync_device_with_v4l2_controls(struct v4l2_flash *v4l2_flash)
> >  			return ret;
> >  	}
> >  
> > +	if (ctrls[FLASH_DURATION]) {
> > +		if (WARN_ON_ONCE(!fled_cdev))
> > +			return -EINVAL;
> > +
> > +		ret = led_set_flash_duration(fled_cdev,
> > +					     ctrls[FLASH_DURATION]->val);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >  	/*
> >  	 * For some hardware arrangements setting strobe source may affect
> >  	 * torch mode. Synchronize strobe source setting only if not in torch
> 
> -- 
> Regards,
> 
> Laurent Pinchart

thanks again for your review!

regards;rl

