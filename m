Return-Path: <linux-media+bounces-42973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355FDB94805
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 08:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA3313A5802
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 06:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8631A30F54A;
	Tue, 23 Sep 2025 06:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnvPFGR0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDB2E92BC;
	Tue, 23 Sep 2025 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758607584; cv=none; b=LyldTDOD+WDPO6g/exOIbD3VLFxoUWvZxQ+hpD2L24lFOXNeBnUwxz11IRANf5TohdBZ2GAMuwQqWny9GTCeyy70+WXOJ9fSaM8SoB66jZ6unVr4wX+dxPTRb+7YOXzL/W2I0X2OUN0bWiR6nnKicTmmGipE2269TiBqpSjNblQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758607584; c=relaxed/simple;
	bh=/Va+wb9am0t3b0ri4zxojtTDyBaof4jyFNU6bskn7oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0ducSVdM5bU5kb3Qlxsu+KQd72SPtxhXtykFffqjWomMtmjH8j05y2WvMjH3y9oBYpUfR7zHaxggYZp/GSEjJo4GKnoJf+wRCa4RD8jjACy0USvqGAIbtxjrfDht5/E0tHZ36t77OyjZ0CKOe5NN5Q1eoCOBPXtlEuPxKHSXCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnvPFGR0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758607582; x=1790143582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Va+wb9am0t3b0ri4zxojtTDyBaof4jyFNU6bskn7oE=;
  b=SnvPFGR0ZDuZVimOFiRnKdPX6WXcaMbwo5at7Ekd1/zJ5CzhGItN5iM7
   xV8RlEylJDUksYWzwMsBXkHaVOf+wNzXg3PIJcH3C1fh7IswAT6+0xTeF
   5epy//glKnPz7+ho6HXDgbgbFN5IgUkaJMJRtiXz8EPlByRr2/C3OZw9J
   jkp54ycbjKNbXeKLUUcNhyZ5K1glCx2eLvB2vxYDBC9sBN4lup1AXAe1W
   zMsyiaAk8GcMU23MKJ8q702QIt9KPUXolOmh0n3IWpIvD2mFkQ6mVCg8Z
   o0ft6Oty08h2hAM8AzL2Y54ReIz2XOfoc8M+dJ1YlsYg2ohdpc+oIGDd+
   Q==;
X-CSE-ConnectionGUID: FpN8Ck6CROes6MOdVyVleQ==
X-CSE-MsgGUID: g9tNw4p0S3KUJ6PWMYXUFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86314231"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="86314231"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:06:21 -0700
X-CSE-ConnectionGUID: MEsv++RXQiyeG6bl5VvMhA==
X-CSE-MsgGUID: URoYeKUzRqGXjbkV1hNLmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="200376732"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2025 23:06:19 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0wAL-0002nl-0y;
	Tue, 23 Sep 2025 06:06:17 +0000
Date: Tue, 23 Sep 2025 14:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-media@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] md: fix NULL pointer dereference at
 reregister_snapshot()
Message-ID: <202509231318.YYdqPhnu-lkp@intel.com>
References: <20250922144239.11-1-alsp705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922144239.11-1-alsp705@gmail.com>

Hi Alexandr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandr-Sapozhnkiov/md-fix-NULL-pointer-dereference-at-reregister_snapshot/20250922-224522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20250922144239.11-1-alsp705%40gmail.com
patch subject: [PATCH 5.10] md: fix NULL pointer dereference at reregister_snapshot()
config: s390-randconfig-002-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231318.YYdqPhnu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231318.YYdqPhnu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231318.YYdqPhnu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:369:9: note: previous definition is here
     369 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/md/dm-snap.c:597:23: warning: unused variable 'bdev' [-Wunused-variable]
     597 |         struct block_device *bdev = s->origin->bdev;
         |                              ^~~~
   2 warnings generated.


vim +/bdev +597 drivers/md/dm-snap.c

c1f0c183f6acc6 Mike Snitzer         2009-12-10  590  
c1f0c183f6acc6 Mike Snitzer         2009-12-10  591  /*
c1f0c183f6acc6 Mike Snitzer         2009-12-10  592   * Move snapshot to correct place in list according to chunk size.
c1f0c183f6acc6 Mike Snitzer         2009-12-10  593   */
c1f0c183f6acc6 Mike Snitzer         2009-12-10  594  static void reregister_snapshot(struct dm_snapshot *s)
c1f0c183f6acc6 Mike Snitzer         2009-12-10  595  {
8125cedd7aa81d Alexandr Sapozhnikov 2025-09-22  596  	struct origin *o;
c1f0c183f6acc6 Mike Snitzer         2009-12-10 @597  	struct block_device *bdev = s->origin->bdev;
c1f0c183f6acc6 Mike Snitzer         2009-12-10  598  
c1f0c183f6acc6 Mike Snitzer         2009-12-10  599  	down_write(&_origins_lock);
8125cedd7aa81d Alexandr Sapozhnikov 2025-09-22  600  	o = __lookup_origin(s->origin->bdev);
c1f0c183f6acc6 Mike Snitzer         2009-12-10  601  
c1f0c183f6acc6 Mike Snitzer         2009-12-10  602  	list_del(&s->list);
8125cedd7aa81d Alexandr Sapozhnikov 2025-09-22  603  	if (o)
8125cedd7aa81d Alexandr Sapozhnikov 2025-09-22  604  		__insert_snapshot(o, s);
^1da177e4c3f41 Linus Torvalds       2005-04-16  605  
^1da177e4c3f41 Linus Torvalds       2005-04-16  606  	up_write(&_origins_lock);
^1da177e4c3f41 Linus Torvalds       2005-04-16  607  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  608  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

