Return-Path: <linux-media+bounces-25104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2195CA18B5A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 06:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8328188B709
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 05:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E4738384;
	Wed, 22 Jan 2025 05:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBjIwcrx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06950653
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737524137; cv=none; b=PenIOtEIdKb+ctC9rHafFHsV1watBYSHx9ytAX0pJluAu5mXF+vKjxl2Kj4EMDMCme/b+p7qdLUTg1q5lpDBAuX9MdGYsk5n9hBdOxarrN+QAk91xQeb0klGlxrVVvtqoB4iIduvXb23BqaqTXAV9zV8PArYRtKzqvtjYkm8p1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737524137; c=relaxed/simple;
	bh=EhMCmiZM42Z6k1xpRjwwfO6fcpW/OrvZeYBtkQqouK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7MwRbHSVuwmd8gA2yAKKBzJ0Z9r5Z8jRHnkWIJwsivZL3SbulREmfTWAFhNkCPgLcG1w0Pz9TfB3U25vcuF+3MvA59FlN2Mxir6QO1T0pI+QN1YgtSl7tPFezQZFE23dmjuziGwKdThGA8imXKdyCDIRwpFIpQ77r74qAF7Q8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBjIwcrx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737524136; x=1769060136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EhMCmiZM42Z6k1xpRjwwfO6fcpW/OrvZeYBtkQqouK4=;
  b=DBjIwcrxISFeg5LNgf+v4A5lY6hOlNUL038sJjoGSyM+D2GF9gM4JZuN
   j7Z9KhodSkTYv+z4CD6rv9g4cM4/MFtjSiyFhSVw13z7ks5VJ5YOQDMxW
   pkX5ABN2/Rc7c0ue+Tw+GjIRBonabYiJzT9oc8e4qNHimQXq6zUlU7VkE
   wHcE4CyVH7QSokRS/z1XxjKWeprU7H9F2bWNS6/ONHlfK3xTjEoG3jfo+
   Pc7qdQve1eUr2j4AXMXspHdH/+Yr8PX4M8qMrGQH+qPUD53xYupUWYJ0a
   tEYx5R5y1gmzby+sWtpJ7ICM/zIX9rzZXGaGHfYHphtSGMOMWq6njJdWz
   Q==;
X-CSE-ConnectionGUID: Ae3U64VwQsOzhGh4EBRzmA==
X-CSE-MsgGUID: SG5z8UomRHWOn+AAOQ0n+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38117777"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="38117777"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 21:35:35 -0800
X-CSE-ConnectionGUID: 9q3StaXTQyqFeQF4PbuWxA==
X-CSE-MsgGUID: bYbS3uIVRmCeX6M0AGFHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="112037122"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2025 21:35:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taTOl-000ZW7-29;
	Wed, 22 Jan 2025 05:35:31 +0000
Date: Wed, 22 Jan 2025 13:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-raw 53/58]
 include/uapi/linux/v4l2-controls.h:1235:9: warning:
 'V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL' macro redefined
Message-ID: <202501221338.bsfIQBc7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata-raw
head:   0e59c4e23bb8fe4a5c206cfbeabef1405c6df8b0
commit: b6809d1089a75ee690514c533a6d7e2e6a5e7353 [53/58] media: v4l: uapi: Add a control for colour pattern flipping effect
config: arm-randconfig-001-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221338.bsfIQBc7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221338.bsfIQBc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221338.bsfIQBc7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/flash/leds-aat1290.c:21:
   In file included from include/media/v4l2-flash-led-class.h:12:
   In file included from include/media/v4l2-ctrls.h:13:
   In file included from include/linux/videodev2.h:61:
   In file included from include/uapi/linux/videodev2.h:67:
>> include/uapi/linux/v4l2-controls.h:1235:9: warning: 'V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL' macro redefined [-Wmacro-redefined]
    1235 | #define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL     (1U << 1)
         |         ^
   include/uapi/linux/v4l2-controls.h:1234:9: note: previous definition is here
    1234 | #define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL     (1U << 0)
         |         ^
   In file included from drivers/leds/flash/leds-aat1290.c:21:
   In file included from include/media/v4l2-flash-led-class.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2686:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings generated.
--
   In file included from drivers/leds/flash/leds-max77693.c:14:
   In file included from include/linux/mfd/max77693-private.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/leds/flash/leds-max77693.c:20:
   In file included from include/media/v4l2-flash-led-class.h:12:
   In file included from include/media/v4l2-ctrls.h:13:
   In file included from include/linux/videodev2.h:61:
   In file included from include/uapi/linux/videodev2.h:67:
>> include/uapi/linux/v4l2-controls.h:1235:9: warning: 'V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL' macro redefined [-Wmacro-redefined]
    1235 | #define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL     (1U << 1)
         |         ^
   include/uapi/linux/v4l2-controls.h:1234:9: note: previous definition is here
    1234 | #define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL     (1U << 0)
         |         ^
   2 warnings generated.


vim +/V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL +1235 include/uapi/linux/v4l2-controls.h

  1232	
  1233	#define V4L2_CID_COLOUR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
  1234	#define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
> 1235	#define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL	(1U << 1)
  1236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

