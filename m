Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11AD9765B39
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 20:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjG0SN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 14:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjG0SN5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 14:13:57 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91DE3594
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 11:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690481628; x=1722017628;
  h=date:from:to:cc:subject:message-id;
  bh=k/Q0AzFhIX0c7AmkxB7kZH5pLHV0iEKCjRtNNGtfjpw=;
  b=YzskbR8THgDWdcXGXxUZtl4JIZ0+z4sb4QwaWQsWssf+cksDT16aNfzo
   u6hVE9a9OJyfNJgod4T8NuH1EYr0+jAdViKj8aBdnf2W3opxLTwwIw6j5
   z+2GOna8JIaqEtJQZ8IYlFH2TuJ3ypRoVZ8lzzeQmA9gpImKMDLP46Ip8
   aq9svZvXDCoXpNIro2eDiHFCzQPb4ASJrPortOrgvK02mtPytf6gDgEEN
   Ist0Quke5VWMV2RYevmSbDXj0X2OY3ndtDOkvVq9GT2ZOqmO4okGHG2JK
   N3zaWwqTdU+Q+1hku0q1pTCcx2R7V9MYMYU8OssJ92iPRzEZh4Sgqweds
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432207923"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="432207923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 11:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762319409"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="762319409"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 11:09:47 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qP5QG-0002UX-0a;
        Thu, 27 Jul 2023 18:09:31 +0000
Date:   Fri, 28 Jul 2023 02:07:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD REGRESSION
 215e4463b11d94668b841368cb6882f3a2968148
Message-ID: <202307280246.7WWFUTzs-lkp@intel.com>
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
branch HEAD: 215e4463b11d94668b841368cb6882f3a2968148  media: rcar-csi2: Add support for C-PHY on R-Car V4H

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271519.XIXA0WQd-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271602.UaRdCl4a-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271602.eGpiQHCZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271623.kiFptZRi-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271639.6vSx9BOA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271727.smfo1zYW-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307271738.4bmtoDez-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/imx290.c:1526:17: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
drivers/media/i2c/imx290.c:1526:17: warning: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
drivers/media/i2c/imx290.c:1526:19: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/media/i2c/imx290.c:1526:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/media/i2c/imx290.c:1526:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/media/i2c/imx290.c:1526:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c'; did you mean 'devm_regmap_init_i2c'? [-Werror=implicit-function-declaration]
drivers/media/i2c/ov5693.c:1280: undefined reference to `devm_cci_regmap_init_i2c'
drivers/media/i2c/ov5693.c:1280:17: error: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
drivers/media/i2c/ov5693.c:1280:17: warning: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
drivers/media/i2c/ov5693.c:1280:19: error: call to undeclared function 'devm_cci_regmap_init_i2c'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/media/i2c/ov5693.c:1280:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/media/i2c/ov5693.c:1280:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/media/i2c/ov5693.c:1280:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Werror=implicit-function-declaration]
drivers/media/i2c/ov5693.c:365: undefined reference to `cci_update_bits'
drivers/media/i2c/ov5693.c:421: undefined reference to `cci_read'
drivers/media/i2c/ov5693.c:616: undefined reference to `cci_write'
ld: drivers/media/i2c/ov5693.c:439: undefined reference to `cci_write'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-i016-20230727
|   |-- drivers-media-i2c-ov5693.c:undefined-reference-to-cci_read
|   |-- drivers-media-i2c-ov5693.c:undefined-reference-to-cci_update_bits
|   |-- drivers-media-i2c-ov5693.c:undefined-reference-to-cci_write
|   |-- drivers-media-i2c-ov5693.c:undefined-reference-to-devm_cci_regmap_init_i2c
|   `-- ld:drivers-media-i2c-ov5693.c:undefined-reference-to-cci_write
|-- mips-randconfig-r034-20230727
|   |-- drivers-media-i2c-imx290.c:error:implicit-declaration-of-function-devm_cci_regmap_init_i2c
|   |-- drivers-media-i2c-imx290.c:warning:assignment-to-struct-regmap-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-i2c-ov5693.c:error:implicit-declaration-of-function-devm_cci_regmap_init_i2c
|   `-- drivers-media-i2c-ov5693.c:warning:assignment-to-struct-regmap-from-int-makes-pointer-from-integer-without-a-cast
`-- x86_64-randconfig-x005-20230727
    |-- drivers-media-i2c-imx290.c:error:implicit-declaration-of-function-devm_cci_regmap_init_i2c
    `-- drivers-media-i2c-imx290.c:warning:assignment-to-struct-regmap-from-int-makes-pointer-from-integer-without-a-cast
clang_recent_errors
|-- arm-randconfig-r012-20230727
|   |-- drivers-media-i2c-imx290.c:error:implicit-declaration-of-function-devm_cci_regmap_init_i2c-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-media-i2c-imx290.c:warning:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int
|   |-- drivers-media-i2c-ov5693.c:error:implicit-declaration-of-function-devm_cci_regmap_init_i2c-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   `-- drivers-media-i2c-ov5693.c:warning:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int
|-- i386-randconfig-i005-20230727
|   |-- drivers-media-i2c-imx290.c:error:call-to-undeclared-function-devm_cci_regmap_init_i2c-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-media-i2c-imx290.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int
|   |-- drivers-media-i2c-ov5693.c:error:call-to-undeclared-function-devm_cci_regmap_init_i2c-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-media-i2c-ov5693.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int
`-- mips-randconfig-r013-20230727
    |-- drivers-media-i2c-imx290.c:error:call-to-undeclared-function-devm_cci_regmap_init_i2c-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-media-i2c-imx290.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int
    |-- drivers-media-i2c-ov5693.c:error:call-to-undeclared-function-devm_cci_regmap_init_i2c-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-media-i2c-ov5693.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-regmap-from-int

elapsed time: 722m

configs tested: 106
configs skipped: 5

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230727   gcc  
arc                  randconfig-r021-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230727   clang
arm                  randconfig-r032-20230727   gcc  
arm                  randconfig-r046-20230727   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230727   clang
csky                                defconfig   gcc  
csky                 randconfig-r035-20230727   gcc  
hexagon              randconfig-r033-20230727   clang
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230727   clang
mips                 randconfig-r025-20230727   clang
mips                 randconfig-r034-20230727   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230727   gcc  
openrisc             randconfig-r005-20230727   gcc  
openrisc             randconfig-r011-20230727   gcc  
openrisc             randconfig-r014-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r036-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230727   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230727   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230727   gcc  
xtensa               randconfig-r015-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
