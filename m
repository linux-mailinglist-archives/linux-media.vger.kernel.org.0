Return-Path: <linux-media+bounces-23394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01C9F0FA4
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 15:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5932836BF
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 14:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313721E231C;
	Fri, 13 Dec 2024 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCJ7DY/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8941E2307
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101480; cv=none; b=HhDK4mbUX/5/M7pJZMSDnTGXIFKGBS7GKvFOSR8jjTYnQHIDSQhbrYGwUSYC3az4vX/eTO2fqCim0VA8B/0Rqv+PAwlJ8GMUU0lhCpQEz2FUuGrrRCfllPfFACe9arK9NG+/FfuQrjfzvPD/qLLgA87U1xXJ0+J16PB5Hlbv0/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101480; c=relaxed/simple;
	bh=JRKXz+x1ipybq/qKRd9kzPv0pvPRblUOiJpN/6y6Ki8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2zAbxtG5K/Fxq0BHQtZ86ihLC0NihIuqbFBkMXyfZQJBbxN/qV04nxFqp/vREn76rdMqWHxEMHJTCOHCmRMygu+goyljMgQMMCPPF5QSd68dgRLGkb7uvYhnz3wyWWWq15VVUpWXPBQoGmtQU+Br0RfdCTypnYJCcj3Y4YUm2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCJ7DY/D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734101479; x=1765637479;
  h=date:from:to:cc:subject:message-id;
  bh=JRKXz+x1ipybq/qKRd9kzPv0pvPRblUOiJpN/6y6Ki8=;
  b=NCJ7DY/DX7nX8NfsomQZ2AjNjj26LtS7NPURhPXFhLUXcW8kA5yhSVtR
   GGtEyeUB4ZBHmD5mB8qvtk2KQO0vqIkgLVmsEZUd00hfLzfzdmR1FYcRi
   t4iYh9tlCyu/xDq6qzhVMlqGrgKueDtXqPiFWkvEXWPdwY4+zGGUAzFRA
   TiE5QMdTbIJ9K8UT7hnW2nTfXzDnZo9wdc2E3lg73dGf1dlxCmB3kQoxA
   wd90NRDsLZE0d/69pRPXfi5azc8j0GUVYlvUmUeTifBXBmqrNmosYlCQc
   iZMtdeF/e/IwozYl8r1SckvhTU9767sZesKNwafjy6X2QNy3lTO/7l1CE
   g==;
X-CSE-ConnectionGUID: 9TldhFDxQ7SL1NAs0zTH9g==
X-CSE-MsgGUID: wJL6+DdKQwCGGNt2VLohjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="22142456"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="22142456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 06:51:17 -0800
X-CSE-ConnectionGUID: pFLvamEeQZOFrUw+N4vJjg==
X-CSE-MsgGUID: nk7u9NqvQlisNPOL4IC/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="96616834"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Dec 2024 06:51:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM70c-000C7l-0F;
	Fri, 13 Dec 2024 14:51:14 +0000
Date: Fri, 13 Dec 2024 22:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 686f27f7ea376ee5001783489c70a6c2e0bfcd6d
Message-ID: <202412132251.hD5fhdt0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 686f27f7ea376ee5001783489c70a6c2e0bfcd6d  media: stm32: dcmipp: add core support for the stm32mp25

elapsed time: 1457m

configs tested: 57
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

