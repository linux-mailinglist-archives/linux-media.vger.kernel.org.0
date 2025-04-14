Return-Path: <linux-media+bounces-30112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B32A879E4
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9372B1890FDC
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 08:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7407D259C9A;
	Mon, 14 Apr 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blHz6bGV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2531A9B49;
	Mon, 14 Apr 2025 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618274; cv=none; b=nrieJZ2V/EimlFhcUqgGUF1sJbuPL0H22LeFdEfpEHWepUkSI187d33YI2o5CJemSQkSVdW5SA6dyGHYQz0c5PWUcY+y52+naCLhlo3U+Ue6ity/Xvo3+7D4b+F/j27GMPSAXwLIltp2ilgwqcnytXPqya9AX48QBgCtBwptZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618274; c=relaxed/simple;
	bh=XNUzHoBdEDWGdV/RLxbr8oT+QBseJbzPEo7a9/FHdt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao8MmZr70TNjCxq8ecBdvNsAQLu33CjQffdewMT0MNjsBmvWNvMnKOiMECqfnRBFn7ANK1SH2tDe+fTtXiEnAU5fZVP0fKckHelIUTgyhA2E9FpBqz6gm7g4cdh6QqjDYW4eaJLv1oAckstoch27ZzonJI0AsJqd/NvCOa+Satw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blHz6bGV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744618273; x=1776154273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XNUzHoBdEDWGdV/RLxbr8oT+QBseJbzPEo7a9/FHdt4=;
  b=blHz6bGVkDgigdlrNG7pxIEFkyWDuXFvqE8BcegkpmMyiqzih5Vrga9L
   ROydfA2t0WA+4U4Ye3911mpOcQ3Nbf8pGX5HS7VgbDevgciM1bAwvKcEV
   JqxHCcztByvCpNH+R1EpQLdchYUTBz6SxEXYO9eUphBsaW85UBVCR/m2R
   /inndEQoKL7sE7uEEvnYZbvNNNp+xUb13/uiIxQC2d20As17Z7mZqrvlp
   NFK2Wj1E+arF8Tw50RsftQ8KgbUBaYnHudzl/SB/DNxpl+8s7yMIlxjJx
   fB1ho+GktfW/o6ICZzBiY5mBtYC35HRb2Uy9yGDupF9NDvLNVGhlCvKHG
   A==;
X-CSE-ConnectionGUID: 8lc3X6EPSjasCM+noO0GGg==
X-CSE-MsgGUID: G0WVMkjOSCy57XT/9zf69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45309648"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45309648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:11:12 -0700
X-CSE-ConnectionGUID: CjSKdSSrRHGFjdtesd+hcg==
X-CSE-MsgGUID: 6a+Y5wWST1G1Qr9Jh/Cb1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130289335"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:11:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4EuH-0000000CAns-3pd6;
	Mon, 14 Apr 2025 11:11:05 +0300
Date: Mon, 14 Apr 2025 11:11:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, stable@vger.kernel.org,
	hao.yao@intel.com
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
> On 4/11/2025 4:33 PM, Hans de Goede wrote:
> > On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:

...

> >> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> >> +		*con_id = "hpd";
> >> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
> > 
> > This looks wrong, we really need to clearly provide a polarity
> > here since the ACPI GPIO resources do not provide one.
> > 
> I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
> driver can pass the test and work normally.

I doubt you tested that correctly. It's impossible to have level triggered
event to work with either polarity. It might be also a bug in the code lurking
somewhere, but it would be unlikely (taking into account amount of systems
relying on this).

Is it edge triggered event?

-- 
With Best Regards,
Andy Shevchenko



