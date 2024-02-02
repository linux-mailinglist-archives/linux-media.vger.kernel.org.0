Return-Path: <linux-media+bounces-4627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138284772A
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 19:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45C51F257F6
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 18:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADF814D422;
	Fri,  2 Feb 2024 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvA1zAF5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D59014C596;
	Fri,  2 Feb 2024 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706897566; cv=none; b=ZCT81henDZ0xTlROkVBmA/sLe9xBFZcOOxBM0tAhIRaGu9HIxfQ3Z/tl1J6RsADs0N8V6Tdhv1pQEGLMW2Z+hxiJQM59/NX1hZP/HlpXLPv/zXZ4JeSmIst0h0ez6NGTDaM0U2oeVbENaPvyP4QWaHgXTu4QtjNOlpC714SBvOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706897566; c=relaxed/simple;
	bh=B/LZguq9EB059xq5IiI6hqPxxL0vnXVLbvtINrDrK+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFgKJNOQWDC3D0T40k1zrEJRe3QDPmuriDmwSvsT8u+kXtdQ36r0st6veoKKdNWgUBfYGVvSyUypP1WnNPm1ITtTpruX3N9q4hVvJjSI3RF/Y1NbQF2pVQP5ZM/Y3wfkXcIYS8q2mDxZPjj6GmFTbS4zYgkbOXMZGayj4IMcKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvA1zAF5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706897565; x=1738433565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B/LZguq9EB059xq5IiI6hqPxxL0vnXVLbvtINrDrK+8=;
  b=AvA1zAF5tTY1ZXqYNrPdkP1FnKFrd2/xnFZ/o8nTpY1EsJEfiPNZMumA
   6kIoZLJG3aKkIauPjrw6CQKZfrpCz6XAMH84gjpXYEHQc4MNb31Lwk+pQ
   OtECclXzusm0MPILoUuX8vr/hLaKpyxYD9O+a7mPMvhOAFewCiGYPj/e+
   eV43zWNd88vL3slb1jJ7eZ23F2P1evaO3LH+gdEJtcyfABJ5j1/7lRyiW
   0IO/vKBJEMOl9sXbWqZPndou0heITIRvSzARlDA2hemLfi2ll2kDSyjAl
   2peuCxzANjXBWlgq8a3Hyw4mbjFY5qsAmGXi1V0xSNFAVMM8+6hG8wIax
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="369708"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="369708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 10:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="418410"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 10:12:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVy1l-00049C-34;
	Fri, 02 Feb 2024 18:12:38 +0000
Date: Sat, 3 Feb 2024 02:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <202402030114.spgdRGpC-lkp@intel.com>
References: <20240131164709.810587-4-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131164709.810587-4-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.8-rc2 next-20240202]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-uapi-Add-MEDIA_BUS_FMT_RGB202020_1X60-format-code/20240201-005029
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240131164709.810587-4-dan.scally%40ideasonboard.com
patch subject: [PATCH 3/5] media: mali-c55: Add Mali-C55 ISP driver
config: arc-randconfig-r132-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030114.spgdRGpC-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402030114.spgdRGpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030114.spgdRGpC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/arm/mali-c55/mali-c55-core.c:33:12: sparse: sparse: symbol 'mali_c55_interrupt_names' was not declared. Should it be static?
>> drivers/media/platform/arm/mali-c55/mali-c55-core.c:602:29: sparse: sparse: Using plain integer as NULL pointer

vim +/mali_c55_interrupt_names +33 drivers/media/platform/arm/mali-c55/mali-c55-core.c

    32	
  > 33	const char * const mali_c55_interrupt_names[] = {
    34		[MALI_C55_IRQ_ISP_START] = "ISP start",
    35		[MALI_C55_IRQ_ISP_DONE] = "ISP done",
    36		[MALI_C55_IRQ_MCM_ERROR] = "Multi-context management error",
    37		[MALI_C55_IRQ_BROKEN_FRAME_ERROR] = "Broken frame error",
    38		[MALI_C55_IRQ_MET_AF_DONE] = "AF metering done",
    39		[MALI_C55_IRQ_MET_AEXP_DONE] = "AEXP metering done",
    40		[MALI_C55_IRQ_MET_AWB_DONE] = "AWB metering done",
    41		[MALI_C55_IRQ_AEXP_1024_DONE] = "AEXP 1024-bit histogram done",
    42		[MALI_C55_IRQ_IRIDIX_MET_DONE] = "Iridix metering done",
    43		[MALI_C55_IRQ_LUT_INIT_DONE] = "LUT memory init done",
    44		[MALI_C55_IRQ_FR_Y_DONE] = "Full resolution Y plane DMA done",
    45		[MALI_C55_IRQ_FR_UV_DONE] = "Full resolution U/V plane DMA done",
    46		[MALI_C55_IRQ_DS_Y_DONE] = "Downscale Y plane DMA done",
    47		[MALI_C55_IRQ_DS_UV_DONE] = "Downscale U/V plane DMA done",
    48		[MALI_C55_IRQ_LINEARIZATION_DONE] = "Linearisation done",
    49		[MALI_C55_IRQ_RAW_FRONTEND_DONE] = "Raw frontend processing done",
    50		[MALI_C55_IRQ_NOISE_REDUCTION_DONE] = "Noise reduction done",
    51		[MALI_C55_IRQ_IRIDIX_DONE] = "Iridix done",
    52		[MALI_C55_IRQ_BAYER2RGB_DONE] = "Bayer to RGB conversion done",
    53		[MALI_C55_IRQ_WATCHDOG_TIMER] = "Watchdog timer timed out",
    54		[MALI_C55_IRQ_FRAME_COLLISION] = "Frame collision error",
    55		[MALI_C55_IRQ_UNUSED] = "IRQ bit unused",
    56		[MALI_C55_IRQ_DMA_ERROR] = "DMA error",
    57		[MALI_C55_IRQ_INPUT_STOPPED] = "Input port safely stopped",
    58		[MALI_C55_IRQ_MET_AWB_TARGET1_HIT] = "AWB metering target 1 address hit",
    59		[MALI_C55_IRQ_MET_AWB_TARGET2_HIT] = "AWB metering target 2 address hit"
    60	};
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

