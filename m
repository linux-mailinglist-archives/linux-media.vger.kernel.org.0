Return-Path: <linux-media+bounces-28205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E23A60EC5
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 11:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491D0169D8A
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F57F1F460B;
	Fri, 14 Mar 2025 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OjtptIuu"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD31F3FE8
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947931; cv=none; b=i7ODWI/hu3fZXA/RMBpuuB4hq573DNB1xoDDxTyT8NDR2WwxDA61dWicywGAMJyTBdYguTPyenD6Tuua64UHfslNGe5WIXcrltBKKr5gkIKk/dGec2IEkQbDrS62Kjvh2CUxSyqrhHXpISRFIQwlVPzFzmQaOD/KByBIcltT20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947931; c=relaxed/simple;
	bh=5u1ZkrdqkYX+wTwH8HmCGZQpoR5zbk8KhmDs/eMDIno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+GDOhkh6jqv2Kil0I5URIeDUkbpLpXRKZy3L8gGEolrqhKzog4U3zTeVpDlLXOvxgm78cXBQ8ZeBqcvqx0lnr52x9pbyodb88+LOKfJu9xA7+oT9Q17wE050nl8zMIX6O3bzBa6pqC0ZfX0LMeiT7DMbFemRMEbL87JxmEeelU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OjtptIuu; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 14 Mar 2025 11:25:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741947914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pvHzbCuCDD8ylI8fTMIt04hPeYHC4OaA5IgyIuhTOI0=;
	b=OjtptIuuWp6g9EEZrDzT1PUFkLtcofVKGG75OTV2rlmf25VKP60kSapqVcHKeIhv6tOxDk
	qpLpm3JpuzkhfI4dF//REJRN2wvtHTPaVaLPJubh9+Y9sc67AKQUvWy7OpdMhFPmYaA6aC
	eQFLUued3qJzBM+AwWAK0ymfW3bD1Lg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
 <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> Thanks for the set.

Hi Sakari,
thanks for the quick response!

> 
> On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > control, as the timeout defines a limit after which the flash is
> > "forcefully" turned off again.
> > 
> > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > of the flash/strobe pulse
> 
> What's the actual difference between the two? To me they appear the same,
> just expressed in a different way.

According to FLASH_TIMEOUT documentation:

	Hardware timeout for flash. The flash strobe is stopped after this
	period of time has passed from the start of the strobe. [1]

This is a little bit unspecific, but as also discussed with Dave [2]
according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
be targeted at providing a "real timeout" control, not settings the
desired duration:

	The flash strobe was still on when the timeout set by the user
	--- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
	controllers may set this in all such conditions. [1]

If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
use-case. But tbh I think FLASH_DURATION would be more specific.

As this still seems unclear: Should the documentation be
changed/rewritten if we stick with the FLASH_DURATION approach?

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
[2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/

> 
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> >  include/uapi/linux/v4l2-controls.h        | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 1ea52011247accc51d0261f56eab1cf13c0624a0..f9ed7273a9f3eafe01c31b638e1c8d9fcf5424af 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_FLASH_FAULT:		return "Faults";
> >  	case V4L2_CID_FLASH_CHARGE:		return "Charge";
> >  	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
> > +	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
> >  
> >  	/* JPEG encoder controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 974fd254e57309e6def95b4a4f8e4de13a3972a7..80050cadb8377e3070ebbadc493fcd08b2c12c0b 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1173,6 +1173,7 @@ enum v4l2_flash_strobe_source {
> >  
> >  #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
> >  #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
> > +#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
> >  
> >  
> >  /* JPEG-class control IDs */
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

Thanks!
Richard

