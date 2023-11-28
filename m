Return-Path: <linux-media+bounces-1183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E43E7FB049
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 04:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A8AB1C20A5D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 03:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAEB6AB2;
	Tue, 28 Nov 2023 03:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA4i9i+t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D9D138
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 19:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701140528; x=1732676528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDTtIpWBohf/64FUTpMBvx4lIwvNW2ut1N0lwzecmds=;
  b=JA4i9i+tYughh0yg+1eUgkEMB5/4HpSPpxeaaNQywW6ZQSRGNQhrgyHD
   1P5iG4asFFLb3kH4EVnNSoNEQfK4WABhXlocsAMfHaNfrRvnx9mVL3QwB
   UymiBOgQI3UeHTIqaHby01qxKNhediEepgw9E9Vv92b3/FHKp3XrRu+Q1
   tanQlIDB2dS2vf7tdrEs9kCGkWlP0R/yb4liW9dXExjeGHqWSSNF7V3c6
   ismpqZ33KmfIvBdqGi43Kh0cB3Tj3c0FWX3h399tz4RhFNwOi+YQRI8x6
   2RecjMbp54bLDhmg+HD6YDN9B9X/BaOQff0xGlU58NuWupEnJcfdpMRZ5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459341793"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="459341793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 19:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="9801650"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2023 19:02:06 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7oMO-0006v4-0T;
	Tue, 28 Nov 2023 03:02:04 +0000
Date: Tue, 28 Nov 2023 11:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:master 23/37]
 drivers/media/i2c/st-mipid02.c:645:10: error: 'const struct
 v4l2_subdev_pad_ops' has no member named 'init_cfg'
Message-ID: <202311280836.uk1CGJnl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   bdfbc0f7b7d2b8e9a2ddeb2da7f003c4f60da97e
commit: 8ffec8ae6b0650048ac015fff01e0d49ec24eca9 [23/37] media: i2c: st-mipid02: use active state to store pad formats
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231128/202311280836.uk1CGJnl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280836.uk1CGJnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280836.uk1CGJnl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/st-mipid02.c:645:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'init_cfg'
     645 |         .init_cfg = mipid02_init_cfg,
         |          ^~~~~~~~
>> drivers/media/i2c/st-mipid02.c:645:21: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
     645 |         .init_cfg = mipid02_init_cfg,
         |                     ^~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:645:21: note: (near initialization for 'mipid02_pad_ops.enum_mbus_code')
   drivers/media/i2c/st-mipid02.c:646:27: warning: initialized field overwritten [-Woverride-init]
     646 |         .enum_mbus_code = mipid02_enum_mbus_code,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:646:27: note: (near initialization for 'mipid02_pad_ops.enum_mbus_code')
   cc1: some warnings being treated as errors


vim +645 drivers/media/i2c/st-mipid02.c

   643	
   644	static const struct v4l2_subdev_pad_ops mipid02_pad_ops = {
 > 645		.init_cfg = mipid02_init_cfg,
   646		.enum_mbus_code = mipid02_enum_mbus_code,
   647		.get_fmt = v4l2_subdev_get_fmt,
   648		.set_fmt = mipid02_set_fmt,
   649	};
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

