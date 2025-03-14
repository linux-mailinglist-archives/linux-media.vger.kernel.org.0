Return-Path: <linux-media+bounces-28261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13AA61743
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 18:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5E747A7D0A
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 17:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7002045A6;
	Fri, 14 Mar 2025 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lejCfl3W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A961F957;
	Fri, 14 Mar 2025 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741972582; cv=none; b=XayC7hRGjDhIkqLAzusBDM0XocRzrAwu8JtE/XL/tGzX1CyNV/6a/A1o2oe9Mj2D/g3vcDO0crGZs2pyEIaKpcP28JlQ/3q5ynob2cElkHivZ4xi+/eIRVEfhN0Jy6dhU9FDGlAjFi0vrqy++OZ3nXr9nwVWY3nz6HxJ3s3lFHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741972582; c=relaxed/simple;
	bh=W67U60VL6XmhN/hWl8e/1wv3U9CJq+LTfzrtdFVpEB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQB88U9bgpnM5vzCn0YHuVvjxjaOOQZJcVfkDlsqCaTXYvalD06WsEcbrcjKhbDkoBIa6p3KUfdMRQ060HrB05Y80ErsymrHdN1WGlWFWr8gYHNYZoVjFf0A2Yk8qWFoVR+rgL7CTXTpfwUIsHUHPFkq2AaT15daNOb/Tr1/p70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lejCfl3W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741972581; x=1773508581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W67U60VL6XmhN/hWl8e/1wv3U9CJq+LTfzrtdFVpEB8=;
  b=lejCfl3WNdk78id8HCaPAkAi1cYdXr1H85Qce5WozsCuQPflmcPeQYuj
   8lPshPbyMq84DpV9W+toxP5MQQetH1VkRbYhJ9B3h543R03NQmQI996mz
   iqu4NWXhMcD+xW5sjeCmDUChG0eL9RBG2aIEUeLAj1pvWyY/LPelIyIzD
   aJUbrY9RYBoN8i69/X5I1oK5+B2gOWErCj1m0+Qi1jxkGPywx3zGurPQD
   XyxCh2O2PW5g8LEA0x1CQJ8hzXMeGFNV1nekhfNfe2D7urCNW0w2AJNb8
   f7R9+LMmEO7zN5dAtr87cbuvuu8x7FL9Z0AQhBtGDj9AQ77wysMOHj+aN
   w==;
X-CSE-ConnectionGUID: A4Sjp5X0QxqlHSvlQHrBZQ==
X-CSE-MsgGUID: rAzAzIrQSPSPgw08yUyu2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="30720343"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="30720343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 10:16:21 -0700
X-CSE-ConnectionGUID: hqNtd0hmROWRJLLpHgHIiQ==
X-CSE-MsgGUID: YZMEWzVsTmqNNkvxYWYKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121828284"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 10:16:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tt8dt-00000002WvJ-0ohV;
	Fri, 14 Mar 2025 19:16:17 +0200
Date: Fri, 14 Mar 2025 19:16:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 1/1] media: v4l2-core: Replace the check for firmware
 registered I2C devices
Message-ID: <Z9RkYCJ-ggJl2kn0@smile.fi.intel.com>
References: <20250313113115.359942-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313113115.359942-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 01:30:34PM +0200, Andy Shevchenko wrote:
> Replace the check for firmware registered I²C devices as the firmware node
> independently on type should be retrieved via dev_fwnode().

Hans, are you okay with this now? Can it be applied?

-- 
With Best Regards,
Andy Shevchenko



