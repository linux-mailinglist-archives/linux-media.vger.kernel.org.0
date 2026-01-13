Return-Path: <linux-media+bounces-50571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B880D19B58
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16604301C3EB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2532D73A6;
	Tue, 13 Jan 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhKt7cIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F12877D6
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316299; cv=none; b=WBkZuKLWFbBanJuQVKgvNdsBQyYZ4tTwV920j8DxxB5wTy7W0ENlcY9EzJ9e0t60WBY1Bf8rVq0P5rRS1zBl6RP6tHlfStbRi5hxxVnOCwPQyKxekzuh+DcOYBAoV24Kge/bZEJgvmb3aP6j3/slwLyLh1e78QSKgbkWoQLTpFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316299; c=relaxed/simple;
	bh=a+z+2GNZHemjtgyLESDjN0cx+/LKpX0WPxeA5J1V6ic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IDVSFLDnor+UaujREo8sYq2kEpOhqYFeBpk5UBz66MGVRB9SShqyICDJr/jWiCAXfZlDD7szose1lHT+UZz37ZuTWfeyl/cGdRqUmKP3z0J32o5R/ehV+Q9NH/azn8etzlICevvwe8gqClLczvHcfdjQKQGpRaQqQXIEWHPwVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhKt7cIO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768316299; x=1799852299;
  h=date:from:to:cc:subject:message-id;
  bh=a+z+2GNZHemjtgyLESDjN0cx+/LKpX0WPxeA5J1V6ic=;
  b=VhKt7cIO8DlcOuDG7XQUV1DeFaRFQeInldSP/0tgJOpzNLLUIHUBeXYk
   f40UI9n6iQieb1x7fbjHFWHSHUSGgHJ1Dy+9W2TUKoxmGE86aNdcV+QnC
   LWHe8d0BW7DSewZNqEfTnc5mRFm1WGVEDTLrBnlBdzSKB0J5v+ZF2Y0e5
   F+ue2R8BSn+cozUarfSFqCTX9RCzHiUCiqRJfPyyDu4N9cF73GK/mTSEt
   NkYfvijypBU2EEb/C6nE1kGZYfIy78ITvSvxjxaPsr9LLsc3QcsokW4i+
   G34qhKhDI1jiFXd5ZEqAQ8iQUHav6WjAVSMyIQUO6J63aRyHea8pG96kj
   w==;
X-CSE-ConnectionGUID: mhLERzehThKnPzws3JOQDQ==
X-CSE-MsgGUID: 6ONPVCMgRH2bvVrBvMUF0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69334069"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69334069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:58:18 -0800
X-CSE-ConnectionGUID: 9yuyo1pfQ6qMOWiknVt+oQ==
X-CSE-MsgGUID: u+Cgi5IpQ4aiwiVXDAiT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235658205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 06:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffqY-00000000Exg-45Mq;
	Tue, 13 Jan 2026 14:58:14 +0000
Date: Tue, 13 Jan 2026 22:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6-clean] BUILD SUCCESS
 c73766463a8f722dbcbd4f3aa80e39a0f7898260
Message-ID: <202601132255.Y65647Ua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6-clean
branch HEAD: c73766463a8f722dbcbd4f3aa80e39a0f7898260  media: ipu6: Always call video_device_pipeline_alloc_start()

elapsed time: 8100m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-22
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-22
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-22
um           allmodconfig    clang-19
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

