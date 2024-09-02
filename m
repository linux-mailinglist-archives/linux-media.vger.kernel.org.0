Return-Path: <linux-media+bounces-17347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D859686ED
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFC391F233C8
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7E71DAC5E;
	Mon,  2 Sep 2024 12:03:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159EF1D3188
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278613; cv=none; b=JcDD3wAqt3xwkFF3Rd5RhFV56iYwoHRW8q02Ovki6ITvoR2G4ClbJp1yVFNq7TIuSsw2CXZdY2eGwetTGhvX39G5z1C3f3h3lXZfjWsH1S0sD6csTYb3OmxAoeerPWjCecEXfuDu+OBQ4xHvanT/5DIQVJ+acfuvG+uVhqWQNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278613; c=relaxed/simple;
	bh=Taemrw4fqFCKk6qN18uIAV2L6vLMtx7FoBkqF8DXpl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIDDha0smLFWI+WA7qrjINl6nR7JUO/Du4sjHfkc/aDjrnMLzZCSJInA38DwLyAW5T1nTesxqtSDR46NZmSdVy3KnGk15gwtIZUo9HtQ9Nqkme34uUG9wd4ukeqX/zwutZnWzpPixQ0OIKE6KHCWfkWQsL8o/Gy3PYUEaCQMAqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: +90QqBjrR8iqE2WsEUivmg==
X-CSE-MsgGUID: 5XbtWE1nSKKurFTM70WhEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23730116"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23730116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:03:30 -0700
X-CSE-ConnectionGUID: lwDwsCYtRou2U65E8RdkbQ==
X-CSE-MsgGUID: k8tewiwwSMm+CJjbPZGSRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64409227"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:03:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl5mF-00000004Lor-1IwB;
	Mon, 02 Sep 2024 15:03:23 +0300
Date: Mon, 2 Sep 2024 15:03:23 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
Message-ID: <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
References: <20240902095229.59059-1-hdegoede@redhat.com>
 <20240902095229.59059-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902095229.59059-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:
> The atomisp firmware contains a number of different pipeline binaries
> inside its firmware file and the driver selects the right one depending
> on the selected pipeline configuration.
> 
> Sometimes (e.g. when the selected output resolution is too big) it fails
> to find a binary. This happens especially when adding support for new
> sensors.
> 
> Improve the logging when this happens to make debugging easier:
> 
> 1. Replace ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, ...) with standard
>    dev_dbg() calls so that the logs can be enabled with dyndbg
> 
> 2. Do not dump_stack() when this fails, doing so adds no useful extra
>    info
> 
> 3. With the dump_stack() call gone, remove the wrapper and rename
>    __ia_css_binary_find() to ia_css_binary_find()
> 
> 4. On error use dev_err() instead of dev_dbg() so that when things
>    fail it is clear why they fail without needing to enable dyndbg
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note the log messages could also do with a bit of rewording and
> reflowing them to put more arguments on a single line to use less
> lines. I consider that out of scope for this patch which already
> enough (see the 1-4 enough) something like this should be done
> in a follow-up patch IMHO.

Yes, but...

...

> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
> -				struct ia_css_binary *binary) {
> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
> +		       struct ia_css_binary *binary)

...for example, in this case you touched both lines, so making them a single
line just reduces the future churn.

...

> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
> -			    "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
> -			    descr, descr->mode,
> -			    binary);
> +	dev_dbg(atomisp_dev,
> +		"ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",

> +		descr, descr->mode,
> +		binary);

So does this.

...

>  	/* print a map of the binary file */
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"BINARY INFO:\n");
> +	dev_dbg(atomisp_dev,	"BINARY INFO:\n");

TAB instead of space.

...

> -			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
> -					    "ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
> -					    __LINE__, candidate->enable.continuous,
> -					    continuous, mode,
> -					    IA_CSS_BINARY_MODE_COPY);
> +			dev_dbg(atomisp_dev,
> +				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
> +				__LINE__, candidate->enable.continuous,

> +				continuous, mode,
> +				IA_CSS_BINARY_MODE_COPY);

Now one line?

...

> -			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
> -					    "ia_css_binary_find() [%d] continue: binary is not striped\n",
> -					    __LINE__);
> +			dev_dbg(atomisp_dev,
> +				"ia_css_binary_find() [%d] continue: binary is not striped\n",
> +				__LINE__);

Now the __LINE__ argument is redundant as one may run-time turn it on and off.
So, trimming it while converting to dev_dbg() makes sense to me as a one
logical change. Ditto for other __LINE__ cases.

...

Otherwise it's a good clean up!

-- 
With Best Regards,
Andy Shevchenko



