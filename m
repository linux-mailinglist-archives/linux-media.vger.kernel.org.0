Return-Path: <linux-media+bounces-22498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B79E1356
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 07:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E6A7B232CF
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 06:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBE6188CD8;
	Tue,  3 Dec 2024 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR67SNQf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AB918950A
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 06:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733207272; cv=none; b=OfDQCOKiwsLTARzc5PEItbeOpTfmJkAe3iofPBX61H5lLm15rBjC/N7NbHjwXTsn9M0vh2L8unBG86Wifow8nXUUAZTA2iiUN0IN2NVfwEkaOhI8bTAW5m6pOztUz92yL833sWfnEdSX1fOZgApYK9SzXZPmd+hK/RNVjv5GD7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733207272; c=relaxed/simple;
	bh=tGPmuQ65i6ioB0kA3QwAyIe4Q81G4fXjVCPUo6GNWhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5tdN4XralRCET7j1EFm8DoNuhE/dcPVFPkQaCrd4Rs32Gg16cRDKa/m87O33Aa4rtUSydrZJ+tCZ+ZvEusJK9oXwp0H2xDFijScQm7dmQtqEsBLNGuqP6xS3p1zjr7M4RxeUTAahj2cutpz3rGOPqwBph5gYVECt0Roe0nu0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eR67SNQf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733207271; x=1764743271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGPmuQ65i6ioB0kA3QwAyIe4Q81G4fXjVCPUo6GNWhA=;
  b=eR67SNQfh+NpJPA/XjdTFZ3wipggaCxfllzqiofOrcprl6zYMUuE/iec
   HHS3ZIasKYSXl79elrp6afMgm2KWYlI2zTeR2AmakfMppshIEu4QZnPJJ
   FicIZtgvvdNCQb9CP5XqbP9tbudMKGV2/j/Ixq1gOT+RN3bp4ng2VFuSB
   DamgrczgRr8BTqg39OagYDfI5kqBNCGRsNgVW3HLxuc8OeSDOvfWVkKZ4
   m6wjfYajtbED2zQQO9xmTFjKTpbA4TTvlF4NC4mX6+16FYqAga8UMDc0u
   Qioc5HDB+yxwACahz94S0WEJymFsemDKggT42ELAOkoEf0HxU+oHn70vn
   Q==;
X-CSE-ConnectionGUID: PVbkroztSAybRZU0xl6hbQ==
X-CSE-MsgGUID: VVQmdYQtSKmY2WEVDVVF7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44787994"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44787994"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:27:51 -0800
X-CSE-ConnectionGUID: VCaoUmTbR4a4iAZPmXvPcQ==
X-CSE-MsgGUID: 430lORpjSI2d5jX29ndqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="94165658"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 22:27:48 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIMNt-0000Db-1U;
	Tue, 03 Dec 2024 06:27:45 +0000
Date: Tue, 3 Dec 2024 14:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/5] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Message-ID: <202412031405.75enPqVg-lkp@intel.com>
References: <20241202145831.127297-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202145831.127297-3-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master media-tree/master v6.13-rc1 next-20241128]
[cannot apply to sailus-media-tree/streams sailus-media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-v4l2-Add-Renesas-Camera-Receiver-Unit-pixel-formats/20241203-014151
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20241202145831.127297-3-dan.scally%40ideasonboard.com
patch subject: [PATCH v3 2/5] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241203/202412031405.75enPqVg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031405.75enPqVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031405.75enPqVg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:10:
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
   In file included from drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:10:
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
   In file included from drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:10:
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
   In file included from drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:21:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:261:2: warning: comparison of distinct pointer types ('typeof ((mbps)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     261 |         do_div(mbps, 1000000);
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   8 warnings generated.


vim +261 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c

   238	
   239	static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
   240	{
   241		struct v4l2_subdev *source = csi2->remote_source;
   242		const struct rzg2l_csi2_format *format;
   243		const struct v4l2_mbus_framefmt *fmt;
   244		struct v4l2_subdev_state *state;
   245		s64 mbps;
   246	
   247		state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
   248		fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
   249		format = rzg2l_csi2_code_to_fmt(fmt->code);
   250		v4l2_subdev_unlock_state(state);
   251	
   252		/* Read the link frequency from remote subdevice. */
   253		mbps = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
   254					  csi2->lanes);
   255		if (mbps < 0) {
   256			dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
   257				source->name);
   258			return -EINVAL;
   259		}
   260	
 > 261		do_div(mbps, 1000000);
   262	
   263		return mbps;
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

