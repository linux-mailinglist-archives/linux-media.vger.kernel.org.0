Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF696DB907
	for <lists+linux-media@lfdr.de>; Sat,  8 Apr 2023 07:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjDHFMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Apr 2023 01:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjDHFMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Apr 2023 01:12:34 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC504B455
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 22:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680930752; x=1712466752;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ImMYtZl9B2fP9ofuuzJEsWO1SdKOYbhpNlZTDwpy4j0=;
  b=XUEQdO4mFQI8eqasIhJTw7fU/CXEC9kL8wI/KurzY8+nycLHinogexfO
   h8d5K5StYrZTxC3q2juhW/z/xjqJt14f4pAVlavLlSRkyXs3cBARBKQ1+
   S5gd7u4pIM10k+k62I3mU4gmW5t5XrvUsUHouRbfXq9QZVihgu+cr4/Sp
   WTXDTgWefHQlfrAObnee3kiISMG55oOmnQGmK2D4pHjUvtktbmgQmLpPK
   hCFc2YGcAlWjCJSXa2ulieUeb2qR1M/C6joKwvQFzyo2J7KV6GiksjFvK
   Ayb2Imvj4gtPKCHYB2ArUAXuRSfFjNKRGEu7KLoEqD0S61NoonyLJpG5G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341865250"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="341865250"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 22:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="831376436"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="831376436"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2023 22:12:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pl0sI-000TM3-2c;
        Sat, 08 Apr 2023 05:12:30 +0000
Date:   Sat, 08 Apr 2023 13:12:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 324b83208c9d5839bf6fdbaaae0cb4d2456f22a5
Message-ID: <6430f7ab.0NM5dfI1n8OfGPoq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 324b83208c9d5839bf6fdbaaae0cb4d2456f22a5  media: i2c: imx290: Add missing \n on dev_err_probe() message

elapsed time: 721m

configs tested: 170
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230403   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230403   gcc  
alpha                randconfig-r034-20230407   gcc  
alpha                randconfig-r036-20230403   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230403   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230406   gcc  
arc                  randconfig-r016-20230403   gcc  
arc                  randconfig-r021-20230403   gcc  
arc                  randconfig-r025-20230403   gcc  
arc                  randconfig-r033-20230403   gcc  
arc                  randconfig-r043-20230403   gcc  
arc                  randconfig-r043-20230407   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230403   clang
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230403   gcc  
arm                  randconfig-r036-20230407   gcc  
arm                  randconfig-r046-20230403   clang
arm                  randconfig-r046-20230407   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230403   clang
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230403   clang
arm64                randconfig-r015-20230403   gcc  
arm64                randconfig-r015-20230406   clang
arm64                randconfig-r016-20230406   clang
arm64                randconfig-r021-20230405   gcc  
csky         buildonly-randconfig-r002-20230403   gcc  
csky         buildonly-randconfig-r003-20230407   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230403   gcc  
hexagon              randconfig-r004-20230403   clang
hexagon              randconfig-r012-20230403   clang
hexagon              randconfig-r035-20230407   clang
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r041-20230407   clang
hexagon              randconfig-r045-20230403   clang
hexagon              randconfig-r045-20230407   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                          randconfig-a016   gcc  
i386                 randconfig-r022-20230403   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r004-20230403   gcc  
ia64         buildonly-randconfig-r004-20230407   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230403   gcc  
ia64                 randconfig-r026-20230403   gcc  
ia64                 randconfig-r026-20230405   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230403   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230403   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230406   gcc  
m68k                 randconfig-r014-20230406   gcc  
m68k                 randconfig-r025-20230405   gcc  
m68k                 randconfig-r032-20230403   gcc  
m68k                 randconfig-r032-20230407   gcc  
microblaze           randconfig-r005-20230403   gcc  
microblaze           randconfig-r023-20230403   gcc  
microblaze           randconfig-r023-20230405   gcc  
microblaze           randconfig-r024-20230403   gcc  
microblaze           randconfig-r031-20230403   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230405   gcc  
mips                 randconfig-r015-20230403   clang
mips                 randconfig-r034-20230403   gcc  
mips                 randconfig-r035-20230403   gcc  
mips                 randconfig-r036-20230403   gcc  
nios2        buildonly-randconfig-r003-20230403   gcc  
nios2        buildonly-randconfig-r005-20230403   gcc  
nios2        buildonly-randconfig-r005-20230407   gcc  
nios2        buildonly-randconfig-r006-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230406   gcc  
nios2                randconfig-r014-20230403   gcc  
nios2                randconfig-r033-20230403   gcc  
nios2                randconfig-r034-20230403   gcc  
openrisc     buildonly-randconfig-r002-20230405   gcc  
openrisc             randconfig-r025-20230403   gcc  
openrisc             randconfig-r035-20230403   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230403   gcc  
parisc               randconfig-r022-20230405   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230403   gcc  
powerpc              randconfig-r013-20230403   gcc  
powerpc              randconfig-r015-20230406   clang
powerpc              randconfig-r031-20230407   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230403   gcc  
riscv        buildonly-randconfig-r004-20230405   gcc  
riscv        buildonly-randconfig-r006-20230407   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230406   clang
riscv                randconfig-r014-20230403   gcc  
riscv                randconfig-r021-20230403   gcc  
riscv                randconfig-r024-20230405   gcc  
riscv                randconfig-r042-20230403   gcc  
riscv                randconfig-r042-20230407   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230403   gcc  
s390         buildonly-randconfig-r002-20230407   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230403   clang
s390                 randconfig-r003-20230403   clang
s390                 randconfig-r004-20230403   clang
s390                 randconfig-r006-20230403   clang
s390                 randconfig-r044-20230403   gcc  
s390                 randconfig-r044-20230407   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230406   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r032-20230403   gcc  
sparc64      buildonly-randconfig-r002-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-k001-20230403   gcc  
x86_64               randconfig-r012-20230403   gcc  
x86_64               randconfig-r026-20230403   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230407   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
