Return-Path: <linux-media+bounces-53831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFoABCC2omma5AQAu9opvQ
	(envelope-from <linux-media+bounces-53831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:32:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8CD1C1C13
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03F6D30490E4
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5CC3A0EB3;
	Sat, 28 Feb 2026 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn8OEm8F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC05B36D4EC;
	Sat, 28 Feb 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772271123; cv=none; b=CRMTHICiKsbBmXh9Rh37qxheAYrXwrSI6DfbYCkFIC60u7hQ3Czwr+jnoVr92ORlIsL+PgPwAuku6RCOV5ZS+HIxDBNJi/LNencYqkUjWYfr3ZQj6IYyefsWk3ao5GpH9HdGHZdZ6iPPCWqWL+fTlWYhqMr2l3I+UzalNQs8VZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772271123; c=relaxed/simple;
	bh=Rrx8y/C17jrzfE6kvyZzwZwuPU1bRbyLhVZrjF/dgcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAxsLkU75v3tk0n+mcH+K8v64XKN6l3ubAIeSnF37Rdl5h9QJrp8xlVsjerq0pRqP3pRyHHVUb/cMJ7fCC4D9NHNFQoho3dGZc1vwa2uVxn/VZwHW0t3AzeihGeOMqOKZvJZhomEPic1zPH0mWfWzNy/eqHaJR20unvdKBpqCRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn8OEm8F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772271122; x=1803807122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rrx8y/C17jrzfE6kvyZzwZwuPU1bRbyLhVZrjF/dgcs=;
  b=Pn8OEm8FZ+ZYdXCvTbA95qzxmrp6F7CiVEktOyzhmn13OCW4MjtbHKk9
   9Rd8vhhaQPcaYiXjMIzTIayKlIcEgU2lwPJNPIYGLPJUf3bYd5QDHo/80
   hZTK21QFYc06xp7nvoOf79O8MLKpj2prfduLMcR56SZkf+wUU0fNt4/VG
   K1XsbRCiCr3neIoddkmLugHNWj1SWi0xaMY8VSlVcopaMfjINuhaDKavB
   +Z6C/0PaJEBvKVgVawr/To4ZuJ4OtaYY+YkQ26Dh1QcMucW1VNjdaBenX
   e8oTL+TQKukBwfrFsSHeqqBaHQyafD7LvExiUFMSUfkhqzWORIVdciamV
   Q==;
X-CSE-ConnectionGUID: Tl4KBT69ThmKmLas4X9caA==
X-CSE-MsgGUID: f8CnqC6eQNOVeFC2/aZ+vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84053338"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84053338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 01:32:01 -0800
X-CSE-ConnectionGUID: pykYmDP9SDaeLcRLYXMDlw==
X-CSE-MsgGUID: M64QioP1Qv+fcwnEXOpsQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="222113504"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Feb 2026 01:31:55 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwGfw-00000000BQt-0KRK;
	Sat, 28 Feb 2026 09:31:52 +0000
Date: Sat, 28 Feb 2026 17:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 8/9] dma-buf: heaps: cma: Turn the heap into a module
Message-ID: <202602281751.KRAYsRVG-lkp@intel.com>
References: <20260227-dma-buf-heaps-as-modules-v2-8-454aee7e06cc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-dma-buf-heaps-as-modules-v2-8-454aee7e06cc@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53831-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5B8CD1C1C13
X-Rspamd-Action: no action

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 499a718536dc0e1c1d1b6211847207d58acd9916]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/dma-contiguous-Turn-heap-registration-logic-around/20260227-212606
base:   499a718536dc0e1c1d1b6211847207d58acd9916
patch link:    https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-8-454aee7e06cc%40kernel.org
patch subject: [PATCH v2 8/9] dma-buf: heaps: cma: Turn the heap into a module
config: x86_64-randconfig-002-20260227 (https://download.01.org/0day-ci/archive/20260228/202602281751.KRAYsRVG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281751.KRAYsRVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281751.KRAYsRVG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dma_contiguous_get_reserved_region" [drivers/dma-buf/heaps/cma_heap.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

