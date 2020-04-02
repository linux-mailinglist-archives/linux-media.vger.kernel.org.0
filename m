Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B667F19BF82
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 12:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387988AbgDBKkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 06:40:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:53560 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387968AbgDBKkt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 06:40:49 -0400
IronPort-SDR: VUg19iuyku5tOnaEWzhrkY3lVCyNbbGSmVV63g4ilrGvwZTrqwBylDmJp5YlX3yOx5BVmpQgFO
 rJW3ogMz46+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 03:40:48 -0700
IronPort-SDR: YSyrc4XjfxL4A+wsKtRG0wZkC9A9SCS28WZEJMzfvNEIcWeu0XqBfJ3Kl6gL2fxoxmn7cb8o1p
 a9AEx8XHCDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="423086041"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Apr 2020 03:40:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJxHB-000IUL-FP; Thu, 02 Apr 2020 18:40:45 +0800
Date:   Thu, 02 Apr 2020 18:40:20 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD REGRESSION
 2632e7b618a7730969f9782593c29ca53553aa22
Message-ID: <5e85c114.29jDv7tX924rmL6J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 2632e7b618a7730969f9782593c29ca53553aa22  media: venus: firmware: Ignore secure call error on first resume

Regressions in current branch:

drivers/media/dvb-frontends/m88ds3103.c:392:6: note: Assuming that condition 'big_symbol' is not redundant
drivers/media/dvb-frontends/m88ds3103.c:409:9: note: Condition 'big_symbol' is always false
drivers/media/dvb-frontends/m88ds3103.c:409:9: warning: Condition 'big_symbol' is always false [knownConditionTrueFalse]
drivers/media/dvb-frontends/m88ds3103.c:454:11: warning: Variable 'reg11' is assigned a value that is never used. [unreadVariable]
drivers/media/dvb-frontends/m88ds3103.c:982:7: note: ret is assigned
drivers/media/dvb-frontends/m88ds3103.c:993:6: note: ret is overwritten
drivers/media/dvb-frontends/m88ds3103.c:993:6: warning: Variable 'ret' is reassigned a value before the old one has been used. [redundantAssignment]
drivers/media/i2c/imx219.c:599:6: warning: The scope of the variable 'ret' can be reduced. [variableScope]
drivers/media/i2c/imx219.c:854:29: warning: The scope of the variable 'framefmt' can be reduced. [variableScope]
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
|-- i386-allmodconfig
|   |-- drivers-media-dvb-frontends-m88ds3103.c:note:Assuming-that-condition-big_symbol-is-not-redundant
|   |-- drivers-media-dvb-frontends-m88ds3103.c:note:Condition-big_symbol-is-always-false
|   |-- drivers-media-dvb-frontends-m88ds3103.c:note:ret-is-assigned
|   |-- drivers-media-dvb-frontends-m88ds3103.c:note:ret-is-overwritten
|   |-- drivers-media-dvb-frontends-m88ds3103.c:warning:Condition-big_symbol-is-always-false-knownConditionTrueFalse
|   |-- drivers-media-dvb-frontends-m88ds3103.c:warning:Variable-reg11-is-assigned-a-value-that-is-never-used.-unreadVariable
|   |-- drivers-media-dvb-frontends-m88ds3103.c:warning:Variable-ret-is-reassigned-a-value-before-the-old-one-has-been-used.-redundantAssignment
|   |-- drivers-media-i2c-imx219.c:warning:The-scope-of-the-variable-framefmt-can-be-reduced.-variableScope
|   |-- drivers-media-i2c-imx219.c:warning:The-scope-of-the-variable-ret-can-be-reduced.-variableScope
|   |-- drivers-media-i2c-ov5695.c:warning:The-scope-of-the-variable-ret-can-be-reduced.-variableScope
|   |-- drivers-media-i2c-tvp5150.c:warning:Clarify-calculation-precedence-for-and-.-clarifyCalculation
|   |-- drivers-media-i2c-tvp5150.c:warning:The-scope-of-the-variable-connector_pad-can-be-reduced.-variableScope
|   |-- drivers-media-i2c-tvp5150.c:warning:The-scope-of-the-variable-link1-can-be-reduced.-variableScope
|   |-- drivers-media-i2c-tvp5150.c:warning:The-scope-of-the-variable-v4l2c-can-be-reduced.-variableScope
|   |-- drivers-media-platform-qcom-venus-core.c:warning:The-scope-of-the-variable-ret-can-be-reduced.-variableScope
|   |-- drivers-media-platform-qcom-venus-vdec.c:note:Assignment-inst-bit_depth-ev_data-bit_depth
|   |-- drivers-media-platform-qcom-venus-vdec.c:note:Condition-inst-bit_depth-ev_data-bit_depth-is-redundant
|   |-- drivers-media-platform-qcom-venus-vdec.c:warning:The-statement-if-(inst-bit_depth-ev_data-bit_depth)-inst-bit_depth-ev_data-bit_depth-is-logically-equivalent-to-inst-bit_depth-ev_data-bit_depth-.-dupl
|   |-- flags-MEDIA_LNK_FL_ENABLED-TVP5150_NORMAL:
|   |-- if-(big_symbol)
|   |-- if-(inst-bit_depth-ev_data-bit_depth)
|   |-- inst-bit_depth-ev_data-bit_depth
|   |-- reg11
|   |-- ret-m88ds3103_update_bits(dev-)
|   |-- ret-regmap_bulk_write(dev-regmap-buf-)
|   |-- struct-media_pad-connector_pad
|   |-- struct-v4l2_connector_link-link1
|   |-- struct-v4l2_fwnode_connector-v4l2c
|   `-- u8-reg11-A-reg15-reg16-reg1D-reg1E-reg1F-tmp
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

elapsed time: 4368m

configs tested: 219
configs skipped: 0

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
csky                                defconfig
riscv                    nommu_virt_defconfig
ia64                                defconfig
powerpc                             defconfig
sh                          rsk7269_defconfig
alpha                               defconfig
ia64                             allmodconfig
m68k                             allmodconfig
h8300                     edosk2674_defconfig
parisc                generic-64bit_defconfig
nds32                               defconfig
microblaze                    nommu_defconfig
s390                             allmodconfig
m68k                          multi_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                              allnoconfig
ia64                             allyesconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                             allnoconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
x86_64               randconfig-a001-20200330
x86_64               randconfig-a002-20200330
i386                 randconfig-a001-20200330
i386                 randconfig-a002-20200330
i386                 randconfig-a003-20200330
alpha                randconfig-a001-20200330
m68k                 randconfig-a001-20200330
mips                 randconfig-a001-20200330
nds32                randconfig-a001-20200330
parisc               randconfig-a001-20200330
riscv                randconfig-a001-20200330
alpha                randconfig-a001-20200402
m68k                 randconfig-a001-20200402
mips                 randconfig-a001-20200402
nds32                randconfig-a001-20200402
parisc               randconfig-a001-20200402
riscv                randconfig-a001-20200402
c6x                  randconfig-a001-20200330
h8300                randconfig-a001-20200330
microblaze           randconfig-a001-20200330
nios2                randconfig-a001-20200330
sparc64              randconfig-a001-20200330
c6x                  randconfig-a001-20200331
h8300                randconfig-a001-20200331
microblaze           randconfig-a001-20200331
nios2                randconfig-a001-20200331
sparc64              randconfig-a001-20200331
sparc64              randconfig-a001-20200402
h8300                randconfig-a001-20200402
nios2                randconfig-a001-20200402
microblaze           randconfig-a001-20200402
c6x                  randconfig-a001-20200402
csky                 randconfig-a001-20200330
openrisc             randconfig-a001-20200330
s390                 randconfig-a001-20200330
sh                   randconfig-a001-20200330
xtensa               randconfig-a001-20200330
csky                 randconfig-a001-20200331
openrisc             randconfig-a001-20200331
s390                 randconfig-a001-20200331
sh                   randconfig-a001-20200331
xtensa               randconfig-a001-20200331
csky                 randconfig-a001-20200402
openrisc             randconfig-a001-20200402
s390                 randconfig-a001-20200402
sh                   randconfig-a001-20200402
xtensa               randconfig-a001-20200402
x86_64               randconfig-c001-20200331
x86_64               randconfig-c002-20200331
x86_64               randconfig-c003-20200331
i386                 randconfig-c001-20200331
i386                 randconfig-c002-20200331
i386                 randconfig-c003-20200331
x86_64               randconfig-d001-20200331
x86_64               randconfig-d002-20200331
x86_64               randconfig-d003-20200331
i386                 randconfig-d001-20200331
i386                 randconfig-d002-20200331
i386                 randconfig-d003-20200331
x86_64               randconfig-d003-20200402
x86_64               randconfig-d001-20200402
i386                 randconfig-d003-20200402
i386                 randconfig-d001-20200402
x86_64               randconfig-d002-20200402
i386                 randconfig-d002-20200402
i386                 randconfig-e001-20200402
x86_64               randconfig-e002-20200402
i386                 randconfig-e003-20200402
x86_64               randconfig-e001-20200402
x86_64               randconfig-e003-20200402
i386                 randconfig-e002-20200402
x86_64               randconfig-f001-20200402
x86_64               randconfig-f002-20200402
x86_64               randconfig-f003-20200402
i386                 randconfig-f001-20200402
i386                 randconfig-f002-20200402
i386                 randconfig-f003-20200402
x86_64               randconfig-g002-20200331
x86_64               randconfig-g003-20200331
i386                 randconfig-g001-20200331
i386                 randconfig-g002-20200331
i386                 randconfig-g003-20200331
x86_64               randconfig-g001-20200331
x86_64               randconfig-g003-20200402
i386                 randconfig-g003-20200402
x86_64               randconfig-g002-20200402
i386                 randconfig-g001-20200402
i386                 randconfig-g002-20200402
x86_64               randconfig-g001-20200402
x86_64               randconfig-h002-20200402
i386                 randconfig-h002-20200402
i386                 randconfig-h003-20200402
i386                 randconfig-h001-20200402
x86_64               randconfig-h001-20200402
x86_64               randconfig-h003-20200402
x86_64               randconfig-h001-20200331
x86_64               randconfig-h002-20200331
x86_64               randconfig-h003-20200331
i386                 randconfig-h001-20200331
i386                 randconfig-h002-20200331
i386                 randconfig-h003-20200331
x86_64               randconfig-h001-20200401
x86_64               randconfig-h002-20200401
x86_64               randconfig-h003-20200401
i386                 randconfig-h001-20200401
i386                 randconfig-h002-20200401
i386                 randconfig-h003-20200401
arm64                randconfig-a001-20200402
sparc                randconfig-a001-20200402
ia64                 randconfig-a001-20200402
arc                  randconfig-a001-20200402
arm                  randconfig-a001-20200402
powerpc              randconfig-a001-20200402
arc                  randconfig-a001-20200331
arm                  randconfig-a001-20200331
arm64                randconfig-a001-20200331
ia64                 randconfig-a001-20200331
powerpc              randconfig-a001-20200331
sparc                randconfig-a001-20200331
arc                  randconfig-a001-20200330
arm                  randconfig-a001-20200330
arm64                randconfig-a001-20200330
ia64                 randconfig-a001-20200330
powerpc              randconfig-a001-20200330
sparc                randconfig-a001-20200330
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
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
