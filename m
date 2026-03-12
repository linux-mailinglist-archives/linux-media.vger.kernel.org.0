Return-Path: <linux-media+bounces-55463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCNiIqlDsmlFKgAAu9opvQ
	(envelope-from <linux-media+bounces-55463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 05:40:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3126D2AE
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 05:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C71EB30AD90B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058CB3976AB;
	Thu, 12 Mar 2026 04:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ex9K1PCq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B430FF2A
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 04:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290377; cv=none; b=dQ7n3n0zD9Awbku6pYBXHSz2FZRazspgSj4paNQ23qwxhBvkPLeAOmVPkRRuR+nvl7IgH8r/Zq11ebiUpQfSvO7yHMOvd3tGrnGNYvsl0ncAmRlPtp0688u0iHKETB+FEiSdLMtDdRw5mvE4WDMkusJvnchs/Ov+jdlb8Wp0W0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290377; c=relaxed/simple;
	bh=V8wZGVRKr7WHIJHn+v6tPdtgSh5lkpzhIpAGVshzoi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t4BsCCopvJo39VRoezRzgyuYYy6Z4iiDAT3t1lSbPFXZti4a51gAAB6JgjFUbAZmvhP3GpgRo1up5vFjLmrTAVNIPOTUfYFw0VIV1Jw3reH4zozBc+YQan8E0G8kzi/fOPWjE6v3lrfbDNnatvLSHm+1MYyd/Co46+Uh5akNZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ex9K1PCq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773290376; x=1804826376;
  h=date:from:to:cc:subject:message-id;
  bh=V8wZGVRKr7WHIJHn+v6tPdtgSh5lkpzhIpAGVshzoi0=;
  b=ex9K1PCqHNWMLXTcLh7HovVnhWNH59ZrS8OiKQFCConuNxDrVcR0ZSHF
   cODLzS+5JmPUelGTpX+s6aAwlfBNDfPKOzr6NTWoyiousJOjW0sfla7Vk
   ccRD09C/bepFJEBLfcQ3uu8KUMmUkZNcInRfikMv4ysTWcsWZe7ASReJ3
   006myCtpg7/iHtynMova/hq7UKaCMh3/2IH6yPkOqHYtmZH3p59eKWkjJ
   jqmdBxkn3QRuYvn/DmM7rcPUmvGB2vfdMg9X0oqMjv6ERL243kG8dHUBk
   AHLAUSUUAM8veTwtsD6no/1/9r2vkZhfDhm9JTmQLO8nXyJmTL0vtcb1A
   g==;
X-CSE-ConnectionGUID: fRCbLA8MQbaLv8+DuPG9mA==
X-CSE-MsgGUID: TZ6+1/12RACEtB7iqPn5vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84691805"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84691805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:39:36 -0700
X-CSE-ConnectionGUID: Bx/v2VY7Q9m2JO9JGABYJQ==
X-CSE-MsgGUID: WDC/6iqlRWKdIQMqVA9lKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="217284048"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2026 21:39:33 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Xpb-0000000024x-219t;
	Thu, 12 Mar 2026 04:39:31 +0000
Date: Thu, 12 Mar 2026 12:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 825355f2e509475b23c5d7595cdd9ea557294f0c
Message-ID: <202603121219.sUYJnC6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55463-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2F3126D2AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 825355f2e509475b23c5d7595cdd9ea557294f0c  media: i2c: imx355: Restrict data lanes to 4

elapsed time: 1068m

configs tested: 143
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260311    gcc-14.3.0
arc                   randconfig-002-20260311    gcc-9.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                           omap1_defconfig    gcc-15.2.0
arm                   randconfig-001-20260311    clang-23
arm                   randconfig-002-20260311    gcc-8.5.0
arm                   randconfig-003-20260311    clang-16
arm                   randconfig-004-20260311    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260311    clang-23
arm64                 randconfig-002-20260311    clang-23
arm64                 randconfig-003-20260311    gcc-12.5.0
arm64                 randconfig-004-20260311    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260311    gcc-11.5.0
csky                  randconfig-002-20260311    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260312    clang-23
hexagon               randconfig-002-20260312    clang-23
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260312    gcc-12
i386        buildonly-randconfig-002-20260312    gcc-14
i386        buildonly-randconfig-003-20260312    gcc-14
i386        buildonly-randconfig-004-20260312    gcc-12
i386        buildonly-randconfig-005-20260312    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260312    gcc-14
i386                  randconfig-002-20260312    gcc-14
i386                  randconfig-003-20260312    gcc-12
i386                  randconfig-004-20260312    gcc-14
i386                  randconfig-005-20260312    gcc-14
i386                  randconfig-006-20260312    gcc-14
i386                  randconfig-007-20260312    gcc-12
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260312    gcc-15.2.0
loongarch             randconfig-002-20260312    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260312    gcc-11.5.0
nios2                 randconfig-002-20260312    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260312    gcc-8.5.0
parisc                randconfig-002-20260312    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260312    gcc-8.5.0
powerpc               randconfig-002-20260312    gcc-8.5.0
powerpc64             randconfig-001-20260312    clang-23
powerpc64             randconfig-002-20260312    gcc-14.3.0
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260312    clang-23
riscv                 randconfig-002-20260312    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260312    gcc-14.3.0
s390                  randconfig-002-20260312    gcc-9.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260312    gcc-12.5.0
sh                    randconfig-002-20260312    gcc-13.4.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260311    gcc-8.5.0
sparc                 randconfig-002-20260311    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260311    gcc-13.4.0
sparc64               randconfig-002-20260311    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260311    gcc-14
um                    randconfig-002-20260311    clang-18
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260312    gcc-12
x86_64      buildonly-randconfig-002-20260312    gcc-14
x86_64      buildonly-randconfig-003-20260312    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260312    clang-20
x86_64                randconfig-002-20260312    clang-20
x86_64                randconfig-003-20260312    clang-20
x86_64                randconfig-004-20260312    clang-20
x86_64                randconfig-005-20260312    clang-20
x86_64                randconfig-006-20260312    clang-20
x86_64                randconfig-011-20260312    gcc-14
x86_64                randconfig-012-20260312    gcc-14
x86_64                randconfig-013-20260312    gcc-14
x86_64                randconfig-014-20260312    gcc-14
x86_64                randconfig-015-20260312    clang-20
x86_64                randconfig-016-20260312    clang-20
x86_64                randconfig-071-20260312    gcc-14
x86_64                randconfig-072-20260312    clang-20
x86_64                randconfig-073-20260312    clang-20
x86_64                randconfig-074-20260312    clang-20
x86_64                randconfig-075-20260312    clang-20
x86_64                randconfig-076-20260312    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260311    gcc-8.5.0
xtensa                randconfig-002-20260311    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

