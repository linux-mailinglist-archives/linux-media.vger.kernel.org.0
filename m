Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B482CC4E5
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgLBSSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:18:43 -0500
Received: from mga12.intel.com ([192.55.52.136]:15605 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728930AbgLBSSm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:18:42 -0500
IronPort-SDR: xXyyzzQqXNvpdnEWpPrKfzpstfTlQvF9FATTsEROYSPglgl4C6kdi4WEH0imATFg+jThVrUt74
 4PU9BIBIqQ9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152316336"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="152316336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 10:18:02 -0800
IronPort-SDR: kW3Hlmdh3Gl6rMR5QaFsx505sU96qxoKUridHDBUe6Q8o23jlERH/hLyQiSU4hF+fbQmxOkcRX
 ni4BZXhzgH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
   d="scan'208";a="368102435"
Received: from lkp-server01.sh.intel.com (HELO 54133fc185c3) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2020 10:18:01 -0800
Received: from kbuild by 54133fc185c3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kkWhU-0000HF-DV; Wed, 02 Dec 2020 18:18:00 +0000
Date:   Thu, 03 Dec 2020 02:17:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 67e061f044e46c9823e59ca7981786f858bfa292
Message-ID: <5fc7da38.LgQKAn+26dV9ODuV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 67e061f044e46c9823e59ca7981786f858bfa292  Merge tag 'v5.10-rc6' into patchwork

elapsed time: 1603m

configs tested: 204
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
sh                          sdk7786_defconfig
sparc64                          alldefconfig
arm                          exynos_defconfig
mips                           ip32_defconfig
mips                      loongson3_defconfig
arm                        clps711x_defconfig
sh                        edosk7760_defconfig
powerpc                        cell_defconfig
sh                            hp6xx_defconfig
mips                          ath79_defconfig
openrisc                         alldefconfig
sh                               j2_defconfig
mips                       capcella_defconfig
arm                           viper_defconfig
c6x                        evmc6474_defconfig
powerpc                  mpc885_ads_defconfig
arm                           stm32_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
arm                        spear6xx_defconfig
m68k                        m5407c3_defconfig
powerpc                      ppc64e_defconfig
arm                   milbeaut_m10v_defconfig
riscv                    nommu_k210_defconfig
arm                          pxa3xx_defconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
arc                        nsim_700_defconfig
arc                         haps_hs_defconfig
riscv                    nommu_virt_defconfig
mips                         tb0226_defconfig
arm                            dove_defconfig
m68k                        m5272c3_defconfig
mips                malta_kvm_guest_defconfig
sh                ecovec24-romimage_defconfig
powerpc                         wii_defconfig
arm                      integrator_defconfig
arm                          imote2_defconfig
s390                       zfcpdump_defconfig
xtensa                generic_kc705_defconfig
powerpc                    klondike_defconfig
mips                     loongson1c_defconfig
arc                        nsimosci_defconfig
ia64                                defconfig
arm                           u8500_defconfig
m68k                            mac_defconfig
arm                         s3c6400_defconfig
sparc                               defconfig
powerpc                     sequoia_defconfig
powerpc                 canyonlands_defconfig
arm                         nhk8815_defconfig
sh                         ap325rxa_defconfig
m68k                       m5475evb_defconfig
c6x                                 defconfig
powerpc                     ep8248e_defconfig
arm                          pcm027_defconfig
mips                           ip22_defconfig
m68k                       m5208evb_defconfig
m68k                        mvme16x_defconfig
m68k                          atari_defconfig
mips                          ath25_defconfig
sh                           se7722_defconfig
sh                   sh7724_generic_defconfig
arm                        magician_defconfig
riscv                               defconfig
mips                         tb0287_defconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
sh                           se7343_defconfig
arm                            u300_defconfig
powerpc                     mpc5200_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                       mainstone_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        nlm_xlr_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7750_defconfig
arm                        shmobile_defconfig
openrisc                            defconfig
xtensa                  cadence_csp_defconfig
mips                           gcw0_defconfig
arm                         lpc18xx_defconfig
nios2                         10m50_defconfig
mips                       lemote2f_defconfig
mips                 decstation_r4k_defconfig
arm                          moxart_defconfig
powerpc                    amigaone_defconfig
mips                        maltaup_defconfig
arc                              alldefconfig
microblaze                      mmu_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    mvme5100_defconfig
sh                        apsh4ad0a_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                       cns3420vb_defconfig
powerpc                 linkstation_defconfig
ia64                          tiger_defconfig
s390                             alldefconfig
powerpc                      pasemi_defconfig
powerpc                  storcenter_defconfig
parisc                generic-32bit_defconfig
mips                    maltaup_xpa_defconfig
mips                            e55_defconfig
mips                           xway_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201202
i386                 randconfig-a005-20201202
i386                 randconfig-a001-20201202
i386                 randconfig-a002-20201202
i386                 randconfig-a006-20201202
i386                 randconfig-a003-20201202
i386                 randconfig-a004-20201201
i386                 randconfig-a005-20201201
i386                 randconfig-a001-20201201
i386                 randconfig-a002-20201201
i386                 randconfig-a006-20201201
i386                 randconfig-a003-20201201
x86_64               randconfig-a016-20201201
x86_64               randconfig-a012-20201201
x86_64               randconfig-a014-20201201
x86_64               randconfig-a013-20201201
x86_64               randconfig-a015-20201201
x86_64               randconfig-a011-20201201
i386                 randconfig-a014-20201201
i386                 randconfig-a013-20201201
i386                 randconfig-a011-20201201
i386                 randconfig-a015-20201201
i386                 randconfig-a012-20201201
i386                 randconfig-a016-20201201
i386                 randconfig-a014-20201202
i386                 randconfig-a013-20201202
i386                 randconfig-a011-20201202
i386                 randconfig-a015-20201202
i386                 randconfig-a012-20201202
i386                 randconfig-a016-20201202
x86_64               randconfig-a004-20201202
x86_64               randconfig-a006-20201202
x86_64               randconfig-a001-20201202
x86_64               randconfig-a002-20201202
x86_64               randconfig-a005-20201202
x86_64               randconfig-a003-20201202
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201201
x86_64               randconfig-a006-20201201
x86_64               randconfig-a001-20201201
x86_64               randconfig-a002-20201201
x86_64               randconfig-a005-20201201
x86_64               randconfig-a003-20201201
x86_64               randconfig-a016-20201202
x86_64               randconfig-a012-20201202
x86_64               randconfig-a014-20201202
x86_64               randconfig-a013-20201202
x86_64               randconfig-a015-20201202
x86_64               randconfig-a011-20201202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
