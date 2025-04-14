Return-Path: <linux-media+bounces-30114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF54A87AF6
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8133A8205
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 08:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADAB25A2D9;
	Mon, 14 Apr 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elwckTH3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15470DF42;
	Mon, 14 Apr 2025 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620602; cv=none; b=Y+LJPxb88oobPbbf4l05ej7WrygzvCtBx/ETUYFy0ETq/lDNN2OLMQFiUF7LXrxU86JZhc4M7GbPCcRabCOJdmMSWJJ0czqPKGrdCXNFhrXGZRrRk2HgMFkLOfJD+55154Dl3mXX+CfLlukKWu7nV+fEXWvCuBLtBnqN1YYwA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620602; c=relaxed/simple;
	bh=8hzjrlVv0UVqlPY4BsZip/abC01E/ytcuea6lKylD74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc0wuMT4PzhDdDCPlnstjbjBXFgJR1VpZIBAzN70pu5KE/uQrhauT9EGqWHnNCP5Z/9qz2a5fBKnJmxHCkmDWuSfSvG0yje56D+x7VUxRVpGecWGCI3tBGWhN6G0LyC/qYvbGxNJ577yACJXUdOE5ygLxB32bAJAKfn1T9LhUlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elwckTH3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744620601; x=1776156601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8hzjrlVv0UVqlPY4BsZip/abC01E/ytcuea6lKylD74=;
  b=elwckTH3+dbuv/sJDuqxNQIlfCoXTxk+fQB2mYlobkW6ImaRmxOGiBas
   gjpA4pS0P6xYgSTR8ixc3kS+uyCUv5LGCphxih5ykS0mNcc9KK6mD+lF1
   a/49qOJ60VosK6RnLRF59+P0CMv+fxBsdVbK+EAbrsYBYkn74buos6v3L
   ESYHS2HQ5+kQFeNlKrvxyuAcEJ4zSvxbBc8B/jLSYw+1ac6YyAPjwYtjB
   +AW37ztlwO4OS7oXTApC5ylp9e8RZs2OTLQyTCOsh7zIHtjYPhM7l4kmt
   H87vSgR2dfzFA2BEgkV72prRSmGsc3kPbfv07gAwsaqKcQspNkiCOg5OF
   w==;
X-CSE-ConnectionGUID: TkypeiEBRe26GtaZYfmewA==
X-CSE-MsgGUID: MnaSQg8RRNy/vRTpdZfs2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46244785"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="46244785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:50:00 -0700
X-CSE-ConnectionGUID: 22xrtLIVQmGm8ngmHp6h/g==
X-CSE-MsgGUID: scWM4NDgR12BkY+mjU2x+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130301300"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:49:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4FVq-0000000CBMa-217D;
	Mon, 14 Apr 2025 11:49:54 +0300
Date: Mon, 14 Apr 2025 11:49:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, stable@vger.kernel.org,
	hao.yao@intel.com
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 04:40:26PM +0800, Yan, Dongcheng wrote:
> On 4/14/2025 4:11 PM, Andy Shevchenko wrote:
> > On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
> >> On 4/11/2025 4:33 PM, Hans de Goede wrote:
> >>> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:

...

> >>>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> >>>> +		*con_id = "hpd";
> >>>> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
> >>>
> >>> This looks wrong, we really need to clearly provide a polarity
> >>> here since the ACPI GPIO resources do not provide one.
> >>>
> >> I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
> >> driver can pass the test and work normally.
> > 
> > I doubt you tested that correctly. It's impossible to have level triggered
> > event to work with either polarity. It might be also a bug in the code lurking
> > somewhere, but it would be unlikely (taking into account amount of systems
> > relying on this).
> > 
> > Is it edge triggered event?
> > 
> 
> It is an edge triggered event in lt6911uxe. In order to better adapt to
> other uses, "hpd" is meaningful to specify a polarity here.
> 
> In lt6911uxe, GPIO "hpd" is used as irq, and set irq-flag to
> IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT. So no matter
> rising or falling, driver can work normally.
> "
> ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio),	NULL,
> lt6911uxe_threaded_irq_fn, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT, NULL, lt6911uxe);
> "

So, the driver must not override the firmware, if there is no bugs.
So, why do you even use those flags there? It seems like a bad code
in the driver that doesn't look correct to me.

-- 
With Best Regards,
Andy Shevchenko



