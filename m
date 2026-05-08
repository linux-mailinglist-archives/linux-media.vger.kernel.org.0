Return-Path: <linux-media+bounces-60927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA4HOvXy/WlxlAAAu9opvQ
	(envelope-from <linux-media+bounces-60927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 16:28:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96E4F7B88
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 16:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6AA530804FB
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FAA3EF0C5;
	Fri,  8 May 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bk0d9/aQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34133DDDBE
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250193; cv=none; b=c82t363ju5wgcnZTxVnIMWn2/O+PbsCxhVlc9xm3CaogghdaL+KYaHoerWUezOnjv+HEHXxKWiwiWhziwZJ0jhHqyOoaTfN8jB+EZ3UKYw6DLjhnMko20hVO37rvVzXNnkRmjXAwnS7z9x68CESHFWZyoJUHbArYrd+c4BzP1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250193; c=relaxed/simple;
	bh=0iWBHiZqfkMkracpgHPmvAf7D+vqveq2YFRV2U1s82k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BXdoY67PFIvYAA5Me+Rp4OZPiKKYH57OQaor18sitGv/1+fCf2vq3XsMMUegKlWfG49wPgIOTAKm6n5hRBdzf7LjkZ6eJU4xpUryRm7ujY41qixdJxmpbnZmC98J7Ot6+1TkQRgZJsGkvY54WOSAdugSqLEL8ZPu1UZxPLz/yYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bk0d9/aQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778250192; x=1809786192;
  h=date:from:to:cc:subject:message-id;
  bh=0iWBHiZqfkMkracpgHPmvAf7D+vqveq2YFRV2U1s82k=;
  b=Bk0d9/aQDXZOuxJEAq45OBTW/SN8aSm1pXWZK9EYftSNiMnRf6rfjyPB
   ZoEzHOnAm2wD3HYcLXEHSE8sUwbxZ0L38GJ8b5jMiuuAHMTfJyKtsBAx6
   rNz9PJQZqWG9rt1/Jv6dZ8KMt0LP4Xdn5OYRASTeqRrQkEa+suTAWDS32
   0MgOXNgwB23RN2fJihidIIlT7ulnRcCqUoTb+ZCTfQJJM/dojGwKY38VM
   WNWYtLnBrdvSEDIOoR3fbxeqXjya+YAhnKNvYVhxU6t/shbzFLXIrzXvu
   t8qTlybgKrkt/biXvrxNNngoRP7A+TJsmocfWAEx8O7wIS/oPoGLWQ/w+
   A==;
X-CSE-ConnectionGUID: VN6QzGSJTASzzVPMANi0NA==
X-CSE-MsgGUID: ji8Tb/oAQgCIgkydegU3rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89529618"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89529618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 07:23:11 -0700
X-CSE-ConnectionGUID: 5VkoO4nySFe/DodkYJQpyA==
X-CSE-MsgGUID: hZ9mZSa2QhuyVyOexOIMvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241745190"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2026 07:23:08 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLM6b-000000000C9-2642;
	Fri, 08 May 2026 14:23:05 +0000
Date: Fri, 08 May 2026 22:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 5a6ec95b0b471105ac601a21db87a03f7f1af967
Message-ID: <202605082209.12IcClbJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 4F96E4F7B88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60927-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 5a6ec95b0b471105ac601a21db87a03f7f1af967  media: irtoy: Refactor endpoint lookup

elapsed time: 4993m

configs tested: 404
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-001-20260508    gcc-12.5.0
arc                   randconfig-001-20260508    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260505    gcc-8.5.0
arc                   randconfig-002-20260506    gcc-12.5.0
arc                   randconfig-002-20260508    gcc-12.5.0
arc                   randconfig-002-20260508    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                        neponset_defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-001-20260508    gcc-12.5.0
arm                   randconfig-001-20260508    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-002-20260508    gcc-12.5.0
arm                   randconfig-002-20260508    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-003-20260508    gcc-12.5.0
arm                   randconfig-003-20260508    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm                   randconfig-004-20260508    gcc-12.5.0
arm                   randconfig-004-20260508    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-001-20260508    gcc-14.3.0
arm64                 randconfig-002-20260505    gcc-14.3.0
arm64                 randconfig-002-20260508    gcc-14.3.0
arm64                 randconfig-003-20260505    gcc-14.3.0
arm64                 randconfig-003-20260508    gcc-14.3.0
arm64                 randconfig-004-20260505    gcc-14.3.0
arm64                 randconfig-004-20260508    gcc-14.3.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-001-20260508    gcc-14.3.0
csky                  randconfig-002-20260505    gcc-14.3.0
csky                  randconfig-002-20260508    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-001-20260505    gcc-11.5.0
hexagon               randconfig-001-20260508    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260505    clang-23
hexagon               randconfig-002-20260505    gcc-11.5.0
hexagon               randconfig-002-20260508    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-13
i386        buildonly-randconfig-001-20260505    gcc-14
i386        buildonly-randconfig-001-20260508    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260505    gcc-14
i386        buildonly-randconfig-002-20260508    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260505    clang-20
i386        buildonly-randconfig-003-20260505    gcc-14
i386        buildonly-randconfig-003-20260508    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260505    clang-20
i386        buildonly-randconfig-004-20260505    gcc-14
i386        buildonly-randconfig-004-20260508    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260505    gcc-14
i386        buildonly-randconfig-005-20260508    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260505    gcc-14
i386        buildonly-randconfig-006-20260508    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260505    clang-20
i386                  randconfig-001-20260508    gcc-14
i386                  randconfig-002-20260505    clang-20
i386                  randconfig-002-20260508    gcc-14
i386                  randconfig-003-20260505    clang-20
i386                  randconfig-003-20260508    gcc-14
i386                  randconfig-004-20260505    clang-20
i386                  randconfig-004-20260508    gcc-14
i386                  randconfig-005-20260505    clang-20
i386                  randconfig-005-20260508    gcc-14
i386                  randconfig-006-20260505    clang-20
i386                  randconfig-006-20260508    gcc-14
i386                  randconfig-007-20260505    clang-20
i386                  randconfig-007-20260508    gcc-14
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-011-20260506    clang-20
i386                  randconfig-011-20260508    gcc-13
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-012-20260506    clang-20
i386                  randconfig-012-20260508    gcc-13
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-013-20260506    clang-20
i386                  randconfig-013-20260508    gcc-13
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-014-20260506    clang-20
i386                  randconfig-014-20260508    gcc-13
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-015-20260506    clang-20
i386                  randconfig-015-20260508    gcc-13
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-016-20260506    clang-20
i386                  randconfig-016-20260508    gcc-13
i386                  randconfig-017-20260505    clang-20
i386                  randconfig-017-20260506    clang-20
i386                  randconfig-017-20260508    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260505    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch             randconfig-001-20260508    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260505    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
loongarch             randconfig-002-20260508    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    clang-23
mips                         rt305x_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260505    clang-23
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                 randconfig-001-20260508    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260505    clang-23
nios2                 randconfig-002-20260505    gcc-11.5.0
nios2                 randconfig-002-20260508    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc         de0_nano_multicore_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-14.3.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                randconfig-001-20260508    gcc-9.5.0
parisc                         randconfig-002    gcc-14.3.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc                randconfig-002-20260506    gcc-13.4.0
parisc                randconfig-002-20260508    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                        randconfig-001    gcc-14.3.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc               randconfig-001-20260506    gcc-13.4.0
powerpc               randconfig-001-20260508    gcc-9.5.0
powerpc                        randconfig-002    gcc-14.3.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc               randconfig-002-20260506    gcc-13.4.0
powerpc               randconfig-002-20260508    gcc-9.5.0
powerpc                     tqm8541_defconfig    clang-23
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc64                      randconfig-001    gcc-14.3.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64             randconfig-001-20260506    gcc-13.4.0
powerpc64             randconfig-001-20260508    gcc-9.5.0
powerpc64                      randconfig-002    gcc-14.3.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
powerpc64             randconfig-002-20260508    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260505    gcc-10.5.0
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                 randconfig-001-20260508    clang-23
riscv                 randconfig-002-20260506    gcc-8.5.0
riscv                 randconfig-002-20260508    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260505    gcc-10.5.0
s390                  randconfig-001-20260506    gcc-8.5.0
s390                  randconfig-001-20260508    clang-23
s390                  randconfig-002-20260505    gcc-10.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
s390                  randconfig-002-20260508    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260505    gcc-10.5.0
sh                    randconfig-001-20260506    gcc-8.5.0
sh                    randconfig-001-20260508    clang-23
sh                    randconfig-002-20260505    gcc-10.5.0
sh                    randconfig-002-20260506    gcc-8.5.0
sh                    randconfig-002-20260508    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260505    gcc-15.2.0
sparc                 randconfig-001-20260506    gcc-11.5.0
sparc                 randconfig-001-20260508    gcc-12
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260505    gcc-15.2.0
sparc                 randconfig-002-20260506    gcc-11.5.0
sparc                 randconfig-002-20260508    gcc-12
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260505    gcc-15.2.0
sparc64               randconfig-001-20260506    gcc-11.5.0
sparc64               randconfig-001-20260508    gcc-12
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260505    gcc-15.2.0
sparc64               randconfig-002-20260506    gcc-11.5.0
sparc64               randconfig-002-20260508    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260505    gcc-15.2.0
um                    randconfig-001-20260506    gcc-11.5.0
um                    randconfig-001-20260508    gcc-12
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260505    gcc-15.2.0
um                    randconfig-002-20260506    gcc-11.5.0
um                    randconfig-002-20260508    gcc-12
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260505    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-001-20260508    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260505    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-002-20260508    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260505    clang-20
x86_64      buildonly-randconfig-003-20260505    gcc-14
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-003-20260508    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260505    clang-20
x86_64      buildonly-randconfig-004-20260505    gcc-14
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-004-20260508    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260505    clang-20
x86_64      buildonly-randconfig-005-20260505    gcc-14
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-005-20260508    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260505    clang-20
x86_64      buildonly-randconfig-006-20260505    gcc-14
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64      buildonly-randconfig-006-20260508    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-001-20260508    clang-20
x86_64                randconfig-002-20260505    clang-20
x86_64                randconfig-002-20260508    clang-20
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-003-20260508    clang-20
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-004-20260508    clang-20
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-005-20260508    clang-20
x86_64                randconfig-006-20260505    clang-20
x86_64                randconfig-006-20260508    clang-20
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260505    clang-20
x86_64                randconfig-011-20260508    gcc-14
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260505    clang-20
x86_64                randconfig-012-20260508    gcc-14
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260505    clang-20
x86_64                randconfig-013-20260508    gcc-14
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260505    clang-20
x86_64                randconfig-014-20260508    gcc-14
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260505    clang-20
x86_64                randconfig-015-20260508    gcc-14
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260505    clang-20
x86_64                randconfig-016-20260508    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260505    clang-20
x86_64                randconfig-071-20260505    gcc-14
x86_64                randconfig-071-20260506    clang-20
x86_64                randconfig-071-20260508    gcc-14
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260505    clang-20
x86_64                randconfig-072-20260506    clang-20
x86_64                randconfig-072-20260508    gcc-14
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260505    clang-20
x86_64                randconfig-073-20260505    gcc-14
x86_64                randconfig-073-20260506    clang-20
x86_64                randconfig-073-20260508    gcc-14
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260505    clang-20
x86_64                randconfig-074-20260505    gcc-14
x86_64                randconfig-074-20260506    clang-20
x86_64                randconfig-074-20260508    gcc-14
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260505    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                randconfig-075-20260508    gcc-14
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260505    clang-20
x86_64                randconfig-076-20260506    clang-20
x86_64                randconfig-076-20260508    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260505    gcc-15.2.0
xtensa                randconfig-001-20260506    gcc-11.5.0
xtensa                randconfig-001-20260508    gcc-12
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260505    gcc-15.2.0
xtensa                randconfig-002-20260506    gcc-11.5.0
xtensa                randconfig-002-20260508    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

