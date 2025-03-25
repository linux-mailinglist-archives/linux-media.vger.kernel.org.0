Return-Path: <linux-media+bounces-28733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE581A70743
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561FB16D999
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743DE25E833;
	Tue, 25 Mar 2025 16:44:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706772036ED;
	Tue, 25 Mar 2025 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921041; cv=none; b=IRU//9N37ETijcSg+j4xwhXXyqLYUjbYl6CaOFJD6sMb1yFsER8R/Rl72QO3o9Xm/fsbHd/QJcIXwCt5mTmtO5gPCihC/uf0J6Q2JmYfOneuT/Us6+uKmX+5trIc4+FbpFNSyPpDNFbQKkgjiEr0PdiCwA54//3Ek/g+nDk0BGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921041; c=relaxed/simple;
	bh=Gbih8Xi2Af6tZmvrq4gfJ7YjQoCvLiaSLdX8TcdTVQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdGibnfKII1YaJ/Zr0dIPQQ3O/Jm6j3FCnkLSSMSvL6WPNBFNWmCLMeSh9PPDWe77hyhbyZW8koGHSm9QrsiTizTEmX4go8ks4LsvYo0w4WbQ7bTuktrc6RYH5GbB6CIl8UChGPTka31bh+pcfMHJ5q3w71FBhMtkGo6pIaIHnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: mDw03IXqSPKUBm55KbDjLg==
X-CSE-MsgGUID: PddjiCYKTX+MEVB2+gpdBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44056232"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44056232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:43:59 -0700
X-CSE-ConnectionGUID: pJ09Zb0EQj63mOK7MbGjEA==
X-CSE-MsgGUID: qZG2yuDCT0q/aSXlejJBcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124380180"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:43:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tx7NZ-00000005o2o-3Ubn;
	Tue, 25 Mar 2025 18:43:53 +0200
Date: Tue, 25 Mar 2025 18:43:53 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/8] platform/x86: int3472: Add
 skl_int3472_register_clock() helper
Message-ID: <Z-LdSYeqmAKQ3eTr@smile.fi.intel.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
 <20250325161340.342192-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325161340.342192-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 25, 2025 at 05:13:33PM +0100, Hans de Goede wrote:
> skl_int3472_register_dsm_clock() and skl_int3472_register_gpio_clock() are
> 80% the same code. Factor out the common code into a new
> skl_int3472_register_clock() helper.

Indeed. Good catch!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



