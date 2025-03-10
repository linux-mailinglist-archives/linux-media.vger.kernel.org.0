Return-Path: <linux-media+bounces-27972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA08A59B38
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 17:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448F31884CDD
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 16:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415D52309A7;
	Mon, 10 Mar 2025 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isevvDNd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83B216392
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741624753; cv=none; b=ay5Mzq3uxGRMG61BtCfk84xzKfHgIJ4hWBpjBg6s8eAuDbp8jTZzrokICnziSB+xpS9rssoe8GkLZoSt5kgz7vU46nKiw1PTt6EI+8MrrN5lQVfplEfQr9NRIatP51Y+oICX0HSkAR2qEMpDyPHDxa0azDhEEl0o3I3RVbiROvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741624753; c=relaxed/simple;
	bh=GExsIkkqVDXmOXPMiwRTt6YMXBtO7N7bXDqeWCHr8LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ANUseVjOQrRaD9rZcyx7Vg+F9rIw8bACGUHt6thnW+y1cY/ypEfUlJ5HhlozJT9E4L7YqCgtNQXyFfZ2Hay8VzMHggKwQ4i+iN3NuJxSO8AyG4IX+RYzXJ3waNoAgdoUFbGc9D5h4/XwOjBJGPQUJjj46V+VeMJP2UuY/fwYN24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isevvDNd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741624752; x=1773160752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GExsIkkqVDXmOXPMiwRTt6YMXBtO7N7bXDqeWCHr8LI=;
  b=isevvDNd4mdwCQ+37GGbkSm4pc6T3+XZN140OiSYnrrLDHEvwrK1z169
   sjPMeqwMGc11k07/YssnN7d4ynwrtF6ISQoluqG5+H6fJc4L606He6jN0
   YxOKoRMI3es7h0RZCMzXdsUZah3H1Mo61E8kgtyRKwCIwsH15ZREpQaQM
   sGWD3UEddXbsyEoUkE1M1t2dPWDaIsEy0S+soiVzPrdNzsFygG0HMvGt2
   qi5FCDffVvJBRMGMkjn6xOYJI5HEQEWX8XUzARcOaNgrUilAabdFHrAOw
   327C0EWu7H5gmYtZNhl78UfxiGathxSs1egPWBlSOxn5KbNfPczS++ue+
   g==;
X-CSE-ConnectionGUID: Pb6TAIN7SxWzPYCaZ92Zpg==
X-CSE-MsgGUID: qLNayfy5TXuggfq2u7gXdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41798580"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="41798580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 09:39:10 -0700
X-CSE-ConnectionGUID: 9ieiZkrLQBeYxfVZx7OSUw==
X-CSE-MsgGUID: U+zdeB3vSM29ryleoBEChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="143244021"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 09:39:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trg9e-0004TU-2Z;
	Mon, 10 Mar 2025 16:39:03 +0000
Date: Tue, 11 Mar 2025 00:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 22/23]
 drivers/media/platform/atmel/atmel-isi.c:1075:29: error: implicit
 declaration of function 'devm_kmemdup_array'; did you mean
 'devm_kmalloc_array'?
Message-ID: <202503110007.KgiJLedM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2
commit: 93c8dabd1d1ed94f03eb9a63c0bc291b62595bda [22/23] media: atmel-isi: use devm_kmemdup_array()
config: xtensa-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250311/202503110007.KgiJLedM-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110007.KgiJLedM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110007.KgiJLedM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/atmel/atmel-isi.c: In function 'isi_formats_init':
>> drivers/media/platform/atmel/atmel-isi.c:1075:29: error: implicit declaration of function 'devm_kmemdup_array'; did you mean 'devm_kmalloc_array'? [-Wimplicit-function-declaration]
    1075 |         isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
         |                             ^~~~~~~~~~~~~~~~~~
         |                             devm_kmalloc_array
>> drivers/media/platform/atmel/atmel-isi.c:1075:27: error: assignment to 'const struct isi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1075 |         isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
         |                           ^


vim +1075 drivers/media/platform/atmel/atmel-isi.c

  1043	
  1044	static int isi_formats_init(struct atmel_isi *isi)
  1045	{
  1046		const struct isi_format *isi_fmts[ARRAY_SIZE(isi_formats)];
  1047		unsigned int num_fmts = 0, i, j;
  1048		struct v4l2_subdev *subdev = isi->entity.subdev;
  1049		struct v4l2_subdev_mbus_code_enum mbus_code = {
  1050			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
  1051		};
  1052	
  1053		while (!v4l2_subdev_call(subdev, pad, enum_mbus_code,
  1054					 NULL, &mbus_code)) {
  1055			for (i = 0; i < ARRAY_SIZE(isi_formats); i++) {
  1056				if (isi_formats[i].mbus_code != mbus_code.code)
  1057					continue;
  1058	
  1059				/* Code supported, have we got this fourcc yet? */
  1060				for (j = 0; j < num_fmts; j++)
  1061					if (isi_fmts[j]->fourcc == isi_formats[i].fourcc)
  1062						/* Already available */
  1063						break;
  1064				if (j == num_fmts)
  1065					/* new */
  1066					isi_fmts[num_fmts++] = isi_formats + i;
  1067			}
  1068			mbus_code.index++;
  1069		}
  1070	
  1071		if (!num_fmts)
  1072			return -ENXIO;
  1073	
  1074		isi->num_user_formats = num_fmts;
> 1075		isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
  1076						       sizeof(isi_fmts[0]), GFP_KERNEL);
  1077		if (!isi->user_formats)
  1078			return -ENOMEM;
  1079	
  1080		isi->current_fmt = isi->user_formats[0];
  1081		return 0;
  1082	}
  1083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

