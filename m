Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1097283F5C
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 21:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgJETMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 15:12:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:36703 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729227AbgJETMd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 15:12:33 -0400
IronPort-SDR: KJnE7gPl1ketHrrjeZjXBx+HRoPWUI3VmqLQbTVmkEIIetegqmbhYk4f4GZSX86gQMVy6+Rcj9
 hQaBTfcStqKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="181645312"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; 
   d="scan'208";a="181645312"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 12:08:51 -0700
IronPort-SDR: yCkjNZ09aF9z0J5PlnfUVuqBVModuoAyXY3WOttp7i3FehXVpzKv9AxmEYRjM1A96G5aG3wA9R
 lZsj+uKYqKwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; 
   d="scan'208";a="526280872"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Oct 2020 10:18:54 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kPU8L-0000tK-4n; Mon, 05 Oct 2020 17:18:45 +0000
Date:   Tue, 06 Oct 2020 01:18:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD REGRESSION
 463c43fcd97e493d8a17242f4f000c86fe642ed6
Message-ID: <5f7b556a.S1MBm96BUiyBc4qI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 463c43fcd97e493d8a17242f4f000c86fe642ed6  Merge tag 'v5.9-rc7' into patchwork

Error/Warning in current branch:

drivers/media/platform/fsl-viu.c:253:2: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
drivers/media/platform/fsl-viu.c:266:15: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
drivers/remoteproc/mtk_scp.c:645:34: warning: unused variable 'mtk_scp_of_match' [-Wunused-const-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- m68k-randconfig-r032-20201005
    |-- drivers-media-platform-fsl-viu.c:error:implicit-declaration-of-function-in_be32
    `-- drivers-media-platform-fsl-viu.c:error:implicit-declaration-of-function-out_be32

clang_recent_errors
`-- x86_64-randconfig-a015-20201004
    `-- drivers-remoteproc-mtk_scp.c:warning:unused-variable-mtk_scp_of_match

elapsed time: 1835m

configs tested: 142
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
ia64                                defconfig
powerpc                 mpc832x_mds_defconfig
sh                            shmin_defconfig
h8300                            allyesconfig
sh                        sh7763rdp_defconfig
powerpc                     sbc8548_defconfig
mips                      maltasmvp_defconfig
mips                           ci20_defconfig
arm                        shmobile_defconfig
powerpc                    socrates_defconfig
mips                        jmr3927_defconfig
arm                         vf610m4_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
mips                           ip28_defconfig
powerpc                     rainier_defconfig
mips                          ath25_defconfig
arm                          lpd270_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
arm                         s5pv210_defconfig
arm                            hisi_defconfig
powerpc                   currituck_defconfig
sh                           se7780_defconfig
arm                          gemini_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
sh                   sh7770_generic_defconfig
i386                             alldefconfig
microblaze                          defconfig
powerpc                        icon_defconfig
mips                          rm200_defconfig
mips                      bmips_stb_defconfig
powerpc                          g5_defconfig
arm                           spitz_defconfig
h8300                            alldefconfig
arm                              zx_defconfig
sh                               j2_defconfig
powerpc                        fsp2_defconfig
m68k                           sun3_defconfig
arm                       omap2plus_defconfig
m68k                            q40_defconfig
mips                     decstation_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nios2                         10m50_defconfig
sh                   secureedge5410_defconfig
alpha                            allyesconfig
riscv                    nommu_k210_defconfig
arm                            pleb_defconfig
sh                             espt_defconfig
arm                            dove_defconfig
sh                           se7619_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201004
x86_64               randconfig-a002-20201004
x86_64               randconfig-a001-20201004
x86_64               randconfig-a003-20201004
x86_64               randconfig-a005-20201004
x86_64               randconfig-a006-20201004
i386                 randconfig-a006-20201004
i386                 randconfig-a005-20201004
i386                 randconfig-a001-20201004
i386                 randconfig-a004-20201004
i386                 randconfig-a003-20201004
i386                 randconfig-a002-20201004
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a014-20201004
i386                 randconfig-a015-20201004
i386                 randconfig-a013-20201004
i386                 randconfig-a016-20201004
i386                 randconfig-a011-20201004
i386                 randconfig-a012-20201004
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201005
x86_64               randconfig-a002-20201005
x86_64               randconfig-a001-20201005
x86_64               randconfig-a003-20201005
x86_64               randconfig-a005-20201005
x86_64               randconfig-a006-20201005
x86_64               randconfig-a012-20201004
x86_64               randconfig-a015-20201004
x86_64               randconfig-a014-20201004
x86_64               randconfig-a013-20201004
x86_64               randconfig-a011-20201004
x86_64               randconfig-a016-20201004

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
