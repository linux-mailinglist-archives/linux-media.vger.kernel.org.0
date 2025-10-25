Return-Path: <linux-media+bounces-45541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C09C08D35
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 09:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE8261C821B0
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 07:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB49E2DC33D;
	Sat, 25 Oct 2025 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVjKHH28"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA48257846;
	Sat, 25 Oct 2025 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376471; cv=none; b=kyKj9VDtaIKEl/8XqVqbWTCMbW3OvGNXa98sz3YhdeADmIWJYqimm1se03aeXqpIMOzWbEorU+VMPgncWEJsvPVH1bpMeObenUyZV+VKL5++sKk9x+DoRMAGrSLGJvm4TW+mleVdP8jmr49q1ZNKpvpFHx99cJqzfAKQt6pHnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376471; c=relaxed/simple;
	bh=X6YoMpQgSgZAZKvggDwcha+QMleffEi+3c3WT17AgYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EumFGZCXDSyNDBE01O59DTj/qCoiZV1BlNmkuxUb1X8trzUcXd/VlHI2hoixrw8hfHk6muw+44mypiGMwv+536B6LZU9aH5HDP9ADYtusX41IY5Yy+lx5LMvDWWG5zpdZU+6dexpMSRq8EFI2NneiLRDf/PR9gX+3abgpsJektY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVjKHH28; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761376470; x=1792912470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X6YoMpQgSgZAZKvggDwcha+QMleffEi+3c3WT17AgYg=;
  b=ZVjKHH28nry60Ly3SEP/MY/pmfsOWNov4i11UlD4wMhD0Su2D4jz+CUE
   Lq0/c1tGUHVxpcWNTpBGshWUzLsYu2w3lbdVgNyhhqiEgI9zz6tJTIobj
   aur7Ak8WliHj7nuagSInHj6Cf7MGWhlbWXlPmuRFvuioHBiLnhhNzfEac
   yj84Y1dAZA2n0M1qcApadMuuyZPW/d5BAfwXmN8LcSPKCpwkqi/VDoTXY
   wFHL4UBkr3aM7Tav2ZrBbXEhi+o6xZhPyvCor4rFMDpzPTvhkUZH/8jjG
   U3DExfByWPRMsQFMmcNIvIDWlgAKd7Pt8Y4PWRkgZaSOEXi+E6b2+mGFy
   Q==;
X-CSE-ConnectionGUID: aVJGek2IQsCjmfFvTRtapg==
X-CSE-MsgGUID: q7MMfyqdRICdq6WaidH72Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63451252"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63451252"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 00:14:29 -0700
X-CSE-ConnectionGUID: Au+FxXoGS0mCzXf++6NWnA==
X-CSE-MsgGUID: lXvVQI1AQvmV+X31d+pIWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184968492"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 00:14:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCYTp-000FAV-09;
	Sat, 25 Oct 2025 07:14:25 +0000
Date: Sat, 25 Oct 2025 15:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 6/8] docs: move kernel-doc to tools/docs
Message-ID: <202510251428.mk24iI0r-lkp@intel.com>
References: <20251024200834.20644-7-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024200834.20644-7-corbet@lwn.net>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on next-20251024]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Corbet/docs-Move-the-features-tools-to-tools-docs/20251025-041303
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20251024200834.20644-7-corbet%40lwn.net
patch subject: [PATCH v3 6/8] docs: move kernel-doc to tools/docs
config: parisc-randconfig-r071-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251428.mk24iI0r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251428.mk24iI0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251428.mk24iI0r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: tools/docs/kernel-doc.py: not found
   make[3]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 127
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

