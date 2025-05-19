Return-Path: <linux-media+bounces-32763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54CABBC6F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707543AF8B5
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C89227877C;
	Mon, 19 May 2025 11:30:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4091275844
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654250; cv=none; b=X6pOoMzg0LzJLA4CX1qJXLU76GjF9RN3CNJIR1AkyuQo1Fdbl1PFZfL9niIflLyHe/d5ZjwUpGze/wF9K2EyUWdOGiuzewpqfanqFf8IWe0LhpggZnuW6fdPkCaQjfkVY/vISUwkw3Q4XS6i1JhnvO8JWRZA1xkbDkwmp/EmEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654250; c=relaxed/simple;
	bh=dw8QKQ1w3hhWwpshoCTGyR437tGOX79do+0E0msBRWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnIeEtMMNaTKfi2JBdBpeex0gN+HuaZo+4e2foSkHb/bmf4GeDhmAFHoxV0TGgJ0XLc7w3mOJ7lBBo5jDZZ0OxyrD/EIJPcbF3DeytHm5ayjHCEuAxP6CHp2GjOfK1h4I05S01cy/bSI2IcsAPBIWK1QANtgMVV8ufoaSGCBoBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 9xbmJNZfTQe1lvpugNF+Xw==
X-CSE-MsgGUID: IuIKyx5LR8+DbAvQxRB9tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60202772"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60202772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:30:48 -0700
X-CSE-ConnectionGUID: M5Oc9LG9TrO7oOoMOshDSg==
X-CSE-MsgGUID: COyRRPwAQemBYH+3mBE2XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139245925"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:30:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGyhf-000000031Ad-1HF1;
	Mon, 19 May 2025 14:30:43 +0300
Date: Mon, 19 May 2025 14:30:43 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 07/23] media: atomisp: gc0310: Add link-frequency and
 pixelrate controls
Message-ID: <aCsWY1ICUoHTq07L@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-8-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-8-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:50PM +0200, Hans de Goede wrote:
> Add support for the pixelrate control as expected by libcamera,
> while at it also add the link-frequency control.

...

> +/*
> + * The actual PLL output rate is unknown, the datasheet
> + * says that the formula for the frame-time in pixels is:
> + * rowtime = win-width + hblank + sh-delay + 4
> + * frametime = rowtime * (win-height + vblank)
> + * Filling this in and multiplying by 30 fps gives:
> + * pixelrate = (660 + 178 + 42 + 4) * (498 + 27) * 30 = 13923000
> + */
> +#define GC0310_PIXELRATE			13923000

Why not utilise the preprocessor to calculate the above?
I mean we can define an arithmetic expression instead of the result
(which is mentioned in the comments anyway).

...

> +/* single lane, bus-format is 8 bpp, CSI-2 is double data rate */
> +#define GC0310_LINK_FREQ			(GC0310_PIXELRATE * 8 / 2)

Hmm... I believe it won't be ever the case, but still the Q here is
if we expect rounded up value? In such a case perhaps BITS_TO_BYTES()
would make sense. OTOH the format theoretically can be not only 8bpp
in some cases, but let's say 9bpp, that macro wouldn't help then.

-- 
With Best Regards,
Andy Shevchenko



