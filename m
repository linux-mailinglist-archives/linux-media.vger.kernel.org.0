Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5986C226E28
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 20:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgGTSRm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 14:17:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:31748 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728703AbgGTSRl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 14:17:41 -0400
IronPort-SDR: 4ex9Zc/9XipZoku0j1DKP7DEAZ5Cu6DOtNiqI9fD/Bpe5oURRlXl5qr5wU+EU9xjcXIhuJi7af
 J6ZBCl8aNhBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="137469962"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; 
   d="scan'208";a="137469962"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 11:17:41 -0700
IronPort-SDR: phsoQ4jbTM+Jxlddx3Wzp6j+LvZ82R4zb1LjV6iEIejVJ8gmayPU283kvNpi82uQxXyCN/pEls
 aAcRXeRcucyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; 
   d="scan'208";a="461786181"
Received: from lkp-server02.sh.intel.com (HELO f58f3bfa75fb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2020 11:17:40 -0700
Received: from kbuild by f58f3bfa75fb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jxaM7-00004B-OC; Mon, 20 Jul 2020 18:17:39 +0000
Date:   Tue, 21 Jul 2020 02:16:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 0d6db85131e014c128e57649793aff5aa96e065f
Message-ID: <5f15df7d.oEDuvD65IJHMIhcX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: 0d6db85131e014c128e57649793aff5aa96e065f  Revert "media: atomisp: keep the ISP powered on when setting it"

elapsed time: 1818m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                          rsk7264_defconfig
c6x                                 defconfig
c6x                        evmc6474_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
sh                          r7780mp_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
