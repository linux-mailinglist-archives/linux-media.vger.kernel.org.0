Return-Path: <linux-media+bounces-22718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D939E5899
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3611516B521
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5BD21A420;
	Thu,  5 Dec 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFnI8VNN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7167149C64
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733409416; cv=none; b=Nm8C52xxIWvCu+X/2yF3OSB/JUgqINdtq7RdxvhTDci0Ky3S8Vh0UtsmjUiKI72mrLPHwT+OOnczCV54+i7DQn4qaun14yt/2wRNA0HkCacPCxPn0ZKeeoFoXucb0xbQI1vtwlmnGzOrkeEZjqVQiLkeU4rZqPLjKqsLxGdBgcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733409416; c=relaxed/simple;
	bh=ZXwJTLkRYJIxbZ6u6s30/Hol77Rad76RMwyUsrYbqZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wg4ihrkjt/adHwGMYl7Zc9ZnOSopyCSV5olOKYZAqMHbXn5OC7KBlDOd5vmC4cdPO8qHRMe6NOd3gLed3lKbd5mSHA7YVhb2JZVWnsIBA+Z44CHlLselfWSQbam5U7EU34aalrRHQyOrBmQ2pxURhJeH8jJcV1PSVa19hcVw8LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFnI8VNN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733409415; x=1764945415;
  h=date:from:to:cc:subject:message-id;
  bh=ZXwJTLkRYJIxbZ6u6s30/Hol77Rad76RMwyUsrYbqZA=;
  b=aFnI8VNNaUvZ2spbYa7qS3xOwi5P57KbHcNhgbTecAAiPAJG731sSjDp
   NNT5UjRRJeucnZyg4uj+JIkdTw+TjKSfRzh0q4OcJrMmPqrfJ+K241ALQ
   2wZi8U4djFU345Wc0uyC/Z7AkvDsJp9W1XCInxVvIoGCmmFrgZPObUN4a
   xgCDJG5Ulct6QJJObT3GrFvw2pg9yVgcStAg3c6Zlla4Dkt1JgBzEInAr
   ExqAaDXUT7Zdy1ojh9uZmOLb0Nwv31C8TZSM+JyGX5z8+KHIueQWw297o
   4QqDv4WqwCG+ixh9JJEX2H7uqiAEfTi+xeXFWW6lBZaAYKYaZNyjwtnqC
   w==;
X-CSE-ConnectionGUID: cdLevB88RnixzOfSg9RYmA==
X-CSE-MsgGUID: PP5WyASCRCyxMj0GuhEQ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33854757"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33854757"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 06:36:54 -0800
X-CSE-ConnectionGUID: UNb6z2CNRMmHQlMpM1dy9w==
X-CSE-MsgGUID: 2sDzYYOpRlixB0/eklGKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99148681"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2024 06:36:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJCyI-00005L-1E;
	Thu, 05 Dec 2024 14:36:50 +0000
Date: Thu, 05 Dec 2024 22:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 d1028b5748164e3ddd6d2bb0bbceee846ed2fc71
Message-ID: <202412052222.JeJSr2g9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: d1028b5748164e3ddd6d2bb0bbceee846ed2fc71  dt-bindings: media: qcom,sm8250-camss: Fix interrupt types

elapsed time: 1246m

configs tested: 257
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    clang-18
arc                          axs101_defconfig    clang-20
arc                          axs103_defconfig    clang-20
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    clang-19
arc                        nsimosci_defconfig    clang-20
arc                            randconfig-001    clang-20
arc                   randconfig-001-20241205    clang-20
arc                   randconfig-001-20241205    gcc-13.2.0
arc                            randconfig-002    clang-20
arc                   randconfig-002-20241205    clang-20
arc                   randconfig-002-20241205    gcc-13.2.0
arc                           tb10x_defconfig    clang-20
arc                        vdk_hs38_defconfig    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    clang-19
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         assabet_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                          collie_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                            hisi_defconfig    clang-20
arm                            hisi_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-18
arm                           imxrt_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                        keystone_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-17
arm                        mvebu_v5_defconfig    clang-20
arm                           omap1_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.2.0
arm                            randconfig-001    clang-20
arm                   randconfig-001-20241205    clang-20
arm                            randconfig-002    clang-20
arm                   randconfig-002-20241205    clang-20
arm                   randconfig-002-20241205    gcc-14.2.0
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241205    clang-20
arm                            randconfig-004    clang-20
arm                   randconfig-004-20241205    clang-15
arm                   randconfig-004-20241205    clang-20
arm                        realview_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                          sp7021_defconfig    clang-19
arm                          sp7021_defconfig    clang-20
arm                        spear3xx_defconfig    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm                           stm32_defconfig    clang-20
arm                       versatile_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                          randconfig-001    clang-20
arm64                 randconfig-001-20241205    clang-15
arm64                 randconfig-001-20241205    clang-20
arm64                          randconfig-002    clang-20
arm64                 randconfig-002-20241205    clang-20
arm64                 randconfig-002-20241205    gcc-14.2.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20241205    clang-20
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241205    clang-20
arm64                 randconfig-004-20241205    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          alldefconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241205    clang-19
i386                 buildonly-randconfig-002    clang-19
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241205    clang-19
i386                 buildonly-randconfig-003    clang-19
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241205    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241205    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241205    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241205    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    clang-20
m68k                           virt_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                         bigsur_defconfig    clang-17
mips                      bmips_stb_defconfig    clang-20
mips                          eyeq6_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           jazz_defconfig    clang-20
mips                     loongson1b_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
mips                          rb532_defconfig    clang-17
mips                   sb1250_swarm_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                       virt_defconfig    clang-19
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    clang-20
powerpc                    adder875_defconfig    clang-20
powerpc                     akebono_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-20
powerpc                 canyonlands_defconfig    clang-19
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                       ebony_defconfig    clang-18
powerpc                        fsp2_defconfig    clang-19
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-18
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                        icon_defconfig    clang-20
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-20
powerpc                 linkstation_defconfig    clang-18
powerpc                   lite5200b_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-20
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    clang-20
powerpc                      ppc44x_defconfig    clang-20
powerpc                     redwood_defconfig    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                    socrates_defconfig    clang-19
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc                        warp_defconfig    clang-17
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_virt_defconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    clang-17
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    clang-18
sh                         ecovec24_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-20
sh                          landisk_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    clang-20
sh                          r7780mp_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    clang-20
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-20
sh                          sdk7780_defconfig    clang-20
sh                           se7206_defconfig    clang-17
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    clang-17
sh                             sh03_defconfig    clang-20
sh                   sh7724_generic_defconfig    clang-20
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                             shx3_defconfig    clang-20
sh                            titan_defconfig    clang-20
sh                          urquell_defconfig    gcc-14.2.0
sparc                            alldefconfig    clang-18
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                           x86_64_defconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20241205    clang-19
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20241205    clang-19
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20241205    clang-19
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20241205    clang-19
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20241205    clang-19
x86_64      buildonly-randconfig-005-20241205    gcc-12
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20241205    clang-19
x86_64      buildonly-randconfig-006-20241205    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-20
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    clang-20
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

