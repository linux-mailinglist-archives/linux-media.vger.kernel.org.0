Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8685F192ADC
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 15:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCYONf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 10:13:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:41852 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbgCYONe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 10:13:34 -0400
IronPort-SDR: jnShRIsP8GgaS5p39Vjo0bZ0mFPviVL87sxPl9VSze0IXoUaZAHAzjfXqIlR2EfEZx6I1mUM6t
 wEQygXHRYE9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 07:13:33 -0700
IronPort-SDR: 6lTrQr4TdhTBitZ6SqE9Yji0h4gktveRzmItgFueXeXTm70rwKaOyk1Zd6flHng+myg3xw+7Qd
 4keguY0bF1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="357817063"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 07:13:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jH6mh-000B2Q-ME; Wed, 25 Mar 2020 22:13:31 +0800
Date:   Wed, 25 Mar 2020 22:12:49 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD REGRESSION
 ad71693f41aa60217eaf1c29afb49b3aa0a2db5d
Message-ID: <5e7b66e1.lPRFG3pO6VxkRAsV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: ad71693f41aa60217eaf1c29afb49b3aa0a2db5d  media: mtk-vpu: load vpu firmware from the new location

Regressions in current branch:

drivers/media/dvb-frontends/m88ds3103.c:392:6: note: Assuming that condition 'big_symbol' is not redundant
drivers/media/dvb-frontends/m88ds3103.c:409:9: note: Condition 'big_symbol' is always false
drivers/media/dvb-frontends/m88ds3103.c:409:9: warning: Condition 'big_symbol' is always false [knownConditionTrueFalse]
drivers/media/dvb-frontends/m88ds3103.c:454:11: warning: Variable 'reg11' is assigned a value that is never used. [unreadVariable]
drivers/media/dvb-frontends/m88ds3103.c:982:7: note: ret is assigned
drivers/media/dvb-frontends/m88ds3103.c:993:6: note: ret is overwritten
drivers/media/dvb-frontends/m88ds3103.c:993:6: warning: Variable 'ret' is reassigned a value before the old one has been used. [redundantAssignment]
drivers/media/i2c/imx219.c:505:6: warning: The scope of the variable 'ret' can be reduced. [variableScope]
drivers/media/i2c/imx219.c:742:29: warning: The scope of the variable 'framefmt' can be reduced. [variableScope]
drivers/media/i2c/ov5695.c:1017:9: warning: The scope of the variable 'ret' can be reduced. [variableScope]
drivers/media/i2c/tvp5150.c:1280:20: warning: The scope of the variable 'connector_pad' can be reduced. [variableScope]
drivers/media/i2c/tvp5150.c:1361:35: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
drivers/media/i2c/tvp5150.c:1937:32: warning: The scope of the variable 'v4l2c' can be reduced. [variableScope]
drivers/media/i2c/tvp5150.c:1947:31: warning: The scope of the variable 'link1' can be reduced. [variableScope]
drivers/media/platform/qcom/venus/core.c:363:6: warning: The scope of the variable 'ret' can be reduced. [variableScope]
drivers/media/platform/qcom/venus/vdec.c:1196:22: note: Condition 'inst->bit_depth!=ev_data->bit_depth' is redundant
drivers/media/platform/qcom/venus/vdec.c:1196:22: warning: The statement 'if (inst->bit_depth!=ev_data->bit_depth) inst->bit_depth=ev_data->bit_depth' is logically equivalent to 'inst->bit_depth=ev_data->bit_depth'. [duplicateConditionalAssign]
drivers/media/platform/qcom/venus/vdec.c:1197:19: note: Assignment 'inst->bit_depth=ev_data->bit_depth'
flags & MEDIA_LNK_FL_ENABLED ? TVP5150_NORMAL :
if (big_symbol)
if (inst->bit_depth != ev_data->bit_depth)
inst->bit_depth = ev_data->bit_depth;
reg11 |= 0x02;
ret = m88ds3103_update_bits(dev, 0xc9, 0x08, 0x08);
ret = regmap_bulk_write(dev->regmap, 0x5e, buf, 2);
struct media_pad *connector_pad;
struct v4l2_connector_link *link1;
struct v4l2_fwnode_connector *v4l2c;
u8 reg11 = 0x0A, reg15, reg16, reg1D, reg1E, reg1F, tmp;

Error ids grouped by kconfigs:

recent_errors
`-- x86_64-allyesconfig
    |-- drivers-media-dvb-frontends-m88ds3103.c:note:Assuming-that-condition-big_symbol-is-not-redundant
    |-- drivers-media-dvb-frontends-m88ds3103.c:note:Condition-big_symbol-is-always-false
    |-- drivers-media-dvb-frontends-m88ds3103.c:note:ret-is-assigned
    |-- drivers-media-dvb-frontends-m88ds3103.c:note:ret-is-overwritten
    |-- drivers-media-dvb-frontends-m88ds3103.c:warning:Condition-big_symbol-is-always-false-knownConditionTrueFalse
    |-- drivers-media-dvb-frontends-m88ds3103.c:warning:Variable-reg11-is-assigned-a-value-that-is-never-used.-unreadVariable
    |-- drivers-media-dvb-frontends-m88ds3103.c:warning:Variable-ret-is-reassigned-a-value-before-the-old-one-has-been-used.-redundantAssignment
    |-- drivers-media-i2c-imx219.c:warning:The-scope-of-the-variable-framefmt-can-be-reduced.-variableScope
    |-- drivers-media-i2c-imx219.c:warning:The-scope-of-the-variable-ret-can-be-reduced.-variableScope
    |-- drivers-media-i2c-ov5695.c:warning:The-scope-of-the-variable-ret-can-be-reduced.-variableScope
    |-- drivers-media-i2c-tvp5150.c:warning:Clarify-calculation-precedence-for-and-.-clarifyCalculation
    |-- drivers-media-i2c-tvp5150.c:warning:The-scope-of-the-variable-connector_pad-can-be-reduced.-variableScope
    |-- drivers-media-i2c-tvp5150.c:warning:The-scope-of-the-variable-link1-can-be-reduced.-variableScope
    |-- drivers-media-i2c-tvp5150.c:warning:The-scope-of-the-variable-v4l2c-can-be-reduced.-variableScope
    |-- drivers-media-platform-qcom-venus-core.c:warning:The-scope-of-the-variable-ret-can-be-reduced.-variableScope
    |-- drivers-media-platform-qcom-venus-vdec.c:note:Assignment-inst-bit_depth-ev_data-bit_depth
    |-- drivers-media-platform-qcom-venus-vdec.c:note:Condition-inst-bit_depth-ev_data-bit_depth-is-redundant
    |-- drivers-media-platform-qcom-venus-vdec.c:warning:The-statement-if-(inst-bit_depth-ev_data-bit_depth)-inst-bit_depth-ev_data-bit_depth-is-logically-equivalent-to-inst-bit_depth-ev_data-bit_depth-.-dupl
    |-- flags-MEDIA_LNK_FL_ENABLED-TVP5150_NORMAL:
    |-- if-(big_symbol)
    |-- if-(inst-bit_depth-ev_data-bit_depth)
    |-- inst-bit_depth-ev_data-bit_depth
    |-- reg11
    |-- ret-m88ds3103_update_bits(dev-)
    |-- ret-regmap_bulk_write(dev-regmap-buf-)
    |-- struct-media_pad-connector_pad
    |-- struct-v4l2_connector_link-link1
    |-- struct-v4l2_fwnode_connector-v4l2c
    `-- u8-reg11-A-reg15-reg16-reg1D-reg1E-reg1F-tmp

elapsed time: 1318m

configs tested: 215
configs skipped: 0

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
parisc                generic-64bit_defconfig
alpha                               defconfig
ia64                              allnoconfig
riscv                            allyesconfig
sh                                allnoconfig
xtensa                          iss_defconfig
c6x                        evmc6678_defconfig
ia64                             allmodconfig
microblaze                    nommu_defconfig
sh                            titan_defconfig
m68k                       m5475evb_defconfig
nds32                               defconfig
powerpc                             defconfig
csky                                defconfig
nios2                         3c120_defconfig
s390                       zfcpdump_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                             allyesconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                         64r6el_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
x86_64               randconfig-a001-20200324
x86_64               randconfig-a002-20200324
x86_64               randconfig-a003-20200324
i386                 randconfig-a001-20200324
i386                 randconfig-a002-20200324
i386                 randconfig-a003-20200324
alpha                randconfig-a001-20200324
m68k                 randconfig-a001-20200324
mips                 randconfig-a001-20200324
nds32                randconfig-a001-20200324
parisc               randconfig-a001-20200324
riscv                randconfig-a001-20200324
mips                 randconfig-a001-20200325
nds32                randconfig-a001-20200325
m68k                 randconfig-a001-20200325
parisc               randconfig-a001-20200325
alpha                randconfig-a001-20200325
riscv                randconfig-a001-20200325
c6x                  randconfig-a001-20200324
h8300                randconfig-a001-20200324
microblaze           randconfig-a001-20200324
nios2                randconfig-a001-20200324
sparc64              randconfig-a001-20200324
h8300                randconfig-a001-20200325
microblaze           randconfig-a001-20200325
nios2                randconfig-a001-20200325
c6x                  randconfig-a001-20200325
sparc64              randconfig-a001-20200325
csky                 randconfig-a001-20200324
openrisc             randconfig-a001-20200324
s390                 randconfig-a001-20200324
xtensa               randconfig-a001-20200324
s390                 randconfig-a001-20200325
xtensa               randconfig-a001-20200325
csky                 randconfig-a001-20200325
openrisc             randconfig-a001-20200325
sh                   randconfig-a001-20200325
x86_64               randconfig-b001-20200324
x86_64               randconfig-b002-20200324
x86_64               randconfig-b003-20200324
i386                 randconfig-b001-20200324
i386                 randconfig-b002-20200324
i386                 randconfig-b003-20200324
x86_64               randconfig-b001-20200325
x86_64               randconfig-b002-20200325
x86_64               randconfig-b003-20200325
i386                 randconfig-b001-20200325
i386                 randconfig-b002-20200325
i386                 randconfig-b003-20200325
x86_64               randconfig-c001-20200324
x86_64               randconfig-c002-20200324
x86_64               randconfig-c003-20200324
i386                 randconfig-c001-20200324
i386                 randconfig-c002-20200324
i386                 randconfig-c003-20200324
x86_64               randconfig-c001-20200325
x86_64               randconfig-c002-20200325
x86_64               randconfig-c003-20200325
i386                 randconfig-c001-20200325
i386                 randconfig-c002-20200325
i386                 randconfig-c003-20200325
x86_64               randconfig-d001-20200324
x86_64               randconfig-d002-20200324
x86_64               randconfig-d003-20200324
i386                 randconfig-d001-20200324
i386                 randconfig-d002-20200324
i386                 randconfig-d003-20200324
x86_64               randconfig-d001-20200325
x86_64               randconfig-d002-20200325
x86_64               randconfig-d003-20200325
i386                 randconfig-d001-20200325
i386                 randconfig-d002-20200325
i386                 randconfig-d003-20200325
x86_64               randconfig-e001-20200324
x86_64               randconfig-e002-20200324
x86_64               randconfig-e003-20200324
i386                 randconfig-e001-20200324
i386                 randconfig-e002-20200324
i386                 randconfig-e003-20200324
x86_64               randconfig-f001-20200324
x86_64               randconfig-f002-20200324
x86_64               randconfig-f003-20200324
i386                 randconfig-f001-20200324
i386                 randconfig-f002-20200324
i386                 randconfig-f003-20200324
x86_64               randconfig-f001-20200325
x86_64               randconfig-f002-20200325
x86_64               randconfig-f003-20200325
i386                 randconfig-f001-20200325
i386                 randconfig-f002-20200325
i386                 randconfig-f003-20200325
x86_64               randconfig-g001-20200325
x86_64               randconfig-g002-20200325
x86_64               randconfig-g003-20200325
i386                 randconfig-g001-20200325
i386                 randconfig-g002-20200325
i386                 randconfig-g003-20200325
x86_64               randconfig-g001-20200324
x86_64               randconfig-g002-20200324
x86_64               randconfig-g003-20200324
i386                 randconfig-g001-20200324
i386                 randconfig-g002-20200324
i386                 randconfig-g003-20200324
x86_64               randconfig-h002-20200325
x86_64               randconfig-h003-20200325
i386                 randconfig-h003-20200325
i386                 randconfig-h001-20200325
x86_64               randconfig-h001-20200325
i386                 randconfig-h002-20200325
arc                  randconfig-a001-20200325
arm                  randconfig-a001-20200325
arm64                randconfig-a001-20200325
ia64                 randconfig-a001-20200325
powerpc              randconfig-a001-20200325
sparc                randconfig-a001-20200325
arc                  randconfig-a001-20200324
arm                  randconfig-a001-20200324
arm64                randconfig-a001-20200324
ia64                 randconfig-a001-20200324
powerpc              randconfig-a001-20200324
sparc                randconfig-a001-20200324
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                  sh7785lcr_32bit_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
