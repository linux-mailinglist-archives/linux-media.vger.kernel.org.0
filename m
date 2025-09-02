Return-Path: <linux-media+bounces-41541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D20B3FADC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24A994E396F
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702752EC0A6;
	Tue,  2 Sep 2025 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUGh9MOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA462EB86F;
	Tue,  2 Sep 2025 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806136; cv=none; b=Mf/od9UHUUcrzNfzN813N+PcFOXQ60JWNl7GrV8aM/wLnEFpBbVFll8V2MU2of8BVGDcIBhZ4qgJkT5tcDLwCbDDBWfBoe/moUM+i73a6+xgjnw4RKGkfFpM7IJI6AHanDELVeIrhv6zfvph3kBpQS3Y9ln7/xGw/n0PomG6Ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806136; c=relaxed/simple;
	bh=0r3Kbl66SOPlH3J9OpigscsrmnOrTPBzkofO/1BNk4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1Y9b52BcXj0IPGQbamOIsNbNkUjomr2s5Plx0EsL5eUgeMaJOY71onIyCNP+8Z6Fbn0tNcZwxXkkX+J8oteI5TdOnmBbiQv7GOrk90Mxhu9n5BJaGJd3i+RDWUkgHSsJ3jqLf7QrRwbY5B9lbFAp8idsAgMtxfPkZG7heRguwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUGh9MOP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756806135; x=1788342135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0r3Kbl66SOPlH3J9OpigscsrmnOrTPBzkofO/1BNk4E=;
  b=TUGh9MOP440WK0Ql2JALw5iCI4a5VnOJJcFy2MnzOCuOCvCnfePz/b3C
   QlCiZfCnw7sZZr8eLyzV9EsBy4fgyrzmm5raODHP7Lx7zyLCYei8bVffk
   +nT/nIB2LTRgzgdhB6865DMvIePcAvp3+3XGFEm8WMUwgtbfHPM2PGaC0
   NPvbsfShthoWfPLWStjfWp5vijWpUXHYX9U/+52pbAo0BftCsaK1HIdQQ
   tNxrmePKkolrrRJJ5lQcSEtmsp2LILrHj7hoUHze4XCdy+TbZbaYu45QI
   mnxYlV8UjBzNkJa/THgMsNNAzPX3mNSvFSPkGxz7ENXCIa0QIPE2hz2gd
   Q==;
X-CSE-ConnectionGUID: 7H+daIcCT/G6qKR+LWdF0Q==
X-CSE-MsgGUID: JE6pdSY/SkStZQyxY1pfEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62900815"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62900815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:42:14 -0700
X-CSE-ConnectionGUID: G1gZxVEnTV+SPbaUE/+9hA==
X-CSE-MsgGUID: 4Vml7+MWTBO0NclOcEoSFQ==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:42:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utNWj-0000000Aeom-1t4L;
	Tue, 02 Sep 2025 12:42:09 +0300
Date: Tue, 2 Sep 2025 12:42:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
Message-ID: <aLa78SILWdVG9AJj@smile.fi.intel.com>
References: <20250902073841.2338568-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902073841.2338568-1-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 07:38:40AM +0000, Adrian Barnaś wrote:
> Simplified masking logic in pci/hive_isp_css_common/host/vmem.c.

...

> ---
> 
> I have tested this change on whole range of *valid* inputs, and it gives
> the same results as before, but this function seems to be little
> counter-intuitive as far as start is a (bit index) but end is
> (bit index + 1).

We can't change it without changing the callers at the same time.
So, better to change just helpers and later on, if working, change
the semantics of the parameter.

> ---

...

>  subword(hive_uedge w, unsigned int start, unsigned int end)
>  {
> -	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> +	return (w & __GENMASK_ULL(end-1, 0)) >> start;

Why __ variant?

>  }

...

>  inv_subword(hive_uedge w, unsigned int start, unsigned int end)
>  {
> -	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> +	return w & (~__GENMASK_ULL(end-1, start));
>  }

Ditto.

-- 
With Best Regards,
Andy Shevchenko



