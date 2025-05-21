Return-Path: <linux-media+bounces-33032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E893ABF70D
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 16:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51A689E651D
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB1A18B492;
	Wed, 21 May 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dCyLIY2o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514A518FDBE
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836258; cv=none; b=cHHpjN3AEY6RbYqez+yrnS3S1X0FDyOjy6BDX6WjjNAb2u8veP+BMqGdN/ZMIpktdz0Q16ZNu477uLrrJYpSln4xrEvj7A94qjxvU/CmqSQMdg8M0F0QHBBszRtWwCPxDW3mQqlxao8Db8qVXmLTcE5OxWMtZE0mLCBpYVXJhNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836258; c=relaxed/simple;
	bh=pJCChIdYPmV8Y8I6TxXcKEu87kmLmAblkQhuBNTT6ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oal50sLbqc3LQiW1BHIK0/e3PJu8gLAoaNPWXmrdXCXp56Rz7RdDYPLXdLcAovQBfkOi5OHBMSX4bLMGTNiyWYliDv3pUdiHpUn8noyvRNIm/vWt0lZxvqciQpJqedIo8Hd890k/RHaW3ZINwwibFW9gZRi7Tv+pI2wA3VVbWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dCyLIY2o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 143DF6B5;
	Wed, 21 May 2025 16:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747836227;
	bh=pJCChIdYPmV8Y8I6TxXcKEu87kmLmAblkQhuBNTT6ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCyLIY2obwiLIaA4LvsV61MsrbPq4D1Ft9DP3G4BQAWvnDsZXGQOvw7fgj1T2uzH7
	 Ul8WVNchLa357d54EF6HXDCYWw2/dDBDT+4iT/pg8P9aSeQ6rJ+3ccGWRM9kprb+1r
	 1Qqs8LqnrFa4BYaZYZNr0lCm1euyu0r2MHGP8nY8=
Date: Wed, 21 May 2025 16:04:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 05/23] media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN
 for gain control
Message-ID: <20250521140402.GL12514@pendragon.ideasonboard.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-6-hdegoede@redhat.com>
 <174751615300.335894.3402272890581119176@ping.linuxembedded.co.uk>
 <174756137675.4012029.11818241234579920414@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174756137675.4012029.11818241234579920414@ping.linuxembedded.co.uk>

On Sun, May 18, 2025 at 10:42:56AM +0100, Kieran Bingham wrote:
> Hi Hans,
> 
> +Cc: libcamera-devel
> 
> Digging in here I found this part interesting (i.e. perhaps we need to
> clarify the expected behavours better)
> 
> Quoting Kieran Bingham (2025-05-17 22:09:13)
> > Quoting Hans de Goede (2025-05-17 12:40:48)
> > > Use V4L2_CID_ANALOGUE_GAIN for gain control, as expected by userspace.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > index ee039f3be4da..756e56f639b7 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > @@ -289,7 +289,7 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
> > >                 ret = cci_write(sensor->regmap, GC0310_AEC_PK_EXPO_REG,
> > >                                 ctrl->val, NULL);
> > >                 break;
> > > -       case V4L2_CID_GAIN:
> > > +       case V4L2_CID_ANALOGUE_GAIN:
> > >                 ret = gc0310_gain_set(sensor, ctrl->val);
> > >                 break;
> > >         default:
> > > @@ -533,7 +533,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
> > >  
> > >         /* 32 steps at base gain 1 + 64 half steps at base gain 2 */
> > 
> > sounds like a curious gain model...
> > 
> > Will be interesting when we get the sensor calibration tools up and
> > running to plot this. (Or is there already a public datasheet
> > documenting this?)
> > 
> > Is there a split here between analogue gain and digital gain ? Or is it
> > all expected to be 'analogue gain' ?
> 
> I looked deeper, and this does seem to be a split between analogue and
> digital gain. It also seems like this control might be doing additional
> calculations which would then have to be accounted for as part of the
> gain model in libcamera, so then instead of 'sensor specific' it would
> be 'this linux sensor driver specific' - so maybe the gain functions
> should be simplified more.
> 
> Adding in libcamera-devel - because I think we need to figure out what's
> best for handling this (overall for all sensors with A+D gain)
> 
> There are some sensors I've seen where the digital gain can only be
> applied 'on top' of the analogue gain, and so it does act like a single
> control ...

I've seen other sensors (in particular the AR0830) that also combine
analogue and digital gains in a single register. The analogue gain is
typically quite coarse in that case, and the digital gain is used for
fine adjustments. In the ar0830 driver I'm writing, I've split the two
components in two separate controls.

> But we probably want to be able to distinguish between analogue gain and
> digital gain in libcamera / userspace.
> 
> However, even if we distinguish ... I suspect there are cases where if
> we need more gain than just the analogue gain can provide - adding the
> large steps at the sensor - and then only applying very small amounts of
> fine-grain digital gain on an ISP would make things simpler or easier
> overall.
> 
> So somehow I think we need to figure out and correctly document and
> manage the splits between analogue and digital gains, and that will
> likely have to have a corresponding mapping in either the camera sensor
> helpers or the tuning files in some part.
> 
> > >         sensor->ctrls.gain =
> > > -               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1, 31);
> > > +               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0, 95, 1, 31);
> > >  
> > >         return hdl->error;
> > >  }

-- 
Regards,

Laurent Pinchart

