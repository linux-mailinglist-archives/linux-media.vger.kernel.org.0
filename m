Return-Path: <linux-media+bounces-40423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6AB2DD9C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596D61C440E6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EB031DD8B;
	Wed, 20 Aug 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZByQORk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8A2DE6ED;
	Wed, 20 Aug 2025 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696001; cv=none; b=i17aqhV8rmvo9ptrbgJFdFEUwMQWY3MgfxaV9OdAePPEHoFSq1faHK3ljydqw9eg7LwCcuaFiYyvBcv03q06sHPYT9QajpITkanOKwqoOITwwkeb5373NBD4Unz0CupjvH5xRm9GmzdiEuH2qbYNGvtpySGprONoYb6SgcCVsDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696001; c=relaxed/simple;
	bh=cW2J3cznJb8SCJEC0Zd0cLhUnApCtv6wMSIbGA5lfVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYUnNavIqnv1xE2UtjvxkCxtsLeBkQOScDw/kMtkxWG2y1ibTSQrskpAp363rg2e3M01hkgOodu7lbKOKCXbZqz86U6hkRjQzB/kz8TUadn8i12OHlYltlSM2AIPVlREU72qKmR/uLWQ6A9p6pWqRWUV4o0sbHWRA+pQ6A6bs0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZByQORk1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755696000; x=1787232000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cW2J3cznJb8SCJEC0Zd0cLhUnApCtv6wMSIbGA5lfVc=;
  b=ZByQORk1d/Rkhfs7hjhM2a4PDomKA9nGadFfhXjP658+N/OluUVrkNF1
   WEth+MbdLG2GwhNYEJYLtGxhf2s55SI+Mzt/rRFqZL/wt8OZuIe9CyZVW
   31uhtxLUGR0OGgC1j3MkfzhTCGD+EvA3ugZBQc3QwG8W+Q9b2eI7z6O/N
   vl2MA2D6RjiXrTg0kwpO8S/PdX8xstk9XFSQOP3SYFGNIfJA65hMDkYKU
   ZZRpJrPsq4bzLQE7I3KjswO6JCmYmKcMXXpMLhzM9QkgEQjcgJvte72dv
   fd0XkSK55PRkCCkuXKbcnhr1hmAFoslbIcMf0w9v/+BP3Tw5/FKsWdL4u
   A==;
X-CSE-ConnectionGUID: Q8ew4YT5TU2PUuRhKVgPpg==
X-CSE-MsgGUID: c0WiWbLUQAKFcSRRmjw9Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75541636"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="75541636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:19:59 -0700
X-CSE-ConnectionGUID: VFmZteUnRjqpT1z204NhNQ==
X-CSE-MsgGUID: Uk8bhA24Qz6bvZkm6SHtyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172383404"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:19:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5585112024B;
	Wed, 20 Aug 2025 16:19:54 +0300 (EEST)
Date: Wed, 20 Aug 2025 16:19:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 1/4] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Message-ID: <aKXLegx2LWUcOPe1@kekkonen.localdomain>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-2-sakari.ailus@linux.intel.com>
 <20250818115016.3611b910@foxbook>
 <aKWGOIsipctKEJP-@kekkonen.localdomain>
 <20250820104304.05a4373d@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820104304.05a4373d@foxbook>

On Wed, Aug 20, 2025 at 10:43:04AM +0200, Michał Pecio wrote:
> On Wed, 20 Aug 2025 11:24:24 +0300, Sakari Ailus wrote:
> > Hi Michał,
> > 
> > Thanks for the review.
> > 
> > On Mon, Aug 18, 2025 at 11:50:16AM +0200, Michał Pecio wrote:
> > > > @@ -1351,8 +1369,18 @@ static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
> > > >  
> > > >  	if (udev->speed == USB_SPEED_HIGH &&
> > > >  	    (usb_endpoint_xfer_isoc(&ep->desc) ||
> > > > -	     usb_endpoint_xfer_int(&ep->desc)))
> > > > +	     usb_endpoint_xfer_int(&ep->desc))) {
> > > > +		/*
> > > > +		 * eUSB2 double isoc bw endpoints max packet field service
> > > > +		 * opportunity bits 12:11 are not valid, so set the ctx burst to
> > > > +		 * max service opportunity "2" as these eps support transferring
> > > > +		 * over 3072 bytes per interval
> > > > +		 */  
> > > 
> > > I think a shorter comment would suffice: eUSB2 BWD uses fixed burst
> > > size and max packets bits 12:11 are invalid.  
> > 
> > I'll use this:
> > 
> > +                * eUSB2 double isochronous BW ECN uses fixed burst size and max
> > +                * packets bits 12:11 are invalid.
> >
> 
> Fine. And by the way, it may look like my comment was overly pedantic,
> but I though that mentioning "more than 3072 bytes per interval" not
> only isn't necessary here, but it adds confusion. It was something that
> would be more relevant to 'mult' than 'burst.

Further I corrected the ECN title, the result being:

+                * USB 2 Isochronous Double IN Bandwidth ECN uses fixed burst
+                * size and max packets bits 12:11 are invalid.

There are now quite a few other changes for v5 as well, I'll post it
soonish.

-- 
Sakari Ailus

