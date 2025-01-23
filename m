Return-Path: <linux-media+bounces-25183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918BA19F06
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6EFB7A4436
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117BE20B7F0;
	Thu, 23 Jan 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjVj42jh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC81C3C15
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617634; cv=none; b=kFt5ph+aIw35yUSzGrkMVNa3N2cntxnoLWjpqG+C2FE4vdQVRPK9o1XaMpm2mN4T9BJ5SOiuMTnYz1Y6LB13/b9YYHQkd7JVv6tGM53okeUNn9JXAlSH8PbOZ8yKcPcN6LSAnBVXqQPtCmakihSFWJuxpTXG44QdkFBsOJz4Voc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617634; c=relaxed/simple;
	bh=gVNR3L9YDt3z0B9IqU/OYae19lyRZtLCAeEci+bNN5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/J8y1epVJGTeAxVz7kuplqD49fGoDOI0c74WmEacF81TzFFH66P57hIDmd1zNYx4fXz/ErvwyABUMmhqJjVl89y2Dnx90ek3377ZvJHpldQ+6+Fn4CP//PFyqSfvq8s64mGxq2TthHwtfJ/brnFonI8DyDhtOS0k0H3KSt7uhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjVj42jh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737617632; x=1769153632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gVNR3L9YDt3z0B9IqU/OYae19lyRZtLCAeEci+bNN5M=;
  b=PjVj42jhpW+wFQuMm/mY9eY1zSdV1iWiOYYpxA1RHUkx8tCfUgGKQxky
   qHI7C0UIwctS6vTl2Ix7wUp/qj42borEI9BMUfmzsMybC68tAoEx2ZEtW
   XvSpBYqqHGtsCvRZeUdi/0vM+O5ywucZ43fLLQ9a0rL7W513szW7g6tA+
   Ks0y/+3zvDIndb0ChztjtZWLvByj3nS9UumWRx+FSWFd13ICtxISjvAng
   Te+CJFHatUH9Truw7XsCK4svxIRwQ+eZ9Sd+fS6/UWe5IwnmHm1RqVIpI
   6Cd8p8Lhr6yxEoaaAwlvQF/gHKu+aBcFN/wOMH8gxwfh6Vtfek4/gHoiC
   w==;
X-CSE-ConnectionGUID: USlpN70YRmCZ0orAfe/c8A==
X-CSE-MsgGUID: jx0XgwYuR8KGL5jIRJkT1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="55519089"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="55519089"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:33:52 -0800
X-CSE-ConnectionGUID: 5t9CijjmTBiEoUXRJZ6h4g==
X-CSE-MsgGUID: u692fWQ6TJCFbwe/YGPG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144623000"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:33:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 92A6911F95E;
	Thu, 23 Jan 2025 09:33:48 +0200 (EET)
Date: Thu, 23 Jan 2025 07:33:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between
 regulators and en GPIO
Message-ID: <Z5Hw3CUBnSgfNJMS@kekkonen.localdomain>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
 <20250120101123.148482-2-sakari.ailus@linux.intel.com>
 <Z46GeyeYgf20pq7C@smile.fi.intel.com>
 <Z5DcY_DyYVZxOGaO@kekkonen.localdomain>
 <Z5EepNoMxL8Hfh3u@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5EepNoMxL8Hfh3u@smile.fi.intel.com>

Hi Andy,

On Wed, Jan 22, 2025 at 06:36:52PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 22, 2025 at 11:54:11AM +0000, Sakari Ailus wrote:
> > On Mon, Jan 20, 2025 at 07:23:07PM +0200, Andy Shevchenko wrote:
> > > On Mon, Jan 20, 2025 at 12:11:23PM +0200, Sakari Ailus wrote:
> > > > Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
> > > > required by the sensor's power-up sequence.
> 
> ...
> 
> > > > +	usleep_range(1000, 1100);
> > > 
> > > Why not fsleep() ?
> > 
> > Could be, but fsleep() uses a range that is as large as the delay is.
> 
> fsleep() is recommended way as it knows much better the implementation details
> of the delay APIs and which one to choose based on input. As recently stated by
> the fix series to delay APIs the fsleep() will give up to 25% on top of the
> asked delay, meaning in this case somewhat 250us. Taking it into account the
> resulting values I do not think usleep_range() should be here. I.o.w. I do not
> see enough justification for _not_ using fsleep().
> 
> Also note that fsleep() ranges try to keep balance between oversleep and power
> consumption. Your delay is rather tough as sometimes 100us is almost the time
> needed to go to the deep sleep for the CPU package and return from it.

Have you looked at what fsleep() does? I agree most of the time it's the
best choice when you need to sleep (at least) some time, but generally
sensor power-up time is critical.

I'm fine using 1000 for both, too.

-- 
Regards,

Sakari Ailus

