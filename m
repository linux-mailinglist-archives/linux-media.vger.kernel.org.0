Return-Path: <linux-media+bounces-17884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637E97042B
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 23:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47A451C21211
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 21:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848DD1547E8;
	Sat,  7 Sep 2024 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHH+yBfd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9EC1B85E6
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725744327; cv=none; b=LgcQttov04Yf7VnU1uCbcEPu7wQ9E/L5WxJK/LNmgmHjRVQAZt8kObQ/T9HRGAorMcdoWZWC0qJbZiHDxi3JIs26BaMEfhTLDOsqx96BF05HgTFyu1X+NFbotNNXqpbNHk2mDN5p7HTds4HKlkNk+GSYVifTFDxFhhZCcLE5C2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725744327; c=relaxed/simple;
	bh=bl75LcHs/kCZVvn92bGF8OaEZHCm80XTcvdJ2TM6Exs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORZOx4EGR8aAPUJL7YJzpwRLeg0M9QU+2S8C5B2H3iLaYqywgScbsnKijR792DCpYXPbxKKzpckTZpDyVthmt92+Yz9nR8RkRrcKQYIx5kCvNVG8Mm0uJQrxYgoRVUA6jVPlsnsukt0XDB3a84ZoThcthZ4FoQSdgfQhGhKFxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHH+yBfd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725744326; x=1757280326;
  h=date:from:to:cc:subject:message-id;
  bh=bl75LcHs/kCZVvn92bGF8OaEZHCm80XTcvdJ2TM6Exs=;
  b=fHH+yBfdUbSQYW97EiE4EusosIv5RvEsPAwDoxHwfIf6oKfukK+o+Tg/
   1nQnteC6pvLmC00PgaKE+Ix7z9dMUX9NiXuDK+C9WNnklhYR7FQyV3um6
   YHEsBYEnmwgKhJ7LY2T6UyI2H3gdWO2bIK0jJok5M9a7C1QrKS5h+fhBw
   Mlcn7gQgSLx8zEtEFg2jAJnUDD65kM6dnt3uSE+AZFAtYCKD0EemMLvdV
   3ZuXzTuX/bW0MtwmvxEjlHzqfKuDu0wUlAVFl3tYZ7QqqTwws8l6g1N81
   dR7shbHnSUDwIR21pCRpkisj691GBQbz7TacisbnZySChcR+Yv2GcEWBh
   Q==;
X-CSE-ConnectionGUID: eHAjZsEYSAGV7OHc8nRlHQ==
X-CSE-MsgGUID: nJEg8pFlQaq3G5SLHdlyFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="28260252"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="28260252"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 14:25:25 -0700
X-CSE-ConnectionGUID: u/pnNp4TRD+AMyE1HlD49A==
X-CSE-MsgGUID: 74dkh1vHT7ijV83iTSLmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70403808"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 14:25:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn2vq-000D0z-0d;
	Sat, 07 Sep 2024 21:25:22 +0000
Date: Sun, 08 Sep 2024 05:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 b36c41c51e9d763393634359b90f02414ef470a3
Message-ID: <202409080510.3ZtXpoLg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: b36c41c51e9d763393634359b90f02414ef470a3  media: atomisp: set lock before calling vb2_queue_init()

elapsed time: 1930m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240907   clang-18
i386         buildonly-randconfig-002-20240907   gcc-12
i386         buildonly-randconfig-003-20240907   gcc-12
i386         buildonly-randconfig-004-20240907   clang-18
i386         buildonly-randconfig-005-20240907   clang-18
i386         buildonly-randconfig-006-20240907   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240907   clang-18
i386                  randconfig-002-20240907   clang-18
i386                  randconfig-003-20240907   clang-18
i386                  randconfig-004-20240907   gcc-12
i386                  randconfig-005-20240907   gcc-12
i386                  randconfig-006-20240907   gcc-12
i386                  randconfig-011-20240907   clang-18
i386                  randconfig-012-20240907   gcc-12
i386                  randconfig-013-20240907   clang-18
i386                  randconfig-014-20240907   clang-18
i386                  randconfig-015-20240907   clang-18
i386                  randconfig-016-20240907   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240907   gcc-12
x86_64       buildonly-randconfig-002-20240907   gcc-12
x86_64       buildonly-randconfig-003-20240907   gcc-12
x86_64       buildonly-randconfig-004-20240907   gcc-12
x86_64       buildonly-randconfig-005-20240907   gcc-12
x86_64       buildonly-randconfig-006-20240907   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240907   gcc-12
x86_64                randconfig-002-20240907   gcc-12
x86_64                randconfig-003-20240907   gcc-12
x86_64                randconfig-004-20240907   gcc-12
x86_64                randconfig-005-20240907   gcc-12
x86_64                randconfig-006-20240907   gcc-12
x86_64                randconfig-011-20240907   gcc-12
x86_64                randconfig-012-20240907   gcc-12
x86_64                randconfig-013-20240907   gcc-12
x86_64                randconfig-014-20240907   gcc-12
x86_64                randconfig-015-20240907   gcc-12
x86_64                randconfig-016-20240907   gcc-12
x86_64                randconfig-071-20240907   gcc-12
x86_64                randconfig-072-20240907   gcc-12
x86_64                randconfig-073-20240907   gcc-12
x86_64                randconfig-074-20240907   gcc-12
x86_64                randconfig-075-20240907   gcc-12
x86_64                randconfig-076-20240907   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

