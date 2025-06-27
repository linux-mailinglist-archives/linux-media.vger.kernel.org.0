Return-Path: <linux-media+bounces-36074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F18AEB1AB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 221E57B4928
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 08:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E58127EFE2;
	Fri, 27 Jun 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrAEIWU7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14126B2A9
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014359; cv=none; b=XwsjfgL8YW35PcrMlyzFIaoyVdP0HIFUFBt+KQHBuqZxRBk9XeMYA6yK8uYlnlGdYAOb7IAExndMoLu991m8kUOcfWAEZqXT0BW0Jl9OcazjntIKZE4plEWvrwJ8sYFLqxNEbbrT3856r9iuiGnBhA9TzkukwSBJCtqw92Zlv3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014359; c=relaxed/simple;
	bh=37FJ2yC5SgZteMKXtF/XijG36Vlm4EttECt3jV8XUkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGRHEWwDH3GMqg05mJoaMfmUyRY9NtrAStDzfZ6tMXYbC13KV9msg0eTvNA79myzabRqmp1yd1KdI6bTsFeX770DqS5mUVLZWJfsXw4Xek7g25FYDaIZX9Pdzs78RJjO/ReYo8KUZgxN6ulXKbA+jQHbPedAEjYXISggQRqJFHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrAEIWU7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751014358; x=1782550358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37FJ2yC5SgZteMKXtF/XijG36Vlm4EttECt3jV8XUkI=;
  b=SrAEIWU7mmrZwdJt/aiB0Ut/bwNVQbszjOL2S3IoTfwj2YJas4cuAYmN
   3jz7JM5q8n5oS2BJ6mZO5qn0PtypU3hL9pbV63kcp6bS7TpCbO7WTCyI+
   5k+hvHs+g5rdIkzehlK7K7voyWsj3TU0tuGy5QOtWchHAMkd6olmKLiGN
   cD1BuQxe0H0DbT5X9Rej4Dh0LIlVQzFJ9zf6/2lTD4SYyCL8W4Apq9Mmw
   HMWkBRp8zxbv9S8uCLXdACoFr4C75kTCWEDnfUwf1NbASTtiv2vL8rZCw
   sJeJmOVp61hPyDqPuqCg3zmiv8Iz7S1C75DNauOY63aXwpWTH3RYm2ejM
   g==;
X-CSE-ConnectionGUID: l8usihcgQIe/uFXK2WU5CA==
X-CSE-MsgGUID: Em32fYShTgiFZ9gjTr5P/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55946395"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="55946395"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:52:36 -0700
X-CSE-ConnectionGUID: 2xC0O6pPSyC+YNbc7luYXg==
X-CSE-MsgGUID: JPX+O1UPRjeESWYfw1eUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152495772"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jun 2025 01:52:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV4oy-000Vzu-2e;
	Fri, 27 Jun 2025 08:52:32 +0000
Date: Fri, 27 Jun 2025 16:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:ipu7 1/7] versioncheck:
 ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
Message-ID: <202506271629.IqnPPnFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu7
head:   0542d88a01679ac03a980f7d53daefe8caebe345
commit: 4fc6f9e2be4048a8e695d2b7545df344554f5fd6 [1/7] media: staging/ipu7: add Intel IPU7 PCI device driver
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271629.IqnPPnFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271629.IqnPPnFu-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
>> ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 432: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

