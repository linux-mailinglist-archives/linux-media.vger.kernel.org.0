Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA8354D8EF
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 05:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244611AbiFPDes (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 23:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbiFPDer (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 23:34:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2BA41FA8
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 20:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655350486; x=1686886486;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TRr64EG4nKVH/aEtT3L6cGMY6VX4dcy419dyf4COqFY=;
  b=ULLZLl+UGXHyfcaFSxce3SYiTuBhe4hd5nBQDMAVnLehDz925MuQcEpC
   qaCzW1DEuZktL2PIsC5331HhhDSsAgyYj0Nfne6cBhtS52vNDbrfj3P30
   1bWLGx+PYEVZyWkOgOzFH/D6H1MuElU9v81pMCSCs7ZJ/CY+xWyr7VpFR
   f468M3N4aCBAMKND+rGVxa1iqoqrvasLa/Q6aRspDWQrwxqC0GDzf85xl
   K2p0VKjAnEHHr1AGdDi8bTM3y4GUbST4ZrvTPKF48rPER1qZgDkLJEVDf
   d1XPb1pq0dcJ4FeqizEQnevEsg7cdbbBbOUqwA/5/R59iLKcY1n4Oh9QI
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="304596514"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="304596514"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 20:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="652976508"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2022 20:34:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1gHM-000O0T-ST;
        Thu, 16 Jun 2022 03:34:44 +0000
Date:   Thu, 16 Jun 2022 11:34:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [BUILD SUCCESS] LAST PATCH: [Intel-gfx] [PATCH 6/6] drm/i915/gt:
 Serialize TLB invalidates with GT resets
Message-ID: <62aaa4d3.mLYelBhe8/BWXkrQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/Fix-TLB-invalidate-issues-with-Broadwell/20220615-232905
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip

[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

elapsed time: 718m

configs tested: 55
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
