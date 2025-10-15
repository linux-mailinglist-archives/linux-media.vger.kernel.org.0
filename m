Return-Path: <linux-media+bounces-44567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00642BDE117
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 12:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A1C03355C2F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F12C30CD8E;
	Wed, 15 Oct 2025 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAHso32S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3102D1319
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525178; cv=none; b=T92vV6mg7A+H/l/EiaWRzMy1qHqJAxas9pVjTVR4pSFyyY5HvI39f5A0Jl4xMPniF3fqkvdYkgdwrTPiN/AHIf0y11WBuSRHf79xretZgL4OrD+pTCfPVHl4WSh5GGYDo262NH7diwl90RvtnwLLcHz0a7t8XYCvuydqvA0wdKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525178; c=relaxed/simple;
	bh=rFh+h2Gw19dKUeywWzo2iMO61XM6xOPU3z9oWLVsNWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f949cMMOeglfiU4oJhpolORaquUdddPyNpwzo7PF5WvEt+fKfdfzYO1hYUird4RHhoagZJYLrfudvuzaj8EZI2iclztU5b3Rx4ZsbVH0NhLA81PYqDwTr5lsF718HKJUxh0ws6MHq7v2yHLb/L2lTBC0XacCVfx7FvsLfmALF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAHso32S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760525176; x=1792061176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFh+h2Gw19dKUeywWzo2iMO61XM6xOPU3z9oWLVsNWY=;
  b=nAHso32SG11XdSwXuuht07J0URNoU2AWhO0rKT5cpoJtWlzAwzzOH2Mp
   OJ51TN5WCXxqFWOs0FkTfjuERFYD7j1Ksf56PqwrFhWAIsy8M/zAYLFXY
   PyD+DilOlqLD7xKyyLuy8qnCl7qfRsVqZQbXfKdsss9aI9daAL6dvosCV
   Fo3K4L+Tbjjnxc9biXX/CnErYCtRB8th0zk54W5zbew9iAtzfs3IexJH/
   XMLcCIS09PRoHH61k05ijOf/l51FZQVPMPyfKBk9j+c7kDXfgq68Ekgcf
   PSmQvMSF7R3S7HOV3lUZ4+Wrr2JyYffB0DDhZ3d54SjYc/U/WJJp3UVOY
   Q==;
X-CSE-ConnectionGUID: I2oNT2uBSEKt0v72HLPgoQ==
X-CSE-MsgGUID: I3sGIU1hRF68IP07EjoQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72970269"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="72970269"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:46:15 -0700
X-CSE-ConnectionGUID: dfakOIJBQqKdeVC7BljyhQ==
X-CSE-MsgGUID: TqkAaNuXSS6Qj74U8zqrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181272108"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Oct 2025 03:46:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8z1G-0003kF-2c;
	Wed, 15 Oct 2025 10:46:10 +0000
Date: Wed, 15 Oct 2025 18:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hansg@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/25] media: i2c: ov01a10: Register tweaks for ov01a1s
 model
Message-ID: <202510151822.TJUD8C7K-lkp@intel.com>
References: <20251014174033.20534-26-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-26-hansg@kernel.org>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc1 next-20251014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-i2c-ov01a10-Fix-the-horizontal-flip-control/20251015-014349
base:   linus/master
patch link:    https://lore.kernel.org/r/20251014174033.20534-26-hansg%40kernel.org
patch subject: [PATCH 25/25] media: i2c: ov01a10: Register tweaks for ov01a1s model
config: um-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151822.TJUD8C7K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151822.TJUD8C7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151822.TJUD8C7K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ov01a10.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/media/i2c/ov01a10.c:204:34: warning: unused variable 'ov01a10_regs' [-Wunused-const-variable]
     204 | static const struct reg_sequence ov01a10_regs[] = {
         |                                  ^~~~~~~~~~~~
>> drivers/media/i2c/ov01a10.c:209:34: warning: unused variable 'ov01a1s_regs' [-Wunused-const-variable]
     209 | static const struct reg_sequence ov01a1s_regs[] = {
         |                                  ^~~~~~~~~~~~
   3 warnings generated.


vim +/ov01a10_regs +204 drivers/media/i2c/ov01a10.c

   203	
 > 204	static const struct reg_sequence ov01a10_regs[] = {
   205		{0x3822, 0x13},
   206		{0x4837, 0x11},
   207	};
   208	
 > 209	static const struct reg_sequence ov01a1s_regs[] = {
   210		{0x3822, 0x03},
   211		{0x4837, 0x14},
   212		{0x373d, 0x24},
   213	};
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

