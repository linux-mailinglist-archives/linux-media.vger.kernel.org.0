Return-Path: <linux-media+bounces-42144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53632B50B0C
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 04:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B92A1B28184
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 02:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2770723ED5E;
	Wed, 10 Sep 2025 02:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+Djcc85"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD01E6DC5;
	Wed, 10 Sep 2025 02:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757471537; cv=none; b=iXQhG61OrABnjop47Hj3F0ZvrTaCv3NSiIB9sJUqKkFsTFqS9sDwN39Y7lq52UnQ0nNzhgwhay41UjpuljdxOVr4idk7R0E18fvWp9q6Y68vMv/HtJwRXeqOBQyaMUG0Y9ztlhCS9DNmwzOyfYQFGbwEa+Ay/5pPU31pp4yc/I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757471537; c=relaxed/simple;
	bh=o2jSz6x3nt0ThArzrKFlUbMc6BR3iv0iPKjOmfnUSJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7hv34ymluyj9hRoSliN+0Bw1m4ZbXN+f5H1f2rBqUPu2Ga74Ib4BR0HOoB5agSqcxjHvwkmqor5e2bCynCnw5upCSMo9lVB/EB2Tp011a2T4k25nBMS75/Kxb3G5gwLcD3MvVXiZKcls6oyen1siz5CT1GQNoDRsECgmAV9Vew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+Djcc85; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757471536; x=1789007536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2jSz6x3nt0ThArzrKFlUbMc6BR3iv0iPKjOmfnUSJA=;
  b=d+Djcc85SZ2FhDwuFVqli90KYAKHpKJgi5sfaFUBr7hTDuw68vw5zvdR
   M3nWgkkO1c0xVKrYYgr2bBOY5rLzF6k7lJRWpQjot8CA2I499v3P79E4L
   ENFVnkdaCPo4oJ3Ti/hSORPM6q10N/R2KT8rPWeUrL8+dPpomvjjy9jm7
   Xq/CAo19neNp4eNmZLJPGM4cnM+XVY4A0+PstF5KPzSU1I8mS1dys4+V9
   66o8eCqV0tsKY9aw3rK9vt/xVSqXwqUPsR3MnpXphs1l5Ku7Ux+ZkpStS
   dYO+nxJMzuTqbbEU60g3IA6enD0ByxelbReSjyDJOooQGzeztv7E4pJpn
   Q==;
X-CSE-ConnectionGUID: 0+61OI37QQyPilfwKjgZlg==
X-CSE-MsgGUID: DHfD630TSMG0+XKza0Fubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71151366"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="71151366"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 19:32:15 -0700
X-CSE-ConnectionGUID: kfVmf1C2Sq+SR4+ZSl/SRg==
X-CSE-MsgGUID: 9tpIk/8nTJ+X4+6/bmhklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="172849992"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2025 19:32:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwAd1-0005SR-0W;
	Wed, 10 Sep 2025 02:32:11 +0000
Date: Wed, 10 Sep 2025 10:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Hecht <mhecht73@gmail.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu, martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: alvium: Accelerated alvium_set_power
Message-ID: <202509101013.wDfoHTNv-lkp@intel.com>
References: <20250909112252.2577949-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909112252.2577949-1-mhecht73@gmail.com>

Hi Martin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.17-rc5 next-20250909]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Hecht/media-i2c-alvium-Accelerated-alvium_set_power/20250909-193217
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250909112252.2577949-1-mhecht73%40gmail.com
patch subject: [PATCH v2] media: i2c: alvium: Accelerated alvium_set_power
config: alpha-randconfig-r072-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101013.wDfoHTNv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101013.wDfoHTNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101013.wDfoHTNv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/alvium-csi2.c: In function 'alvium_check':
>> drivers/media/i2c/alvium-csi2.c:2367:24: warning: unused variable 'dev' [-Wunused-variable]
    2367 |         struct device *dev = &alvium->i2c_client->dev;
         |                        ^~~


vim +/dev +2367 drivers/media/i2c/alvium-csi2.c

  2364	
  2365	static int alvium_check(struct alvium_dev *alvium, u64 *bcrm_major)
  2366	{
> 2367		struct device *dev = &alvium->i2c_client->dev;
  2368		int ret = 0;
  2369	
  2370		ret = alvium_read(alvium, REG_BCRM_MAJOR_VERSION_R, bcrm_major, NULL);
  2371	
  2372		if (ret)
  2373			return ret;
  2374	
  2375		if (*bcrm_major != 0)
  2376			return 0;
  2377	
  2378		return -ENODEV;
  2379	}
  2380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

