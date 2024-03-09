Return-Path: <linux-media+bounces-6749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F8876E3C
	for <lists+linux-media@lfdr.de>; Sat,  9 Mar 2024 01:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31517B223D0
	for <lists+linux-media@lfdr.de>; Sat,  9 Mar 2024 00:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F42EA4;
	Sat,  9 Mar 2024 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0TorO5D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0690CA29
	for <linux-media@vger.kernel.org>; Sat,  9 Mar 2024 00:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709944871; cv=none; b=Qs3H0VlFms7UnvdNxruM1eIvEvMQD44gP8KjzHzwzL6YJ2Xn0LPp3hsI6ka5oNddxbX9WejQIkqS8D1MhD7Y0WipBkUCjM4Bgd9u6YKyxVK/SYObLiUql2keCIf07hNBhrUBzvVaJ1zbMrn2KNZV/xm4jw+fmuqqQ433PXtjXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709944871; c=relaxed/simple;
	bh=XGAcrTk36Lx5vsdqYgWUbRMfXEfphRCc/IiGUgzRbK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePy6UqMTnn9Vz91dLnH3ie+ApolRKzKQ7Zu0y0Gq+GLOVy6gqepxWdSevkJbD//sEVu2mMSMlzhuhtOeyC4QjBCCv+qBtZB+VLEjJJQbCkh/o0i5caQOt8XsuOxm3dYFZGfNJsI8nGDOoDE9Ujk4danAtjl+DDvn7IQUYfvh6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0TorO5D; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709944869; x=1741480869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGAcrTk36Lx5vsdqYgWUbRMfXEfphRCc/IiGUgzRbK8=;
  b=k0TorO5DTOLFbjhWZqZZ2+wOzv8oAAG0oyrQCoP7E4acOfvJl8FycAdq
   69L1EO6gMCIiti0qIDNaeOv7oSbnF/ROUwIShnvDZWUxjYMEEk8AXJwlx
   NLv+H11myBkdL+/ldQIXH+clEJfnAtTvoT0gsxwFNJhTdWufKs95tqzNF
   HeishKiKfeQseoNRngcPa8/TzahBhfytoeM1XRZCoAQlqyNeU/jI5zhwV
   mMM2bPQkzLqWgNY0eBKd7WkXJjJNFxN+qw51CrJzAYu6s6p92hoCzF8B2
   Xoqakmq1KPrtuc5Lh0/5AC4NXRhB/Oi66DtdVqIuHDkJR+XcnXbDAAifZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4607643"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="4607643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 16:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10536757"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2024 16:41:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riklt-0006pr-0V;
	Sat, 09 Mar 2024 00:41:05 +0000
Date: Sat, 9 Mar 2024 08:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:master 26/27]
 drivers/media/v4l2-core/v4l2-async.c:623:13: warning: unused variable 'ret'
Message-ID: <202403090851.cCiC7PN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   54ee11761885407056f4ca60309739e2db6b02dc
commit: 1277bce40e9cfe5831808780228d1b1cf645e1d4 [26/27] media: v4l: async: Don't set notifier's V4L2 device if registering fails
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240309/202403090851.cCiC7PN1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090851.cCiC7PN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090851.cCiC7PN1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-async.c: In function 'v4l2_async_nf_register':
>> drivers/media/v4l2-core/v4l2-async.c:623:13: warning: unused variable 'ret' [-Wunused-variable]
     623 |         int ret;
         |             ^~~


vim +/ret +623 drivers/media/v4l2-core/v4l2-async.c

a3620cb48d303f Sakari Ailus          2017-09-24  620  
b8ec754ae4c563 Sakari Ailus          2023-02-23  621  int v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
a3620cb48d303f Sakari Ailus          2017-09-24  622  {
a3620cb48d303f Sakari Ailus          2017-09-24 @623  	int ret;
a3620cb48d303f Sakari Ailus          2017-09-24  624  
b8ec754ae4c563 Sakari Ailus          2023-02-23  625  	if (WARN_ON(!notifier->v4l2_dev == !notifier->sd))
a3620cb48d303f Sakari Ailus          2017-09-24  626  		return -EINVAL;
a3620cb48d303f Sakari Ailus          2017-09-24  627  
1277bce40e9cfe Sakari Ailus          2024-03-08  628  	return __v4l2_async_nf_register(notifier);
a3620cb48d303f Sakari Ailus          2017-09-24  629  }
3c8c153914812a Sakari Ailus          2021-03-05  630  EXPORT_SYMBOL(v4l2_async_nf_register);
e9e310491bdbc8 Guennadi Liakhovetski 2013-01-08  631  

:::::: The code at line 623 was first introduced by commit
:::::: a3620cb48d303f07160694c00d9c1c8f0ea96690 media: v4l: async: Prepare for async sub-device notifiers

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

