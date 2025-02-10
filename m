Return-Path: <linux-media+bounces-25972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85219A2FBE0
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198611885AD7
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE9C1BC9F4;
	Mon, 10 Feb 2025 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6cC+Zv1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079CC24CED6;
	Mon, 10 Feb 2025 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222302; cv=none; b=UppwxxZBEJIvCmaL7dZLbJONudThiFtPltpzGwxaY6esJzrXsSaK5pZqF0ENtnChOpa/OOga338ji1q7JvFX3LRqLp8gGTEGOnDDI60GYJPMpoAgkXD/9U5eWE71Kp6489i6l2Kfg+pcOBSwFh39o1rQbL+VJosm0SYdDupUf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222302; c=relaxed/simple;
	bh=Itk/H9cRgURUCZBx/2HgnA0hYhWGUxXd3mFNtaT01wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3Z9NHK1uksrs6nN7RXtK9xjLgN4VWnuxnp3c/RIHQd8y7Q8GtaqyAbGL5fjbI+y4IPuJSs7o+jN87N/Fz8Ec0Q0yanD0QnfeVtVyeyUGkjH0KeBUFmxcKQ2zyfcr6aL5wHlEloZ21Ht+NFLQoQ5YMAlJjXFM7tTEbrSSVEirgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6cC+Zv1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739222301; x=1770758301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Itk/H9cRgURUCZBx/2HgnA0hYhWGUxXd3mFNtaT01wY=;
  b=E6cC+Zv1PZ0QpCg4F7pfBG+kJ7jeBIuUE4ieH3iV5BjNnDGcP0cm4Dth
   lsB3Oyaid7sDmgYuYpWDWEc2Ll3EakkwTL7v/98thHaHSCEndcP8wVAC1
   28lwMT3NPgXMJ2817NHdFZnf+5EK7Wt07e46jX7f2+vDR9ghT+tCZqR2e
   5kozYKLtjifXdJgYvHYW2WYLCUpZ98IEsLKXmMGFj6zuW6BnMRS5uO4ZC
   ZXCpZwe9FKLeWCDdElPaBbyoM7W1+59r7r10aEQ+eJCkrXilGsEKfkBq8
   nuDVZWbfiZm+kIEyVSmL3YRfRX18MVGB+YjbgWdJ4QFfm34Tg58wYATgg
   A==;
X-CSE-ConnectionGUID: DeYUty0VT96sNtMus+PZgA==
X-CSE-MsgGUID: olztcMucRjGrOl/a28Rbuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51254253"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51254253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 13:18:20 -0800
X-CSE-ConnectionGUID: qojBdk7+RnO/FKtEAmvP4g==
X-CSE-MsgGUID: CyMZCbBRTvWduVPvCUCWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="117331685"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2025 13:18:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thbAU-0013Od-2K;
	Mon, 10 Feb 2025 21:18:14 +0000
Date: Tue, 11 Feb 2025 05:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch via B4 Relay <devnull+git.apitzsch.eu@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Subject: Re: [PATCH v3 2/2] media: i2c: dw9719: Add of_match table
Message-ID: <202502110539.EO1iB2au-lkp@intel.com>
References: <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209-dw9761dts-v3-2-14d3f00f0585@apitzsch.eu>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f6629c004b193d23612641c3607e785819e97ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Apitzsch-via-B4-Relay/dt-bindings-media-i2c-Add-DW9719-and-DW9761-VCM/20250210-055506
base:   8f6629c004b193d23612641c3607e785819e97ab
patch link:    https://lore.kernel.org/r/20250209-dw9761dts-v3-2-14d3f00f0585%40apitzsch.eu
patch subject: [PATCH v3 2/2] media: i2c: dw9719: Add of_match table
config: x86_64-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110539.EO1iB2au-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110539.EO1iB2au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110539.EO1iB2au-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/dw9719.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/dw9719.c:363:34: warning: unused variable 'dw9719_of_table' [-Wunused-const-variable]
     363 | static const struct of_device_id dw9719_of_table[] = {
         |                                  ^~~~~~~~~~~~~~~
   4 warnings generated.


vim +/dw9719_of_table +363 drivers/media/i2c/dw9719.c

   362	
 > 363	static const struct of_device_id dw9719_of_table[] = {
   364		{ .compatible = "dongwoon,dw9719" },
   365		{ .compatible = "dongwoon,dw9761" },
   366		{ }
   367	};
   368	MODULE_DEVICE_TABLE(of, dw9719_of_table);
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

