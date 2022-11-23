Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D27636949
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 19:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbiKWSvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 13:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237068AbiKWSvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 13:51:03 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEE78EB72;
        Wed, 23 Nov 2022 10:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669229462; x=1700765462;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a94ZuOr1a3BDU/5tknAQVsqV5j/uIl/nH/Xt8mhCCsk=;
  b=Y4C+DKa9fYLwvK70yBIC1i4cdkuBsTWezoBI/esy7qCMSNCjb2F/HI18
   ZjLFkcbD+mA8ko1+uTUp2/UxrO+H6lenu/EhKRsZT/8EcnjevorGr9snR
   TO6UVrkam+uPz3LMQwRl3b1WD7QZkfOciGdNbP8Z1n3SYUiEaoxwvJQ49
   FO2xcvzfzCprN1VzXQ3pqqO8PdJtZSVrgUd/wg9niHfTJqUOra9s+ffXc
   SDcSgBc8oWBdq8DijuTUfr84gqxbKf7L5bNWFcP7GRwDwBHQvjmqFMnFc
   xugXrPgWCcrcf7YOqsOz27XNIqHVAtZbhg9tH71F+j0NdmpySFe/BudLt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="294526145"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="294526145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 10:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="672976270"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="672976270"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Nov 2022 10:50:32 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxupL-00030W-2a;
        Wed, 23 Nov 2022 18:50:31 +0000
Date:   Thu, 24 Nov 2022 02:50:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 736b6d81d93cf61a0601af90bd552103ef997b3f
Message-ID: <637e6b75.HPuMW2npIkhdyeaX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 736b6d81d93cf61a0601af90bd552103ef997b3f  Add linux-next specific files for 20221123

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210261404.b6UlzG7H-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211231611.bcjNMNY4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211231857.0DmUeoa1-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3c24xx.h: No such file or directory
drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4968: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5075:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
drivers/media/i2c/tc358746.c:816:13: warning: 'm_best' is used uninitialized [-Wuninitialized]
drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized [-Wuninitialized]
kernel/bpf/helpers.c:2005:40: warning: multiple unsequenced modifications to 'idx' [-Wunsequenced]
kernel/bpf/helpers.c:2025:40: warning: multiple unsequenced modifications to 'idx' [-Wunsequenced]

Unverified Error/Warning (likely false positive, please contact us if interested):

ERROR: modpost: "usb_disabled" [drivers/usb/fotg210/fotg210.ko] undefined!
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/usb251xb.txt
drivers/gpu/drm/nouveau/include/nvkm/core/memory.h:90:13: warning: use of uninitialized value 'hdr.wpr.lsb_offset' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c:43:48: warning: use of uninitialized value 'hdr.wpr.falcon_id' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
kernel/bpf/verifier.c:15220 fixup_kfunc_call() error: buffer overflow 'special_kfunc_list' 5 <= 6
kernel/bpf/verifier.c:8200 get_kfunc_ptr_arg_type() error: buffer overflow 'special_kfunc_list' 5 <= 6
kernel/bpf/verifier.c:8690 check_kfunc_args() error: buffer overflow 'special_kfunc_list' 5 <= 6
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-randconfig-m041-20221122
|   |-- kernel-bpf-verifier.c-check_kfunc_args()-error:buffer-overflow-special_kfunc_list
|   |-- kernel-bpf-verifier.c-fixup_kfunc_call()-error:buffer-overflow-special_kfunc_list
|   |-- kernel-bpf-verifier.c-get_kfunc_ptr_arg_type()-error:buffer-overflow-special_kfunc_list
|   |-- lib-zstd-compress-huf_compress.c-HUF_getIndex()-warn:the-RANK_POSITION_LOG_BUCKETS_BEGIN-macro-might-need-parens
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|-- arc-randconfig-r003-20221121
|   |-- drivers-media-i2c-tc358746.c:warning:m_best-is-used-uninitialized
|   `-- drivers-media-i2c-tc358746.c:warning:p_best-is-used-uninitialized
|-- arm-allyesconfig
|   |-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-randconfig-c002-20221115
|   |-- drivers-gpu-drm-nouveau-include-nvkm-core-memory.h:warning:use-of-uninitialized-value-hdr.wpr.lsb_offset-CWE
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-ga102.c:warning:use-of-uninitialized-value-hdr.wpr.falcon_id-CWE
|-- arm64-allyesconfig
clang_recent_errors
|-- arm-randconfig-r015-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- hexagon-randconfig-r041-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- hexagon-randconfig-r045-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-a001-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-a002-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-a003-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-a004-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-a005-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-a006-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- i386-randconfig-r001-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- s390-randconfig-r022-20221120
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- x86_64-randconfig-a001-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- x86_64-randconfig-a002-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- x86_64-randconfig-a003-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- x86_64-randconfig-a004-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- x86_64-randconfig-a005-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
|-- x86_64-randconfig-a006-20221121
|   `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx
`-- x86_64-rhel-8.3-rust
    `-- kernel-bpf-helpers.c:warning:multiple-unsequenced-modifications-to-idx

elapsed time: 721m

configs tested: 70
configs skipped: 2

gcc tested configs:
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a015-20221121
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
i386                                defconfig
x86_64               randconfig-a011-20221121
x86_64               randconfig-a013-20221121
riscv                randconfig-r042-20221121
x86_64                          rhel-8.3-func
x86_64               randconfig-a014-20221121
x86_64                              defconfig
x86_64               randconfig-a016-20221121
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a012-20221121
arm                              allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20221121
ia64                             allmodconfig
arc                                 defconfig
arc                  randconfig-r043-20221121
powerpc                          allmodconfig
arm64                            allyesconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                           rhel-8.3-syz
s390                                defconfig
sh                               allmodconfig
s390                 randconfig-r044-20221121
x86_64                               rhel-8.3
mips                             allyesconfig
s390                             allyesconfig
x86_64                           allyesconfig
i386                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                          sun3x_defconfig
sh                        edosk7760_defconfig
arm64                            alldefconfig
sh                 kfr2r09-romimage_defconfig
arc                              alldefconfig
mips                           ip32_defconfig
mips                          rb532_defconfig
sh                           se7705_defconfig
sh                             shx3_defconfig

clang tested configs:
x86_64               randconfig-a004-20221121
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a006-20221121
x86_64                          rhel-8.3-rust
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_rdb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
