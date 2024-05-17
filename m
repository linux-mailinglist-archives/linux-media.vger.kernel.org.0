Return-Path: <linux-media+bounces-11623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468B8C8D39
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 22:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1968628897E
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 20:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCA0140E55;
	Fri, 17 May 2024 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnPeFEJF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B265F;
	Fri, 17 May 2024 20:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715976880; cv=none; b=EcQMHa6R1u7TzicfGhKL70s1qM7924pLVkilFz0AUY/i3tZ316RfRWslhY/Q0WrbcW+PbUq8IpKwdcVb1zQJAsaA+YlXJo1e3sV5hylpQT5OuOl0nIy6BTN+B1HMbKIP63Zl85h58JjwjKz7BC4VCcLP7dwCVi6G5Jq+3yJQUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715976880; c=relaxed/simple;
	bh=CMo0WJMBF0rNZkT1/Sd8atUX0pOmKxbrbHh8DwrNGLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYL2QI1OFasMfEMpuFZpGUPEUZW/45wj1BLc38VlWvODOWUpDfRvm5r1i+XHeD7fQRVtofW+U967NbGnaJj31V9txQUtaMG3EzxqV7bYDGsi3OWGNDYTAY8m9CL3Q9IlGhYckd9D+Am3bA75X2xv1oc1Wmw91Aha7igDeIo7za0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnPeFEJF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715976879; x=1747512879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CMo0WJMBF0rNZkT1/Sd8atUX0pOmKxbrbHh8DwrNGLM=;
  b=SnPeFEJF/Wq8eeLncbQick1leaqbI/KiQGFX+wFcJ9+hIz5wHlmO28+9
   7wZIpnjiCnHUGhzDGkI/WlqtOqXaBUtLOgpRB3HxwfyZ2vAnMzT8juAx2
   tTMoriFBT5lPTSOIFhZmxyILYy8W+V6uxQydGfBXinN0q7N1jUSBFVEd5
   KpkHa/gIqnYzvUH+C6J65AeYmcs93xwhjstglNrWpYavlPBbZvKhzCGv+
   ptWf5hOhBFfyfZxOJnNPp9xxcn2nbk4yjF6OMU8e2Ui+04ClDHIRBSJKS
   42stdx06DN1j5eUvizPACU+khEMFnHtOjqoH8BeoFFwKMcKsVzuN20Fo+
   Q==;
X-CSE-ConnectionGUID: y2xfiRD3TyehnWHiQBXcGQ==
X-CSE-MsgGUID: cj2/mlLoTZCD93xhVNqGbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12363857"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="12363857"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 13:14:38 -0700
X-CSE-ConnectionGUID: uQN1YsdERpalYkIRHbnWkw==
X-CSE-MsgGUID: VzG7v7+/Rdy7n3ygv6cxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="62739448"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 13:14:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s83yG-00000008cHX-0b7U;
	Fri, 17 May 2024 23:14:28 +0300
Date: Fri, 17 May 2024 23:14:27 +0300
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
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517173607.800549-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:
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

> [devarsht: Rebase to 6.9 and change license to GPL]

I'm not sure that you may change license. It needs the author's confirmation.

> ---
> Changes since v6:
> * Rebase to linux-next, change license to GPL as suggested by checkpatch.

Note, checkpatch.pl is not false positives free. Be careful
with what it suggests.

> +#include <kunit/test.h>
> +#include <linux/gcd.h>

> +#include <linux/kernel.h>

Do you know why this header is included?

> +#include <linux/lcm.h>

+ math.h // obviously
+ module.h

> +#include <linux/reciprocal_div.h>

+ types.h

...

Other than above, LGTM.

-- 
With Best Regards,
Andy Shevchenko



