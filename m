Return-Path: <linux-media+bounces-49800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C3CEBD79
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DCC6301D67E
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 11:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC7B227E95;
	Wed, 31 Dec 2025 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joAbmSwy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA25EEEB3
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179736; cv=none; b=PH9edljGCAOefw3ff2ldPyg0sejXOy5ZKa9jdSM6OIdZS4Fxj4lwMrn/oUKh6E/Tl0CoMGlgX58TN8eT7KqsmqZjICgBmz1k9c8dfKOcJVJdu1vx7ZdE+iKEu+Qu6coDmZAHZfkyJh496qSdZmC0UoQKmy9JWoxpxhD+XqxQ3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179736; c=relaxed/simple;
	bh=YZVAWAm1BEUvYSJsf6QUzfvwVs7NVbeO9QFGeAfMKPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gu5qNrpzeQ19EY018q3WUkNlYSLxdtz4D4kL+urCaqCuxmF+scxPRuTtD2foZ+xnh8694RRJXgy8muEyYtLSIjKOUYYqMLCNyvQu1dwRgnl1JcOX6agumM2WMVPjmo96raB2nFLKqEO1Bh61TqiXcW84f/hrdD5mava/DEuh+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joAbmSwy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767179735; x=1798715735;
  h=date:from:to:cc:subject:message-id;
  bh=YZVAWAm1BEUvYSJsf6QUzfvwVs7NVbeO9QFGeAfMKPs=;
  b=joAbmSwykg07uC/WP4AlZ0YGsxrJfHHO8TU8idWHDWikeXMgEDAGForo
   PHhlZ6v0+ChdRj+3Nu/x7EaMS5NiE86NMUsl87aXtR5vESZu29/FDcgfN
   0uGhow5wMfriqgRl20OlIUCfKlXgcBAwnA/meQT8f8HnWuPJ+0XfXeWvt
   OGEoGLCGsSolWjtDnuSzu/4I2h2s5ZvHy3g2l3WRyOSs/9//nJv44RgUd
   FsSoZU7JPiX5ojo09y9P0GCW2FHna+oukBsLuENGfh5caL42GHi0P0Hp2
   DRN+P86dCKZfpK/x3TBNB5tixRu34B4z13jMdQm2YqviLRo0vBiTj6Qil
   g==;
X-CSE-ConnectionGUID: ++RBe0BVQQq8TQMQt3BT/Q==
X-CSE-MsgGUID: E1Cd77mCT36M/BC/Ud2MtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68910603"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="68910603"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 03:15:35 -0800
X-CSE-ConnectionGUID: HlR5MYO3T6WsZw45zQC96A==
X-CSE-MsgGUID: clbP+DFFROSX4+x/YqbUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201425372"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Dec 2025 03:15:33 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vauAt-0000000018l-0Aml;
	Wed, 31 Dec 2025 11:15:31 +0000
Date: Wed, 31 Dec 2025 19:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6-clean] BUILD SUCCESS
 170024e84bffe03b155002165685dcf7d8b68609
Message-ID: <202512311940.rYTVoyw3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6-clean
branch HEAD: 170024e84bffe03b155002165685dcf7d8b68609  media: staging/ipu7: fix the loop bound in l2 table alloc

elapsed time: 1308m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.1.0
alpha        allyesconfig    gcc-15.1.0
arc          allmodconfig    gcc-15.1.0
arc           allnoconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm           allnoconfig    clang-22
arm          allyesconfig    gcc-15.1.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.1.0
csky          allnoconfig    gcc-15.1.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.1.0
m68k          allnoconfig    gcc-15.1.0
m68k         allyesconfig    gcc-15.1.0
microblaze    allnoconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
mips         allmodconfig    gcc-15.1.0
mips          allnoconfig    gcc-15.1.0
mips         allyesconfig    gcc-15.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.1.0
openrisc      allnoconfig    gcc-15.1.0
parisc       allmodconfig    gcc-15.1.0
parisc        allnoconfig    gcc-15.1.0
parisc       allyesconfig    gcc-15.1.0
powerpc      allmodconfig    gcc-15.1.0
powerpc       allnoconfig    gcc-15.1.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.1.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-22
s390         allyesconfig    gcc-15.1.0
sh           allmodconfig    gcc-15.1.0
sh            allnoconfig    gcc-15.1.0
sh           allyesconfig    gcc-15.1.0
sparc         allnoconfig    gcc-15.1.0
sparc64      allmodconfig    clang-22
um           allmodconfig    clang-19
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

