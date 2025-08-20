Return-Path: <linux-media+bounces-40452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C06B2E0B8
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970A37A618E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3CE326D66;
	Wed, 20 Aug 2025 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHGps4hO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C52338F29;
	Wed, 20 Aug 2025 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702418; cv=none; b=rLJ+RrrCZzs6gphaVasKufN5QnKKhRkBNDbArZ7xlM/qjTBnritp7GqjsdT3b16d7ayO05dkmTRxeX+/LYo2je/eupUQbHenelfzj+HLrrPcKsNtPRq/GWf75avrLlXaswVDVzC1GvmCMV9Fb0iB9gsWJXVrKYHVLSd1zeK7eFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702418; c=relaxed/simple;
	bh=l8NLF1lhQ9QsOYxcGmVmRIxtmN2oRyQvwPzcqOC8N3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVWOOcpJaLeN+Zz5J6ND00a0zmvl4KOq7EEkcCjKA+hfmKupGBZYxn/UXPrzv2EERTNBI4HFhwdbWeUPWPE6tRk8sE48snY489rrYOd5FCnICo3O8J66UqgOVWutv22D+ANTgDgbYs+YcVUV5eAybFVC7hcGNPftiVGia3vV2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHGps4hO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755702417; x=1787238417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l8NLF1lhQ9QsOYxcGmVmRIxtmN2oRyQvwPzcqOC8N3c=;
  b=JHGps4hOTC/FIMTJBOL8luYVzkv4tMfPCWwvK84ADda2zeFgh2HWS604
   Wis45+ZmRqC3FiV4KutRnrsSGmZl1l0PAdlL8vTLrXdPTYorfnOV1UQhM
   mGK6Ot3xhRP235GfThAUggBLRU5Z+SJmpPofI6r1+TmzXAh1O76DvPNeu
   lJo6fMGu1s/gZVPnzYIaBVtkb+yuGaMBW/4yOKd16GXTz4qIP3i4prrV9
   JPgNTpkrdn2oeHrBbANdd2x0ZiKlYvDoh33Y0eCcd6Lmyyote/nItpxNk
   jXKkH8w0klJvCPuWANaoX3d2RcSf9mmDIeX5G7Lcz32hds8rDfc7aiM9j
   Q==;
X-CSE-ConnectionGUID: lAgs/3UlSpitwf1wrupRsA==
X-CSE-MsgGUID: 0r1sHtbRTHSPqjc8zY884g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83394591"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="83394591"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 08:06:56 -0700
X-CSE-ConnectionGUID: tstZB47DSwW4KIkXKjGxfQ==
X-CSE-MsgGUID: 5CJJ42bcRGO5Fmg0n7GiIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168506052"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 08:06:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uokOp-00000006y11-00LH;
	Wed, 20 Aug 2025 18:06:51 +0300
Date: Wed, 20 Aug 2025 18:06:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
Message-ID: <aKXkimJkYrHUCbz1@smile.fi.intel.com>
References: <20250815173755.33254-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815173755.33254-1-abdelrahmanfekry375@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 15, 2025 at 08:37:55PM +0300, Abdelrahman Fekry wrote:
> hmm_init() would continue execution even if hmm_bo_device_init() failed,
> potentially leading to bad behaviour when calling hmm_alloc().
> 
> - returns the error immediately if hmm_bo_device_init() fails.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



