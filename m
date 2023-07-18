Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533DC7578B1
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 12:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbjGRKAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 06:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjGRJ7m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 05:59:42 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193B91986
        for <linux-media@vger.kernel.org>; Tue, 18 Jul 2023 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689674376; x=1721210376;
  h=date:from:to:cc:subject:message-id;
  bh=nFX24Bhr5KQ1cMDV/yQNx3scOL7WPGiaHsQX91ToGl4=;
  b=KZWWZW1bKM9ZQbGLmnHixbxNJUQtpPCCwEWC0qCDWZJXaBeTwNnH1UWQ
   khgJoynwwGWnhnQMWDLC35lDa077HudWq5jjL4wbObMJRQeNuBLgZLikj
   nt+azm6j/Y4ltGYxmaIfiif8RvPUApvSxkYT2TUHqHVDGVS+l1XGWVoCZ
   h8Tfw0CX5UitpNGHHPuU6gwdnxYfL/Cn8jX3SzerHRRn1btUgtnFTs5dw
   f01i82WRFsE6jpEgY2EHMtHDvk66OL3Xx5njsGQe7TQqP2agt4UpuaYoK
   ED/rBv3OA174ddrRtCSu3SjhvNgk5yMhcJbydMkpvK3NVIIFCa/qoRTSQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429924363"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="429924363"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 02:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="700846498"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="700846498"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 02:59:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLhUT-0000Sz-2W;
        Tue, 18 Jul 2023 09:59:33 +0000
Date:   Tue, 18 Jul 2023 17:59:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi] BUILD REGRESSION
 fc1105d215634df27a5ff95ce8505d999e40d8b6
Message-ID: <202307181703.WLXQdVHW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git async-multi
branch HEAD: fc1105d215634df27a5ff95ce8505d999e40d8b6  debug print

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307180320.jErFaHnP-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:828:9: error: too few arguments to function 'v4l2_async_nf_init'
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1511:15: error: too many arguments to function 'v4l2_async_nf_register'
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1511:38: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   |-- drivers-staging-media-atomisp-pci-atomisp_csi2_bridge.c:error:too-few-arguments-to-function-v4l2_async_nf_init
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-v4l2_async_nf_register-from-incompatible-pointer-type
|   `-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:too-many-arguments-to-function-v4l2_async_nf_register
`-- x86_64-allyesconfig
    |-- drivers-staging-media-atomisp-pci-atomisp_csi2_bridge.c:error:too-few-arguments-to-function-v4l2_async_nf_init
    |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-v4l2_async_nf_register-from-incompatible-pointer-type
    `-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:too-many-arguments-to-function-v4l2_async_nf_register

elapsed time: 800m

configs tested: 135
configs skipped: 3

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r016-20230717   gcc  
arc                  randconfig-r043-20230717   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                  randconfig-r006-20230717   gcc  
arm                  randconfig-r046-20230717   clang
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230717   clang
arm64                randconfig-r013-20230717   gcc  
arm64                randconfig-r034-20230717   clang
csky                                defconfig   gcc  
csky                 randconfig-r023-20230717   gcc  
hexagon              randconfig-r041-20230717   clang
hexagon              randconfig-r045-20230717   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230717   clang
i386         buildonly-randconfig-r005-20230717   clang
i386         buildonly-randconfig-r006-20230717   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230717   clang
i386                 randconfig-i002-20230717   clang
i386                 randconfig-i003-20230717   clang
i386                 randconfig-i004-20230717   clang
i386                 randconfig-i005-20230717   clang
i386                 randconfig-i006-20230717   clang
i386                 randconfig-i011-20230717   gcc  
i386                 randconfig-i012-20230717   gcc  
i386                 randconfig-i013-20230717   gcc  
i386                 randconfig-i014-20230717   gcc  
i386                 randconfig-i015-20230717   gcc  
i386                 randconfig-i016-20230717   gcc  
i386                 randconfig-r035-20230717   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                           mtx1_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                       rbtx49xx_defconfig   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r012-20230717   gcc  
openrisc             randconfig-r021-20230717   gcc  
openrisc             randconfig-r024-20230717   gcc  
openrisc             randconfig-r032-20230717   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r001-20230717   gcc  
parisc               randconfig-r015-20230717   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r026-20230717   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230717   clang
riscv                randconfig-r033-20230717   clang
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230717   gcc  
s390                 randconfig-r044-20230717   gcc  
sh                               allmodconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r002-20230717   gcc  
sh                   randconfig-r014-20230717   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230717   gcc  
sparc                randconfig-r036-20230717   gcc  
sparc64              randconfig-r003-20230717   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r031-20230717   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r011-20230717   gcc  
x86_64               randconfig-x001-20230717   gcc  
x86_64               randconfig-x002-20230717   gcc  
x86_64               randconfig-x003-20230717   gcc  
x86_64               randconfig-x004-20230717   gcc  
x86_64               randconfig-x005-20230717   gcc  
x86_64               randconfig-x006-20230717   gcc  
x86_64               randconfig-x011-20230717   clang
x86_64               randconfig-x012-20230717   clang
x86_64               randconfig-x013-20230717   clang
x86_64               randconfig-x014-20230717   clang
x86_64               randconfig-x015-20230717   clang
x86_64               randconfig-x016-20230717   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
