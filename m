Return-Path: <linux-media+bounces-16961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B3961C36
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 04:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5ED0B22F60
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 02:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366F583CDA;
	Wed, 28 Aug 2024 02:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD21eSBo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1C200CD;
	Wed, 28 Aug 2024 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724812776; cv=none; b=eRxx2vzZoDZUZVlsIjAd/W8dTSVBnBwJmXUw9FoMkageS5jaoqt7V+0VR3+MFPdDeeofs0qWCsvyvahPa0RSHpYGn+N2maF4ACA7sgoR3mCMOffTTSDKWg+f7wJe66em39yXeuAf9ZhHBqBaByKWpn8Zw6axnKIOMtAKgit8SG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724812776; c=relaxed/simple;
	bh=2ZXtBTUi5Kw/5EWXmiCqP0tVkkTkI9dk6zjA1j9gRKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qde8UwytD/KzsULMO9o3Bfou9ajqGDyNgjhXHWCKVYqEh827lYn9hSou/dHp1fvNlJ/90YouRDL/2hFsz9h1ESEo6Gc8KSaYHibP7e4B+E6Ew0cSw5ljhXuz9j282DyT1D2uDSWBETJTqIGOqslC7EZJ/1B4TLoBzxkUyPLGVFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD21eSBo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724812775; x=1756348775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ZXtBTUi5Kw/5EWXmiCqP0tVkkTkI9dk6zjA1j9gRKg=;
  b=UD21eSBogC9JYZTYQZdhPTenI+ZgtiRVC6qgPfVI3BX1clV37m5/1c2s
   DiY3mCTIY2/e0S5obf7HlD+nQw8Ku58lmjGat8HLkfwTITdEGWJDwp5VE
   rzkCHCpPrpYm3v6nZCFIvR50DvyBUBnubtm4IyC/u6E7a2vVy9ZQCe0Cw
   rCI7zKmoFlxgk92XrojrKQ82Un8+VDu5qf5o9wyHLqMAcvsQloW1qBOgY
   3uBLerCbNTMzgqZxHHECtwk+l7t8MvhQAFfYSBMWbS2+F2pgEhqclo+u3
   D1izABvv2D3P29RhGficmqa+fmc4bc4ccqaRwqN2T9jNMnOPTJRYaUYYY
   A==;
X-CSE-ConnectionGUID: fUlfQiOgR6+zj+S+TPbDNw==
X-CSE-MsgGUID: WyQ8a/jzQKStLAO/F0UA/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34696140"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="34696140"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 19:39:35 -0700
X-CSE-ConnectionGUID: YUfKDBDLQnyG7HqzOxSihA==
X-CSE-MsgGUID: ZTHQgopVQwuL/xcntPkIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67433426"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 19:39:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj8am-000KMQ-0g;
	Wed, 28 Aug 2024 02:39:28 +0000
Date: Wed, 28 Aug 2024 10:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v3 06/29] media: iris: introduce iris core state
 management with shared queues
Message-ID: <202408281019.97M0qU7D-lkp@intel.com>
References: <20240827-iris_v3-v3-6-c5fdbbe65e70@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827-iris_v3-v3-6-c5fdbbe65e70@quicinc.com>

Hi Dikshita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 31aaa7d95e09892c81df0d7c49ae85640fa4e202]

url:    https://github.com/intel-lab-lkp/linux/commits/Dikshita-Agarwal-via-B4-Relay/dt-bindings-media-Add-sm8550-dt-schema/20240827-181059
base:   31aaa7d95e09892c81df0d7c49ae85640fa4e202
patch link:    https://lore.kernel.org/r/20240827-iris_v3-v3-6-c5fdbbe65e70%40quicinc.com
patch subject: [PATCH v3 06/29] media: iris: introduce iris core state management with shared queues
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408281019.97M0qU7D-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281019.97M0qU7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281019.97M0qU7D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/iris/iris_probe.c:8:
   In file included from drivers/media/platform/qcom/iris/iris_core.h:10:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
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
   In file included from drivers/media/platform/qcom/iris/iris_probe.c:8:
   In file included from drivers/media/platform/qcom/iris/iris_core.h:10:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
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
   In file included from drivers/media/platform/qcom/iris/iris_probe.c:8:
   In file included from drivers/media/platform/qcom/iris/iris_core.h:10:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
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
   In file included from drivers/media/platform/qcom/iris/iris_probe.c:8:
   In file included from drivers/media/platform/qcom/iris/iris_core.h:10:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2669:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/qcom/iris/iris_probe.c:114:35: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     114 |         dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(64));
         |         ~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   8 warnings generated.


vim +114 drivers/media/platform/qcom/iris/iris_probe.c

    59	
    60	static int iris_probe(struct platform_device *pdev)
    61	{
    62		struct device *dev = &pdev->dev;
    63		struct iris_core *core;
    64		u64 dma_mask;
    65		int ret;
    66	
    67		core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
    68		if (!core)
    69			return -ENOMEM;
    70		core->dev = dev;
    71	
    72		core->state = IRIS_CORE_DEINIT;
    73		mutex_init(&core->lock);
    74	
    75		core->reg_base = devm_platform_ioremap_resource(pdev, 0);
    76		if (IS_ERR(core->reg_base))
    77			return PTR_ERR(core->reg_base);
    78	
    79		core->irq = platform_get_irq(pdev, 0);
    80		if (core->irq < 0)
    81			return core->irq;
    82	
    83		core->iris_platform_data = of_device_get_match_data(core->dev);
    84		if (!core->iris_platform_data) {
    85			ret = -ENODEV;
    86			dev_err_probe(core->dev, ret, "init platform failed\n");
    87			return ret;
    88		}
    89	
    90		iris_init_ops(core);
    91		ret = iris_init_resources(core);
    92		if (ret) {
    93			dev_err_probe(core->dev, ret, "init resource failed\n");
    94			return ret;
    95		}
    96	
    97		ret = v4l2_device_register(dev, &core->v4l2_dev);
    98		if (ret)
    99			return ret;
   100	
   101		ret = iris_register_video_device(core);
   102		if (ret)
   103			goto err_v4l2_unreg;
   104	
   105		platform_set_drvdata(pdev, core);
   106	
   107		dma_mask = core->iris_platform_data->dma_mask;
   108	
   109		ret = dma_set_mask_and_coherent(dev, dma_mask);
   110		if (ret)
   111			goto err_vdev_unreg;
   112	
   113		dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 > 114		dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(64));
   115	
   116		return 0;
   117	
   118	err_vdev_unreg:
   119		video_unregister_device(core->vdev_dec);
   120	err_v4l2_unreg:
   121		v4l2_device_unregister(&core->v4l2_dev);
   122	
   123		return ret;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

