Return-Path: <linux-media+bounces-11655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 596188C9D18
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 14:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110581F21AD7
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241A15647E;
	Mon, 20 May 2024 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TD0D+cAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31854FBD;
	Mon, 20 May 2024 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207779; cv=none; b=X9Y14OizVFmar32k6gnggXPsvMmbyaXBAXwUavQX5rMHaKwX9o9G53pxj+dikTj0EVRrWWdoAcGufPGqpW2VR1ton7r6LkZKzOccH6eSdfAHV9iRY6YXdL/V7DOTqBLk4VjiCMfUoG9YJCWYdR6j1Zr02tN843IQNm6xx4bmekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207779; c=relaxed/simple;
	bh=FIHPzrYBeBwApuNIfaSlsYWDNvGy7ZbVQrqLmZ/82pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZUmCOZDX0akzJJxSkbRLu3nsMtiNSe0hRssVbDA8CAZFIcTvykauRXcc6TvWZa927/WWkgSwvDD8fuo0BaOn8d4g/gG53jv3T7amcyM6HUBP1aqalEDSmpY2v5GFZPg2ghHF4jK/ufQ+FLGpqx13JIfQy0teTfvTS7vqOMWt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TD0D+cAJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716207778; x=1747743778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIHPzrYBeBwApuNIfaSlsYWDNvGy7ZbVQrqLmZ/82pg=;
  b=TD0D+cAJWpOXVMlr+M5ngqJJ0fG7hhmTwx3/W8ZDCstnvMts0NRJbHPA
   ph3uDzAf+uvSxkpkMk/zCyMeFA6pkI7newEIUqf+sbF6am1lppnpj7pdv
   3nT6ZM8GebZu1A9GiRMWn7V+S+9m6dRB9NUDyCOsGuUwc+5xy8AyZGNDv
   hTg8qcsLioeVAnLEehmQRUnizJeL6a2mUPvq0BEJEZ23wyrw30aWX/aDC
   NcCwKOXIrD2XKwVLvzmwcBR1UtN6xZBgpcHVvq7FE0PPg0HFOyZHrSBTU
   Ln8dC/Euwx4wJXnmjxgZCGKQGR8+RhMW6g8lv+ohixwUAAnvokCZHkeZH
   g==;
X-CSE-ConnectionGUID: 0yxWYYs5SnizDKg1khRQug==
X-CSE-MsgGUID: e8DYWLavRO6LcT/Kb8xahQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16121090"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="16121090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:22:57 -0700
X-CSE-ConnectionGUID: BwU7Y7GMQkeBw3e/17TV/w==
X-CSE-MsgGUID: BjQEzPg3QwSQCXAimCM+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32652526"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:22:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s922R-00000009J9i-2ohd;
	Mon, 20 May 2024 15:22:47 +0300
Date: Mon, 20 May 2024 15:22:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Daniel Latypov <dlatypov@google.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZktAlza1zEke1eCx@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 20, 2024 at 05:11:18PM +0530, Devarsh Thakkar wrote:
> On 18/05/24 01:44, Andy Shevchenko wrote:
> > On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:

[..]

> >> +#include <kunit/test.h>
> >> +#include <linux/gcd.h>
> > 
> >> +#include <linux/kernel.h>
> > 
> > Do you know why this header is included?
> 
> It includes all the other required headers (including those you mentioned
> below), and header list is probably copied from other files in same directory.
> But it does suffice the requirements as I have verified the compilation.

Yes, and one should follow IWYU principle and not cargo cult or whatever
arbitrary lists.

> >> +#include <linux/lcm.h>
> > 
> > + math.h // obviously
> > + module.h
> > 
> >> +#include <linux/reciprocal_div.h>
> > 
> > + types.h
> 
> All the above headers are already included as part of kernel.h

Yes, that's why you should not use "proxy" headers.
Have you read the top comment in the kernel.h?

-- 
With Best Regards,
Andy Shevchenko



