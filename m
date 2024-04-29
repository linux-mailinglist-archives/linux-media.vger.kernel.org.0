Return-Path: <linux-media+bounces-10357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD41A8B5D45
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E06BA1C2111F
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149DA127B78;
	Mon, 29 Apr 2024 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwRVEFbH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B54B7E0F2
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403460; cv=none; b=dcIzoEjVgQGESh1gXUUcamn+bO7VqwITSgGpgXK3LWyaqzEfPfTJVSvr0jJdqxUXP3qdFmL+BiE1hoQKR7WOvsiDImOBp7vkKOsEq0SccX1qFuMqdqvWmfFQUFxDPJxSTXubZa95pcN1nGfgK6EXTbfFEKn4h1P8+t+NNk+X2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403460; c=relaxed/simple;
	bh=IUThq4VLaRlgAqcfj+KxL4oOwNgjvbcKg9tXtZG56Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rjkN47feJUatdazBmy5CQZAWAEEH/0jpDR4JNPPpslRDTbt7E/+RZnbUL/Gk/f00Vmux1JRW6dg5ubMUI+pLvfdFpqD+0UJcj3F8kMCtQQWvDPdLRJcwuZ173EL0E9vcO+b5P0mxc7WsJpr0CrHjhe2vbEz3VdFc0dkvluDLizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwRVEFbH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714403458; x=1745939458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUThq4VLaRlgAqcfj+KxL4oOwNgjvbcKg9tXtZG56Co=;
  b=KwRVEFbHNmvgWPSwP+/Veh05MO2uI6GL5uuTBifFsjwInBzwGT6BtJGV
   5d8E3dq1qZG4hQpEiOc39ZR3z6QCC0mVu4ShyTGgdC8Ip2xp3BqHjiGTL
   qFZfCPKy61nrbiSbkHkO2hiGtX7KmsykrU1Dd4zXAQI+hWHVV0W4AV7jO
   X1sBGaaW35w5Wc+AaWrImQRhlbceAx/Tetn/iEUnPNgthfHBLjxiJSFRL
   Ok6ezfDa/SnfUchv1MjpddYPT9Mw/blAEUOs0QwX3JrpXliahQuBhIOZ4
   rK0Kee36V13iX6weYBAwb5qk7CstjL080ymm/+n62ur2Lk1Or6HBwCone
   g==;
X-CSE-ConnectionGUID: ruKUBNdtQ6elgzosEqv+dw==
X-CSE-MsgGUID: Xzu8BzLwQfaMP3K/D3qq8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9944463"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9944463"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:10:46 -0700
X-CSE-ConnectionGUID: UwitkUz/SGGXT/jgIJ10xw==
X-CSE-MsgGUID: CtV13xAjQ2eEH5uXtfWNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30585655"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 08:10:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1SeO-0007Fy-2n;
	Mon, 29 Apr 2024 15:10:40 +0000
Date: Mon, 29 Apr 2024 23:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6 39/50]
 drivers/media/i2c/st-mipid02.c:321:33: error: incompatible pointer types
 passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct
 v4l2_subdev *'
Message-ID: <202404292348.ODBLhjxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   308898eb3af1c6530b122a01a5c4b38931717e70
commit: 42597145960da6460ed283f1a588ab07dc97972a [39/50] media: v4l: Support passing sub-device argument to v4l2_get_link_freq()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404292348.ODBLhjxb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292348.ODBLhjxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292348.ODBLhjxb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/st-mipid02.c:15:
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
   In file included from drivers/media/i2c/st-mipid02.c:15:
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
   In file included from drivers/media/i2c/st-mipid02.c:15:
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
   In file included from drivers/media/i2c/st-mipid02.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/st-mipid02.c:321:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
     321 |         link_freq = v4l2_get_link_freq(subdev->ctrl_handler, bpp,
         |                                        ^~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:547:47: note: expanded from macro 'v4l2_get_link_freq'
     547 |                  struct v4l2_subdev *: __v4l2_get_link_freq(sdh, NULL, mul, \
         |                                                             ^~~
   include/media/v4l2-common.h:551:46: note: passing argument to parameter 'sd' here
     551 | s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
         |                                              ^
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/cadence/cdns-csi2rx.c:10:
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
   In file included from drivers/media/platform/cadence/cdns-csi2rx.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/cadence/cdns-csi2rx.c:10:
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
   In file included from drivers/media/platform/cadence/cdns-csi2rx.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/cadence/cdns-csi2rx.c:184:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
     184 |         link_freq = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:547:47: note: expanded from macro 'v4l2_get_link_freq'
     547 |                  struct v4l2_subdev *: __v4l2_get_link_freq(sdh, NULL, mul, \
         |                                                             ^~~
   include/media/v4l2-common.h:551:46: note: passing argument to parameter 'sd' here
     551 | s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
         |                                              ^
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/nxp/imx8mq-mipi-csi2.c:13:
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
   In file included from drivers/media/platform/nxp/imx8mq-mipi-csi2.c:13:
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
   In file included from drivers/media/platform/nxp/imx8mq-mipi-csi2.c:13:
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
   In file included from drivers/media/platform/nxp/imx8mq-mipi-csi2.c:23:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/nxp/imx8mq-mipi-csi2.c:302:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
     302 |         link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:547:47: note: expanded from macro 'v4l2_get_link_freq'
     547 |                  struct v4l2_subdev *: __v4l2_get_link_freq(sdh, NULL, mul, \
         |                                                             ^~~
   include/media/v4l2-common.h:551:46: note: passing argument to parameter 'sd' here
     551 | s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
         |                                              ^
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/nxp/imx-mipi-csis.c:19:
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
   In file included from drivers/media/platform/nxp/imx-mipi-csis.c:19:
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
   In file included from drivers/media/platform/nxp/imx-mipi-csis.c:19:
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
   In file included from drivers/media/platform/nxp/imx-mipi-csis.c:27:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/nxp/imx-mipi-csis.c:600:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
     600 |         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:547:47: note: expanded from macro 'v4l2_get_link_freq'
     547 |                  struct v4l2_subdev *: __v4l2_get_link_freq(sdh, NULL, mul, \
         |                                                             ^~~
   include/media/v4l2-common.h:551:46: note: passing argument to parameter 'sd' here
     551 | s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
         |                                              ^
   7 warnings and 1 error generated.
--
   In file included from drivers/media/platform/ti/cal/cal-camerarx.c:18:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/media/platform/ti/cal/cal-camerarx.c:18:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/ti/cal/cal-camerarx.c:18:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/media/platform/ti/cal/cal-camerarx.c:21:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2693:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/ti/cal/cal-camerarx.c:68:28: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
      68 |         freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:547:47: note: expanded from macro 'v4l2_get_link_freq'
     547 |                  struct v4l2_subdev *: __v4l2_get_link_freq(sdh, NULL, mul, \
         |                                                             ^~~
   include/media/v4l2-common.h:551:46: note: passing argument to parameter 'sd' here
     551 | s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
         |                                              ^
   7 warnings and 1 error generated.
..


vim +321 drivers/media/i2c/st-mipid02.c

642bb5e88fed89e Mickael Guene  2019-04-09  301  
642bb5e88fed89e Mickael Guene  2019-04-09  302  /*
642bb5e88fed89e Mickael Guene  2019-04-09  303   * We need to know link frequency to setup clk_lane_reg1 timings. Link frequency
046ee0e2a4d6022 Alain Volmat   2023-11-25  304   * will be retrieve from connected device via v4l2_get_link_freq, bit per pixel
642bb5e88fed89e Mickael Guene  2019-04-09  305   * and number of lanes.
642bb5e88fed89e Mickael Guene  2019-04-09  306   */
04d170b288b3404 Alain Volmat   2023-11-25  307  static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
04d170b288b3404 Alain Volmat   2023-11-25  308  					   struct v4l2_mbus_framefmt *fmt)
642bb5e88fed89e Mickael Guene  2019-04-09  309  {
642bb5e88fed89e Mickael Guene  2019-04-09  310  	struct i2c_client *client = bridge->i2c_client;
642bb5e88fed89e Mickael Guene  2019-04-09  311  	struct v4l2_subdev *subdev = bridge->s_subdev;
046ee0e2a4d6022 Alain Volmat   2023-11-25  312  	struct v4l2_fwnode_endpoint *ep = &bridge->rx;
04d170b288b3404 Alain Volmat   2023-11-25  313  	u32 bpp = bpp_from_code(fmt->code);
046ee0e2a4d6022 Alain Volmat   2023-11-25  314  	/*
046ee0e2a4d6022 Alain Volmat   2023-11-25  315  	 * clk_lane_reg1 requires 4 times the unit interval time, and bitrate
046ee0e2a4d6022 Alain Volmat   2023-11-25  316  	 * is twice the link frequency, hence ui_4 = 1000000000 * 4 / 2
046ee0e2a4d6022 Alain Volmat   2023-11-25  317  	 */
046ee0e2a4d6022 Alain Volmat   2023-11-25  318  	u64 ui_4 = 2000000000;
046ee0e2a4d6022 Alain Volmat   2023-11-25  319  	s64 link_freq;
642bb5e88fed89e Mickael Guene  2019-04-09  320  
046ee0e2a4d6022 Alain Volmat   2023-11-25 @321  	link_freq = v4l2_get_link_freq(subdev->ctrl_handler, bpp,
046ee0e2a4d6022 Alain Volmat   2023-11-25  322  				       2 * ep->bus.mipi_csi2.num_data_lanes);
046ee0e2a4d6022 Alain Volmat   2023-11-25  323  	if (link_freq < 0) {
6a381d1072f174c Hugues Fruchet 2019-06-17  324  		dev_err(&client->dev, "Failed to get link frequency");
642bb5e88fed89e Mickael Guene  2019-04-09  325  		return -EINVAL;
642bb5e88fed89e Mickael Guene  2019-04-09  326  	}
642bb5e88fed89e Mickael Guene  2019-04-09  327  
046ee0e2a4d6022 Alain Volmat   2023-11-25  328  	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
046ee0e2a4d6022 Alain Volmat   2023-11-25  329  	do_div(ui_4, link_freq);
046ee0e2a4d6022 Alain Volmat   2023-11-25  330  	bridge->r.clk_lane_reg1 |= ui_4 << 2;
642bb5e88fed89e Mickael Guene  2019-04-09  331  
642bb5e88fed89e Mickael Guene  2019-04-09  332  	return 0;
642bb5e88fed89e Mickael Guene  2019-04-09  333  }
642bb5e88fed89e Mickael Guene  2019-04-09  334  

:::::: The code at line 321 was first introduced by commit
:::::: 046ee0e2a4d602268a49be0d77df8c85559015e3 media: i2c: st-mipid02: add usage of v4l2_get_link_freq

:::::: TO: Alain Volmat <alain.volmat@foss.st.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

