Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8A3576BE6
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 06:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiGPEuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 00:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiGPEuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 00:50:00 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857E818E3A
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 21:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657946999; x=1689482999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZvL6Jbon2jlzMuzMit8uADNDkVBJrCyidLKSHcXXqGY=;
  b=FqOXQk3CvBW9lhmYvSG7KhndutD6RKXqLxFCBR+hO4AZSOF288AzTqFl
   HdjJtOaV+W0NmdyuVZR4xHXKHJoRKQ56yYhQnaXUcrg2e0mnFAIE7ZfU+
   iCPFb0Ltd/Gs6YrehLYlEatqdClIvJXDRw/SyjETTf3a/Cx7g2AYBy8MS
   slR0Sl8UcAUkQa0xKQRqAvXQoiAWY6T1tSrYT0ezs6jBlaM++ZNf7IrRV
   Csc7X0AP3rDuWAy4c16pehSSyt3D/XxXKAYlVk3GN2js3ToXyPVPMYlEN
   OlWejds/9QGvgzPQYzLuPfGKr4wlaJ5GMbVlnpy1yqcWIU1olrOpV/a65
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="265735620"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="265735620"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 21:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="654612741"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2022 21:49:58 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCZkb-00019s-Kf;
        Sat, 16 Jul 2022 04:49:57 +0000
Date:   Sat, 16 Jul 2022 12:49:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [BUILD SUCCESS] LAST PATCH: [PATCH v5 2/2] drm/i915/gt: Serialize TLB invalidates with GT resets
Message-ID: <62d2434f.vweEs5O2wsGxI/U7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/Fix-TLB-invalidate-issues-with-Broadwell/20220712-232336
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

elapsed time: 4661m

configs tested: 118
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sparc                             allnoconfig
arm                           h3600_defconfig
mips                         cobalt_defconfig
sh                        sh7785lcr_defconfig
arm                        clps711x_defconfig
powerpc                      pcm030_defconfig
m68k                          atari_defconfig
arc                          axs103_defconfig
powerpc                     pq2fads_defconfig
arm                             ezx_defconfig
sh                             sh03_defconfig
m68k                        m5272c3_defconfig
arc                                 defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8540_ads_defconfig
alpha                             allnoconfig
arm                           viper_defconfig
sh                        edosk7705_defconfig
arc                              alldefconfig
powerpc                  iss476-smp_defconfig
mips                         bigsur_defconfig
x86_64                                  kexec
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
s390                                defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220715
csky                              allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                      pmac32_defconfig
arm                           spitz_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                      pxa255-idp_defconfig
mips                        workpad_defconfig
powerpc                          g5_defconfig
powerpc                    gamecube_defconfig
s390                             alldefconfig
powerpc                   lite5200b_defconfig
powerpc                        fsp2_defconfig
hexagon                             defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
powerpc                   bluestone_defconfig
powerpc                     ppa8548_defconfig
powerpc                     mpc512x_defconfig
mips                     cu1000-neo_defconfig
arm                         orion5x_defconfig
riscv                            alldefconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220714
hexagon              randconfig-r041-20220714
hexagon              randconfig-r045-20220715
s390                 randconfig-r044-20220715
hexagon              randconfig-r041-20220715
riscv                randconfig-r042-20220715

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
