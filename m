Return-Path: <linux-media+bounces-32772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63491ABBCF7
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A22F1895AA9
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC682750FA;
	Mon, 19 May 2025 11:50:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32041DE4FB
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655457; cv=none; b=P8/buCttJZ6NgoZ0ZyVjq+JQch/1ojbMmRCxbNXSfqDZkq3TbzefGZtT107FdBhASB0+N/TVb5AKgkXq0FXf5zLsxfP2xW+mZz8mUOOdCvwZDUiKWmjV6M5Edj5YqdFRI1/MAFbyENjhYDTdqeKOCkJ0JnDrSJJAi6IekenAlDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655457; c=relaxed/simple;
	bh=Trvukmf7ScJKw9X8Vofh7Evy4MmSMbyeWCDSmr/m/Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwyyyR0eAyLHWQe9JfW81Q9dpd6NjJ6VDFCX2QMHlG45shIGZ0e2RObWKdXOBUo8k/IT5MsO1GkECSjFoR3mYyj20jYcU9T6cqGUfuzlaO/pagudBsZob9iQSKwP90H+GsZvbO4UuCIenDKLMvkdyxwU8XnDFOAzbzL6iGc8FJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: LznmkpHDT+CVnPhfoT0//g==
X-CSE-MsgGUID: khyqwOLEQAq5JqgbAshxRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60204642"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60204642"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:50:55 -0700
X-CSE-ConnectionGUID: WrNyen4/RBqzt9zIwoK63Q==
X-CSE-MsgGUID: UrnEKQScRl+vzfKJLmCn2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139249166"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:50:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGz19-000000031V1-01Hu;
	Mon, 19 May 2025 14:50:51 +0300
Date: Mon, 19 May 2025 14:50:50 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 19/23] media: atomisp: gc0310: Move and rename
 suspend/resume functions
Message-ID: <aCsbGihMDCzkzRua@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-20-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-20-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:41:02PM +0200, Hans de Goede wrote:
> Move the suspend()/resume() functions to above gc0310_detect() and rename
> the functions to power_off()/power_on().
> 
> No functional changes, this is a preparation patch for reworking
> the runtime-pm handling in probe() and remove().

...

> +static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_power_off,
> +				 gc0310_power_on, NULL);

I prefer logical split

static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops,
				 gc0310_power_off, gc0310_power_on, NULL);

-- 
With Best Regards,
Andy Shevchenko



