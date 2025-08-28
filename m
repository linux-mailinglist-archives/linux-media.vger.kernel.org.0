Return-Path: <linux-media+bounces-41274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49DB3A5BB
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2921892B48
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8D4256C6C;
	Thu, 28 Aug 2025 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuS1wiSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC9A2522A1;
	Thu, 28 Aug 2025 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397393; cv=none; b=kIytx9bgOkeHDeQv9rGCU869bGzN572NrT8BR2sgH4GpIOvxFUmLRQgy3SWZTXykkU/mV6aN13R3dFDuoyvLTYPSy5wEvQBSS16w+V6DyWfPqdOMA/l7aGI0TXq/mpLqkpZLzwhBLB6QhaKZK6ISog+6kAr1GJRsyMAuGKIzqNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397393; c=relaxed/simple;
	bh=DJV4nOIO3nuYh+b58vU1ix9mpvZ2wK7fZXE/eeHyXPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSQLVvgRatawLUPW4goV4tCen0avf/c54OFajJcJko7jP5l7cgZVwyZEcc/DYhasWE9eKjJrBF+a1arH3IsOqOrYjoy2jPlYBFJxh5XUGN7Wu1sxE8vySdCWxoJIV/l8a01iDpgzBQ0i0QYS9toICk7dWnUPB3xXiRYv6wEFifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuS1wiSQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756397392; x=1787933392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DJV4nOIO3nuYh+b58vU1ix9mpvZ2wK7fZXE/eeHyXPQ=;
  b=SuS1wiSQUDVn9ybRjmYasxaMlod5UANlU8WtJVtqxaFP273HMyEBJpWe
   uX+S1oVjpK+wt42JWha7BfFDs/wecSM0CXbgL+Mhk0cZ3RtlSI9ck2mPT
   doItWajHcjj6RQmqcSY0ZVzmA3B+V5zmayuoFDyBbtC0rASG8NkuX++0B
   8CWvvNKtfRROaJRSgLHS1oVC7u0nkglTD4FQwredWKwHSMqd981UbZ2pC
   gppDaJjq00WQLjidirbWuCwEjJ6SvQtF25awou/DGthSgWAoSVND7dZDM
   B6OgQu90ibBrfS1hxdCFFb3iNx3/tU3KeHd5V+ijWsAILHMqvR6IgNLRy
   A==;
X-CSE-ConnectionGUID: pxQA7LywQ6W0EvR6GCUs3A==
X-CSE-MsgGUID: yT6HW2ptSkahllxQbyiZ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58598950"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58598950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:09:51 -0700
X-CSE-ConnectionGUID: PYb5NkQMRASt7Jce8kfFLQ==
X-CSE-MsgGUID: 42Vi0V64S1qDo6iY6wtvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="175440381"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:09:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 305AF11F9D4;
	Thu, 28 Aug 2025 19:09:46 +0300 (EEST)
Date: Thu, 28 Aug 2025 19:09:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Message-ID: <aLB_SnOcAeCndNcf@kekkonen.localdomain>
References: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu, Aug 21, 2025 at 01:45:39AM +0300, Vladimir Zapolskiy wrote:
> OmniVision OV6211 is a monochrome image sensor, which produces frames in
> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
> output image resolution modes.
> 
> At the moment the only supported resolution in the device driver is
> 400x400@120fps (Y8).
> 
> The driver version is based on top media/master, which contains a new
> devm_v4l2_sensor_clk_get() helper.

Could you provide a v4l2-compliance output on this and the other driver,
please?

-- 
Kind regards,

Sakari Ailus

