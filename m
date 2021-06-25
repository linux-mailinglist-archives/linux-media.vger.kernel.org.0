Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241E93B4971
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 21:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhFYT4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 15:56:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:10391 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhFYT4c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 15:56:32 -0400
IronPort-SDR: iB5JUqUYFd36FqPVFgiXC1slMBMlJj1a2mqE8zg6siEAF6PRCXusDd7zq6zknWTVUEyeRRespX
 uJqacKGvxtJA==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="195028937"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; 
   d="scan'208";a="195028937"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2021 12:54:09 -0700
IronPort-SDR: nCDCHjmJPmwg0UKu848HAZx4/E4h3BbDGg2jkkIPXUugp5DGc8LB1h4PBI3PrQpgSfGSJNwuHv
 wAtBKLDuZ6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; 
   d="scan'208";a="424539273"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Jun 2021 12:54:06 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lwrtu-0007LI-5L; Fri, 25 Jun 2021 19:54:06 +0000
Date:   Sat, 26 Jun 2021 03:53:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS WITH WARNING
 50e7a31d30e8221632675abed3be306382324ca2
Message-ID: <60d6342c.FjZfTGc76SAGGVVx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 50e7a31d30e8221632675abed3be306382324ca2  media: Fix Media Controller API config checks

Warning reports:

https://lore.kernel.org/linux-media/202106250856.X3yLHjh4-lkp@intel.com

Warning in current branch:

drivers/media/v4l2-core/v4l2-ctrls-request.o: warning: objtool: v4l2_ctrl_request_complete()+0x674: stack state mismatch: reg1[14]=-2-32 reg2[14]=-1+0

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-randconfig-b003-20200427
    `-- drivers-media-v4l2-core-v4l2-ctrls-request.o:warning:objtool:v4l2_ctrl_request_complete():stack-state-mismatch:reg1-reg2

elapsed time: 1883m

configs tested: 278
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                 kfr2r09-romimage_defconfig
sh                              ul2_defconfig
arm                        spear3xx_defconfig
arm                             rpc_defconfig
arm                        magician_defconfig
mips                      maltasmvp_defconfig
s390                                defconfig
powerpc                      ppc44x_defconfig
s390                          debug_defconfig
powerpc                    amigaone_defconfig
powerpc                     kmeter1_defconfig
powerpc64                        alldefconfig
sh                          lboxre2_defconfig
mips                     decstation_defconfig
arm                       aspeed_g5_defconfig
mips                     loongson1c_defconfig
sh                        dreamcast_defconfig
sh                        sh7785lcr_defconfig
alpha                            alldefconfig
m68k                          amiga_defconfig
powerpc                     ep8248e_defconfig
mips                        omega2p_defconfig
arm                         s5pv210_defconfig
arm                         hackkit_defconfig
csky                             alldefconfig
arc                           tb10x_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      malta_kvm_defconfig
mips                malta_qemu_32r6_defconfig
arm                          ep93xx_defconfig
xtensa                           alldefconfig
mips                  maltasmvp_eva_defconfig
arm                        spear6xx_defconfig
sh                             espt_defconfig
mips                        qi_lb60_defconfig
h8300                            alldefconfig
powerpc                     akebono_defconfig
xtensa                generic_kc705_defconfig
riscv                             allnoconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig
m68k                                defconfig
powerpc                 mpc832x_mds_defconfig
arc                            hsdk_defconfig
ia64                            zx1_defconfig
powerpc                           allnoconfig
mips                        workpad_defconfig
sh                          urquell_defconfig
sh                         ecovec24_defconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
arm                         bcm2835_defconfig
sh                               j2_defconfig
sh                          r7785rp_defconfig
mips                 decstation_r4k_defconfig
sh                        edosk7705_defconfig
m68k                        mvme16x_defconfig
riscv                            allyesconfig
arm                           omap1_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8555_defconfig
xtensa                       common_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                       m5249evb_defconfig
arm                        keystone_defconfig
arm                       multi_v4t_defconfig
arm                      pxa255-idp_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                           gcw0_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
mips                     cu1000-neo_defconfig
mips                      maltaaprp_defconfig
mips                         tb0287_defconfig
arm                     davinci_all_defconfig
parisc                generic-64bit_defconfig
powerpc                    gamecube_defconfig
parisc                           allyesconfig
sh                          rsk7269_defconfig
powerpc                     rainier_defconfig
powerpc                      bamboo_defconfig
sh                   sh7770_generic_defconfig
arm                          pxa3xx_defconfig
arm                          moxart_defconfig
powerpc                      mgcoge_defconfig
arm                           u8500_defconfig
arm                         palmz72_defconfig
powerpc                 mpc834x_mds_defconfig
i386                             alldefconfig
x86_64                              defconfig
arm                             ezx_defconfig
arm                           sunxi_defconfig
sh                        edosk7760_defconfig
powerpc                      katmai_defconfig
arc                        nsimosci_defconfig
arc                                 defconfig
powerpc                 mpc834x_itx_defconfig
mips                      fuloong2e_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        clps711x_defconfig
arm                        multi_v5_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7751_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                             allmodconfig
sh                        sh7763rdp_defconfig
xtensa                  audio_kc705_defconfig
m68k                        m5307c3_defconfig
m68k                         amcore_defconfig
xtensa                          iss_defconfig
h8300                            allyesconfig
arm                        mvebu_v5_defconfig
arm                          exynos_defconfig
xtensa                              defconfig
mips                    maltaup_xpa_defconfig
um                                  defconfig
riscv                          rv32_defconfig
mips                          malta_defconfig
powerpc                      ppc40x_defconfig
arm                            dove_defconfig
mips                     cu1830-neo_defconfig
m68k                       m5275evb_defconfig
sh                           se7343_defconfig
m68k                        m5272c3_defconfig
sh                          sdk7786_defconfig
mips                            gpr_defconfig
arm                        mini2440_defconfig
arm                       versatile_defconfig
powerpc                 canyonlands_defconfig
arc                          axs103_defconfig
riscv                    nommu_k210_defconfig
nios2                         3c120_defconfig
sparc                       sparc64_defconfig
arm                      jornada720_defconfig
powerpc                  mpc885_ads_defconfig
arm                  colibri_pxa300_defconfig
sh                          rsk7264_defconfig
arm                        shmobile_defconfig
arm                         lpc32xx_defconfig
sh                         ap325rxa_defconfig
arm                  colibri_pxa270_defconfig
sh                           sh2007_defconfig
arc                              allyesconfig
arc                         haps_hs_defconfig
um                             i386_defconfig
sh                            shmin_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                   milbeaut_m10v_defconfig
arm                           tegra_defconfig
powerpc                       maple_defconfig
arm                           corgi_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                       ebony_defconfig
powerpc                       holly_defconfig
arm                             pxa_defconfig
arm                           viper_defconfig
powerpc                     sbc8548_defconfig
m68k                        mvme147_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
powerpc                     ppa8548_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210625
x86_64               randconfig-a001-20210625
x86_64               randconfig-a005-20210625
x86_64               randconfig-a003-20210625
x86_64               randconfig-a004-20210625
x86_64               randconfig-a006-20210625
x86_64               randconfig-a002-20210623
x86_64               randconfig-a001-20210623
x86_64               randconfig-a005-20210623
x86_64               randconfig-a003-20210623
x86_64               randconfig-a004-20210623
x86_64               randconfig-a006-20210623
i386                 randconfig-a002-20210625
i386                 randconfig-a001-20210625
i386                 randconfig-a003-20210625
i386                 randconfig-a006-20210625
i386                 randconfig-a005-20210625
i386                 randconfig-a004-20210625
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
i386                 randconfig-a002-20210623
i386                 randconfig-a001-20210623
i386                 randconfig-a003-20210623
i386                 randconfig-a006-20210623
i386                 randconfig-a005-20210623
i386                 randconfig-a004-20210623
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a011-20210623
i386                 randconfig-a014-20210623
i386                 randconfig-a013-20210623
i386                 randconfig-a015-20210623
i386                 randconfig-a012-20210623
i386                 randconfig-a016-20210623
i386                 randconfig-a011-20210625
i386                 randconfig-a014-20210625
i386                 randconfig-a013-20210625
i386                 randconfig-a015-20210625
i386                 randconfig-a012-20210625
i386                 randconfig-a016-20210625
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-b001-20210624
x86_64               randconfig-b001-20210625
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622
x86_64               randconfig-a012-20210625
x86_64               randconfig-a016-20210625
x86_64               randconfig-a015-20210625
x86_64               randconfig-a014-20210625
x86_64               randconfig-a013-20210625
x86_64               randconfig-a011-20210625

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
