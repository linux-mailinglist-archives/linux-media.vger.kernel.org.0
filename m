Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873386413FF
	for <lists+linux-media@lfdr.de>; Sat,  3 Dec 2022 04:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbiLCDZk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 22:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiLCDZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 22:25:39 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54B467203
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 19:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670037938; x=1701573938;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hbUerzCEX/tWiggwOfKf/jTf910euoBdbKCzgzHOZso=;
  b=Qpj32xbWNgjWde7YGLXduB42hkBy3iqqps1M79C/HdjqAwSG0A/f9iIE
   iFeaouC4yA4SE1zsZ2fsFzHgvcEmZ0NB9zCmHfA+y3jVHhCxowEPbWv9J
   IVREmIsnH0gfshTcLGIXYdfpnKyLgUAyif4HafL9F6X4j7Zo9bQMA8kiI
   M2UfBzFQuVPM3418/mvStTDLkOE2RxKIYGgIFZK65B//m+m7fuKyGRvKY
   avGhgvtpwLDukLhCd5qb+YS9BtCuiHHpE9r65gaeH6REvv6aBfffuEbHE
   3bE8F7q9Ni8auf+0LEcxGDpxKe2m2g/RPRb8MjOGhDWtV/IJZNgyusGHR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="313729113"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="313729113"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 19:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="890374379"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="890374379"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Dec 2022 19:25:37 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1J9k-000EEZ-1p;
        Sat, 03 Dec 2022 03:25:36 +0000
Date:   Sat, 03 Dec 2022 11:24:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 cb61ca0cbe5fb01448d93b1fa40e942b62d20efa
Message-ID: <638ac183.xQrHJcutM18tFlHS%lkp@intel.com>
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
branch HEAD: cb61ca0cbe5fb01448d93b1fa40e942b62d20efa  media: rzg2l-cru: fix a test for timeout

elapsed time: 721m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
ia64                             allmodconfig
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
i386                                defconfig
sh                               allmodconfig
mips                             allyesconfig
i386                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r041-20221201
i386                          randconfig-a006
hexagon              randconfig-r045-20221201
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
