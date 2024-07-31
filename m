Return-Path: <linux-media+bounces-15637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8717942CEC
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 13:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C64B1F21002
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE231AED49;
	Wed, 31 Jul 2024 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNOktRAw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D8F1AE871;
	Wed, 31 Jul 2024 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424117; cv=none; b=HsA4ojV7VLrVYCRaazw2nbZ7V0IIh54NGA4e5MnIFzlCvh9VUX0bJJD10H7uCDkdpKK4HSOcNGA+TOGibsYr4QDbqnIXhY6dTHHU0sf+yyBVwsY+Q+b1BBiq4mIgG0/bzeEWWf9FcRyXV3TRklHu/cx/6aS7xDJ5MrpmvqyTf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424117; c=relaxed/simple;
	bh=Y/jwTbl8exAJcAQjeSQ75R4nQbjTbH7374EjfkBBvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAwwG4iYrdeiJuxSUa5YbGBby5jHcJ0osHuro9QL4SNHaFOW7iZZrskJUp/ikRCg5lhv50UxkcB2P7HevyN0EduZxtRqD5TX6AF15Xk+gMIC0kNzGuEUsQYXVltAeeWfBmbtR+05FtzcBY5Ja/PBbutJoUig2redUQE5H+dXKWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNOktRAw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722424116; x=1753960116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y/jwTbl8exAJcAQjeSQ75R4nQbjTbH7374EjfkBBvVQ=;
  b=XNOktRAwYLOPahv9zwrqX2IAiQTlo3IwMi7jwjrfEw3SVy58UNijWrAY
   DIgVXv7a3iVsZJ9WSUKk40uWuKT64FN36kF7L8gkgJt/OHZEO5q+yPjCI
   rShg91nSQ6q0FNb1M9P+EKwpGaZMO5L2rkq+e/dwc+vBsWGP7sogcEkO4
   dl+6WOmiPL9hNZMsdwjAxZU3/dz+EKFNa4GeXahudIV1XJuU45e2hjN3Y
   TqHboNrmgH5DpFyaQjOMyi/r88cVvJw6zRoHWshJ+IdD0gn3ltAC8W8Gm
   ZxtanTdct+Z/4GYFrmskxyJxv99mlkccAOkpIzqacEvxd8gLJuJqClohO
   g==;
X-CSE-ConnectionGUID: U6JZQyWMRd22jHSs6vLlag==
X-CSE-MsgGUID: +LVGCXdeQKyx24m+vC/8nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23209720"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="23209720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:08:35 -0700
X-CSE-ConnectionGUID: ZtK+kAqRSp6niW97SVmTxA==
X-CSE-MsgGUID: y27S1BV/Tl2KF+5Kv81JYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54707963"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2024 04:08:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ7C2-000uAO-0P;
	Wed, 31 Jul 2024 11:08:30 +0000
Date: Wed, 31 Jul 2024 19:08:05 +0800
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
Subject: Re: [PATCH v2 1/5] dma-buf: heaps: Introduce
 DMA_HEAP_ALLOC_AND_READ_FILE heap flag
Message-ID: <202407311822.ZneNMq5I-lkp@intel.com>
References: <20240730075755.10941-2-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730075755.10941-2-link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 931a3b3bccc96e7708c82b30b2b5fa82dfd04890]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/dma-buf-heaps-Introduce-DMA_HEAP_ALLOC_AND_READ_FILE-heap-flag/20240730-170340
base:   931a3b3bccc96e7708c82b30b2b5fa82dfd04890
patch link:    https://lore.kernel.org/r/20240730075755.10941-2-link%40vivo.com
patch subject: [PATCH v2 1/5] dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240731/202407311822.ZneNMq5I-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311822.ZneNMq5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311822.ZneNMq5I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:104: warning: expecting prototype for Trigger sync file read, read into dma(). Prototype was for dma_heap_read_file_sync() instead


vim +104 drivers/dma-buf/dma-heap.c

    86	
    87	/**
    88	 * Trigger sync file read, read into dma-buf.
    89	 *
    90	 * @dmabuf:			which we done alloced and export.
    91	 * @heap_file:			file info wrapper to read from.
    92	 *
    93	 * Whether to use buffer I/O or direct I/O depends on the mode when the
    94	 * file is opened.
    95	 * Remember, if use direct I/O, file must be page aligned.
    96	 * Since the buffer used for file reading is provided by dma-buf, when
    97	 * using direct I/O, the file content will be directly filled into
    98	 * dma-buf without the need for additional CPU copying.
    99	 *
   100	 * 0 on success, negative if anything wrong.
   101	 */
   102	static int dma_heap_read_file_sync(struct dma_buf *dmabuf,
   103					   struct dma_heap_file *heap_file)
 > 104	{
   105		struct iosys_map map;
   106		ssize_t bytes;
   107		int ret;
   108	
   109		ret = dma_buf_vmap(dmabuf, &map);
   110		if (ret)
   111			return ret;
   112	
   113		/**
   114		 * The kernel_read_file function can handle file reading effectively,
   115		 * and if the return value does not match the file size,
   116		 * then it indicates an error.
   117		 */
   118		bytes = kernel_read_file(heap_file->file, 0, &map.vaddr, dmabuf->size,
   119					 &heap_file->fsize, READING_POLICY);
   120		if (bytes != heap_file->fsize)
   121			ret = -EIO;
   122	
   123		dma_buf_vunmap(dmabuf, &map);
   124	
   125		return ret;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

