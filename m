Return-Path: <linux-media+bounces-19035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051C98EDD2
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 13:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2C821C214FC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 11:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFACA17C224;
	Thu,  3 Oct 2024 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P65WPyf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11691741D2
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954167; cv=none; b=ak8Tnl9euAPT16T2T8UUReEfThmqwZxAeCS4P+HNp9UepI6kacgXqJkGjeL9FJBkSYmf5SBpiKzeK0w2AJLeKBeDqgidDe7TnMOhBumMo3Hjc73CdsWbSKC9pVv3j86CCO0L0HLmsmnpWGL60a/5VD4lnmfdrBgpj/WbN31QTD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954167; c=relaxed/simple;
	bh=aO88flmNcqBy+Ge1VzpEppby5ruXTZwkqiq0T47Bqxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3ctdBbFCLaR/j5m+Asbli+ix0X/loZ1WYuvsqRyja29EDr0TuPLICGj+pw6qm3Hj/6teHSz8WxX7DNyeKHXQJv1kr8ROvWpjz4Owqvb7nYMMOHxiWvx810ieYaVg7RwVGaTLff/B8EcUIL+lmlMhDu+pjn5tt1tWtGtTLEyh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P65WPyf7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727954164; x=1759490164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aO88flmNcqBy+Ge1VzpEppby5ruXTZwkqiq0T47Bqxs=;
  b=P65WPyf7wmSM0n5bWvb01J0VsYZwxKrVGFEslb4emWGozKFirSHB0M64
   bNcy0VozcG+A0AD0OrlO4VKuuD9J7vLVFbkBuXUTAomhn1/Iyo4el5RjA
   Xoq6R0QnEvJAgBVTVA+KnvvwvyBNSb7tr3MCpseLpn1uq2k2XtkzigDcU
   rtVIz5GpFrhe5zPwBw7cgnsroP9E13j+S4EA1hPp5YMBB4tAENZQawtPB
   qXeIjIB8Q0TNWW+SGxN+dq0evES+VEPnelIfarpS6MKp8Zp6SChyDY+Ze
   TT1lpPklWDJopg+p3j3PWpoUFFtxdAENdCl3bCJaQVjYZmlBaJenCRXdM
   Q==;
X-CSE-ConnectionGUID: xwbW8RYHSI2ju+f0zex0yQ==
X-CSE-MsgGUID: Wg9WySBwQM+Jm1UwEjcvbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38276939"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="38276939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:16:03 -0700
X-CSE-ConnectionGUID: RigjdOzfRq+BwALfqfmlyw==
X-CSE-MsgGUID: 41ke7wJ9SKy/wbK4QgNnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="73908061"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:16:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1EB6511F83B;
	Thu,  3 Oct 2024 14:15:59 +0300 (EEST)
Date: Thu, 3 Oct 2024 11:15:59 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, jianhui.j.dai@intel.com,
	tfiga@chromium.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Message-ID: <Zv587-LihwNQoQzU@kekkonen.localdomain>
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

Obtaining spinlocks and flushing the cache for a page should be rather
unnoticeable operations from performance viewpoint in memory mapping.

The result appears quite a bit more complicated than the original code.
Do you have data on the benefits of the change in terms of performance?

The old code was loosely based on arm DMA mapping implementation AFAIR.

-- 
Kind regards,

Sakari Ailus

