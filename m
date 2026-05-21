Return-Path: <linux-media+bounces-62448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eqp/C5PUDmpHCgYAu9opvQ
	(envelope-from <linux-media+bounces-62448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:46:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB75A29E1
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF2CA302E1EC
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA30372EE2;
	Thu, 21 May 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqmRKPn7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25537C102;
	Thu, 21 May 2026 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356760; cv=none; b=sAj4bQjF7exOoG6yLUHtsL/VVVNqDNCPbXCxb7zOIYkJFZ8VbNzE8kEufAbN1Oj7H7aUQ+WmqnHQTPSl949XLYGmwXU12dQbR6X6VOZ8ZsA8OrJ4CkgEqh7ya2GGW3by/134c2bvrXQfbPu8UrOjv/BMab6b2RBVb0KFseesmoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356760; c=relaxed/simple;
	bh=TCZTrJrBdgiRh4gqQvmMTY8x6g99ouQ5GXQCNVm/HPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXNzdEgRIr8D0Nfg9a8wGdpl6JwHSVWBfd1Ub8Zw47lE02FFGzxRQe+SdYeEsvrSP/6OcQmRWto5qtzwnDX1fO6iYu/WjfWLkf7wcfWmJjvPONFmhJuYBl/Tdio+H7XRD+EiMftMgG3ZYouE3miZAs6UkOIQDDtmeud4pK8Edcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqmRKPn7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779356759; x=1810892759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCZTrJrBdgiRh4gqQvmMTY8x6g99ouQ5GXQCNVm/HPI=;
  b=QqmRKPn7Q8Yp2mOfX5TRWpXc6bhiGJbpS3ZJ8ZGQDE0HDJGQNwvI2xCG
   KIde2su7VGYbHR3PLpW9UAaOQxJcaDu2lzjByLO9/5fUECGh9lcxdmfyQ
   a3WqkIoGSocJOnOYTVLXCYnggHlroV5fBtfQKmpcK9IeC0vINV5qiGCIO
   iIyyqmjCjiEImdGqZISHOQMcgdTx4ZuRcCLvonIaIL3z2JIj4qG/xsiKT
   b9X0UTtw9yRllv4GBvP1ehcE67f0yM091IhKtffaSVdekOUBAUyaauZrE
   5wU+Lv8iGE8Dx1DLXae+jhc0Cvx2tvcRw3pJ3xlEXSguvBhVCiQH1j3+4
   A==;
X-CSE-ConnectionGUID: npIy0kkkRtuDJegUiGApiQ==
X-CSE-MsgGUID: gxvfay6LSWOh+I7TSp7cQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80450408"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80450408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:45:59 -0700
X-CSE-ConnectionGUID: +rUo7ROgQlyofsz/e5I0oA==
X-CSE-MsgGUID: /nQHP1Q7QSCozMJLtKgr9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="240347284"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 May 2026 02:45:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzyT-00000000Aq7-0tKX;
	Thu, 21 May 2026 09:45:53 +0000
Date: Thu, 21 May 2026 11:45:42 +0200
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amdgpu: fix recursive ww_mutex acquire in
 amdgpu_devcoredump_format
Message-ID: <202605211112.xlUYDZeM-lkp@intel.com>
References: <20260520151741.50575-3-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520151741.50575-3-mikhail.v.gavrilov@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	TAGGED_FROM(0.00)[bounces-62448-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E7FB75A29E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mikhail,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip next-20260520]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikhail-Gavrilov/drm-amdgpu-convert-amdgpu_vm_lock_by_pasid-to-drm_exec/20260520-231931
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260520151741.50575-3-mikhail.v.gavrilov%40gmail.com
patch subject: [PATCH v3 2/2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260521/202605211112.xlUYDZeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211112.xlUYDZeM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   AMD plane color pipeline
   ------------------------ [docutils]
>> Documentation/gpu/amdgpu/driver-core:225: ./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2958: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/gpu/driver-uapi:31: ./include/uapi/drm/xe_drm.h:2538: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

