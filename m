Return-Path: <linux-media+bounces-12274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F076D8D5242
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD401285339
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF5F147C74;
	Thu, 30 May 2024 19:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKXyLldW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E0912FB20;
	Thu, 30 May 2024 19:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097008; cv=none; b=FZFts6y87VOuv+nV8Z6cLsRAGwBq5wH/YwIz/FmgViGBsTt5Z8UgkCgAF5c8C1dKFgCKR+oWK8+CiB9/h4/sJpYvMcHnX4OyUMhNZE0UZLwHqqa7b6FghxI2mG3MwCBAtn1WvOn+NnY1+WK8CI4BSTgSZOk6DDrzbVatxtCfr0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097008; c=relaxed/simple;
	bh=ihTJ7uLAXuHoHPzWTTChN0zHhWzqJH5AOQTbqp1Yttk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8c5bxUOL0faSyNqhtxhq1YCuQ3mj9m5a2xM8cGvgDpDCY+Af2Tx9KCypPr5f/KAunjZGqiVUn2SG86LNg0qmc7Nlmihskf1k6BRdu+0r/dn5N3Yf/SB11pMXOB6NkrrYwN3FliQcBrMNB02l0kylF1t8YKPYaBn1TdbUxSlwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKXyLldW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717097007; x=1748633007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ihTJ7uLAXuHoHPzWTTChN0zHhWzqJH5AOQTbqp1Yttk=;
  b=jKXyLldWAO3Bys753PFix8wJse5eSjMLHHN5En6rNmCHKXkeoY6uiz3d
   4/3+Lrlj6HewLIVQvDM1AcJDzZCatD7cmI5EEJcHynoFIPhvTWi0WnI7B
   tbjwhtMwtZRqCNMN7Gg1RC7Mw5+ZK9PvvGjGLVnFRRf9//zdUjsRMeCIC
   Mn9h+lvSdSr0oQYHfIhH/3A1Zw4vOCrkMNWh4T2Ym87PMy70/nq481Vh6
   W3r33TkZK41+SOyzwbF6DrfOUvZoR8E2Jyt053Hhcs5vbbYhJTK3zS3WI
   xuPe3v9dRzlUjtLT+sBq/w7M/NHrkNXPzX3fGh4PjqqpMhwigI9FdmVld
   w==;
X-CSE-ConnectionGUID: FRdCDmHfSi+xvoJfBhlz+w==
X-CSE-MsgGUID: u7z6jN8TTP2KNnZbxRAPeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13569046"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13569046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:23:26 -0700
X-CSE-ConnectionGUID: E4kHBywfSC6jYb+ZzM5PAw==
X-CSE-MsgGUID: DAyMgrvrTMq/lWdTxpsO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36002442"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:23:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sClMr-0000000CHV4-0P88;
	Thu, 30 May 2024 22:23:17 +0300
Date: Thu, 30 May 2024 22:23:16 +0300
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
Subject: Re: [PATCH v10 08/11] lib: add basic KUnit test for lib/math
Message-ID: <ZljSJJtI-ADTUoc7@smile.fi.intel.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171810.2764623-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530171810.2764623-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 30, 2024 at 10:48:10PM +0530, Devarsh Thakkar wrote:
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

...

> +#include <kunit/test.h>
> +#include <linux/gcd.h>
> +#include <linux/lcm.h>
> +#include <linux/reciprocal_div.h>

Really, you ignored my comment a second (?) time? This is road to nowhere.
You need to update the inclusion bloc in accordance with IWYU principle.
I see a few headers are missing.

-- 
With Best Regards,
Andy Shevchenko



