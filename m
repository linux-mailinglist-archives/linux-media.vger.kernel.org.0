Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E9D1EE518
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgFDNPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:15:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:7290 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728093AbgFDNPS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 09:15:18 -0400
IronPort-SDR: d3SlNGDNy1Aq8cMPxIaIu3mgC+zAp+Q95xFdQn3N8eXI2d/FbSiFh8zH/6MuVW7zubNKNIsOWa
 1v7YD6lqLSVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 06:15:16 -0700
IronPort-SDR: NHa4I8rqk/VBWdXSIdyhy53n3s7B7T24ZOA5sr8Rxw1DZWi+a3yxavDzv1zZ/R/dSWr8bnCd9H
 UnFya4ptxBWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="257727059"
Received: from lkp-server02.sh.intel.com (HELO 6de3076d9aaa) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2020 06:15:15 -0700
Received: from kbuild by 6de3076d9aaa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgpiE-00000V-QJ; Thu, 04 Jun 2020 13:15:14 +0000
Date:   Thu, 04 Jun 2020 21:14:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD REGRESSION
 be4b9e888184bc10c16b180096ee2592cd42f5f1
Message-ID: <5ed8f3ac.buw+A2kugKzbTgJr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: be4b9e888184bc10c16b180096ee2592cd42f5f1  media: atomisp: get rid of a string_support.h abstraction layer

Error/Warning in current branch:

cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2810:31: warning: variable 'stream_config' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:159:2: warning: function 'atomisp_css2_dbg_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:165:2: warning: function 'atomisp_css2_dbg_ftrace_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:171:2: warning: function 'atomisp_css2_err_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1454:15: warning: variable 'a0_max_id' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/hmm/hmm.c:271:6: note: in expansion of macro 'dev_dbg'
drivers/staging/media/atomisp/pci/hmm/hmm.c:272:6: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c:237:31: warning: variable 'isp_data_ptr' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:119:15: warning: variable 'hor_num_isp' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:119:28: warning: variable 'ver_num_isp' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c:127:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:244:7: warning: variable 'succes' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:10514:22: warning: variable 'pipe_id' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:1371:24: warning: variable 'stream' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:2735:22: warning: variable 'capture_pipe' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:2864:7: warning: variable 'continuous' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:3567:15: warning: variable 'num_output_pins' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:3975:26: warning: variable 'me' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:3976:24: warning: variable 'copy_binary' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:3976:38: warning: variable 'preview_binary' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:3976:55: warning: variable 'vf_pp_binary' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:6072:7: warning: variable 'memory' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css.c:7521:26: warning: variable 'num_vf_pp_stage' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css_mipi.c:415:27: warning: variable 'mipi_intermediate_info' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css_param_shading.c:239:4: warning: variable 'padded_width' set but not used [-Wunused-but-set-variable]
drivers/staging/media/atomisp/pci/sh_css_params.c:1637:36: warning: variable 'row_padding' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

recent_errors
`-- i386-allyesconfig
    |-- cc1:warning:drivers-staging-media-atomisp-pci-hive_isp_css_include-memory_access:No-such-file-or-directory
    |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:warning:variable-stream_config-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:warning:function-atomisp_css2_dbg_ftrace_print-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:warning:function-atomisp_css2_dbg_print-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:warning:function-atomisp_css2_err_print-might-be-a-candidate-for-gnu_printf-format-attribute
    |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:warning:variable-a0_max_id-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-hmm-hmm.c:note:in-expansion-of-macro-dev_dbg
    |-- drivers-staging-media-atomisp-pci-hmm-hmm.c:warning:format-ld-expects-argument-of-type-long-int-but-argument-has-type-size_t-aka-unsigned-int
    |-- drivers-staging-media-atomisp-pci-isp-kernels-dvs-dvs_1.-ia_css_dvs.host.c:warning:variable-isp_data_ptr-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-isp-kernels-sdis-sdis_2-ia_css_sdis2.host.c:warning:variable-hor_num_isp-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-isp-kernels-sdis-sdis_2-ia_css_sdis2.host.c:warning:variable-ver_num_isp-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-isp-kernels-vf-vf_1.-ia_css_vf.host.c:warning:variable-err-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-runtime-rmgr-src-rmgr_vbuf.c:warning:variable-succes-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-capture_pipe-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-continuous-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-copy_binary-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-me-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-memory-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-num_output_pins-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-num_vf_pp_stage-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-pipe_id-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-preview_binary-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-stream-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css.c:warning:variable-vf_pp_binary-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css_mipi.c:warning:variable-mipi_intermediate_info-set-but-not-used
    |-- drivers-staging-media-atomisp-pci-sh_css_param_shading.c:warning:variable-padded_width-set-but-not-used
    `-- drivers-staging-media-atomisp-pci-sh_css_params.c:warning:variable-row_padding-set-but-not-used

elapsed time: 1765m

configs tested: 114
configs skipped: 3

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                        edosk7760_defconfig
mips                          ath79_defconfig
arm                            mps2_defconfig
mips                 decstation_r4k_defconfig
arm                          collie_defconfig
arm                         shannon_defconfig
mips                      bmips_stb_defconfig
powerpc                  storcenter_defconfig
arc                          axs103_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           sama5_defconfig
sh                           sh2007_defconfig
arm                        trizeps4_defconfig
nios2                            alldefconfig
powerpc64                           defconfig
arm                              zx_defconfig
microblaze                    nommu_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
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
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200603
i386                 randconfig-a006-20200603
i386                 randconfig-a002-20200603
i386                 randconfig-a005-20200603
i386                 randconfig-a003-20200603
i386                 randconfig-a004-20200603
x86_64               randconfig-a002-20200603
x86_64               randconfig-a006-20200603
x86_64               randconfig-a001-20200603
x86_64               randconfig-a003-20200603
x86_64               randconfig-a004-20200603
x86_64               randconfig-a005-20200603
i386                 randconfig-a014-20200603
i386                 randconfig-a015-20200603
i386                 randconfig-a011-20200603
i386                 randconfig-a016-20200603
i386                 randconfig-a012-20200603
i386                 randconfig-a013-20200603
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
