Return-Path: <linux-media+bounces-25460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4EA23CD3
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8A171887210
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FE11BF7E8;
	Fri, 31 Jan 2025 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElXTjVvs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792331B87F8;
	Fri, 31 Jan 2025 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322651; cv=none; b=eSHXXyTXxYYKbSmjgD2mvMd7EUBr4wHtbdXeJZNeBBirSTLtVI+OG5aj4cGtchN/jwyo3aJ2z9idDlplMtLp3TGWFgrjEnPlVrnpKyjY4fc15Ya2cOjqNvsKFj2QrDJ9bzIWPDfOCt6IhvAGF8IZkOTAYDBFSFGXa7EBhLrVW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322651; c=relaxed/simple;
	bh=h6qa2k1WW3uz+PAmFMZrhcU5GzXKEs6+pljzPtitg40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQrnGIFUMtH0msH93KPGFgqgaIPupNaYBUY/DwauzEM+im9dwkcwt7j295s7HPtVrxNOqXTwvirlMZYew0MlHNJV0L3iDy+WM/f51iuWXslmVbRDl8kop+prLFdDC0vDuhjaZIXddT/Fd/2zlE5rvqHxUjdekW//Em/2YuP4CPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElXTjVvs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738322651; x=1769858651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h6qa2k1WW3uz+PAmFMZrhcU5GzXKEs6+pljzPtitg40=;
  b=ElXTjVvs/gaVRP17UPZHxA23B+/O3u8T1XZfR22mZVQJhqXWDRnKg8mh
   M1QO5LGtE1mRCJT5ROgU5p+1hMO5Ipoxi3+lx7IPCMjqwE5j+DengXQ3L
   3MC8Zm4wKTmi1q++vY+gTsyNXmwu29gPmGOO3ofOKcblYVb29lTSsaSuA
   eUgvVETPwHNrloKxRQFD4dFhS1eMA97cd5S/uJoy1eyqK3U/3Y2kSLYrc
   jghxufydFY17MngHp6tSZIAahbRcVwJGPBePiBSDEfEOYE/bdo/IPL59Z
   lbGbbh4L5Nf6Wlp8G/EpESiyPnL9K2KDot3yxtgJw06wpf8JUZvqDuqkn
   A==;
X-CSE-ConnectionGUID: iYD/ikyUQMmlZKp8bh128Q==
X-CSE-MsgGUID: 6Tx30p4RRXysofAxgqwKNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50274126"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="50274126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:24:09 -0800
X-CSE-ConnectionGUID: bYejQYpQSmCCBKR0RLRs5Q==
X-CSE-MsgGUID: c2KQCOvJTiS1eT8DxT9a+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="114611369"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:24:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tdp80-00000006wzt-0pm0;
	Fri, 31 Jan 2025 13:24:04 +0200
Date: Fri, 31 Jan 2025 13:24:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/3] int3472: Support GPIO con_id based on _HID
Message-ID: <Z5yy0-0pZWeYaHdJ@smile.fi.intel.com>
References: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 31, 2025 at 09:37:04AM +0200, Sakari Ailus wrote:
> Hi folks,
> 
> One patch turned into a set, the second patch being the original one.
> 
> since v3:
> 
> - Add a patch (first one) to switch to unsigned long type for polarity
>   field and renames it as gpio_flags.
> 
> - Use a polarity_low boolean field for indicating the GPIO polarity. This
>   is turned to gpio_flags in int3472_get_con_id_and_polarity().
> 
> - Put the new polarity_low bool field next to the u8's for better struct
>   packing.
> 
> - Add a patch (last one) to rename "func" as "con_id" which is used
>   throughout the GPIO framework.

With a comment addressed in patch 2,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



