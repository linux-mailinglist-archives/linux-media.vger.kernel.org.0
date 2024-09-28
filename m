Return-Path: <linux-media+bounces-18729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75C988DB2
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 05:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EFD81C21234
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 03:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A77D15C14B;
	Sat, 28 Sep 2024 03:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3ZdStL5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2015351C;
	Sat, 28 Sep 2024 03:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727493304; cv=none; b=XG+cHWbf6m1rIuCaxcp3htI+Nv6hulqeDLTBM/DXFpKMJASp7oQPqMJZ5C87fTkSuye7FkLWWwJgrFrBezk1RcyvsAz9Xdevpu7MVhjKQKG9eXkhoNEii+wEbUls/447vyMgo00BOmjXkwHbzt15r9DHsISgpOrIYGUU0AuvEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727493304; c=relaxed/simple;
	bh=/VGW6gLOvWEix6yTtYLUBYd1mi71ScOcWznvaDztTHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeksE/lkubp6W5Bp1HYCe8VT5tf4eimUoahQbmP2SIjYSwXUM1VUpPNEmuCtH8PdmzgCAitY3EvZdE49Mtxzg70nnx7Y3QZsqM4VK5ZI8VT8EzpQdbgSXAyTqC79OXrl3Jw0UwOEZZZr9oBFI2TzqXH9G9CGgPHBHBLLLsMdBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3ZdStL5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727493303; x=1759029303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/VGW6gLOvWEix6yTtYLUBYd1mi71ScOcWznvaDztTHE=;
  b=E3ZdStL5sNAVbY6jGRks9C9a2Jg1cu0Yf+L901rwKreimiDw1gcZaeuz
   UrYUA16L2wM6glgVD8TAP92vy9LLwjkMV0KFn39ttjOf7seniuZuayji4
   fFIXacRudS1ZxTU44SafUAzmZFpONLJCFSXgqwqWLhIFwePBJlT3ydgSv
   Xw1oIh7O1xbXm8QkyABsyInoeec9amiUq/DOvvowJjaeLnUpF8R00hRRe
   WDjVg3KE7JhfoPJMRUrqLWS1V2irhmS+ei/hj4L5QH7tUYxaUXupvUZMP
   hJn4hKwdhIllzV1X3/CEayb87OJMp7kqCbCCO+5rs//+X49kxT39K5UHe
   w==;
X-CSE-ConnectionGUID: 6mtBTnyHQD6OvcvQGFGioA==
X-CSE-MsgGUID: pZER0PxPRnKj8cOhV/vNxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37211750"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37211750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 20:15:02 -0700
X-CSE-ConnectionGUID: EnSXIkpuRJC1xt5BLRuVNA==
X-CSE-MsgGUID: 0GDsKC/WQ4ugdUKMVLw+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77663551"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 20:14:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suNv5-000Msb-2i;
	Sat, 28 Sep 2024 03:14:55 +0000
Date: Sat, 28 Sep 2024 11:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
Message-ID: <202409281015.ZcDlYBGw-lkp@intel.com>
References: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/media-ti-cal-Use-str_up_down/20240927-180438
base:   075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
patch link:    https://lore.kernel.org/r/20240927-cocci-6-12-v2-1-1c6ad931959b%40chromium.org
patch subject: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281015.ZcDlYBGw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281015.ZcDlYBGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281015.ZcDlYBGw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/ti/cal/cal-camerarx.c:193:3: error: unterminated function-like macro invocation
     193 |                 phy_err(phy, "Failed to power %s complexio\n",
         |                 ^
   drivers/media/platform/ti/cal/cal.h:278:9: note: macro 'phy_err' defined here
     278 | #define phy_err(phy, fmt, arg...)                                       \
         |         ^
>> drivers/media/platform/ti/cal/cal-camerarx.c:897:2: error: expected expression
     897 | }
         |  ^
>> drivers/media/platform/ti/cal/cal-camerarx.c:897:2: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
   drivers/media/platform/ti/cal/cal-camerarx.c:192:2: note: previous statement is here
     192 |         if (i == 10)
         |         ^
>> drivers/media/platform/ti/cal/cal-camerarx.c:897:2: error: expected '}'
     897 | }
         |  ^
   drivers/media/platform/ti/cal/cal-camerarx.c:169:1: note: to match this '{'
     169 | {
         | ^
   1 warning and 3 errors generated.


vim +193 drivers/media/platform/ti/cal/cal-camerarx.c

af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  167  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  168  static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  169  {
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  170  	u32 target_state;
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  171  	unsigned int i;
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  172  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  173  	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  174  		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  175  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  176  	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  177  			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  178  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  179  	for (i = 0; i < 10; i++) {
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  180  		u32 current_state;
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  181  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  182  		current_state = cal_read_field(phy->cal,
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  183  					       CAL_CSI2_COMPLEXIO_CFG(phy->instance),
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  184  					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  185  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  186  		if (current_state == target_state)
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  187  			break;
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  188  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  189  		usleep_range(1000, 1100);
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  190  	}
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  191  
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  192  	if (i == 10)
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06 @193  		phy_err(phy, "Failed to power %s complexio\n",
368e80f16a6aff drivers/media/platform/ti/cal/cal-camerarx.c Ricardo Ribalda  2024-09-27  194  			str_up_down(enable);
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  195  }
af30d4f36ef35d drivers/media/platform/ti-vpe/cal-camerarx.c Laurent Pinchart 2020-07-06  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

