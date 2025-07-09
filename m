Return-Path: <linux-media+bounces-37187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D670AFE658
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B8F1752EE
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D622949FF;
	Wed,  9 Jul 2025 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAdzr09c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FDB259CA1;
	Wed,  9 Jul 2025 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057859; cv=none; b=RcKCD5n6FkzeAv+DZ5PxunXylZfQYdZGUWfaqnaSwrNhqkZOB8tn4q3QVE3isVwyXiqFD9njq2041mtbqTxTpbVF3hgs5PwbOspD7w6Q9B51HuevmOJNj8nEYnBlH+WNkYdKQMQyS+Lbupa7AKxHtCK+OJwiifq5no6m2Unj7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057859; c=relaxed/simple;
	bh=gWWP8Sz+p1d9Ri/JPhQGoVyGHxpsoGHo1CzFzlgb/xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQPi8hW3IvdTXbxL/4DG1jtyLrVFJcrN5r5tJXBYZSYVJdGdcSs5X6ANdk+Q8uqsQG+o+SEsS6U3I5bGf93Ab85jU1j94LwPKDKZ2ap3lk5+Lbwsy7zc3mXsSECWU502d1IliVOqP+iQE6MEfY9YF0AEr3Cy07MHO3NImnKPZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAdzr09c; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752057857; x=1783593857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWWP8Sz+p1d9Ri/JPhQGoVyGHxpsoGHo1CzFzlgb/xo=;
  b=aAdzr09coSm5QHIdeqa1g+5PLrcXL+bf9rTbj06uaiYS20GwArLpVCeR
   RHgAPV0o5GojOyZJAH2qFl1mPc+UVktUlz9uNr1yzZ75ONDbNrGnt4+Ec
   r6IjUZryfRYZImp3kq1SNDb1D8mHbQUBBGXUlsEl4mVvtTc8qj1jezFlL
   WCGAZ/43YOXdy3NOvMrg75oF0To1IMzqiHd+BeMYY08uA4FDUuEIZVocV
   QSoM1wSkjxb4GKSMGxYSyztK5d89vOAzkMNC7EPg3Z9GshPYuZ4zrI4Kf
   QAfT6PRlJMxw19l2ZilNm+oMC9DvoMKDsHZV+o8rfW+Iam0CnSPuAVsN0
   Q==;
X-CSE-ConnectionGUID: rSFJFsLJTeaiS4Boy+Sh9Q==
X-CSE-MsgGUID: b9aaLw1eQl6g71NW9vcVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58078543"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="58078543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:44:17 -0700
X-CSE-ConnectionGUID: pci3ZpjWThCsQwR/uusRjA==
X-CSE-MsgGUID: fDL4QUAwTgaxAtTU8JCGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155156633"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jul 2025 03:44:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZSHd-0003Pd-0Q;
	Wed, 09 Jul 2025 10:44:13 +0000
Date: Wed, 9 Jul 2025 18:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [lwn:docs-next 81/89] Warning: drivers/memory/omap-gpmc.c:441 Excess
 function parameter 'cs' description in 'get_gpmc_timing_reg'
Message-ID: <202507091841.r2uxZasT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   f55b3ca3cf1d1652c4b3481b671940461331d69f
commit: e7e540363cc52207c5245ad934180db1a1f96522 [81/89] docs: kdoc: don't reinvent string.strip()
config: i386-buildonly-randconfig-004-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091841.r2uxZasT-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091841.r2uxZasT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091841.r2uxZasT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'cs' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'reg' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'st_bit' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'end_bit' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'max' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'name' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'cd' description in 'get_gpmc_timing_reg'
>> Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'shift' description in 'get_gpmc_timing_reg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

