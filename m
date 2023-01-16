Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FD466D287
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 00:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbjAPXFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 18:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbjAPXFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 18:05:18 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9542CFC9
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673910265; x=1705446265;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=U9aRG0iiEVQLgJcbSw2hglrAJ5YG+1Q6otYTxuSrueo=;
  b=hlrvaoGdkXk/4TPK0wiBmbn6KwOjKQWNxieGWhThdxYEzRBMBndAGhHL
   CVAeHMFVB/tAx/XIw+jOGcluAaqqWIGUFZPWhIe7hylpB+5swiaYYtp+c
   5qQ3FkjuQuMhQV8evIGV2L4SB8wh0Z8ptQFGDOj+5ntp6ud1FNcoa1wKy
   Q+U/wsuroLXaMUAoaYOegqvSBpg7dNWqSFRYc+7XYjho4xDoJE2iUkG/F
   BAZ3VgQQowkZmJ8/PfYQhOC/WfJokl7cRvB25VcTeFQQekSuI3JlZvuTk
   uHoeWUNMcc/ARq/GH0Gox0ce5PSOHW19g3yPnbyVITNl2S54Nt14Fk9yU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351813557"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="351813557"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 15:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783045660"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="783045660"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2023 15:04:23 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHYWc-0000mV-1s;
        Mon, 16 Jan 2023 23:04:22 +0000
Date:   Tue, 17 Jan 2023 07:03:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:streams] BUILD SUCCESS
 314a1ebb85475f982dc18069558ed6d3e64f2866
Message-ID: <63c5d7c5.Tw7SJe8u+n5Sodt/%lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git streams
branch HEAD: 314a1ebb85475f982dc18069558ed6d3e64f2866  media: Documentation: Update documentation for streams

elapsed time: 720m

configs tested: 107
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
alpha                               defconfig
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
x86_64                           rhel-8.3-bpf
arm64                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20230116
x86_64                           rhel-8.3-kvm
i386                 randconfig-a013-20230116
arm                              allyesconfig
arc                  randconfig-r043-20230116
i386                 randconfig-a012-20230116
x86_64               randconfig-a011-20230116
i386                 randconfig-a011-20230116
i386                 randconfig-a016-20230116
x86_64               randconfig-a013-20230116
s390                 randconfig-r044-20230116
i386                 randconfig-a014-20230116
x86_64               randconfig-a012-20230116
i386                 randconfig-a015-20230116
sh                               allmodconfig
x86_64               randconfig-a015-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a016-20230116
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
nios2                         10m50_defconfig
arc                               allnoconfig
i386                             allyesconfig
powerpc                      ppc6xx_defconfig
m68k                       m5275evb_defconfig
openrisc                       virt_defconfig
arm                            mps2_defconfig
powerpc                      makalu_defconfig
arm                               allnoconfig
sh                      rts7751r2d1_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
mips                           jazz_defconfig
powerpc                      ep88xc_defconfig
powerpc                  storcenter_defconfig
arm                             ezx_defconfig
sh                        sh7785lcr_defconfig
mips                        bcm47xx_defconfig
mips                         bigsur_defconfig
powerpc                mpc7448_hpc2_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a006-20230116
arm                  randconfig-r046-20230116
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230116
arm                       netwinder_defconfig
powerpc                     kilauea_defconfig
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
riscv                randconfig-r042-20230115
s390                 randconfig-r044-20230115
hexagon              randconfig-r041-20230115
hexagon              randconfig-r045-20230115
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          pxa168_defconfig
arm                     am200epdkit_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
