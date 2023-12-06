Return-Path: <linux-media+bounces-1702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A08066DA
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 06:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0545E1C21160
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 05:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B16210952;
	Wed,  6 Dec 2023 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfGiFxds"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEFA18F
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 21:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701842371; x=1733378371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UroJcEo0o4P6l1GUSZOb2GjPv4kdP4cN0l1icHIJdsM=;
  b=GfGiFxds/j8vJbFi3TCt40/uMq8m/bMT4r8OAfPHalG2dS74SMX/XwAy
   OnsseK0OKQTxco1fbZz193jgYq+EyU5vBXOyRoteJ64ezKBN3d0rbZ9R4
   8ojAcAFkWEh9aZIeXPUa/lzABu8n+8aLEEHkSM8uvBaOqN23SY0BrdS+i
   ZhJaBH7riOSVDy4pLwtidDXHLYRZVRiw46jlXW3FrpXs3sp5U3Z3Q6aGc
   x4lXxcF0FaMvwi6Gdxy67RY/wzHQFkmVWxD0OSZDiH0/Qe//+RR9pMzXt
   GO9y+mcqDb18mCLAnC5BtWnRMpqwcoqVI1X9dQzxru+tiB3dGPFLn6/zN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391180035"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="391180035"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771186340"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="771186340"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 21:59:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAkwQ-000ALl-1j;
	Wed, 06 Dec 2023 05:59:26 +0000
Date: Wed, 6 Dec 2023 13:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v14 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <202312061351.GzQ22IuG-lkp@intel.com>
References: <20231201071907.3080126-7-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-7-yunkec@google.com>

Hi Yunke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linuxtv-media-stage/master linus/master v6.7-rc4 next-20231205]
[cannot apply to media-tree/master sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT/20231201-152501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231201071907.3080126-7-yunkec%40google.com
patch subject: [PATCH v14 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
config: hexagon-randconfig-r081-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061351.GzQ22IuG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061351.GzQ22IuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061351.GzQ22IuG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:309:6: warning: no previous prototype for function 'v4l2_ctrl_type_op_minimum' [-Wmissing-prototypes]
     309 | void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
         |      ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     309 | void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
         | ^
         | static 
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:315:6: warning: no previous prototype for function 'v4l2_ctrl_type_op_maximum' [-Wmissing-prototypes]
     315 | void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
         |      ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     315 | void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
         | ^
         | static 
   8 warnings generated.


vim +/v4l2_ctrl_type_op_minimum +309 drivers/media/v4l2-core/v4l2-ctrls-core.c

   308	
 > 309	void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   310				       union v4l2_ctrl_ptr ptr)
   311	{
   312		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
   313	}
   314	
 > 315	void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   316				       union v4l2_ctrl_ptr ptr)
   317	{
   318		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

