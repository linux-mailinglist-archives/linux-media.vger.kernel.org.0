Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7C8637710
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 12:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiKXLDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 06:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiKXLDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 06:03:12 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9DD450AC
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669287791; x=1700823791;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2fe1Z/Hxuf8FvB+1rCcU0EpuWF3g8OCMekAr6wavhvE=;
  b=MBJDVWxawGnC0JTlIlhWikT2H6VjKyL2JNglqlzcK0i/pjxoJnKXtmuZ
   hKXNzqheI+OfESACkvBbJ9IbAXXgElN4etsRxw0qNa6zaAPDXsMX+lXaX
   W5k8eNwo7nFRpWtALeIRZb2vbYZ9CCdIY2PjhfKIhM78gPDM6ImWT7tWn
   DAG4IO+8Omdub7iLI56G5lbiwBq4zaNsdvC4/314dvIR37XgkzEZF42zg
   xwSbX1hGjllKgf2G8Fveo39qU/TUn7rtsSkjfsUQcKiyOm3MADaky5m6h
   y5oiKSirdtGMnrGYWxd2xg1DDhYH3mZpz8CrAqJ3WWcmwiF8oSxGd8Teg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314312601"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="314312601"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 03:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642302868"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="642302868"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2022 03:03:09 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oyA0a-0003nX-2Y;
        Thu, 24 Nov 2022 11:03:08 +0000
Date:   Thu, 24 Nov 2022 19:02:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 d244a87ab5e64ca874aaff961fe8d2f847a34556
Message-ID: <637f4f3b.H04qs3KsuYIgk1qN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: d244a87ab5e64ca874aaff961fe8d2f847a34556  media: i2c: refer to config VIDEO_DEV to make ov08x40 image sensor driver usable

elapsed time: 1344m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
s390                             allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
s390                             allyesconfig
ia64                             allmodconfig
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a015-20221121
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                              defconfig
i386                                defconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20221124
i386                             allyesconfig
x86_64                            allnoconfig
ia64                          tiger_defconfig
powerpc                     redwood_defconfig
arm                          lpd270_defconfig
arm                             pxa_defconfig
arm                     eseries_pxa_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
mips                         cobalt_defconfig
arm                         nhk8815_defconfig
sh                           se7724_defconfig
powerpc                       ppc64_defconfig
sh                          r7785rp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a004-20221121
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a006
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
