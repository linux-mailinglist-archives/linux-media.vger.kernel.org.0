Return-Path: <linux-media+bounces-23988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E669FA207
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 19:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17D9F188DDCC
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 18:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8681885B4;
	Sat, 21 Dec 2024 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeUG5jdg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A751632EF;
	Sat, 21 Dec 2024 18:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734806799; cv=none; b=SKzp/1j3/fqZ0S7JZ0ylWSmzL7AFUT58BDjyyQim1txfjdjJ1lBOd1dsZ5/jKL7jKzFCAsXvKOk4YlNrqV3+N5DrNmAKvN4QSwZor/y3Ay1lslMLOt9t+qcIMlA0/WqXrOUQMatKfJGKeJWMXGEAQ27KPCfpKQ6Th7PzorVN2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734806799; c=relaxed/simple;
	bh=zJuK4EGPag3rRSoZW/226OQJu7iD2ASDZu2A91lYscY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlMIejO0E1uL4AYXZepkPh3+So4Zp1hhG0OtOQwNiGDikXbXqx2SnYYWoRf3sa8ZaLQ09Wb3fmxXcMAjqoUr6ij6cm7vfgbm4VQDXrTxQroIixoWrQI+bh1I7UedCoWQ0+1ZcoDuA2Ez9JnH2zExnorbS0eE214CMwqIj6yuGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeUG5jdg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734806798; x=1766342798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJuK4EGPag3rRSoZW/226OQJu7iD2ASDZu2A91lYscY=;
  b=ZeUG5jdgoJxHRl6oBffeXi7D4syi08NIBpK6bIsSf1T0gEtC7deNYtYr
   MB3KpCSzrbjoZIVfnMywU5uLs8qCbRR6DP2uyX//4JDXHskOBkD94CF7K
   adt027Jp8wmei+IZyDcbrfODFaRN6SAdKWfARgdnXtF6RpoqOkH0YMdRp
   fc0vWDR8oYOckwpxP8tCZjoC6aZ5jOedCOfwWUsyyK61JN95mkqlzC4HH
   GBgY4ZoJEc3+/sgZuK8pH+wHOt9p8AlrsZq/Jrgy5hNQ9AhJ8Zwk+B9sK
   B+sPH/YUWCnk1dA+1DfHW6QqXwsiR+EUy6bVPjqtyMopPkMb9qki+4xPe
   Q==;
X-CSE-ConnectionGUID: /9ZCxFvvSYisLVrXJUgT9g==
X-CSE-MsgGUID: PLUZAQEbQV2A1oSHVuUW+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22918772"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22918772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:46:37 -0800
X-CSE-ConnectionGUID: jNutlilzQvadKrwMSzmgOw==
X-CSE-MsgGUID: A6DngFlURoewyjIgoGJkAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103886653"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2024 10:46:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4Uf-0002PD-2q;
	Sat, 21 Dec 2024 18:46:29 +0000
Date: Sun, 22 Dec 2024 02:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
Message-ID: <202412220205.Gf2N9CUb-lkp@intel.com>
References: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on e90c9612ac3969cb8206029a26bcd2b6f5d4a942]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/RFC-media-Add-media_request_-pin-unpin-API/20241221-002633
base:   e90c9612ac3969cb8206029a26bcd2b6f5d4a942
patch link:    https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e%40raspberrypi.com
patch subject: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412220205.Gf2N9CUb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220205.Gf2N9CUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220205.Gf2N9CUb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c:14:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c:24:10: fatal error: 'hevc_d_h265.h' file not found
      24 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c:14:
   In file included from include/media/videobuf2-dma-contig.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c:21:10: fatal error: 'hevc_d_h265.h' file not found
      21 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from drivers/media/platform/raspberrypi/hevc_dec/hevc_d_h265.c:17:
   In file included from include/media/videobuf2-dma-contig.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_h265.c:20:10: fatal error: 'hevc_d_h265.h' file not found
      20 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +24 drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c

    22	
    23	#include "hevc_d.h"
  > 24	#include "hevc_d_h265.h"
    25	#include "hevc_d_video.h"
    26	#include "hevc_d_hw.h"
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

