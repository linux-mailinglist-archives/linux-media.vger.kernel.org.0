Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245CD7493FD
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 05:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbjGFDG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 23:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbjGFDGZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 23:06:25 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D7F1BD5
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 20:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688612780; x=1720148780;
  h=date:from:to:cc:subject:message-id;
  bh=8rEvX0FTGwTfxzoRWejZwAsalNKwamdhhdYLM0JXaAM=;
  b=F0ulvkO90Mv3mmdU10ciCBSrttmzgQqeNANsqd98Tp2ZWKKfJ4bWDDL+
   WUg1GXKRo1mh5WSn/abyu5sqK6jAzaztJTfYxF7J1UEdXlDjw/DlKNxUX
   CaK+y1eKroygfLXVMe1HdcoZM627mbBm9qVPPImyalQgCof7VzeiRA0Q8
   HJ1cq3Qj9kpxYuYEXFY507Fz1etJxevcu9YGkKlNSMLGfqkDZ5308EFt9
   qdWkp9nOOl8wfNYpeDPmPhYM6V+UVFu92K3DRLOvbKA3lbSTDS04ccgv7
   BBU2pqF5fngBVXIZiltIYDPU+dcrLA4ipBNHsB8hGmP2oPVyXZ8GPbNtk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="360966889"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="360966889"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 20:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="1049932487"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="1049932487"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2023 20:06:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qHFJt-00011w-2I;
        Thu, 06 Jul 2023 03:06:13 +0000
Date:   Thu, 06 Jul 2023 11:05:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 c1be03fb0d730a1687a242327ea07ac29e941510
Message-ID: <202307061114.pwaLwGk5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: c1be03fb0d730a1687a242327ea07ac29e941510  media: MAINTAINERS: Add documentation under V4L2 camera sensors

elapsed time: 722m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230705   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r046-20230705   gcc  
arm                         s5pv210_defconfig   clang
arm                         socfpga_defconfig   clang
arm                        spear3xx_defconfig   clang
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230705   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r002-20230705   clang
hexagon              randconfig-r041-20230705   clang
hexagon              randconfig-r045-20230705   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230705   gcc  
i386         buildonly-randconfig-r005-20230705   gcc  
i386         buildonly-randconfig-r006-20230705   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230705   gcc  
i386                 randconfig-i002-20230705   gcc  
i386                 randconfig-i003-20230705   gcc  
i386                 randconfig-i004-20230705   gcc  
i386                 randconfig-i005-20230705   gcc  
i386                 randconfig-i006-20230705   gcc  
i386                 randconfig-i011-20230705   clang
i386                 randconfig-i012-20230705   clang
i386                 randconfig-i013-20230705   clang
i386                 randconfig-i014-20230705   clang
i386                 randconfig-i015-20230705   clang
i386                 randconfig-i016-20230705   clang
i386                 randconfig-r006-20230705   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230705   gcc  
m68k                           sun3_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                          malta_defconfig   clang
mips                 randconfig-r005-20230705   clang
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230705   gcc  
nios2                randconfig-r034-20230705   gcc  
nios2                randconfig-r035-20230705   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r004-20230705   gcc  
openrisc             randconfig-r032-20230705   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230705   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc              randconfig-r025-20230705   clang
powerpc                     skiroot_defconfig   clang
powerpc                    socrates_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r014-20230705   clang
riscv                randconfig-r042-20230705   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230705   clang
sh                               allmodconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230705   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64              randconfig-r013-20230705   gcc  
sparc64              randconfig-r026-20230705   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230705   gcc  
x86_64       buildonly-randconfig-r002-20230705   gcc  
x86_64       buildonly-randconfig-r003-20230705   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230705   gcc  
x86_64               randconfig-r024-20230705   clang
x86_64               randconfig-r033-20230705   gcc  
x86_64               randconfig-r036-20230705   gcc  
x86_64               randconfig-x001-20230705   clang
x86_64               randconfig-x002-20230705   clang
x86_64               randconfig-x003-20230705   clang
x86_64               randconfig-x004-20230705   clang
x86_64               randconfig-x005-20230705   clang
x86_64               randconfig-x006-20230705   clang
x86_64               randconfig-x011-20230705   gcc  
x86_64               randconfig-x012-20230705   gcc  
x86_64               randconfig-x013-20230705   gcc  
x86_64               randconfig-x014-20230705   gcc  
x86_64               randconfig-x015-20230705   gcc  
x86_64               randconfig-x016-20230705   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r016-20230705   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
