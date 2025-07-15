Return-Path: <linux-media+bounces-37801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321AB06622
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B647B4A82AE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AC92BE634;
	Tue, 15 Jul 2025 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qq5eGAiH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFAC69D2B
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604879; cv=none; b=mSeBD042Lu9juNeuH4wVtw+wbinxip62MJKzHq/3AEzPux1p53aXHQ11lNCjxWSULu7ojoXLIYMuY2fQXFSafrKPNusBQVays8hlHire1rX/DbdBUvGtZT7vfyWseseXR+NjtAILFcL4zB5INQwqgv+x78f6bu/wN2Z5UnVHs3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604879; c=relaxed/simple;
	bh=DkD5HKl+V7DcKwm2k5bAznbk5kU+qsr6SzbL6YNEXZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGVZgevrHQ6YaJL17Lgao4qPLzrZblFT7QbYpE3elUxZDtoOOWN6/SE4ctHLuumQZMizGbPT/qR3azgjraoUc0pM+kvcfD90rmtQj9Zqoye8AqhTLbmIbdFOZcE/fEHiP9dm2NZv+Rmom69UX4hOB8dkFMvG4x6OfRCKqulUYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qq5eGAiH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D88F478E;
	Tue, 15 Jul 2025 20:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752604843;
	bh=DkD5HKl+V7DcKwm2k5bAznbk5kU+qsr6SzbL6YNEXZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qq5eGAiHsaoNLT+lpDsoKx2YB0bd7JVLiovnJkXuJSROFMiM+tAl9apZbhhPU27iK
	 MptiB7I5yc9n2J/yRetpDQX776dAW5z3BLq+XS2sjs2n4hKNpi3GcYDqf7Uv2GDn1C
	 n1GGSqWtntR7j9YnazaDFTgXt/vCCGV3snWK9i9M=
Date: Tue, 15 Jul 2025 21:41:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 31/72] media: i2c: og01a1b: Use V4L2 sensor clock helper
Message-ID: <20250715184113.GL20231@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-32-laurent.pinchart@ideasonboard.com>
 <u22wgu2f3cgtcglkew5puby74u4v5lcljp5up4odas6dq7fvdd@yb3esynjm5kh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <u22wgu2f3cgtcglkew5puby74u4v5lcljp5up4odas6dq7fvdd@yb3esynjm5kh>

On Tue, Jul 15, 2025 at 01:44:47PM +0200, Mehdi Djait wrote:
> Hi Laurent,
> 
> Thank you for the patch!
> 
> On Thu, Jul 10, 2025 at 08:47:27PM +0300, Laurent Pinchart wrote:
> 
> [..]
> 
> > -	og01a1b->xvclk = devm_clk_get_optional(og01a1b->dev, NULL);
> > +	og01a1b->xvclk = devm_v4l2_sensor_clk_get(og01a1b->dev, NULL);
> >  	if (IS_ERR(og01a1b->xvclk)) {
> >  		ret = PTR_ERR(og01a1b->xvclk);
> >  		dev_err(og01a1b->dev, "failed to get xvclk clock: %d\n", ret);
> >  		return ret;
> >  	}
> 
> while at it, you can change this driver to
>   	return dev_err_probe(og01a1b->dev, PTR_ERR(og01a1b->xvclk),
> 			     "failed to get xvclk clock\n");

I'll do that in v2.

> the only driver that remains weird when handling an err in this series is:
> drivers/media/i2c/s5k5baf.c

Indeed. I think I can clean that up too, devm_v4l2_sensor_clk_get()
should return -EPROBE_DEFER in the cases that are meaningful for this
driver.

> Feel free to change it or leave it as is.
> 
> >  
> > +	freq = clk_get_rate(og01a1b->xvclk);
> > +	if (freq != OG01A1B_MCLK)
> > +		return dev_err_probe(og01a1b->dev, -EINVAL,
> > +				     "external clock %lu is not supported",
> > +				     freq);
> > +

-- 
Regards,

Laurent Pinchart

