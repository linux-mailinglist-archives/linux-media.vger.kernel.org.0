Return-Path: <linux-media+bounces-1698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC798806634
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 05:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8025D1F21737
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 04:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F90BFC08;
	Wed,  6 Dec 2023 04:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FU4TdlfW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D325D40
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 20:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701837279; x=1733373279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hDKDgKPUZy4l7lOdpHz4wxB3mE8re27mFOi9RvB0Ljs=;
  b=FU4TdlfWCT0pvu5Oms9BaFvR2vkjZedY7Gr03gcd6fB0DSere80CVW60
   OqBLWdPkfhCieoS7EamC+XVXfrRXWdRZDr+aW5eWKylbqy6//OBmL1tU8
   K5qVX0qafb/i8TU/P+MXU93vVUwwEM7icp+2/MV4W84kQuMd4JhhL0GcY
   yhZS0EfQJAU7Xc19kDKsY2X3gtaeFQJiTjXL8y888GffFRDhJI/UPTLxp
   by0jaZAmcNhwGx1d3Q2pxNzsyCf096Me7Rz+TaSzkNiMKrgJJzxH34/Cm
   Dam02uf4vhJq8p9A5IbxH/h5ai1d6PFYLtjN578hsUd8sDIQtG8ZjQYve
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="379023567"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="379023567"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944514521"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="944514521"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 20:34:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjcH-000AGI-1s;
	Wed, 06 Dec 2023 04:34:33 +0000
Date: Wed, 6 Dec 2023 12:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v14 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <202312061239.MnFkbC6Q-lkp@intel.com>
References: <20231201071907.3080126-7-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-7-yunkec@google.com>

Hi Yunke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linuxtv-media-stage/master linus/master v6.7-rc4 next-20231205]
[cannot apply to media-tree/master sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT/20231201-152501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231201071907.3080126-7-yunkec%40google.com
patch subject: [PATCH v14 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
config: i386-buildonly-randconfig-001-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061239.MnFkbC6Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061239.MnFkbC6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061239.MnFkbC6Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ctrls-core.c:309:6: warning: no previous prototype for 'v4l2_ctrl_type_op_minimum' [-Wmissing-prototypes]
     309 | void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:315:6: warning: no previous prototype for 'v4l2_ctrl_type_op_maximum' [-Wmissing-prototypes]
     315 | void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/v4l2_ctrl_type_op_minimum +309 drivers/media/v4l2-core/v4l2-ctrls-core.c

   308	
 > 309	void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   310				       union v4l2_ctrl_ptr ptr)
   311	{
   312		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
   313	}
   314	
 > 315	void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   316				       union v4l2_ctrl_ptr ptr)
   317	{
   318		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

