Return-Path: <linux-media+bounces-20772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B109BAE64
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 185361F2343B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2631AB526;
	Mon,  4 Nov 2024 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bExmiiHs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E098195811;
	Mon,  4 Nov 2024 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709842; cv=none; b=t7vMxZOGuWFh7c1zCttFxBn/0Upszg81ee2ZRCKSl4HKfNdgOIHdbKX155X9YlpZxFm8pCnaMaBBm6AUwwnH7S9aIMqge/R1eQ0xcYnF7NXSxJHqb2u/52zbE3mWSq0Ihr6dCeqtOw1GAmDajI3b22Dgo234zk49k0TFXIuPiFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709842; c=relaxed/simple;
	bh=Z36C3WTXpYMy3EFZswByqUUZarqTpiVruIO3P+hzhYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtso6TkqIU7X9c8JvEUpYw+qRFg5p2URzGCjhu6xxcxfUc0vE2gFkYe0yN3eelRoZARah/42wT2sd0ZPHMiS/gO9Zu9AgchpzmHsjIFKgiscfLBd6kztTpqloPiORQXeVzojdKfeZ7KpmFn8+KYmSCiTvhwtgI85baaGqmp9SNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bExmiiHs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709840; x=1762245840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z36C3WTXpYMy3EFZswByqUUZarqTpiVruIO3P+hzhYY=;
  b=bExmiiHsXZvNKV7utAVOGhHC04HoUXpBoHdE9lF2Nho3NB6tHFQleyE2
   WpLYMAtyqAsMa+n1R8J211npozKc01jNNKt4ZqcvUOdGnMyCMkozecrOk
   QwUVLLklhalN6thhiYy4zcYg37f4/SoZPSO+uK71JUs2Dn/W7SKnk1st/
   UecaywX2c1ixI5cbc7ZElVUf+u1T4GKsFHZ7lo6YFTwEIIOKlHRJktjf0
   I+uQU1fAc1cEBAr+3gmPIFXQABf8gGNB5za11VCuN8mv/zQjWOAR88BZu
   yTIV7SyJLj4oynu5tgTK4W6nvcr0eDTwUrTYWFeWF4+UEj17IBrKxNd3G
   g==;
X-CSE-ConnectionGUID: HopRRut3SbeKcYN7dqyy7g==
X-CSE-MsgGUID: 2WDZJha9QrWiMbjTCIilzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="29811400"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="29811400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:43:59 -0800
X-CSE-ConnectionGUID: b8gprbCkTNOb/EYBJlkg2g==
X-CSE-MsgGUID: f3Lz6BIGQey6rgkyp4cjkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114388033"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2024 00:43:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7sgl-000keZ-2E;
	Mon, 04 Nov 2024 08:43:55 +0000
Date: Mon, 4 Nov 2024 16:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, chenchangcheng <ccc194101@163.com>
Subject: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices
 with status endpoints.
Message-ID: <202411041600.0u4Yj3kT-lkp@intel.com>
References: <20241104023947.826707-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104023947.826707-1-ccc194101@163.com>

Hi chenchangcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-stage/master]
[also build test ERROR on linus/master media-tree/master v6.12-rc6 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chenchangcheng/media-uvcvideo-Create-input-device-for-all-uvc-devices-with-status-endpoints/20241104-104225
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241104023947.826707-1-ccc194101%40163.com
patch subject: [PATCH] media: uvcvideo:Create input device for all uvc devices with status endpoints.
config: i386-buildonly-randconfig-003-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041600.0u4Yj3kT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041600.0u4Yj3kT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041600.0u4Yj3kT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/usb/uvc/uvc_status.c:16:
   In file included from drivers/media/usb/uvc/uvcvideo.h:17:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/usb/uvc/uvc_status.c:110:7: error: call to undeclared function 'uvc_input_has_button'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |                 if (uvc_input_has_button(dev)) {
         |                     ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/uvc_input_has_button +110 drivers/media/usb/uvc/uvc_status.c

    93	
    94	/* --------------------------------------------------------------------------
    95	 * Status interrupt endpoint
    96	 */
    97	static void uvc_event_streaming(struct uvc_device *dev,
    98					struct uvc_status *status, int len)
    99	{
   100		if (len <= offsetof(struct uvc_status, bEvent)) {
   101			uvc_dbg(dev, STATUS,
   102				"Invalid streaming status event received\n");
   103			return;
   104		}
   105	
   106		if (status->bEvent == 0) {
   107			if (len <= offsetof(struct uvc_status, streaming))
   108				return;
   109	
 > 110			if (uvc_input_has_button(dev)) {
   111				uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
   112					status->bOriginator,
   113					status->streaming.button ? "pressed" : "released", len);
   114				uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
   115			}
   116		} else {
   117			uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
   118				status->bOriginator, status->bEvent, len);
   119		}
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

