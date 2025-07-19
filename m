Return-Path: <linux-media+bounces-38108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0056B0AE07
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 06:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0894E2FCB
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 04:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033B42192F9;
	Sat, 19 Jul 2025 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgeRh5wB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6BD2F84F;
	Sat, 19 Jul 2025 04:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752900216; cv=none; b=l8UqPLm0GfQnN7F0s6HVO4mcwAOfl+BqWF02NmECLXt+yarca/WESQmEW/CdFMgRVT6T4iyEuwlXWcc9c2ddFqUlRMNzUBTFatkw8iDBgPWD40fx/IFoMr9ZWFOmBAuKk1XOyjNr2745iGDWD3dIDa0UZwAmaARkjbW1d1ZICy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752900216; c=relaxed/simple;
	bh=pZRItqq+Wjlm8BqTbqJ0ZqG35AOUDPJKTmLRilraD1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bX9jR3NYfFeJUtpuuJb3e8fcOYB5VbBGeUWQfkAr79zylOwM72Ejwws9cSA8t8HfMWJMho6FxOJyuacu73sEjwvQMi1EQnWmSAqYulkcBlxauRrIs5AarSGtY78Wjj8tP66opdCPw3rL8MLXmeYLnKSYdjEFgc4+gNzRy8dvhYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgeRh5wB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752900215; x=1784436215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZRItqq+Wjlm8BqTbqJ0ZqG35AOUDPJKTmLRilraD1o=;
  b=cgeRh5wBLe1Gs4h2mWQaXyjmt2BlfJps6mvRSqm2gOvTD+POpEZCRecJ
   uGcqJlNbhKhUlaDpnQ2CDFPKBkiTFkMbv6gl64W+Xtvcnh/rKXBM6FCR9
   hRvOFKFWmpBFG+XHP4Hk8WuRbnR84xoI4GvbVzMOwgkdk3JAHGA5bUC1N
   kxZYVQqfcBr7NejTe1J/GWUmMw83RGdmiYHjLc1aNS7dAApqzZzanr6s8
   C7n18EwqhZjxxxFNcvqHgFsfesgi27OeNsg6vWDRwbxj+rLOsd23qBfxM
   rOf2liRL/JAijQY72s6ZLAIdfFjwbvJc9uNx4+h3H4xo0fAi06jvQAxSz
   g==;
X-CSE-ConnectionGUID: PLK65qv1SXyCQDIY3Ah8Gg==
X-CSE-MsgGUID: ijk2ArzYQhq+rv37rTi56Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="77727774"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="77727774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 21:43:34 -0700
X-CSE-ConnectionGUID: fbjtRcsQR1ui8yx7XIGa8w==
X-CSE-MsgGUID: 7zYUqr1QSDy+xtLxqLpwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="195464441"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 21:43:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uczQ1-000FFT-2x;
	Sat, 19 Jul 2025 04:43:29 +0000
Date: Sat, 19 Jul 2025 12:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: Darshan Rathod <darshanrathod475@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if
 condition
Message-ID: <202507191200.uSwaI9wh-lkp@intel.com>
References: <20250718125245.82910-1-darshanrathod475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718125245.82910-1-darshanrathod475@gmail.com>

Hi Darshan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on sailus-media-tree/master linus/master media-tree/master sailus-media-tree/streams v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darshan-Rathod/media-b2c2-flexcop-eeprom-Fix-assignment-in-if-condition/20250718-205456
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250718125245.82910-1-darshanrathod475%40gmail.com
patch subject: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if condition
config: i386-randconfig-002-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191200.uSwaI9wh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191200.uSwaI9wh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191200.uSwaI9wh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/common/b2c2/flexcop-eeprom.c: In function 'flexcop_eeprom_check_mac_addr':
   drivers/media/common/b2c2/flexcop-eeprom.c:143:29: warning: operation on 'ret' may be undefined [-Wsequence-point]
     143 |                         ret = ret = -EINVAL;
>> drivers/media/common/b2c2/flexcop-eeprom.c:149:1: error: expected declaration or statement at end of input
     149 | EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);
         | ^~~~~~~~~~~~~
   drivers/media/common/b2c2/flexcop-eeprom.c:150: warning: control reaches end of non-void function [-Wreturn-type]


vim +149 drivers/media/common/b2c2/flexcop-eeprom.c

2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  130  
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  131  /* JJ's comment about extended == 1: it is not presently used anywhere but was
1589a993f07412 drivers/media/dvb/b2c2/flexcop-eeprom.c    Uwe Bugla             2009-03-29  132   * added to the low-level functions for possible support of EUI64 */
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  133  int flexcop_eeprom_check_mac_addr(struct flexcop_device *fc, int extended)
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  134  {
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  135  	u8 buf[8];
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  136  	int ret = 0;
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  137  
662f3e9a140301 drivers/media/common/b2c2/flexcop-eeprom.c Darshan Rathod        2025-07-18  138  	ret = flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);
662f3e9a140301 drivers/media/common/b2c2/flexcop-eeprom.c Darshan Rathod        2025-07-18  139  
662f3e9a140301 drivers/media/common/b2c2/flexcop-eeprom.c Darshan Rathod        2025-07-18  140  	if (ret == 0) {
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  141  		if (extended != 0) {
d9942ad0228a7e drivers/media/common/b2c2/flexcop-eeprom.c Mauro Carvalho Chehab 2016-10-18  142  			err("TODO: extended (EUI64) MAC addresses aren't completely supported yet");
662f3e9a140301 drivers/media/common/b2c2/flexcop-eeprom.c Darshan Rathod        2025-07-18  143  			ret = ret = -EINVAL;
662f3e9a140301 drivers/media/common/b2c2/flexcop-eeprom.c Darshan Rathod        2025-07-18  144  		} else {
778241313819e1 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  145  			memcpy(fc->dvb_adapter.proposed_mac, buf, 6);
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  146  		}
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  147  		return ret;
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16  148  }
2add87a95068d6 drivers/media/dvb/b2c2/flexcop-eeprom.c    Johannes Stezenbach   2005-05-16 @149  EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

