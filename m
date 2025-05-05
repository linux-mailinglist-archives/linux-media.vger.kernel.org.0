Return-Path: <linux-media+bounces-31714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1AAA9604
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC4F317A72B
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 14:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2335D25A349;
	Mon,  5 May 2025 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fquhbdXV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28831F4706;
	Mon,  5 May 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455927; cv=none; b=i04UYU+2b2RK2Ds3u45hPpz5kv3AH322LJX2kwTMNuz0hYwFcUsxlQDrIhAUeX733KVjhXX46sksqMvEjFjTJeRfZ5Q+ch1/BaCFwTfjt2grUJcELNeQxSJiHFFbOnvTom2QvS7ng6Z/ip7459qYGpCHKU6uqDPIxxzX3uwsrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455927; c=relaxed/simple;
	bh=map1B2yp/PLlOdKKujzIPLur3qHnV1vVK1viZeqBwuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqLCoahRmJP1J9yGx+Us/TdguKNT0S0c4Lmt0Z/TuWSoAuYVk41OD49gRcVZnXxW0XxDHDe+g3cJQwi+9bKcwNAQjRjVqTNnz0KZnP9P/npgjj4JOfIKvXFi0KmkGrS/DItoSktdimryeRa1CbRnvipAuZ7IGNevJ/Pa9T7x2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fquhbdXV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746455925; x=1777991925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=map1B2yp/PLlOdKKujzIPLur3qHnV1vVK1viZeqBwuI=;
  b=fquhbdXVgppRwSz3Dv7DzeJmEVL67gFzH1LvAfZmZEU6vGHz1+NW2+Xe
   yPCdXtnHWMdRNVsi08MbRYKQ6XY+pnIWzx+8wfEfKl/h3XMbcsHtjEuOD
   epBuOP9AxtVtz01vyhQisUSyft3S+qy5fec9GlRbYj0zHweLhtn9e82tm
   SxF45n5uVhUvjfm03q0DoZSO9UgmpuconCjIVFHOA2g6qhBpqmUVWsmnd
   ZYIYqy5/9BC+/V2xjF1ptj2N24I5wZ9RsckSxFg9982fCDEz5zp080wWt
   Dj8SNcLaNSy9qnNyi/qU6TlwczxkjSPFLhnjSNfAQ3XgsPd4JJH87m/9F
   Q==;
X-CSE-ConnectionGUID: ejQRw/U4TvWJZKfnZm/FNQ==
X-CSE-MsgGUID: +FAOq4GmTs2lfR1ETFKT4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35686450"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="35686450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 07:38:42 -0700
X-CSE-ConnectionGUID: haxyM9VBQuulV1JXE69PYA==
X-CSE-MsgGUID: v9Wdgz4ZSLOkn53T2BJXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140433477"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 07:38:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uBwxp-0000000358D-1Xzb;
	Mon, 05 May 2025 17:38:37 +0300
Date: Mon, 5 May 2025 17:38:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: ds90ub9x3: Remove unneeded
 of_gpio_n_cells assignment
Message-ID: <aBjNbVPTw4hyuKgR@smile.fi.intel.com>
References: <20250331070200.3985562-1-andriy.shevchenko@linux.intel.com>
 <c7fd0bd4-4fc8-43f0-b980-b49472e76445@ideasonboard.com>
 <Z-5pwpoYEKKmtmPA@smile.fi.intel.com>
 <aBh0K2YGhgxk6ipv@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBh0K2YGhgxk6ipv@valkosipuli.retiisi.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 05, 2025 at 08:17:47AM +0000, Sakari Ailus wrote:
> On Thu, Apr 03, 2025 at 01:58:10PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 03, 2025 at 11:07:40AM +0300, Tomi Valkeinen wrote:
> > > On 31/03/2025 10:02, Andy Shevchenko wrote:
> > > > The default for of_gpio_n_cells is 2, no need to assign the same
> > > > in the user.
> > > 
> > > Where is this documented? I'm also having trouble finding the
> > > implementation.
> > 
> > The idea was introduced back in 391c970c0dd1 ("of/gpio: add default of_xlate
> > function if device has a node pointer"). But now I realised that it was never
> > assumed that default is 2 for the cases when the ->of_xlate() explicitly
> > provided. So, this is wrong patch, thanks for the review!
> 
> Does the same conclusion apply to the similar max96717 patch as well?

If you are referring to
20250331070152.3985520-1-andriy.shevchenko@linux.intel.com
(and why not replying there?), then no, that change is correct.

-- 
With Best Regards,
Andy Shevchenko



