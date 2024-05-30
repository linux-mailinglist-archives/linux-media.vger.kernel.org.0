Return-Path: <linux-media+bounces-12225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD118D45ED
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 09:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BFF9B20B11
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 07:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D268139566;
	Thu, 30 May 2024 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q83v1VUs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C561B7E9;
	Thu, 30 May 2024 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717053541; cv=none; b=sOL81fkf8uzneO6x8mjyriDtflomeFqjdf4lfV3XQpd7WMPabazWoVXuzPweZZqMEA26UNvgkRv+NwmZ/TeJdo1gJdhlI7MHXf7ajg0tT93cAzPEx4wNe4oyCHO2q5ne6bvugBLKdq+yhO4RBmpXoFoaIQqp75SAsaH9vtSuZlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717053541; c=relaxed/simple;
	bh=Z0xan/ivmoAPz+DU5pt3583E8qR7Fl6rcusxJ3qoYlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sqd+ddqVAFAHel5oTDxQV9CUjx05V1KDQSAgty590EwLLQol+iAneVfcZ5fNYlKB29w2qxT9zm5ywTGy7JKQAGE+p8IBlrXd87VZQUrD6m34gp2F/hqoPF9rqYJka5NRr+2pxoS0mFuWrAHs/Q+BnT+EWpL4FY+xzaJTuLlOxfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q83v1VUs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717053539; x=1748589539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z0xan/ivmoAPz+DU5pt3583E8qR7Fl6rcusxJ3qoYlQ=;
  b=Q83v1VUsL2gXB9RxHIA+F61CX2PkB5Qav3YTPgEyNiBYh0DnSEB44CHs
   KCWspC2dalrddjHUzA06yurfl44K8zwQ/FOUsW+Y3rO87aGhWyvKBRXGT
   vm+HqC8vVQR01M/Hi8S04qeS9Q0bJlfSDVinnQoQtPvdWOwxP/GQN0yXz
   8Eh65rKURt0VNuZ/EDJ+1aV+v7Txuv7T/SwOnx0sqsIFFZB5f78tCB+W/
   4MscSLmekUE7TbLHZqZISicuwRg2axxH38J87qV3LRH/pOMyFQ1Bu9SuR
   In2Km5zdur+My2eZsEOgy/Db2c9t1dq9wr4lufTkRAqEz476WjqHkodBW
   A==;
X-CSE-ConnectionGUID: rgFBuyShSPa2QznCQMVY6g==
X-CSE-MsgGUID: DaTWssjwSjq3cRuVJOk+Ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13456969"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13456969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 00:18:59 -0700
X-CSE-ConnectionGUID: g49QkoMFTdGWZ4Azzcrr/Q==
X-CSE-MsgGUID: m6TjW4d7TYSZL/krcAFKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35665727"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 00:18:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCa3o-000EwX-0L;
	Thu, 30 May 2024 07:18:52 +0000
Date: Thu, 30 May 2024 15:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
	dan.scally@ideasonboard.com
Subject: Re: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video
 node
Message-ID: <202405301558.no1nWGU1-lkp@intel.com>
References: <20240529152858.183799-16-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-16-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[cannot apply to linuxtv-media-stage/master sailus-media-tree/master linus/master sailus-media-tree/streams v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-uapi-Add-MEDIA_BUS_FMT_RGB202020_1X60-format-code/20240529-233239
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240529152858.183799-16-dan.scally%40ideasonboard.com
patch subject: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video node
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240530/202405301558.no1nWGU1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301558.no1nWGU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301558.no1nWGU1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/arm/mali-c55/mali-c55-params.c:14:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
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
   In file included from drivers/media/platform/arm/mali-c55/mali-c55-params.c:14:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/arm/mali-c55/mali-c55-params.c:14:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
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
   In file included from drivers/media/platform/arm/mali-c55/mali-c55-params.c:14:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/arm/mali-c55/mali-c55-params.c:505:4: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     504 |                 dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
         |                                                                        ~~~
         |                                                                        %zu
     505 |                         config->total_size);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   8 warnings generated.


vim +505 drivers/media/platform/arm/mali-c55/mali-c55-params.c

   480	
   481	void mali_c55_params_write_config(struct mali_c55 *mali_c55)
   482	{
   483		struct mali_c55_params *params = &mali_c55->params;
   484		enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
   485		struct mali_c55_params_buffer *config;
   486		struct mali_c55_buffer *buf;
   487		size_t block_offset = 0;
   488	
   489		spin_lock(&params->buffers.lock);
   490	
   491		buf = list_first_entry_or_null(&params->buffers.queue,
   492					       struct mali_c55_buffer, queue);
   493		if (buf)
   494			list_del(&buf->queue);
   495		spin_unlock(&params->buffers.lock);
   496	
   497		if (!buf)
   498			return;
   499	
   500		buf->vb.sequence = mali_c55->isp.frame_sequence;
   501		config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
   502	
   503		if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
   504			dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
 > 505				config->total_size);
   506			state = VB2_BUF_STATE_ERROR;
   507			goto err_buffer_done;
   508		}
   509	
   510		/* Walk the list of parameter blocks and process them. */
   511		while (block_offset < config->total_size) {
   512			const struct mali_c55_block_handler *block_handler;
   513			struct mali_c55_params_block_header *block;
   514	
   515			block = (struct mali_c55_params_block_header *)
   516				 &config->data[block_offset];
   517	
   518			if (block->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
   519				dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
   520				state = VB2_BUF_STATE_ERROR;
   521				goto err_buffer_done;
   522			}
   523	
   524			block_handler = &mali_c55_block_handlers[block->type];
   525			if (block->size != block_handler->size) {
   526				dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
   527				state = VB2_BUF_STATE_ERROR;
   528				goto err_buffer_done;
   529			}
   530	
   531			block_handler->handler(mali_c55, block);
   532	
   533			block_offset += block->size;
   534		}
   535	
   536	err_buffer_done:
   537		vb2_buffer_done(&buf->vb.vb2_buf, state);
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

