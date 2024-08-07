Return-Path: <linux-media+bounces-15957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D44394B2ED
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 00:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DD51F22392
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 22:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B61A15444E;
	Wed,  7 Aug 2024 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwtvR4dv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B696146A7A;
	Wed,  7 Aug 2024 22:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069172; cv=none; b=D5WWwBdqg6wYZjfMbkRK3jJfOdMABQs3fNt16r5PDtjkr3A/hdHnYtp1dxpkeCK3zkkYSl3ouUKTz6FJ/tkAvYchLJMXNbB0irHFwSAfGirI0WMD4/crtYS6HJxn5xejnT+muGKXG5hsN7kuHxtezChrOYeqKUL0+hKurK8gJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069172; c=relaxed/simple;
	bh=IVYXIWKGlvai2Nw4bIQ4c+3y+TNTnHUC1vLvdJPUyXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwY0Dos6mKHohrmpIL6owdd9J9bF0XO1Bsz1wq1oh1A9L+WHa5Url5BvEsuTD4E1NFq3YMp+dErLSMo/Ns8KNPbT16MU5tFZ/pcl9FweU+TnZuzloQS81e+h3j93nu3/+0ZYPdUhHDBwPVZx3eZcWcMkV1uNyf3+KPI2jxNYcEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwtvR4dv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723069168; x=1754605168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IVYXIWKGlvai2Nw4bIQ4c+3y+TNTnHUC1vLvdJPUyXM=;
  b=AwtvR4dvHfRXtB392LA7aAXBEBklcyEglGqwrfUV3yT+JcWoJDM39rdh
   Ge1X8D2QAtjiyhBEtVsWAU4ruSxRpJwUiAfMr6UWtm0fIBRNkq0hpYHde
   SMXdSgUoIng1BDCG18own6fUI/TTBo4ZEx8pMxrWhHOrsljTnRulAep7K
   ovDI0Uzg+tZAv825EOLpm1HpgIOMgYmX16YOuDZioXzBywWXvai3D68lj
   E7KshwnruIjP1Z5+C+iREHlVa/GupcCIM/Kg1cRDtLCWC1GQPaUMvnTSC
   AutlXW5sqiCxeRSjX0wVQVCRKGgeElsMD7QYbPkphG9uErTiV8TlEmFj9
   w==;
X-CSE-ConnectionGUID: r5mESlX7QRmJhOiE7C8KLw==
X-CSE-MsgGUID: Wh4VyPCdQoiyRdDMcbxDeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31839791"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="31839791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 15:19:26 -0700
X-CSE-ConnectionGUID: JCRXln45QsOASf/GHJjkFg==
X-CSE-MsgGUID: Mr1BAUkySh6+SJtqhfgZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56686251"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 15:19:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbp05-0005lG-0M;
	Wed, 07 Aug 2024 22:19:21 +0000
Date: Thu, 8 Aug 2024 06:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
	mchehab@kernel.org, angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
Message-ID: <202408080501.8b0EGVQW-lkp@intel.com>
References: <20240807130835.26739-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807130835.26739-1-jianhua.lin@mediatek.com>

Hi Jianhua,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc2 next-20240807]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lin/media-mediatek-jpeg-support-34bits/20240807-211309
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240807130835.26739-1-jianhua.lin%40mediatek.com
patch subject: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080501.8b0EGVQW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080501.8b0EGVQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080501.8b0EGVQW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:9:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:9:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:9:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2669:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:104:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |                                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
         |                                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:111:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |                                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
         |                                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:138:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:144:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
         |                       ^
   7 warnings and 4 errors generated.
--
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:9:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:9:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:9:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2669:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:294:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:312:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:353:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     353 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(ptr));
         |                       ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:367:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr));
         |                       ^
   7 warnings and 4 errors generated.


vim +/FIELD_PREP +104 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

    87	
    88	void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
    89				  struct vb2_buffer *src_buf)
    90	{
    91		int i;
    92		dma_addr_t dma_addr;
    93		u32 val;
    94		u32 upper;
    95		bool support_34bit = ctx->jpeg->variant->support_34bit;
    96	
    97		for (i = 0; i < src_buf->num_planes; i++) {
    98			dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
    99				   src_buf->planes[i].data_offset;
   100			if (!i) {
   101				writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
   102				if (support_34bit) {
   103					upper = upper_32_bits(dma_addr);
 > 104					val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
   105					writel(val, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);
   106				}
   107			} else {
   108				writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
   109				if (support_34bit) {
   110					upper = upper_32_bits(dma_addr);
   111					val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
   112					writel(val, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);
   113				}
   114			}
   115		}
   116	}
   117	EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

