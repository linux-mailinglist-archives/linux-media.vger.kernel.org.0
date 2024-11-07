Return-Path: <linux-media+bounces-21034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 618769BFFB9
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 070F7B230B6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988081D8E0D;
	Thu,  7 Nov 2024 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lk4R+Qqm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC61D7989
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966973; cv=none; b=uzb/rpqMjzqWwsp389UghbvV6yUa+3O5xvG03trC4zU3vTJfrLXdrozjFN43YVrLGyDbLQv6X+gs7sYh3rSKjnxE9NKU+wOERs21X6FrLFlknQ6MwdSGNHshWQWMiwaffAwfFrBF6Ed4AmZ5TSYHA3yl1yYfI7CB7b2bDxLhcpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966973; c=relaxed/simple;
	bh=XFz7GJZI6EnHTM4OFuC+VtVaJ2KZQWBeH0wd1hbKGiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScfEZfChMNDBrPFFabmwAeI+N4oXENeayrPwPTxK26G9YzrchOSSg7dRSRvT0aAg0dCj/nj9rXu1RIBtPQyr1J90MdPJdici8+jtTykZgohCaBxsmcBtIMy7nReIJCdpFI64/wZA8MJx22iTaRvu4E0jVAXAiLg7o+SMsoEHST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lk4R+Qqm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730966972; x=1762502972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XFz7GJZI6EnHTM4OFuC+VtVaJ2KZQWBeH0wd1hbKGiI=;
  b=lk4R+Qqm8fZLE3YmrXGEXnwp7vRe/lU/6Bka0suWYaqg0KqocNreGtuE
   DvZo3Xw2h4MNB+j+unFstEqPaVObdmr8prlfFDH6CtxNJov27l8dlgevS
   JsfnQsZWDnJ4GGm0cFCEqhXj6U+b3cWnLDnFzWRzQjrVMmoMviuBNtsay
   dz4ZeG57W5N73kkUkm2M4y6FesCgfwg7MdjhvYfVJwJpGnvtyZfVxswmd
   NCRwn2ikg+yfnmP1zasVyoeSU+Zm5HOmfi8lHJ90NP0GQ32Me5wJEFNvx
   AwonFzy7dqZKnK5X9ATHdgwXX4pqBfYfuUSml4mnq7eg6dTrEdWAUfBjb
   A==;
X-CSE-ConnectionGUID: 0lptXQJwTOi00oFu9QfX9g==
X-CSE-MsgGUID: X7r/0NK+RC6jM/bvHjwkig==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41349999"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41349999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:09:31 -0800
X-CSE-ConnectionGUID: MgbSGD6xQAqnEjJidC9FpQ==
X-CSE-MsgGUID: ugGMK3FiQBCfex+Z9wYDzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85160486"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:09:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8xa2-0000000CBGR-37R7;
	Thu, 07 Nov 2024 10:09:26 +0200
Date: Thu, 7 Nov 2024 10:09:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Avoid picking too big sensor resolution
Message-ID: <Zyx1tlwysnNJmcEi@smile.fi.intel.com>
References: <20241106215509.40205-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106215509.40205-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 06, 2024 at 10:55:09PM +0100, Hans de Goede wrote:
> atomisp_try_fmt() is limiting the width of the requested resolution to 1920
> before calling the sensor's try_fmt() method. But it is not limiting
> the height. In case of the old mode-list based t4ka3 driver which has
> a mode list of:
> 
> 736x496
> 896x736
> 1936x1096
> 3280x2464
> 
> This results in 3280x2464 being selected when try_fmt is called
> with a requested resolution of 3280x2464, which is not supported because
> its width > 1920 .
> 
> Fix this by also limiting the height when in preview mode.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	/*
> +	 * The preview pipeline does not support width > 1920. Also limit height
> +	 * to avoid sensor drivers still picking a too wide resolution.
> +	 */
> +	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
>  		f->width = min_t(u32, f->width, 1920);
> +		f->height = min_t(u32, f->height, 1440);

Perhaps umin() instead of min_t() in both cases?

> +	}

-- 
With Best Regards,
Andy Shevchenko



