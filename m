Return-Path: <linux-media+bounces-24998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27FA171A0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 18:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B8E31881290
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2E91E5705;
	Mon, 20 Jan 2025 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nj+VDAQy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4031EE7A7
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393794; cv=none; b=b/3wMNf/PiLMvX6RxuoclK+8ZGgJshlz5NApljcniEdpgXrX9TvLOBxut58o9YPRSM+YtFMUOwGFTO7jXvoF8eZ5dEH2OzYsntdRex6MLscwC6AasS199Dh88L1AcGCIw7D5huwkurQ88iwjN2+Vg8OpkWPfbzxIzPOAhjJOq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393794; c=relaxed/simple;
	bh=f0yDLaJ7AnbcwUnQaRWuAQK1IjoEf2n+1oZDl8GcRMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlWGiibMCPgTj1YmlIqDeAwuJrBa+zJ2LqunOAvUzjAC6243n8VKcy9gyScdU9AbOyr7SMQNS7cREkKCeuvBhjQyUTWrqpTe0K7ifAP7ZLZnTXs94hyaqV+aIdpVqueszDMF0Jlb65UcCVcmETpx4rjfFTdWlW6z2q2xGLG0BYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nj+VDAQy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737393792; x=1768929792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0yDLaJ7AnbcwUnQaRWuAQK1IjoEf2n+1oZDl8GcRMI=;
  b=Nj+VDAQyiHyZK0e887N9Txnn3Ifq/JtNTcC84OPCAs906GwxC73Z0Shn
   YQXxbENZiKYYuTlideCs9Df6Tla+0PZqrONRG6AqDyb0GaPA4TatkTsCp
   oNQbl1+NT4azd9uyjGgrWg7yjIxrZdWbTgoQZFow1XD3p96cHccHnlIhp
   7hsQPNFgyVk4LdziAWdeMq9+OjAfTP2bmdlWBCcBp5wPpW0qU2cUgzg7u
   aNj6mzJezVKUfSXVe4I4cvBz5HNFD0PgfD8Lo6+g4PrXu6fjrR2/hOjqj
   HBDbL8w14nTGfCXPdFhrNSsMoEH676Mu2eFaiSbI2A7eYgX/HB8JPZvsz
   w==;
X-CSE-ConnectionGUID: n59EorGCTOaCXP+x/lFTlg==
X-CSE-MsgGUID: UbPMlA0ZTJC9DHO6E1bp6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37822580"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37822580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:23:12 -0800
X-CSE-ConnectionGUID: 6DqyIZh2RyiMBxOsd4bfiw==
X-CSE-MsgGUID: lu970ARsRZmZ0Ey5BNULaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106382230"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:23:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tZvUS-00000003VOB-0VsC;
	Mon, 20 Jan 2025 19:23:08 +0200
Date: Mon, 20 Jan 2025 19:23:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between
 regulators and en GPIO
Message-ID: <Z46GeyeYgf20pq7C@smile.fi.intel.com>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
 <20250120101123.148482-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120101123.148482-2-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 20, 2025 at 12:11:23PM +0200, Sakari Ailus wrote:
> Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
> required by the sensor's power-up sequence.

...

> +	usleep_range(1000, 1100);

Why not fsleep() ?

-- 
With Best Regards,
Andy Shevchenko



