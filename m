Return-Path: <linux-media+bounces-12020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A78D0EAA
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 22:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A3E51C21398
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1441416130D;
	Mon, 27 May 2024 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8DP9bwh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073485338D;
	Mon, 27 May 2024 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716842253; cv=none; b=qtdBMeZYXRnrnnI3RO4SUaEM5EHEGUeakCErSEBvu+s16A3xGc42NXtyWemrnSPoRoXsQ4sjUercEfLnjJ1ZOYRCprNJM+vJdhFbvpG/LIrgcxiLNNEjJGuWDBeVY8DymM8XLa4LVIpgXkVNyZa8ngVj0tiAd2CyK5t9kuPXj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716842253; c=relaxed/simple;
	bh=+oOwF+zgiQI2tqxIcVjxnOSLqyTdQlPcxUWF7PDS9cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw93iYXlf6KFTeRRlYx1HhjvyUucAdESYbXMRTmAus+l4ocZecFTKZTUPAFzTdIIBQyPvZW1d8uuj2OxSb2Vo/+DvZu5t2R4v4xvxC5TPZ0MgZV0dHO/lCY6fcLscmnsU5ftnynvsqW+ACBCVjfWz84xZ4us4PF/O1tLH52davA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8DP9bwh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716842252; x=1748378252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+oOwF+zgiQI2tqxIcVjxnOSLqyTdQlPcxUWF7PDS9cg=;
  b=m8DP9bwheXjunf3FjalmkI69MTTWf3znYrft9ANWa5n1NhohiyCzEPCv
   6XuxqsrqNT1O6bErEZIEPoKmQgeG9g2qYn2SAaUy9a8yiP5GoDb+FIjaG
   tu+dEn/9U6xXn7/gtNFNIJ3mvPqN0EiPLUIdi6iJBhDj7dXTFvbOSNtFw
   b7CewCXt9WPjV/16JlRMgzGQKbOBCUjxHKhP3teKPc757kSUL/69BbYpk
   3mxuPCwa7sCs5p6OGPJLTQLPyRfoPDZ9kaOzbYcZ9HQ4lle8EUc/yklUp
   HCbbhFF1weYlVYKASZNtppiL3eKsmLJSTl3AGJaKYm8OK+Y5kaUF4hlxu
   Q==;
X-CSE-ConnectionGUID: 8cEOh+CiSRO75IyNljabqQ==
X-CSE-MsgGUID: Ub+WqW/FTSeFIt7+P25Daw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13041899"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13041899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 13:37:30 -0700
X-CSE-ConnectionGUID: akO4TqpiSMOqR25nmy4sfQ==
X-CSE-MsgGUID: PiKUar/YQr+Tz2VpXZSpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="72261586"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 13:37:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBh5s-0000000BMjw-0e18;
	Mon, 27 May 2024 23:37:20 +0300
Date: Mon, 27 May 2024 23:37:19 +0300
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
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZlTu_9orsuosNiGk@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526180933.1126116-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:
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

+ math.h (where abs()/DIV_ROUND_*()/etc come from?)
I believe I mentioned that.

> +#include <linux/reciprocal_div.h>

...

> +MODULE_LICENSE("GPL");

modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().

-- 
With Best Regards,
Andy Shevchenko



