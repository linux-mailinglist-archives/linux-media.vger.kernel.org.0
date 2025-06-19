Return-Path: <linux-media+bounces-35261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B641AE02AD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 167C73AFEF0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0342206BC;
	Thu, 19 Jun 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgqDQhEH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293631E2312
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329046; cv=none; b=jYgACLusu57V0Gm3siHIHCqXWjvDQDYoJn2fNqO25d0bllpDFkA6JFDxf4EhEDNBWh1ofotLC1XqsOwYXqYe9M2xlvCs+QvPCRe9GY/5MsTDpjwL9WxJM4K0yGR6c6JsNEn3d4sYbUss/UU1r0ZgCnd3uT4hAny0gyVIdc6Knbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329046; c=relaxed/simple;
	bh=oNedHNNxlYhr6J0qKKawIRuRZov9i8ORdG82jLP9m5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW2qdKatom7EIc3YisqD6MYPYyBjg64kBB3mV3NhL7n//g6eKBRdqwYnksCaervV91DjXPvvUTWUUdXYcBIPNdHTMuL46SjGtLqEA+ug38RNKZr+mh6Hv0C1YfYN8OV5H8wRRXiHuXghakdBS6roxoU8GMLfz8C/fhTFRCXb7gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgqDQhEH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750329045; x=1781865045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNedHNNxlYhr6J0qKKawIRuRZov9i8ORdG82jLP9m5M=;
  b=WgqDQhEHcDwNW97G5oSTgBeHwz+eB4FjTM6YZU/+NcofVlfdUIrPIY4N
   q5d71poEEzzu6NNZQcdqlnUdJti6usHNSpOc4rT4sRQqUln+9qwUY05L6
   4hcVQji4Zv0my9a65dzeFvnJDr7UWTQ/qgkng/dt+kMJn2SAJCRHLddg8
   C3kX8rSQW5+jpN8f3nqzdynSAZjuoiRDtm3VI6+quuegc+wpsoKmASYIy
   4EZmyxwTOnOvy0AiUp40JADqOe0ULvfGKPsmBYTCDLaaQZzwuLml2FzLC
   slyceWC4J+tFStqoqd6xVc4Rgk82/5ESuJS/6atrMSCzFIyPFH7sU2gTQ
   w==;
X-CSE-ConnectionGUID: 5pW9+XssT8SKg94i3Kp88w==
X-CSE-MsgGUID: ANcspE3mRn+bsK1El3pUew==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63260652"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="63260652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:30:45 -0700
X-CSE-ConnectionGUID: 2glG0ox+TwSFoNvkcZpqdA==
X-CSE-MsgGUID: VfQI21C6T/mPQSLBdTjgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154587258"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:30:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2EFF711F91E;
	Thu, 19 Jun 2025 13:30:41 +0300 (EEST)
Date: Thu, 19 Jun 2025 10:30:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 3/3] media: Documentation: Document new
 v4l2_ctrl_handler_free() behaviour
Message-ID: <aFPm0VVn3RRcSzJZ@kekkonen.localdomain>
References: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
 <20250619095227.1939114-4-sakari.ailus@linux.intel.com>
 <ea26eb21-6d93-4f2d-b860-897d5617431a@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea26eb21-6d93-4f2d-b860-897d5617431a@jjverkuil.nl>

Hi Hans,

On Thu, Jun 19, 2025 at 12:10:55PM +0200, Hans Verkuil wrote:
> On 19/06/2025 11:52, Sakari Ailus wrote:
> > v4l2_ctrl_handler_free() no longer resets the handler's error code.
> > Document it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
> >  include/media/v4l2-ctrls.h                       | 3 ++-
> >  2 files changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
> > index b2e91804829b..fc04907589ab 100644
> > --- a/Documentation/driver-api/media/v4l2-controls.rst
> > +++ b/Documentation/driver-api/media/v4l2-controls.rst
> > @@ -110,6 +110,7 @@ For sub-device drivers:
> >  
> >  	v4l2_ctrl_handler_free(&foo->ctrl_handler);
> >  
> > +:c:func:`v4l2_ctrl_handler_free` does not touch the handler's ``error`` field.
> >  
> >  2) Add controls:
> >  
> > @@ -191,12 +192,8 @@ These functions are typically called right after the
> >  			V4L2_CID_TEST_PATTERN, ARRAY_SIZE(test_pattern) - 1, 0,
> >  			0, test_pattern);
> >  	...
> > -	if (foo->ctrl_handler.error) {
> > -		int err = foo->ctrl_handler.error;
> > -
> > -		v4l2_ctrl_handler_free(&foo->ctrl_handler);
> > -		return err;
> > -	}
> > +	if (foo->ctrl_handler.error)
> > +		return v4l2_ctrl_handler_free(&foo->ctrl_handler);
> >  
> >  The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
> >  the new control, but if you do not need to access the pointer outside the
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 9e1693ecc283..ecd72528a4c5 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -578,7 +578,8 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
> >   * the control list.
> >   * @hdl:	The control handler.
> >   *
> > - * Does nothing if @hdl == NULL.
> > + * Does nothing if @hdl == NULL. Does not reset the handler's error code in any
> > + * case.
> 
> So this should change to something like:
> 
>  * If @hdl == NULL, then it just returns 0 without doing anything.
> 
> >   *
> >   * Returns the handler's error field.
> >   */
> 
> I don't think that there is a reason to state that the error code isn't reset.
> Documenting that the error field is returned already indicates that it isn't
> reset.
> 
> Actually, patch 1/3 should probably document this in v4l2-ctrls.h: that patch
> will be backported, and it doesn't return the error code, so there is makes
> sense to state that error field isn't reset. In patch 2/3 it can be removed
> again and you just say that it returns the handler's error field.
> 
> This documentation patch shouldn't touch v4l2-ctrls.h at all.

I'd really keep the backported patch as small as possible as it can be
backported with the control framework, in other words I'd keep it as-is.

I'll drop the changes to v4l2-ctrl.h from this patch.

-- 
Regards,

Sakari Ailus

