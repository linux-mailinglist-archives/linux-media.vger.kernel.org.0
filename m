Return-Path: <linux-media+bounces-39913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF0B26525
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CC269E18EC
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 12:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69732FD7A2;
	Thu, 14 Aug 2025 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uye1wauo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093A295D91;
	Thu, 14 Aug 2025 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173644; cv=none; b=maB3cSXRCcyYD9V3937veeXKg7cHUV+R+8UPvxh3tKRb5GaaesVo6qtZa633Ubsj7Dhm0nPv84kIcikDfcWxvg8mY0yioVGqyXqX116RogZSxsJUYv/U5ZllkgEijl83lhBYbrWVGVwUhvXjrluQ9kzMGZH+82wtjQR5Dcxunw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173644; c=relaxed/simple;
	bh=M/IUS4lgTZ6YXgbn1Q91Y9cZrMJeVX6pFsHRNGCQNh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMeImVFT5ufUImq01+mUbhWi09aA+HdhvN2yQ4jem2biVpSXWHz6Z25VNubNJzl96kwDCMbdDC4SkyxTUZNCzH+MFRkyLdtb+eP7864CItXZ42cDRHCPU1czoKuoX7jQmTD7iurX6yODZEIqIOomCH3ZvK6RH3vMqscXWr5ik7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uye1wauo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755173643; x=1786709643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/IUS4lgTZ6YXgbn1Q91Y9cZrMJeVX6pFsHRNGCQNh8=;
  b=Uye1wauoGDSi9KCqtZTWPnephZMuEOr8yUvgbX53EBKKnvUzD2v8tckV
   n8N4lMWT4d3T5yuZ5IOPSp5XpMapQ0WFy5FzS3MbuBB2ojd7u0Uz5+Wf/
   QvZrswSn9FOFCf2uSBc46TyUS7AYOqjp2/9ELQldPkcQe72YOrcDfhsdg
   uXhqtwLwUgdb1eh9OZMzQCurN8b0J5CSXR0vyYRrjwXSgkhKQYHvRJT3a
   dpCjVLHgGamsy1Kbfv3wVXeiIaGFT58kcz0aaGSs+DzZBaB9jwsbCMYOk
   yjVLxL8yeRDsFI3dmv/oNjjnXhSE6LOdGwMCLU+n4jKWLNPdfUQ0HF8Yg
   A==;
X-CSE-ConnectionGUID: 2wd0BeVjQNmx03rP0eHa2Q==
X-CSE-MsgGUID: eE0S7XnNQvuBR+fKzVugYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="82921612"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="82921612"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 05:14:02 -0700
X-CSE-ConnectionGUID: 1YW4nW7dREW+hSuOVIh7hw==
X-CSE-MsgGUID: W+WtmqtKRuSU26VIer0jCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165925245"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2025 05:14:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umWqD-000AwG-1r;
	Thu, 14 Aug 2025 12:13:57 +0000
Date: Thu, 14 Aug 2025 20:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 10/13] docs: move kernel-doc to tools/doc
Message-ID: <202508141909.XegB3Vla-lkp@intel.com>
References: <20250813213218.198582-11-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813213218.198582-11-corbet@lwn.net>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on next-20250814]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Corbet/docs-Move-the-features-tools-to-tools-doc/20250814-053915
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20250813213218.198582-11-corbet%40lwn.net
patch subject: [PATCH 10/13] docs: move kernel-doc to tools/doc
config: i386-randconfig-011-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141909.XegB3Vla-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141909.XegB3Vla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141909.XegB3Vla-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: tools/doc/kernel-doc.py: not found
   make[3]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 127 shuffle=1730989061
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1281: prepare0] Error 2 shuffle=1730989061
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1730989061
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1730989061
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

