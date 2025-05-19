Return-Path: <linux-media+bounces-32829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB86ABC2B0
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C72C7A1655
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1675F286406;
	Mon, 19 May 2025 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGDqFCfa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4F1E32C3
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669194; cv=none; b=crLmdP6/ZzU5DCF85eF0WuQwnrHZL2/TnivNSemjzM8HdiHFSf/PB1OtjxRUsmsMbFxQeqrbCkgp7h8pZUbp5QxW/Koy7ujlJpPPMFLg0e7kLsAuBh+kEBJCe45WAiNg4r7EgYfgFS7Bikg/WV25ENVnOT6zP6qRbW3bMdyGR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669194; c=relaxed/simple;
	bh=x76n1Tv9ZW7E4BApp4Brk9GGaYCOkI4T9M+jWT/Pl40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+y3YuxEonidnANmkZ74OMBS/sGqawcesfe98wUrCPSpMh/IzaD0t/tY004mych20vkMLunKA2UDubE6fvUcq+5NhbO7aQFwV/Cj0zLz4F371HXzBYwdy3ZenIOUFwE50G1pJA1z0fBVVQBJ9iGGgEjj+irqBdkSUpPIIUyl0zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGDqFCfa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669193; x=1779205193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x76n1Tv9ZW7E4BApp4Brk9GGaYCOkI4T9M+jWT/Pl40=;
  b=BGDqFCfapN+MIH+QnjPAfHhCb5NRscZ8cfRDky5KQYqjZFwHyEKuw431
   pwhbwJJ/nZL1fbwMVuJNv/PjDpbptLI/FxutBxakScUf0R9SsSTkhj292
   ONhf2tAYcAX3y6rLdhtQKOBT9J7zkSXxBGHMf3c/Fkw+pcS4sHzc6hV1c
   t57itap7r2mDufhOW+hqna5E6MIdVtClsfPsmsFou/FFu1PABn3jzD5jL
   43RdUq6W0fY/yjCjiEMdDDoe9R9KOUaGpTW/rgtVtD/HE8B4w2sPY0YZw
   A3Sv51Cpn4lCY5xq7hs5YA9EaX+6Px5TSzNgu4R1xvLY2Vq6wAJSwOLLZ
   A==;
X-CSE-ConnectionGUID: dC9gvmR1QV6EAkQ25veiOA==
X-CSE-MsgGUID: xA1M3hb9S5S/8GgAv5rk0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49449533"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49449533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:39:52 -0700
X-CSE-ConnectionGUID: uTfu2hmbTzeN/9COXrhE/A==
X-CSE-MsgGUID: ViCEJCRURo+7Ge4F78l1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144658381"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.190])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:39:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 645FD1218BE;
	Mon, 19 May 2025 18:39:45 +0300 (EEST)
Date: Mon, 19 May 2025 15:39:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <aCtQwdduJLc_BhYG@kekkonen.localdomain>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-2-dan.scally@ideasonboard.com>
 <aCsq06etRXVRd2rn@kekkonen.localdomain>
 <ubyydsdcuks3io33kb35vd2w3gaxbak7qiwvfq6hxktixs6ywl@6r27hgvxwq5l>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ubyydsdcuks3io33kb35vd2w3gaxbak7qiwvfq6hxktixs6ywl@6r27hgvxwq5l>

Hi Jacopo,

On Mon, May 19, 2025 at 05:24:12PM +0200, Jacopo Mondi wrote:
> > > +| V4L2_PIX_FMT_CRU_RAW10 (CR10)
> > > +| V4L2_PIX_FMT_CRU_RAW12 (CR12)
> > > +| V4L2_PIX_FMT_CRU_RAW14 (CR14)
> > > +| V4L2_PIX_FMT_CRU_RAW20 (CR20)
> >
> > Could these be called V4L2_PIX_FMT_GENERIC_CRU_RAW*, to align with
> > V4L2_PIX_FMT_GENERIC_CSI2_RAW*?
> 
> Is this a good idea ? I understand the CSI2 ones are "generic" when it
> comes to both the Bayer pattern ordering and the platform.
> 
> The CRU codes are platforms specific, and while they're Bayer order
> agnostic, calling them generic feels a bit of an overstretch ?

I think I checked outdated patches -- in fact in the latest patchset such
formats are called V4L2_PIX_FMT_RAW_CSI2_X, where X is the bit depth. So
this question doesn't need to be answered. :-)

-- 
Regards,

Sakari Ailus

