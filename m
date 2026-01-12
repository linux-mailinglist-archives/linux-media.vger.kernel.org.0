Return-Path: <linux-media+bounces-50451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA77D122FF
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BABB308F188
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9B33557EB;
	Mon, 12 Jan 2026 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJA5Gw7s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F4429D28A
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216077; cv=none; b=eNQm2hxmQu1/QCeHvKNr/PqATKZduetfdp4imOkAs5oKvTokEtFSzRz6BXjT3Aaqr0ya1pWU2j+3c966TI8LKiNdlzVu8YJhv8jmLYcGz4UgNzmjVgpJfyWb2TXc8lXdGJCo7OwXbUsRiMgLIspQYVnwk/dmY0tG25WKS3Rv4jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216077; c=relaxed/simple;
	bh=wL5pfyxkQcs4M1kNv6XDqT4LaSJRVKi9JIa8/RPVs1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP2nkgkCDZkAgVmzYGzKOj1WHVuF6i7m9rYqvHckaKWM2nzvGhf7cnaVsfBdu4z9U1uwrLt/VRGiRU2EDzlHpSrQqajsrYg9ib3zIbH7UvNbIjZ505xYQkXGLmwBSogfb3xmf5qPrHk9+Y/a7MfcwkmYy+PzBf/f2f9/se16+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJA5Gw7s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768216076; x=1799752076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wL5pfyxkQcs4M1kNv6XDqT4LaSJRVKi9JIa8/RPVs1s=;
  b=RJA5Gw7s1bCujVK+fMVO7o/YME6Bw9sTQpIuQ4YohPT7WGhzzrDDsCIE
   RD75yTl3PVilkRSSWz2yVh+3CRkuHwsJEFyEg9pSpTy4ktknNdNF/d/3n
   XbKoCHwLKLm4kL1Kt64ArOr+zhvJdjIx10Ebxb8i4aQqEMrt+xanmHmOT
   u9J5FCs3wLMGC+7GfRQI8E2m8UdHvpprWxYlzBcucv5xO02H9P0jyBHV5
   SozGmY9P/J9esWW7YndcqN3o93br5z3VFvZCGO5Ud8w7FU6v8ILSguCwT
   8lZPlhuE9Ai8UUWdLOK36YUvo/VifQ3BwbBvLhPhpgMPXH16XbeQo/nVF
   g==;
X-CSE-ConnectionGUID: YuZAthLiTNya4S9Is4r+DQ==
X-CSE-MsgGUID: NcIQRFraRAC2DQ4U1XNMgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80854598"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80854598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:07:55 -0800
X-CSE-ConnectionGUID: i6c2ivpHR5G6kqz9LP2bBw==
X-CSE-MsgGUID: aGz9GssJTzOMVsLi55hC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208542668"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:07:52 -0800
Date: Mon, 12 Jan 2026 13:07:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Unix Antigravity <unix.antigravity@test.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with
 v4l2_rect
Message-ID: <aWTWBksLJcxg4W6f@smile.fi.intel.com>
References: <20260112102518.19926-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112102518.19926-1-karthikey3608@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> Replace custom struct ia_css_region with standard struct v4l2_rect
> 
> to align with V4L2 API.

...

> -struct ia_css_region {
> -	s32 left; /** Starting point coordinates for the region */
> -	s32 top;

> -	s32 width; /** Region resolution */
> -	s32 height;

This is not equivalent change as the last two members are unsigned in
the generic data structure. Have you been able to test this on real HW?
Independently, you can audit the code for the multiplications and
divisions when the result put in these fields or the values from this
fields are in the calculations for others.

> -};

-- 
With Best Regards,
Andy Shevchenko



