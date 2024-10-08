Return-Path: <linux-media+bounces-19276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF342995358
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 17:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 891201F279A7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515B71E00BD;
	Tue,  8 Oct 2024 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uv/ht8N8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE84C97
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728401095; cv=none; b=RHZ2quhq44XEB/tB/Vkxz0b1Dr686FKQixeRBhOGOaBFS0DkkjOmwJs0Jmh5xzUub6ripV7PLMihA1smkGToYVf1VLaAxgpistP/vo7AMLAPSifPhO8x6bDaYaeJ4/Xv0wRF7Oo/gmMdnNwIRxvfTUhdBe9FlQNADA8aci3Q/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728401095; c=relaxed/simple;
	bh=7AwCno6t8BLbdEM0obYF4BLbIIkq7PTfHM4oNetiWQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a630AVoQy2NP+zl0/nnDtn3mSB+nh09eVQL5iTfz1itjdFSEETwX+Qm9INKFIgqgliitoAK9l0GheDoeNdLk6f0ViR6yLmyyjsDKovZkl0jpXwzXj+lMj7/BxBpx/N42QYuRD0Kkgbh6kerrKCZxfP9epPUmU8bAFUnapK8Ctr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uv/ht8N8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728401094; x=1759937094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AwCno6t8BLbdEM0obYF4BLbIIkq7PTfHM4oNetiWQw=;
  b=Uv/ht8N8YeMSZLXOeQITsrAOCyxxqC0oDjZIWW+jlOnMBsMQ9vlVnNbN
   Xoo65wxjisC3qQP/d2K9BfgnUn+fKyYI4PbKlneGSyx/zwh//vJeUYSxn
   mGSFYRR4x38eu6M/S6Th7Zx6BWNZFQrwSerwTCEC5H/gs0qAHhdibnJYj
   RLO4wCXYYjr3FXZd4WcSwXhDkHL/Cg6ZGvaCeb2XI743gyAviozDkM7Xt
   Gbg+jXcck/vtbEbyx+gNJ1c439axF9qTgyKeIhN6aNWVUnq1BW9WvUa3k
   Zb0zqb6Bd4tlnmhJlY1z2AJH58EK1GzD5X7DvHz/JzUTyXwahyPpz53wV
   g==;
X-CSE-ConnectionGUID: VejqGEkqSluSAKhId6KWZg==
X-CSE-MsgGUID: o2CaKkljTk62GXi9/P6wqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27731550"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27731550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 08:24:52 -0700
X-CSE-ConnectionGUID: OSIGHcuYTm+cC+92f0uTTg==
X-CSE-MsgGUID: eB3HQQzNT5KyqWLRBhWvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="106624990"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 08:24:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1syC4u-00000000jmr-2TVj;
	Tue, 08 Oct 2024 18:24:48 +0300
Date: Tue, 8 Oct 2024 18:24:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH 2/2] media: ipu6: remove redundant dependency in Kconfig
Message-ID: <ZwVOwBsL-VGWx_-6@smile.fi.intel.com>
References: <20241008061916.313517-1-bingbu.cao@intel.com>
 <20241008061916.313517-2-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008061916.313517-2-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 08, 2024 at 02:19:16PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> IPU6 driver simply depends on X86, X86 and 64BIT cover the
> X86_64, redundant X86_64 dependency in Kconfig could be removed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Please, fix my email address in the other tag to be @linux,intel.com.

-- 
With Best Regards,
Andy Shevchenko



