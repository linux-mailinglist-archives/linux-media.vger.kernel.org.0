Return-Path: <linux-media+bounces-10522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D708B86D8
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 10:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E18B284450
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 08:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AD84F881;
	Wed,  1 May 2024 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kA90lQsz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A264CB4E
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714552106; cv=none; b=j9yEuxp0pfr2LSnGfUha1GscWDUVYdbDJJha66CJ5EMWK3w58SSI2pbS8/Z919dYEf1gG6+vjL97/UlLnTZ183YdS7p0HaiPLkKWZnvKLE0mGodNUICNljXMimSglKKguINd5xv1gaPZ3sXdim/G7YWTBKd8pN5ZmRSyQPa86GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714552106; c=relaxed/simple;
	bh=oB5eTOjOMGc7xYDaZHlV54YUjDSHdNXVAPM1y0zAnWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3Oa6zOv+FMazKTXA9vC8c3SJ+1w+minm4gIDsq1RP7lz1vBNn/L16ZGHIBKRqVW2xjsNX8fPEmmV1wC58gdJzK85kU0zUMtQt6CKrjdSt4MaPIhQPqKd9OFe323+Pwavwi5UI9zwWL6jxNb7Q0Gz7VkT5ZxVdTo/SxBj370oDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kA90lQsz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714552105; x=1746088105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oB5eTOjOMGc7xYDaZHlV54YUjDSHdNXVAPM1y0zAnWI=;
  b=kA90lQszzPbY4VIsgpRE3EbBFh2LX5Mf5Km/DhYkMj+25gjKiAABQUk7
   2xwhdmgX0kWo6ngkQtyqdv816vXbw3pjLUjAA92pKF7/QStmhdo80K2v2
   upD/bHBxPca+vU5U/JnOAHwdli+/u/V0kRlJDiqfGhJXw5iXytKsLOHzD
   qKJLXP0O01Ro6oLVcwlmBbY2jfDNFgOQJA/cOZAn9KzWOrf1FpF0Ecvj7
   MyIQZbCBrBYayZWRndNy5usqA/wUtYrbBJX5lTeFQ+kPSgNwqBAO3O2sa
   FGQiaxXQwbp6uthjH8FwgUndYH/IEHur1q7oS74VIJV2uSuvce+9h5X98
   A==;
X-CSE-ConnectionGUID: +lUPpZ5VSY2EWWM7atsoMg==
X-CSE-MsgGUID: o3/4DzzgRduHIxZ8wefXYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14055930"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="14055930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 01:28:24 -0700
X-CSE-ConnectionGUID: OpWmZ54RR9qU9L/CiGrEjQ==
X-CSE-MsgGUID: zfNN+5o8Q/mv7pIZLkA9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="31335495"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2024 01:28:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s25K7-0009EG-12;
	Wed, 01 May 2024 08:28:19 +0000
Date: Wed, 1 May 2024 16:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	bingbu.cao@linux.intel.com, daxing.li@intel.com
Subject: Re: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
Message-ID: <202405011552.aHb15tq0-lkp@intel.com>
References: <20240429051333.1306453-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429051333.1306453-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/master linuxtv-media-stage/master linus/master v6.9-rc6 next-20240430]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-Add-ar0234-camera-sensor-driver/20240430-133240
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240429051333.1306453-1-dongcheng.yan%40intel.com
patch subject: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240501/202405011552.aHb15tq0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011552.aHb15tq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011552.aHb15tq0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/ar0234.c:1032:36: warning: unused variable 'ar0234_acpi_ids' [-Wunused-const-variable]
    1032 | static const struct acpi_device_id ar0234_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~
   8 warnings generated.


vim +/ar0234_acpi_ids +1032 drivers/media/i2c/ar0234.c

  1031	
> 1032	static const struct acpi_device_id ar0234_acpi_ids[] = {
  1033		{ "INTC10C0" },
  1034		{}
  1035	};
  1036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

