Return-Path: <linux-media+bounces-39192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB775B1F474
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 13:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 933BE622BAC
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 11:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986DD27FB10;
	Sat,  9 Aug 2025 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQKBrBuU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77A18FC92;
	Sat,  9 Aug 2025 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754740449; cv=none; b=cswidOkO735nDiD/3bUDxlzQKDEMTgyMczQq9nCe01Dfy0OnWiBRu6FNQUs7T399nl7KjcS4AEWf+NqlKq/c5ldgFgMhiySD22tsTzXe1m2xin1mzJUfAYku/bhhDix3J8q43fFYhBg6Rcg/rMcLYiioYLASWrwg5D2tBRFz1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754740449; c=relaxed/simple;
	bh=mnV+jg9VSYFDZGvhdpkSY2iW8ke8agEGlUQFaLp0wdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcaBhtNAajpvXfHoi4/GmngXJjCqkw1wmt3wZM6SCs2ZxtCQPrjYWF/4N8b2oa8XfxqnV0d8G2bFvuYEG5tfe4SnIqe1CZgkobD33JeMftr/Fz8XOSYapTAl7i9Zim62UCND/L2JSiYf3zzjfGOzF+BUEZSivt3q+gtNx2AYWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQKBrBuU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754740447; x=1786276447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mnV+jg9VSYFDZGvhdpkSY2iW8ke8agEGlUQFaLp0wdY=;
  b=UQKBrBuUhSUkheJjlr+WOMyeY926+hY/9ACw7YQ28QtUrDSvIUzaeMsh
   7V02QqCFw5jZibS9trG3pEniFXtpCsGSTUy/U0k+8gpUt4hQLRbwHKB/O
   HPDyDxVvdAjun22gbj0IjFQ15Kh49uWW0wmjM293V3oVUUPEyhQ7NXIvB
   zcKO+J82mI9naPmhoi5epyy9zcF0ZybkH482sRRAF5srhGb91S+c2VGKH
   I5j85J8Bp+43vhj7MR/J+QSgq+yp7oU2uZ2BhJs66PtaQTA47AjYbdQsH
   P/N2HY8j4MffzFGx+Nmjk0IMr7+JWT9K9HxnWCHGqiR5WkbyTq9lp2Xfd
   Q==;
X-CSE-ConnectionGUID: 23Bv7p+ARGKgQt2T6N8d4w==
X-CSE-MsgGUID: oYiChTHtRcWMfdLYVn3ZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="60868941"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60868941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 04:54:07 -0700
X-CSE-ConnectionGUID: f2pAyptXQOu+WoNR8wp0bQ==
X-CSE-MsgGUID: 6WPcD7jSQQ67d4c9XhBHRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164753875"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Aug 2025 04:54:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uki9B-0004m8-2g;
	Sat, 09 Aug 2025 11:54:01 +0000
Date: Sat, 9 Aug 2025 19:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 10/12] media: rkvdec: Add H264 support for the VDPU383
 variant
Message-ID: <202508091909.RNcoZmVb-lkp@intel.com>
References: <20250808200340.156393-11-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808200340.156393-11-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master next-20250808]
[cannot apply to rockchip/for-next sailus-media-tree/master sailus-media-tree/streams v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-rkvdec-Switch-to-using-structs-instead-of-writel/20250809-041049
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250808200340.156393-11-detlev.casanova%40collabora.com
patch subject: [PATCH v2 10/12] media: rkvdec: Add H264 support for the VDPU383 variant
config: i386-buildonly-randconfig-005-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091909.RNcoZmVb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091909.RNcoZmVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091909.RNcoZmVb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkvdec/rkvdec.c:12:10: fatal error: 'linux/hw_bitfield.h' file not found
      12 | #include <linux/hw_bitfield.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/media/platform/rockchip/rkvdec/rkvdec.c

  > 12	#include <linux/hw_bitfield.h>
    13	#include <linux/clk.h>
    14	#include <linux/genalloc.h>
    15	#include <linux/interrupt.h>
    16	#include <linux/iommu.h>
    17	#include <linux/module.h>
    18	#include <linux/of.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/pm.h>
    21	#include <linux/pm_runtime.h>
    22	#include <linux/slab.h>
    23	#include <linux/videodev2.h>
    24	#include <linux/workqueue.h>
    25	#include <media/v4l2-event.h>
    26	#include <media/v4l2-mem2mem.h>
    27	#include <media/videobuf2-core.h>
    28	#include <media/videobuf2-vmalloc.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

