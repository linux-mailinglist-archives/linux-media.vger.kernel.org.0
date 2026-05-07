Return-Path: <linux-media+bounces-60699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOALA7To+2nEHwAAu9opvQ
	(envelope-from <linux-media+bounces-60699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:19:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D00A4E1E77
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E03301BEC6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0919B18871F;
	Thu,  7 May 2026 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eE9SXUo1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6672E414
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116780; cv=none; b=rhC8NbFcX2oZM/LwhCWBNLWTLTdZ0uXLgbsmXxqtJbkKHL7CyO4kKM6z9w8ISeMlKRVwrAlWVDZ6QfA9OBxR78200vZGCzn1Bd4YF3dJCfWqd9vdjVMYV3Ym4nQQ0Jggh7ioED/VldTH84FIvX6ePyOXy0nLQyPt2ozRSZEzPhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116780; c=relaxed/simple;
	bh=4XI3Zz2RHd0YnmX8NOiFqq6eeVPU/WT63FR1xshxf9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GE+C52RdI+hEDh5R6tzttrC627Y4hJz6MM0aX8Zs0DnqUP9FhPrrjzWj28PyBbWkFGiq9tIdgOqXsND9FHWHT2kpAyq12KhJlnN4ToSWw3XIKOSf6/kbAED0kkFXRjihsLTO358DiNjoU8biavUr7z/6MCbb60iSpf5iM4QXkco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eE9SXUo1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778116778; x=1809652778;
  h=date:from:to:cc:subject:message-id;
  bh=4XI3Zz2RHd0YnmX8NOiFqq6eeVPU/WT63FR1xshxf9I=;
  b=eE9SXUo1Cl/7djz3thnxqSaCmH49ZF5iiuX3iTX+DjN3A5awsHSGdvth
   WfviYlV1Vw9g/5UeVwK+AgZMKoZyKr4DVq7ew/On5hhPadoBx52Co8DO6
   vUlvSIBsQ4nYM1qPxsuZ5ZAyK9AjWl8CZJw8Q95mXdOH208FTOMoq5R0C
   q7gor3ha/DE4u4rLmjo8s1HJo0IHrLCnyp5ulpOXzO+yElnD1BBzlrTtM
   IGUSGGomiWvRdPwYRWdNfCy1Bl8pym7aG4wNCrt9GhQBT0DQi7OyVAww8
   FqM72F0VezSK7Y4AZDzHw1nwIEbaaWMpqXb+C6zYABfGeoA8QjZc808cs
   Q==;
X-CSE-ConnectionGUID: DbixhlJBRdmrBQj0SSTULg==
X-CSE-MsgGUID: gj+Vk1ATTZCTVAOYxdkODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="104519560"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="104519560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 18:19:38 -0700
X-CSE-ConnectionGUID: 15aMORB/RJKOjvMNFLO7qg==
X-CSE-MsgGUID: ShbuogZKQMmp3Co2Cww7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="231778361"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2026 18:19:36 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKnOo-000000001Ob-1keV;
	Thu, 07 May 2026 01:19:34 +0000
Date: Thu, 07 May 2026 09:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 3cd9b7011519c3fffffb7b6752fc7603be52dc1d
Message-ID: <202605070950.l7gjxAH5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6D00A4E1E77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-60699-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 3cd9b7011519c3fffffb7b6752fc7603be52dc1d  Documentation: add documentation of AMD isp 4 driver

elapsed time: 720m

configs tested: 211
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-001-20260507    gcc-14.3.0
arc                   randconfig-002-20260506    gcc-12.5.0
arc                   randconfig-002-20260507    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-002-20260507    gcc-14.3.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm                   randconfig-004-20260507    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260507    gcc-15.2.0
arm64                 randconfig-002-20260507    gcc-15.2.0
arm64                 randconfig-003-20260507    gcc-15.2.0
arm64                 randconfig-004-20260507    gcc-15.2.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260507    gcc-15.2.0
csky                  randconfig-002-20260507    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260506    clang-23
hexagon               randconfig-002-20260506    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260506    clang-20
i386        buildonly-randconfig-001-20260507    clang-20
i386        buildonly-randconfig-002-20260506    clang-20
i386        buildonly-randconfig-002-20260507    clang-20
i386        buildonly-randconfig-003-20260506    clang-20
i386        buildonly-randconfig-003-20260507    clang-20
i386        buildonly-randconfig-004-20260506    clang-20
i386        buildonly-randconfig-004-20260507    clang-20
i386        buildonly-randconfig-005-20260506    clang-20
i386        buildonly-randconfig-005-20260507    clang-20
i386        buildonly-randconfig-006-20260506    clang-20
i386        buildonly-randconfig-006-20260507    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260507    gcc-14
i386                  randconfig-002-20260507    gcc-14
i386                  randconfig-003-20260507    gcc-14
i386                  randconfig-004-20260507    gcc-14
i386                  randconfig-005-20260507    gcc-14
i386                  randconfig-006-20260507    gcc-14
i386                  randconfig-007-20260507    gcc-14
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260506    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260506    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260506    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260506    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260506    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260506    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260506    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260506    clang-23
loongarch             randconfig-002-20260506    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260506    clang-23
nios2                 randconfig-002-20260506    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260507    gcc-8.5.0
parisc                randconfig-002-20260507    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260507    gcc-8.5.0
powerpc               randconfig-002-20260507    gcc-8.5.0
powerpc64             randconfig-001-20260507    gcc-8.5.0
powerpc64             randconfig-002-20260507    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260507    gcc-12.5.0
sparc                 randconfig-002-20260507    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260507    gcc-12.5.0
sparc64               randconfig-002-20260507    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260507    gcc-12.5.0
um                    randconfig-002-20260507    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260506    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260506    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260506    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260506    clang-20
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260506    clang-20
x86_64                randconfig-011-20260507    gcc-14
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260506    clang-20
x86_64                randconfig-012-20260507    gcc-14
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260506    clang-20
x86_64                randconfig-013-20260507    gcc-14
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260506    clang-20
x86_64                randconfig-014-20260507    gcc-14
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260506    clang-20
x86_64                randconfig-015-20260507    gcc-14
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260506    clang-20
x86_64                randconfig-016-20260507    gcc-14
x86_64                randconfig-071-20260507    clang-20
x86_64                randconfig-072-20260507    clang-20
x86_64                randconfig-073-20260507    clang-20
x86_64                randconfig-074-20260507    clang-20
x86_64                randconfig-075-20260507    clang-20
x86_64                randconfig-076-20260507    clang-20
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
xtensa                randconfig-001-20260507    gcc-12.5.0
xtensa                randconfig-002-20260507    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

