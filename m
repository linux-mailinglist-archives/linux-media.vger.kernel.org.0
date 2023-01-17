Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A367666DACB
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbjAQKUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbjAQKUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:20:37 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382C986B2
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673950836; x=1705486836;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YzKO8JMHeLJbIR6Mi+RBfivsxfeMf3oLKNPr5dAKhSc=;
  b=d6JgU8UybRhZuDqQ7Lo12pfUodjrQr6XMyPnU6ADtu4Kd/qBvNvOW/mV
   hJqrV+kz4fVF9TYpaNETFU7HASbGOJczqEfnZWUPuMhhKLEkqa0baqYSQ
   L1M0bH4cMgvh4RtSkkIRMfZe2BWybC6dU91ALmGI03+goh/KUcFjRVoa0
   T9bdllPQJGXFQdN9zPEYL2tcnmP4uOKTDy0eWo417bUfPwR8Ry7SXtBKt
   L6iBmiBmU0zZSvF6JSQ7+V7K4R/egzsuGALBEBJWFZDJvEB3oydwri+3W
   EfKgKTv7oe5zQqaHuz46dZs93QAC35VT5y1J7WlCTolYtiipUzEREMD1N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351904333"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="351904333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="689750937"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="689750937"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Jan 2023 02:20:34 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHj4z-000198-0g;
        Tue, 17 Jan 2023 10:20:33 +0000
Date:   Tue, 17 Jan 2023 18:19:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD REGRESSION
 629f71f470a35df1574796a767e31c95d38f63e0
Message-ID: <63c6764f.g/NpNbFW4E8QR350%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 629f71f470a35df1574796a767e31c95d38f63e0  media: i2c: ak7375: Add regulator management

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301170722.9HVMLR9f-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301170919.wNXpJU4r-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301171036.r0qBvyEB-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/imx290.c:563:35: warning: variable 'state' set but not used [-Wunused-but-set-variable]
drivers/media/i2c/imx290.c:571:35: warning: variable 'state' set but not used [-Wunused-but-set-variable]
drivers/media/i2c/imx290.c:599:35: error: use of undeclared identifier 'format'
drivers/media/i2c/imx290.c:599:56: error: 'format' undeclared (first use in this function)
drivers/media/i2c/imx290.c:608:35: error: use of undeclared identifier 'format'
drivers/media/i2c/imx290.c:608:56: error: 'format' undeclared (first use in this function)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- alpha-allyesconfig
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- arc-randconfig-r043-20230117
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- arm-randconfig-r046-20230117
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- arm-randconfig-s043-20230115
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- arm64-randconfig-r032-20230115
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- i386-randconfig-a016-20230116
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- i386-randconfig-s001-20230116
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- ia64-buildonly-randconfig-r006-20230116
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- ia64-randconfig-c44-20230115
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- loongarch-buildonly-randconfig-r003-20230116
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- loongarch-randconfig-r015-20230116
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- m68k-randconfig-r013-20230116
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- m68k-randconfig-r033-20230116
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- m68k-randconfig-s031-20230115
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
|-- microblaze-randconfig-c024-20230115
|   |-- drivers-media-i2c-imx290.c:error:format-undeclared-(first-use-in-this-function)
|   `-- drivers-media-i2c-imx290.c:warning:variable-state-set-but-not-used
clang_recent_errors
|-- i386-randconfig-a003-20230116
|   `-- drivers-media-i2c-imx290.c:error:use-of-undeclared-identifier-format
|-- powerpc-allyesconfig
|   `-- drivers-media-i2c-imx290.c:error:use-of-undeclared-identifier-format
|-- riscv-randconfig-r004-20230116
|   `-- drivers-media-i2c-imx290.c:error:use-of-undeclared-identifier-format
`-- s390-buildonly-randconfig-r003-20230115
    `-- drivers-media-i2c-imx290.c:error:use-of-undeclared-identifier-format

elapsed time: 722m

configs tested: 94
configs skipped: 3

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
arm                                 defconfig
i386                                defconfig
um                           x86_64_defconfig
um                             i386_defconfig
arm                              allyesconfig
arm64                            allyesconfig
sh                               allmodconfig
i386                             allyesconfig
x86_64                              defconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a014-20230116
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a011-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a015-20230116
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
s390                 randconfig-r044-20230116
riscv                randconfig-r042-20230116
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a016-20230116
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                        sh7763rdp_defconfig
sh                         ap325rxa_defconfig
alpha                            alldefconfig
arc                         haps_hs_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                         s3c6400_defconfig
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                        sh7757lcr_defconfig
powerpc                     stx_gp3_defconfig
arm                           corgi_defconfig
arc                      axs103_smp_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
i386                 randconfig-a003-20230116
x86_64               randconfig-a002-20230116
i386                 randconfig-a001-20230116
x86_64               randconfig-a004-20230116
i386                 randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
i386                 randconfig-a006-20230116
i386                 randconfig-a005-20230116
hexagon              randconfig-r041-20230116
hexagon              randconfig-r045-20230117
hexagon              randconfig-r041-20230117
arm                  randconfig-r046-20230116
hexagon              randconfig-r045-20230116
riscv                randconfig-r042-20230117
s390                 randconfig-r044-20230117
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
