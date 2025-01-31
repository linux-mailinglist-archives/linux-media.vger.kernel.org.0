Return-Path: <linux-media+bounces-25496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75870A241CF
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 18:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED023161747
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C65E1F03CF;
	Fri, 31 Jan 2025 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWwGJT0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985953368;
	Fri, 31 Jan 2025 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344016; cv=none; b=Mwu0E43fsUJ/sHbHkDzi/eJEgF1oj297e4hvSMroi3Z0XTisFdXirHKt/rZj7pw7Dthh01eogWdTQztP9AMHB8D4CZgkk2qI1+Jxh6iz66Bs+9sH/nsWgcp3cm8MOLcMiGpEKtwEYykLEuWaoq759oUrV+XzWD+tNiBxt/2ciYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344016; c=relaxed/simple;
	bh=ltqN/95oH7uXi7rBojIwpxYHd0hyNTCytZ/VYy/F9/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZvWTXxbXPJHJHc49hl+o0iXOKRYqNDxkxG4W8mWv/NLTIEYlQ2FkowVIC2ucm+aybEXzRbqBBzKbScbBx1eLxzj09X2aPPWwgiyh6nU1xX2WKZNGv0ufGqET0srdYBQiLupWNfE6tFq+tmtz0RL+jVCkZXKHw8zI81ZdubHOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWwGJT0U; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738344015; x=1769880015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ltqN/95oH7uXi7rBojIwpxYHd0hyNTCytZ/VYy/F9/Q=;
  b=cWwGJT0UCuDjZALW4YateEOi9SW5Y48ofsmaWE4L7euYHgVeb+yrWDbG
   bZtFaOHEMZH+dsqHPtmFwztnLDFvElsmV4NbAd/1dKUqL1juBU0TdV02X
   Pd/coOeyxZmBAkS/rD592iTZcyR4YKU7NVLoR1WfNTsgqo4++64x43xgt
   B1BLotUCRdaZ1ZJ9Ul6HhFKeKDgO4KBJRihhMkHb8O2ENEHGRNYYeryzg
   OG3ZFmm8DlTr4fxsmp0q9xpphaQJdujaXY+z33oDFQ+n70BLXSiS3nmpM
   teGcCneDoLgprRjjaxaF7GBLwSFp8iLunSdIalBD+jr9A1kkCc0FW8UZy
   g==;
X-CSE-ConnectionGUID: lN2uaIR6RvWYIa8iK62slQ==
X-CSE-MsgGUID: a6mHcmIHRcKU7kLkmsy2dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="61389378"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="61389378"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 09:20:14 -0800
X-CSE-ConnectionGUID: xb9sY8fUTkixIHN+XaKPAg==
X-CSE-MsgGUID: CfxAxRbdQAGPFgyR0heF8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109460345"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 09:20:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tdugb-000000071Ov-0a7d;
	Fri, 31 Jan 2025 19:20:09 +0200
Date: Fri, 31 Jan 2025 19:20:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z50GSENeQ73XRTWz@smile.fi.intel.com>
References: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
 <20250131073707.1082931-3-sakari.ailus@linux.intel.com>
 <Z5yya8BIK9GBtVEM@smile.fi.intel.com>
 <Z5y6oI9Z2ILqwu0B@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5y6oI9Z2ILqwu0B@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 31, 2025 at 11:57:20AM +0000, Sakari Ailus wrote:
> On Fri, Jan 31, 2025 at 01:22:19PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 31, 2025 at 09:37:06AM +0200, Sakari Ailus wrote:

...

> > > +		if (*type != int3472_gpio_map[i].type_from ||
> > > +		    !acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > > +			continue;
> > 
> > I think in a split form it is easier to read and maintain:
> > 
> > 		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > 			continue;
> > 
> > 		if (*type != int3472_gpio_map[i].type_from)
> > 			continue;
> 
> Works for me, with the order reverted. I'll send v5.

Hmm... I don't think the provided order is understandable.
But let's continue discussion in v5 thread.

-- 
With Best Regards,
Andy Shevchenko



