Return-Path: <linux-media+bounces-1053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E287F9687
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 00:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3AC2B20AAC
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 23:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D564171B4;
	Sun, 26 Nov 2023 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdofOado"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CB1110
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 15:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701041538; x=1732577538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eSGOVDGOfF41McDYad4M0WERbduQ43MdkaHP+w2BF9U=;
  b=RdofOadosAgGF/1f9hRAXwTuGH5rzj+NFs4dh9PDVo8/PMndH1MK/aeP
   FvekwuDlCWQpxu9KioLjfVW5p16k/OPhiAckoEV1L3Lnj6WDF5EEVgGx9
   a0mngZrspIPwfJDR96HTc49f0IsFHTaNR/ouj7Zw9F10xO0AsNN3aQOoO
   5/eOcXbDyDq6zonRtsXUpwoWxLB3nU0LEAhg1UqRnoSfKA/+XVeVNhyXV
   MREaCVkA/iip+xlUWdvpth1t3KdycWCLyAnOAjzKfNWpD48puXPcLDMre
   eB4c7mWjmWAuDvNahEEB4pMVYm6KCPxZswgl3hY3wkz5hjQISBIZhmJDP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="395431134"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="395431134"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 15:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="744397078"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="744397078"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Nov 2023 15:32:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Obm-0005cz-1d;
	Sun, 26 Nov 2023 23:32:14 +0000
Date: Mon, 27 Nov 2023 07:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:test 19/20]
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:265:10:
 error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
Message-ID: <202311270523.oY7F5QcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git test
head:   1c12986c58defb1d262ac0fa851066fc724e617e
commit: 4c7fd566e013fd0ec5cfc3243b63bf2804c4e9fe [19/20] media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231127/202311270523.oY7F5QcG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270523.oY7F5QcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270523.oY7F5QcG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:265:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
     265 |         .init_cfg               = dcmipp_par_init_cfg,
         |          ^~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:265:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
     265 |         .init_cfg               = dcmipp_par_init_cfg,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:265:35: note: (near initialization for 'dcmipp_par_pad_ops.enum_mbus_code')
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:266:35: warning: initialized field overwritten [-Woverride-init]
     266 |         .enum_mbus_code         = dcmipp_par_enum_mbus_code,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:266:35: note: (near initialization for 'dcmipp_par_pad_ops.enum_mbus_code')
   cc1: some warnings being treated as errors
--
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:386:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
     386 |         .init_cfg               = dcmipp_byteproc_init_cfg,
         |          ^~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:386:35: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
     386 |         .init_cfg               = dcmipp_byteproc_init_cfg,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:386:35: note: (near initialization for 'dcmipp_byteproc_pad_ops.enum_mbus_code')
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:387:35: warning: initialized field overwritten [-Woverride-init]
     387 |         .enum_mbus_code         = dcmipp_byteproc_enum_mbus_code,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:387:35: note: (near initialization for 'dcmipp_byteproc_pad_ops.enum_mbus_code')
   cc1: some warnings being treated as errors


vim +265 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

634e86dc5acd3b Hugues Fruchet 2023-11-22  263  
634e86dc5acd3b Hugues Fruchet 2023-11-22  264  static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
634e86dc5acd3b Hugues Fruchet 2023-11-22 @265  	.init_cfg		= dcmipp_par_init_cfg,
634e86dc5acd3b Hugues Fruchet 2023-11-22  266  	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
634e86dc5acd3b Hugues Fruchet 2023-11-22  267  	.enum_frame_size	= dcmipp_par_enum_frame_size,
634e86dc5acd3b Hugues Fruchet 2023-11-22  268  	.get_fmt		= v4l2_subdev_get_fmt,
634e86dc5acd3b Hugues Fruchet 2023-11-22  269  	.set_fmt		= dcmipp_par_set_fmt,
634e86dc5acd3b Hugues Fruchet 2023-11-22  270  };
634e86dc5acd3b Hugues Fruchet 2023-11-22  271  

:::::: The code at line 265 was first introduced by commit
:::::: 634e86dc5acd3bf25891b31a44dc128bdb9a3403 media: stm32-dcmipp: STM32 DCMIPP camera interface driver

:::::: TO: Hugues Fruchet <hugues.fruchet@foss.st.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

