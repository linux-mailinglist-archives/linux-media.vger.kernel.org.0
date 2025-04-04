Return-Path: <linux-media+bounces-29387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D5A7BBB3
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A78E1793AD
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 11:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBB41DF24E;
	Fri,  4 Apr 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8sWvlmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA0146588;
	Fri,  4 Apr 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766822; cv=none; b=sEGXQA4ZArJBC4YSPAX63fvgTyyX2hmFAjo59C7BWFn7wg6QQlHl6G0Mjyja+7XgrkgZMHFytOIRjTxJ5q5b8QLxOayE0y57xUwQu0+ovHJjPmX8hRfkwr7wDhTQO0FhRsGMG4MPeojvb4SuU0a8ysdVRPYAJ2mrq1MWrld2Wq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766822; c=relaxed/simple;
	bh=9b45S75utZYYfge2O1DXivXuvb2z6jJYNv6lm027wpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv7NOQogsYIZkuhlcOxZW6C/cTa56jm6OlJOOiZF6fpeh1DdMf+xwee348mYS5kO4dnmc1O/eogC832C4rE99NPdXxMoOSEXCELbC4MKHz6iCSkA0ii0Q4ayv0PvRrD34Z/1WgqrtyEhe1kRrFG0pHmh0QV961FeUG3/7Y68nvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8sWvlmo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743766820; x=1775302820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9b45S75utZYYfge2O1DXivXuvb2z6jJYNv6lm027wpM=;
  b=O8sWvlmod9x2mFSW2C1eXFUtIv0+ovKqZQjaI2m8NhcPkJC+zzzrBmYe
   LNipD9bwG6P0j569Z2eZJli0tc7BGRFF7G4fELnyiwTPRBRQc21tZREQf
   g2GETdnBtIP1ks1+Fr85QMUq1Iw4dtVcoIDnJyMeFcFBieFn7rQwLLtu6
   Rf6Umpz8rEuinjeyntuP1VvFaKqXztILDVmvd05mVoiFuK99YFugQZDLY
   o99e2LjKQEkBFWFnSdXnohSE2E+8mYNV9F/mRXvrqd0l3s39YCpspSr20
   04sM1u6tiYXsadIOGWVpuEeXelVs6p0OLED8MZ1Kl8hWfoit86vJ9ADDK
   Q==;
X-CSE-ConnectionGUID: 7OLiZnOcTouz5HzNZOEUNA==
X-CSE-MsgGUID: XKbOjzzdT/iZj1uFCiFyfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56190944"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56190944"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:40:19 -0700
X-CSE-ConnectionGUID: SOL4dQJCTMi8nBpfVI+NLw==
X-CSE-MsgGUID: 9zq669XaQguh4n9RfXZa6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127586898"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Apr 2025 04:40:16 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0fPC-0001Cd-25;
	Fri, 04 Apr 2025 11:40:14 +0000
Date: Fri, 4 Apr 2025 19:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Fend <matthias.fend@emfend.at>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <202504041952.OcJvDWaM-lkp@intel.com>
References: <20250403-hm1246-v1-2-30990d71bc42@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-hm1246-v1-2-30990d71bc42@emfend.at>

Hi Matthias,

kernel test robot noticed the following build errors:

[auto build test ERROR on a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Fend/media-dt-bindings-i2c-add-Himax-HM1246-image-sensor/20250403-165139
base:   a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
patch link:    https://lore.kernel.org/r/20250403-hm1246-v1-2-30990d71bc42%40emfend.at
patch subject: [PATCH 2/2] media: i2c: add Himax HM1246 image sensor driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250404/202504041952.OcJvDWaM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041952.OcJvDWaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041952.OcJvDWaM-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/i2c/hm1246.o: in function `hm1246_calc_pll.constprop.0':
>> hm1246.c:(.text+0x956): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/media/i2c/hm1246.o: in function `hm1246_update_controls.isra.0':
>> hm1246.c:(.text+0xd1e): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

