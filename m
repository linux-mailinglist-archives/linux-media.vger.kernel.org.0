Return-Path: <linux-media+bounces-46030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6361DC225E6
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 22:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85AC43B85D7
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 21:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6D42DF719;
	Thu, 30 Oct 2025 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvODNfNw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101FF238D52
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761858089; cv=none; b=e0JYQq1Gr37dzphukWNrbNTiAermsozVnEt53aLoPCIfesu2t7hPgOU1mAvRQEQT1PTIWge2UZdr76Fkk29df1UdqL6mqAX2sMAfC6zU0IBcNBZnuG2uk6nI53vWbA5f8YIiBd2dQdAnf16NNQwonQnUkn6cN46pQlOGA/juECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761858089; c=relaxed/simple;
	bh=esVfu0+Fvm8WjTWOgPnjpdUDr6WqSS25QN8RmSwnszs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TNfyXs/9AmSVzyAaJlbR1Yk+UqDL6KfLbBokC1QoR+lud2L1KAAQv8IJFwxiU/jy2xbaS5UdKK/6C+gV31k9oYbVa66Z+e7+1hZOC4E9tzufPVgWUuP5+Xi8PCVyaK0qEfbEy5eYi95B8wb2Y7LCoNYzdtteZF3ccTrPifUixm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvODNfNw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761858088; x=1793394088;
  h=date:from:to:cc:subject:message-id;
  bh=esVfu0+Fvm8WjTWOgPnjpdUDr6WqSS25QN8RmSwnszs=;
  b=cvODNfNw57moULjBQg+X4QbWxIfb9W1YJbGUwwgSuLM5ub4F2aCkVYNf
   5MK2yii2cqMzjPVTeVgUjpM8nqVzUKBHL6YamQcgr0jaaR75eT3rnJUt4
   e7q/Pi/HmXvhm+AnxhXk1Bc5/YwTqD6ZcUDOPo7F4jgLTpuXgiTKkXhn4
   T2gqBS0psTYWTma3TBrx8DcxLu3YYhWqQvq/m8CaIqIWZ7hYHJ96+/9Ft
   ER5sZroaNOSi8LWFn15J3pRIiX9ii9vUda/YIFBMH4QW/jSX8VSR5H6pp
   pFLnt6WMnDP3Hfq73FEQjrvwJ50327gcF14flKInN/Ub9HzoSI1xAYln7
   g==;
X-CSE-ConnectionGUID: aR2akCG+SGmKkPHPErbk2w==
X-CSE-MsgGUID: rVyGDbW9TGWaUDbg4enODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66627843"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="66627843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 14:01:27 -0700
X-CSE-ConnectionGUID: xoPCEh0NQ2e3lShbjMcq+Q==
X-CSE-MsgGUID: 0iDgirokSemEa+H2UKOA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="191198646"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2025 14:01:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEZlr-000MWu-2e;
	Thu, 30 Oct 2025 21:01:23 +0000
Date: Fri, 31 Oct 2025 05:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 163917839c0eea3bdfe3620f27f617a55fd76302
Message-ID: <202510310536.bBcXFMAW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 163917839c0eea3bdfe3620f27f617a55fd76302  MAINTAINERS: Update Daniel Scally's email address

elapsed time: 1579m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm                           sama7_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251030    gcc-12.5.0
arm64                 randconfig-002-20251030    gcc-8.5.0
arm64                 randconfig-003-20251030    clang-17
arm64                 randconfig-004-20251030    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                  randconfig-001-20251030    gcc-13.4.0
csky                  randconfig-002-20251030    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251030    clang-20
i386        buildonly-randconfig-002-20251030    gcc-14
i386        buildonly-randconfig-003-20251030    clang-20
i386        buildonly-randconfig-004-20251030    clang-20
i386        buildonly-randconfig-005-20251030    gcc-14
i386        buildonly-randconfig-006-20251030    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251030    gcc-8.5.0
nios2                 randconfig-002-20251030    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251030    gcc-8.5.0
parisc                randconfig-002-20251030    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20251030    clang-22
powerpc               randconfig-002-20251030    clang-22
powerpc64             randconfig-001-20251030    gcc-8.5.0
powerpc64             randconfig-002-20251030    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251030    gcc-8.5.0
sparc                 randconfig-002-20251030    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251030    gcc-11.5.0
sparc64               randconfig-002-20251030    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251030    gcc-14
um                    randconfig-002-20251030    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251030    clang-20
x86_64      buildonly-randconfig-002-20251030    gcc-14
x86_64      buildonly-randconfig-003-20251030    gcc-13
x86_64      buildonly-randconfig-004-20251030    gcc-14
x86_64      buildonly-randconfig-005-20251030    clang-20
x86_64      buildonly-randconfig-006-20251030    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    clang-20
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-016-20251031    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251030    gcc-10.5.0
xtensa                randconfig-002-20251030    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

