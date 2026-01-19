Return-Path: <linux-media+bounces-51016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E91D3A199
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0F2330DA4B0
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 08:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0AE33CE9A;
	Mon, 19 Jan 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPL1yxZU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243A33CE8B;
	Mon, 19 Jan 2026 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811063; cv=none; b=i29l9uxg7Vx39M/C/ys1t2X8tK1rKryGJWiiE3Vy4pkKmRZcNg7IoXwYyVzn4FGuvTXGOlr9hh05Icj6hstzbjswily2yfzWaipBsLhv/yv9AWzK8QCstX20w2qHeOuwugoqrr/dXGuRujMAz/PT+5p3lmNwxSNPWB8nwiKAH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811063; c=relaxed/simple;
	bh=ek0shKrzSAAunEX/d72L5w4AAFj3fcjzuZlmAQPI6LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bam0F2e/2HyOOQqnUbCwdE6ZxIgvOMr1XL4snioG2EFyqTsDQT4rc37QstYEgZKVD0z6/s3c/FxxfGGV1MwnNXOAPYBZrdx9cOT5E3R+5TAzgUrHEPammjnEa1TdN9rwDA6TOME3+azP9qMVfsPusO2PL+hcc8d975IuHg20pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPL1yxZU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768811062; x=1800347062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ek0shKrzSAAunEX/d72L5w4AAFj3fcjzuZlmAQPI6LE=;
  b=GPL1yxZUZoGw4p3/H+jGc+IAWRK5ZGitf3zUy0V50srJjWHP0L77LjPw
   vDGQu09ykqNf1/jhCfADRw8uZ3z83bPCvFPGiZnwclqj56fghwoV3sar3
   AempY1GoghHihey/o1lMhk/TOZ010SaqYj+DA+HEXrSLb7w3MXuG/oLjy
   KsjvmgmVTN41KvQjJGao1G4Rf/F1YRXXJBqkfTJAh8aHmm1opiFYIubYZ
   AdL5XDsW5x9MUtxZvydLMbwCY4XmQkEAksde6KLHlQpuQiXMbReU2jE+5
   8o+q5Fr6VNc1fdSwtmhnWwOFupgK3m8ylOu6tjDMMwlvWQNeXFbAXssnu
   g==;
X-CSE-ConnectionGUID: 9v2HDvuNRPy7plgAIRtE5w==
X-CSE-MsgGUID: vAjox1aDSq+clm0wmXXimQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69217468"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69217468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:24:21 -0800
X-CSE-ConnectionGUID: ULlrqDt7QIeAzYWUmmSDwQ==
X-CSE-MsgGUID: TprYcUiKTw+mcgwBRIQ85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="228742758"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 00:24:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhkYa-00000000Nax-00rz;
	Mon, 19 Jan 2026 08:24:16 +0000
Date: Mon, 19 Jan 2026 16:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/2] Move kernel-doc to tools/docs
Message-ID: <202601191546.Bvd74asP-lkp@intel.com>
References: <20260114164146.532916-3-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114164146.532916-3-corbet@lwn.net>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Corbet/docs-kdoc-remove-support-for-an-external-kernel-doc-from-sphinx/20260115-004646
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260114164146.532916-3-corbet%40lwn.net
patch subject: [PATCH 2/2] Move kernel-doc to tools/docs
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260119/202601191546.Bvd74asP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191546.Bvd74asP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191546.Bvd74asP-lkp@intel.com/

All errors (new ones prefixed by >>):

   Traceback (most recent call last):
     File "tools/docs/kernel-doc", line 339, in <module>
       main()
       ~~~~^^
     File "tools/docs/kernel-doc", line 295, in main
       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> ModuleNotFoundError: No module named 'kdoc'
   make[3]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 1
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1313: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

