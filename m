Return-Path: <linux-media+bounces-14984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0D93052B
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 12:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41F0283965
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 10:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CA3130486;
	Sat, 13 Jul 2024 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF2u+P07"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8D053389;
	Sat, 13 Jul 2024 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720866863; cv=none; b=vD/KvlTdLaG9C2uCG5TcHkR/ZfF9zQQT/MTr88Jc0wzQsTR58FgdIAN5Go4ntuW2v7vtHPTMPlnDNty3sspLE6mDItFWa2qIhzsoAeHAlxapY5b1pxbMCnE9DC+ip45zO57N46yx3iPgHrJg0xzSuCVCDLswvbpzTgB2VECVtkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720866863; c=relaxed/simple;
	bh=ZFb3Vw+/NfiXNX3e2ZwVPTfffIk86eXoQUs0u1dLJKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/AbfZ27W7gT/nUMVzzJ5ALkMJ++zWj1YBAVPA+DS9FRnBnrQBkCtE1Ths0GbUkXW/xm7+ITW2c9w5ChyTaBXUTlaf0vsuF0haEsxp48k3x7BPP8uhucocYwRvnbQWusc5zVOJg3ACsDgjZ+f1zFmoeGpDkq4N5EINEHT9yKiho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF2u+P07; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720866861; x=1752402861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFb3Vw+/NfiXNX3e2ZwVPTfffIk86eXoQUs0u1dLJKs=;
  b=IF2u+P07RZHXhWI+wkXSg6pLnFAYnD4q0vAzuLVvQef1tgJHPOslZw16
   xPjNAXRbuyik2Raf7MsgOS0Z3yGTA62X60HRk/9XeNfN24vvGI83ViGcb
   wIJX8FaG7h/pHzRroNR+wi+Jscr3RF6OPYwuTRFFTPddsnOd3UcetGtJj
   s1eJOtP2tf3j51N61Pt6riurK9uqknB04FQ55viCTwvSg7SCR24M0c7vY
   6JAhq7HE7aHVVOythh79nWSQuoVvwQpvo7cAilPap2V/uv0LK9aJUVnk9
   4u5k5RxR5ZYdkXWhU1OuzRQeWavK/azm5i+2IGVkwAEs0rGllJuj3qyBN
   A==;
X-CSE-ConnectionGUID: bEZ3IoweS2elBA5ITlU0ZQ==
X-CSE-MsgGUID: y4dXDZOcT76cwW8+YhLBEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18178403"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18178403"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 03:34:19 -0700
X-CSE-ConnectionGUID: qIFVPO+9TQemlVttxrk+UA==
X-CSE-MsgGUID: 3bcbnXAwR3u/QiMgonZfZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="49231777"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jul 2024 03:34:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSa4z-000byp-1i;
	Sat, 13 Jul 2024 10:34:13 +0000
Date: Sat, 13 Jul 2024 18:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	opensource.kernel@vivo.com, Huan Yang <link@vivo.com>
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
Message-ID: <202407131825.A44mFGu1-lkp@intel.com>
References: <20240711074221.459589-2-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711074221.459589-2-link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 523b23f0bee3014a7a752c9bb9f5c54f0eddae88]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/dma-buf-heaps-DMA_HEAP_IOCTL_ALLOC_READ_FILE-framework/20240711-155902
base:   523b23f0bee3014a7a752c9bb9f5c54f0eddae88
patch link:    https://lore.kernel.org/r/20240711074221.459589-2-link%40vivo.com
patch subject: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE framework
config: i386-buildonly-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131825.A44mFGu1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131825.A44mFGu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131825.A44mFGu1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-heap.c:293:18: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
     292 |                         pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                                               ~~~
         |                                                                               %zd
     293 |                                pathp, err, start, fsz, fsz);
         |                                       ^~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/dma-buf/dma-heap.c:293:23: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     292 |                         pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                                                     ~~~
         |                                                                                     %zu
     293 |                                pathp, err, start, fsz, fsz);
         |                                            ^~~~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:293:30: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     292 |                         pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                                                          ~~~
         |                                                                                          %zu
     293 |                                pathp, err, start, fsz, fsz);
         |                                                   ^~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:293:35: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     292 |                         pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                                                                     ~~~
         |                                                                                                     %zu
     293 |                                pathp, err, start, fsz, fsz);
         |                                                        ^~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:367:10: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
     366 |                 pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                   ~~~
         |                                                   %zd
     367 |                        err, start, (start + size), heap_file->fsz);
         |                        ^~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:367:15: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
     366 |                 pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                         ~~~
         |                                                         %zd
     367 |                        err, start, (start + size), heap_file->fsz);
         |                             ^~~~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:367:22: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
     366 |                 pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                              ~~~
         |                                                              %zd
     367 |                        err, start, (start + size), heap_file->fsz);
         |                                    ^~~~~~~~~~~~~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:367:38: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     366 |                 pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
         |                                                                         ~~~
         |                                                                         %zu
     367 |                        err, start, (start + size), heap_file->fsz);
         |                                                    ^~~~~~~~~~~~~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)


vim +293 drivers/dma-buf/dma-heap.c

   239	
   240	int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask)
   241	{
   242		struct dma_heap_file_work *heap_fwork = init_file_work(heap_ftask);
   243		struct page *last = NULL;
   244		struct dma_heap_file *heap_file = heap_ftask->heap_file;
   245		size_t start = heap_ftask->roffset;
   246		struct file *file = heap_file->file;
   247		size_t fsz = heap_file->fsz;
   248	
   249		if (unlikely(!heap_fwork))
   250			return -ENOMEM;
   251	
   252		/**
   253		 * If file size is not page aligned, direct io can't process the tail.
   254		 * So, if reach to tail, remain the last page use buffer read.
   255		 */
   256		if (heap_file->direct && start + heap_ftask->rsize > fsz) {
   257			heap_fwork->need_size -= PAGE_SIZE;
   258			last = heap_ftask->parray[heap_ftask->pindex - 1];
   259		}
   260	
   261		spin_lock(&heap_fctl->lock);
   262		list_add_tail(&heap_fwork->list, &heap_fctl->works);
   263		spin_unlock(&heap_fctl->lock);
   264		atomic_inc(&heap_fctl->nr_work);
   265	
   266		wake_up(&heap_fctl->threadwq);
   267	
   268		if (last) {
   269			char *buf, *pathp;
   270			ssize_t err;
   271			void *buffer;
   272	
   273			buf = kmalloc(PATH_MAX, GFP_KERNEL);
   274			if (unlikely(!buf))
   275				return -ENOMEM;
   276	
   277			start = PAGE_ALIGN_DOWN(fsz);
   278	
   279			pathp = file_path(file, buf, PATH_MAX);
   280			if (IS_ERR(pathp)) {
   281				kfree(buf);
   282				return PTR_ERR(pathp);
   283			}
   284	
   285			buffer = kmap_local_page(last); // use page's kaddr.
   286			err = kernel_read_file_from_path(pathp, start, &buffer,
   287							 fsz - start, &fsz,
   288							 READING_POLICY);
   289			kunmap_local(buffer);
   290			kfree(buf);
   291			if (err < 0) {
   292				pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
 > 293				       pathp, err, start, fsz, fsz);
   294	
   295				return err;
   296			}
   297		}
   298	
   299		heap_ftask->roffset += heap_ftask->rsize;
   300		heap_ftask->rsize = 0;
   301		heap_ftask->pindex = 0;
   302		heap_ftask->rbatch = min_t(size_t,
   303					   PAGE_ALIGN(fsz) - heap_ftask->roffset,
   304					   heap_ftask->rbatch);
   305		return 0;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

