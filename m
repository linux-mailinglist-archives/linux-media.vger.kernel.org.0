Return-Path: <linux-media+bounces-11558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A39888C76DB
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E531F21CD8
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37692146581;
	Thu, 16 May 2024 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Krhiy3u7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7825F145FE2;
	Thu, 16 May 2024 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863746; cv=none; b=hBvplUrcsOBc4e8tQnlw/y2EZhyagmb8gZBcEqkKTRyUO1z2PJKkvOpfr9brJYwYIHDCbvd/bC2wMSdz+L5+SWVNSrQ4ojw1KavCj8k+2oAcAZCXiwG7PK7h8PuJEwe4x6boCXHE1WDbVSynr0puMPbkW9fTzhCXycVwsAc8SS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863746; c=relaxed/simple;
	bh=/iRbkuVATe5k/WXAjHoSspHziFV+5t4MrNeTh/j+A4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knIMioh9Hnf91igzm95MShV3+IseVJ+cSaPTx0QqC3XM6VW9VzA2pVgtEiFf1Ux28bkmWhW4PGGkaca7sMPIvPsLDa71IMd4hHRon0MSpa0ZXqsyDFFrCjIGcmEC275KW6vG1LqlcFnGjqMqpVjiPqla9ika9aBk850tbmr6uQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Krhiy3u7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715863744; x=1747399744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/iRbkuVATe5k/WXAjHoSspHziFV+5t4MrNeTh/j+A4I=;
  b=Krhiy3u7NDhRNUF5+TZmznYTQ7/H3cqF+ntZsLe+oFBXmJbawYU3cwFA
   5YWYZ88ZnCHUuNimcxktOK6xC7jXnPLfhpEdv5z4Ilx6VpXIVeU406EnM
   dw5WBp9n1MyocWycR5abJAoIBMcdsduAa3UNFpkeq9LFl8ue4x2TMBqoX
   HYLVE5tACPXCi109/ee5blnVmP8r5OxSLdEHhzqHzHNWYDADYIUe00qJN
   lvQnsqHCRsvRLvWhKI/FT9qeOO45VyrWNIezt65hK4SD2h10+ywak5bew
   PDUOggkvzNW5lAltfnClKuClWTTmyPOhDhLZMQTvpkjRTzGu2mrxzzvzn
   w==;
X-CSE-ConnectionGUID: krAWcV0JQ9ezdGXRhv+pRg==
X-CSE-MsgGUID: 6o3v8RvmT7WBwz5y2rMwqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11835136"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="11835136"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:49:03 -0700
X-CSE-ConnectionGUID: VGW6IyLTSF6Dv0zZz0FjKg==
X-CSE-MsgGUID: h+5SZJRHSE2BXyiG3EgmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36150958"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2024 05:48:59 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7aXY-000EEo-1i;
	Thu, 16 May 2024 12:48:56 +0000
Date: Thu, 16 May 2024 20:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 7/8] dma-buf: heaps: cma: Handle ECC flags
Message-ID: <202405162048.CExrV8yy-lkp@intel.com>
References: <20240515-dma-buf-ecc-heap-v1-7-54cbbd049511@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-7-54cbbd049511@kernel.org>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/dma-buf-heaps-Introduce-a-new-heap-for-reserved-memory/20240515-215850
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240515-dma-buf-ecc-heap-v1-7-54cbbd049511%40kernel.org
patch subject: [PATCH 7/8] dma-buf: heaps: cma: Handle ECC flags
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20240516/202405162048.CExrV8yy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405162048.CExrV8yy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405162048.CExrV8yy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_allocate':
   drivers/dma-buf/heaps/cma_heap.c:293:24: warning: returning 'int' from a function with return type 'struct dma_buf *' makes pointer from integer without a cast [-Wint-conversion]
     293 |                 return -EINVAL;
         |                        ^
   drivers/dma-buf/heaps/cma_heap.c:296:24: warning: returning 'int' from a function with return type 'struct dma_buf *' makes pointer from integer without a cast [-Wint-conversion]
     296 |                 return -EINVAL;
         |                        ^
   drivers/dma-buf/heaps/cma_heap.c: In function '__add_cma_heap':
>> drivers/dma-buf/heaps/cma_heap.c:386:13: error: implicit declaration of function 'of_memory_get_ecc_correction_bits' [-Werror=implicit-function-declaration]
     386 |         if (of_memory_get_ecc_correction_bits() > 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_memory_get_ecc_correction_bits +386 drivers/dma-buf/heaps/cma_heap.c

   275	
   276	static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
   277						 unsigned long len,
   278						 unsigned long fd_flags,
   279						 unsigned long heap_flags)
   280	{
   281		struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
   282		struct cma_heap_buffer *buffer;
   283		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
   284		size_t size = PAGE_ALIGN(len);
   285		pgoff_t pagecount = size >> PAGE_SHIFT;
   286		unsigned long align = get_order(size);
   287		struct page *cma_pages;
   288		struct dma_buf *dmabuf;
   289		int ret = -ENOMEM;
   290		pgoff_t pg;
   291	
   292		if (!cma_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED))
 > 293			return -EINVAL;
   294	
   295		if (cma_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
   296			return -EINVAL;
   297	
   298		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   299		if (!buffer)
   300			return ERR_PTR(-ENOMEM);
   301	
   302		INIT_LIST_HEAD(&buffer->attachments);
   303		mutex_init(&buffer->lock);
   304		buffer->len = size;
   305	
   306		if (align > CONFIG_CMA_ALIGNMENT)
   307			align = CONFIG_CMA_ALIGNMENT;
   308	
   309		cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
   310		if (!cma_pages)
   311			goto free_buffer;
   312	
   313		/* Clear the cma pages */
   314		if (PageHighMem(cma_pages)) {
   315			unsigned long nr_clear_pages = pagecount;
   316			struct page *page = cma_pages;
   317	
   318			while (nr_clear_pages > 0) {
   319				void *vaddr = kmap_atomic(page);
   320	
   321				memset(vaddr, 0, PAGE_SIZE);
   322				kunmap_atomic(vaddr);
   323				/*
   324				 * Avoid wasting time zeroing memory if the process
   325				 * has been killed by by SIGKILL
   326				 */
   327				if (fatal_signal_pending(current))
   328					goto free_cma;
   329				page++;
   330				nr_clear_pages--;
   331			}
   332		} else {
   333			memset(page_address(cma_pages), 0, size);
   334		}
   335	
   336		buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages), GFP_KERNEL);
   337		if (!buffer->pages) {
   338			ret = -ENOMEM;
   339			goto free_cma;
   340		}
   341	
   342		for (pg = 0; pg < pagecount; pg++)
   343			buffer->pages[pg] = &cma_pages[pg];
   344	
   345		buffer->cma_pages = cma_pages;
   346		buffer->heap = cma_heap;
   347		buffer->pagecount = pagecount;
   348	
   349		/* create the dmabuf */
   350		exp_info.exp_name = dma_heap_get_name(heap);
   351		exp_info.ops = &cma_heap_buf_ops;
   352		exp_info.size = buffer->len;
   353		exp_info.flags = fd_flags;
   354		exp_info.priv = buffer;
   355		dmabuf = dma_buf_export(&exp_info);
   356		if (IS_ERR(dmabuf)) {
   357			ret = PTR_ERR(dmabuf);
   358			goto free_pages;
   359		}
   360		return dmabuf;
   361	
   362	free_pages:
   363		kfree(buffer->pages);
   364	free_cma:
   365		cma_release(cma_heap->cma, cma_pages, pagecount);
   366	free_buffer:
   367		kfree(buffer);
   368	
   369		return ERR_PTR(ret);
   370	}
   371	
   372	static const struct dma_heap_ops cma_heap_ops = {
   373		.allocate = cma_heap_allocate,
   374	};
   375	
   376	static int __add_cma_heap(struct cma *cma, void *data)
   377	{
   378		struct cma_heap *cma_heap;
   379		struct dma_heap_export_info exp_info;
   380	
   381		cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
   382		if (!cma_heap)
   383			return -ENOMEM;
   384		cma_heap->cma = cma;
   385	
 > 386		if (of_memory_get_ecc_correction_bits() > 0)
   387			cma_heap->ecc_enabled = true;
   388	
   389		exp_info.name = cma_get_name(cma);
   390		exp_info.ops = &cma_heap_ops;
   391		exp_info.priv = cma_heap;
   392	
   393		cma_heap->heap = dma_heap_add(&exp_info);
   394		if (IS_ERR(cma_heap->heap)) {
   395			int ret = PTR_ERR(cma_heap->heap);
   396	
   397			kfree(cma_heap);
   398			return ret;
   399		}
   400	
   401		return 0;
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

