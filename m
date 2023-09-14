Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8816D79FCD4
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 09:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235854AbjINHJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 03:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbjINHJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 03:09:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAACCCE5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694675358; x=1726211358;
  h=date:from:to:cc:subject:message-id;
  bh=lyDe18ycTjfiyf7zmCypfWL4hE8AFqhUthtK3vutCC8=;
  b=RbfZxTgxr2kh0mURGHj+gp36hVccbr855Dg3S0Y4zc5PcVOoUyNCa1/c
   GDKpH8V/LjFWH628lj5NMwEhXdBZtS4KQMwJFjuskjEwkv9vdkrdFZwom
   zipzENoREGDkMdFKes9Sp8uexEEXK5HGKw+spZS2jVHeqZ/hybs16smDC
   jaCB5cEnr7nbxfL+eMhmHlGBso4WcHwITRxbn2DYvTXMp+fxau6m8zn2Y
   bxZ3hSzqqedUcaOq6Hv9yciPSyYx7IGJmug1VZr9s1a8JmGBrSJs/+fzi
   TV+vmsaOntWymgBrCXUXNvPuLb/1qR0LCL7W23YWs8JJ+SXWImdwD99SJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369146747"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="369146747"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 00:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="744431840"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="744431840"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Sep 2023 00:09:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qggTS-0001Iv-2o;
        Thu, 14 Sep 2023 07:09:14 +0000
Date:   Thu, 14 Sep 2023 15:09:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS WITH WARNING
 677e6a2139a965fa6eee306d4b015a95b427ef34
Message-ID: <202309141503.Uisy3X44-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 677e6a2139a965fa6eee306d4b015a95b427ef34  media: ov2740: Add support for embedded data

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309130842.vMagrOma-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/media/i2c/ccs/ccs-core.c:2059:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- alpha-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- arc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- arc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- csky-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- csky-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- csky-randconfig-002-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- i386-randconfig-001-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- loongarch-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- loongarch-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- m68k-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- m68k-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- microblaze-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- microblaze-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- microblaze-randconfig-r023-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- nios2-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- nios2-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- nios2-randconfig-r033-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- openrisc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- openrisc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- parisc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- parisc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sh-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sh-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sparc-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sparc-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sparc-randconfig-r031-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sparc64-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- sparc64-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-allmodconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-allyesconfig
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-buildonly-randconfig-002-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-buildonly-randconfig-002-20230914
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-buildonly-randconfig-006-20230913
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-randconfig-003-20230914
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-randconfig-013-20230914
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-randconfig-015-20230914
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-randconfig-016-20230914
|   `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration
`-- x86_64-randconfig-072-20230914
    `-- drivers-media-i2c-ccs-ccs-core.c:warning:static-is-not-at-beginning-of-declaration

elapsed time: 1901m

configs tested: 184
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230913   gcc  
alpha                randconfig-r023-20230913   gcc  
alpha                randconfig-r026-20230913   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230913   gcc  
arc                  randconfig-r013-20230913   gcc  
arc                  randconfig-r022-20230913   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230913   gcc  
arm                   randconfig-001-20230914   gcc  
arm                  randconfig-r015-20230913   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230913   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230913   gcc  
hexagon               randconfig-001-20230913   clang
hexagon               randconfig-002-20230913   clang
hexagon              randconfig-r002-20230913   clang
i386         buildonly-randconfig-001-20230914   gcc  
i386         buildonly-randconfig-002-20230914   gcc  
i386         buildonly-randconfig-003-20230914   gcc  
i386         buildonly-randconfig-004-20230914   gcc  
i386         buildonly-randconfig-005-20230914   gcc  
i386         buildonly-randconfig-006-20230914   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230913   gcc  
i386                  randconfig-001-20230914   gcc  
i386                  randconfig-002-20230913   gcc  
i386                  randconfig-002-20230914   gcc  
i386                  randconfig-003-20230913   gcc  
i386                  randconfig-003-20230914   gcc  
i386                  randconfig-004-20230913   gcc  
i386                  randconfig-004-20230914   gcc  
i386                  randconfig-005-20230913   gcc  
i386                  randconfig-005-20230914   gcc  
i386                  randconfig-006-20230913   gcc  
i386                  randconfig-006-20230914   gcc  
i386                  randconfig-011-20230914   gcc  
i386                  randconfig-012-20230914   gcc  
i386                  randconfig-013-20230914   gcc  
i386                  randconfig-014-20230914   gcc  
i386                  randconfig-015-20230914   gcc  
i386                  randconfig-016-20230914   gcc  
i386                 randconfig-r004-20230913   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230913   gcc  
loongarch            randconfig-r002-20230913   gcc  
loongarch            randconfig-r024-20230913   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230913   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r023-20230913   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230913   clang
mips                 randconfig-r016-20230913   gcc  
mips                 randconfig-r022-20230913   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230913   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r006-20230913   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230913   gcc  
parisc               randconfig-r035-20230913   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r016-20230913   clang
powerpc64            randconfig-r001-20230913   gcc  
powerpc64            randconfig-r005-20230913   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230913   gcc  
riscv                randconfig-r004-20230913   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230913   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r011-20230913   gcc  
sh                   randconfig-r023-20230913   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230913   gcc  
sparc                randconfig-r025-20230913   gcc  
sparc                randconfig-r026-20230913   gcc  
sparc                randconfig-r031-20230913   gcc  
sparc                randconfig-r036-20230913   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230913   clang
um                   randconfig-r025-20230913   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230913   gcc  
x86_64       buildonly-randconfig-001-20230914   gcc  
x86_64       buildonly-randconfig-002-20230913   gcc  
x86_64       buildonly-randconfig-002-20230914   gcc  
x86_64       buildonly-randconfig-003-20230913   gcc  
x86_64       buildonly-randconfig-003-20230914   gcc  
x86_64       buildonly-randconfig-004-20230913   gcc  
x86_64       buildonly-randconfig-004-20230914   gcc  
x86_64       buildonly-randconfig-005-20230913   gcc  
x86_64       buildonly-randconfig-005-20230914   gcc  
x86_64       buildonly-randconfig-006-20230913   gcc  
x86_64       buildonly-randconfig-006-20230914   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230914   gcc  
x86_64                randconfig-002-20230914   gcc  
x86_64                randconfig-003-20230914   gcc  
x86_64                randconfig-004-20230914   gcc  
x86_64                randconfig-005-20230914   gcc  
x86_64                randconfig-006-20230914   gcc  
x86_64                randconfig-011-20230914   gcc  
x86_64                randconfig-012-20230914   gcc  
x86_64                randconfig-013-20230914   gcc  
x86_64                randconfig-014-20230914   gcc  
x86_64                randconfig-015-20230914   gcc  
x86_64                randconfig-016-20230914   gcc  
x86_64                randconfig-071-20230914   gcc  
x86_64                randconfig-072-20230914   gcc  
x86_64                randconfig-073-20230914   gcc  
x86_64                randconfig-074-20230914   gcc  
x86_64                randconfig-075-20230914   gcc  
x86_64                randconfig-076-20230914   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r011-20230913   gcc  
xtensa               randconfig-r014-20230913   gcc  
xtensa               randconfig-r026-20230913   gcc  
xtensa               randconfig-r034-20230913   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
