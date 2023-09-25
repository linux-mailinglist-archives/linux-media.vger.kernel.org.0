Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA167ACE28
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 04:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjIYCea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 22:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjIYCe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 22:34:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18A3C2
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 19:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695609262; x=1727145262;
  h=date:from:to:cc:subject:message-id;
  bh=MWVhj6VuDvUcuCxJqL0hNILwj2fndrjYWPRFzZ4KW9E=;
  b=UKGRtiB/CQhoA9DP0PrOQ+ZALo9JbviPTTRMNbQYN7urn7Zt3vuP4sJJ
   i/5k3JvXpmYtCtpYZ//FzfAh3ZRMGvkK4x9UVk5AtPIn9G3BgadsH4QzS
   CEaM/7Z0lakRMFsf6iL3TJRqyBbq9Z45Szqgg+zT0aAPYg2/8+UrYwQ1Y
   +cx7QUW+ChYBZQ0rkCuGJe+ZnZu2JS0gPK8UT0i4/D1ps7sFHxBzF/qCR
   eYvZLBcqUcP7kv9ujp3gyyVdxW+gp+BW88sA/dGzilfGxlMV2acqCRCjZ
   RMiUy5e8LUWUiyFTpRHOQaNwfEhNhVOWyNNRyGXUyjY3g0iWaBQLaaqrk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361405348"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="361405348"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="871899293"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="871899293"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Sep 2023 19:34:20 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qkbQQ-0000tG-0b;
        Mon, 25 Sep 2023 02:34:18 +0000
Date:   Mon, 25 Sep 2023 10:34:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 ecdcf40f8de5c43837eecf44f4927cfd4e1b7f5d
Message-ID: <202309251056.6BEee5Uc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: ecdcf40f8de5c43837eecf44f4927cfd4e1b7f5d  media: ov2740: Add support for embedded data

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309232011.PQpo1XF0-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309241313.6p8jnKN4-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/v4l2-core/v4l2-subdev.c:946:3: error: fallthrough annotation does not directly precede switch label

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- x86_64-randconfig-121-20230924
|   `-- drivers-media-i2c-ccs-ccs-core.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-123-20230923
|   `-- drivers-media-i2c-ccs-ccs-core.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- x86_64-randconfig-123-20230924
    `-- drivers-media-i2c-ccs-ccs-core.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
clang_recent_errors
`-- arm-multi_v5_defconfig
    `-- drivers-media-v4l2-core-v4l2-subdev.c:error:fallthrough-annotation-does-not-directly-precede-switch-label

elapsed time: 3199m

configs tested: 216
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20230923   gcc  
arc                   randconfig-001-20230924   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230923   gcc  
arm                   randconfig-001-20230924   gcc  
arm                             rpc_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230923   gcc  
i386         buildonly-randconfig-001-20230924   gcc  
i386         buildonly-randconfig-002-20230923   gcc  
i386         buildonly-randconfig-002-20230924   gcc  
i386         buildonly-randconfig-003-20230923   gcc  
i386         buildonly-randconfig-003-20230924   gcc  
i386         buildonly-randconfig-004-20230923   gcc  
i386         buildonly-randconfig-004-20230924   gcc  
i386         buildonly-randconfig-005-20230923   gcc  
i386         buildonly-randconfig-005-20230924   gcc  
i386         buildonly-randconfig-006-20230923   gcc  
i386         buildonly-randconfig-006-20230924   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230923   gcc  
i386                  randconfig-001-20230924   gcc  
i386                  randconfig-002-20230923   gcc  
i386                  randconfig-002-20230924   gcc  
i386                  randconfig-003-20230923   gcc  
i386                  randconfig-003-20230924   gcc  
i386                  randconfig-004-20230923   gcc  
i386                  randconfig-004-20230924   gcc  
i386                  randconfig-005-20230923   gcc  
i386                  randconfig-005-20230924   gcc  
i386                  randconfig-006-20230923   gcc  
i386                  randconfig-006-20230924   gcc  
i386                  randconfig-011-20230923   gcc  
i386                  randconfig-011-20230924   gcc  
i386                  randconfig-012-20230923   gcc  
i386                  randconfig-012-20230924   gcc  
i386                  randconfig-013-20230923   gcc  
i386                  randconfig-013-20230924   gcc  
i386                  randconfig-014-20230923   gcc  
i386                  randconfig-014-20230924   gcc  
i386                  randconfig-015-20230923   gcc  
i386                  randconfig-015-20230924   gcc  
i386                  randconfig-016-20230923   gcc  
i386                  randconfig-016-20230924   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20230923   gcc  
loongarch             randconfig-001-20230924   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230923   gcc  
riscv                 randconfig-001-20230924   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230923   gcc  
s390                  randconfig-001-20230924   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230923   gcc  
sparc                 randconfig-001-20230924   gcc  
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
x86_64       buildonly-randconfig-001-20230923   gcc  
x86_64       buildonly-randconfig-001-20230924   gcc  
x86_64       buildonly-randconfig-002-20230923   gcc  
x86_64       buildonly-randconfig-002-20230924   gcc  
x86_64       buildonly-randconfig-003-20230923   gcc  
x86_64       buildonly-randconfig-003-20230924   gcc  
x86_64       buildonly-randconfig-004-20230923   gcc  
x86_64       buildonly-randconfig-004-20230924   gcc  
x86_64       buildonly-randconfig-005-20230923   gcc  
x86_64       buildonly-randconfig-005-20230924   gcc  
x86_64       buildonly-randconfig-006-20230923   gcc  
x86_64       buildonly-randconfig-006-20230924   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230923   gcc  
x86_64                randconfig-001-20230924   gcc  
x86_64                randconfig-002-20230923   gcc  
x86_64                randconfig-002-20230924   gcc  
x86_64                randconfig-003-20230923   gcc  
x86_64                randconfig-003-20230924   gcc  
x86_64                randconfig-004-20230923   gcc  
x86_64                randconfig-004-20230924   gcc  
x86_64                randconfig-005-20230923   gcc  
x86_64                randconfig-005-20230924   gcc  
x86_64                randconfig-006-20230923   gcc  
x86_64                randconfig-006-20230924   gcc  
x86_64                randconfig-011-20230923   gcc  
x86_64                randconfig-011-20230924   gcc  
x86_64                randconfig-012-20230923   gcc  
x86_64                randconfig-012-20230924   gcc  
x86_64                randconfig-013-20230923   gcc  
x86_64                randconfig-013-20230924   gcc  
x86_64                randconfig-014-20230923   gcc  
x86_64                randconfig-014-20230924   gcc  
x86_64                randconfig-015-20230923   gcc  
x86_64                randconfig-015-20230924   gcc  
x86_64                randconfig-016-20230923   gcc  
x86_64                randconfig-016-20230924   gcc  
x86_64                randconfig-071-20230923   gcc  
x86_64                randconfig-071-20230924   gcc  
x86_64                randconfig-072-20230923   gcc  
x86_64                randconfig-072-20230924   gcc  
x86_64                randconfig-073-20230923   gcc  
x86_64                randconfig-073-20230924   gcc  
x86_64                randconfig-074-20230923   gcc  
x86_64                randconfig-074-20230924   gcc  
x86_64                randconfig-075-20230923   gcc  
x86_64                randconfig-075-20230924   gcc  
x86_64                randconfig-076-20230923   gcc  
x86_64                randconfig-076-20230924   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
