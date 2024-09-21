Return-Path: <linux-media+bounces-18433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEAD97DDF2
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 18:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B721B21314
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 16:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AED178363;
	Sat, 21 Sep 2024 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcYH+AQ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619BF1547DA;
	Sat, 21 Sep 2024 16:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726937223; cv=none; b=ptSSzsj8CS4KnLtH0oHm9Vg9eyXwk2M0m01wCgSN2/SD5qfbdBiM270+zWbm6ekNRvA3fX8qgDunYUTXPIfcHMohBPKloldt6uPuPRlE7l9yAaNOmZC0uC76CaP004wgwTTYtvTw/x7f0pg6evcxxrnKppw67w5FjnLyrochOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726937223; c=relaxed/simple;
	bh=/JWw/VWWmEDHnNUvCBQmuBP3eyIudZl9rrFt6xIrO08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqlrbTyuUPwb7rfGTU0aLVS/59wko4L13LJFHs8sTH1FbTMlU61/EzTDDULdY5jRV2Oy2zfNf8fkRtUZcNx3J8bgNF2qOJNMu9w/mlepDVjlu8RZCVasirpnMszp33biXoOkOXRF6mASXNvW3sorf5HZdQ7alWzJbLQ/vnjlIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcYH+AQ7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726937221; x=1758473221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/JWw/VWWmEDHnNUvCBQmuBP3eyIudZl9rrFt6xIrO08=;
  b=TcYH+AQ7tnnIZyEwFoGCqYkYH7o4ComyKhbAg5o0kVju19cho0PnZrhD
   ymyDAmm0GhcD2uxzwjeo1zCfz4HGr4ENpWm9hlaWfNK4MlWMSvEycoQIN
   BTyf565oKr3rLRWGYaMBYHXMsPAXDNtes+VQjW+b2qOIIk9ZGZtGG+QsY
   3E+3ESXkGmlQF65ltpjtqnbz1Ho8PyLFThF20kAbv1qYnTkiggCyZZNSb
   mJ/wABT55f1MfS9FY3rvkOw09ojVEj1stazxlOX5xfInQt9V6c5y4f4aI
   zs/LLv5InGQqPPyAyO1vG2TAOsDtSdBiIQANscCAvehP8dKEpogdnvAkC
   w==;
X-CSE-ConnectionGUID: uHpk3KRwTeKcIq53Py5o/g==
X-CSE-MsgGUID: TXC7V7/eQDS4Lfs4M5IB6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36515177"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="36515177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 09:47:00 -0700
X-CSE-ConnectionGUID: YERgT9MgRVekrX2cx5DFYg==
X-CSE-MsgGUID: 0YeFy8izTQ27zoy1u4yyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75572583"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Sep 2024 09:46:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss3G2-000Fbv-2R;
	Sat, 21 Sep 2024 16:46:54 +0000
Date: Sun, 22 Sep 2024 00:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v9 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
Message-ID: <202409220010.vctkHddZ-lkp@intel.com>
References: <20240920-loongson1-nand-v9-2-9cc7b9345a03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-loongson1-nand-v9-2-9cc7b9345a03@gmail.com>

Hi Keguang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 62f92d634458a1e308bb699986b9147a6d670457]

url:    https://github.com/intel-lab-lkp/linux/commits/Keguang-Zhang-via-B4-Relay/dt-bindings-mtd-Add-Loongson-1-NAND-Controller/20240920-191936
base:   62f92d634458a1e308bb699986b9147a6d670457
patch link:    https://lore.kernel.org/r/20240920-loongson1-nand-v9-2-9cc7b9345a03%40gmail.com
patch subject: [PATCH v9 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240922/202409220010.vctkHddZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220010.vctkHddZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220010.vctkHddZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/loongson1_nand.c:349:17: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
     349 |         if (IS_ALIGNED((u32)op->buf, chip->buf_align) &&
         |                        ^~~~~~~~~~~~
   include/linux/align.h:13:30: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                            ^
>> drivers/mtd/nand/raw/loongson1_nand.c:349:17: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'char *' [-Wpointer-to-int-cast]
     349 |         if (IS_ALIGNED((u32)op->buf, chip->buf_align) &&
         |                        ^~~~~~~~~~~~
   include/linux/align.h:13:44: note: expanded from macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                          ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +349 drivers/mtd/nand/raw/loongson1_nand.c

   333	
   334	static int ls1x_nand_dma_transfer(struct ls1x_nfc *nfc,
   335					  struct ls1x_nfc_op *op)
   336	{
   337		struct nand_chip *chip = &nfc->chip;
   338		struct dma_chan *chan = nfc->dma_chan;
   339		struct device *dev = chan->device->dev;
   340		struct dma_async_tx_descriptor *desc;
   341		enum dma_data_direction data_dir =
   342		    op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
   343		enum dma_transfer_direction xfer_dir =
   344		    op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
   345		char *dma_buf = NULL;
   346		dma_addr_t dma_addr;
   347		int ret;
   348	
 > 349		if (IS_ALIGNED((u32)op->buf, chip->buf_align) &&
   350		    IS_ALIGNED(op->len, chip->buf_align)) {
   351			dma_addr = dma_map_single(dev, op->buf, op->len, data_dir);
   352			if (dma_mapping_error(dev, dma_addr)) {
   353				dev_err(dev, "failed to map DMA buffer\n");
   354				return -ENXIO;
   355			}
   356		} else if (!op->is_write) {
   357			dma_buf = dma_alloc_coherent(dev, op->dma_len, &dma_addr,
   358						     GFP_KERNEL);
   359			if (!dma_buf)
   360				return -ENOMEM;
   361		} else {
   362			dev_err(dev, "subpage writing not supported\n");
   363			return -EOPNOTSUPP;
   364		}
   365	
   366		desc = dmaengine_prep_slave_single(chan, dma_addr, op->dma_len,
   367						   xfer_dir, DMA_PREP_INTERRUPT);
   368		if (!desc) {
   369			dev_err(dev, "failed to prepare DMA descriptor\n");
   370			ret = PTR_ERR(desc);
   371			goto err;
   372		}
   373		desc->callback = ls1x_nand_dma_callback;
   374		desc->callback_param = nfc;
   375	
   376		nfc->dma_cookie = dmaengine_submit(desc);
   377		ret = dma_submit_error(nfc->dma_cookie);
   378		if (ret) {
   379			dev_err(dev, "failed to submit DMA descriptor\n");
   380			goto err;
   381		}
   382	
   383		dev_dbg(dev, "issue DMA with cookie=%d\n", nfc->dma_cookie);
   384		dma_async_issue_pending(chan);
   385	
   386		ret = wait_for_completion_timeout(&nfc->dma_complete,
   387						  msecs_to_jiffies(2000));
   388		if (!ret) {
   389			dmaengine_terminate_sync(chan);
   390			reinit_completion(&nfc->dma_complete);
   391			ret = -ETIMEDOUT;
   392			goto err;
   393		}
   394		ret = 0;
   395	
   396		if (dma_buf)
   397			memcpy(op->buf, dma_buf + op->aligned_offset, op->len);
   398	err:
   399		if (dma_buf)
   400			dma_free_coherent(dev, op->dma_len, dma_buf, dma_addr);
   401		else
   402			dma_unmap_single(dev, dma_addr, op->len, data_dir);
   403	
   404		return ret;
   405	}
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

