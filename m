Return-Path: <linux-media+bounces-10385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53C8B65C4
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 00:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D26BD1C20FE3
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 22:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA46101E3;
	Mon, 29 Apr 2024 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TajirBVc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7B25A4FF
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714429985; cv=none; b=Rwz138gsvxiuFz9vHNfcc9zbIRYLFzzFUiDwELlsXjhwBo0Sg2/ztar3WEfH3fwUZdyUWzrdOwRMd1W4o6guxGexLdCuF7j8KPOjv4uhuWqlPZdzm9M8eYoAKtaYdBrg0ICw2lqZ9gWZPBU/Oxabo1DHaBT1xzM0alllJUwrXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714429985; c=relaxed/simple;
	bh=RtmiXlewQOCoTlRc83K170GUZTEprQmHQShyfutdg/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WrwBc8EOYtk4/U5TDUvjqF7F0QWOqJ5ExD7sxATTntLta4fleT7jZlrYyg9uRTtZaBDtVe7uX9LfYIC9ORx1Ws2yCr1SMg5cojs60xvCD8zimggpZUvqk3Vzh5ZWeplWAF6vg7lRjFbNnLtnuGn9W64zWUtNXJbCR0WHqPvWKO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TajirBVc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714429983; x=1745965983;
  h=date:from:to:cc:subject:message-id;
  bh=RtmiXlewQOCoTlRc83K170GUZTEprQmHQShyfutdg/M=;
  b=TajirBVc8lSUxqD0U7BTpAMXpYOBERx6BG1o3X6wG9ehfRQU2qeUNCHJ
   ZE/rF3n2MCcce5zAgOxwsMCGzWYsMqTzKyrrC47tVkNoJ5SCsBQm7QVlo
   dKouzccCXpnMEor54yvHlSng6s62QvIZKYHKa9AkuSD0tWYoGH/JnGuoT
   SBLVVjIyCS97NkiWauhXMHIVh/mDB0AKQCtdF+3F1F7WeikwZMqxsGFxT
   j7NwbyR8a4bY5ckE4xHlT008eeGrcHAHrJliMLMBkdTmJjS0HPpR+NAoS
   QLE7HzBidIJgtnZ5EaKpCUrEcDMuLoHH4odgYnc5qFFKijOROdFGJVeM0
   Q==;
X-CSE-ConnectionGUID: IbuBiF1bTWi2iAwUqj+TSw==
X-CSE-MsgGUID: XRDCm9sgSb+Iz4/bOjUB8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9974841"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="9974841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 15:33:02 -0700
X-CSE-ConnectionGUID: UsBXjgwfSQaNjODt5WgNkg==
X-CSE-MsgGUID: UUECYfynSN2J00uyKxOQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="31050586"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 15:33:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1ZYR-0007U6-0P;
	Mon, 29 Apr 2024 22:32:59 +0000
Date: Tue, 30 Apr 2024 06:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD REGRESSION
 308898eb3af1c6530b122a01a5c4b38931717e70
Message-ID: <202404300601.tHRGrTCm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 308898eb3af1c6530b122a01a5c4b38931717e70  media: Kconfig: Select MEDIA_CONTROLLER for VIDEO_V4L2_SUBDEV_API

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202404292239.nNxjfKs4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404292348.ODBLhjxb-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/st-mipid02.c:321:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/i2c/tc358746.c:914:40: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/pci/intel/ipu3/ipu3-cio2.c:317:44: error: passing argument 1 of '__v4l2_get_link_freq' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/media/pci/intel/ivsc/mei_csi.c:291:54: error: passing argument 1 of '__v4l2_get_link_freq' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/media/platform/cadence/cdns-csi2rx.c:184:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/platform/nxp/imx-mipi-csis.c:600:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/platform/nxp/imx8mq-mipi-csi2.c:302:33: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/platform/qcom/camss/camss.c:1339:28: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/platform/ti/cal/cal-camerarx.c:68:28: error: incompatible pointer types passing 'struct v4l2_ctrl_handler *' to parameter of type 'struct v4l2_subdev *' [-Werror,-Wincompatible-pointer-types]
drivers/media/v4l2-core/v4l2-common.c:512:9: error: implicit declaration of function 'v4l2_subdev_call_op' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- i386-allmodconfig
    |-- drivers-media-pci-intel-ipu3-ipu3-cio2.c:error:passing-argument-of-__v4l2_get_link_freq-from-incompatible-pointer-type
    `-- drivers-media-pci-intel-ivsc-mei_csi.c:error:passing-argument-of-__v4l2_get_link_freq-from-incompatible-pointer-type
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-media-v4l2-core-v4l2-common.c:error:implicit-declaration-of-function-v4l2_subdev_call_op-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|-- arm64-allmodconfig
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-qcom-camss-camss.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-ti-cal-cal-camerarx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- arm64-randconfig-003-20240429
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- hexagon-allmodconfig
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-qcom-camss-camss.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-ti-cal-cal-camerarx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- hexagon-randconfig-001-20240429
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-v4l2-core-v4l2-common.c:error:implicit-declaration-of-function-v4l2_subdev_call_op-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|-- i386-buildonly-randconfig-002-20240429
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- i386-buildonly-randconfig-004-20240429
|   |-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- i386-buildonly-randconfig-006-20240429
|   `-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- i386-randconfig-003-20240429
|   `-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- i386-randconfig-015-20240429
|   `-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- powerpc-allyesconfig
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-qcom-camss-camss.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-ti-cal-cal-camerarx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- powerpc64-randconfig-001-20240429
|   `-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- riscv-allmodconfig
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-i2c-tc358746.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-qcom-camss-camss.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-ti-cal-cal-camerarx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|-- riscv-allyesconfig
|   |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   |-- drivers-media-platform-qcom-camss-camss.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
|   `-- drivers-media-platform-ti-cal-cal-camerarx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
`-- s390-allmodconfig
    |-- drivers-media-i2c-st-mipid02.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
    |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
    |-- drivers-media-platform-nxp-imx-mipi-csis.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
    |-- drivers-media-platform-nxp-imx8mq-mipi-csi2.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
    |-- drivers-media-platform-qcom-camss-camss.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types
    `-- drivers-media-platform-ti-cal-cal-camerarx.c:error:incompatible-pointer-types-passing-struct-v4l2_ctrl_handler-to-parameter-of-type-struct-v4l2_subdev-Werror-Wincompatible-pointer-types

elapsed time: 729m

configs tested: 139
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240429   gcc  
arc                   randconfig-002-20240429   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240429   clang
arm                   randconfig-002-20240429   clang
arm                   randconfig-003-20240429   clang
arm                   randconfig-004-20240429   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240429   clang
arm64                 randconfig-002-20240429   gcc  
arm64                 randconfig-003-20240429   clang
arm64                 randconfig-004-20240429   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240429   gcc  
csky                  randconfig-002-20240429   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240429   clang
hexagon               randconfig-002-20240429   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240429   clang
i386         buildonly-randconfig-002-20240429   clang
i386         buildonly-randconfig-003-20240429   gcc  
i386         buildonly-randconfig-004-20240429   clang
i386         buildonly-randconfig-005-20240429   gcc  
i386         buildonly-randconfig-006-20240429   clang
i386                                defconfig   clang
i386                  randconfig-001-20240429   clang
i386                  randconfig-002-20240429   clang
i386                  randconfig-003-20240429   clang
i386                  randconfig-004-20240429   clang
i386                  randconfig-005-20240429   gcc  
i386                  randconfig-006-20240429   clang
i386                  randconfig-011-20240429   gcc  
i386                  randconfig-012-20240429   gcc  
i386                  randconfig-013-20240429   clang
i386                  randconfig-014-20240429   gcc  
i386                  randconfig-015-20240429   clang
i386                  randconfig-016-20240429   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240429   gcc  
loongarch             randconfig-002-20240429   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240429   gcc  
nios2                 randconfig-002-20240429   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240429   gcc  
parisc                randconfig-002-20240429   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240429   gcc  
powerpc               randconfig-002-20240429   gcc  
powerpc               randconfig-003-20240429   gcc  
powerpc64             randconfig-001-20240429   clang
powerpc64             randconfig-002-20240429   clang
powerpc64             randconfig-003-20240429   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240429   gcc  
riscv                 randconfig-002-20240429   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240429   gcc  
s390                  randconfig-002-20240429   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240429   gcc  
sh                    randconfig-002-20240429   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240429   gcc  
sparc64               randconfig-002-20240429   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240429   gcc  
um                    randconfig-002-20240429   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240429   gcc  
xtensa                randconfig-002-20240429   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

