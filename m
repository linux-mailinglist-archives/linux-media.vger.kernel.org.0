Return-Path: <linux-media+bounces-12377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B28D6F73
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 13:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86891F22445
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 11:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945D314EC5A;
	Sat,  1 Jun 2024 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj/hpU66"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41B823DE
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717240283; cv=none; b=e1mcIYpIJ6fgbXkl9oWNOEqtd8v65g27Y/Vj5o+FS/UtmTjr2n2oMQAxeaJFdPtstto73LCNT2FchkjMpYBvYcGafF1w/BveD/hm3KBZfD5CjbbB708mFe7i/dZSJRtBr4idJ3UrVcMSwW9BdCcTBgoPMzQVQ54MeDyJSFAJ3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717240283; c=relaxed/simple;
	bh=PsCrz80mQHu0e2miGshruCXgw5Mob3LuBbuGWo0WC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvCxxoAXrYn72jC5vGm/efPIHgNuybUGgZLOoRkarSs/pFhGoqdtOKSZL2FdcTEkRh4QrGXK3x/R7aTCWZ/h5bOnyJi8V/z72KN7NG3qGClmdMxIxQSARfWTUOsUXbUpN+w1Tjj6LLMJODHJtlnOpI1jv8vOTLq+acKitFiiq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj/hpU66; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717240282; x=1748776282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsCrz80mQHu0e2miGshruCXgw5Mob3LuBbuGWo0WC7Y=;
  b=aj/hpU66Ieby01WqDqPtBLhAa9lAPyRdydk6Ad54QiA+f3R18JH1dBKa
   AtoLk65VELbMn0bBWQ1+j984iI3fV6jgCzE/LP+xjln/cCpCqUV5zKXeh
   wswYoYeylfPXNd67wIQecf2GRaQPAfLDLTwMmHSh12Phb3gcfutBaR3AG
   A5gS2ON3l96wqCtYmzIBnevHjcml8JV96+XHbfAbj96XQMA+zaekuLRWu
   FaHeft0KBNMlIdG/WBubFTDsBlZTvSRBME5XrmjcGO7i+D6rN7IWyZ9vM
   N3FtT7zauhfQWZHu5h14NZILTfEMfLbP2qGcqOMtQqR9QjHK9p4e6Rb+u
   g==;
X-CSE-ConnectionGUID: DbGW709cQ1yc92tkeejlnA==
X-CSE-MsgGUID: LfYx5DAcSESSmRDTU87jlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24443588"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="24443588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 04:11:20 -0700
X-CSE-ConnectionGUID: JxL1XLEWRROYxIUQdFxY2A==
X-CSE-MsgGUID: o1TZPTqqQy6yjWkJptshtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36428673"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2024 04:11:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDMdn-000Il0-1e;
	Sat, 01 Jun 2024 11:11:15 +0000
Date: Sat, 1 Jun 2024 19:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:test 53/55] drivers/media/i2c/max96717.c:124:46:
 error: too many arguments to function call, expected 3, have 4
Message-ID: <202406011955.oq2igodk-lkp@intel.com>
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
commit: b22ddf6b6ea346fb256ed4adca4cb8c085a2d7fb [53/55] media: i2c: add MAX96717 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240601/202406011955.oq2igodk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011955.oq2igodk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011955.oq2igodk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/max96717.c:13:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
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
   In file included from drivers/media/i2c/max96717.c:13:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/max96717.c:13:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
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
   In file included from drivers/media/i2c/max96717.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/max96717.c:124:46: error: too many arguments to function call, expected 3, have 4
     124 |         return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
         |                ~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/i2c-mux.h:58:5: note: 'i2c_mux_add_adapter' declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |                         u32 force_nr, u32 chan_id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +124 drivers/media/i2c/max96717.c

   115	
   116	static int max96717_i2c_mux_init(struct max96717_priv *priv)
   117	{
   118		priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
   119					  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
   120					  max96717_i2c_mux_select, NULL);
   121		if (!priv->mux)
   122			return -ENOMEM;
   123	
 > 124		return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

