Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5367B717192
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 01:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbjE3XVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 19:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbjE3XVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 19:21:02 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85194113
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 16:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685488856; x=1717024856;
  h=date:from:to:cc:subject:message-id;
  bh=03FlYXNkd5l3XlW20HMhhyZJiYbHzFqdlz8bMjOO/oI=;
  b=RAK958gu/sqxT2sdUHTFgBI4lYF/Nlsmmq+xCk+iIxHR85+1xj8JnDIx
   fhDuuSUaCrFiFATkgX9wd49YDTDEj4L0A0obS7OADSxpPRz20XS5VPBT0
   N+GDXdi3dxvNk2fm8kb2pSLIZDLWheNQ3Xfk9O4qOsaPItXH0kTRl7N+W
   jGr+qo1CfXU8xLMqyAwkicJk2r8w+omJ+6d8W8TrQ5lFfVs//4LD9YoJc
   Zy/5MPNrQQ9oMYbe0mnuJWX8nQJZp2PswBcTI0L8DLDhtu3H8vhvJ78aq
   f4jbTy5oO6ITrFSVNZpSk9H6esAw0gOrbuxbCXfJEJ7oR9OSeH64cnljN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="339664385"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="339664385"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 16:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="880927750"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="880927750"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2023 16:20:49 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q48e0-0000tX-2B;
        Tue, 30 May 2023 23:20:48 +0000
Date:   Wed, 31 May 2023 07:20:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 397ede0056e7977ee161817e66bff04542f6deac
Message-ID: <20230530232009.5Mn26%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 397ede0056e7977ee161817e66bff04542f6deac  media: ipu3-cio2: rename ipu3-cio2-main.c back to ipu3-cio2.c

elapsed time: 730m

configs tested: 40
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
