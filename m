Return-Path: <linux-media+bounces-15646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9C943260
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46AE2878DC
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 14:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF091BC077;
	Wed, 31 Jul 2024 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqBfQaqq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAEF1BBBC7;
	Wed, 31 Jul 2024 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722437088; cv=none; b=ZZLXafc1jgyMONk13cz76gickQbKBhx6NdZItrDv5LjPKUUoJFPnkTOpMQXbsvGF6Df/N7iGWjEn/aDWSRYkDLowTMmlWZsDPdfR7/Fq7sRxo/bJC5TDy2gluo9K8MpZehitp/1Z/z5didttmXHu69u6m5V4S7WN+x8vYJbbD/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722437088; c=relaxed/simple;
	bh=0i7+5bg5UJif9MuAVh7inaS5qO0L8EjfbCHmxXjjGzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvSHSjQMQCYl5cPW1qiIx7mWImNdWpiW5rSF7HNaFAzdEmb0krdfFhFXHyVHRUYwXAn440Xl8dAKpn+Zr/at4VF4P4kkaie8de7kpu0qIbJLUMRfqCwtzH06nIb497UCGSCy4+A/pIVg26QRiLKM+2GwL372cq+8qnB0CX5OBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqBfQaqq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722437088; x=1753973088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0i7+5bg5UJif9MuAVh7inaS5qO0L8EjfbCHmxXjjGzw=;
  b=fqBfQaqq9xWwh8X490eTdZFRl5iCHIQsObQgYhSvfW9ZFZrevdkjyxCN
   ihmdFF9tAzi4dj4othR3zaKiPuRPKJEyyeWtJC6Al24gk2g7NAHdY0hQC
   WtO1hshfsLCzfJUUlGJJLFRoRGxqkBFdndizPNp62xERCfzWPKLvUphXU
   S01ocsXvm6Ln3kwwmv5sDHJyAAt/tKOqJdUab+jbY/CYvyod1FXJwC1nm
   95SkvjvmGa8Aj1jOQp4gTPblH+5bkoxFw0tzTb7DNi92dOFID6fQ0H2la
   ShIrBy88MLHnsoDihF7WdcCGp1FWzicgOdXoMRgEjmxk6nZ3VsCBv+Qt2
   Q==;
X-CSE-ConnectionGUID: TKDYervtTfu2BhcOM/n2mQ==
X-CSE-MsgGUID: 9IISaaXgRE+QWORqT9b29w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24113205"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="24113205"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:44:47 -0700
X-CSE-ConnectionGUID: hHDcSOkuRsy4to6rLrrfkw==
X-CSE-MsgGUID: LgsJcSNcR1GywUDW+A2Zqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="77975585"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2024 07:44:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZAZF-000uTe-07;
	Wed, 31 Jul 2024 14:44:41 +0000
Date: Wed, 31 Jul 2024 22:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: Re: [PATCH v2 3/5] dma-buf: heaps: support alloc async read file
Message-ID: <202407312202.LhLTLEhX-lkp@intel.com>
References: <20240730075755.10941-4-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730075755.10941-4-link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 931a3b3bccc96e7708c82b30b2b5fa82dfd04890]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/dma-buf-heaps-Introduce-DMA_HEAP_ALLOC_AND_READ_FILE-heap-flag/20240730-170340
base:   931a3b3bccc96e7708c82b30b2b5fa82dfd04890
patch link:    https://lore.kernel.org/r/20240730075755.10941-4-link%40vivo.com
patch subject: [PATCH v2 3/5] dma-buf: heaps: support alloc async read file
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240731/202407312202.LhLTLEhX-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312202.LhLTLEhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312202.LhLTLEhX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:158: warning: Function parameter or struct member 'lock' not described in 'dma_heap_file_control'
   drivers/dma-buf/dma-heap.c:482: warning: expecting prototype for Trigger sync file read, read into dma(). Prototype was for dma_heap_read_file_sync() instead


vim +158 drivers/dma-buf/dma-heap.c

   133	
   134	/**
   135	 * struct dma_heap_file_control - global control of dma_heap file read.
   136	 * @works:		@dma_heap_file_work's list head.
   137	 *
   138	 * @threadwq:		wait queue for @work_thread, if commit work, @work_thread
   139	 *			wakeup and read this work's file contains.
   140	 *
   141	 * @workwq:		used for main thread wait for file read end, if allocation
   142	 *			end before file read. @dma_heap_file_task ref effect this.
   143	 *
   144	 * @work_thread:	file read kthread. the dma_heap_file_task work's consumer.
   145	 *
   146	 * @heap_fwork_cachep:	@dma_heap_file_work's cachep, it's alloc/free frequently.
   147	 *
   148	 * @nr_work:		global number of how many work committed.
   149	 */
   150	struct dma_heap_file_control {
   151		struct list_head works;
   152		spinlock_t lock; // only lock for @works.
   153		wait_queue_head_t threadwq;
   154		wait_queue_head_t workwq;
   155		struct task_struct *work_thread;
   156		struct kmem_cache *heap_fwork_cachep;
   157		atomic_t nr_work;
 > 158	};
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

