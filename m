Return-Path: <linux-media+bounces-41636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CAB4172D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 731783B2EB2
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 07:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469372DF154;
	Wed,  3 Sep 2025 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFYIfQ6F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D762D8387;
	Wed,  3 Sep 2025 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885736; cv=none; b=tXgkLS0y9RJ+E2vTPRKaIrkoJ5493obvEppqXg/Gvgi82Qp6I17TSERV9obRKeZN4xkH2mOBrs+eZ3W4lUfbeO8BDAG3OFtMC8kyRNTaSr/7vC0qRj6bRkZSbq6CSKJBttzHwjkS0JXgHKk+rkJeT/2BHuG7h3BhW1Optn6dRNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885736; c=relaxed/simple;
	bh=/vAyQI/41Rz5KwRZEJ3cUsj9TI+/S+ibjVP2t/fY8pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkxQ39o8yPaT6uxWXmnJhQTHL5QeLhF5QxI2jfFp69ILkC5WPYccBis1urvz1r1MN8K0un/wO5wxXFpLIcpdxXx6XCpvoDfMMTxcdrSHiLgKSOWyIXikPS2DxYm2dGFHhFUgqwmLAs/ZlYLARp31aqfSK3syMGchErB8yo5VSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFYIfQ6F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756885735; x=1788421735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/vAyQI/41Rz5KwRZEJ3cUsj9TI+/S+ibjVP2t/fY8pU=;
  b=oFYIfQ6FmTg9/ctd9MqM7571xqHkPr2HU5zvLwX0dP1oYQIWxUTDtnPZ
   HiYFROegu/jKOB2vJbv1hUq05qelYsYJQEKKKWifI75ad6rG1VXnhcWrH
   cyb488iLYua14WEjX5Z9fncIHKZe9K3PCjGCksmAT/TITKswmSzt7qfA6
   iJ0xbFInUy6/IG6g83sdOmoo5cvRvjGrNKTB6OIoH/Db+KZNwL2Orgy2i
   XCQvBlvfL7HSLOcGdrH1sPlNMDKHgnNrjlK+zl+Uq43c2Cxrqw+/AVqIY
   qjGWT3X6c2XDoo65Wepx/ch0MLpuL1LuvYzf5g41iZe6BHHwCzJLRi6u8
   w==;
X-CSE-ConnectionGUID: smj6I1+ZR0m7tt/Ny9jGbQ==
X-CSE-MsgGUID: EBZVObUdQmSxqC4l/Sijng==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58405849"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58405849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 00:48:54 -0700
X-CSE-ConnectionGUID: EAHsTJkKTbG7ibMhD4OVNw==
X-CSE-MsgGUID: RoVdC3gkRRGO/JoC7LT6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="170784201"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 00:48:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9EDDD11F914;
	Wed, 03 Sep 2025 10:48:48 +0300 (EEST)
Date: Wed, 3 Sep 2025 10:48:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 10/10] media: i2c: ov9282: dynamic flash_duration
 maximum
Message-ID: <aLfy4MOOgHu2s1m-@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-10-d58d5a694afc@linux.dev>
 <aLYNQ4W8f55G_7HP@kekkonen.localdomain>
 <j4t7zyhf4zhn5t27os7yxi3chaux3m6bjlxe774crmdmzzm54f@dlk5s5ai7ehc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j4t7zyhf4zhn5t27os7yxi3chaux3m6bjlxe774crmdmzzm54f@dlk5s5ai7ehc>

Hi Richard,

On Wed, Sep 03, 2025 at 09:13:35AM +0200, Richard Leitner wrote:
> > > @@ -1491,8 +1510,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > >  	/* Flash/Strobe controls */
> > >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> > >  
> > > -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > -			  0, 13900, 1, 8);
> > > +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> > > +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> > > +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > +						   0, exposure_us,
> > > +						   1, OV9282_FLASH_DURATION_DEFAULT);
> > 
> > Wrap this differently, please, e.g. after '='.
> 
> This is wrapped the same way as all other v4l2_ctrl_new_X() calls in
> ov9282_init_controls(). Therefore I've chosen to do it this way here
> too.
> 
> So if I'm going to change this one, IMHO all others should be changed
> too (exp_ctrl, again_ctrl, vblank_ctrl, pixel_rate, link_freq_ctrl,
> hblank_ctrl). Is this intended?
> 
> If so I'm wondering if this would be a suiteable approach?
> 
> ov9282->flash_duration =
> 	v4l2_ctrl_new_std(ctrl_hdlr,
> 			   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> 			   0, exposure_us,
> 			   1, OV9282_FLASH_DURATION_DEFAULT);
> 
> It is fine for checkpatch, but introduces a newline for every ctrl and
> tbh I'm not sure if it improves readability?

I don't think it's worse at least. You can also rewrap the rest of the
lines:

	ov9282->flash_duration =
		v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
				  OV9282_FLASH_DURATION_DEFAULT);

> > >  	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > >  				      V4L2_CID_FLASH_STROBE_SOURCE,
> > > 
> > 
> > To me the set looks good but I wouldn't mind about having a bit more
> > review.
> 
> Thanks for your continuous feedback! It improved the series a lot!
> 
> Is there anyhthing I can assists/help?

I asked Laurent if he could check this out, it'd be nice to get these to
6.18.

-- 
Kind regards,

Sakari Ailus

