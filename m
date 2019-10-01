Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD74C2B35
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 02:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732303AbfJAANJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 20:13:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:53745 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731180AbfJAANJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 20:13:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 17:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,569,1559545200"; 
   d="scan'208";a="195486110"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Sep 2019 17:13:07 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iF5ms-000BQB-GK; Tue, 01 Oct 2019 08:13:06 +0800
Date:   Tue, 01 Oct 2019 08:13:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ras:edac-for-next] BUILD SUCCESS
 f05390d30e20cccd8f8de981dee42bcdd8d2d137
Message-ID: <5d929a10.ReP6mwoKxvBzWuDB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git  edac-for-next
branch HEAD: f05390d30e20cccd8f8de981dee42bcdd8d2d137  EDAC: skx_common: get rid of unused type var

elapsed time: 168m

configs tested: 86

The following configs have been built successfully.
More configs may be tested in the coming days.

sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64                 randconfig-a004-201939
x86_64                 randconfig-a002-201939
i386                   randconfig-a003-201939
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                           allyesconfig
i386                             allmodconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                   randconfig-d002-201939
i386                   randconfig-d004-201939
x86_64                 randconfig-d004-201939
x86_64                 randconfig-d001-201939
x86_64                 randconfig-d002-201939
x86_64                 randconfig-d003-201939
i386                   randconfig-d001-201939
i386                   randconfig-d003-201939
x86_64                 randconfig-b002-201939
i386                   randconfig-b003-201939
i386                   randconfig-b004-201939
x86_64                 randconfig-b001-201939
i386                   randconfig-b002-201939
i386                   randconfig-b001-201939
x86_64                 randconfig-b004-201939
x86_64                 randconfig-b003-201939
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
x86_64                 randconfig-f004-201939
i386                   randconfig-f004-201939
i386                   randconfig-f003-201939
i386                   randconfig-f002-201939
i386                   randconfig-f001-201939
x86_64                 randconfig-f002-201939
x86_64                 randconfig-f001-201939
x86_64                 randconfig-f003-201939
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64                 randconfig-h003-201939
x86_64                 randconfig-h002-201939
i386                   randconfig-h002-201939
i386                   randconfig-h001-201939
x86_64                 randconfig-h004-201939
i386                   randconfig-h004-201939
x86_64                 randconfig-h001-201939
i386                   randconfig-h003-201939
i386                   randconfig-e004-201939
x86_64                 randconfig-e004-201939
x86_64                 randconfig-e002-201939
x86_64                 randconfig-e003-201939
i386                   randconfig-e003-201939
x86_64                 randconfig-e001-201939
i386                   randconfig-e001-201939
i386                   randconfig-e002-201939
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                           allmodconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
