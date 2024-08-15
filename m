Return-Path: <linux-media+bounces-16350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAF953764
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 17:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F451C25263
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0211AD3F5;
	Thu, 15 Aug 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1SLqnN7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B781AD402
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723736134; cv=none; b=eXpemgDIfSa0zYMtlQrf9ceVKhdBwG0C1P/HGZj2x1EpQCejEGGAVsu/gdWUrfbIhuyB4tVOUaU2x5GXXf5M69Zpg2swYS3sorh1GwaVNYua4KqZHaPYOpA4VdMElXJVIRlFiBKNF/9ZyaD/F4Fqofrs8gh1ULKKmO2q81Ds5I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723736134; c=relaxed/simple;
	bh=tSeyrBGRinttEc/Bl0KMHkbu8ZYMzTjZeV1UyXwP8BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeDav9LU1jy7Y5fIw2g1BToqfi8MRqs3xhAlxexl+x70qIAMUBhic5sjil5RvtOFzGxEIDK0zxr/x6oRuFBqOiKctk+i2fbRAoptGdt48qxd2+G1GJ8cvs5g5xYYiuEtFFgosJakQAny3fdjuNor84DrDyTOd7m4DX54Y6NVAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1SLqnN7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723736131; x=1755272131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tSeyrBGRinttEc/Bl0KMHkbu8ZYMzTjZeV1UyXwP8BM=;
  b=K1SLqnN7a/xF7bUpsPYvqdlJag9cIsUdYAbX2T7AWsQxG26uwEWYnMTk
   oPPYcoa8sdSpBt1TmD2d/GN+XqeOwDW5TA/B5YJZCTvDgMf9f8Bi9kmst
   QOy4YBDxZ+V8cp0LxPF2FeQVjX8c+vawguzg4rJJ1pDKWuXpDQqHDGl66
   /s/7y2PhE5mUTAGL7vMLPpposWJMjbeyjhsSiiH2U3wb8dXlwqLJmYy9O
   +0SvF+45krgELhqJUfI3vL9rZ8IzEiobqIiCWy2wu4Tzp+ZAEcHxY93cO
   GT01/eUpobzsh/7x+ycp7qB87ZtHQL7zrgB5mTgA/namTqT4N48X9h8Z0
   Q==;
X-CSE-ConnectionGUID: 66KKyDcwSXqYGvqmVYnhoA==
X-CSE-MsgGUID: Ic3ak8C7QAmNxE/p/k65Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22170740"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="22170740"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 08:35:30 -0700
X-CSE-ConnectionGUID: QeVF/QH+QjGKenuqCcgRMQ==
X-CSE-MsgGUID: ttB0uM89R6+YujKGUAEinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59051723"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2024 08:35:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1secVa-0003mW-1c;
	Thu, 15 Aug 2024 15:35:26 +0000
Date: Thu, 15 Aug 2024 23:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jianhui.j.dai@intel.com, tfiga@chromium.org, bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Message-ID: <202408152355.Qx4KRzRh-lkp@intel.com>
References: <20240815030829.1608953-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815030829.1608953-1-bingbu.cao@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/master linuxtv-media-stage/master linus/master v6.11-rc3 next-20240815]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bingbu-cao-intel-com/media-intel-ipu6-optimize-the-IPU6-MMU-mapping-and-unmapping-flow/20240815-111022
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240815030829.1608953-1-bingbu.cao%40intel.com
patch subject: [PATCH] media: intel/ipu6: optimize the IPU6 MMU mapping and unmapping flow
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240815/202408152355.Qx4KRzRh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408152355.Qx4KRzRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408152355.Qx4KRzRh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-mmu.c:261:9: warning: variable 'unmapped' set but not used [-Wunused-but-set-variable]
     261 |         size_t unmapped = 0;
         |                ^
   1 warning generated.


vim +/unmapped +261 drivers/media/pci/intel/ipu6/ipu6-mmu.c

   254	
   255	static void l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
   256			     phys_addr_t dummy, size_t size)
   257	{
   258		unsigned int l2_entries;
   259		unsigned int l2_idx;
   260		unsigned long flags;
 > 261		size_t unmapped = 0;
   262		u32 l1_idx;
   263		u32 *l2_pt;
   264	
   265		spin_lock_irqsave(&mmu_info->lock, flags);
   266		for (l1_idx = iova >> ISP_L1PT_SHIFT;
   267		     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
   268			dev_dbg(mmu_info->dev,
   269				"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
   270				l1_idx, iova);
   271	
   272			if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
   273				dev_err(mmu_info->dev,
   274					"unmap not mapped iova 0x%8.8lx l1 index %u\n",
   275					iova, l1_idx);
   276				continue;
   277			}
   278			l2_pt = mmu_info->l2_pts[l1_idx];
   279	
   280			l2_entries = 0;
   281			for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
   282			     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
   283				dev_dbg(mmu_info->dev,
   284					"unmap l2 index %u with pteval 0x%10.10llx\n",
   285					l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
   286				l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
   287	
   288				iova += ISP_PAGE_SIZE;
   289				unmapped += ISP_PAGE_SIZE;
   290				size -= ISP_PAGE_SIZE;
   291	
   292				l2_entries++;
   293			}
   294	
   295			WARN_ON_ONCE(!l2_entries);
   296			clflush_cache_range(&l2_pt[l2_idx - l2_entries],
   297					    sizeof(l2_pt[0]) * l2_entries);
   298		}
   299	
   300		WARN_ON_ONCE(size);
   301		spin_unlock_irqrestore(&mmu_info->lock, flags);
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

