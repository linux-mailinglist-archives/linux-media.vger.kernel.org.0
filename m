Return-Path: <linux-media+bounces-25117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F282FA18FE2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 11:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3968416374A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9B1211465;
	Wed, 22 Jan 2025 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIK7hqkB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE720F987
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542320; cv=none; b=rs0RSPjhKb+Kedfvj5ie0LISy+oj+5wa1uIjPZ82v0yz/uRFuSEJial4vt+vJEdfie2/87grsIpsQHsUXzhcqIekxZjFrjdgd/ZAe5tvEAQZl7pepyO6xWh9IOfrQh5o4cZCSpCHeyOybIfbkVleeOMOowVSe/PCf5huGTjf0bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542320; c=relaxed/simple;
	bh=6ozu4vMfeNkJqIG2StWX5XYjhz2Wh6Oc6/I1hyg1Wz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u18gh0FKeahaFztbfFeFAFMGNF5Mzfx5F04capwJaYskMcGLreDbFmNeiL92aqLcY5Ky4NSksTcpJ1NwcSzcdFlmF+qMhFcf71IghYK2RpBkhOZV1YkpfkBgOYiAGPlMhp3yac6eT656ZuXC/vCp+7atkR4BoPvLRN/xgesC6x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIK7hqkB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737542319; x=1769078319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ozu4vMfeNkJqIG2StWX5XYjhz2Wh6Oc6/I1hyg1Wz8=;
  b=eIK7hqkB458lob02wnM22PNL/5mdyYMU0Ny7gEyRFk2YoMuVyi3V/h6V
   Te3K0VVFtZUp+DdH32YolnIpVqNZlNqP4+tKKwdoeh5WS35ZmJch0wNv5
   jHXygLnIYmg1ZpYelDTlLIS32W6Uv9dqqeL2reCZOvL7agPaQAnvlP5BN
   zS/r+zboQSTkcN211fwicu1+FhkmXePiPFF60UubKwVc1hkn7yGCuwRGM
   f0jmFY5QThHhyB19oz1fNHAJYPQUea7LvFIGoLEvmK8YDmf2R/981f3za
   k3AGckQo7+ZSCzBH0vmO5JNP0/diFULF3AdWtUWARssXHb2NrmFBq9102
   g==;
X-CSE-ConnectionGUID: SuHFJJh2QfuuioHxHkQ/RQ==
X-CSE-MsgGUID: qzqisP/lSvaitX1qomRFtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37871504"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37871504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 02:38:38 -0800
X-CSE-ConnectionGUID: 1eJx2M92Qo2fHj20re1JCA==
X-CSE-MsgGUID: i5NYxUdhSt+87H6EpUNp8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107985971"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jan 2025 02:38:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taY82-000Zkj-2c;
	Wed, 22 Jan 2025 10:38:34 +0000
Date: Wed, 22 Jan 2025 18:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel 46/46]
 drivers/platform/x86/intel/int3472/discrete.c:138: warning: Function
 parameter or struct member 'int3472_reset_gpio_map' not described in
 'int3472_reset_gpio_map'
Message-ID: <202501221858.1YHNirHd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   c3af137975ac5de4479d2f019acb74db0b36a26e
commit: c3af137975ac5de4479d2f019acb74db0b36a26e [46/46] platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
config: i386-buildonly-randconfig-002-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221858.1YHNirHd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221858.1YHNirHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221858.1YHNirHd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/int3472/discrete.c:138: warning: Function parameter or struct member 'int3472_reset_gpio_map' not described in 'int3472_reset_gpio_map'


vim +138 drivers/platform/x86/intel/int3472/discrete.c

   124	
   125	/**
   126	 * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
   127	 * the sensor driver (as in DT bindings)
   128	 * @devname: The name of the device without the instance number e.g. i2c-INT347E
   129	 * @func: The function, e.g. "enable"
   130	 * @polarity: GPIO_ACTIVE_{HIGH,LOW}
   131	 */
   132	static const struct int3472_reset_gpio_map {
   133		const char *devname;
   134		const char *func;
   135		unsigned int polarity;
   136	} int3472_reset_gpio_map[] = {
   137		{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
 > 138	};
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

