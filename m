Return-Path: <linux-media+bounces-10471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BBB8B7BD3
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 17:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A781F217D7
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 15:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D10A173334;
	Tue, 30 Apr 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2vKjNTP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E5143749
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491394; cv=none; b=tp1o26Bv4ndZI8wyku30ZMP7svpKmbwZSRo1tFbbpgTd8ZfJHRrBTFSe4uPrHeDWoiTuu/P1GYd1GJovhKMoOnpS2GcHeMBAggmAfoBFOwmKzayqvlaQ73FAijAtPwMh730RMvOlZy4geg9ud9JBnkEujsS2GqHeaTDa8EdLDm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491394; c=relaxed/simple;
	bh=H3QOzcl2aViQGbhhpJPNDq7Y6KFZz7ZyWlfof3SZR7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIt4XgIHZeBR+7TSkRpW2uXXbNyhru+5PSXo23YMYqOp32NLtpYI+yc0aODt+IlPZmm2IHdZzAgoIc2MSRnCw6yTss3EnZFtOY4sHEzqvqhimeDAmoharAZhOPp1csmRlFrXvIJ0BCuhLJd4tmUNWU253TunIX71WuKxZoerNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2vKjNTP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714491393; x=1746027393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H3QOzcl2aViQGbhhpJPNDq7Y6KFZz7ZyWlfof3SZR7U=;
  b=Q2vKjNTPsAe6oDey4yg4+iVG0N+dn+TAaB8OGZqNoGrLhrXfL6tWQT6N
   vf4oCIKS1q8uDHpuvP70neghKYnBse2wLgwr+6oR1tJT9LG7PJ1AnMXN2
   TXhrHYK/IM1X2zJPA3G7L9VwxmVACR/XydGe641kLP2yB5uxkFKL+HI3e
   4iS1OaKX5eAA5WtiPhwKPp/TCUNo7IeHGfJR76SyOAmFup5Yk9TVAVITh
   qC/8y/Y1SaeSeaYxz0U3HjoxnLTXdXPiCMc959XNhf27p1oKGdehQliTc
   hs6MzUvaby6l9JwEjzY9iJJcLaQBPKDITAX6DiYj7OQFRYDbYdiB093zs
   g==;
X-CSE-ConnectionGUID: RrqxhQsaSVCSGejbA4xScQ==
X-CSE-MsgGUID: XsWs/9o7RnOWlV7i7h8V8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10427099"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10427099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:36:31 -0700
X-CSE-ConnectionGUID: sYT0PaxOR6uimNwZSMWXCg==
X-CSE-MsgGUID: bb6mqORsT+2GB6KZY7aXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="57384785"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 08:36:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1pWr-0008Gz-2J;
	Tue, 30 Apr 2024 15:36:25 +0000
Date: Tue, 30 Apr 2024 23:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:ipu6 14/50]
 drivers/media/platform/broadcom/bcm2835-unicam.c:2721:34: warning:
 'unicam_of_match' defined but not used
Message-ID: <202404302324.8aTC84kE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   308898eb3af1c6530b122a01a5c4b38931717e70
commit: e8676f3614bd98086cd71e2d7379291f5329115f [14/50] media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
config: sh-randconfig-r111-20240430 (https://download.01.org/0day-ci/archive/20240430/202404302324.8aTC84kE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404302324.8aTC84kE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404302324.8aTC84kE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/broadcom/bcm2835-unicam.c:309:17: error: 'MEDIA_BUS_FMT_META_8' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_Y8_1X8'?
     309 |         .code = MEDIA_BUS_FMT_META_8,
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 MEDIA_BUS_FMT_Y8_1X8
   drivers/media/platform/broadcom/bcm2835-unicam.c:490:35: error: 'V4L2_META_FMT_GENERIC_8' undeclared here (not in a function); did you mean 'V4L2_META_FMT_UVC'?
     490 |                 .fourcc         = V4L2_META_FMT_GENERIC_8,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
         |                                   V4L2_META_FMT_UVC
   drivers/media/platform/broadcom/bcm2835-unicam.c:494:35: error: 'V4L2_META_FMT_GENERIC_CSI2_10' undeclared here (not in a function)
     494 |                 .fourcc         = V4L2_META_FMT_GENERIC_CSI2_10,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/broadcom/bcm2835-unicam.c:495:35: error: 'MEDIA_BUS_FMT_META_10' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_UV8_1X8'?
     495 |                 .code           = MEDIA_BUS_FMT_META_10,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   MEDIA_BUS_FMT_UV8_1X8
   drivers/media/platform/broadcom/bcm2835-unicam.c:498:35: error: 'V4L2_META_FMT_GENERIC_CSI2_12' undeclared here (not in a function)
     498 |                 .fourcc         = V4L2_META_FMT_GENERIC_CSI2_12,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/broadcom/bcm2835-unicam.c:499:35: error: 'MEDIA_BUS_FMT_META_12' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_UV8_1X8'?
     499 |                 .code           = MEDIA_BUS_FMT_META_12,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   MEDIA_BUS_FMT_UV8_1X8
   drivers/media/platform/broadcom/bcm2835-unicam.c:502:35: error: 'V4L2_META_FMT_GENERIC_CSI2_14' undeclared here (not in a function)
     502 |                 .fourcc         = V4L2_META_FMT_GENERIC_CSI2_14,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/broadcom/bcm2835-unicam.c:503:35: error: 'MEDIA_BUS_FMT_META_14' undeclared here (not in a function); did you mean 'MEDIA_BUS_FMT_UV8_1X8'?
     503 |                 .code           = MEDIA_BUS_FMT_META_14,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   MEDIA_BUS_FMT_UV8_1X8
>> drivers/media/platform/broadcom/bcm2835-unicam.c:2721:34: warning: 'unicam_of_match' defined but not used [-Wunused-const-variable=]
    2721 | static const struct of_device_id unicam_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/unicam_of_match +2721 drivers/media/platform/broadcom/bcm2835-unicam.c

  2720	
> 2721	static const struct of_device_id unicam_of_match[] = {
  2722		{ .compatible = "brcm,bcm2835-unicam", },
  2723		{ /* sentinel */ },
  2724	};
  2725	MODULE_DEVICE_TABLE(of, unicam_of_match);
  2726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

