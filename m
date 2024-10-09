Return-Path: <linux-media+bounces-19327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D67F996CEE
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 15:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B65FB1C21DB1
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 13:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BA919995D;
	Wed,  9 Oct 2024 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILNxtnGw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE738DE5
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482294; cv=none; b=G/GeNsv/4h42j4oB+JmJ7hN3ks9gpCUYjMZKsgTZsJPn/ExPSm0q3jN+uGbTVRXOifDh1BOnGVEDAgjwGskz03FfQjYG8LGiHX6xK/Jg+Kfr/5P3YADfEJ8OkH95S7Q2FGzlxAspYM3f7fvOqfk3ZpHNaUKz3zFq9dg8yAMgZsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482294; c=relaxed/simple;
	bh=E+MuK4Bi3GUUO1+LKmhcKdISs17HERl3pUHfgJ5Nkxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh3TXbK2wuKV6FtE9lUr4KB/uRwOsJU7gxog4ZgjRUijGMDIYLHg8m1i9Hgs/3AEHd7WLXWyZ7vvuQ/oT3IWtJ4Yt4s7oO8A3n0RNa7bT2Q69wPe9c6vfdKqhdGAIj8Q3xiUpVpVKKrFem6o9fvCOgJlFqA2ckIKx0UvcsoIyzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILNxtnGw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728482293; x=1760018293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+MuK4Bi3GUUO1+LKmhcKdISs17HERl3pUHfgJ5Nkxg=;
  b=ILNxtnGwFC1dZqpViRmNdQCBJwoJYV0adC3OByTNPLiM95QUM4wS2IYb
   6+vauRrkhh15x6c0umgtZPDr1tjth+uwhFoi71EUTO5ERyz4qlaYNoV1n
   BcBmp4W09o4P1vY0bQ9ImCkQBFAFFI/lQ8BPUp+kG3QFBxFspKXDmIkI5
   QYE5TSe9Gu6/3wAxkfGiNhUojCu2xMuJQPeu+RPaXgvtbg0Xl2e1A/Xf8
   CmJ+yga3toFZbxPVMESUr+fNaNiIuRra0u5VSohKA2BDsqwW/fCHMycr2
   sb8YII2qW3nDjwgk2bt4P/pNoJuvihxx1CQ4zt7lXFn0/ahfZGmzm3jSe
   w==;
X-CSE-ConnectionGUID: 6i2GNj4wQZqObhxknha5XQ==
X-CSE-MsgGUID: C1OXCEWIQQ+nqk27XtraKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31677828"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31677828"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 06:58:12 -0700
X-CSE-ConnectionGUID: Ldg6S32IRfu/O2PAZe9oWw==
X-CSE-MsgGUID: pe/mIkM1R3ybNKrzx10+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="81061891"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 06:58:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syXCa-0000000197G-2Fyh;
	Wed, 09 Oct 2024 16:58:08 +0300
Date: Wed, 9 Oct 2024 16:58:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2 1/2] media: ipu6: fix the wrong type casting and
 64-bit division
Message-ID: <ZwaL8PjcooDLwZgY@smile.fi.intel.com>
References: <20241009052031.2798618-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009052031.2798618-1-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 09, 2024 at 01:20:30PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch fixes the build errors with `i386-allmodconfig`, the
> errors are caused by wrong type casting and 64-bit division.

LGTM now, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



