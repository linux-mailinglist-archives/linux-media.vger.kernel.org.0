Return-Path: <linux-media+bounces-25202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E40A1A4F1
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 14:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57DB3AB3E5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4932E211269;
	Thu, 23 Jan 2025 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahPwHEyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41FA20F094
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638921; cv=none; b=FJBz3an+PZAUKYw0aV0gfJZNb4dNzXJmmyo4KZMXl1DNz/tEkVsVje9nyaINCj9llPDgdlXXCfRhNe7mIecrPxKzJYUoGYneJwVNWi7JGzwnJFtWjjlXgnIBivzwoU/58OVZtsEhPH5gcPHqq3OhG8B557cOCLgC0dHd68Honvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638921; c=relaxed/simple;
	bh=SyqqF2aJiM1l1ZeV57HasSK/uR7RmQIOFicPlEbp8EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gulswsjODeK+xNes7bSmbpBQOBUIyNbZwUh9Rqy9hzyW6hcs+jdYFQxqZnKaneVV1ZFyXM4yWlXFJrjEw2SE96WMiJ3iuG+FPTdDqzDUn7HTU96v+yJEq3rGBW2VPTBhOzlOaRyxkBK99ERTYkIi1v0ihNnmjCwO8EPeoCM9A94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahPwHEyw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737638920; x=1769174920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SyqqF2aJiM1l1ZeV57HasSK/uR7RmQIOFicPlEbp8EA=;
  b=ahPwHEywfM5eBLJ6q+tKKDopGx6zqjyz29AM2Y6rOU6+2JLBDBkUSMnM
   wje2taSFfM2WeyfC7zUH0gOIG4HijRaxPmBpS7e4FYyPRMP1XZFwgculf
   4YFdf1xjRAyJe9cRRNanOhzUSWZS2A0UKUuwt8qX76fwkRoxF8N1ekaWl
   PrAsiiRQBDedvElWffh2kIEvFVj54z3EKhr96RnHnHvYlLZhAH8d0poNo
   a+cLfuIeGC5WeDzcaWiVjqxES5/eNYkDsPipdnnzY/sPd8Md15dYz/tcQ
   tof03HUTp7Iiu8Lpmhu7IMYbcmy34KNVtu3f9zHhbLFY6qbMaPkEQXLc0
   g==;
X-CSE-ConnectionGUID: d+JA8oJsSV2zq+LwcR2oNQ==
X-CSE-MsgGUID: EAjGw63vR5Go8mbH4BKxAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="40962702"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="40962702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:25:36 -0800
X-CSE-ConnectionGUID: 1QqcRHUsSLuH+0a9qEXCIw==
X-CSE-MsgGUID: dh45Wz/dQFu5DYEt22K6Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107565410"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:25:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1taxD9-00000004Pl2-48WV;
	Thu, 23 Jan 2025 15:25:31 +0200
Date: Thu, 23 Jan 2025 15:25:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between
 regulators and en GPIO
Message-ID: <Z5JDS2EGT1cWCBGW@smile.fi.intel.com>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
 <20250120101123.148482-2-sakari.ailus@linux.intel.com>
 <Z46GeyeYgf20pq7C@smile.fi.intel.com>
 <Z5DcY_DyYVZxOGaO@kekkonen.localdomain>
 <Z5EepNoMxL8Hfh3u@smile.fi.intel.com>
 <Z5Hw3CUBnSgfNJMS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Hw3CUBnSgfNJMS@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 23, 2025 at 07:33:48AM +0000, Sakari Ailus wrote:
> On Wed, Jan 22, 2025 at 06:36:52PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 22, 2025 at 11:54:11AM +0000, Sakari Ailus wrote:
> > > On Mon, Jan 20, 2025 at 07:23:07PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Jan 20, 2025 at 12:11:23PM +0200, Sakari Ailus wrote:
> > > > > Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
> > > > > required by the sensor's power-up sequence.

...

> > > > > +	usleep_range(1000, 1100);
> > > > 
> > > > Why not fsleep() ?
> > > 
> > > Could be, but fsleep() uses a range that is as large as the delay is.
> > 
> > fsleep() is recommended way as it knows much better the implementation details
> > of the delay APIs and which one to choose based on input. As recently stated by
> > the fix series to delay APIs the fsleep() will give up to 25% on top of the
> > asked delay, meaning in this case somewhat 250us. Taking it into account the
> > resulting values I do not think usleep_range() should be here. I.o.w. I do not
> > see enough justification for _not_ using fsleep().
> > 
> > Also note that fsleep() ranges try to keep balance between oversleep and power
> > consumption. Your delay is rather tough as sometimes 100us is almost the time
> > needed to go to the deep sleep for the CPU package and return from it.
> 
> Have you looked at what fsleep() does?

Definitely, and also read the (updated) documentation. So, let me repeat:
I do not see any justification for usleep_range() here and how 150us overhead
(on top of what you proposed) makes any difference.

> I agree most of the time it's the best choice when you need to sleep (at
> least) some time, but generally sensor power-up time is critical.

Why? I don't see this in the commit message. Please also answer the question
"what is the bad thing happen if we delay slightly more?" and the question of
how this will cope with the case when HRTIMER is off in the kernel.

> I'm fine using 1000 for both, too.

In accordance with the documentation one has to consider

fsleep(1000)
msleep(1)
usleep_range(1000, 1100)

(in this order), so I prefer that we use fsleep() if there is no good
justification for the other one(s).

Also just noticed that in the commit message you even used "ms" units and not
"us", which pretty much suggests that tough range for usleep_range() is not
justified.

-- 
With Best Regards,
Andy Shevchenko



