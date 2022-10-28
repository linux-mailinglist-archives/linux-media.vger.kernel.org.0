Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050AB611C88
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 23:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiJ1VnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 17:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ1VnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 17:43:07 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCAE24AAD2
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666993386; x=1698529386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=obdV5QZN/mvKI3X/Leuk2csp4VLCdlruvqMhaTyRop8=;
  b=CKNa/QSiAGrC+VoM2Mz510L+gfOtbE3Gz6i1QYU/949NV7lS22whwVpd
   XRyhbNsntYFHXiPZzikHt6VHMORYolonT8tofAY2v1zKsumrdMJ3BhztD
   j2sf0JbaWDqZljTqi5MdrueQ5jGO7GPDRA5+A5VXUPkZKahXxARI3RUMH
   1YS1EKlqpgi9lowqhafxL2N/BwFwBHMHgY0bUVgfUpUUyyhCf4N98smlP
   ZOmdXE82GmLeooyqhInTppnttWnbKqKvP1vpk+uw6aKD58rjL9aNZie8w
   FRrw3LwExopbNbaTn9svTrLetECnUTrUnTec9Dzohj36SFEDoqrREOB0s
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="291893584"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="291893584"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 14:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="664171044"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="664171044"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2022 14:43:04 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooX84-000AFj-0R;
        Fri, 28 Oct 2022 21:43:04 +0000
Date:   Sat, 29 Oct 2022 05:43:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 7336c54a562b479866d2de2abc61487a4e07b0b9
Message-ID: <635c4ce4.Gm5uYFseE7n/yM6h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 7336c54a562b479866d2de2abc61487a4e07b0b9  media: i2c: ov4689: code cleanup

elapsed time: 722m

configs tested: 47
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
arc                  randconfig-r043-20221028
s390                             allyesconfig
x86_64                        randconfig-a002
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a006
x86_64                           allyesconfig
riscv                randconfig-r042-20221028
x86_64                           rhel-8.3-syz
arm                                 defconfig
ia64                             allmodconfig
i386                          randconfig-a012
powerpc                           allnoconfig
s390                 randconfig-r044-20221028
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
i386                          randconfig-a014
sh                               allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig

clang tested configs:
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221028
i386                          randconfig-a013
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
