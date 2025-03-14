Return-Path: <linux-media+bounces-28229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30CA612C1
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD91174535
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61861FFC6B;
	Fri, 14 Mar 2025 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHP4SRgi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534B21FF5F7;
	Fri, 14 Mar 2025 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741959255; cv=none; b=GimLEmIqoMGR7GKBgiuvcoZd3zJDy840t0yTNiVl2eY+8qVl2gTIgVCshWCl9tpZu4URYHXj29dxNKRsZGqtHHdXiu3GTsmUh2gGzoL1Sfx8u/JO2i2baiUqZ7cxwN7VQOwCAGom75vYvC+sXK+SKcMBNaRuu9VwUH6m3GbtcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741959255; c=relaxed/simple;
	bh=AblPfx8eF6BCp+Mvn4xq9FAZ1hinMSOmBuNT9HtKsL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctHnOqV0sTQ6p6oYsfamv5Kc2DtL5MVR2zpdrpd+QG1g+B4c5ybdehy5HJ4iMCubZvVNo4qTdUN+XJEIARetMmBE1s/A8n4UxhB8RQO9AaxaZL7QKIepSQ8DIPZvhvaybh1Q1D82WkhJe0i/NNaZJYdaBvIL4Mt6apncOERkQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHP4SRgi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741959253; x=1773495253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AblPfx8eF6BCp+Mvn4xq9FAZ1hinMSOmBuNT9HtKsL8=;
  b=JHP4SRgiRuZ1KzM1RY8i4mMfcOcWxgpZ8KBnXv9z5PW26Hsz9MCzRWCl
   911Vr0KdsdNaescgwBlB8NQtHJgMhTd0f4p4CGWidWfiWELy0Set8hpYI
   uo5H9FB/0tLfF5086lcc3rXcEgy9eXJroS0tpKdUUMd7UTV7CIFBcsbtb
   AGLNvFSLQdAW5b49sjHH5WeC1Rbwa56o/GbAq3PG0ddILNc/IGZyjU6QH
   Zc8EKlaZTwMe4w+mwQKJgCQ2b72nRk09g6h1o79tFfkoAsqoPFywIiWrg
   cFizc9hEiqdbwI3CQdKmMzw3CdfPLtZ3bETPqcfYMRGvawio6nSypAu1E
   w==;
X-CSE-ConnectionGUID: /7ApU5LRToeDVI2jvihZUw==
X-CSE-MsgGUID: tNmRk6yzTE6SHyogM8tCRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54481546"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54481546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:34:12 -0700
X-CSE-ConnectionGUID: SCd4GhAlSKiktkieOaEWjw==
X-CSE-MsgGUID: Q7DxYn/JQ9qGh59tIhlJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121279893"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:34:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 21C6D11F944;
	Fri, 14 Mar 2025 15:34:07 +0200 (EET)
Date: Fri, 14 Mar 2025 13:34:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
 <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
 <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>

Hi Richard,

On Fri, Mar 14, 2025 at 11:25:09AM +0100, Richard Leitner wrote:
> On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > Thanks for the set.
> 
> Hi Sakari,
> thanks for the quick response!
> 
> > 
> > On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > control, as the timeout defines a limit after which the flash is
> > > "forcefully" turned off again.
> > > 
> > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > of the flash/strobe pulse
> > 
> > What's the actual difference between the two? To me they appear the same,
> > just expressed in a different way.
> 
> According to FLASH_TIMEOUT documentation:
> 
> 	Hardware timeout for flash. The flash strobe is stopped after this
> 	period of time has passed from the start of the strobe. [1]
> 
> This is a little bit unspecific, but as also discussed with Dave [2]
> according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
> be targeted at providing a "real timeout" control, not settings the
> desired duration:
> 
> 	The flash strobe was still on when the timeout set by the user
> 	--- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> 	controllers may set this in all such conditions. [1]
> 
> If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
> use-case. But tbh I think FLASH_DURATION would be more specific.
> 
> As this still seems unclear: Should the documentation be
> changed/rewritten if we stick with the FLASH_DURATION approach?
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> [2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/

Right, I think I can see what you're after.

How does the sensor determine when to start the strobe, i.e. on which frame
and which part of the exposure of that frame?

> 
> > 
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> > >  include/uapi/linux/v4l2-controls.h        | 1 +
> > >  2 files changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > index 1ea52011247accc51d0261f56eab1cf13c0624a0..f9ed7273a9f3eafe01c31b638e1c8d9fcf5424af 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >  	case V4L2_CID_FLASH_FAULT:		return "Faults";
> > >  	case V4L2_CID_FLASH_CHARGE:		return "Charge";
> > >  	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
> > > +	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
> > >  
> > >  	/* JPEG encoder controls */
> > >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index 974fd254e57309e6def95b4a4f8e4de13a3972a7..80050cadb8377e3070ebbadc493fcd08b2c12c0b 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1173,6 +1173,7 @@ enum v4l2_flash_strobe_source {
> > >  
> > >  #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
> > >  #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
> > > +#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
> > >  
> > >  
> > >  /* JPEG-class control IDs */
> > > 
> > 

-- 
Regards,

Sakari Ailus

