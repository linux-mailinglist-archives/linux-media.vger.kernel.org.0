Return-Path: <linux-media+bounces-1370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40937FD922
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0361CB2134E
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A7C30F97;
	Wed, 29 Nov 2023 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSWbRRtY"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 06:19:10 PST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71349AF
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267551; x=1732803551;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/zky3zQld+TNsg9gjrBPXs6epdO84achSSjlIAHHjFY=;
  b=NSWbRRtYaAQu4Y6QmEPejUgPYanDrpUOtEfMPoBZwYVjRJmujbu5Y54O
   QgWYZ5G9N6l3kBUI9pnwxmCAsQLgfCwC9KFAjPtCj6JkEN/87nF6RNgyO
   25ynWb/wLZX1wkHybHyVV8ggJMlbWDZsag51Dx3PsAYFcJpmScSRh3EpH
   9FUyA9vdyR/JLlMdfJ2gIgW5gRG/5u4Dlbnbh7/7g9oHg9ZRdaZ31r43R
   F/l0mdi9RKEqpWnl2IDqAkKniXsYozw7FjG8R68TPUhZFHVnHLNxw9snH
   ooqFbMcWlemOKJQ7mpc6J7ObnWD5M79pSVEHwtk704GuprHXOwR0lr7A/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="154413"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="154413"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912869273"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912869273"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2023 06:18:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8LO5-0000JG-21;
	Wed, 29 Nov 2023 14:18:03 +0000
Date: Wed, 29 Nov 2023 22:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS WITH WARNING
 d7f1e9eefb0ffe8ed37933b2dbd1806401f5beaf
Message-ID: <202311292235.jIhlQQrL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: d7f1e9eefb0ffe8ed37933b2dbd1806401f5beaf  media: ov2740: Add s=
upport for embedded data

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202311290535.b6I99nud-lkp@intel.com

Warning: (recently discovered and may have been fixed)

Documentation/userspace-api/media/glossary.rst:123: WARNING: term not in gl=
ossary: digital tv api
Documentation/userspace-api/media/glossary.rst:124: WARNING: term not in gl=
ossary: mc api
Documentation/userspace-api/media/glossary.rst:125: WARNING: term not in gl=
ossary: rc api
Documentation/userspace-api/media/glossary.rst:126: WARNING: term not in gl=
ossary: v4l2 api
Documentation/userspace-api/media/glossary.rst:139: WARNING: term not in gl=
ossary: v4l2 hardware
Documentation/userspace-api/media/glossary.rst:160: WARNING: term not in gl=
ossary: hardware peripheral
Documentation/userspace-api/media/glossary.rst:17: WARNING: term not in glo=
ssary: device driver
Documentation/userspace-api/media/glossary.rst:198: WARNING: term not in gl=
ossary: device node
Documentation/userspace-api/media/glossary.rst:216: WARNING: term not in gl=
ossary: v4l2 sub-device
Documentation/userspace-api/media/glossary.rst:48: WARNING: term not in glo=
ssary: media hardware
Documentation/userspace-api/media/glossary.rst:56: WARNING: term not in glo=
ssary: microprocessor
Documentation/userspace-api/media/glossary.rst:62: WARNING: term not in glo=
ssary: ic
Documentation/userspace-api/media/glossary.rst:68: WARNING: term not in glo=
ssary: fpga
Documentation/userspace-api/media/glossary.rst:68: WARNING: term not in glo=
ssary: ip block
Documentation/userspace-api/media/glossary.rst:68: WARNING: term not in glo=
ssary: i=C2=B2c
Documentation/userspace-api/media/glossary.rst:68: WARNING: term not in glo=
ssary: soc
Documentation/userspace-api/media/glossary.rst:68: WARNING: term not in glo=
ssary: spi
Documentation/userspace-api/media/glossary.rst:73: WARNING: term not in glo=
ssary: hardware component
Documentation/userspace-api/media/glossary.rst:73: WARNING: term not in glo=
ssary: isp
Documentation/userspace-api/media/glossary.rst:79: WARNING: term not in glo=
ssary: peripheral

Unverified Warning (likely false positive, please contact us if interested):

drivers/media/i2c/ccs/ccs-core.c: media/v4l2-fwnode.h is included more than=
 once.

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-allnoconfig
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:device-driver
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:device-node
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:digital-tv-api
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:fpga
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:hardware-component
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:hardware-peripheral
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:i-c
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:ic
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:ip-block
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:isp
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:mc-api
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:media-hardware
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:microprocessor
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:peripheral
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:rc-api
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:soc
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:spi
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:v4l2-api
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:v4l2-hardware
    |-- Documentation-userspace-api-media-glossary.rst:WARNING:term-not-in-=
glossary:v4l2-sub-device
    `-- drivers-media-i2c-ccs-ccs-core.c:media-v4l2-fwnode.h-is-included-mo=
re-than-once.

elapsed time: 1506m

configs tested: 138
configs skipped: 0

tested configs:
alpha                             allnoconfig   gcc =20
alpha                            allyesconfig   gcc =20
alpha                               defconfig   gcc =20
arc                              allmodconfig   gcc =20
arc                               allnoconfig   gcc =20
arc                              allyesconfig   gcc =20
arc                                 defconfig   gcc =20
arc                   randconfig-001-20231128   gcc =20
arc                   randconfig-002-20231128   gcc =20
arm                              allmodconfig   gcc =20
arm                               allnoconfig   gcc =20
arm                              allyesconfig   gcc =20
arm                                 defconfig   clang
arm                   randconfig-001-20231128   clang
arm                   randconfig-002-20231128   clang
arm                   randconfig-003-20231128   clang
arm                   randconfig-004-20231128   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc =20
arm64                               defconfig   gcc =20
arm64                 randconfig-001-20231128   clang
arm64                 randconfig-002-20231128   clang
arm64                 randconfig-003-20231128   clang
arm64                 randconfig-004-20231128   clang
csky                             allmodconfig   gcc =20
csky                              allnoconfig   gcc =20
csky                             allyesconfig   gcc =20
csky                                defconfig   gcc =20
csky                  randconfig-001-20231128   gcc =20
csky                  randconfig-002-20231128   gcc =20
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231128   clang
hexagon               randconfig-002-20231128   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231128   clang
i386         buildonly-randconfig-002-20231128   clang
i386         buildonly-randconfig-003-20231128   clang
i386         buildonly-randconfig-004-20231128   clang
i386         buildonly-randconfig-005-20231128   clang
i386         buildonly-randconfig-006-20231128   clang
i386                                defconfig   gcc =20
i386                  randconfig-001-20231128   clang
i386                  randconfig-002-20231128   clang
i386                  randconfig-003-20231128   clang
i386                  randconfig-004-20231128   clang
i386                  randconfig-005-20231128   clang
i386                  randconfig-006-20231128   clang
i386                  randconfig-011-20231128   gcc =20
i386                  randconfig-012-20231128   gcc =20
i386                  randconfig-013-20231128   gcc =20
i386                  randconfig-014-20231128   gcc =20
i386                  randconfig-015-20231128   gcc =20
i386                  randconfig-016-20231128   gcc =20
loongarch                        allmodconfig   gcc =20
loongarch                         allnoconfig   gcc =20
loongarch             randconfig-001-20231128   gcc =20
loongarch             randconfig-002-20231128   gcc =20
m68k                             allmodconfig   gcc =20
m68k                              allnoconfig   gcc =20
m68k                             allyesconfig   gcc =20
microblaze                       allmodconfig   gcc =20
microblaze                        allnoconfig   gcc =20
microblaze                       allyesconfig   gcc =20
mips                             allyesconfig   gcc =20
nios2                            allmodconfig   gcc =20
nios2                            allyesconfig   gcc =20
nios2                 randconfig-001-20231128   gcc =20
nios2                 randconfig-002-20231128   gcc =20
openrisc                         allyesconfig   gcc =20
parisc                           allmodconfig   gcc =20
parisc                           allyesconfig   gcc =20
parisc                randconfig-001-20231128   gcc =20
parisc                randconfig-002-20231128   gcc =20
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20231128   clang
powerpc               randconfig-002-20231128   clang
powerpc               randconfig-003-20231128   clang
powerpc64             randconfig-001-20231128   clang
powerpc64             randconfig-002-20231128   clang
powerpc64             randconfig-003-20231128   clang
riscv                            allmodconfig   gcc =20
riscv                            allyesconfig   gcc =20
riscv                 randconfig-001-20231128   clang
riscv                 randconfig-002-20231128   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc =20
s390                             allyesconfig   gcc =20
s390                  randconfig-001-20231128   gcc =20
s390                  randconfig-002-20231128   gcc =20
sh                               allmodconfig   gcc =20
sh                               allyesconfig   gcc =20
sh                    randconfig-001-20231128   gcc =20
sh                    randconfig-002-20231128   gcc =20
sparc                            allmodconfig   gcc =20
sparc64                          allmodconfig   gcc =20
sparc64                          allyesconfig   gcc =20
sparc64               randconfig-001-20231128   gcc =20
sparc64               randconfig-002-20231128   gcc =20
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231128   clang
um                    randconfig-002-20231128   clang
x86_64                            allnoconfig   gcc =20
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231128   clang
x86_64       buildonly-randconfig-002-20231128   clang
x86_64       buildonly-randconfig-003-20231128   clang
x86_64       buildonly-randconfig-004-20231128   clang
x86_64       buildonly-randconfig-005-20231128   clang
x86_64       buildonly-randconfig-006-20231128   clang
x86_64                              defconfig   gcc =20
x86_64                randconfig-001-20231128   gcc =20
x86_64                randconfig-002-20231128   gcc =20
x86_64                randconfig-003-20231128   gcc =20
x86_64                randconfig-004-20231128   gcc =20
x86_64                randconfig-005-20231128   gcc =20
x86_64                randconfig-006-20231128   gcc =20
x86_64                randconfig-011-20231128   clang
x86_64                randconfig-012-20231128   clang
x86_64                randconfig-013-20231128   clang
x86_64                randconfig-014-20231128   clang
x86_64                randconfig-015-20231128   clang
x86_64                randconfig-016-20231128   clang
x86_64                randconfig-071-20231128   clang
x86_64                randconfig-072-20231128   clang
x86_64                randconfig-073-20231128   clang
x86_64                randconfig-074-20231128   clang
x86_64                randconfig-075-20231128   clang
x86_64                randconfig-076-20231128   clang
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231128   gcc =20
xtensa                randconfig-002-20231128   gcc =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

