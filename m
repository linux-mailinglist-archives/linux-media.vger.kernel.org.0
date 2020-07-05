Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5677214F4F
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2020 22:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgGEUbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jul 2020 16:31:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:2993 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728090AbgGEUbx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 5 Jul 2020 16:31:53 -0400
IronPort-SDR: xCV+Ql9+K/W3glPnpOI41Quf4P8zEPBQedEqerGj7VWQ+e6wE+YGjc+T1XE/voXI1ET8SDKVsF
 rFwv11zp2//A==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="145443385"
X-IronPort-AV: E=Sophos;i="5.75,317,1589266800"; 
   d="scan'208";a="145443385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 13:31:45 -0700
IronPort-SDR: 6h+ZCS29DqyC7XgZMqQX1tM9mQxKRjRfsuuJjbvrbO5WkHwBIo49ov4yECH9EiLznnQaFW+YJf
 Y3mqGk/Z6lIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,317,1589266800"; 
   d="scan'208";a="279076343"
Received: from lkp-server01.sh.intel.com (HELO 6dc8ab148a5d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jul 2020 13:31:44 -0700
Received: from kbuild by 6dc8ab148a5d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jsBId-0001vj-80; Sun, 05 Jul 2020 20:31:43 +0000
Date:   Mon, 06 Jul 2020 04:31:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 6f01dfb760c027d5dd6199d91ee9599f2676b5c6
Message-ID: <5f02389c.kj98xDSpIZND6OA9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 6f01dfb760c027d5dd6199d91ee9599f2676b5c6  media: cros-ec-cec: do not bail on device_init_wakeup failure

elapsed time: 2011m

configs tested: 239
configs skipped: 31

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
sh                           cayman_defconfig
arm                       aspeed_g4_defconfig
m68k                         amcore_defconfig
arc                             nps_defconfig
arm                        trizeps4_defconfig
microblaze                    nommu_defconfig
m68k                        m5407c3_defconfig
sh                               allmodconfig
arm                         s5pv210_defconfig
arm                             ezx_defconfig
arm                  colibri_pxa270_defconfig
h8300                       h8s-sim_defconfig
arc                        nsim_700_defconfig
c6x                        evmc6472_defconfig
m68k                        m5272c3_defconfig
arc                        nsimosci_defconfig
mips                      malta_kvm_defconfig
arm                          ep93xx_defconfig
openrisc                 simple_smp_defconfig
riscv                            alldefconfig
h8300                    h8300h-sim_defconfig
arm                         s3c2410_defconfig
mips                        vocore2_defconfig
mips                           ip27_defconfig
sh                         apsh4a3a_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                            titan_defconfig
powerpc                     skiroot_defconfig
arm                         assabet_defconfig
powerpc                      ppc40x_defconfig
arm                         cm_x300_defconfig
sh                 kfr2r09-romimage_defconfig
mips                         tb0219_defconfig
sh                               j2_defconfig
arm                          lpd270_defconfig
h8300                     edosk2674_defconfig
nios2                         10m50_defconfig
arm                          pxa3xx_defconfig
arm                       imx_v6_v7_defconfig
mips                          ath25_defconfig
powerpc                      ppc6xx_defconfig
ia64                             allmodconfig
xtensa                              defconfig
arm                      jornada720_defconfig
powerpc                       maple_defconfig
mips                      pistachio_defconfig
h8300                               defconfig
arm                          simpad_defconfig
xtensa                         virt_defconfig
sh                          landisk_defconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
sh                          rsk7264_defconfig
arm                           efm32_defconfig
sh                               alldefconfig
powerpc                    mvme5100_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
m68k                       m5475evb_defconfig
arm                        vexpress_defconfig
arm                         lpc32xx_defconfig
mips                   sb1250_swarm_defconfig
powerpc                  mpc885_ads_defconfig
arm                   milbeaut_m10v_defconfig
sh                        dreamcast_defconfig
openrisc                    or1ksim_defconfig
arc                        vdk_hs38_defconfig
mips                         bigsur_defconfig
arm                           tegra_defconfig
m68k                             alldefconfig
arc                      axs103_smp_defconfig
ia64                          tiger_defconfig
arm                         vf610m4_defconfig
mips                        jmr3927_defconfig
arm                         nhk8815_defconfig
arm                             pxa_defconfig
powerpc                      mgcoge_defconfig
arm                         bcm2835_defconfig
mips                        maltaup_defconfig
m68k                            mac_defconfig
sh                     magicpanelr2_defconfig
mips                             allyesconfig
arc                           tb10x_defconfig
ia64                         bigsur_defconfig
sh                           se7705_defconfig
parisc                           alldefconfig
arm                          imote2_defconfig
nios2                               defconfig
arm                        clps711x_defconfig
xtensa                    xip_kc705_defconfig
mips                         rt305x_defconfig
sparc64                          alldefconfig
powerpc                         wii_defconfig
sh                          rsk7269_defconfig
sparc                            alldefconfig
arm                           viper_defconfig
arm                         orion5x_defconfig
m68k                          multi_defconfig
arm                       imx_v4_v5_defconfig
arm                             rpc_defconfig
arm                         mv78xx0_defconfig
s390                                defconfig
arm                         socfpga_defconfig
mips                            e55_defconfig
powerpc                     powernv_defconfig
arm                         s3c6400_defconfig
m68k                          atari_defconfig
arm                           u8500_defconfig
mips                    maltaup_xpa_defconfig
arm                              zx_defconfig
powerpc                          g5_defconfig
arc                          axs103_defconfig
arc                                 defconfig
arm                          prima2_defconfig
powerpc                      ppc64e_defconfig
h8300                            alldefconfig
sh                      rts7751r2d1_defconfig
mips                     loongson1b_defconfig
mips                           xway_defconfig
ia64                              allnoconfig
arm                          tango4_defconfig
sh                            shmin_defconfig
mips                     cu1000-neo_defconfig
alpha                            allyesconfig
powerpc                      ppc44x_defconfig
powerpc                        cell_defconfig
um                            kunit_defconfig
powerpc                          alldefconfig
arm                           stm32_defconfig
arc                            hsdk_defconfig
powerpc                     mpc5200_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
parisc                generic-64bit_defconfig
arm                           spitz_defconfig
powerpc                          allyesconfig
mips                         db1xxx_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
sh                             espt_defconfig
um                             i386_defconfig
sh                           se7721_defconfig
powerpc                  storcenter_defconfig
m68k                       m5249evb_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
arm                          badge4_defconfig
m68k                            q40_defconfig
arc                    vdk_hs38_smp_defconfig
arc                     nsimosci_hs_defconfig
sh                              ul2_defconfig
arm                          pxa168_defconfig
powerpc                          allmodconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
c6x                        evmc6678_defconfig
sh                   sh7770_generic_defconfig
sparc64                          allmodconfig
microblaze                        allnoconfig
sparc                               defconfig
arm                             mxs_defconfig
riscv                            allyesconfig
m68k                          sun3x_defconfig
sparc                       sparc32_defconfig
ia64                        generic_defconfig
arm                           sunxi_defconfig
powerpc                      chrp32_defconfig
mips                 pnx8335_stb225_defconfig
riscv                             allnoconfig
sh                         ecovec24_defconfig
mips                 decstation_r4k_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                              allyesconfig
sh                                allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                             defconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
