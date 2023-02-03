Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3FAD68A281
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbjBCTHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbjBCTHQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:07:16 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAF41BAD4
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675451235; x=1706987235;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T0Pix2rZ9HEBx/IsoL4ChJ1BzATpaHlWve3j8JpLLio=;
  b=jYSv1+ZbRI7xzPUaSm/C7gBE0Th2op/3BxMeCVqO5UVQSyrLYU7kknM7
   B5Gh2lGe4ZE1Tauy8bshtqYD+kkH40zCeeuiyrHBhCzCcUtWHp7DRyFN3
   O9umZF0iIJWt4M/227q8U3mib33XSSX9UQK5WVNtfubAk9ggB3zKkKq8k
   9UeqsqQVAPJAUS7WRPTCE+soBaUrkn0HwTqFeWkFbuBVq3Ia85mcghV4U
   2fEkKif0b2kJOoUIL8x3nDjFxJ+gaJZNTR3+4jOHurVF/L/7ig0hTLt4U
   v3YF6hi2r3vOZZhBhCgMO03Ap6J6xzD0gRCoH1/K/SUlrdpPxm1xyGT2c
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330955840"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="330955840"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 11:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="667735144"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="667735144"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2023 11:07:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pO1Oy-0000iL-1n;
        Fri, 03 Feb 2023 19:07:12 +0000
Date:   Sat, 04 Feb 2023 03:06:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 e193805fd1f06a86fb3320d6cbc5223e619383b6
Message-ID: <63dd5b2d.WhpFPfxBB3AjXj+J%lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: e193805fd1f06a86fb3320d6cbc5223e619383b6  media: i2c: add imx415 cmos image sensor driver

elapsed time: 1784m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
sh                               allmodconfig
ia64                             allmodconfig
mips                             allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a002
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
s390                                defconfig
s390                             allmodconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20230202
um                             i386_defconfig
riscv                randconfig-r042-20230202
s390                 randconfig-r044-20230202
s390                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
arm                                 defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
arm                  randconfig-r046-20230202
hexagon              randconfig-r041-20230202
hexagon              randconfig-r045-20230202
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
