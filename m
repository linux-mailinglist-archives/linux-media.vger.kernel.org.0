Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E411260EA44
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 22:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbiJZU3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 16:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbiJZU3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 16:29:13 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96CDB5FE1
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666816152; x=1698352152;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LmBvEZB0hthymddmo4/1+HasmrmUoBzjH3raKCvgXB4=;
  b=bZq5RdHH4aoEn+HsPQC98hzZ+G5802WsWpUTe0eb7oFz+rku9vwHNh1T
   CdBu+C3C50cl2WrxuhOrQPvn8NnfcTOABwq8b7Qc1sR/fVbFa6a56zkaR
   5DDJlybu9Ge7mL5q9YIo8fNN0M497KE48krbLb/GjYXj1M4LSXtc1kfo8
   WDSnVTYeB6e3+MKX4LqdfaKmoAhCjEpqkEZJvJTkKLWlM4lfMt3mVrd5U
   aci9OrFAG4PJedXiwbEo63ZBYj4VNF/ftiyoPcRzTUc8eETifb4Z6fZIW
   MEVmDSfYz2rpV4FMRwdmjkURnBGoul8TGEMVAllFXDpoEkhDEuhefeBFL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="305666529"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="305666529"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 13:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="665421430"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="665421430"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2022 13:29:11 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onn1S-0007oy-2S;
        Wed, 26 Oct 2022 20:29:10 +0000
Date:   Thu, 27 Oct 2022 04:28:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 36fd61cd8fce04ad7d90b2041c7e8f9fcc9fdc04
Message-ID: <63599875.fdSmfeNubFeOdduC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 36fd61cd8fce04ad7d90b2041c7e8f9fcc9fdc04  media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN

elapsed time: 722m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
arc                  randconfig-r043-20221023
m68k                             allmodconfig
arc                              allyesconfig
arm                                 defconfig
x86_64                           allyesconfig
alpha                            allyesconfig
i386                                defconfig
arm                              allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a013-20221024
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a012-20221024
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a011-20221024
i386                          randconfig-a012
i386                          randconfig-a016
x86_64               randconfig-a014-20221024
x86_64                        randconfig-a002
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
i386                          randconfig-a014
powerpc                           allnoconfig
x86_64                        randconfig-a006
powerpc                          allmodconfig
x86_64                        randconfig-a004
mips                             allyesconfig
sh                               allmodconfig
ia64                             allmodconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221023
s390                 randconfig-r044-20221023
riscv                randconfig-r042-20221023
i386                          randconfig-a013
i386                          randconfig-a011
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a005-20221024
i386                          randconfig-a015
x86_64                        randconfig-a001
i386                 randconfig-a003-20221024
i386                 randconfig-a006-20221024
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
