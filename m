Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFAF7634A7
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 13:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjGZLUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 07:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjGZLUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 07:20:18 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7B597
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690370416; x=1721906416;
  h=date:from:to:cc:subject:message-id;
  bh=RoRAfce9Bt+FqsTKnkiXVbkiZ+md+9ZdajgH2jeM+sk=;
  b=aQ9+muZubzJ1fBPE0cy3s1N4ZbaaFvjR9o9DPIrHJv/HU3PsQprhrHXu
   TB+3W7sIO81752K1Azpx8f/7uBoiqJK0QbqjWlQytir2GABE1ft5o9f+Z
   WyjnYTIYeZm6LaEhD9a6UpzjSPhayMMe1C2c+cL5IIYLMAvfhG/yWOkht
   gRzY3Z4bm1mtdgsrAC4JNEpaSahmDVAeavX3MjK4++wRNzxHuQD8CdJuU
   MsUSz2uHaXkRGWiApwsYD3NmzKjZIxjGaC/Gm/ifoVRPLn6ZuOfiIOdy/
   YLs+OcynmvC/XbzhNrG/oP/sDBnHajZ/HNJMfN5ETLJJ8FMCM8aH0HiYu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431787924"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="431787924"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 04:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850432121"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="850432121"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 04:19:59 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOcYh-0000v3-0O;
        Wed, 26 Jul 2023 11:19:59 +0000
Date:   Wed, 26 Jul 2023 19:19:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi] BUILD SUCCESS
 2c119bed650596d35a3f9e4407d58c42f97d56fb
Message-ID: <202307261909.xqt9eMlF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git async-multi
branch HEAD: 2c119bed650596d35a3f9e4407d58c42f97d56fb  media: Documentation: v4l: Document sub-device notifiers

elapsed time: 794m

configs tested: 154
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230726   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230726   gcc  
arc                  randconfig-r043-20230725   gcc  
arc                  randconfig-r043-20230726   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r032-20230726   clang
arm                  randconfig-r046-20230726   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230725   clang
arm64                randconfig-r032-20230725   clang
csky                                defconfig   gcc  
csky                 randconfig-r001-20230725   gcc  
csky                 randconfig-r021-20230725   gcc  
hexagon              randconfig-r005-20230725   clang
hexagon              randconfig-r011-20230725   clang
hexagon              randconfig-r014-20230726   clang
hexagon              randconfig-r023-20230725   clang
hexagon              randconfig-r023-20230726   clang
hexagon              randconfig-r036-20230726   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r004-20230726   gcc  
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r005-20230726   gcc  
i386         buildonly-randconfig-r006-20230725   clang
i386         buildonly-randconfig-r006-20230726   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i001-20230726   gcc  
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i002-20230726   gcc  
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i003-20230726   gcc  
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i004-20230726   gcc  
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i005-20230726   gcc  
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i006-20230726   gcc  
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i011-20230726   clang
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i012-20230726   clang
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i013-20230726   clang
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i014-20230726   clang
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i015-20230726   clang
i386                 randconfig-i016-20230725   gcc  
i386                 randconfig-i016-20230726   clang
i386                 randconfig-r003-20230725   clang
i386                 randconfig-r006-20230726   gcc  
i386                 randconfig-r026-20230725   gcc  
i386                 randconfig-r036-20230725   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230726   gcc  
m68k                 randconfig-r002-20230726   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r024-20230725   clang
mips                 randconfig-r035-20230726   clang
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r034-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230726   gcc  
powerpc              randconfig-r005-20230726   gcc  
powerpc              randconfig-r013-20230725   gcc  
powerpc              randconfig-r022-20230725   gcc  
powerpc              randconfig-r032-20230725   clang
powerpc              randconfig-r035-20230725   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230725   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230725   gcc  
s390                 randconfig-r033-20230725   clang
s390                 randconfig-r036-20230725   clang
s390                 randconfig-r044-20230725   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230726   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230725   clang
um                   randconfig-r026-20230725   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r001-20230726   gcc  
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r002-20230726   gcc  
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64       buildonly-randconfig-r003-20230726   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r004-20230725   clang
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x001-20230726   clang
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x002-20230726   clang
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x003-20230726   clang
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x004-20230726   clang
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x005-20230726   clang
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x006-20230726   clang
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x011-20230726   gcc  
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x012-20230726   gcc  
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x013-20230726   gcc  
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x014-20230726   gcc  
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x015-20230726   gcc  
x86_64               randconfig-x016-20230725   clang
x86_64               randconfig-x016-20230726   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r006-20230725   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
