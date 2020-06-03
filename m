Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E5A1ED0D8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 15:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgFCNca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 09:32:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:17055 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgFCNc3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 09:32:29 -0400
IronPort-SDR: P8VaJCXHIJAua/tOIDwV+KO8cRBBkxC8VD4vTJbEOkNhs2HyRougsHYbGOBesnFre5La33dRiX
 gz7iGT1MpL5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 06:32:27 -0700
IronPort-SDR: fCwZRAMXHsTCUIsQiDZEUm99tBgvpHSItZ4kNXeUk+zAUqtQd8mWHJe4VXrNUKd74Z8iihgKBW
 qAFagyN00DFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; 
   d="scan'208";a="287039262"
Received: from lkp-server01.sh.intel.com (HELO dad89584b564) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2020 06:32:24 -0700
Received: from kbuild by dad89584b564 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgTVI-0000AQ-69; Wed, 03 Jun 2020 13:32:24 +0000
Date:   Wed, 03 Jun 2020 21:31:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD REGRESSION
 60b2c19dd09b0413fb864b5d75949125b47baa1a
Message-ID: <5ed7a630.F+iDtFpF/dqDOcuR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: 60b2c19dd09b0413fb864b5d75949125b47baa1a  media: atomisp: set DFS to MAX if sensor doesn't report fps

Error/Warning in current branch:

drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:4196:9: error: 'atomisp_hw_is_isp2401' undeclared (first use in this function)

Error/Warning ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   `-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:error:atomisp_hw_is_isp2401-undeclared-(first-use-in-this-function)
|-- i386-allyesconfig
|   `-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:error:atomisp_hw_is_isp2401-undeclared-(first-use-in-this-function)
`-- x86_64-allyesconfig
    `-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:error:atomisp_hw_is_isp2401-undeclared-(first-use-in-this-function)

elapsed time: 1852m

configs tested: 134
configs skipped: 16

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                           gcw0_defconfig
arc                    vdk_hs38_smp_defconfig
ia64                          tiger_defconfig
parisc                           allmodconfig
mips                     loongson1b_defconfig
sh                        sh7763rdp_defconfig
ia64                              allnoconfig
sh                           se7619_defconfig
mips                         rt305x_defconfig
powerpc                 linkstation_defconfig
arm                        spear6xx_defconfig
mips                           ip28_defconfig
xtensa                generic_kc705_defconfig
arc                             nps_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
arm                      pxa255-idp_defconfig
arm                     am200epdkit_defconfig
mips                      maltaaprp_defconfig
arm                            pleb_defconfig
sh                           sh2007_defconfig
arm                     eseries_pxa_defconfig
sparc64                          alldefconfig
m68k                            mac_defconfig
powerpc                  mpc885_ads_defconfig
riscv                            alldefconfig
sh                        sh7785lcr_defconfig
arm                          lpd270_defconfig
arm                          moxart_defconfig
sh                               j2_defconfig
sparc64                          allyesconfig
arm                            mps2_defconfig
arm                          prima2_defconfig
s390                              allnoconfig
mips                              allnoconfig
mips                            gpr_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
powerpc                  storcenter_defconfig
mips                  decstation_64_defconfig
sh                   rts7751r2dplus_defconfig
sh                     magicpanelr2_defconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
parisc                            allnoconfig
s390                             alldefconfig
c6x                        evmc6472_defconfig
sh                          rsk7264_defconfig
sh                          kfr2r09_defconfig
m68k                       m5208evb_defconfig
c6x                         dsk6455_defconfig
m68k                          multi_defconfig
i386                             alldefconfig
sh                   sh7770_generic_defconfig
m68k                       m5275evb_defconfig
mips                  mips_paravirt_defconfig
arm                         lpc18xx_defconfig
arm                              zx_defconfig
ia64                             alldefconfig
mips                        nlm_xlp_defconfig
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
nios2                               defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                                  defconfig
um                                allnoconfig
um                               allyesconfig
um                               allmodconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
