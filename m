Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBAC7757AFE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 13:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjGRL4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 07:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjGRL4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 07:56:04 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E77D1A5
        for <linux-media@vger.kernel.org>; Tue, 18 Jul 2023 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689681363; x=1721217363;
  h=date:from:to:cc:subject:message-id;
  bh=VY/KoLQfoagqEyRpHEYYA3MnH9nDmIb9h8Uf3f+tfgM=;
  b=IZMXApd4Mio1J6M/ijMEJ+uMqmE/cZEhO0XN0M8kKNL2GuxsMGHGVlZK
   4+G8AKf3cSByrKBJef7nGgPSQ+cUFLSxLdPIGKOxYIWjox4bf70YQ+P2q
   pRRByDoc/jDt0SqbgQUjyrY0VN5Vl+56LmlZ04FZgfd70IWvSe6fpYdIx
   IToj2PzzCNTPkt3tRFNwfCYPKyaOMHXlAPHk31acSCtNgUYAjX5X7z5lA
   48iodd1ZJpnT9jy7x/s4u6NmgC+ZtgT1dtvj+VAD/Me+rYFDit6zx0EYg
   Z8EvJJc0JnrxnfIIst8pV2/sfdH2kdPtdTFYjc0znsML34gqsJ2o3xsvr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345778143"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="345778143"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 04:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="700866530"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="700866530"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 04:56:01 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLjIu-0000a9-1S;
        Tue, 18 Jul 2023 11:55:46 +0000
Date:   Tue, 18 Jul 2023 19:55:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 a01a7332c3c989e155d02b722fd2b6986e2e7899
Message-ID: <202307181915.NarWGyqS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: a01a7332c3c989e155d02b722fd2b6986e2e7899  media: subdev: Add debug prints to enable/disable_streams

elapsed time: 916m

configs tested: 133
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230718   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r012-20230717   gcc  
arc                  randconfig-r025-20230717   gcc  
arc                  randconfig-r043-20230717   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r022-20230717   clang
arm                  randconfig-r046-20230717   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230717   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230717   gcc  
csky                 randconfig-r034-20230717   gcc  
hexagon              randconfig-r011-20230717   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r033-20230717   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze           randconfig-r005-20230718   gcc  
microblaze           randconfig-r006-20230718   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                          malta_defconfig   clang
mips                           mtx1_defconfig   clang
mips                 randconfig-r031-20230717   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230717   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r024-20230717   gcc  
powerpc                     redwood_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230717   gcc  
sh                               allmodconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r003-20230718   gcc  
sh                   randconfig-r032-20230717   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230717   gcc  
sparc64              randconfig-r015-20230717   gcc  
sparc64              randconfig-r021-20230717   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r035-20230717   clang
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
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230718   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
