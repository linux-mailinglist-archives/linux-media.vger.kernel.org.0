Return-Path: <linux-media+bounces-12366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A08D6843
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 19:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012B51C257E4
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 17:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA559171E43;
	Fri, 31 May 2024 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJCmQHrE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBB17B404;
	Fri, 31 May 2024 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177208; cv=none; b=AKSg9a08q1UZx/L9VrolXi2Qe5idmM1QGnq+cAfAf6N3TqkJ9rfz3yeosHu/Y8GXqWYvTP5vZ7HfoZJYL/6r8iicso6weoCpl2LXmypxXWTwFQ4CAEov5mYOm8U0i2JbpAiEWpUOaDj6qNuZK9sxtauOzEGGinyGBVAlVUNHHCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177208; c=relaxed/simple;
	bh=qHAXfFEKFKGq3Yv3wSMoXie8OCZa2iXuxYltvkZBuTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bu6d6WJtTCxsJVeuWeRzVJp8XP6AGpwhxKGxh/LaZbyc6m549YkJPJUndLT07Y1Y5bWzXCGN9E4ISLw6UQL7N9Fqqqx8go9vWGXDcSFefeBOLFiKa8Fc12/nLMcl8oQGddHyPqArm6Intch+AJx0e7m9u3dQ0yRJvx13OEbvfuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJCmQHrE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717177207; x=1748713207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qHAXfFEKFKGq3Yv3wSMoXie8OCZa2iXuxYltvkZBuTE=;
  b=lJCmQHrEaJNsrQ/b+nUqnkmvgrR91XkPVMkcFeX5spKo6BuL2MUVJLRA
   TbOmP3r+KS98U07uEL313iP/RzlZWUnl149Z7ypdujLEQc/TLiuZV8DLR
   aHCCNj+VPsb+apf8M89gBnvYOXDyLHgpZluKNNJonFpK5EAr73xV9zN3H
   Mc04Q84nkTdzua1+dEqIEBP53LNHOGvOOmyup2l5yFOPc5zt8M6Qcy2bJ
   VHIpof4sdkd5RuaptuBouLsWihWq81zeohe1Tgev14aphNtEnfBCdG5Vo
   AF7+8mDIOcCdBWE9Ppr1+lMTPUhNLKkQcAifcpwq3SqacI0gL3tf4+QNS
   Q==;
X-CSE-ConnectionGUID: wfGOTaGvQViwLZDfTE6R7A==
X-CSE-MsgGUID: 5GNq/v4sR4atEI7ZvN3teQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25135322"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="25135322"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:40:06 -0700
X-CSE-ConnectionGUID: Tn48T4ciRByXG/vYkjJ0CQ==
X-CSE-MsgGUID: F32f9jF0RqS2oElpByTLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36222086"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:40:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD6EO-0000000CXYj-3kba;
	Fri, 31 May 2024 20:39:56 +0300
Date: Fri, 31 May 2024 20:39:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
	dlatypov@google.com
Subject: Re: [PATCH v11 08/11] lib: add basic KUnit test for lib/math
Message-ID: <ZloLbHE6YJv5Eeyy@smile.fi.intel.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171305.1297769-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171305.1297769-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 10:43:05PM +0530, Devarsh Thakkar wrote:
> From: Daniel Latypov <dlatypov@google.com>
> 
> Add basic test coverage for files that don't require any config options:
> * part of math.h (what seem to be the most commonly used macros)
> * gcd.c
> * lcm.c
> * int_sqrt.c
> * reciprocal_div.c
> (Ignored int_pow.c since it's a simple textbook algorithm.)
> 
> These tests aren't particularly interesting, but they
> * provide short and simple examples of parameterized tests
> * provide a place to add tests for any new files in this dir
> * are written so adding new test cases to cover edge cases should be
>   easy
>   * looking at code coverage, we hit all the branches in the .c files

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



