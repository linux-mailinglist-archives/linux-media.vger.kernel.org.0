Return-Path: <linux-media+bounces-24914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B5A16385
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 19:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63DED163B5B
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 18:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151FB1DF984;
	Sun, 19 Jan 2025 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8LIWyK1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655BE36D
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737311343; cv=none; b=se5wAHLybK8Kqge5QggD+Y9gbG7yapzIPPIZFmoOCn73vgFSxQCHF52ujMs/eeqpMZN0V1n0rZMmDLBKZXp1w/BRLL+Kqa/oLgaSgfZl2hPmwN1RcHVlaEcsm3MH9a2f/YNnnYapx8U9VY4Xh796WKhGN7LYJfOugRKhSfWQV48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737311343; c=relaxed/simple;
	bh=dtdJln9DUCS47S020Z5+ywS+CP+www9ECg77IDvoP54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+orxTYgx6+FINj5b+wL9dZA6c5SnV7ctqhNRiWweifnQbrQqdJaSF4oAfT8EzSKvNGGOJnl0FZOyo+/AnWgNU9TyZpMuSS/ZkV2qDIuxBsal9wRaJKAI7ik1yGlvfA1lG/vwg/rv4++4/7KDjd2YFTFq32auDgnD1QW0shE/qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8LIWyK1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737311340; x=1768847340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dtdJln9DUCS47S020Z5+ywS+CP+www9ECg77IDvoP54=;
  b=E8LIWyK1Gaw+ZnBG5TO0D7xoZFthVIIeZmwPWYgONlxp6g+GzoUslmT8
   D3NH6D9iL8nDgZA1aG/UdwvyAC1HMzxk/xRu9IohuTc7zNh/TGUZMMULN
   +1CSCZdXHPKVZqgFBhElPwAFY3UGgy2FnPbPe+eYoZcrFNUPi83kde4rp
   ny1uQp9KbSGgpMA7m6JfVWn2lEAbuPtIwKZqAosNIUdt5+iUIlzmy7rla
   Djn9+g7cxyIhHHHhfbFb5OaTaUtZX8QeAzWi18iKi9m9HvCoCmVa+OHBa
   5j9XKnaSPdv3AMuYyeyKwJVIhF3QqnjJxNhH6ARmDgOx5dwtg0WPYo4X8
   Q==;
X-CSE-ConnectionGUID: Nc8d9pnzSAeqEzRp7sKr8Q==
X-CSE-MsgGUID: mHtgN7+BSBqhXMk4NtuZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41604320"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41604320"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 10:28:59 -0800
X-CSE-ConnectionGUID: ZEPFNY+RQiqKs6R7yDTrww==
X-CSE-MsgGUID: 7c6nzuunRrC7J0D4SBCz7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129543362"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2025 10:28:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZa2U-000Vhb-0R;
	Sun, 19 Jan 2025 18:28:50 +0000
Date: Mon, 20 Jan 2025 02:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: Re: [PATCH v9 9/9] media: v4l: Convert the users of
 v4l2_get_link_freq to call it on a pad
Message-ID: <202501200204.0M82bJgt-lkp@intel.com>
References: <20250119143904.114991-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119143904.114991-10-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on c4b7779abc6633677e6edb79e2809f4f61fde157]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Support-passing-media-pad-argument-to-v4l2_get_link_freq/20250119-224053
base:   c4b7779abc6633677e6edb79e2809f4f61fde157
patch link:    https://lore.kernel.org/r/20250119143904.114991-10-sakari.ailus%40linux.intel.com
patch subject: [PATCH v9 9/9] media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250120/202501200204.0M82bJgt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200204.0M82bJgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200204.0M82bJgt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/camss/camss.c:14:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss.c:2057:2: error: use of undeclared identifier 'sensor_pad'
    2057 |         sensor_pad = camss_find_sensor_pad(entity);
         |         ^
   drivers/media/platform/qcom/camss/camss.c:2058:7: error: use of undeclared identifier 'sensor_pad'; did you mean 'seq_pad'?
    2058 |         if (!sensor_pad)
         |              ^~~~~~~~~~
         |              seq_pad
   include/linux/seq_file.h:105:6: note: 'seq_pad' declared here
     105 | void seq_pad(struct seq_file *m, char c);
         |      ^
>> drivers/media/platform/qcom/camss/camss.c:2058:7: warning: address of function 'seq_pad' will always evaluate to 'true' [-Wpointer-bool-conversion]
    2058 |         if (!sensor_pad)
         |             ~^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss.c:2058:7: note: prefix with the address-of operator to silence this warning
    2058 |         if (!sensor_pad)
         |              ^
         |              &
   drivers/media/platform/qcom/camss/camss.c:2061:39: error: use of undeclared identifier 'sensor_pad'
    2061 |         subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
         |                                              ^
   drivers/media/platform/qcom/camss/camss.c:2061:39: error: use of undeclared identifier 'sensor_pad'
   5 warnings and 4 errors generated.


vim +/sensor_pad +2057 drivers/media/platform/qcom/camss/camss.c

  2043	
  2044	/*
  2045	 * camss_get_pixel_clock - Get pixel clock rate from sensor
  2046	 * @entity: Media entity in the current pipeline
  2047	 * @pixel_clock: Received pixel clock value
  2048	 *
  2049	 * Return 0 on success or a negative error code otherwise
  2050	 */
  2051	int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
  2052	{
  2053		struct media_pad *sensor;
  2054		struct v4l2_subdev *subdev;
  2055		struct v4l2_ctrl *ctrl;
  2056	
> 2057		sensor_pad = camss_find_sensor_pad(entity);
> 2058		if (!sensor_pad)
  2059			return -ENODEV;
  2060	
  2061		subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
  2062	
  2063		ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
  2064	
  2065		if (!ctrl)
  2066			return -EINVAL;
  2067	
  2068		*pixel_clock = v4l2_ctrl_g_ctrl_int64(ctrl);
  2069	
  2070		return 0;
  2071	}
  2072	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

