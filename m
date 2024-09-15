Return-Path: <linux-media+bounces-18298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72495979779
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 17:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAEC2820B7
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 15:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF5B1C8FD3;
	Sun, 15 Sep 2024 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ah82fA33"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C418B04;
	Sun, 15 Sep 2024 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726413775; cv=none; b=L8s/2lvCW/T1R3IgzAs4PH0xWTUfmzZ8AQnVgB2aeo2A3l2aEUvpT9Vyq2RGVLxwsb4sMIYFE2aHB24IAAxK0ojBCnwE0n5PFGvO0vrKtqFls7nfoQojSZ8vzTYchwZCh5OscEX6LUW+0Qy7BSQC+ZudVyU5wGIPB3fS3DG507c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726413775; c=relaxed/simple;
	bh=NVlaJRwu5MkrPgwa92PGxeVbjk47p31EDUshxyzMVr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TauMpq8sAxX1yKen2WVV+qhqnastkw7VrVlHCo3p1hXMFsLxOa+dhuIzilQ337Gzeyi/e+1gwI9wYTDJHk3y2UxtCbndRzjKQZhuvtntTx7TUUAhRE1BpbAkli2cnl8mJHQeqmtsG4N24/ticsaFUPn7zpWe2ptLRx/1AH096c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ah82fA33; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726413774; x=1757949774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NVlaJRwu5MkrPgwa92PGxeVbjk47p31EDUshxyzMVr4=;
  b=ah82fA33+nvsGEZbYnwgz8g7xmSC0btPK+Ou03xOZ9Pk+kpcqLaxDh7p
   tsBMvfmZlUNAeCH5LgkyXQE8+CfBjHCIV8F8rbY0imgTjALbVyjskykrb
   C/VhZxdsByuVwFdv7IguTiA9/toISber0pFBMLcURnKA1wMVKG6WYlu43
   n3H8fQ5CR4apZeXzEBZf2LrCT/2OluE78ePJMM1CyGFk3aIVoV+9vZgQS
   DCwAEEl8sO2W2QFKmTvXf7OvcvSh+VJX3sPdaH9Hsuh8MYlGgtBzHCnE/
   TERigT5OkhPJNwZ73e4SAJjPksLjlpP0RJEbbTwODLJfrkmYuJoyocqb2
   A==;
X-CSE-ConnectionGUID: iGGz5LzgTUiluq7Q4o7znw==
X-CSE-MsgGUID: 1aOaE1mPTGeI/X4G7A8Qcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25194606"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25194606"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 08:22:53 -0700
X-CSE-ConnectionGUID: aFJRiIn4TjSfak9xpvgJrw==
X-CSE-MsgGUID: qS48OZcoQZScV1N2DFmNqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="106088082"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2024 08:22:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spr5K-0008m2-0b;
	Sun, 15 Sep 2024 15:22:46 +0000
Date: Sun, 15 Sep 2024 23:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <202409152243.r3t2jdOJ-lkp@intel.com>
References: <20240913124857.389630-2-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913124857.389630-2-adrian.larumbe@collabora.com>

Hi Adrián,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc7 next-20240913]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-introduce-job-cycle-and-timestamp-accounting/20240913-205038
base:   linus/master
patch link:    https://lore.kernel.org/r/20240913124857.389630-2-adrian.larumbe%40collabora.com
patch subject: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp accounting
config: i386-buildonly-randconfig-003-20240915 (https://download.01.org/0day-ci/archive/20240915/202409152243.r3t2jdOJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409152243.r3t2jdOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409152243.r3t2jdOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_sched.c:2885:12: error: call to '__compiletime_assert_371' declared with 'error' attribute: min(ringbuf_size - start, size) signedness error
    2885 |         written = min(ringbuf_size - start, size);
         |                   ^
   include/linux/minmax.h:129:19: note: expanded from macro 'min'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:105:2: note: expanded from macro '__careful_cmp'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:100:2: note: expanded from macro '__careful_cmp_once'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:68:1: note: expanded from here
      68 | __compiletime_assert_371
         | ^
   1 error generated.


vim +2885 drivers/gpu/drm/panthor/panthor_sched.c

  2862	
  2863	#define JOB_INSTR(__prof, __instr) \
  2864		{ \
  2865			.profile_mask = __prof, \
  2866			.instr = __instr, \
  2867		}
  2868	
  2869	static void
  2870	copy_instrs_to_ringbuf(struct panthor_queue *queue,
  2871			       struct panthor_job *job,
  2872			       struct panthor_job_ringbuf_instrs *instrs)
  2873	{
  2874		ssize_t ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
  2875		u32 start = job->ringbuf.start & (ringbuf_size - 1);
  2876		ssize_t size, written;
  2877	
  2878		/*
  2879		 * We need to write a whole slot, including any trailing zeroes
  2880		 * that may come at the end of it. Also, because instrs.buffer has
  2881		 * been zero-initialised, there's no need to pad it with 0's
  2882		 */
  2883		instrs->count = ALIGN(instrs->count, NUM_INSTRS_PER_CACHE_LINE);
  2884		size = instrs->count * sizeof(u64);
> 2885		written = min(ringbuf_size - start, size);
  2886	
  2887		memcpy(queue->ringbuf->kmap + start, instrs->buffer, written);
  2888	
  2889		if (written < size)
  2890			memcpy(queue->ringbuf->kmap,
  2891			       &instrs->buffer[(ringbuf_size - start)/sizeof(u64)],
  2892			       size - written);
  2893	}
  2894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

