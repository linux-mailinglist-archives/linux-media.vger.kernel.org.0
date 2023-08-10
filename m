Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A79776E98
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 05:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbjHJDfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 23:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjHJDfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 23:35:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019582103
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 20:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691638500; x=1723174500;
  h=date:from:to:cc:subject:message-id;
  bh=bPPp4tJE11yykiI4vCwT/89+ZR8c2ehl09TASqZz7xw=;
  b=cnL2TVCy95BoDdAmvD23mzUr7wnT1nNciOK0zHf2+r5aoE5Orp5xpvSL
   IWVZ1EQuKpCUEdvMfJes42xqqUDbJW6x5bMgYA61jGw0Ze917fGFo8lxk
   7OAIAdokI3vjAZWs+9W0Ud5ctH8oiCuDxVBEKN/Xvnb9Ic1Nwj4StfmhG
   d4R3MwlTDpIz599vmObRU/KQpQx0c1sku/oUpx6XENFCx1xjqo9E6xwaq
   ds4S6+6FiOGPSqTlcqoXjxk72u2gA21GhqQQz6sYUhnPp7pEDnDO2suDe
   ddmmzkmMKozoiguhiXtE2aVT5qFl80wB18trBoNCIK1qS1CqdmlGc3+V7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="437645048"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="437645048"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 20:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="732053233"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="732053233"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 20:34:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qTwRt-0006he-1r;
        Thu, 10 Aug 2023 03:34:57 +0000
Date:   Thu, 10 Aug 2023 11:34:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 2908042a37b56d6a9a595eca946e187e9d2df39a
Message-ID: <202308101101.stHi2L0v-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: 2908042a37b56d6a9a595eca946e187e9d2df39a  media: imx: imx7-media-csi: Fix applying format constraints

elapsed time: 822m

configs tested: 107
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230809   gcc  
alpha                randconfig-r005-20230809   gcc  
alpha                randconfig-r006-20230809   gcc  
alpha                randconfig-r022-20230809   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230809   gcc  
arc                  randconfig-r034-20230809   gcc  
arc                  randconfig-r043-20230809   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230809   clang
arm                  randconfig-r046-20230809   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230809   clang
hexagon              randconfig-r045-20230809   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230809   gcc  
i386         buildonly-randconfig-r005-20230809   gcc  
i386         buildonly-randconfig-r006-20230809   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230809   gcc  
i386                 randconfig-i002-20230809   gcc  
i386                 randconfig-i003-20230809   gcc  
i386                 randconfig-i004-20230809   gcc  
i386                 randconfig-i005-20230809   gcc  
i386                 randconfig-i006-20230809   gcc  
i386                 randconfig-i011-20230809   clang
i386                 randconfig-i012-20230809   clang
i386                 randconfig-i013-20230809   clang
i386                 randconfig-i014-20230809   clang
i386                 randconfig-i015-20230809   clang
i386                 randconfig-i016-20230809   clang
i386                 randconfig-r011-20230809   clang
i386                 randconfig-r033-20230809   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230809   gcc  
loongarch            randconfig-r035-20230809   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230809   gcc  
m68k                 randconfig-r036-20230809   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230809   gcc  
nios2                randconfig-r026-20230809   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230809   gcc  
parisc               randconfig-r024-20230809   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230809   gcc  
riscv                randconfig-r042-20230809   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230809   clang
s390                 randconfig-r044-20230809   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230809   gcc  
sh                   randconfig-r023-20230809   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230809   gcc  
x86_64       buildonly-randconfig-r002-20230809   gcc  
x86_64       buildonly-randconfig-r003-20230809   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r021-20230809   clang
x86_64               randconfig-x001-20230809   clang
x86_64               randconfig-x002-20230809   clang
x86_64               randconfig-x003-20230809   clang
x86_64               randconfig-x004-20230809   clang
x86_64               randconfig-x005-20230809   clang
x86_64               randconfig-x006-20230809   clang
x86_64               randconfig-x011-20230809   gcc  
x86_64               randconfig-x012-20230809   gcc  
x86_64               randconfig-x013-20230809   gcc  
x86_64               randconfig-x014-20230809   gcc  
x86_64               randconfig-x015-20230809   gcc  
x86_64               randconfig-x016-20230809   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
