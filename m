Return-Path: <linux-media+bounces-29613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41171A80653
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 14:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B91DA1B6410B
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB5226F474;
	Tue,  8 Apr 2025 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nw/LeWzn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C0026A0C7;
	Tue,  8 Apr 2025 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114679; cv=none; b=M+USVJhko8inAo4ja9cVHi2iIF1wROLzBr4C3D6LPlgY26Ri+4bZflhNzuYhq6sxuk5akZmuONM2b4nWvYST4Y2RIcBXFA3C3Ah0I//EYzymA3TiK1rZMrSMSk5QWYGaB+rgZL27lyiyrJbsjstH9ixTCRFVTdkh8x0dK+Jljk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114679; c=relaxed/simple;
	bh=Wxu/kgA0ZBt/CwKezJfoWAwagQUkrF5hrbJY+oup8mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQS+wSGXDhVEvSWNQpRAV4rqbipjn+VRGaJwErvK8xndzHAUG6K6QtHkm9p7XZ8LXs3fsVSPThNkaU1j19aDnL1B83TZFXbtr1jeRTfa7NqMZFYmfxjDkERQgXBMHaRSDmFXjLLzFOJ6aa55rPFDyB0UQwXh10ujigVzXNtXJFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nw/LeWzn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744114678; x=1775650678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Wxu/kgA0ZBt/CwKezJfoWAwagQUkrF5hrbJY+oup8mU=;
  b=Nw/LeWznEgW/C1FskeBykjEPLB3U4G+mG4kTaxJ3WxQ8c8Am+tXN4Qfc
   Rsl2AmivRzGNxRE1mikkoZEDh2N8FVZbf+AB2nJ3wEiAO5Hk/NTD15iyq
   o7j4Z3JtUTLHSswATUwzKj4j6WZXTXUpOyKJ67c2eUQWlfnD/0iBC6fJn
   zI1PwyLbYGbCzScGnmB3k3RC/sT48OnaOq75zNsO9qEYf2yBIPRt9/b6l
   mXgbAo3/j07y1S9aTTj/Hy/pMbIPegZO3Jr6be1/YeXG2+y0kIXlTTNOS
   NPtdsIV/KgVFX0Rfn7jCzpTtfthNHFBwfe7/zaGB7bPLu4aLIQDs4Bj9j
   Q==;
X-CSE-ConnectionGUID: bSg8cpWeT3uDykXMRrTWIQ==
X-CSE-MsgGUID: 7axDrhlaRC6NhUpWX+encQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45703820"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45703820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:17:57 -0700
X-CSE-ConnectionGUID: Lfg4emesQDS0yX6oTFIcMQ==
X-CSE-MsgGUID: 4TIMEt29TbSFKio7KdkqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133408560"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:17:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u27tq-0000000AOdl-1imc;
	Tue, 08 Apr 2025 15:17:54 +0300
Date: Tue, 8 Apr 2025 15:17:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 1/1] media: v4l2-core: Replace the check for firmware
 registered I2C devices
Message-ID: <Z_UT8qKhF6R5VTan@smile.fi.intel.com>
References: <20250313113115.359942-1-andriy.shevchenko@linux.intel.com>
 <Z9RkYCJ-ggJl2kn0@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9RkYCJ-ggJl2kn0@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 14, 2025 at 07:16:17PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 13, 2025 at 01:30:34PM +0200, Andy Shevchenko wrote:
> > Replace the check for firmware registered I²C devices as the firmware node
> > independently on type should be retrieved via dev_fwnode().
> 
> Hans, are you okay with this now? Can it be applied?

Is this fell into cracks? Also, can somebody harvest those pretty much simple
one- or so liners that I have sent last week(s)? They all basically in a way
about fwnode.

-- 
With Best Regards,
Andy Shevchenko



