Return-Path: <linux-media+bounces-32008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08909AAF11F
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 04:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160A21639FE
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 02:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43E01C84C0;
	Thu,  8 May 2025 02:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbkXPUOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1B1C54A2
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 02:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746671042; cv=none; b=ACleT2KNgArYo77hjsHfTDAmBJ3K/4Ozblny5kSN94uMLt50J8vJCRlgvH37VIuW1oT2QnYL7fqNvM9Me5ZBLeeN8v7vBDmRMjMnDyw9pGUqEml6xUt1AAvEjgITh7rytzokAxqUXzBpt9UoYFRBxaG0K4L7A/+Bs0QJbpQDyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746671042; c=relaxed/simple;
	bh=0Wp/N7OOo8E/HlTeiKkdKdfU5laj0xuxguGLDuR1Bh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fX91pi/0puyZbenpkJ2tAPwSP+B0pdvi3IV5XA9BMUaicnTaQT5A8TvluVq3rD1n2Mdip5UKaqMbHLpeZnt4LKdS9L1yibLqjMJ5VVUPuXiYlJvqU6RzPsZB7kGQVrApll1oey6ubYO/R2hiBKCeRyVl8ddeyCBNDFZOOfbd9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbkXPUOM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746671041; x=1778207041;
  h=date:from:to:cc:subject:message-id;
  bh=0Wp/N7OOo8E/HlTeiKkdKdfU5laj0xuxguGLDuR1Bh8=;
  b=EbkXPUOMbOwN7BeqLdgHVlW6Wdsjs/lDnEbmXTF+D3ALb2kvzrS8SK/i
   UDbICIbCFQCzQp9LmPWpbDqL/wQjCrRURf/tM0SMT6gRysvR8MDdpHvUS
   lkks8pGI/QdEuzT51e2uvrf5x/TZ5e66LYsdVpdT3CYEIySQglZrq3N75
   tUmembB2wafJ+YFnyoosqoOLgNwr53Ltzs8jRI0JV0hK2QuWZNhsIdfPx
   V+9Oz+HupgyHzejUn5x2qX6Kmq9BINhYZoIxsqzGnqHFyDV/QqLadOlb3
   sJyYe+uCquOPA6/ABnpEeTa1UtmeZ8M7uwPpgYdefb5XHrSH8HnrpDXkT
   A==;
X-CSE-ConnectionGUID: MxLar2cMSq+FdRvqSmBNdQ==
X-CSE-MsgGUID: 4YMHYmxSRLilYss9mXOC2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48445703"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48445703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 19:24:00 -0700
X-CSE-ConnectionGUID: Q7ckaggORxOCnOJwtlWkpA==
X-CSE-MsgGUID: ervl8rjLR5WYs38vXwUsBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136029074"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 19:23:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCqvU-0009Nt-2J;
	Thu, 08 May 2025 02:23:56 +0000
Date: Thu, 08 May 2025 10:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 48dbb76cef65fabaa3ac97461eda90495e954ecd
Message-ID: <202505081016.0o4vWYPG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 48dbb76cef65fabaa3ac97461eda90495e954ecd  dt-bindings: media: convert imx.txt to yaml format

elapsed time: 2108m

configs tested: 32
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
arc          allnoconfig    gcc-14.2.0
arm          allnoconfig    clang-21
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon      allnoconfig    clang-21
i386        allmodconfig    gcc-12
i386         allnoconfig    gcc-12
i386        allyesconfig    gcc-12
i386           defconfig    clang-20
loongarch   allmodconfig    gcc-14.2.0
loongarch    allnoconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    gcc-14.2.0
parisc       allnoconfig    gcc-14.2.0
powerpc      allnoconfig    gcc-14.2.0
riscv        allnoconfig    gcc-14.2.0
s390         allnoconfig    clang-21
sh           allnoconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
um           allnoconfig    clang-21
x86_64       allnoconfig    clang-20
x86_64      allyesconfig    clang-20
x86_64         defconfig    gcc-11
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

