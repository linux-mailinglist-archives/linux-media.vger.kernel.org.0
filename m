Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C839F5AA152
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 23:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbiIAVCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbiIAVCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 17:02:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7099F1B3;
        Thu,  1 Sep 2022 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662066092; x=1693602092;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8QAwR+ZyD6oGQnGvMH3kTZlk5348sXsgEcmJ1jmRVBo=;
  b=j5qiegXN+GsOIrN7e4wYlLqWsU9ys73R2xYiovNByBr5wZ8IoDwnJ1zA
   qTmHpKlymsoBAQOmL9eMSO5LnbAYIqOFjYS6UuohkjQ4RP7H6RreoSUjG
   I31maThky10lwsIs46+8ttRyEvykUcz2Nztl5owzAI5bP6JrEGZMiGRtd
   Gwy8V7ZeMTB036YJXODoWLOM8cfUWiXMOos8yyvefuVMg7OWODNv+QNRA
   MmekDGKBIF+Zxy2eLjFxWlpYH4PheYJZbL+NazZJTi6dzAPE2WN0ll0Tc
   jr+eMmkLBEpxRGLWASsKEuWdG2+4Ae0qB6y7hb04d+b0Vzc0wbKRoXhX2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359785961"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="359785961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 14:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="738636556"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2022 14:00:57 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTrJ2-0000lT-39;
        Thu, 01 Sep 2022 21:00:56 +0000
Date:   Fri, 02 Sep 2022 04:59:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-wpan@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
Message-ID: <63111d4f.5mB6r1RTaskl8oUU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8  Add linux-next specific files for 20220901

Error/Warning reports:

https://lore.kernel.org/linux-media/202209020437.eXEOdmfe-lkp@intel.com
https://lore.kernel.org/llvm/202208312208.HjwleIeN-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/base/regmap/regmap-mmio.c:221:17: error: implicit declaration of function 'writesb'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:224:17: error: implicit declaration of function 'writesw'; did you mean 'writew'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:227:17: error: implicit declaration of function 'writesl'; did you mean 'writel'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writesl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:358:17: error: implicit declaration of function 'readsb'; did you mean 'readb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:361:17: error: implicit declaration of function 'readsw'; did you mean 'readw'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:364:17: error: implicit declaration of function 'readsl'; did you mean 'readl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
drivers/clk/clk.c:1193:6: error: redefinition of 'clk_is_enabled_when_prepared'
drivers/clk/clk.c:866:6: error: redefinition of 'clk_unprepare'
drivers/clk/clk.c:947:5: error: redefinition of 'clk_prepare'
drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c:139:6: warning: no previous prototype for 'imu_v11_0_3_program_rlc_ram' [-Wmissing-prototypes]
drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing zero to 'PTR_ERR'
net/ieee802154/nl802154.c:2503:26: error: 'NL802154_CMD_DEL_SEC_LEVEL' undeclared here (not in a function); did you mean 'NL802154_CMD_SET_CCA_ED_LEVEL'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- alpha-buildonly-randconfig-r003-20220901
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- alpha-randconfig-r021-20220901
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- alpha-randconfig-s042-20220901
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- net-ieee802154-nl802154.c:error:NL802154_CMD_DEL_SEC_LEVEL-undeclared-here-(not-in-a-function)
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- arc-randconfig-r022-20220901
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- arc-randconfig-r043-20220901
|   `-- net-ieee802154-nl802154.c:error:NL802154_CMD_DEL_SEC_LEVEL-undeclared-here-(not-in-a-function)
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- arm-randconfig-s033-20220901
|   `-- net-ieee802154-nl802154.c:error:NL802154_CMD_DEL_SEC_LEVEL-undeclared-here-(not-in-a-function)
|-- arm64-allyesconfig
clang_recent_errors
|-- riscv-randconfig-r026-20220901
|   `-- drivers-staging-media-deprecated-cpia2-cpia2_usb.c:warning:variable-frame_count-set-but-not-used
|-- s390-randconfig-r012-20220901
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-function-imu_v11_0_3_program_rlc_ram
`-- s390-randconfig-r044-20220901
    `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-function-imu_v11_0_3_program_rlc_ram

elapsed time: 732m

configs tested: 82
configs skipped: 2

gcc tested configs:
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                           rhel-8.3-kvm
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
powerpc                     stx_gp3_defconfig
powerpc                      pasemi_defconfig
arm                                 defconfig
arc                        vdk_hs38_defconfig
x86_64                        randconfig-a013
arm                     eseries_pxa_defconfig
x86_64                               rhel-8.3
arm                           stm32_defconfig
mips                         bigsur_defconfig
arc                  randconfig-r043-20220901
x86_64                        randconfig-a011
sh                             shx3_defconfig
m68k                        m5307c3_defconfig
sh                                  defconfig
i386                          randconfig-a001
x86_64                        randconfig-a015
i386                          randconfig-a003
powerpc                         wii_defconfig
arm                           viper_defconfig
arm                            pleb_defconfig
sh                               allmodconfig
x86_64                           allyesconfig
sh                            hp6xx_defconfig
mips                             allyesconfig
sh                           se7712_defconfig
s390                                defconfig
i386                          randconfig-a014
powerpc                          allmodconfig
arm                          gemini_defconfig
i386                             allyesconfig
csky                              allnoconfig
i386                          randconfig-a005
arc                               allnoconfig
m68k                             allmodconfig
alpha                             allnoconfig
riscv                             allnoconfig
i386                          randconfig-a012
i386                          randconfig-a016
arc                              allyesconfig
arm                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
powerpc                      ep88xc_defconfig
powerpc                  storcenter_defconfig
sparc                               defconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006

clang tested configs:
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220901
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a002
mips                     cu1830-neo_defconfig
s390                 randconfig-r044-20220901
powerpc                      walnut_defconfig
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
powerpc                  mpc866_ads_defconfig
powerpc                    socrates_defconfig
mips                     loongson2k_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
