Return-Path: <linux-media+bounces-18280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1FC978AE6
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A5D6B21411
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686E17BECD;
	Fri, 13 Sep 2024 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYclmCaD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A5156222;
	Fri, 13 Sep 2024 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264478; cv=none; b=A4ey+Ndeo6r0/GnSBnYLNdnm2QCloei9Nu1wNvlLFJjYL/Gy9QtFZzw5VXqqKg0MabiaC3rB0gWuem79ottQ/JZ8dj/tvduG+YgBrG6o1tAiIyuics7SMLzqE4S4mE2872kY/86CNpkLhTB6iiVIg663FSnSSUzOLo71cg9LLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264478; c=relaxed/simple;
	bh=u2Ahxvhg/4cmIB2NS2TyIW6kyvQjVb+fS+f9vi5tKR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibyEZScWVOAH/xUQlfjhEzxpdL9KPK7cj0jQLOrevk+bDdoWi4Xcj8ipVZ+P+Teu2vZ1zB3RRLjUSCBiY3DfqliWZDQCizkCe85lH3PH/8PgeIYn6imIXI3Ss66ydN56yy/G9fHotxKr8hWoKUe5FQDErFTRa1istlKGFtO1EkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYclmCaD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726264477; x=1757800477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u2Ahxvhg/4cmIB2NS2TyIW6kyvQjVb+fS+f9vi5tKR4=;
  b=kYclmCaDkg8wwTAqyezmBmwx20jg6fd6GL6g2+G/S85bXnYwpiZdylg2
   T52JY+XWJemP1DP9XuNXDY/BJWYRrQV2DmsZdcw7ZgZ99nJUURK+LKkXe
   q7k7PuEvBGXzDqHMazJyauDZFptkVRTMoXQM7HQDub3+KPlncuji7e+2Q
   xKTScurlOBmEAkHhjD7sitRWgFyX+eVTsfyrtIq/TRmOW+Po+DxTopCda
   WPATpICxZlrMYtYd9qbl2pXISy7TjorfxDIpjVfzzZNYX2YqGpFZqbGCf
   9lmk4sjndfQyVbKkjIxjIVVXkzpsnwyzHiIWXiFsWWg1dYKhgfxsYp8qB
   g==;
X-CSE-ConnectionGUID: EM47GUURTRGLTPvjCHcIJg==
X-CSE-MsgGUID: Q/99ioRgTo+9dc6lfd7i9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28964299"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="28964299"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 14:54:33 -0700
X-CSE-ConnectionGUID: lco3PineQ0qLLO2xIY9tnw==
X-CSE-MsgGUID: l+nYzBSmT9SL+8H7GUXq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72802512"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 14:54:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spEFF-00074i-29;
	Fri, 13 Sep 2024 21:54:25 +0000
Date: Sat, 14 Sep 2024 05:53:57 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <202409140506.OBoqSiVk-lkp@intel.com>
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

Hi Adri�n,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc7 next-20240913]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-introduce-job-cycle-and-timestamp-accounting/20240913-205038
base:   linus/master
patch link:    https://lore.kernel.org/r/20240913124857.389630-2-adrian.larumbe%40collabora.com
patch subject: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp accounting
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409140506.OBoqSiVk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140506.OBoqSiVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140506.OBoqSiVk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Function parameter or struct member 'profiling' not described in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'last_fence' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'profiling_info' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'slots' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'slot_count' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'profiling_seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'end' description in 'panthor_job'
>> drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'mask' description in 'panthor_job'
>> drivers/gpu/drm/panthor/panthor_sched.c:813: warning: Excess struct member 'slot' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1734: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1734: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:2626: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +494 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  397  
de85488138247d Boris Brezillon 2024-02-29  398  	/** @ringbuf: Command stream ring-buffer. */
de85488138247d Boris Brezillon 2024-02-29  399  	struct panthor_kernel_bo *ringbuf;
de85488138247d Boris Brezillon 2024-02-29  400  
de85488138247d Boris Brezillon 2024-02-29  401  	/** @iface: Firmware interface. */
de85488138247d Boris Brezillon 2024-02-29  402  	struct {
de85488138247d Boris Brezillon 2024-02-29  403  		/** @mem: FW memory allocated for this interface. */
de85488138247d Boris Brezillon 2024-02-29  404  		struct panthor_kernel_bo *mem;
de85488138247d Boris Brezillon 2024-02-29  405  
de85488138247d Boris Brezillon 2024-02-29  406  		/** @input: Input interface. */
de85488138247d Boris Brezillon 2024-02-29  407  		struct panthor_fw_ringbuf_input_iface *input;
de85488138247d Boris Brezillon 2024-02-29  408  
de85488138247d Boris Brezillon 2024-02-29  409  		/** @output: Output interface. */
de85488138247d Boris Brezillon 2024-02-29  410  		const struct panthor_fw_ringbuf_output_iface *output;
de85488138247d Boris Brezillon 2024-02-29  411  
de85488138247d Boris Brezillon 2024-02-29  412  		/** @input_fw_va: FW virtual address of the input interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  413  		u32 input_fw_va;
de85488138247d Boris Brezillon 2024-02-29  414  
de85488138247d Boris Brezillon 2024-02-29  415  		/** @output_fw_va: FW virtual address of the output interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  416  		u32 output_fw_va;
de85488138247d Boris Brezillon 2024-02-29  417  	} iface;
de85488138247d Boris Brezillon 2024-02-29  418  
de85488138247d Boris Brezillon 2024-02-29  419  	/**
de85488138247d Boris Brezillon 2024-02-29  420  	 * @syncwait: Stores information about the synchronization object this
de85488138247d Boris Brezillon 2024-02-29  421  	 * queue is waiting on.
de85488138247d Boris Brezillon 2024-02-29  422  	 */
de85488138247d Boris Brezillon 2024-02-29  423  	struct {
de85488138247d Boris Brezillon 2024-02-29  424  		/** @gpu_va: GPU address of the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  425  		u64 gpu_va;
de85488138247d Boris Brezillon 2024-02-29  426  
de85488138247d Boris Brezillon 2024-02-29  427  		/** @ref: Reference value to compare against. */
de85488138247d Boris Brezillon 2024-02-29  428  		u64 ref;
de85488138247d Boris Brezillon 2024-02-29  429  
de85488138247d Boris Brezillon 2024-02-29  430  		/** @gt: True if this is a greater-than test. */
de85488138247d Boris Brezillon 2024-02-29  431  		bool gt;
de85488138247d Boris Brezillon 2024-02-29  432  
de85488138247d Boris Brezillon 2024-02-29  433  		/** @sync64: True if this is a 64-bit sync object. */
de85488138247d Boris Brezillon 2024-02-29  434  		bool sync64;
de85488138247d Boris Brezillon 2024-02-29  435  
de85488138247d Boris Brezillon 2024-02-29  436  		/** @bo: Buffer object holding the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  437  		struct drm_gem_object *obj;
de85488138247d Boris Brezillon 2024-02-29  438  
de85488138247d Boris Brezillon 2024-02-29  439  		/** @offset: Offset of the synchronization object inside @bo. */
de85488138247d Boris Brezillon 2024-02-29  440  		u64 offset;
de85488138247d Boris Brezillon 2024-02-29  441  
de85488138247d Boris Brezillon 2024-02-29  442  		/**
de85488138247d Boris Brezillon 2024-02-29  443  		 * @kmap: Kernel mapping of the buffer object holding the
de85488138247d Boris Brezillon 2024-02-29  444  		 * synchronization object.
de85488138247d Boris Brezillon 2024-02-29  445  		 */
de85488138247d Boris Brezillon 2024-02-29  446  		void *kmap;
de85488138247d Boris Brezillon 2024-02-29  447  	} syncwait;
de85488138247d Boris Brezillon 2024-02-29  448  
de85488138247d Boris Brezillon 2024-02-29  449  	/** @fence_ctx: Fence context fields. */
de85488138247d Boris Brezillon 2024-02-29  450  	struct {
de85488138247d Boris Brezillon 2024-02-29  451  		/** @lock: Used to protect access to all fences allocated by this context. */
de85488138247d Boris Brezillon 2024-02-29  452  		spinlock_t lock;
de85488138247d Boris Brezillon 2024-02-29  453  
de85488138247d Boris Brezillon 2024-02-29  454  		/**
de85488138247d Boris Brezillon 2024-02-29  455  		 * @id: Fence context ID.
de85488138247d Boris Brezillon 2024-02-29  456  		 *
de85488138247d Boris Brezillon 2024-02-29  457  		 * Allocated with dma_fence_context_alloc().
de85488138247d Boris Brezillon 2024-02-29  458  		 */
de85488138247d Boris Brezillon 2024-02-29  459  		u64 id;
de85488138247d Boris Brezillon 2024-02-29  460  
de85488138247d Boris Brezillon 2024-02-29  461  		/** @seqno: Sequence number of the last initialized fence. */
de85488138247d Boris Brezillon 2024-02-29  462  		atomic64_t seqno;
de85488138247d Boris Brezillon 2024-02-29  463  
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  464  		/**
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  465  		 * @last_fence: Fence of the last submitted job.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  466  		 *
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  467  		 * We return this fence when we get an empty command stream.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  468  		 * This way, we are guaranteed that all earlier jobs have completed
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  469  		 * when drm_sched_job::s_fence::finished without having to feed
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  470  		 * the CS ring buffer with a dummy job that only signals the fence.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  471  		 */
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  472  		struct dma_fence *last_fence;
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  473  
de85488138247d Boris Brezillon 2024-02-29  474  		/**
de85488138247d Boris Brezillon 2024-02-29  475  		 * @in_flight_jobs: List containing all in-flight jobs.
de85488138247d Boris Brezillon 2024-02-29  476  		 *
de85488138247d Boris Brezillon 2024-02-29  477  		 * Used to keep track and signal panthor_job::done_fence when the
de85488138247d Boris Brezillon 2024-02-29  478  		 * synchronization object attached to the queue is signaled.
de85488138247d Boris Brezillon 2024-02-29  479  		 */
de85488138247d Boris Brezillon 2024-02-29  480  		struct list_head in_flight_jobs;
de85488138247d Boris Brezillon 2024-02-29  481  	} fence_ctx;
a706810cebb072 Adri�n Larumbe  2024-09-13  482  
a706810cebb072 Adri�n Larumbe  2024-09-13  483  	/** @profiling_info: Job profiling data slots and access information. */
a706810cebb072 Adri�n Larumbe  2024-09-13  484  	struct {
a706810cebb072 Adri�n Larumbe  2024-09-13  485  		/** @slots: Kernel BO holding the slots. */
a706810cebb072 Adri�n Larumbe  2024-09-13  486  		struct panthor_kernel_bo *slots;
a706810cebb072 Adri�n Larumbe  2024-09-13  487  
a706810cebb072 Adri�n Larumbe  2024-09-13  488  		/** @slot_count: Number of jobs ringbuffer can hold at once. */
a706810cebb072 Adri�n Larumbe  2024-09-13  489  		u32 slot_count;
a706810cebb072 Adri�n Larumbe  2024-09-13  490  
a706810cebb072 Adri�n Larumbe  2024-09-13  491  		/** @profiling_seqno: Index of the next available profiling information slot. */
a706810cebb072 Adri�n Larumbe  2024-09-13  492  		u32 seqno;
a706810cebb072 Adri�n Larumbe  2024-09-13  493  	} profiling;
de85488138247d Boris Brezillon 2024-02-29 @494  };
de85488138247d Boris Brezillon 2024-02-29  495  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

