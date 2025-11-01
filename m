Return-Path: <linux-media+bounces-46116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E9C27CB8
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 12:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CAE7189D676
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D2C2F5A2A;
	Sat,  1 Nov 2025 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxfJq7h6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C402EBDD6;
	Sat,  1 Nov 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761996546; cv=none; b=jji6JFLnXDIteUXi41UBqfK5H4at/hQfH90GNiZr5u0zSQ58CAF36lEyc3mR4IA1+mRpSijp5FdK5ZPL+Zg2vc7ECYNbO/K0j2S+y+SCzk6y6ofsul437zhZkH0QB/JzH4QhyPDuPb505Mhwdg5eDhkWRsabkd0dU07GjJFoASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761996546; c=relaxed/simple;
	bh=Reok4oEuIAaxqAgmj0W2bIeJU4APzPDb2Uj5NGGYoJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luM+IBelyyYapgbICy5peGdyptB2sv4+wYndVelTiJ4J5W3ri4Z2SvBagJV6oYzfz9bE2QipC6omr7zaPKA/EvcafrX5ZtfS67r5ukDlx2dYZPFA9fiU80ffkBfHu0Jfzh6tQxkjs8i2omsxxEClxV4PJejXLaU8kv83w9vc8qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxfJq7h6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761996543; x=1793532543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Reok4oEuIAaxqAgmj0W2bIeJU4APzPDb2Uj5NGGYoJI=;
  b=LxfJq7h6nlqEhK0aQBIt5/CjznfSKlvsMb4+IT3xkdLh97pivLLBjPyv
   /TwHYFm8LA1fpTGhM8o9f7658Y5u8YFYUAqQYAcRTxt8fkFlQ/tGrh5kS
   kIk3/ophOg4PZ4Skm6jNhCO8o9I6suuSmWMKwca2vKK0CnWxTpBM4txGP
   ++kewSF7WybErWevSJdWDIddgJlgo1X7X7HlM7cIjSiFFlkGf6PxTOEn9
   rgJ8j2or0Q4EAwOcTrEd0MdfclJFGRmm/tX8/759chtb0hGpUoW33aJbq
   gJFxx08efNP8HtAB5GZkrHKMGlShi2HYBtPNU5PXUu9u0Ta5Kgk1cLrC+
   w==;
X-CSE-ConnectionGUID: YLzi93uwSBq0b/Rv/zY/8w==
X-CSE-MsgGUID: xmVmJOCdSUK9+jZk+QZBrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64031509"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64031509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:29:03 -0700
X-CSE-ConnectionGUID: cKgZ26MZRE2lzqT36WXJvQ==
X-CSE-MsgGUID: rpFU1DQ1RS6UsQlYYlZchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="187183168"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2025 04:28:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9mx-000OBq-01;
	Sat, 01 Nov 2025 11:28:55 +0000
Date: Sat, 1 Nov 2025 19:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add
 cmdq_pkt_jump_rel_temp() for removing shift_pa
Message-ID: <202511011919.0lkK3DY8-lkp@intel.com>
References: <20251031160309.1654761-3-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031160309.1654761-3-jason-jh.lin@mediatek.com>

Hi Jason-JH,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/soc-mediatek-Use-pkt_write-function-pointer-for-subsys-ID-compatibility/20251101-000555
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251031160309.1654761-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa
config: x86_64-buildonly-randconfig-001-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011919.0lkK3DY8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011919.0lkK3DY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011919.0lkK3DY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmsys.c:14:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   drivers/soc/mediatek/mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
   drivers/soc/mediatek/mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   3 errors generated.
--
   In file included from drivers/soc/mediatek/mtk-mutex.c:12:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   drivers/soc/mediatek/mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   2 errors generated.
--
   In file included from mtk-mmsys.c:14:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
   mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   3 errors generated.
--
   In file included from mtk-mutex.c:12:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/EIMVAL +530 include/linux/soc/mediatek/mtk-cmdq.h

   526	
   527	/* This wrapper has to be removed after all users migrated to jump_rel */
   528	static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
   529	{
 > 530		return -EIMVAL;
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

