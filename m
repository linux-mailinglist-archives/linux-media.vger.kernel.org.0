Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E20176C40D
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 06:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjHBEVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 00:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjHBEVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 00:21:09 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774E911D
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 21:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690950068; x=1722486068;
  h=date:from:to:cc:subject:message-id;
  bh=Q5CS/ZQzqjSjluzvSTBnQKuZB6y5uJwBkSNsPUK4aSc=;
  b=Xzl4LgMRwQ1hYdGj+mlWBkC50ARLTxTVOx0DYJKh0x7BhtO3qDBhjY9S
   YRX6+cBdfl7kN5yPSAljzG1WsT6XQAFK+1ek/JdR6I+z4Qn3t40Y42xgZ
   MtSfTWRcjuSBlxo9IeU4ULF7/5x++x4IYwUg4x25apRA9LaSrzBHEezKM
   AfC+Z0gVlqBnkNlH+6pNhhQv6Y30x78ydU5vUtJihWM/STHoHkS3IYv0Q
   3xQIzsxFGt1xQ1boDE0qutGVSbHmKblC+yyzgRTuMmyY2DAklJwhxCyXY
   uxyWJl1CgLNaibUw6hAgMsGWfZ49jNl4xiou8F6SCulJkS+9zYSqO2R78
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433316302"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="433316302"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 21:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678894238"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="678894238"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Aug 2023 21:21:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qR3MA-0000qp-0E;
        Wed, 02 Aug 2023 04:21:06 +0000
Date:   Wed, 02 Aug 2023 12:20:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:ds9] BUILD SUCCESS
 986bb91315431771994205ba237018de73fa3b1f
Message-ID: <202308021218.lx1NM4St-lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git ds9
branch HEAD: 986bb91315431771994205ba237018de73fa3b1f  media: i2c: ds90ub960: Rename RXPORT_MODE_CSI2_ASYNC to RXPORT_MODE_CSI2_NONSYNC

elapsed time: 724m

configs tested: 116
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r043-20230731   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230731   clang
arm                  randconfig-r033-20230731   clang
arm                  randconfig-r046-20230731   gcc  
arm                         socfpga_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230731   clang
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r045-20230731   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230731   gcc  
i386                 randconfig-i002-20230731   gcc  
i386                 randconfig-i003-20230731   gcc  
i386                 randconfig-i004-20230731   gcc  
i386                 randconfig-i005-20230731   gcc  
i386                 randconfig-i006-20230731   gcc  
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i016-20230801   clang
i386                 randconfig-r024-20230731   clang
i386                 randconfig-r026-20230731   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230731   gcc  
loongarch            randconfig-r014-20230731   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze           randconfig-r023-20230731   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r036-20230731   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230731   gcc  
nios2                randconfig-r005-20230731   gcc  
nios2                randconfig-r006-20230731   gcc  
openrisc             randconfig-r032-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r035-20230731   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230731   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r031-20230731   gcc  
s390                 randconfig-r044-20230731   clang
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r003-20230731   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230731   clang
um                   randconfig-r025-20230731   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r034-20230731   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
