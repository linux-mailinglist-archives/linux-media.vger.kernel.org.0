Return-Path: <linux-media+bounces-36556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F1AF14DE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6CBE1C43125
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EF726B77A;
	Wed,  2 Jul 2025 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXNMyw2l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5624677B;
	Wed,  2 Jul 2025 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457745; cv=none; b=S1U8zrMaXznKF3gdXrfzlGD1pSyvQ378PMsKSDIi/YZ/fIe6PmY4uT7zUODEMiimmgM6YqW6ejgJVuACN4T115zYg8RaeVpMgiLRQ1TA4C22aIR2UQ4PBzWPdM7HmO91uKqBNI7J2lfoZF6aW3wj/r5j34oWd24N8Q5pJtNzT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457745; c=relaxed/simple;
	bh=42VgZdP5wD3p2krltYlSRi4BoSgy10tFflc3gkox/oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoeoX964dFE3/N325l1ReY++6tJ5LMpgs6sA7gEtDQJrumkqidWLi9M0qpz7/kLXMYdszRoGPsBsZKZ9evOzdQqk2Un7Pa9XqheB38uufzY/qImmyVHO8zCIHwwXNMDNGnj+/y1xNPE8OOwrCJ5cdsyIoXJtAWmU0w/kNQZOIyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXNMyw2l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751457743; x=1782993743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=42VgZdP5wD3p2krltYlSRi4BoSgy10tFflc3gkox/oU=;
  b=mXNMyw2lV6V77x2SNatWO/AiJPqiWuFWrBWfFn+eV6CvERqcOHVuNLzd
   rV/JM+OPiufAxcd7fyoYUvDg3+v+m16sVl5n0D2RJ3mlYTI25h618GL8m
   VyVJttb0M1uOIotRYRpGpn9iv+k2L8ZbffYgxKVyGxkRVfLsDrgc3ToxG
   jHW4inHAwww2POBIPtJkHqBoaGpHZKrXBmMoCIyZTjCG5nHGq//c0Jgpk
   Ip/5dKg4N2XVJTMTq2EV1T/jyxAyf7KR8aLYTjN23tQGx0zN2UkYr8Xys
   me5D0fIvIeTTPkUJSTIhjt+/mv2iDQQMXqvkeyyvU4IRWsgQSH2pAg3nz
   Q==;
X-CSE-ConnectionGUID: ytN4ZPEPRbycK2JRv2VRCg==
X-CSE-MsgGUID: PjayWI/YSDC+aSOk2qwQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53890188"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53890188"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:02:22 -0700
X-CSE-ConnectionGUID: 1NGiTVOrSr6LDrAYu/jtMw==
X-CSE-MsgGUID: YK4fYZyxTDq/TS2Qr+Wzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154130063"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:02:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwAK-0000000BuV6-2yH2;
	Wed, 02 Jul 2025 15:02:16 +0300
Date: Wed, 2 Jul 2025 15:02:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, hans@jjverkuil.nl,
	hdegoede@redhat.com, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	bingbu.cao@linux.intel.com, dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v4 1/1] platform/x86: int3472: add hpd pin support
Message-ID: <aGUfyFHaisDyM0PV@smile.fi.intel.com>
References: <20250702112130.858536-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702112130.858536-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 02:21:30PM +0300, Sakari Ailus wrote:
> From: Dongcheng Yan <dongcheng.yan@intel.com>
> 
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



