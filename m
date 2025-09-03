Return-Path: <linux-media+bounces-41639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6086B4185E
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0765E50B7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015B52E8B9B;
	Wed,  3 Sep 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wuRn9cO+"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9462D97A0
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887915; cv=none; b=pmERir4VCrQYETtYnjQChxOQ6V8bqthw3X0RUC3bi2DSWTzQHOCFljTCprxgB3wdO+IcpYCTpvEHK+QTgXEnzkRXy1hmZITAsucRwrN58fTjlQla+x6HIKUIZ2rxuDscrgoVH6hp4ZD5o5nr6eFuynxYSEQOc9huwJLWjCbT5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887915; c=relaxed/simple;
	bh=DjHRnWaffhiQNzrhs0HZOnYXvEtKg8njyQjCwtp8OGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKU4cvxF5JJzZOJ5sgFSWW+3X2wwYg7luX+a4Es0doPv2tlZG9lVjbM/p6tljRGLhhV6wo6fxFFzJM2oVpuw+fUVC+E+EezU5RMVQcAFool2seeCWAu7yKKkNlsKG9QPPdjL7jA5esx3wxRht0aiIYbP17yCIak2NZiNm78BFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wuRn9cO+; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 3 Sep 2025 10:24:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756887900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3QNaDkcDaoIdSNYl9mWixP4E6/AXP2pNYf1Shjkib4=;
	b=wuRn9cO+SrMffuemf5XcscKqtvggSOG+Z0tWNBrgYk5jTjf8jhDHZBR9PAe2FCwHcj55Pa
	jDyESf/GQl62TQzZuWmOJU8yiRgZbLWbBdOpxyr1KMn4fzfrANeBpWsv/99vboWhxpAOqA
	4fJSyIOUeIRjRrpqlI0P0ql+aILUcr8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 10/10] media: i2c: ov9282: dynamic flash_duration
 maximum
Message-ID: <xaejexfyvesftglbdyllzrz5nlibzcj3poddczgrqhrm7ugh3l@tysxjhoksvz7>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-10-d58d5a694afc@linux.dev>
 <aLYNQ4W8f55G_7HP@kekkonen.localdomain>
 <j4t7zyhf4zhn5t27os7yxi3chaux3m6bjlxe774crmdmzzm54f@dlk5s5ai7ehc>
 <aLfy4MOOgHu2s1m-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLfy4MOOgHu2s1m-@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Wed, Sep 03, 2025 at 10:48:48AM +0300, Sakari Ailus wrote:
> Hi Richard,
> 
> On Wed, Sep 03, 2025 at 09:13:35AM +0200, Richard Leitner wrote:
> > > > @@ -1491,8 +1510,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > >  	/* Flash/Strobe controls */
> > > >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> > > >  
> > > > -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > > -			  0, 13900, 1, 8);
> > > > +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> > > > +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> > > > +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > > +						   0, exposure_us,
> > > > +						   1, OV9282_FLASH_DURATION_DEFAULT);
> > > 
> > > Wrap this differently, please, e.g. after '='.
> > 
> > This is wrapped the same way as all other v4l2_ctrl_new_X() calls in
> > ov9282_init_controls(). Therefore I've chosen to do it this way here
> > too.
> > 
> > So if I'm going to change this one, IMHO all others should be changed
> > too (exp_ctrl, again_ctrl, vblank_ctrl, pixel_rate, link_freq_ctrl,
> > hblank_ctrl). Is this intended?
> > 
> > If so I'm wondering if this would be a suiteable approach?
> > 
> > ov9282->flash_duration =
> > 	v4l2_ctrl_new_std(ctrl_hdlr,
> > 			   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > 			   0, exposure_us,
> > 			   1, OV9282_FLASH_DURATION_DEFAULT);
> > 
> > It is fine for checkpatch, but introduces a newline for every ctrl and
> > tbh I'm not sure if it improves readability?
> 
> I don't think it's worse at least. You can also rewrap the rest of the
> lines:
> 
> 	ov9282->flash_duration =
> 		v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> 				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
> 				  OV9282_FLASH_DURATION_DEFAULT);
> 

Ok. Fine with me ;)

So I will adapt this patch and add a new patch which changes the wrapping
for all remaining v4l2_ctrl_new_X() calls in ov9282_init_controls() to the
series and send a v8? Or should I wait for feedback from Laurent for v8?

> > > >  	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > > >  				      V4L2_CID_FLASH_STROBE_SOURCE,
> > > > 
> > > 
> > > To me the set looks good but I wouldn't mind about having a bit more
> > > review.
> > 
> > Thanks for your continuous feedback! It improved the series a lot!
> > 
> > Is there anyhthing I can assists/help?
> 
> I asked Laurent if he could check this out, it'd be nice to get these to
> 6.18.

Nice. Thanks! Yeah, that would be nice, indeed :)

> 
> -- 
> Kind regards,
> 
> Sakari Ailus

regards;rl

