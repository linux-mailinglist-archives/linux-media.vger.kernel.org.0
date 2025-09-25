Return-Path: <linux-media+bounces-43172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404DB9F949
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A3D11C21F73
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8AD25BF14;
	Thu, 25 Sep 2025 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adWE5ICL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FB6F06A
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807068; cv=none; b=brhjCroFiufOvFgrvYJQAx3WzVq53NFF//cr4eP7Kz45wI3qnW2aoM5wR2UYglE5zZcIjsVb5x922M1CSWTiJEHi/Gjr5htRYt4Y+WkWj7wighUndrAzITIEFf783wHcXQjJULhWZD3qJ1KQ907nv9nKcwnW4QyR9Xriw8Wna3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807068; c=relaxed/simple;
	bh=KOG5/O7zorL/FwHsSx0npv2V/pd3CDR3t37GlRxTot8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tDKSTMQzp/Puv3A8njC/Ixrr1JHzgPxMie+6zMbBQTxPLjUSzElJm8aPTocfub9Z+o/PUKLkuk1H5YFIidlOODAmyKJPSsWgcRvgWEPNJT4Gvm+ZOgqpwmMUBgJDBvXsTcpDsDWtGVMk0kQMBvEPrEv3/hnUsw5sm9Qk/Axz8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adWE5ICL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758807066; x=1790343066;
  h=date:from:to:cc:subject:message-id;
  bh=KOG5/O7zorL/FwHsSx0npv2V/pd3CDR3t37GlRxTot8=;
  b=adWE5ICL1eTOlUUhVf9RGhKZ4l7MJF+tWqN336smb+BtiYW8Kt+XLugF
   ByW5IQW0DF1ohbOzEhGRvaWpwQQGdsN9IgDHan1NQPgzK3VafkjGWwlcH
   vcjbtFfX93txILcEYTQxuz/k6M75+j/7G59TU3xLFVY7lblEKhua1CyR2
   MvPNnFHfm/fjL/C9sbDSaIN33cS7U4QPXl3MxKCXIDxPigkdWLoZF9zEb
   w8yggBY42whkMnMfVH5mN5xUiSe8VJ9Oa97l634XuF3y/W2OtKACEsGPl
   NC+QEyHW85LInId67TyFTTUl7F5U/CMBmNaarWozmDaTo9dW2F7OcN9VX
   w==;
X-CSE-ConnectionGUID: MDOkUFHIREetGumKK9vB1A==
X-CSE-MsgGUID: 0nN6KTn4QXm9S9rPKDshcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71808914"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="71808914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 06:31:05 -0700
X-CSE-ConnectionGUID: 36GhQvLTQ4+6tTYimr0nPg==
X-CSE-MsgGUID: lVJbVhwPRmC9oXOyGgVFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="214461892"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2025 06:31:04 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1m3d-0005Ft-1W;
	Thu, 25 Sep 2025 13:30:53 +0000
Date: Thu, 25 Sep 2025 21:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
Message-ID: <202509252143.4KerZ0Zm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328  media: venus: pm_helpers: add fallback for the opp-table

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
|-- arm64-randconfig-051-20250925
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-052-20250925
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-053-20250925
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-054-20250925
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
`-- arm64-randconfig-055-20250925
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
    `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected

elapsed time: 1461m

configs tested: 113
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250924    gcc-11.5.0
arc                   randconfig-002-20250924    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20250924    clang-22
arm                   randconfig-002-20250924    clang-22
arm                   randconfig-003-20250924    clang-22
arm                   randconfig-004-20250924    gcc-13.4.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250924    gcc-14.3.0
arm64                 randconfig-002-20250924    clang-18
arm64                 randconfig-003-20250924    gcc-12.5.0
arm64                 randconfig-004-20250924    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250924    gcc-14.3.0
csky                  randconfig-002-20250924    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250924    clang-22
hexagon               randconfig-002-20250924    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250924    gcc-14
i386        buildonly-randconfig-002-20250924    clang-20
i386        buildonly-randconfig-003-20250924    gcc-13
i386        buildonly-randconfig-004-20250924    gcc-14
i386        buildonly-randconfig-005-20250924    clang-20
i386        buildonly-randconfig-006-20250924    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250924    gcc-15.1.0
loongarch             randconfig-002-20250924    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250924    gcc-11.5.0
nios2                 randconfig-002-20250924    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250924    gcc-12.5.0
parisc                randconfig-002-20250924    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20250924    clang-18
powerpc               randconfig-002-20250924    clang-18
powerpc               randconfig-003-20250924    clang-22
powerpc64             randconfig-001-20250924    clang-22
powerpc64             randconfig-002-20250924    gcc-15.1.0
powerpc64             randconfig-003-20250924    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250924    gcc-8.5.0
riscv                 randconfig-002-20250924    clang-22
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250924    gcc-8.5.0
s390                  randconfig-002-20250924    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20250924    gcc-15.1.0
sh                    randconfig-002-20250924    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250924    gcc-15.1.0
sparc                 randconfig-002-20250924    gcc-8.5.0
sparc64               randconfig-001-20250924    gcc-8.5.0
sparc64               randconfig-002-20250924    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250924    clang-16
um                    randconfig-002-20250924    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250924    clang-20
x86_64      buildonly-randconfig-002-20250924    clang-20
x86_64      buildonly-randconfig-003-20250924    clang-20
x86_64      buildonly-randconfig-004-20250924    gcc-14
x86_64      buildonly-randconfig-005-20250924    clang-20
x86_64      buildonly-randconfig-006-20250924    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250924    gcc-13.4.0
xtensa                randconfig-002-20250924    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

