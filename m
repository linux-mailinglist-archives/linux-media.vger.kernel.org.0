Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB23767C10
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 06:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjG2ETM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 00:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjG2ETL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 00:19:11 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4B7420C
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 21:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690604349; x=1722140349;
  h=date:from:to:cc:subject:message-id;
  bh=U3ZyktKt/aiT25Pd/hkRGiHjLB2+bnXrptbobwwRtMI=;
  b=iNR6HM9RNdPIB3RgaTeRPzZkSQLK8PDNy9JH3/KuYIjGmgskY5XXxpjW
   i57wG5kYu3BThRQ88CDIQsw17tyNowa6e01HHjCqOxoj8/u0wVBqYXVvT
   BBGq6nR7vydfgESNHvMQ3xLr9gJOazDCLLu4fOhA2zPemHf7h5A5qbjFN
   d/2wIKIC1dDymZ3/FrTQuOSdhsMlPmDx+hqm39wqD3km9NDiKqUSIk9Oi
   hedwXgWSu0u86tDADflfW7463skc+raKTxpo2t/Ka4B/XiVMUuUkDQbEi
   4F+xDvlxkQaby/IGtrtly2sm93CSA/MYA/Z0Vk/E6E35UPqURNtQgI/wP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="368738384"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="368738384"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 21:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="797637228"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="797637228"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2023 21:19:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPbQ3-0003or-18;
        Sat, 29 Jul 2023 04:19:07 +0000
Date:   Sat, 29 Jul 2023 12:18:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD REGRESSION
 78b5f6f940f213e4139b0c8dbd1499a564f1ea89
Message-ID: <202307291242.61CMUHtm-lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 78b5f6f940f213e4139b0c8dbd1499a564f1ea89  media: rcar-csi2: Add support for C-PHY on R-Car V4H

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307271519.XIXA0WQd-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271727.smfo1zYW-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307290010.Xjbdp5kg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/imx290.c:1526:17: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
drivers/media/i2c/imx290.c:1526:19: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/media/i2c/imx290.c:1526:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/media/i2c/imx290.c:1526:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c'; did you mean 'devm_regmap_init_i2c'? [-Werror=implicit-function-declaration]
drivers/media/i2c/ov5693.c:1280:17: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
drivers/media/i2c/ov5693.c:1280:19: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
ld.lld: error: undefined symbol: cci_multi_reg_write
ld.lld: error: undefined symbol: cci_write
ld.lld: error: undefined symbol: devm_cci_regmap_init_i2c

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- i386-randconfig-r001-20230728
    |-- drivers-media-i2c-imx290.c:error:implicit-declaration-of-function-devm_cci_regmap_init_i2c
    `-- drivers-media-i2c-imx290.c:warning:assignment-to-struct-regmap-from-int-makes-pointer-from-integer-without-a-cast
clang_recent_errors
|-- i386-randconfig-i012-20230728
|   |-- ld.lld:error:undefined-symbol:cci_multi_reg_write
|   |-- ld.lld:error:undefined-symbol:cci_write
|   `-- ld.lld:error:undefined-symbol:devm_cci_regmap_init_i2c
|-- i386-randconfig-i013-20230728
|   |-- drivers-media-i2c-ov5693.c:error:call-to-undeclared-function-devm_cci_regmap_init_i2c-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-media-i2c-ov5693.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int
`-- x86_64-randconfig-r023-20230728
    |-- drivers-media-i2c-imx290.c:error:call-to-undeclared-function-devm_cci_regmap_init_i2c-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-media-i2c-imx290.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int

elapsed time: 950m

configs tested: 131
configs skipped: 8

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230728   gcc  
alpha                randconfig-r036-20230728   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230728   gcc  
arc                  randconfig-r043-20230728   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230728   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230728   gcc  
csky                 randconfig-r011-20230728   gcc  
csky                 randconfig-r034-20230728   gcc  
csky                 randconfig-r035-20230728   gcc  
hexagon              randconfig-r021-20230728   clang
hexagon              randconfig-r025-20230728   clang
hexagon              randconfig-r041-20230728   clang
hexagon              randconfig-r045-20230728   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230728   gcc  
i386         buildonly-randconfig-r005-20230728   gcc  
i386         buildonly-randconfig-r006-20230728   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230728   gcc  
i386                 randconfig-i002-20230728   gcc  
i386                 randconfig-i003-20230728   gcc  
i386                 randconfig-i004-20230728   gcc  
i386                 randconfig-i005-20230728   gcc  
i386                 randconfig-i006-20230728   gcc  
i386                 randconfig-i011-20230728   clang
i386                 randconfig-i012-20230728   clang
i386                 randconfig-i013-20230728   clang
i386                 randconfig-i014-20230728   clang
i386                 randconfig-i015-20230728   clang
i386                 randconfig-i016-20230728   clang
i386                 randconfig-r001-20230728   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230728   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230728   gcc  
m68k                 randconfig-r003-20230728   gcc  
m68k                 randconfig-r004-20230728   gcc  
m68k                 randconfig-r021-20230728   gcc  
m68k                 randconfig-r031-20230728   gcc  
microblaze           randconfig-r001-20230728   gcc  
microblaze           randconfig-r002-20230728   gcc  
microblaze           randconfig-r012-20230728   gcc  
microblaze           randconfig-r013-20230728   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230728   gcc  
nios2                randconfig-r015-20230728   gcc  
nios2                randconfig-r031-20230728   gcc  
nios2                randconfig-r036-20230728   gcc  
openrisc             randconfig-r002-20230728   gcc  
openrisc             randconfig-r016-20230728   gcc  
openrisc             randconfig-r026-20230728   gcc  
openrisc             randconfig-r032-20230728   gcc  
openrisc             randconfig-r035-20230728   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230728   gcc  
parisc               randconfig-r031-20230728   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r022-20230728   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230728   gcc  
riscv                randconfig-r005-20230728   gcc  
riscv                randconfig-r042-20230728   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230728   clang
s390                 randconfig-r032-20230728   gcc  
s390                 randconfig-r044-20230728   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230728   gcc  
sh                   randconfig-r005-20230728   gcc  
sh                   randconfig-r015-20230728   gcc  
sh                   randconfig-r034-20230728   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r014-20230728   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r014-20230728   clang
x86_64               randconfig-r023-20230728   clang
x86_64               randconfig-r024-20230728   clang
x86_64               randconfig-r033-20230728   gcc  
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r035-20230728   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
