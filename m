Return-Path: <linux-media+bounces-39507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63FB21E1B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E7FA7B2117
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452242D4811;
	Tue, 12 Aug 2025 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiQO1iUK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87D20C004;
	Tue, 12 Aug 2025 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754979364; cv=none; b=TvFYjBh8c6+K2LnA1byplyuyUYhIaYFsjRT/3qOCK9LCw0rJmix9Lde8/iLmXDzv0bxABGKTumrKkProcVX734TLN22daTY3dFr/R68/gB1tthEV7fyTsD+OOpVAIaCbXx4/xYWGDwHpWgk4WcT/vVLGytxh9eebbghnxgBIbr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754979364; c=relaxed/simple;
	bh=flgAhCQZ27nZfREnbCOqcQvS65+XwrSYQ2GJCE3FIpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdTpP0Jfncu1rGGFYTjTNJ2GB+lg1BZgs6cf+pq7gLZLn2ntpJ2IY/4ySoPWgLcmJvxzf/uyZl9bmP93CbieJCZQAWhGZWnODneRvM2TddZ+R57zqEt0O3+he1H5PkKxROb4Z6IUl/4iFUftid/4qCVg7xnLITAh9SksZJIUsgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiQO1iUK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754979363; x=1786515363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=flgAhCQZ27nZfREnbCOqcQvS65+XwrSYQ2GJCE3FIpc=;
  b=hiQO1iUKu7eO9bLTej6t7PLW479MnH1mm2BgZgrkerM7OaTvTd5jctDh
   X96JJIj3B3SiiUEZkzLIECui0g+iR3at/dOUeXMaxfayQZ2C5tmlsmPMe
   CLhtmILWNgkpm5uFufKMufu61zh0PB2jgscpaKWED+hUT7T0Uz7FJlydr
   jj7DVBjgvhjZA46gMhGCasISssvxmgjLv20btoIFZtU1KTECzcVk7zaZv
   weF4elnfTvXApwaM4uE4W4Oa+f8NHcT1STslEoFCMfJtCVMMvZ0fQ5r6N
   4U1cyxjT/BbZdNb06gSfxHZm3bJCmpWyi+5G/Bu1RqzohiHITM0dgIi+3
   Q==;
X-CSE-ConnectionGUID: NvIhgBM1Tj6ZzwQZAccBmw==
X-CSE-MsgGUID: c/VOCVZbRyejfTK8tPsXyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56273801"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56273801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:15:47 -0700
X-CSE-ConnectionGUID: upsQ+JclTJKl1JEfTHvaog==
X-CSE-MsgGUID: 4iObCQnnRs6M6Jgywh/ACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="197113180"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.28])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:15:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C677E11F847;
	Tue, 12 Aug 2025 09:15:40 +0300 (EEST)
Date: Tue, 12 Aug 2025 06:15:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <aJrcDLVd0r_sr9xL@kekkonen.localdomain>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-4-sakari.ailus@linux.intel.com>
 <c8b96c39-ba49-4199-8895-5056efea5dac@rowland.harvard.edu>
 <aJWy8kBkdfqXyXnC@kekkonen.localdomain>
 <5668be30-8b01-4e9a-8eb8-e9098de24e4e@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5668be30-8b01-4e9a-8eb8-e9098de24e4e@rowland.harvard.edu>

Hi Alan,

On Fri, Aug 08, 2025 at 11:16:22AM -0400, Alan Stern wrote:
> On Fri, Aug 08, 2025 at 08:18:58AM +0000, Sakari Ailus wrote:
> > > >  
> > > > +/**
> > > > + * usb_endpoint_max_isoc_bpi - Get maximum isochronous transfer bytes per interval
> > > > + * @dev: The USB device
> > > > + * @ep: The endpoint
> > > > + *
> > > > + * Returns: the maximum number of bytes isochronous endpoint @endpoint can
> > > > + * transfer in during a service interval, or 0 for non-isochronous endpoints.
> > > > + */
> > > > +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> > > > +					    const struct usb_host_endpoint *ep)
> > > > +{
> > > > +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> > > > +		return 0;
> > > > +
> > > > +	switch (dev->speed) {
> > > > +	case USB_SPEED_SUPER_PLUS:
> > > > +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
> > > > +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> > > > +		fallthrough;
> > > > +	case USB_SPEED_SUPER:
> > > > +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> > > > +	case USB_SPEED_HIGH:
> > > > +		if (ep->eusb2_isoc_ep_comp.bDescriptorType &&
> > > > +		    !usb_endpoint_maxp(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
> > > > +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> > > > +		fallthrough;
> > > > +	default:
> > > > +		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
> > > > +	}
> > > > +}
> > > 
> > > This function is complicated enough that it probably should not be an 
> > > inline routine.  Not unless it's used in only one place (in which case 
> > > why define it in a .h file?).
> > 
> > The single user currently (and probably will be for some time at least) is
> > the UVC driver but this code is better located in the USB tree. I'd keep it
> > this way until we have more users, unless Mathias can suggest where the
> > function should be located.
> 
> Okay.  But in the meantime, how about putting just a declaration for 
> this function in include/linux/usb.h and putting the actual (non-inline) 
> definition in drivers/usb/core/usb.c, or in drivers/usb/common/common.c 
> if you think the function would be used in gadget-side drivers as well 
> as host-side drivers?

I'll move it to usb.c in v4.

-- 
Regards,

Sakari Ailus

