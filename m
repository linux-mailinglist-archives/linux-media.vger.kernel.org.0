Return-Path: <linux-media+bounces-5112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF38542D7
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 07:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897032851F8
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 06:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55BB1119C;
	Wed, 14 Feb 2024 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IboZsip2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940410A13
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707892521; cv=none; b=KYrbLrZs6AApvF7/cWEk+F0FOkuXODed4maX1/fbk1C7XxefC7kk0CYHk6SXsbU0O6VNEK5qvYOQ1WHeeP90FiIARMhWnol+T6/Y2Kg3a6xhxOX6kox3q7eLKe2uJw8mXzT+AFn4YtKZ6coTJ8F1HTob87RYrJKAaEdvOD2TddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707892521; c=relaxed/simple;
	bh=H/Fa0Ckc85OnRwQaxpFQNTXGMi+i0uX2zO0JNLy5iSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJXogOkrySU4xRIBWlL/FrZDyfFKtkPTdeRx0XJh04C9hffLldAwHdb4Z12XGwSPPy8YDNGPRsdZbS9O0W0zczPr+aRHuvfYQXgIuq8oLEdFxZh4KMqCc6q28mTeUeyyc482El7xt4kKk3fHAzc4sAFnnOhTBPheVHeP5z/H+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IboZsip2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707892518; x=1739428518;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H/Fa0Ckc85OnRwQaxpFQNTXGMi+i0uX2zO0JNLy5iSo=;
  b=IboZsip29NJ6d3X4Dimp0+DLKLgdyza29eMgZwz90uw+ixzjUwtP7wGe
   52djVV0a3SMWD6LTu6fB4s31RTlyKjQflxSitf40EPM0tX3ZVin9aoyrz
   Fu1U32RdxZgGyspAxh4S91oKKtV/DEAQKAoAYJSLZWBzKOdwNlAd9SVHf
   CtnXQkHnAyLLZrG++X4IeLzLYoLrs3rzt4PQksmFF3mHPCOWdQgv2oJxn
   41Oih28K1h8m1E8CKfs1sh6pZzAuI6V1BkZuqLd5bDGZIux7fT9mFNCzO
   3ot+l+3QsBLVsq1skhF7NtVtkG3d6KgtFqnOk4Vxzgd9CeKSGR3l/MAIo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5746959"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5746959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 22:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7756423"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2024 22:35:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra8rS-0008XO-0i;
	Wed, 14 Feb 2024 06:35:14 +0000
Date: Wed, 14 Feb 2024 14:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6 65/67]
 drivers/misc/mei/platform-vsc.c:304:42: warning: unknown escape sequence
 'xFFFFFFC5'
Message-ID: <202402141409.ivNcqTdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   ccfe5fafd33d1b056e3ab93de494cd877a5783a2
commit: b6eaf785293ecd8deb07ddf9a178d10612340e86 [65/67] debug
config: i386-randconfig-016-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141409.ivNcqTdP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141409.ivNcqTdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141409.ivNcqTdP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/mei/platform-vsc.c:304:42: warning: unknown escape sequence '\xFFFFFFC5' [-Wunknown-escape-sequence]
     304 |         dev_warn(mei_dev->dev, "mei vsc event cb\ņ");
         |                                                 ^
   include/linux/dev_printk.h:146:62: note: expanded from macro 'dev_warn'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
>> drivers/misc/mei/platform-vsc.c:304:44: warning: illegal character encoding in string literal [-Winvalid-source-encoding]
     304 |         dev_warn(mei_dev->dev, "mei vsc event cb\ņ");
         |                                                  ^
   include/linux/dev_printk.h:146:62: note: expanded from macro 'dev_warn'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   drivers/misc/mei/platform-vsc.c:333:46: warning: unknown escape sequence '\xFFFFFFC5' [-Wunknown-escape-sequence]
     333 |         dev_warn(mei_dev->dev, "mei vsc event cb end\ņ");
         |                                                     ^
   include/linux/dev_printk.h:146:62: note: expanded from macro 'dev_warn'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   drivers/misc/mei/platform-vsc.c:333:48: warning: illegal character encoding in string literal [-Winvalid-source-encoding]
     333 |         dev_warn(mei_dev->dev, "mei vsc event cb end\ņ");
         |                                                      ^
   include/linux/dev_printk.h:146:62: note: expanded from macro 'dev_warn'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   4 warnings generated.


vim +/xFFFFFFC5 +304 drivers/misc/mei/platform-vsc.c

   291	
   292	static void mei_vsc_event_cb(void *context)
   293	{
   294		struct mei_device *mei_dev = context;
   295		struct mei_vsc_hw *hw = mei_dev_to_vsc_hw(mei_dev);
   296		struct list_head cmpl_list;
   297		s32 slots;
   298		int ret;
   299	
   300		if (mei_dev->dev_state == MEI_DEV_RESETTING ||
   301		    mei_dev->dev_state == MEI_DEV_INITIALIZING)
   302			return;
   303	
 > 304		dev_warn(mei_dev->dev, "mei vsc event cb\ņ");
   305	
   306		INIT_LIST_HEAD(&cmpl_list);
   307	
   308		guard(mutex)(&mei_dev->device_lock);
   309	
   310		while (vsc_tp_need_read(hw->tp)) {
   311			/* check slots available for reading */
   312			slots = mei_count_full_read_slots(mei_dev);
   313	
   314			ret = mei_irq_read_handler(mei_dev, &cmpl_list, &slots);
   315			if (ret) {
   316				if (ret != -ENODATA) {
   317					if (mei_dev->dev_state != MEI_DEV_RESETTING &&
   318					    mei_dev->dev_state != MEI_DEV_POWER_DOWN)
   319						schedule_work(&mei_dev->reset_work);
   320				}
   321	
   322				return;
   323			}
   324		}
   325	
   326		mei_dev->hbuf_is_ready = mei_hbuf_is_ready(mei_dev);
   327		ret = mei_irq_write_handler(mei_dev, &cmpl_list);
   328		if (ret)
   329			dev_err(mei_dev->dev, "dispatch write request failed: %d\n", ret);
   330	
   331		mei_dev->hbuf_is_ready = mei_hbuf_is_ready(mei_dev);
   332		mei_irq_compl_handler(mei_dev, &cmpl_list);
   333		dev_warn(mei_dev->dev, "mei vsc event cb end\ņ");
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

