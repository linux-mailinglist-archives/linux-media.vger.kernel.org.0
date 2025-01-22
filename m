Return-Path: <linux-media+bounces-25157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F6A196A5
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C980161FC4
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DBE215180;
	Wed, 22 Jan 2025 16:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/jYHykA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922B215040
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563819; cv=none; b=T9SNYmlYg1mTUFUkIYCBEGrE0hLYzExd3Vd+FxZeeVPuHi+YOwNT47fSmzGXPpEbKUdz9horS72tbvv9KrsYp5hC9Wjy4z/aVJzNFsDbQQaAw3vrNURYsk4kBMvk/ewIhW8dwcUvXwJSEFUPkSGFwsH/TK/0J4X0MokXKaNum7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563819; c=relaxed/simple;
	bh=MKn5xyewK87RdfFFhUfu9KuVcuAeU5ptMHV5Dh+qxIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leTnE7PLPTeMcauZf/i15WCwvi2i25+rh2NIAYblrm9IEN4wCK8gkYa8Mc0tAdBlRZXEONNHHHJyasgrXQ6ibkPrzrZEDJeNQ9vuO27W5O5cwxt1AW12nucJXoqF6YIbuiix/N//NLW0Qsze8HNbYv5ee7HkhcR1YKZpJKsiJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/jYHykA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737563818; x=1769099818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MKn5xyewK87RdfFFhUfu9KuVcuAeU5ptMHV5Dh+qxIA=;
  b=K/jYHykAtryqgmjjQ9vzzMTRqCNWbiENoZ8QQfudhp42II8nl6MrJKTy
   kaPL0ruJzxns2oEs4M0GK/0MCk2sUNgvjO4CzcKNg8Ld6TeAULHtJ7ck+
   j7njyfNPJlegJVG4dkX9p3oYyWgGEVvELKUeW/+Ioib2wWqAuWO1c7ta3
   vjOG33xTtBZfcA9IovHKlAsUtec8IWRZpy7A1MQNq2UHuMyl4TcLRQWTX
   v+prBRPX0jPwxQrPI4tou2jU5tXictxP8bKURSKZTjNhuL2SNQhuojhVp
   UFT2PNSizO6iVikIKdGaHtPXKnumjgnjKGd3LCvPUb0XNDN5JjnZFwXTq
   Q==;
X-CSE-ConnectionGUID: 4NQg9nQhTJuouGY2Wzdp+Q==
X-CSE-MsgGUID: gmhRXenSQk6JIaqQMAJquA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38180717"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38180717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:36:57 -0800
X-CSE-ConnectionGUID: Q/klLbM1THOMfY4lD5giaw==
X-CSE-MsgGUID: AiHSlHyYTqGlohtzgNuIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111216175"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:36:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tadin-000000048ft-0Q1w;
	Wed, 22 Jan 2025 18:36:53 +0200
Date: Wed, 22 Jan 2025 18:36:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between
 regulators and en GPIO
Message-ID: <Z5EepNoMxL8Hfh3u@smile.fi.intel.com>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
 <20250120101123.148482-2-sakari.ailus@linux.intel.com>
 <Z46GeyeYgf20pq7C@smile.fi.intel.com>
 <Z5DcY_DyYVZxOGaO@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5DcY_DyYVZxOGaO@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 22, 2025 at 11:54:11AM +0000, Sakari Ailus wrote:
> On Mon, Jan 20, 2025 at 07:23:07PM +0200, Andy Shevchenko wrote:
> > On Mon, Jan 20, 2025 at 12:11:23PM +0200, Sakari Ailus wrote:
> > > Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
> > > required by the sensor's power-up sequence.

...

> > > +	usleep_range(1000, 1100);
> > 
> > Why not fsleep() ?
> 
> Could be, but fsleep() uses a range that is as large as the delay is.

fsleep() is recommended way as it knows much better the implementation details
of the delay APIs and which one to choose based on input. As recently stated by
the fix series to delay APIs the fsleep() will give up to 25% on top of the
asked delay, meaning in this case somewhat 250us. Taking it into account the
resulting values I do not think usleep_range() should be here. I.o.w. I do not
see enough justification for _not_ using fsleep().

Also note that fsleep() ranges try to keep balance between oversleep and power
consumption. Your delay is rather tough as sometimes 100us is almost the time
needed to go to the deep sleep for the CPU package and return from it.

-- 
With Best Regards,
Andy Shevchenko



