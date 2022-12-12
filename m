Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B1C64A8E6
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 21:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbiLLUxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 15:53:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiLLUxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 15:53:39 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3068960C6
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 12:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670878418; x=1702414418;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7KLk9CvXwlu6hX23HnSfj9sQHLmfVGxZyJT2u/WO8WA=;
  b=FH7Sd8XXOLsbXrxXD0s8naL1zlB5PtUOAWbme692ivU9fMUOQxto/XJT
   PaVpY4UDbTp/g5G0ZTYGdFarcnveolUhxiy0hkhHPx6lo1saBsbNtP2Ao
   2Jp837gOutoQuCIBV1TU39LzsukVNSTllAiVOiUhovQLbmY6R0g++eCPo
   +tYy78W/58t66aLvKnp5BpbTRUmgqIK+eccY/8571zBvOh3+DxPtDMqq7
   OHRNTj5qcI2GeLQo/MYwCLP72v4lRPIQ8Si7WO/3LMYi5swYFagiM/9bW
   3WatcQdzE2yFfUHYFxel21K3mUVHAuAJ2GVByC2MCU5/Pwiq//DfMEwSz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="317993667"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; 
   d="scan'208";a="317993667"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 12:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="626039485"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; 
   d="scan'208";a="626039485"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2022 12:53:36 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p4pnr-0003uH-2M;
        Mon, 12 Dec 2022 20:53:35 +0000
Date:   Tue, 13 Dec 2022 04:53:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 fb45d26a921dd11580c404a8f6b13eb8d229b4e2
Message-ID: <639794cc.l4w1qLwoj8hCgwgB%lkp@intel.com>
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
branch HEAD: fb45d26a921dd11580c404a8f6b13eb8d229b4e2  media: ov5675: Fix memleak in ov5675_init_controls()

elapsed time: 726m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64                          rhel-8.3-rust
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                              defconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64               randconfig-a013-20221212
x86_64               randconfig-a015-20221212
x86_64               randconfig-a012-20221212
i386                 randconfig-a013-20221212
x86_64               randconfig-a014-20221212
i386                 randconfig-a012-20221212
x86_64               randconfig-a011-20221212
i386                 randconfig-a011-20221212
x86_64               randconfig-a016-20221212
x86_64                               rhel-8.3
i386                 randconfig-a014-20221212
i386                 randconfig-a016-20221212
x86_64                           allyesconfig
s390                             allyesconfig
i386                 randconfig-a015-20221212
arm                                 defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
riscv                randconfig-r042-20221212
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221211
arc                  randconfig-r043-20221212
arm                  randconfig-r046-20221211
s390                 randconfig-r044-20221212
ia64                             allmodconfig
i386                             allyesconfig

clang tested configs:
x86_64               randconfig-a002-20221212
x86_64               randconfig-a001-20221212
x86_64               randconfig-a004-20221212
x86_64               randconfig-a003-20221212
x86_64               randconfig-a006-20221212
x86_64               randconfig-a005-20221212
i386                 randconfig-a002-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
i386                 randconfig-a004-20221212
i386                 randconfig-a006-20221212
i386                 randconfig-a005-20221212
arm                  randconfig-r046-20221212
riscv                randconfig-r042-20221211
hexagon              randconfig-r045-20221211
hexagon              randconfig-r041-20221211
hexagon              randconfig-r045-20221212
s390                 randconfig-r044-20221211
hexagon              randconfig-r041-20221212

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
