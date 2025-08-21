Return-Path: <linux-media+bounces-40544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05CB2F35E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 381EC7BAAA1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAECE2D47E8;
	Thu, 21 Aug 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eB7NxZ1O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6832765C9;
	Thu, 21 Aug 2025 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767374; cv=none; b=TCuA9HROJ4DOkdo9bctsvp9UqfpViYqeQT6bh6QeC7fsU3c2ae/+jXHwnFBuBFXx4wbgFTeKq7oKr4k6Jtl1FmcH9sD9C+VVvS14Pw8XA/3AOLdqAFsRSoaAU80Z64fPx1NxugagIc+IbKTC3FpGaRDQuEoR2GHKQJvdHT0zzcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767374; c=relaxed/simple;
	bh=xIG76UMntrafk46+9WUBXH+BLX3Y9W1E6nEWDwj5G50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REsb7lWAT1DMh9iqCXTwr05JefXLKTMA7DPFuddw7IsfS4Gx4BekbdK+IP882PJHCyn0egILq7pJEtirTe25fh0uYd+BXHi+s3n8oikyx2+qK6z9ja0yPsmCcM1XKRRW8W6n8T5gZrtUK3jXrpKoyhBdTAWR2uxr/SMatjJizGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eB7NxZ1O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755767372; x=1787303372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xIG76UMntrafk46+9WUBXH+BLX3Y9W1E6nEWDwj5G50=;
  b=eB7NxZ1OsrKjlmeH/wgbJsBYrWkj32VzZPAwfBVNEK2lrq5nlW7Tb5mc
   HG91sBNfaMfcm3Ad3mT2sTAd+NzE6AAdSiuXkCJeisjgfN3ehNYLCTgzM
   +OVe/yu8LjGLvg995eGGzUfyhR3J8+yhi3HGne9/FyraYvzzi5xWVwKh+
   puopnj9W9qkbRxsYs0YNvSsGLi0BDtmb9KB3+xFAjBiB7KwHsWeniUx+W
   5ra1B8Ep+dHfVS6or3cTsUDtYMcK/6lJUtOi8oH4fdggJxZqZ6nQehDht
   ew1tpme5bpRhIBRK871nAs615GtBq9xU3FEato6maPt7fEpNntwpHD0UT
   w==;
X-CSE-ConnectionGUID: uklxAXLCSdeq3+/m236pPQ==
X-CSE-MsgGUID: kAQxhtPVR2O6c2VrG/d2gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68754326"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68754326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:08:29 -0700
X-CSE-ConnectionGUID: fWaPflLtTYqeaniiHx6KRg==
X-CSE-MsgGUID: 3npS8hyUQFWB4Jz3mnKK2A==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:08:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E0D4B11FBC0;
	Thu, 21 Aug 2025 12:08:22 +0300 (EEST)
Date: Thu, 21 Aug 2025 12:08:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 4/4] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
Message-ID: <aKbiBoxvZYKAJg_v@kekkonen.localdomain>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-5-sakari.ailus@linux.intel.com>
 <20250715091032.GF20231@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715091032.GF20231@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jul 15, 2025 at 12:10:32PM +0300, Laurent Pinchart wrote:
> Hi Sakari, Tao,
> 
> Thank you for the patch.
> 
> On Fri, Jul 11, 2025 at 11:34:13AM +0300, Sakari Ailus wrote:
> > From: Tao Q Tao <tao.q.tao@intel.com>
> > 
> > Use usb_endpoint_max_isoc_bpi() from the USB framework to find the maximum
> > bytes per interval for the endpoint. Consequently this adds eUSB2
> > isochronous mode and SuperSpeedPlus Isochronous Endpoint Compaion support
> > where larger bpi values are possible.
> > 
> > Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> > Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> > Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Assuming usb_endpoint_max_isoc_bpi() works correctly :-),
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

> 
> I won't queue this patch for the time being as it depends on the rest of
> the series. Please let me know if I should queue it at a later point, or
> if you would like to merge it through the linux-usb tree. We would need
> to make sure there's no conflict with other scheduled patches for that
> kernel development cycle.

I think we'd prefer to go through the linux-usb tree, it seems like the
simplest way to get these to the same kernel release. The changes aren't
very big either.

Are you aware of UVC patches that might conflict with this one?

-- 
Kind regards,

Sakari Ailus

