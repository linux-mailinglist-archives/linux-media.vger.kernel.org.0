Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3917F7C4CA2
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjJKII0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 04:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjJKIIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 04:08:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5355B92
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697011703; x=1728547703;
  h=date:from:to:cc:subject:message-id;
  bh=zLFlnjaRhfWB3OymcnqRKO85VQuQvOphWi3FeNfrvgI=;
  b=Omi+xNuFQpHOdPSYmMkF9H9aKWh2xUn8yoixCqrd65XSeqEBwb0wqt6W
   BJMcGztLzLrWW4mdOnBDpODI7uUv04vzM4G90wtf+OP7dm2puq/LGbhCT
   FZahc3GW+cLNfQNpUoHFWlu7tmBM95UQ26gsyXW+Nzy9YDgA/CbdQN8FF
   PLWKHC79+1aYTsc/m7wmFF7UMoIwv8U35P4cQUUiwzPlx2m+L71AG7meT
   rKH7XUoqqCumxppcOUAx5fKF0eIoeR/DKB+viCLhFbPvWWZKpbzVbM5M+
   A5/xTz2rhM0l0XHnSutkrDVmxsUWFstt6NEtO87AQzRvxVGZt7ngSFhnV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387448752"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387448752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 01:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="819604323"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="819604323"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2023 01:08:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qqUGR-0001yJ-11;
        Wed, 11 Oct 2023 08:08:19 +0000
Date:   Wed, 11 Oct 2023 16:07:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 278fe7fc8a0bdc0cc01b934edf4e2193b0dc195e
Message-ID: <202310111640.CX79A3Cv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 278fe7fc8a0bdc0cc01b934edf4e2193b0dc195e  media: ov2740: Add support for embedded data

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310101832.SmsDPmoW-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310111512.HGE16GfN-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/ccs/ccs-core.c:2222:22: warning: unused variable 'i' [-Wunused-variable]
drivers/media/i2c/ccs/ccs-core.c:2232:15: warning: unused variable 'i' [-Wunused-variable]
drivers/media/i2c/ccs/ccs-core.c:2232:22: warning: unused variable 'i' [-Wunused-variable]
drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c:269:20: error: too few arguments to function '__v4l2_subdev_state_alloc'
drivers/media/platform/renesas/vsp1/vsp1_entity.c:682:26: error: too few arguments to function '__v4l2_subdev_state_alloc'
drivers/staging/media/tegra-video/vi.c:452:20: error: too few arguments to function '__v4l2_subdev_state_alloc'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arm-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arm-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arm-randconfig-004-20231010
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arm64-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- arm64-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- csky-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- csky-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- i386-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- i386-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- loongarch-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- loongarch-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- loongarch-randconfig-002-20231010
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- m68k-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- m68k-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- microblaze-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- microblaze-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- mips-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- mips-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- nios2-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- nios2-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- openrisc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- openrisc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- parisc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- parisc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- powerpc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- powerpc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- riscv-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- riscv-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- s390-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- s390-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- sh-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- sh-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- sparc-allmodconfig
|   |-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-v4l2.c:error:too-few-arguments-to-function-__v4l2_subdev_state_alloc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:too-few-arguments-to-function-__v4l2_subdev_state_alloc
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-__v4l2_subdev_state_alloc
|-- sparc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- sparc64-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- sparc64-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- x86_64-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
|-- x86_64-buildonly-randconfig-001-20231010
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i
`-- x86_64-randconfig-013-20231010
    `-- drivers-media-i2c-ccs-ccs-core.c:warning:unused-variable-i

elapsed time: 1413m

configs tested: 139
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                   randconfig-001-20231010   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231010   gcc  
i386         buildonly-randconfig-002-20231010   gcc  
i386         buildonly-randconfig-003-20231010   gcc  
i386         buildonly-randconfig-004-20231010   gcc  
i386         buildonly-randconfig-005-20231010   gcc  
i386         buildonly-randconfig-006-20231010   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231010   gcc  
i386                  randconfig-002-20231010   gcc  
i386                  randconfig-003-20231010   gcc  
i386                  randconfig-004-20231010   gcc  
i386                  randconfig-005-20231010   gcc  
i386                  randconfig-006-20231010   gcc  
i386                  randconfig-011-20231010   gcc  
i386                  randconfig-012-20231010   gcc  
i386                  randconfig-013-20231010   gcc  
i386                  randconfig-014-20231010   gcc  
i386                  randconfig-015-20231010   gcc  
i386                  randconfig-016-20231010   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231010   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     tqm8540_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231010   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231010   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231010   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231010   gcc  
x86_64       buildonly-randconfig-002-20231010   gcc  
x86_64       buildonly-randconfig-003-20231010   gcc  
x86_64       buildonly-randconfig-004-20231010   gcc  
x86_64       buildonly-randconfig-005-20231010   gcc  
x86_64       buildonly-randconfig-006-20231010   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231010   gcc  
x86_64                randconfig-002-20231010   gcc  
x86_64                randconfig-003-20231010   gcc  
x86_64                randconfig-004-20231010   gcc  
x86_64                randconfig-005-20231010   gcc  
x86_64                randconfig-006-20231010   gcc  
x86_64                randconfig-011-20231010   gcc  
x86_64                randconfig-012-20231010   gcc  
x86_64                randconfig-013-20231010   gcc  
x86_64                randconfig-014-20231010   gcc  
x86_64                randconfig-015-20231010   gcc  
x86_64                randconfig-016-20231010   gcc  
x86_64                randconfig-071-20231010   gcc  
x86_64                randconfig-072-20231010   gcc  
x86_64                randconfig-073-20231010   gcc  
x86_64                randconfig-074-20231010   gcc  
x86_64                randconfig-075-20231010   gcc  
x86_64                randconfig-076-20231010   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
