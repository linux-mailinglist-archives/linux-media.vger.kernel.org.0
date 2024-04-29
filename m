Return-Path: <linux-media+bounces-10328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C78B5B82
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 16:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133B31F21E4F
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 14:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B6F7E110;
	Mon, 29 Apr 2024 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQQSIfUD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27437D417
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401526; cv=none; b=Tu1ifbJbU7bSk1L21tjNqQwoIEZDi5KYFUKSbbp9pQ+rG3Qx3c2OJlajoBxqU1ruJ65/bWTSmZswHNx75IBglHuuia17cMDQ7DwrMEx+s4iu3BR2bMd62IDPluy6KrCzJigj0a+aBSveIJ2goT6nkbV9Gyln7RRulYGbKCa2tKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401526; c=relaxed/simple;
	bh=dGXL8ZLg5Uf/FL7djdodZYI/pjGESx0EpYiXOyZkV68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsDIufjJfC645S3sWtFlVTw0Y7Ha4M3FqZqSg0fMZaA/bip0WpLKuThgT6rkdxa8JyoR1UIHQ4j7SB/ukDZSaHD33i+om4nZzD5CfgG/Je4TzO/fiPama2BYjxURpHIInVxsVXqeg1uR8BFyQAzKgPkXYJ3j+ntshegildB9HM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQQSIfUD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714401524; x=1745937524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGXL8ZLg5Uf/FL7djdodZYI/pjGESx0EpYiXOyZkV68=;
  b=LQQSIfUDLRbdDfclkDh8HHgxPNW9gGYC5zChDgXK1hB9PCoCQ3i5Y921
   4NyfdgiGabIs0/V7m1YZ6YkOEwXmurWzrIO+3XDajGCFkcrMAkeDHHoIb
   7dICjExoBx+t77lX6cY/KOskvTsabNdm++k9abn/ndIxJ9JdfmveKEVr9
   POweO1S1GTUMzsZTffwEvcKvQ6zPuvU32Ht31legNvHgctDZ1SkUULjp5
   rJk88aGf70/UY+fUffow/L03cTxt9127elZBk16L3KZOtDxzYno6gMROx
   pJBmbj0JPxzgccR3PGpAj4HfGIViY7xA+LUporfIEIRMzaiZ2idgXvE38
   A==;
X-CSE-ConnectionGUID: ZyGdh5L2RDOH+v/GLCfU1w==
X-CSE-MsgGUID: oki+nEaySMObsFuG85kzRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27514976"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="27514976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:38:44 -0700
X-CSE-ConnectionGUID: 1RkGDJJ/SByNa9p3XxY19Q==
X-CSE-MsgGUID: kgP2k0B1SdK2f6jEzcjBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25999389"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 07:38:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1S9Q-0007Ey-0y;
	Mon, 29 Apr 2024 14:38:40 +0000
Date: Mon, 29 Apr 2024 22:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6 40/50]
 drivers/media/v4l2-core/v4l2-common.c:512:9: error: implicit declaration of
 function 'v4l2_subdev_call_op' is invalid in C99
Message-ID: <202404292239.nNxjfKs4-lkp@intel.com>
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
commit: 68213f72d8c806ff6968fb30c4bf61fd1257c4a3 [40/50] media: v4l: Support obtaining link frequency via get_mbus_config
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240429/202404292239.nNxjfKs4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292239.nNxjfKs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292239.nNxjfKs4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-common.c:512:9: error: implicit declaration of function 'v4l2_subdev_call_op' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
                         ^
   drivers/media/v4l2-core/v4l2-common.c:512:9: note: did you mean 'v4l2_subdev_cleanup'?
   include/media/v4l2-subdev.h:1320:6: note: 'v4l2_subdev_cleanup' declared here
   void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
        ^
   drivers/media/v4l2-core/v4l2-common.c:512:33: error: use of undeclared identifier 'pad'
                   ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
                                                 ^
   drivers/media/v4l2-core/v4l2-common.c:512:38: error: use of undeclared identifier 'get_mbus_config'
                   ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
                                                      ^
   drivers/media/v4l2-core/v4l2-common.c:522:19: error: use of undeclared identifier 'v4l2_get_link_freq'; did you mean '__v4l2_get_link_freq'?
   EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
                     ^~~~~~~~~~~~~~~~~~
                     __v4l2_get_link_freq
   include/linux/export.h:69:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
                                                          ^
   include/linux/export.h:65:54: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
                                                           ^
   include/linux/export.h:56:16: note: expanded from macro '__EXPORT_SYMBOL'
           extern typeof(sym) sym;                                 \
                         ^
   drivers/media/v4l2-core/v4l2-common.c:467:5: note: '__v4l2_get_link_freq' declared here
   s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
       ^
   4 errors generated.


vim +/v4l2_subdev_call_op +512 drivers/media/v4l2-core/v4l2-common.c

   466	
   467	s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
   468				 struct v4l2_ctrl_handler *handler, unsigned int mul,
   469				 unsigned int div)
   470	{
   471		struct v4l2_ctrl *ctrl;
   472		s64 freq;
   473	
   474		if (!handler && sd)
   475			handler = sd->ctrl_handler;
   476	
   477		ctrl = v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ);
   478		if (ctrl) {
   479			struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
   480			int ret;
   481	
   482			if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
   483				return v4l2_ctrl_g_ctrl_int64(ctrl);
   484	
   485			qm.index = v4l2_ctrl_g_ctrl(ctrl);
   486	
   487			ret = v4l2_querymenu(handler, &qm);
   488			if (ret)
   489				return -ENOENT;
   490	
   491			freq = qm.value;
   492		} else {
   493			if (!mul || !div)
   494				return -ENOENT;
   495	
   496			ctrl = v4l2_ctrl_find(handler, V4L2_CID_PIXEL_RATE);
   497			if (!ctrl)
   498				return -ENOENT;
   499	
   500			freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
   501	
   502			pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
   503				__func__);
   504			pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
   505				__func__);
   506		}
   507	
   508		if (freq <= 0 && sd) {
   509			struct v4l2_mbus_config mbus_config = {};
   510			int ret;
   511	
 > 512			ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
   513						  &mbus_config);
   514			if (ret < 0)
   515				return ret;
   516	
   517			return mbus_config.link_freq;
   518		}
   519	
   520		return freq > 0 ? freq : -EINVAL;
   521	}
   522	EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

