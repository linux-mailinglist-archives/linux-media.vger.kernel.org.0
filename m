Return-Path: <linux-media+bounces-25105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3546A18B72
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 06:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65FFB3A54DD
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 05:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626C3188906;
	Wed, 22 Jan 2025 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evBYpAyL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0529463
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737525400; cv=none; b=vFfWE2RdCMCtoROwPgjApp0vu8xCnCtje9hKoz9XZ8CMqyuwQoG0ZJv9FHdAUBDuccRZ/UDCtqXuX3vAs0DMoDYbf82UVGNkhlMlu2+Pc4Zq9Ppejyj9AtOk3oSF8gAZp9fEghaC4La5On1vukn7BFUbi6mWf4WeMPwsu7SvXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737525400; c=relaxed/simple;
	bh=xaG6OijnzMkm+G3lsobaNFd2WB2QwTT1inDO1EePd5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ITs6w12xHaFz6ayznU+Pg1GmpMxkqBUqN2aKwLplQGcGnNouOIM/4MBbA3uS4eUBnPWPkEEB4hEjt4rihuZhH8ayUodPYdnr1tO6dn+eEocJGDUz9SBeSfVXtaNtD1whQbCLqhLoWgrc0KgbBLyX0B9UlWxCmBaLe35rJdtppRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evBYpAyL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737525399; x=1769061399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xaG6OijnzMkm+G3lsobaNFd2WB2QwTT1inDO1EePd5Y=;
  b=evBYpAyLa2ojzByzPAmjyqyzS9wgckaLVYrYtNA6IujDgH0e8qUvTfaV
   DZ2AcF4Vr2E0QvzF/quI1Xl7SAJrIHUkj3s9E3rqG5VXA754rcnL5JXiJ
   nwc0loZrrb8VVu9uAxyr1AfYQjlIiVLoekqdqOmIUWJNkx0lQHKzMuIaO
   uhLW+UwY27/TTMLSCnDmNyNApAgLwMSLA5cRzDgBXBxyqZCrVdFBbqD+f
   5Ky5Uv+e9oR+ojxb5lmF2U5l71pbE2b85nAfdEaXF+E5oKQK6xFV45NIR
   gDee510K64/iRqAY7q9H8+1U2vW8gvLuI786x3nDTUUk42pkcLx6ge/VK
   g==;
X-CSE-ConnectionGUID: yDf3fzERS2GOpzNtza2xjg==
X-CSE-MsgGUID: uuPta91PQZuQOeY4Tdt0/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37664311"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="37664311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 21:56:38 -0800
X-CSE-ConnectionGUID: Sk8C/0MLQseywUc8xLlPXA==
X-CSE-MsgGUID: qT/eEARyQ3OmLbvPg8rD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112108823"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 21:56:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taTj9-000ZXt-0B;
	Wed, 22 Jan 2025 05:56:35 +0000
Date: Wed, 22 Jan 2025 13:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-raw 53/58]
 include/uapi/linux/v4l2-controls.h:1235: warning:
 "V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL" redefined
Message-ID: <202501221356.BLUiyTqL-lkp@intel.com>
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
config: arc-randconfig-001-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221356.BLUiyTqL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221356.BLUiyTqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221356.BLUiyTqL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/videodev2.h:67,
                    from include/linux/videodev2.h:61,
                    from drivers/media/usb/gspca/gspca.h:8,
                    from drivers/media/usb/gspca/stv0680.c:20:
>> include/uapi/linux/v4l2-controls.h:1235: warning: "V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL" redefined
    1235 | #define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL     (1U << 1)
         | 
   include/uapi/linux/v4l2-controls.h:1234: note: this is the location of the previous definition
    1234 | #define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL     (1U << 0)
         | 


vim +/V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL +1235 include/uapi/linux/v4l2-controls.h

  1232	
  1233	#define V4L2_CID_COLOUR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
  1234	#define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
> 1235	#define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL	(1U << 1)
  1236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

