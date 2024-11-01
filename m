Return-Path: <linux-media+bounces-20670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C539B8D1F
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 604B2B23C53
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5700A156F4C;
	Fri,  1 Nov 2024 08:30:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54020156C70;
	Fri,  1 Nov 2024 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449815; cv=none; b=e1k98/lygM+xmVlCuPxUy6IEgx3RVQIvFunSiAhmoSWmhe6rhVZo2N2mkdikTd/rcjfN59Q/K9ZHxZgSr+7t/GGnVhKbmkZshxId06FVZvC5ecqdAvem+iaoCkpP7psGZPWVVZl/QA4G7VS/XNfAyiHPh++Auw5nyf/+rTGHvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449815; c=relaxed/simple;
	bh=VqOPLGhf7Rb93vjP8HcIGh65SFnxMBiqidusfVMVaYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fndIYzl52XSva3EOLClWhPKLzdRYEHO2X/RaRTF3OFvRQ+ROqUOVrk29qPIs49/YXTlY+q14XoXnypnWm6Fnd45P0PFQGBD6p6++2aYqyY2CHeIeN5NmhwvKTaX16sh9fANOHfsWe7TjWObDMMTWSinjEF53NtNSwaKJeZGHEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: K1eYv1tWQ5KByYd+105bRw==
X-CSE-MsgGUID: UO+IK57HQqmh0VMRlU3l1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40756461"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40756461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:30:13 -0700
X-CSE-ConnectionGUID: mzQsHpgOQnicapQiXI2fRA==
X-CSE-MsgGUID: f8QbxZH6QqW4yQrKVJc0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83330925"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:30:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t6n2m-00000009xn7-05FX;
	Fri, 01 Nov 2024 10:30:08 +0200
Date: Fri, 1 Nov 2024 10:30:07 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Li Huafei <lihuafei1@huawei.com>
Cc: mchehab@kernel.org, hdegoede@redhat.com, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <ZySRjyrxI9jrcY1q@smile.fi.intel.com>
References: <20241101154823.3067891-1-lihuafei1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101154823.3067891-1-lihuafei1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 01, 2024 at 11:48:23PM +0800, Li Huafei wrote:
> In ia_css_3a_statistics_allocate(), there is no check on the allocation
> result of the rgby_data memory. If rgby_data is not successfully
> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

Not sure if this code even run on currently supported hardware / firmware,
but fix looks okay.

> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

No, this is an intermediate commit, you should find the original, which is
earlier in the history.

-- 
With Best Regards,
Andy Shevchenko



