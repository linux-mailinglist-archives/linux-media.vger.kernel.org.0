Return-Path: <linux-media+bounces-3335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96789827252
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 16:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436BB283A2D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 15:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFBB4C3C8;
	Mon,  8 Jan 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jer3Io5O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678CE4C3D4
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704726693; x=1736262693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jyoSU0rdsdQzYOBLs4/Tihy6Pvy3AI1hql9RL97Lr8E=;
  b=Jer3Io5OupGV5zTYxJtOy0lFC3ncv4Sl34UerRkLe+ErvxfREFR2Q+LT
   NS3t71PoQ3257rvn1XAItkYwgZqCQeaby3Uv+juz3Mf3BhUV0pIr/szMn
   3m9WCPNxFWXLgC11mdi61O3wYCWs95WnlMTJ08WL3ToB65odJICFdAftO
   D0ylnxCCmYQQH0fgkReCCHPNYeYDW4cHxw3Hzib9QxPETKvfICOg80oBW
   tH0hTbDkfC9Dx0x57DTuHCTOn/WjYGM8ZBCKc7EutpggntJcRu3S/2zdn
   RbPD00NwZJ8hjaGaJHWqA0m66vAnjdPaFRtRVBWmVokmJhs4iEHiaatkd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="396791914"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="396791914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 07:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="904831304"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="904831304"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Jan 2024 07:11:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMrHh-0004oU-0m;
	Mon, 08 Jan 2024 15:11:25 +0000
Date: Mon, 8 Jan 2024 23:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 1/4] media: v4l: Add a helper for setting up
 link-frequencies control
Message-ID: <202401082245.yka9kMRc-lkp@intel.com>
References: <20240108075221.15757-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108075221.15757-2-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master sailus-media-tree/streams linus/master v6.7 next-20240108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Add-a-helper-for-setting-up-link-frequencies-control/20240108-155716
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240108075221.15757-2-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 1/4] media: v4l: Add a helper for setting up link-frequencies control
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240108/202401082245.yka9kMRc-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401082245.yka9kMRc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401082245.yka9kMRc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-common.c:634:19: error: use of undeclared identifier 'v4l2_link_frequencies_to_bitmap'; did you mean 'v4l2_link_freq_to_bitmap'?
     634 | EXPORT_SYMBOL_GPL(v4l2_link_frequencies_to_bitmap);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   v4l2_link_freq_to_bitmap
   include/linux/export.h:87:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^
   include/linux/export.h:83:54: note: expanded from macro '_EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:74:16: note: expanded from macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^
   drivers/media/v4l2-core/v4l2-common.c:589:5: note: 'v4l2_link_freq_to_bitmap' declared here
     589 | int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
         |     ^
   1 error generated.


vim +634 drivers/media/v4l2-core/v4l2-common.c

   588	
   589	int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
   590				     unsigned int num_of_fw_link_freqs,
   591				     const s64 *driver_link_freqs,
   592				     unsigned int num_of_driver_link_freqs,
   593				     unsigned long *bitmap)
   594	{
   595		unsigned int i;
   596	
   597		*bitmap = 0;
   598	
   599		if (!num_of_fw_link_freqs) {
   600			dev_err(dev, "no link frequencies in firmware\n");
   601			return -ENODATA;
   602		}
   603	
   604		for (i = 0; i < num_of_fw_link_freqs; i++) {
   605			unsigned int j;
   606	
   607			for (j = 0; j < num_of_driver_link_freqs; j++) {
   608				if (fw_link_freqs[i] != driver_link_freqs[j])
   609					continue;
   610	
   611				dev_dbg(dev, "enabling link frequency %lld Hz\n",
   612					driver_link_freqs[j]);
   613				*bitmap |= BIT(j);
   614				break;
   615			}
   616		}
   617	
   618		if (!*bitmap) {
   619			dev_err(dev, "no matching link frequencies found\n");
   620	
   621			dev_dbg(dev, "specified in firmware:\n");
   622			for (i = 0; i < num_of_fw_link_freqs; i++)
   623				dev_dbg(dev, "\t%llu Hz\n", fw_link_freqs[i]);
   624	
   625			dev_dbg(dev, "driver supported:\n");
   626			for (i = 0; i < num_of_driver_link_freqs; i++)
   627				dev_dbg(dev, "\t%lld Hz\n", driver_link_freqs[i]);
   628	
   629			return -ENOENT;
   630		}
   631	
   632		return 0;
   633	}
 > 634	EXPORT_SYMBOL_GPL(v4l2_link_frequencies_to_bitmap);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

