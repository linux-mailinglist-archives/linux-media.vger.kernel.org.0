Return-Path: <linux-media+bounces-2890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72B81C03C
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 22:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8307A1F24017
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 21:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159F376DCB;
	Thu, 21 Dec 2023 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AggnbadP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0716F76DD0
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703194492; x=1734730492;
  h=date:from:to:cc:subject:message-id;
  bh=oGKPSPYTjniGBJzojLR46+FJivtrXQaceiaRVXsPxXs=;
  b=AggnbadP00QSHbB/v9lIQtOmood7x+/5FBxaIUOX4gNJqYtiaiVOOgOH
   n33nBxrqXHHQFR+yL55LicGZbx05xXi0DEVVEKq6Y06QTvrP7e7Hcn2ba
   9x0dWkWCTWls4axDbDDQRSbzd/ABmYd6KxMdoIoIo3KauUnUtLIVqELk4
   hBfFx58kLwJRCMil8xPmsJucBMnJ8qNXHCi9+uz7NZuTqSC1QhjxAxpqi
   j2OohOetl7pyIKMxpOALbw0e3p/LNGL3XHypd0Bb3qvZgCvjksXVoP24e
   KgBpM8eLYx3SFThSDq4sB6UgnXMPIlJ5CpMjSLErQy7rov9IEqld+1ibW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="398828017"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="398828017"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 13:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="18827314"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2023 13:34:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGQg5-0008jo-0T;
	Thu, 21 Dec 2023 21:34:30 +0000
Date: Fri, 22 Dec 2023 05:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD REGRESSION
 9587641ab37e563866fb73acc04735eccd59a2d3
Message-ID: <202312220543.6mkTi3BB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: 9587641ab37e563866fb73acc04735eccd59a2d3  media: mc: Add nop implementations of media_device_{init,cleanup}

Error/Warning: (recently discovered and may have been fixed)

./scripts/kernel-doc: ./include/media/media-devnode.h:88: warning: Excess struct member 'media_dev' description in 'media_devnode'
drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:568:54: error: incompatible type for argument 1 of 'media_devnode_is_registered'
drivers/media/test-drivers/visl/visl-core.c:511:50: error: incompatible type for argument 1 of 'media_devnode_is_registered'
sound/usb/media.c:125:61: error: incompatible type for argument 1 of 'media_devnode_is_registered'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-defconfig
|   `-- drivers-media-platform-mediatek-vcodec-decoder-mtk_vcodec_dec_drv.c:error:incompatible-type-for-argument-of-media_devnode_is_registered
|-- loongarch-allmodconfig
|   `-- drivers-media-test-drivers-visl-visl-core.c:error:incompatible-type-for-argument-of-media_devnode_is_registered
|-- loongarch-defconfig
|   `-- sound-usb-media.c:error:incompatible-type-for-argument-of-media_devnode_is_registered
`-- x86_64-allnoconfig
    `-- scripts-kernel-doc:.-include-media-media-devnode.h:warning:Excess-struct-member-media_dev-description-in-media_devnode

elapsed time: 1477m

configs tested: 8
configs skipped: 0

tested configs:
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

