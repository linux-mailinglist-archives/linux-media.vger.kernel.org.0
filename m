Return-Path: <linux-media+bounces-19812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD39A32D3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 04:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F402D1C23B3C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 02:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF8A15C144;
	Fri, 18 Oct 2024 02:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYQXSREB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73AB1607A4
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 02:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729218241; cv=none; b=a2L6Aqjl+Xpf8I1Jldx4Smujbosyj9T7CkLffXjRUMKoVEPC57WwdHKiRrgI41kh8M06VyiC4jW/uJ3NYE/pjfe3j6UJ1vcsaAhIbrZ4zTkFq8sH7QzColyfciFtOVs8JTbOHwUgco1HRyusLrtDSO2LRChMxg5ZqNXL3vD7jgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729218241; c=relaxed/simple;
	bh=79QMOFy9n5pdBKy/yecS9cTkcs4JhUUkeSsIiXVfNn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hwOR2eyLNczTN26sJTGQ5t72R81oOnmDWe05ZE2gb5ylhJ4Qa+NmRUptKeJP3KxsW4G3fSaF4m0poFY1CtN58adYUb8NFrnAU11rImjLYSEPguKJZTmuFxGHMwLMokvXGSn7WoAG7FIw8azPMuYii07IICgr1y6UaJfUM/ZRnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYQXSREB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729218240; x=1760754240;
  h=date:from:to:cc:subject:message-id;
  bh=79QMOFy9n5pdBKy/yecS9cTkcs4JhUUkeSsIiXVfNn8=;
  b=KYQXSREBBifFQbaDbCLpukVjL2Gh16ze7b4ekPrDHRzfc/F92HvU+kct
   u1QsRFD9V/ozlOhTMpFgg5fRndUaA17o2SbMEHhEzq24VooR+8AD+hpfD
   ur0TDIc0ZTVndshINx8/Xc3Vin8judbnZEmlA7gwot0wjbhajm7wlTgbW
   NGeb3oxHJI2pqLyxpwDWxHGJUD78dgsCF+Qb27SnbqLykQ8kUHmpn5sEk
   q5uAKjQ7zULdKx07ABISwFuY3x/s2fncMvbEqLpRPJuQehis9eWdYclHw
   As2wU21NmbC1kaONx5rRUImFcQamXBD9tETErsDmcFR2W/ycpBCyMg4YJ
   A==;
X-CSE-ConnectionGUID: i2IM4RnRSMO/N9uzxSTjZw==
X-CSE-MsgGUID: spDhHWKbSSGD7CiXyCmuag==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="54149833"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="54149833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 19:24:00 -0700
X-CSE-ConnectionGUID: tAFXjlYTR4qpOo44PwetEA==
X-CSE-MsgGUID: fbRq0DZqQcO1oJPbiBywCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78880535"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2024 19:23:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1ceh-000N9v-32;
	Fri, 18 Oct 2024 02:23:55 +0000
Date: Fri, 18 Oct 2024 10:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 bcd4f091cf1ea7184d813afc115af82ac9326b25
Message-ID: <202410181059.lFQ4fIro-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: bcd4f091cf1ea7184d813afc115af82ac9326b25  media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag

elapsed time: 4137m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-13.3.0
alpha                  allyesconfig    gcc-13.3.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241018    gcc-13.2.0
arc         randconfig-002-20241018    gcc-13.2.0
arm                    allmodconfig    gcc-14.1.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.1.0
arm         randconfig-001-20241018    clang-20
arm         randconfig-002-20241018    gcc-14.1.0
arm         randconfig-003-20241018    clang-20
arm         randconfig-004-20241018    clang-20
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64       randconfig-001-20241018    gcc-14.1.0
arm64       randconfig-002-20241018    clang-15
arm64       randconfig-003-20241018    gcc-14.1.0
csky                    allnoconfig    gcc-14.1.0
csky        randconfig-001-20241018    gcc-14.1.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-18
loongarch              allmodconfig    gcc-14.1.0
loongarch               allnoconfig    gcc-14.1.0
m68k                   allmodconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
m68k                   allyesconfig    gcc-14.1.0
microblaze             allmodconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
microblaze             allyesconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
openrisc                allnoconfig    gcc-14.1.0
openrisc               allyesconfig    gcc-14.1.0
parisc                 allmodconfig    gcc-14.1.0
parisc                  allnoconfig    gcc-14.1.0
parisc                 allyesconfig    gcc-14.1.0
powerpc                allmodconfig    gcc-14.1.0
powerpc                 allnoconfig    gcc-14.1.0
riscv                   allnoconfig    gcc-14.1.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.1.0
sh                     allmodconfig    gcc-14.1.0
sh                      allnoconfig    gcc-14.1.0
sh                     allyesconfig    gcc-14.1.0
sparc                  allmodconfig    gcc-14.1.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
x86_64                  allnoconfig    clang-18
x86_64                 allyesconfig    clang-18
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-18
x86_64                     rhel-8.3    gcc-12
xtensa                  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

