Return-Path: <linux-media+bounces-18916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199098BBFF
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53EF51C21221
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 12:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154941C2428;
	Tue,  1 Oct 2024 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR1YeTdo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133151BFE1A
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785367; cv=none; b=Akr0k6iUXEr30zlmGqj9PEy1Mwp3BFZ2O3KUV8MLF7u7Zh7kiQ4IvttMM2o9RestaO+x/6BeF0qQFHd01BK+Ok4DdhhUlMiiEia99oCIIQANndMwDMEcpkWfxDVkKgvG/747keTedv0OAWKgYNi7KrRu81Cn9WcqXC2KW/35ikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785367; c=relaxed/simple;
	bh=80AXf86tLZ11As3rL+UrJDLPxI4wQBu08RoZpTl6TFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opWn1JYzSUIbobRrp7cQm+g1BA0tHt8spylNGodlfl01oFkjrSsTmJlmuBS+xGRHJmYmXgT5nJkxXL2P3t25UAJHizJeQqhzYpTgnFaRvtOgMZn18BzEfpoa/ehPzrXTNl4FiUWvTh2vpaBUEcFDsBKOzZY+LNmQ1jgpoY+7pcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR1YeTdo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727785366; x=1759321366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=80AXf86tLZ11As3rL+UrJDLPxI4wQBu08RoZpTl6TFA=;
  b=hR1YeTdo4cT5lCkMmQRThBFm3tKQmvUDBVU8QBPO+vEKBUtvYVPpH5Ss
   VcK9+kS2KXp7GvPKSAYnI0eJe72Jv2OMKzRZl4dCLwdIpxp+hgTXZi/XK
   ig87Y9tJ1wKbjWTsx7cg3+TUlSXGbEhp147aTcRA9nFiPnPlaYl5OBPOv
   ZctPV0OZw4Dyb3nrl8j3P0gkddrW8yoUU3ebkzm8EnL8rNtFV44yUHCRr
   p+iy61P0mUK3A5nGBYuAT9C2iECuIyVX693Emu3ElUqBDWfNCfYyQ7mnd
   cmoRMTiHWcPk4+LTLAHo1SXhq9elxUy0TEQHMtO5ZjCGAlYh1kdAb8f7E
   Q==;
X-CSE-ConnectionGUID: 1qf6IcZST0uc27GAnzwUFQ==
X-CSE-MsgGUID: crejdnR0RuqcYCKBG+TswQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27009875"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27009875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 05:22:45 -0700
X-CSE-ConnectionGUID: 6CIry5doQdyAAJeSJAyrmg==
X-CSE-MsgGUID: frYXO8TFTo61fbbrpFCHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73264956"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 05:22:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1svbtp-0000000FBIw-2Xnx;
	Tue, 01 Oct 2024 15:22:41 +0300
Date: Tue, 1 Oct 2024 15:22:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, oe-kbuild-all@lists.linux.dev,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ipu6: remove redundant dependency in Kconfig
Message-ID: <ZvvpkYunInRSgOUp@smile.fi.intel.com>
References: <20240927021613.2158020-1-bingbu.cao@intel.com>
 <202409280345.yuxEscvz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409280345.yuxEscvz-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Sep 28, 2024 at 03:33:21AM +0800, kernel test robot wrote:

...

>    drivers/media/pci/intel/ipu6/ipu6.c: In function 'ipu6_pkg_dir_configure_spc':
> >> drivers/media/pci/intel/ipu6/ipu6.c:250:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>      250 |         prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
>          |                                             ^
> >> drivers/media/pci/intel/ipu6/ipu6.c:250:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>      250 |         prog = (struct ipu6_cell_program *)((u64)isp->cpd_fw->data + pg_offset);
>          |                ^

Yes, someone should become familiar with uintptr_t.

> --

>    drivers/media/pci/intel/ipu6/ipu6-cpd.c:48:33: note: in expansion of macro 'GENMASK'
>       48 | #define PKG_DIR_TYPE_MASK       GENMASK(54, 48)

Somebody should learn about _ULL() variants of BIT() and GENMASK()

-- 
With Best Regards,
Andy Shevchenko



