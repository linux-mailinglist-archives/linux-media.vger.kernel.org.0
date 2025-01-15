Return-Path: <linux-media+bounces-24747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E36A11BA9
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADD557A059E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C97420AF91;
	Wed, 15 Jan 2025 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQaNX0eI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A0824333D;
	Wed, 15 Jan 2025 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736928935; cv=none; b=N+2yyG2xXgXaM1/qe7rNrVkiAmJVxiqSWb8N25ECW73+SyYY5pwIcPZ32Xgl0VT7LN7z290qMwVSuwL0D5JAOODqusBGbdA53J2WABf+kV1dFrDS6RN+Zh7Ph+Nguw7nlqSIUjMT990+OJQ+U6YzIIOap3TOehhdRWLl9tOwUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736928935; c=relaxed/simple;
	bh=T0IdFn0MO9THjwmFrjdVpSDN00JpLLnGIr0LGMN8FaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7oCgUIioRYPuxCURBO9FSdPTMEByZTx7sShzJX/nfCnAT1N0eqVPB3+JFiyB/pF5sZBVEaWf1vljg9jzBiFMl+cy2shO06DF4R3VN2s0jHD8N6lICD7AorzRrSuVZmrRtNXQ5RqxA8+yj9Q/K7VzOVdPcxxV7L579CvTNHsZ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQaNX0eI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736928934; x=1768464934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T0IdFn0MO9THjwmFrjdVpSDN00JpLLnGIr0LGMN8FaU=;
  b=YQaNX0eIsmVAhSZJStNlbdLb/ErVgNBwrS0SleGHNlntKGAnBKm/nVQt
   qm/Xi6ZAip8D8HLVzrYR0fWYBmoR2gXHLUBwYK/ZLdJSWvszFQoRL6R06
   MFABr4rx8bzmcR2m1rHFfVQcfyxfX3dj9E/N7LHviylgoryktVFvr1jME
   2nUdPfRCMdFAeX/FBD9veb7lT00xumx6TSCFDgjbMGlXb8g2x4lhCdZC5
   PWsdRWkVVNUXSmvEOTLyRrBN1qkhTtWBxlcGBx88Z6WKeFb3KFKLjnI1c
   PGJV7zxLIAXM2iLWrzuvdkrsOh1Iv4NWKk8D8RKLfDQRwnON5ILw0Hh1e
   g==;
X-CSE-ConnectionGUID: 61NYUgwEQxaM1yahJQohsA==
X-CSE-MsgGUID: +3SgpITrQx++xtwwJJiv1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24852178"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="24852178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 00:15:33 -0800
X-CSE-ConnectionGUID: navOLFn1SpCo68KhG9DkjQ==
X-CSE-MsgGUID: J5hfQ/WjRqO8qy9oCaCMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110197947"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 00:15:32 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BDF9A11F8B3;
	Wed, 15 Jan 2025 10:15:28 +0200 (EET)
Date: Wed, 15 Jan 2025 08:15:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l: fwnode: Parse CSI-2 C-PHY line-orders
 like bus-type
Message-ID: <Z4duoOn2ywLseSyJ@kekkonen.localdomain>
References: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
 <20250104195548.1915578-3-niklas.soderlund+renesas@ragnatech.se>
 <Z3znj0MOWvIhbOxj@kekkonen.localdomain>
 <20250107095219.GF2766897@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107095219.GF2766897@ragnatech.se>

Hejssan,

On Tue, Jan 07, 2025 at 10:52:19AM +0100, Niklas Söderlund wrote:
> Hi Sakari,
> 
> Tack för din feedback.
> 
> On 2025-01-07 08:36:31 +0000, Sakari Ailus wrote:
> > Hejssan Niklas,
> > 
> > Tack för dessa lappar!
> > 
> > On Sat, Jan 04, 2025 at 08:55:48PM +0100, Niklas Söderlund wrote:
> > > Provided a safe-guard from the raw values used in device tree sources
> > > and the in-kernel defines used to describe the different line orders.
> > > This mimics what have been done for the bus-type property to provide the
> > > same safe-guard.
> > > 
> > > The macros used in device tree sources are defined in video-interfaces.h
> > > (MEDIA_BUS_CSI2_CPHY_LINE_ORDER_*) and are only visible to DTS source
> > > files. These raw values map directly to the in-kernel names by fwnode
> > > defines in v4l2-fwnode.h (V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_*). These
> > > fwnode defines are finally translated to defines which are exposed to
> > > drivers to act on (V4L2_MBUS_CSI2_CPHY_LINE_ORDER_*).
> > > 
> > > Previously the translation to values provided to drivers have exploited
> > > the fact that the numerical value for each setting are the same for the
> > > defines used in device tree sources. While this is unlikely to change
> > > this harmonises the bus-type and line-orders parsing to work using the
> > > same mechanics, while at the same time make the large CSI-2 parsing
> > > function a little more readable.
> > 
> > Do we in fact need the V4L2_MBUS_ definitions of the line orders at all?
> 
> I'm not sure :-)
> 
> Geert pointed out in [1] that in comparison to the V4L2_MBUS_ bus-type 
> definitions the line-order definitions did not have this intermediary 
> step as a safe guard between values used in DTS files and values used in 
> V4L2 drivers.
> 
> Looking at the original functionality,
> 
>     bus->line_orders[i] = array[i];
> 
> Seems a bit "hack" compared to what this patch do,
> 
> 
>     bus->line_orders[i] = v4l2_fwnode_line_order_to_mbus(array[i]);
> 
> But if it's worth the extra churn, and if it in reality provides us with 
> a safe-guard between DTS-files and V4L2-drivers I'm not sure. I'm on the 
> fence on this one, the one good thing is that it aligns how V4L2_MBUS_ 
> macros are parsed.
> 
> But if you don't like it and I'm on the fence I'm happy to drop this 
> series. This series don't add any extra functionality.

I wasn't asking dropping the series, but instead get rid of the V4L2_MBUS_
line order definitions altogether, by replacing them by V4L2_FWNODE_
equivalents.

> 
> 1. CAMuHMdXwqb7vhUeoMKDDJO5dp-V3LmnURZLSC1_ko=YL=cNyUA@mail.gmail.com
> 
> > 
> > The same could extend to the V4L2_MBUS_ bus type defitions, but that's out
> > of scope of this patch.
> 
> Out of scope indeed. If we drop this series do we want to try and remove 
> them for V4L2_MBUS_ bus-type in future?

I think that would be reasonable. I don't think we need two sets of
definitions that effectively are interchangeable. But that may well be out
of scope of this series.

-- 
Med vänliga hälsningar,

Sakari Ailus

