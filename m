Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6043862D121
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 03:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbiKQCep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 21:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbiKQCeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 21:34:44 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD9D12A8F
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 18:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668652483; x=1700188483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MyzZshtKYV6RwY9F7xj63/bOWjKUvb8obYTcV4d0DBg=;
  b=Lg+VbFWRuWaCTclAor6KT6DEEywFAwdaC0djvVtAn7PF8/8H8rX8+unr
   KFfq55c0lJrYRJXohiNqiybXOHTvcyOnecVYbud2WlvcsaojI5DiEbIh6
   t8RQXdqXPcTSKrhdUYxtgruSNDwiv2apIO7e6qJLkWTXwXiVWoVdlJUCv
   UbWd/e1gkOshqgtNOt6Sl4VZMwH8H2zqWTvPgY2M1Cegm53CdRWieoIK3
   ksFjtFNuCeDUWQaE6yM1l7k+QhHvDkKx/5ipqN3em7HupHlB8Vjko8i27
   bQ/WBYsIrDH/TbwCwBI2GPhtZTx/NKk1wVO0jYu29LCD13xtTLSLfi7Yr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="300265951"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="300265951"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 18:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="703136749"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="703136749"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Nov 2022 18:34:29 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovUjV-0002zO-0N;
        Thu, 17 Nov 2022 02:34:29 +0000
Date:   Thu, 17 Nov 2022 10:34:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 235265156a501fe65d3f1f1ae3004cdc42302251
Message-ID: <63759db0.+uduxj4McOcJNDj/%lkp@intel.com>
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
branch HEAD: 235265156a501fe65d3f1f1ae3004cdc42302251  media: i2c: refer to config VIDEO_DEV to make ov08x40 image sensor driver usable

elapsed time: 724m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
sh                               allmodconfig
sh                          r7785rp_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
alpha                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                            allnoconfig
sh                            titan_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                            ar7_defconfig
arm                            zeus_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
microblaze                          defconfig
sh                          rsk7203_defconfig
sparc64                          alldefconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
powerpc                     pseries_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221117
hexagon              randconfig-r045-20221117
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
