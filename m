Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094333DF4D8
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 20:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239152AbhHCSjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 14:39:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:53083 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239132AbhHCSjI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 14:39:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="299343035"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="299343035"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 11:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="670588591"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2021 11:38:55 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mAzJX-000EAq-83; Tue, 03 Aug 2021 18:38:55 +0000
Date:   Wed, 04 Aug 2021 02:38:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 e76897000f906567ec94864c65a81931c39d6789
Message-ID: <61098d09.aIanWZiz/2ETKFCs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: e76897000f906567ec94864c65a81931c39d6789  media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control

elapsed time: 957m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210803
sh                           se7751_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       bvme6000_defconfig
arm                         mv78xx0_defconfig
powerpc                     kmeter1_defconfig
sh                     sh7710voipgw_defconfig
arc                          axs101_defconfig
sh                           se7750_defconfig
arc                     haps_hs_smp_defconfig
xtensa                          iss_defconfig
mips                            gpr_defconfig
arm                          pxa3xx_defconfig
arm                         assabet_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8315_rdb_defconfig
parisc                              defconfig
ia64                                defconfig
x86_64                            allnoconfig
arm                         nhk8815_defconfig
arm                  colibri_pxa300_defconfig
arm                     davinci_all_defconfig
sh                         apsh4a3a_defconfig
riscv                            allyesconfig
powerpc                     powernv_defconfig
mips                         bigsur_defconfig
openrisc                 simple_smp_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
sh                           se7722_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
powerpc                    socrates_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
sh                        sh7763rdp_defconfig
sh                          sdk7786_defconfig
powerpc                       maple_defconfig
arm                            xcep_defconfig
powerpc                     tqm8555_defconfig
arm                        oxnas_v6_defconfig
mips                        nlm_xlp_defconfig
riscv                    nommu_k210_defconfig
arm                          badge4_defconfig
arm                              alldefconfig
arm                       imx_v6_v7_defconfig
powerpc                      bamboo_defconfig
arm                          ixp4xx_defconfig
powerpc                      ppc44x_defconfig
powerpc                  iss476-smp_defconfig
sh                                  defconfig
arm                          moxart_defconfig
sh                          kfr2r09_defconfig
arm                         palmz72_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
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
x86_64               randconfig-a002-20210803
x86_64               randconfig-a004-20210803
x86_64               randconfig-a006-20210803
x86_64               randconfig-a003-20210803
x86_64               randconfig-a001-20210803
x86_64               randconfig-a005-20210803
i386                 randconfig-a004-20210803
i386                 randconfig-a005-20210803
i386                 randconfig-a002-20210803
i386                 randconfig-a006-20210803
i386                 randconfig-a001-20210803
i386                 randconfig-a003-20210803
x86_64               randconfig-a012-20210802
x86_64               randconfig-a016-20210802
x86_64               randconfig-a013-20210802
x86_64               randconfig-a011-20210802
x86_64               randconfig-a014-20210802
x86_64               randconfig-a015-20210802
i386                 randconfig-a012-20210803
i386                 randconfig-a011-20210803
i386                 randconfig-a015-20210803
i386                 randconfig-a013-20210803
i386                 randconfig-a014-20210803
i386                 randconfig-a016-20210803
i386                 randconfig-a012-20210802
i386                 randconfig-a011-20210802
i386                 randconfig-a015-20210802
i386                 randconfig-a013-20210802
i386                 randconfig-a014-20210802
i386                 randconfig-a016-20210802
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210803
x86_64               randconfig-c001-20210802
x86_64               randconfig-a012-20210803
x86_64               randconfig-a016-20210803
x86_64               randconfig-a013-20210803
x86_64               randconfig-a011-20210803
x86_64               randconfig-a014-20210803
x86_64               randconfig-a015-20210803

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
