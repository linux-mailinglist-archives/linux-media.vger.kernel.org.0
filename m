Return-Path: <linux-media+bounces-40348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BEB2D637
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5967A5A5992
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7322D97A4;
	Wed, 20 Aug 2025 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrLsKgwL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A52C11CF;
	Wed, 20 Aug 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678272; cv=none; b=AO515KYevTJi9lAjkSRxvN2qj4D3Z158SLx0ZHVuuy0ddC25/xxNqZ7BpFwIbbzNB+paDvpokfBUt10RCj8ClKxCzbp/biv+SeorkK7ojFZWDGEvk38VTOfvp5M5d6AqybakiEzXZ0b/9ZBGvhMylDRbnHaZxTqTnF0dYyrxOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678272; c=relaxed/simple;
	bh=vy1xq+sepJ0MlgCA0u0ItjhJmyd3dYbZn3CgNuB34X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJj1jzjOqDuftz7liPdC1+AgDYKF2cuvLfqEdaMYNaXNCgJ/O71kim5eFNgH2gVSUKzCCy29hFfO4k3XQAoD60lUdzQYHdLz6qYy1Obn6aljfIDOJFjUUQOo4/OirbeDAGKm9Jgdk6DdO0R+6JQzZ6Rlo1mOWG9/oy4oRvO5gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrLsKgwL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755678271; x=1787214271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vy1xq+sepJ0MlgCA0u0ItjhJmyd3dYbZn3CgNuB34X0=;
  b=RrLsKgwLHe3PFdBu0GEiODMgeItiiSSPK6BGOVRiyzPWorQxyHY+YjfW
   XFxsdl4RUrS/9Ak/yExeqModH3S29bhNhVdzxCweWuvK9xJWq9sQp2WbT
   POPRxkGHoXaYfnjAsCFU/ivt+HD3tFZ5jgtnKsrJZhLYekMTFo7WTuJWH
   hl6w3QYhRFtmKEJzKg3iIs+3UlITA2E1vdArK7t3VlrCqjM3HAAIjxKB1
   Ky2zHyFe3DnA1kpq0b1e+JCLE9LAD8/kwVZLo1PLAo3/pzGRfnvDYLL2x
   R3KKWrlD4eDFMEAgWhANR1KfvPsIXuqMbQ480m4q/A1mLisXi9Ks7LoLU
   A==;
X-CSE-ConnectionGUID: /2VlWTtzTQm6cIlb3eVmPg==
X-CSE-MsgGUID: ebtG4UAKQ1+vu1Ec3YxuLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69317524"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="69317524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 01:24:30 -0700
X-CSE-ConnectionGUID: rToL/CjuRWyzJceptfdsBQ==
X-CSE-MsgGUID: RiXj+V3CQWiri6uq08i5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172294000"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.19])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 01:24:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DCB2411F97F;
	Wed, 20 Aug 2025 11:24:24 +0300 (EEST)
Date: Wed, 20 Aug 2025 11:24:24 +0300
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
Message-ID: <aKWGOIsipctKEJP-@kekkonen.localdomain>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-2-sakari.ailus@linux.intel.com>
 <20250818115016.3611b910@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818115016.3611b910@foxbook>

Hi Michał,

Thanks for the review.

On Mon, Aug 18, 2025 at 11:50:16AM +0200, Michał Pecio wrote:
> > @@ -1351,8 +1369,18 @@ static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
> >  
> >  	if (udev->speed == USB_SPEED_HIGH &&
> >  	    (usb_endpoint_xfer_isoc(&ep->desc) ||
> > -	     usb_endpoint_xfer_int(&ep->desc)))
> > +	     usb_endpoint_xfer_int(&ep->desc))) {
> > +		/*
> > +		 * eUSB2 double isoc bw endpoints max packet field service
> > +		 * opportunity bits 12:11 are not valid, so set the ctx burst to
> > +		 * max service opportunity "2" as these eps support transferring
> > +		 * over 3072 bytes per interval
> > +		 */
> 
> I think a shorter comment would suffice: eUSB2 BWD uses fixed burst
> size and max packets bits 12:11 are invalid.

I'll use this:

+                * eUSB2 double isochronous BW ECN uses fixed burst size and max
+                * packets bits 12:11 are invalid.

-- 
Sakari Ailus

