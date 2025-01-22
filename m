Return-Path: <linux-media+bounces-25122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54841A190FE
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 12:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29BE31887FC9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 11:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988BB211A37;
	Wed, 22 Jan 2025 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Myoq/dpV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B121148E
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737546860; cv=none; b=RGejg4XYxjdyeZDdaZzVZ1fR08hKWuw5pylEn0qzMeHc/CTK+kUhdsXtnhmc9FOEnQoJpXeRifuiFSwRNZDwChBwl82blNmj5LF+k4E3Dqy+2cFTKpvBscwbJn7ZQLojnIVRtKxEyUq7NKUvaWtbZ24yJYlwLHZwN2XIfotPQRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737546860; c=relaxed/simple;
	bh=T98UID42q5HOG1JNoBNFgNy0xBLMCBBmX8cjf6zJRs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyX5XPG8oke7bTwpUzdRTzpoOMXpDz4E7sdr5dg07ClbT0LP3hGFePSbcT170bl6r62fIUAa2dFh3KwipqkjBpiy8gFbiZE2C4GGldEnKVbiCpR9KjfXmcqESVjTBOiRR2Mm4mIIJF/OpPvFWj6sqvA7SMY995UjnJ1JZnEV1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Myoq/dpV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737546858; x=1769082858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T98UID42q5HOG1JNoBNFgNy0xBLMCBBmX8cjf6zJRs8=;
  b=Myoq/dpVbt6hA5qeYRCNt19TVFp9mp+IPLyz9ejQU1VZv+Ure6bUKVnM
   UCHXOItbdYagZ6IcBDWb2xee0CMSrT1Ssa4dO88Z/xFxXDpJ4M/qLeUDf
   FN/93UGtEE8IBZn8yOGdB0WVYY5B5u4OwR8x7iO/a1ITDIGVST+kGbOOZ
   YxDgJlLGgQ7jCD3+4ABQVZFPzy+WjK69Ce0rU6CRRDy+dPMCFPFKQJISW
   FoRVAjZZ8IDBsZvC2YWAABvqfEE6m0XxveN/466bt28HvnIg/DK3jUat5
   QB1g/BAL7jnDIkDkQuvEbTPUyh2doICbiWgatkiaMPTxTq11rGaCE719h
   Q==;
X-CSE-ConnectionGUID: jwVozRTzSCmpbsL/+IDNxQ==
X-CSE-MsgGUID: ktmleS7ERGuMkQHGT/5+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37210102"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37210102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 03:54:15 -0800
X-CSE-ConnectionGUID: upYwgp4vR4aUgu0MSG5kMQ==
X-CSE-MsgGUID: qJLOIsrySXeya2HBNWtu+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130421210"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 03:54:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 076DB11F944;
	Wed, 22 Jan 2025 13:54:12 +0200 (EET)
Date: Wed, 22 Jan 2025 11:54:11 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between
 regulators and en GPIO
Message-ID: <Z5DcY_DyYVZxOGaO@kekkonen.localdomain>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
 <20250120101123.148482-2-sakari.ailus@linux.intel.com>
 <Z46GeyeYgf20pq7C@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z46GeyeYgf20pq7C@smile.fi.intel.com>

Hi Andy,

On Mon, Jan 20, 2025 at 07:23:07PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 20, 2025 at 12:11:23PM +0200, Sakari Ailus wrote:
> > Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
> > required by the sensor's power-up sequence.
> 
> ...
> 
> > +	usleep_range(1000, 1100);
> 
> Why not fsleep() ?

Could be, but fsleep() uses a range that is as large as the delay is.

-- 
Sakari Ailus

