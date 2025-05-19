Return-Path: <linux-media+bounces-32764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E4ABBC70
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C7D3B1628
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03EF26A0F8;
	Mon, 19 May 2025 11:32:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC6620D509
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654334; cv=none; b=jjHEoISrYf+Qkn57ff4Ymx2KwbTNi42BzChUQgyPz8qUGlasc9RUatgaWd7eAYdGR8g8m9tspOcPhHgGs9YSsb9RMBmL0cZAfC87Yhb0oallHFNjXurf1Kc3qWzwANH7RSWYudfKtS2p/WLbEQsWfXjIWRcpinaL8ChHqIe+Zzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654334; c=relaxed/simple;
	bh=L2+1wlZ7YbzvCdm0tNCp3V9iW8L54S7+zAjUpzm2ces=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIUyJXlSzVfr8inGznYuIFi49nB34/C7lZjALKh4rAClpHo19MgZuf61eN9o4vLnjFu00UuMw3jHvNCbwzeNEEBhO+1gDMya6UqDE2BcSSZLEecIPn+REB6pasIvJX0hMY+cIxNIxB6uckqj4WZi9+kFBuLMDYLrCeBrnJfZpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 5dkRSjmWQNS37JowUgTFfw==
X-CSE-MsgGUID: aHF/z/+2SwqUr6KzLuOMwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60944206"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60944206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:32:13 -0700
X-CSE-ConnectionGUID: kqpec0yVRSaf6UjsOpjWQw==
X-CSE-MsgGUID: rAIBtFqISXanLGDiwBFYcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144221466"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:32:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGyj2-000000031BN-2F7U;
	Mon, 19 May 2025 14:32:08 +0300
Date: Mon, 19 May 2025 14:32:08 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 08/23] media: atomisp: gc0310: Add vblank and hblank
 controls
Message-ID: <aCsWuCThO-QA_5zo@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-9-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-9-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:51PM +0200, Hans de Goede wrote:
> Add support for the vblank and hblank controls, these controls
> are mandatory for using the sensor driver with libcamera.

...

>  #define GC0310_V_OUTSIZE_REG			CCI_REG16(0x0D)
> +
>  #define GC0310_H_BLANKING_REG			CCI_REG16(0x05)

This blank line can be added when you converted code to CCI. I believe it
belongs to there more than to here.

-- 
With Best Regards,
Andy Shevchenko



