Return-Path: <linux-media+bounces-45983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF19C1F03F
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7560F34BCBA
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11567338F54;
	Thu, 30 Oct 2025 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQyatjoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70032C94A;
	Thu, 30 Oct 2025 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813490; cv=none; b=jPcINSiY08gjhMc6SQPa77blrmsaoK69EscsXwousXLrPmfb49KY+S54OCkYwqUZIuY875r706kKsVGkAgQLqyCeGj4c7LgQ52YK/M+GFkavtlOcU8I/dNR1PWG58t2nuRib/m2fYTmsAhxcZH1F7Scj0s0w2X8Do0tgSchlgmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813490; c=relaxed/simple;
	bh=N9u7swRPkgARt9qIQfWP9QaQh82T+o1eq4i/2weIu4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P26yULuy/HBTmRlmF3QVNvJ7BB2ewRsC7tcl0mkOYXOYm/CRYJPKxXnc8A5oWg9bWTB3Jf7uwE7FsCCR1zWQhBRJIkDwtGBa72rjO0sYq5MQ+x9TZ9cSWQ80oLxB7vguxXm4bxW7kfaeHIwftfREp+of3HRlKxh7vaRbWWbb1JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQyatjoZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761813489; x=1793349489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9u7swRPkgARt9qIQfWP9QaQh82T+o1eq4i/2weIu4Q=;
  b=EQyatjoZ5AnmgUcH5fLWbdHcjsOIQlaNOVzD6JsqBLIqRlkhFO5uGYBN
   qCBWqNK32WyZkovXS6jBSEzZIxV1JAh5aR/e8Bl1dX+RpQTjETIIn8tyo
   177olhFgqoloCz/BrTtK0h21/PYx3RnAoSLrGo5yBWg1Qy9E2V4gBvk3P
   kAWz8d7g/MfOJKV+SVzkKFfRYYU8++iO6CB7krrC+72dc+N9K5uexU+gu
   PggLt/N/c4pWA38oC1oFkRBcvBNglYPr1FLm/V1ltIyQAeQjcmdc9PgWg
   3pOedx9psfVyklQGV1WvXLtgUgfC4WiEh/QM80X2s3+yVBYnzsiyZbeum
   w==;
X-CSE-ConnectionGUID: ak84xeuyQKCEWkeeATaC4g==
X-CSE-MsgGUID: Qe69qWA/QuCfXlZ6SvZgbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75068630"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="75068630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:38:09 -0700
X-CSE-ConnectionGUID: AumcnTyuQ0a7Vxccs7RSmQ==
X-CSE-MsgGUID: qTTSNiH8RcWbT0nCezOvKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185153943"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Oct 2025 01:38:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEOAW-000Lhs-0l;
	Thu, 30 Oct 2025 08:38:04 +0000
Date: Thu, 30 Oct 2025 16:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, awalls@md.metrocast.net,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] kernel memory safety check in a block
Message-ID: <202510301541.ExxRSMBP-lkp@intel.com>
References: <20251021201704.178535-1-biancaa2210329@ssn.edu.in>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021201704.178535-1-biancaa2210329@ssn.edu.in>

Hi Biancaa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linus/master v6.18-rc3 next-20251029]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biancaa-Ramesh/kernel-memory-safety-check-in-a-block/20251022-041827
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20251021201704.178535-1-biancaa2210329%40ssn.edu.in
patch subject: [PATCH] kernel memory safety check in a block
config: um-randconfig-r073-20251025 (https://download.01.org/0day-ci/archive/20251030/202510301541.ExxRSMBP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301541.ExxRSMBP-lkp@intel.com/

New smatch warnings:
drivers/media/pci/cx18/cx18-queue.c:389 cx18_stream_alloc() warn: inconsistent indenting

Old smatch warnings:
drivers/media/pci/cx18/cx18-queue.c:392 cx18_stream_alloc() warn: inconsistent indenting

vim +389 drivers/media/pci/cx18/cx18-queue.c

   331	
   332	int cx18_stream_alloc(struct cx18_stream *s)
   333	{
   334		struct cx18 *cx = s->cx;
   335		int i;
   336	
   337		if (s->buffers == 0)
   338			return 0;
   339	
   340		CX18_DEBUG_INFO("Allocate %s stream: %d x %d buffers (%d.%02d kB total)\n",
   341			s->name, s->buffers, s->buf_size,
   342			s->buffers * s->buf_size / 1024,
   343			(s->buffers * s->buf_size * 100 / 1024) % 100);
   344	
   345		if (((char __iomem *)&cx->scb->cpu_mdl[cx->free_mdl_idx + s->buffers] -
   346					(char __iomem *)cx->scb) > SCB_RESERVED_SIZE) {
   347			unsigned bufsz = (((char __iomem *)cx->scb) + SCB_RESERVED_SIZE -
   348						((char __iomem *)cx->scb->cpu_mdl));
   349	
   350			CX18_ERR("Too many buffers, cannot fit in SCB area\n");
   351			CX18_ERR("Max buffers = %zu\n",
   352				bufsz / sizeof(struct cx18_mdl_ent));
   353			return -ENOMEM;
   354		}
   355	
   356		s->mdl_base_idx = cx->free_mdl_idx;
   357	
   358		/* allocate stream buffers and MDLs */
   359		for (i = 0; i < s->buffers; i++) {
   360			struct cx18_mdl *mdl;
   361			struct cx18_buffer *buf;
   362	
   363			/* 1 MDL per buffer to handle the worst & also default case */
   364			mdl = kzalloc(sizeof(struct cx18_mdl), GFP_KERNEL|__GFP_NOWARN);
   365			if (mdl == NULL)
   366				break;
   367	
   368			buf = kzalloc(sizeof(struct cx18_buffer),
   369					GFP_KERNEL|__GFP_NOWARN);
   370			if (buf == NULL) {
   371				kfree(mdl);
   372				break;
   373			}
   374	
   375			buf->buf = kmalloc(s->buf_size, GFP_KERNEL|__GFP_NOWARN);
   376			if (buf->buf == NULL) {
   377				kfree(mdl);
   378				kfree(buf);
   379				break;
   380			}
   381	
   382			buf->dma_handle = dma_map_single(&s->cx->pci_dev->dev,
   383							 buf->buf, s->buf_size,
   384							 s->dma);
   385			if (dma_mapping_error(&s->cx->pci_dev->dev, buf->dma_handle)) {
   386				if (buf) {
   387	        		if (buf->buf){
   388	            	kfree(buf->buf);
 > 389					buf->buf =NULL;
   390					}
   391	        		kfree(buf);
   392					buf=NULL;
   393	    		}
   394				kfree(mdl);
   395				//makes accidental double free less possible
   396				break;
   397			}
   398	
   399			INIT_LIST_HEAD(&mdl->list);
   400			INIT_LIST_HEAD(&mdl->buf_list);
   401			mdl->id = s->mdl_base_idx; /* a somewhat safe value */
   402			cx18_enqueue(s, mdl, &s->q_idle);
   403	
   404			INIT_LIST_HEAD(&buf->list);
   405			cx18_buf_sync_for_cpu(s, buf);
   406			list_add_tail(&buf->list, &s->buf_pool);
   407		}
   408		if (i == s->buffers) {
   409			cx->free_mdl_idx += s->buffers;
   410			return 0;
   411		}
   412		CX18_ERR("Couldn't allocate buffers for %s stream\n", s->name);
   413		cx18_stream_free(s);
   414		return -ENOMEM;
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

