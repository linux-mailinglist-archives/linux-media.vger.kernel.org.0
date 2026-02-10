Return-Path: <linux-media+bounces-52512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPPSIYwei2n7QAAAu9opvQ
	(envelope-from <linux-media+bounces-52512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:03:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E347211A866
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ACEC302DF61
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7273032860B;
	Tue, 10 Feb 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3iQOMrL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196BB32470F
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770724969; cv=none; b=PfNrYGcVBXWR4cXg9SaeXgUmLpp+LF3vhc0Up9vrjnrz1B1bej4VIdZ+tLb4ePAMdLJ5iLgzBHsyFoSr9GpES3YSJJQYQp7TF15nA12Ba6RC2X/9Zemui+SIVYk0P+cKVDCK6b6bZ1U5h+d4Xc7fTU3AU405Q+3lWR32EsMEbYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770724969; c=relaxed/simple;
	bh=kAPSTtOVfJfIS9jV+CgJZlMJ295jsAmJD3EnF4QdBNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYeTqtMX5PL2p4v79K3DPVCaBqqlXgRluYsfk299Y/gcrAZo53qRapOqDZMKpj8cASKjfrLX3VxajfFBqlluVXyfaA2CQRRnLJ5VXsGAMKw87P+sfEG9hTyq9mNNjDtgNZtW+LrAwSAPymX0SubUFq26Sc+DDxTrfhkpbqlxcog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3iQOMrL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770724968; x=1802260968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kAPSTtOVfJfIS9jV+CgJZlMJ295jsAmJD3EnF4QdBNw=;
  b=V3iQOMrLYI6PkDk+WaE4GsLHxw/oHdsQ6fXkUHsKpuHeP9Z0GEWUWPbc
   /5Xn1s1LiSdwggCOKYv+Bfyxy4T8XCfLN5jmJFgTPKp+KiTIi1fv6xg92
   7Vm7y9UefK6KCuJHpBmVdikjQyYdTnFbUYYiKvONn+GewPmgYXvZcJ7vn
   IDQVKAiXh/gAg8uicfvdGrn8TIilac4z076YyoYDTCsLaK+Kyr8ipASYp
   Lo+7ufvvLQkFcYXxUMvn3+T8ZLJVdhbX56h1MuV+3Y4D0sc/F+d1/nP5O
   mPNFy2ES1VR1BFZv5BVzz/YVB7vafIjVT6N/lJ4DQiXhWA+p1Nywu0YGI
   Q==;
X-CSE-ConnectionGUID: qWmmoU8ITou/SEP4hxSMfw==
X-CSE-MsgGUID: GzpgnhFmTaSQliBQh6qLaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71893910"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71893910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 04:02:48 -0800
X-CSE-ConnectionGUID: FHhtlCbwTlSbN4KSJ4eG9Q==
X-CSE-MsgGUID: ouaiq7hVRwuooZ1RvfqwTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211003400"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2026 04:02:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpmRw-00000000oyu-1ZR6;
	Tue, 10 Feb 2026 12:02:36 +0000
Date: Tue, 10 Feb 2026 20:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH 5/5] dma-buf: heaps: system: add an option to allocate
 explicitly decrypted memory
Message-ID: <202602101926.lsquJdb1-lkp@intel.com>
References: <20260209153809.250835-6-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209153809.250835-6-jiri@resnulli.us>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52512-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: E347211A866
X-Rspamd-Action: no action

Hi Jiri,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip trace/for-next linus/master v6.19]
[cannot apply to next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Pirko/dma-mapping-avoid-random-addr-value-print-out-on-error-path/20260209-234013
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260209153809.250835-6-jiri%40resnulli.us
patch subject: [PATCH 5/5] dma-buf: heaps: system: add an option to allocate explicitly decrypted memory
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602101926.lsquJdb1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101926.lsquJdb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101926.lsquJdb1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/system_heap.c:66:8: error: call to undeclared function 'set_memory_decrypted'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 |         ret = set_memory_decrypted(addr, nr_pages);
         |               ^
>> drivers/dma-buf/heaps/system_heap.c:80:8: error: call to undeclared function 'set_memory_encrypted'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         ret = set_memory_encrypted(addr, nr_pages);
         |               ^
   2 errors generated.


vim +/set_memory_decrypted +66 drivers/dma-buf/heaps/system_heap.c

    59	
    60	static int system_heap_set_page_decrypted(struct page *page)
    61	{
    62		unsigned long addr = (unsigned long)page_address(page);
    63		unsigned int nr_pages = 1 << compound_order(page);
    64		int ret;
    65	
  > 66		ret = set_memory_decrypted(addr, nr_pages);
    67		if (ret)
    68			pr_warn_ratelimited("dma-buf system heap: failed to decrypt page at %p\n",
    69					    page_address(page));
    70	
    71		return ret;
    72	}
    73	
    74	static int system_heap_set_page_encrypted(struct page *page)
    75	{
    76		unsigned long addr = (unsigned long)page_address(page);
    77		unsigned int nr_pages = 1 << compound_order(page);
    78		int ret;
    79	
  > 80		ret = set_memory_encrypted(addr, nr_pages);
    81		if (ret)
    82			pr_warn_ratelimited("dma-buf system heap: failed to re-encrypt page at %p, leaking memory\n",
    83					    page_address(page));
    84	
    85		return ret;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

