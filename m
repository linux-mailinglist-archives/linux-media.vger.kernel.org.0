Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6659B7360D6
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 02:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjFTAoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 20:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjFTAoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 20:44:14 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED921997
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687221822; x=1718757822;
  h=date:from:to:cc:subject:message-id;
  bh=lE7mF9aLB0YQswz3oaxpo5ryctxG7uAguH8+svhk2Qk=;
  b=Vj86ab1xUDm7uZVoovhHJ3fEgDFcXnlsW6qW8N3U41d605xdnAG725w3
   QFoiLaVXPYstfdlV2uNSgDHFnb51FmKDwxhQENRYGr/IN/k3kqoHJAh5+
   iMEp/I9Qp47qEii76ni0rShWzdWwQJmsVnaNSh1o2dk3ej3xNeGIs1Rje
   GHFLdjRglwhp8eG0drtRnblNjmlQKgr2jxcwk9wqZjP0jlL0O0PHtd6P6
   EAvS7D9m8FywZS1Hp38xQXaJs4cEgEXDVK6a/S0mUtLA2VNDVaV6Pq0CB
   ecwocqjUYcksHrtUa+g78bs0JCfdovhpYmMwbLhokzsJ102H8woNl+B++
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="425688511"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="425688511"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 17:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="1044044035"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="1044044035"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jun 2023 17:43:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qBPTA-0005IX-13;
        Tue, 20 Jun 2023 00:43:40 +0000
Date:   Tue, 20 Jun 2023 08:42:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 afbb61fca19be4eaf2cfacece749f2815686dde0
Message-ID: <202306200838.L3q2zgKg-lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: afbb61fca19be4eaf2cfacece749f2815686dde0  media: staging: atomisp: select V4L2_FWNODE

elapsed time: 732m

configs tested: 138
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230619   gcc  
alpha                randconfig-r034-20230619   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230619   gcc  
arc                  randconfig-r043-20230619   gcc  
arc                  randconfig-r043-20230620   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                  randconfig-r002-20230619   clang
arm                  randconfig-r003-20230619   clang
arm                  randconfig-r046-20230619   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230619   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230619   gcc  
csky                 randconfig-r004-20230619   gcc  
hexagon              randconfig-r006-20230619   clang
hexagon              randconfig-r041-20230619   clang
hexagon              randconfig-r045-20230619   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230619   gcc  
i386         buildonly-randconfig-r005-20230619   gcc  
i386         buildonly-randconfig-r006-20230619   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230619   gcc  
i386                 randconfig-i002-20230619   gcc  
i386                 randconfig-i003-20230619   gcc  
i386                 randconfig-i004-20230619   gcc  
i386                 randconfig-i005-20230619   gcc  
i386                 randconfig-i006-20230619   gcc  
i386                 randconfig-i011-20230619   clang
i386                 randconfig-i012-20230619   clang
i386                 randconfig-i013-20230619   clang
i386                 randconfig-i014-20230619   clang
i386                 randconfig-i015-20230619   clang
i386                 randconfig-i016-20230619   clang
i386                 randconfig-r012-20230619   clang
i386                 randconfig-r032-20230619   gcc  
i386                 randconfig-r033-20230619   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230619   gcc  
loongarch            randconfig-r013-20230619   gcc  
loongarch            randconfig-r021-20230619   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230619   gcc  
m68k                 randconfig-r021-20230619   gcc  
m68k                 randconfig-r034-20230619   gcc  
m68k                 randconfig-r036-20230619   gcc  
microblaze           randconfig-r011-20230619   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230619   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230619   gcc  
nios2                randconfig-r004-20230619   gcc  
nios2                randconfig-r032-20230619   gcc  
openrisc             randconfig-r011-20230619   gcc  
openrisc             randconfig-r016-20230619   gcc  
openrisc             randconfig-r033-20230619   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230619   gcc  
parisc               randconfig-r023-20230619   gcc  
parisc               randconfig-r035-20230619   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230619   clang
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230619   clang
riscv                randconfig-r042-20230620   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230619   clang
s390                 randconfig-r044-20230619   clang
s390                 randconfig-r044-20230620   gcc  
sh                               allmodconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r025-20230619   gcc  
sh                   randconfig-r034-20230619   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230619   gcc  
sparc64              randconfig-r005-20230619   gcc  
sparc64              randconfig-r006-20230619   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230619   clang
um                   randconfig-r015-20230619   gcc  
um                   randconfig-r016-20230619   gcc  
um                   randconfig-r033-20230619   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230619   gcc  
x86_64       buildonly-randconfig-r002-20230619   gcc  
x86_64       buildonly-randconfig-r003-20230619   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230619   gcc  
x86_64               randconfig-a002-20230619   gcc  
x86_64               randconfig-a003-20230619   gcc  
x86_64               randconfig-a004-20230619   gcc  
x86_64               randconfig-a005-20230619   gcc  
x86_64               randconfig-a006-20230619   gcc  
x86_64               randconfig-a011-20230619   clang
x86_64               randconfig-a012-20230619   clang
x86_64               randconfig-a013-20230619   clang
x86_64               randconfig-a014-20230619   clang
x86_64               randconfig-a015-20230619   clang
x86_64               randconfig-a016-20230619   clang
x86_64               randconfig-r003-20230619   gcc  
x86_64               randconfig-r012-20230619   clang
x86_64               randconfig-r014-20230619   clang
x86_64               randconfig-r024-20230619   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230619   gcc  
xtensa               randconfig-r024-20230619   gcc  
xtensa               randconfig-r025-20230619   gcc  
xtensa               randconfig-r026-20230619   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
