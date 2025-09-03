Return-Path: <linux-media+bounces-41644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1AEB41962
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDD25E0A45
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8559F2F0C7A;
	Wed,  3 Sep 2025 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2gdwhgB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2FA2DECCD;
	Wed,  3 Sep 2025 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889713; cv=none; b=ZbDAs6v/NNaFs0eovuHcG686YslnZ+4QS0tWrC/iJT09vhVZqA5aq/RDGCRV7ut+6gRk0agmi0mCjYOj28w9nQXM7Azg7ljDgMbpj+KnZbL8De0i0xvDi3yeivpF+zwmLG3sUxqHjOSiMOdDA8q+EIKXoULSdCuj7VTWFUlAsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889713; c=relaxed/simple;
	bh=QJZYo7ZQ9g2xKBpzXbwpfs2kloqCuHIgsgfUp5oSlA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3QnuC1BW5I9Ow1XrpA3zHuyrk54SAa/IU34FYo8Jv2ImuZrB8WXsljPiEr+0TCmSxIobIyjjaFN4XB4ctTPipZKOyYYdSLkhL8OclsxWfLadoS/2qs/ZG6adxsds+Zo+epPgHGQ7JnyF2mB09krbbFwS2KKBI37Z8w5snHmXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2gdwhgB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756889712; x=1788425712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QJZYo7ZQ9g2xKBpzXbwpfs2kloqCuHIgsgfUp5oSlA4=;
  b=b2gdwhgBfWzQY3sYPSN6E5dVZ5NqFYRgVExvYkdxO3aH+4JnGbraKUU7
   lzlEZhGeM9cfRyI/vFsdZrh4z7YLgIkTTkw5AklFDhfOR90L1IST209C0
   FCqao5BqKqtdOc7+1ECyy7E/MY08QaAH8UTamOoJLdm5U51KkZi2sLIq9
   xhVQGhXNYw/lu3ZNDS9Ya8sx4uWjQeAPIf4RLJ4uxZI1HPGxNh4193/Xv
   ffRNLk/ShMNn730qxX13cq6fidLGtSGKLrlu4i7DcLuoGDCXV+9bJJDsG
   bgbTz4bAg7yGEMTFVQhhKdglx71hDeg8RW0gjZRqmh8xEmsO8swwi4CGD
   g==;
X-CSE-ConnectionGUID: W+GC0lEuTCmS5VhWt+O7qg==
X-CSE-MsgGUID: mUgNOlp3Qn20u2SpG3LAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81781871"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81781871"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 01:55:11 -0700
X-CSE-ConnectionGUID: ZaK051PcQx+vKyGQbEEBHg==
X-CSE-MsgGUID: kgai7r3VSHer/FCjZGRyjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="195165041"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 01:55:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D316611FC49;
	Wed, 03 Sep 2025 11:55:02 +0300 (EEST)
Date: Wed, 3 Sep 2025 11:55:02 +0300
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
Message-ID: <aLgCZi6ET0PvC95q@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-10-d58d5a694afc@linux.dev>
 <aLYNQ4W8f55G_7HP@kekkonen.localdomain>
 <j4t7zyhf4zhn5t27os7yxi3chaux3m6bjlxe774crmdmzzm54f@dlk5s5ai7ehc>
 <aLfy4MOOgHu2s1m-@kekkonen.localdomain>
 <xaejexfyvesftglbdyllzrz5nlibzcj3poddczgrqhrm7ugh3l@tysxjhoksvz7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xaejexfyvesftglbdyllzrz5nlibzcj3poddczgrqhrm7ugh3l@tysxjhoksvz7>

Hi Richard,

On Wed, Sep 03, 2025 at 10:24:46AM +0200, Richard Leitner wrote:
> Hi Sakari,
> 
> On Wed, Sep 03, 2025 at 10:48:48AM +0300, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > On Wed, Sep 03, 2025 at 09:13:35AM +0200, Richard Leitner wrote:
> > > > > @@ -1491,8 +1510,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > >  	/* Flash/Strobe controls */
> > > > >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> > > > >  
> > > > > -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > > > -			  0, 13900, 1, 8);
> > > > > +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> > > > > +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > > > +						   0, exposure_us,
> > > > > +						   1, OV9282_FLASH_DURATION_DEFAULT);
> > > > 
> > > > Wrap this differently, please, e.g. after '='.
> > > 
> > > This is wrapped the same way as all other v4l2_ctrl_new_X() calls in
> > > ov9282_init_controls(). Therefore I've chosen to do it this way here
> > > too.
> > > 
> > > So if I'm going to change this one, IMHO all others should be changed
> > > too (exp_ctrl, again_ctrl, vblank_ctrl, pixel_rate, link_freq_ctrl,
> > > hblank_ctrl). Is this intended?
> > > 
> > > If so I'm wondering if this would be a suiteable approach?
> > > 
> > > ov9282->flash_duration =
> > > 	v4l2_ctrl_new_std(ctrl_hdlr,
> > > 			   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > 			   0, exposure_us,
> > > 			   1, OV9282_FLASH_DURATION_DEFAULT);
> > > 
> > > It is fine for checkpatch, but introduces a newline for every ctrl and
> > > tbh I'm not sure if it improves readability?
> > 
> > I don't think it's worse at least. You can also rewrap the rest of the
> > lines:
> > 
> > 	ov9282->flash_duration =
> > 		v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> > 				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
> > 				  OV9282_FLASH_DURATION_DEFAULT);
> > 
> 
> Ok. Fine with me ;)
> 
> So I will adapt this patch and add a new patch which changes the wrapping
> for all remaining v4l2_ctrl_new_X() calls in ov9282_init_controls() to the
> series and send a v8? Or should I wait for feedback from Laurent for v8?

Let's wait for Laurent to review this first. The changes I asked for are
minor.

-- 
Sakari Ailus

