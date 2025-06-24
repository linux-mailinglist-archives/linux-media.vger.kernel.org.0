Return-Path: <linux-media+bounces-35785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA76AE664C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2B018942F1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0232C08DD;
	Tue, 24 Jun 2025 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbs6DHX7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A977111;
	Tue, 24 Jun 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771509; cv=none; b=JRxaE0jFWbS9cclDi3ujcQ4iJbIRBsaFMwBXHLE2hbGeqQIanVV6p3TjLDQAbFPSoBqeJjryGSIQnsm5jtAF7F+C1jo16z6x8T/NSQ4xxj7EqeXnKXj/2oSsY8cA9bHmCwyL9SeBIN0CBfjkqK5xgSjNSuVbyyRy/H+6GEnC5UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771509; c=relaxed/simple;
	bh=MzfSzjUF95yxpmEYVS+Rj4B5oJS885I5tmi8QnxSL1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/LmwUjEH7vG2Qq/8HCmxhGqziSQxeP8tjyW4v+LrWvHw3UqYCELIY/Af/xctnWxcVnf6qPXC1h8O7tlY0YVK5fKO+ckttq2VBGzyJH8kqPZhxZuhPXmwXMBhTct6yq4hINjbSbDYL6qJv5/75O4JUpEoJgzOm2R4z83XARSbs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbs6DHX7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750771508; x=1782307508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MzfSzjUF95yxpmEYVS+Rj4B5oJS885I5tmi8QnxSL1c=;
  b=Gbs6DHX7vJXE+ub0x2b8lJDOrFkLav+EdFE9v89KpqLvNM2MmhJTzZY6
   H1WyE0Fw9fIvovUKmxQGpOskau1jnnCLfNTQQvkWAxEOpJO42wUJocB6/
   /lIQT2pVtqprs8RGU9aPU5DZ+d3MOXprLnlq4ErNdIT4tWVhVC0e1hRga
   YA0BsRkzLREowI35fvyCQAcnKGavSDjp1B+Na/uGMnrvup/EAVl2FDqJu
   PIiliPgeD5BCxoOYfKEvIGgwaWTePhICBK5sSKvMnVt/nSttFUDDkB8h8
   v5MpMcZoCV6ri6rRYhqeSHe3Ev0zTAtxJtR3vESOJI/mG4YRC7YzmQTIq
   w==;
X-CSE-ConnectionGUID: UqlKvbSKTYWIuYiTG9RM3A==
X-CSE-MsgGUID: NT40j7w7TBe3uHuXBVKeRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="78429902"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="78429902"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:25:07 -0700
X-CSE-ConnectionGUID: hjY2OfY9Sy6CJL0qqPCPFA==
X-CSE-MsgGUID: sgp4haqyTcCmo2ZwpTutYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152210127"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:25:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uU3e0-00000009TgJ-1Uhr;
	Tue, 24 Jun 2025 16:25:00 +0300
Date: Tue, 24 Jun 2025 16:24:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, shuah@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
Message-ID: <aFqnK5nIHilUSxPq@smile.fi.intel.com>
References: <20250624130841.34693-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624130841.34693-1-abdelrahmanfekry375@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 24, 2025 at 04:08:41PM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI and needs to be removed before this
> driver can be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()

Suggested-by: ?

...

> +	/* Removed sysfs group registration for active_bo and free_bo attributes */

> +
> +	/* Removed sysfs group remove for active_bo and free_bo attributes */

These comments do not bring a value, no need to have them.

With the above fixed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



