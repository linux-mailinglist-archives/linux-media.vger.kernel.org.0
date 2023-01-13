Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C76C66898A
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 03:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240500AbjAMCZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 21:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbjAMCZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 21:25:23 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390C0482B7
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 18:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673576722; x=1705112722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E7fuX5R53I16ivI83GTD38UBIoDah+ilTe3asW1PMxs=;
  b=L0CAkvW4vPOKUlYoiL5qFOnmj10piNPfo7jmC49HMNaYBCE/KTO7aPCr
   +6okmmlDSi8OxqcxI2XJOR/tSMe/xRz2ktxCzPliLoGpQVnrBvYX1I4n7
   8mWFJRcDoCe4bsA9x5g8OQRanmm8CuW0cvqnp6/oh27aIdxT0oPziyaYe
   +hAZMfIU9QuAU2db+S1n2EsZK0G2PgmhIcDJC2MFkZ7mr+J1nt5XGcrAp
   4T5miOL6nZVa1ti5t2y7NALt7ltPdCGcFRX3SfVHZzQ+pL+4rrCRJOrBZ
   btL6FySq6XKdADyZfqhTilnlqWlKArV6amX3+wko9BnPTCmelikKKhoQC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325949902"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="325949902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 18:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="721347139"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="721347139"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jan 2023 18:25:16 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pG9kq-000AcY-0H;
        Fri, 13 Jan 2023 02:25:16 +0000
Date:   Fri, 13 Jan 2023 10:24:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:streams] BUILD SUCCESS WITH WARNING
 544460242d995547fae963141fd4101579969191
Message-ID: <63c0c0d1.1R+50t6pnl3IOfGc%lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git streams
branch HEAD: 544460242d995547fae963141fd4101579969191  media: Documentation: Update documentation for streams

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301130637.L6LHg7RV-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301130859.0NmhNl10-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/media/v4l2-core/v4l2-subdev.c:31:13: warning: 'v4l2_subdev_enable_streams_api' defined but not used [-Wunused-variable]
drivers/media/v4l2-core/v4l2-subdev.c:31:13: warning: unused variable 'v4l2_subdev_enable_streams_api' [-Wunused-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-defconfig
    `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:v4l2_subdev_enable_streams_api-defined-but-not-used
clang_recent_errors
`-- i386-randconfig-a004
    `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:unused-variable-v4l2_subdev_enable_streams_api

elapsed time: 729m

configs tested: 68
configs skipped: 2

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
i386                                defconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                      integrator_defconfig
sh                           se7721_defconfig
m68k                          atari_defconfig
arc                          axs103_defconfig
m68k                       bvme6000_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                randconfig-r042-20230112
s390                 randconfig-r044-20230112
arc                  randconfig-r043-20230112
sh                               allmodconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                          g5_defconfig
mips                          malta_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      maltaaprp_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
