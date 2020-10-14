Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0737428E547
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 19:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgJNRXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 13:23:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:47511 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgJNRXb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 13:23:31 -0400
IronPort-SDR: Zm09kMQnAuzff3gK5YS0vKGggq9DLP3UkJByGc0q2o+QsivPmg7UN+ueaNVAz7lJ1LJW9ejzoK
 /FuG3v+v2WNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="250852280"
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; 
   d="scan'208";a="250852280"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 10:23:30 -0700
IronPort-SDR: rK/7/mU3UJR//x64Aj1EdLIdgDXuNcObrubctw7136iKFa1wGo3+SiVMb1/mJ+U9NzxUugTbjg
 0daZ+H8hYsTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; 
   d="scan'208";a="530913036"
Received: from lkp-server01.sh.intel.com (HELO 77f7a688d8fd) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2020 10:23:28 -0700
Received: from kbuild by 77f7a688d8fd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kSkUq-0000H8-7Z; Wed, 14 Oct 2020 17:23:28 +0000
Date:   Thu, 15 Oct 2020 01:22:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD REGRESSION
 399204c7bf82023c5563a6e7526223316ccba236
Message-ID: <5f8733e3.FPmSRTX57OlXDinw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: 399204c7bf82023c5563a6e7526223316ccba236  PM / devfreq: remove a duplicated kernel-doc markup

Error/Warning reports:

https://lore.kernel.org/linux-media/202010131824.GoWqdijA-lkp@intel.com

Error/Warning in current branch:

drivers/media/platform/fsl-viu.c:253:2: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
drivers/media/platform/fsl-viu.c:266:15: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- m68k-randconfig-r015-20201013
    |-- drivers-media-platform-fsl-viu.c:error:implicit-declaration-of-function-in_be32
    `-- drivers-media-platform-fsl-viu.c:error:implicit-declaration-of-function-out_be32

elapsed time: 1991m

configs tested: 182
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     loongson1b_defconfig
arm                           spitz_defconfig
mips                         tb0226_defconfig
arm                         s3c2410_defconfig
c6x                        evmc6474_defconfig
sh                           se7780_defconfig
arm                     davinci_all_defconfig
m68k                          hp300_defconfig
powerpc                     sbc8548_defconfig
arm                         palmz72_defconfig
microblaze                          defconfig
m68k                        stmark2_defconfig
mips                         db1xxx_defconfig
powerpc                        warp_defconfig
arm                          lpd270_defconfig
mips                        omega2p_defconfig
arm                           stm32_defconfig
sh                            migor_defconfig
arm                         orion5x_defconfig
arc                     nsimosci_hs_defconfig
arm                        spear3xx_defconfig
mips                malta_kvm_guest_defconfig
mips                           mtx1_defconfig
powerpc                      katmai_defconfig
m68k                           sun3_defconfig
mips                        nlm_xlp_defconfig
arm                      jornada720_defconfig
arm                         hackkit_defconfig
sh                          landisk_defconfig
arm                           h3600_defconfig
arc                             nps_defconfig
mips                        nlm_xlr_defconfig
mips                malta_qemu_32r6_defconfig
xtensa                    smp_lx200_defconfig
powerpc64                        alldefconfig
s390                                defconfig
arm                        spear6xx_defconfig
sh                        sh7763rdp_defconfig
powerpc                       ppc64_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7203_defconfig
powerpc                     powernv_defconfig
sh                        edosk7760_defconfig
arm                        mvebu_v7_defconfig
sh                           se7619_defconfig
arm                    vt8500_v6_v7_defconfig
mips                         rt305x_defconfig
arm                          iop32x_defconfig
xtensa                           allyesconfig
arm                          pxa3xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                 linkstation_defconfig
arm                          pxa168_defconfig
sh                     magicpanelr2_defconfig
arc                          axs101_defconfig
arc                              allyesconfig
powerpc                mpc7448_hpc2_defconfig
mips                           ip32_defconfig
arm                            lart_defconfig
m68k                        mvme16x_defconfig
powerpc                     ep8248e_defconfig
m68k                            mac_defconfig
riscv                    nommu_k210_defconfig
m68k                         apollo_defconfig
arm                      footbridge_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                   bluestone_defconfig
arm                         socfpga_defconfig
powerpc                    adder875_defconfig
parisc                              defconfig
powerpc                     mpc512x_defconfig
arm                           sunxi_defconfig
powerpc                      tqm8xx_defconfig
openrisc                         alldefconfig
m68k                        m5307c3_defconfig
arm                        realview_defconfig
sh                              ul2_defconfig
nds32                               defconfig
parisc                           alldefconfig
powerpc                     rainier_defconfig
um                             i386_defconfig
sh                   rts7751r2dplus_defconfig
arm                          simpad_defconfig
powerpc                      pcm030_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        multi_v7_defconfig
mips                     decstation_defconfig
arm                          ixp4xx_defconfig
mips                            e55_defconfig
ia64                      gensparse_defconfig
nds32                             allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
i386                 randconfig-a005-20201013
i386                 randconfig-a006-20201013
i386                 randconfig-a001-20201013
i386                 randconfig-a003-20201013
i386                 randconfig-a004-20201013
i386                 randconfig-a002-20201013
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201013
i386                 randconfig-a015-20201013
i386                 randconfig-a013-20201013
i386                 randconfig-a012-20201013
i386                 randconfig-a011-20201013
i386                 randconfig-a014-20201013
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
x86_64               randconfig-a004-20201013
x86_64               randconfig-a002-20201013
x86_64               randconfig-a006-20201013
x86_64               randconfig-a001-20201013
x86_64               randconfig-a003-20201013
x86_64               randconfig-a005-20201013
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
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014
x86_64               randconfig-a016-20201013
x86_64               randconfig-a015-20201013
x86_64               randconfig-a012-20201013
x86_64               randconfig-a013-20201013
x86_64               randconfig-a014-20201013
x86_64               randconfig-a011-20201013

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
