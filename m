Return-Path: <linux-media+bounces-19981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E49A5EBD
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 557BE1C21643
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55AB1E22E8;
	Mon, 21 Oct 2024 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsN3+eze"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A161D0F76
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729499786; cv=none; b=lq2G9x7B48orTPOkzCs3QmEL3gQLUz3XedE3PX+kAT2NSYSdJ1Wdv/u5WX/Y7VsBNetEGICw1sqVz3gzvZZEm/hGGCFfFHN+IMa/iIkDJ1F6ie4NR34PCvbgmVBCA25FepFeY3lkoO0t6s75LWu0heIHNaRUT8KFF65rt6BXUbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729499786; c=relaxed/simple;
	bh=5QPWY8hJSs3khNwP5pf5EIaCYHF+tMeItgtX7KVb+e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMydVJgotQEsBybrrYleJZ/KVFZGB3Tzl2g7HPzJa/KAxyAiATOknCf9++ZvtHY+R6ZgaHQX6xVB+UGFh8QQqezBFqRTzWaDsw0sQHvhH8+a+Wvw8feGRM6ifVCiYNRqJCzoOS65u7eY39fsG9gxDZGsw8dnYGGvqQKt3mklusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsN3+eze; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729499785; x=1761035785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5QPWY8hJSs3khNwP5pf5EIaCYHF+tMeItgtX7KVb+e0=;
  b=BsN3+eze5Ji8yr6nobtVZwNsSfc5TJl/iF9KAAYrVqwjJeiWSM9vbQwm
   H7vsAD2o4fDN+jLnx67iYacsszz+6odgEMEGjn3x6APAK+YoXGHR1xcp1
   wk6yLvpWnJO7ajLxlFCZdUztDCZSH9F318WuXnPYIpv+LNrCBe3T6x5J8
   p6+Ds6pLVH4wGdMe+/45WQemO6+n7jnIjdZm7QTGlP61SgepfncdFLef0
   K/BrAKbv4ok/btf4vo+MhbGW/b5rt04ezWiJlw1+sJfKUsP1nH0YJPfnT
   WfsMncNzvMCjGH6dgCtekO/gURhw9pIInoVyzfZZUiKUaGiZqnAxswI/u
   A==;
X-CSE-ConnectionGUID: 1AkuJOioTIykb3Npzyks2w==
X-CSE-MsgGUID: qNDY5bziSn6g6k9Srovi8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39510544"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39510544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:36:25 -0700
X-CSE-ConnectionGUID: Rf8g9kvSR/mKG1dALMxq+g==
X-CSE-MsgGUID: LPkpLCErQEGv6SnLev8b0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79397101"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:36:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3EEA411F7E7;
	Mon, 21 Oct 2024 11:36:20 +0300 (EEST)
Date: Mon, 21 Oct 2024 08:36:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, jianhui.j.dai@intel.com,
	tfiga@chromium.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Message-ID: <ZxYShNcSzFMwap6G@kekkonen.localdomain>
References: <20240816033121.3961995-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816033121.3961995-1-bingbu.cao@intel.com>

Hi Bingbu,

On Fri, Aug 16, 2024 at 11:31:21AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> ipu6_mmu_map() and ipu6_mmu_unmap() operated on a per-page basis,
> leading to frequent calls to spin_locks/unlocks and
> clflush_cache_range for each page. This will cause inefficiencies,
> especially when handling large dma-bufs with hundreds of pages.
> 
> This change enhances ipu6_mmu_map()/ipu6_mmu_unmap() with batching
> process multiple contiguous pages. This significantly reduces calls
> for spin_lock/unlock and clflush_cache_range() and improve the
> performance.
> 
> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks for the patch.

Could you split this into three patches (at least) to make it more
reviewable:

- Move l2_unmap() up to its new location.
- Add unmapping optimisation.
- Add mapping optimisation.

-- 
Kind regards,

Sakari Ailus

