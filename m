Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3FB678A1E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 23:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjAWWC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 17:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjAWWC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 17:02:28 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D4EF75F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674511346; x=1706047346;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QTfOF5GkipM+feZG+eNmHPNAjg6BVy/e06KJuI8xZH4=;
  b=H83JDuLEe37367fnPP9/mL7aPmhNpHQ7qx1b6a0XjhP86jh4QrZZe6VH
   UfoDOG0QqqU/hPPBYqRDbbWpPaOrIBrKxLRramxxpsozKmxVO5N3g8IDl
   cH+CHHQHL6BHr3r2Mof4y3LWFkk9QWPGoJbw8YyPaon/E+3OabmY+1Efm
   msZaCBJjnz1uekkzcu5mEE1A9oq39HzHfC4XNmbJuK31bBE65mY9otjsj
   9zT53WjQ8bdd3k0gMjl8iuWvGeCuP/c/LKkiBXHLOso5WLU8zeP3iAht7
   A0+1PGDYjIhR5QIJpFJl6xhqokfjbm1oSL4S780jwVSskmjE0/nCZb1j5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309737579"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="309737579"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 14:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663842201"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663842201"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 14:02:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK4tT-0005us-1i;
        Mon, 23 Jan 2023 22:02:23 +0000
Date:   Tue, 24 Jan 2023 06:01:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 03c6dcbc169ae88dacb0b89970c67692d91e2a06
Message-ID: <63cf03d5.UfCLrrKn6iP4f0M5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 03c6dcbc169ae88dacb0b89970c67692d91e2a06  media: i2c: imx219: Fix binning for RAW8 capture

elapsed time: 720m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
arc                                 defconfig
s390                             allmodconfig
x86_64                            allnoconfig
sh                               allmodconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
mips                             allyesconfig
arm                                 defconfig
um                           x86_64_defconfig
s390                             allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
um                             i386_defconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64               randconfig-a002-20230123
x86_64               randconfig-a005-20230123
arm                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                 randconfig-a003-20230123
arc                              allyesconfig
i386                 randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a006-20230123
i386                 randconfig-a001-20230123
x86_64               randconfig-a004-20230123
i386                 randconfig-a004-20230123
x86_64               randconfig-a003-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
x86_64                          rhel-8.3-rust
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
