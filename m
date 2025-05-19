Return-Path: <linux-media+bounces-32773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FFABBD07
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149883B1A15
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CF7274656;
	Mon, 19 May 2025 11:54:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812112AC17
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655689; cv=none; b=RVVJqXyydZHgza7BHqEWoKlTSjAH9YjGFGhVym9h7MqwbmbxC96huysAXBlu408JoreAkhMEp2vwuf49+Xf/NgoHWp0e3i4YcSz95yfcQ5sVzYCTshqjs2i7ES6+KbJtWBSForRqfUvlRX9pHqAVGOu7fJCJsi4mb2qZZd7xusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655689; c=relaxed/simple;
	bh=Mw6V1vecB7kDUFvU/xkudtcCzyMuwjr4jBUDWdsPCls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4cZKHKagACgON+n5RiysV0ec2xA+I8IQvKtBbY29Vig6e+wATaJFjUEGwfPqgfWnffRGmLUFR0KDbujw6g29Kv4OfRJGyXaMcTksFbDFOPbYwDp0a7ifMAojlcJAMX8+hDUblmtQzwLiMREDVxLHsAesrThC+Fx0tDzLRgkzTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: V/yWcZswR/6q9BDFYJpoyg==
X-CSE-MsgGUID: KAGjsB2YRay598+r+piWrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53349927"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="53349927"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:54:47 -0700
X-CSE-ConnectionGUID: VVbVr9ovRZaF3x0JfH3Jtw==
X-CSE-MsgGUID: PYg0E5pHSuqTS07C66Hymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144473667"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:54:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGz4t-000000031Xn-08LZ;
	Mon, 19 May 2025 14:54:43 +0300
Date: Mon, 19 May 2025 14:54:42 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/23] media: atomisp: gc0310: Modernize and move to
 drivers/media
Message-ID: <aCscAiLne_RTXsbu@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:43PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series to bring the staging atomisp gc0310 driver inline
> with the expectations for new v4l2 raw camera sensor drivers and then
> after this move it to drivers/media/i2c since it is now just another
> normal modern v4l2 raw camera sensor driver.
> 
> I plan to send a pull-request for patches 1-22 to get added to
> media-commiters/next once they are reviewed. After that Sakari can review
> the final resulting gc0310.c file and merge the last patch moving it.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

for non-commented by me or others (but if others okay with the changes,
I'm also okay).

Thanks for making this driver be aligned!

-- 
With Best Regards,
Andy Shevchenko



