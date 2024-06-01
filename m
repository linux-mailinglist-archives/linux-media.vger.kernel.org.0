Return-Path: <linux-media+bounces-12379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 295FD8D6FAD
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 14:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942081F21A3B
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 12:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6FC15098F;
	Sat,  1 Jun 2024 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wskx9gVp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611714F9E5
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717244067; cv=none; b=pjYBt26gqpkXesicO6Z5HE6bVLuf73ctKFELP/bVOG9eoJVpJESd4EkOOK054S5NgzjkKmuHNzOWnutVNe1pUcytcUTkN7hS6rMjnJJiXPRMYfNsEAaubCzwJ/NdVNUL636ktRvTaChmMxc3MsBStppMBrlY0ZUA04R+kV114TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717244067; c=relaxed/simple;
	bh=k11lqHrOQhsOHCYMEj4yuruA+H/x5bXadIEbvdi+3po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RMqwUI0pJts+bLQfpqMGObgLfqVIzfAXRLSFmcba4tEU1AtZD3IrUs9RtXLn7xcmKU3H7n50tCH9B60hhoeLNpYsbXoJhAp/CslLjw41BkvWGSVICvKFQYmEYeHXL77YVJ4kxQtovQCuNFpOAhmEzdK4zzggU3OeAUQo8Q92g7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wskx9gVp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717244065; x=1748780065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k11lqHrOQhsOHCYMEj4yuruA+H/x5bXadIEbvdi+3po=;
  b=Wskx9gVptsn6t9266HYNYDAdpb26d1pV0ldxxkJ0I2qOvN15Rt+0LTsd
   gmP+R1BEgCtIgdgaup1JWhkd3EDUlpmGzxtzx3t/3spM/iwNST2KLIUVh
   KDtHYi3slBY7gY9AE9krP1h/ciH6/TUDEHvfCFvHk1G0Xwh9ciYrMNfRR
   r7ofxcZ1zUCokjuH8rqmORHJ7ISZ8w2FuKXSlncE75HO+HsW+QA7MJbNz
   O92yK/5m9agEAh7OuMKygFfM+1jU3+M6bbiy1TX3hcSLIj8HwDFoap46R
   69UxyKTUriZSqS47G9OlzYMSMcxNGeU/5KHtiF1I8zAhiA+ER+hC5/6j5
   Q==;
X-CSE-ConnectionGUID: rPuf2Hp4RrmhTs9PxXU+5w==
X-CSE-MsgGUID: DHVp412rTEWJI028DMgymw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="36319524"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36319524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 05:14:25 -0700
X-CSE-ConnectionGUID: sT2CjJIMROq89006CKiVWA==
X-CSE-MsgGUID: tJVaUD8eSVmlBBZHEkrwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36509482"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2024 05:14:23 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDNcq-000Ipd-21;
	Sat, 01 Jun 2024 12:14:20 +0000
Date: Sat, 1 Jun 2024 20:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:test 54/55] drivers/media/i2c/max96714.c:675:46:
 error: too many arguments to function call, expected 3, have 4
Message-ID: <202406012008.jtWUB0XV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git test
head:   94e408a1547ef00f59477a072c6f943d62d7a097
commit: 3cef6383eec3ec8ac81afe294a669c2ecd8882ef [54/55] media: i2c: add MAX96714 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240601/202406012008.jtWUB0XV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406012008.jtWUB0XV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406012008.jtWUB0XV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/max96714.c:12:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/max96714.c:12:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/max96714.c:12:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/i2c/max96714.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/max96714.c:675:46: error: too many arguments to function call, expected 3, have 4
     675 |         return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
         |                ~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/i2c-mux.h:58:5: note: 'i2c_mux_add_adapter' declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |                         u32 force_nr, u32 chan_id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +675 drivers/media/i2c/max96714.c

   666	
   667	static int max96714_i2c_mux_init(struct max96714_priv *priv)
   668	{
   669		priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
   670					  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
   671					  max96714_i2c_mux_select, NULL);
   672		if (!priv->mux)
   673			return -ENOMEM;
   674	
 > 675		return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
   676	}
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

