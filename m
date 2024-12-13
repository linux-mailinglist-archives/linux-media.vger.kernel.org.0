Return-Path: <linux-media+bounces-23357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB3E9F06E2
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33085163640
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 08:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1211B0F15;
	Fri, 13 Dec 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XckH2MGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37031ABEDF;
	Fri, 13 Dec 2024 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079750; cv=none; b=exvv+t/tNPIx6C+Y4cN/ZyY25RT15GCgm859qO2d8Kt/ILdLx+EPL3ccJ3YxoBCl7Ko8qDAoC5wYjYFt45OjPD/Jo03rDnuT00ufhpSXyofTJgjTFJxXIGP4/mEWOX1IMkbpQzm9lgNtNDIzMUeekGlggaStz7Xe5mNIw42ulZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079750; c=relaxed/simple;
	bh=xntJvcZfmEvE/W7+voLymDRXT0mXERYE5ICMe3EocEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNG0zZ4wLzK1xfdnfcsLQ8lxK9tmYj+EE9Z8ZmbmJZ1x5W1BI+bs7wvL23yrnjqOuuWSKS5bGM05g82xpshECzvPhW1nbRxlbLz/WkFCYIDQ41ZuRYTGOm5uk8teQ0CrRbbp74WPAfjhMIF/ayBO8Iqvsw2qPY8HfJ8I/0CDKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XckH2MGJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734079749; x=1765615749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xntJvcZfmEvE/W7+voLymDRXT0mXERYE5ICMe3EocEs=;
  b=XckH2MGJy3xeObG/hcxxzmDVPUUciHaWO3ygRO4FUzBryiuhC9QMPxPW
   WIgSpWI276/szC15G1k1ZDwawkwWmvQmCqKDEdX7Pnd8RDN6EDbhr1bCm
   MlhZZEkHIqn4gINpNJ/QbZkNJNyDxztuD0aB8iWwVhAykXMGZMGMhuPET
   cJPau1+xkN7feOSmzNstKZnOXz9K0KH7FHI8paoq+7QGCWP9YAq/6Ew54
   N7gM2rGdE/jan2HsknJ2JCsOgIM1kvnfTs5s2CLmhfMthUXN0nk6VORcI
   9Y8Nf9OHHKGsABszj51bm8eRaN39Ha2sFhAA7+/iZRUIbGaF+/XuuyIa/
   A==;
X-CSE-ConnectionGUID: ZO0KKD/UQcS5rXM/eXaagw==
X-CSE-MsgGUID: xAZ7M6X7RXCyHH5gBpIddA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34574834"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34574834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:49:08 -0800
X-CSE-ConnectionGUID: CowcL5uZTpiGfbdrElJStQ==
X-CSE-MsgGUID: Xn+VR+/mRkSykM8ZrnhHqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="101332457"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:49:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 85E1D12034A;
	Fri, 13 Dec 2024 10:49:03 +0200 (EET)
Date: Fri, 13 Dec 2024 08:49:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Prevent NULL routes access
Message-ID: <Z1v0_zBlWfSLcXwQ@kekkonen.localdomain>
References: <20241122143717.173344-1-demonsingur@gmail.com>
 <Z0Q3ukermwmPax2b@kekkonen.localdomain>
 <0ff25743-30c6-4c26-955f-c4c26578ebb6@ideasonboard.com>
 <20241125120725.GI19573@pendragon.ideasonboard.com>
 <d9bc8759-f6e1-4390-b873-2ecd3f64a135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9bc8759-f6e1-4390-b873-2ecd3f64a135@gmail.com>

Hi Cosmin,

On Mon, Nov 25, 2024 at 08:42:09PM +0200, Cosmin Tanislav wrote:
> 
> 
> On 11/25/24 2:07 PM, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 01:33:15PM +0200, Tomi Valkeinen wrote:
> > > On 25/11/2024 10:39, Sakari Ailus wrote:
> > > > On Fri, Nov 22, 2024 at 04:37:12PM +0200, Cosmin Tanislav wrote:
> > > > > When using v4l2_subdev_set_routing to set a subdev's routing, and the
> > > > > passed routing.num_routes is 0, kmemdup is not called to populate the
> > > > > routes of the new routing (which is fine, since we wouldn't want to pass
> > > > > a possible NULL value to kmemdup).
> > > > > 
> > > > > This results in subdev's routing.routes to be NULL.
> > > > > 
> > > > > routing.routes is further used in some places without being guarded by
> > > > > the same num_routes non-zero condition.
> > > > > 
> > > > > Fix it.
> > > > 
> > > > While I think moving the code to copy the routing table seems reasonable,
> > > > is there a need to make num_routes == 0 a special case? No memcpy()
> > > > implementation should access destination or source if the size is 0.
> > > 
> > > I think so too, but Cosmin convinced me that the spec says otherwise.
> > > 
> > >   From the C spec I have, in "7.21.1 String function conventions":
> > > 
> > > "
> > > Where an argument declared as size_t n specifies the length of the array for a
> > > function, n can have the value zero on a call to that function. Unless explicitly stated
> > > otherwise in the description of a particular function in this subclause, pointer arguments
> > > on such a call shall still have valid values, as described in 7.1.4.
> > > "
> > > 
> > > The memcpy section has no explicit mention that would hint otherwise.
> > > 
> > > In 7.1.4 Use of library functions it says that unless explicitly stated
> > > otherwise, a null pointer is an invalid value.
> > > 
> > > That said, I would still consider memcpy() with size 0 always ok,
> > > regardless of the src or dst, as the only memcpy implementation we need
> > > to care about is the kernel's.
> > 
> > I was going to mention that too. The kernel C library API is modeled
> > on the standard C library API, but it takes quite a few liberties.
> > 
> > What I think is important in the context of this patch is to ensure
> > consistency in how we model our invariants. I'm less concerned about
> > relying on memcpy() being a no-op that doesn't dereference pointers when
> > the size is 0 (provided the caller doesn't otherwise trigger C undefined
> > behaviours) than about the consistency in how we model routing tables
> > with no entry. I'd like to make sure that num_routes == 0 always implies
> > routes == NULL and vice versa (which may already be the case, I haven't
> > checked).
> > 
> 
> The following code inside v4l2_subdev_set_routing() assures that
> num_routes == 0 results in routing.routes being NULL if num_routes is 0.
> 
> if (src->num_routes > 0) {
> 	new_routing.routes = kmemdup(src->routes, bytes, GFP_KERNEL);
> 	if (!new_routing.routes)
> 		return -ENOMEM;
> }
> 
> Indeed v4l2_subdev_set_routing does not check if routing is NULL before
> calling kmemdup on it as far as I can tell.
> 
> We should probably introduce a src->routes check in the above code in
> the same patch since it already handles NULL access to routes.

I'd keep that out of this patch. Beyond that,
v4l2_subdev_routing_validate() is generally called before
v4l2_subdev_set_routing() and that function doesn't have the check either.
I think it should be added there. Of course triggering it requires a driver
(or framework) bug so it's just a sanity check.

> 
> We should also not limit src->routes to being NULL if num_routes is
> NULL, since it adds unnecessary logic in the caller.

-- 
Regards,

Sakari Ailus

