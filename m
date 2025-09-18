Return-Path: <linux-media+bounces-42716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B81B8497D
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 14:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB8FB4A6000
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 12:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7471A226CF9;
	Thu, 18 Sep 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bua0w7TO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12419343B
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198786; cv=none; b=SFelE6je7QfCAI3AaiQCVchTAbvnBvJq2MbU5OEMQOgSELPv3iLeTNjwLLDbehzchM7q47wv7bXoSHRSBpNYxblrRUYVykrLXSj/5R9bDQpFRq9E1SYHmuS9CR90wHEasd4CreeeRrZ+O3XkD48/BzaXzaLYUDQRl9WLnNySV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198786; c=relaxed/simple;
	bh=S0ukjeBUlQgbB8VU/ktJWfk9YQftp/7kkXmW1UGfxXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UpWlhPqg+MUttC/xH9dyz1C2Nc71qVY6syHwnLF/8th3zwxTdD1iwZ1zsOXYv+vxUtypLoGxP4Ttpv68RAObwklC1g+ViX9adnpI1amCQx+zCx4P2k3cBfu2392LNlE5cC/Ce5lqWcqMAErxQyej05+N44EgmQdhzOQmBb2V8i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bua0w7TO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758198785; x=1789734785;
  h=date:from:to:cc:subject:message-id;
  bh=S0ukjeBUlQgbB8VU/ktJWfk9YQftp/7kkXmW1UGfxXY=;
  b=Bua0w7TO8jreMBlyrFAO+zsOTBgTX8+j0X7koX0YqUKfvHqzCCgS/Ajx
   ozaCUBJz+5L6YwXwey86rD4wuegXiwy5HHCfOh0/iAYTmPVx+st2HGNRa
   mLpfLUTRqgLVI0tCIz5QOx/xlRWX5VMPMXDo21QH5wlr+LwRpcgNzvMJB
   pRgksFoD6AuUX4A0HEpdwgiY3AQskVl5PnFRxb6IrAwyEpKh8n0TJwiNe
   4vJ0N+mpVp8UZoNDn/Ty3QP1akz+rucVU07ohd/4xKmwa0nmsW6JPLAUM
   WGKcNTuxnre60cZyogeWs5AvZvIEYyGR5WAYdKg7ONkrc5Xvi9LE4vsjB
   A==;
X-CSE-ConnectionGUID: W/lgLEjEQkutA0yQZbgF5w==
X-CSE-MsgGUID: 3drMglpkSeuLH5gl5QBCug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60579692"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60579692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 05:33:03 -0700
X-CSE-ConnectionGUID: y0qNZOBXS/WnkiZsOqMvCw==
X-CSE-MsgGUID: 2dfqWYltTwyxlhcDkIlOVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="175453128"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2025 05:33:01 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzDop-0003Fn-1K;
	Thu, 18 Sep 2025 12:32:59 +0000
Date: Thu, 18 Sep 2025 20:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 40b7a19f321e65789612ebaca966472055dab48c
Message-ID: <202509182058.IdFmlgTX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 40b7a19f321e65789612ebaca966472055dab48c  media: tuner: xc5000: Fix use-after-free in xc5000_release

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:0: 'top' was expected
    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:1: 'csid0' was expected
    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:2: 'csid1' was expected
    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:3: 'csiphy0' was expected
    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:4: 'csiphy1' was expected
    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:5: 'csitpg0' was expected
    arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:6: 'csitpg1' was expected

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250918
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-052-20250918
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-053-20250918
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-054-20250918
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
`-- arm64-randconfig-055-20250918
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
    `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected

elapsed time: 1450m

configs tested: 99
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250917    gcc-8.5.0
arc                   randconfig-002-20250917    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20250917    clang-22
arm                   randconfig-002-20250917    gcc-12.5.0
arm                   randconfig-003-20250917    gcc-10.5.0
arm                   randconfig-004-20250917    clang-22
arm                           sama5_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250917    clang-22
arm64                 randconfig-002-20250917    clang-19
arm64                 randconfig-003-20250917    gcc-10.5.0
arm64                 randconfig-004-20250917    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250917    gcc-12.5.0
csky                  randconfig-002-20250917    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250917    clang-22
hexagon               randconfig-002-20250917    clang-22
i386        buildonly-randconfig-001-20250917    gcc-14
i386        buildonly-randconfig-002-20250917    clang-20
i386        buildonly-randconfig-003-20250917    gcc-14
i386        buildonly-randconfig-004-20250917    gcc-14
i386        buildonly-randconfig-005-20250917    gcc-14
i386        buildonly-randconfig-006-20250917    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250917    gcc-15.1.0
loongarch             randconfig-002-20250917    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250917    gcc-11.5.0
nios2                 randconfig-002-20250917    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250917    gcc-14.3.0
parisc                randconfig-002-20250917    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       holly_defconfig    clang-22
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20250917    clang-18
powerpc               randconfig-002-20250917    clang-22
powerpc               randconfig-003-20250917    gcc-9.5.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250917    clang-19
powerpc64             randconfig-002-20250917    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250917    gcc-14.3.0
riscv                 randconfig-002-20250917    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250917    clang-22
s390                  randconfig-002-20250917    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250917    gcc-14.3.0
sh                    randconfig-002-20250917    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250917    gcc-8.5.0
sparc                 randconfig-002-20250917    gcc-14.3.0
sparc64               randconfig-001-20250917    gcc-11.5.0
sparc64               randconfig-002-20250917    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250917    gcc-14
um                    randconfig-002-20250917    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250917    gcc-14
x86_64      buildonly-randconfig-002-20250917    clang-20
x86_64      buildonly-randconfig-003-20250917    clang-20
x86_64      buildonly-randconfig-004-20250917    clang-20
x86_64      buildonly-randconfig-005-20250917    clang-20
x86_64      buildonly-randconfig-006-20250917    gcc-12
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250917    gcc-8.5.0
xtensa                randconfig-002-20250917    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

