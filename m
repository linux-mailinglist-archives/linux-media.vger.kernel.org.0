Return-Path: <linux-media+bounces-518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910B7EF5F0
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 17:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD9D1F25337
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 16:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB09358B5;
	Fri, 17 Nov 2023 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXH4otYD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D346A5
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 08:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700237679; x=1731773679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NI2VBdU0kL7e3DDwI2MC3cO07kHxp55zQbUgUsZ/B9s=;
  b=KXH4otYD/hMammtSdMtcUJ4PwkDpWZCoyFqtvWzpxedCyz90s077E6ML
   u5ZxPZDkCOX/SdmLPGcx8IRYka4gfCAXGrOEn+G8yeu0gI9HlTCYIijY1
   zJychABN9n3B5+u58NFGptDP9WG4mzlVTVV1UPHd8nSOu05tJIMZ+PG9n
   e01zHEm0eIUH6KMiX1GDVF4W5hciE5AjmbdGC1IMiWDkabFIvKP3ROsFv
   M8SRtAGV5GAuvl9MA99jU8yL3frDQLW9Jy/w/0HNoculowWxatzVOn/4I
   CVeXbHGrb+Rl4tVU8B5UUi59m6+pGyKoAZrsAFyf7i5THfNM7NlaAzkXz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="388472640"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="388472640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 08:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="7055238"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2023 08:14:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r41U0-0002vD-2k;
	Fri, 17 Nov 2023 16:14:16 +0000
Date: Sat, 18 Nov 2023 00:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <202311180044.xY99kUW9-lkp@intel.com>
References: <20231115141507.37572-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115141507.37572-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61ab89c1916219ccbeca9f6cefb1680212de8d1c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-dt-bindings-Add-OmniVision-OV64A40/20231115-221906
base:   61ab89c1916219ccbeca9f6cefb1680212de8d1c
patch link:    https://lore.kernel.org/r/20231115141507.37572-3-jacopo.mondi%40ideasonboard.com
patch subject: [PATCH v4 2/2] media: i2c: Add driver for OmniVision OV64A40
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311180044.xY99kUW9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180044.xY99kUW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180044.xY99kUW9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ov64a40.c:12:
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
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ov64a40.c:12:
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
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ov64a40.c:12:
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
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/i2c/ov64a40.c:119:18: warning: unused variable 'ov64a40_link_freq_menu' [-Wunused-const-variable]
     119 | static const s64 ov64a40_link_freq_menu[] = {
         |                  ^
   7 warnings generated.


vim +/ov64a40_link_freq_menu +119 drivers/media/i2c/ov64a40.c

   118	
 > 119	static const s64 ov64a40_link_freq_menu[] = {
   120		OV64A40_LINK_FREQ_456M,
   121		OV64A40_LINK_FREQ_360M
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

