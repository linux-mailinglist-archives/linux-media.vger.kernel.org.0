Return-Path: <linux-media+bounces-42491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A1B56AAF
	for <lists+linux-media@lfdr.de>; Sun, 14 Sep 2025 18:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76546189A761
	for <lists+linux-media@lfdr.de>; Sun, 14 Sep 2025 16:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36DA1FBEB9;
	Sun, 14 Sep 2025 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbtJ4xqr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786117C21B
	for <linux-media@vger.kernel.org>; Sun, 14 Sep 2025 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757868532; cv=none; b=Hf0B+Zij8UHKwzVLGMTZIPZiFG6wX2NDL0Dn5/GfsYH6rmnbnkRb1dsA1PoqBrT26JtMVW9+dKp8BIMYt1BGGwhTAgdKhGn27EvcbhMRaF9s9BXqw09fOB4JhjwQJw7vXBhosemRMKQBTY8/5l0IK/ZlacUjGCku3J/jByskBkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757868532; c=relaxed/simple;
	bh=L6jlXtuwnDGol2teo9sTDiuxuDLlavlx7CZwcnsegcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MDY/AWYZgOcl+3oMWS4ZhQeiO9fc/WH/5P7iLEGgFBoiPJ4kRpNl22cJby4a8YGSonhDTXTbLQb9anYOD41hhy6/qtYQqWxTpLI3wsfpm9W50/3UEIfWpweRPE4yTRRDmeoxesS6ADM1i8FhJTGGQbfZsL+CBOwhtAeq3btvS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbtJ4xqr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757868530; x=1789404530;
  h=date:from:to:cc:subject:message-id;
  bh=L6jlXtuwnDGol2teo9sTDiuxuDLlavlx7CZwcnsegcc=;
  b=HbtJ4xqr3SwUof4Le7AohlUeOHxtjkhg4FDcxIkQkGVj+Gd6maNF/gOs
   pSdaWBzEP0yB+kcUhLYAviVZ7dS3lmqn1yv2/Gj3tC+WtzULG61AtxRld
   KsJzYpqoEwO9tlI83Irb7GLjlZG/bN9tGUWUnAUAJS0k6+IbOU+VnrlFg
   ZuVIOtGlrtccqMbZNrpeF15lsHqAlu76PlWkb73SMdIJ0rIvwHyup6+xy
   BKyM3qMa8gYfOi/eFzyUtP+NMNu0SPyM5cvlz2deXZ3vKY94/1+brHeOd
   06/Do9bK7G1+q3wKIn9x8u8xdQkscEmj+qhEswk1EIp+KhpIw8LKqbKUt
   Q==;
X-CSE-ConnectionGUID: iRU8i3pfSgCW5K0e8D/9mA==
X-CSE-MsgGUID: QN0eFF2xSOqiH94FPYhgLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="63958104"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="63958104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 09:48:50 -0700
X-CSE-ConnectionGUID: xYaU1cIaS6Kh2kg66I+PKw==
X-CSE-MsgGUID: mtw4G7XqQIyRTQRZJvp4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="173972425"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2025 09:48:48 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxpu9-0002ZE-33;
	Sun, 14 Sep 2025 16:48:45 +0000
Date: Mon, 15 Sep 2025 00:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 0e2ee70291e64a30fe36960c85294726d34a103e
Message-ID: <202509150041.LOgyfItn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 0e2ee70291e64a30fe36960c85294726d34a103e  media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID

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
|-- arm64-randconfig-051-20250914
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-052-20250914
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-053-20250914
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
|-- arm64-randconfig-054-20250914
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
|   |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
|   `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected
`-- arm64-randconfig-055-20250914
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csid1-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csiphy1-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg0-was-expected
    |-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:csitpg1-was-expected
    `-- arch-arm64-boot-dts-qcom-qrb2210-rb1.dtb:camss-5c6e000-(qcom-qcm2290-camss):reg-names:top-was-expected

elapsed time: 1398m

configs tested: 176
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250914    gcc-9.5.0
arc                   randconfig-002-20250914    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250914    clang-22
arm                   randconfig-002-20250914    clang-19
arm                   randconfig-003-20250914    gcc-14.3.0
arm                   randconfig-004-20250914    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250914    gcc-9.5.0
arm64                 randconfig-002-20250914    clang-22
arm64                 randconfig-003-20250914    clang-17
arm64                 randconfig-004-20250914    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250914    gcc-15.1.0
csky                  randconfig-002-20250914    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250914    clang-22
hexagon               randconfig-002-20250914    clang-22
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250914    gcc-13
i386        buildonly-randconfig-002-20250914    gcc-14
i386        buildonly-randconfig-003-20250914    gcc-14
i386        buildonly-randconfig-004-20250914    gcc-14
i386        buildonly-randconfig-005-20250914    clang-20
i386        buildonly-randconfig-006-20250914    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250914    gcc-14
i386                  randconfig-002-20250914    gcc-14
i386                  randconfig-003-20250914    gcc-14
i386                  randconfig-004-20250914    gcc-14
i386                  randconfig-005-20250914    gcc-14
i386                  randconfig-006-20250914    gcc-14
i386                  randconfig-007-20250914    gcc-14
i386                  randconfig-011-20250914    clang-20
i386                  randconfig-012-20250914    clang-20
i386                  randconfig-013-20250914    clang-20
i386                  randconfig-014-20250914    clang-20
i386                  randconfig-015-20250914    clang-20
i386                  randconfig-016-20250914    clang-20
i386                  randconfig-017-20250914    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250914    clang-22
loongarch             randconfig-002-20250914    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250914    gcc-10.5.0
nios2                 randconfig-002-20250914    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250914    gcc-8.5.0
parisc                randconfig-002-20250914    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250914    clang-22
powerpc               randconfig-002-20250914    clang-22
powerpc               randconfig-003-20250914    clang-22
powerpc64             randconfig-001-20250914    clang-22
powerpc64             randconfig-002-20250914    clang-22
powerpc64             randconfig-003-20250914    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250914    clang-22
riscv                 randconfig-002-20250914    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20250914    gcc-10.5.0
s390                  randconfig-002-20250914    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250914    gcc-15.1.0
sh                    randconfig-002-20250914    gcc-10.5.0
sh                           se7724_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250914    gcc-11.5.0
sparc                 randconfig-002-20250914    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250914    gcc-8.5.0
sparc64               randconfig-002-20250914    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250914    clang-22
um                    randconfig-002-20250914    clang-18
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250914    clang-20
x86_64      buildonly-randconfig-002-20250914    clang-20
x86_64      buildonly-randconfig-003-20250914    clang-20
x86_64      buildonly-randconfig-004-20250914    clang-20
x86_64      buildonly-randconfig-005-20250914    gcc-14
x86_64      buildonly-randconfig-006-20250914    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250914    clang-20
x86_64                randconfig-002-20250914    clang-20
x86_64                randconfig-003-20250914    clang-20
x86_64                randconfig-004-20250914    clang-20
x86_64                randconfig-005-20250914    clang-20
x86_64                randconfig-006-20250914    clang-20
x86_64                randconfig-007-20250914    clang-20
x86_64                randconfig-008-20250914    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250914    gcc-14.3.0
xtensa                randconfig-002-20250914    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

