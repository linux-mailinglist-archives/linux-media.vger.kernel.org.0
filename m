Return-Path: <linux-media+bounces-19390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED6999C45
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896CCB22AB2
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38F81F8F19;
	Fri, 11 Oct 2024 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDfBwbd8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973601EABA2
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625924; cv=none; b=mHkUTXod4AUDxdyh0RX+zoNcg9zflbQmHO0M0+6CETh1r3yottq0Gp3igFbU4CioTQlFdt0hIcjZhmf+vh0ScWu9Vc30TsA/sfqvretWSGMfac20kgZsJvUbOI7lfZljVr4xtNO+I3bqyVbKDVGNypeZK2ZPr8/D4Z3beUR23J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625924; c=relaxed/simple;
	bh=PrDTn8wRHtOEhQoa7hKm8OzVqgxHjZE1HDHIfDazs4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOuZlcSg27AmTCk4tPhpO0uv5B9dK5p2oOIxqeo0bFcmirwbk7a6tSA9NZOQNJvqITZjzvvRCIwYVQdIp69TwNz8utdjYqmx0xBT8JdCJKOWo/xmYsND6JGaVP2IkMa2Ke7N4DRQXakiYhrGKGnBIK3OSQMiohYcfspTAOsGEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDfBwbd8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728625922; x=1760161922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PrDTn8wRHtOEhQoa7hKm8OzVqgxHjZE1HDHIfDazs4g=;
  b=KDfBwbd8ukTrQ0wJgD+Ro8ChC4NWC8YC/ZZRXFWlPqIsv1LuR0/nrbWC
   R/pzsF/s4nLTzNPLC7KEv28KTpUupgW16h7Q3/nE/PNqaj1znmDj3dhg6
   TUKmmWRrF+mJiy1NzKwGTmoYXZ7b/0h0orYEFCzue1gpARHwJEtOT1smd
   cX1Nu+hvnfYtCfwQtLu2wsnjQcSF06LD7d6IN6KpWrti9ySplMcTY+tet
   gCgQEtbtA3ovVxR3Pa3p+j6knqEYUpdzwfcbQWm6hTwJI8pnB/vJnZthf
   10pF90lC9K/EIn4SqGIbS3d9qapJw3iYP7/Bw7By8jkvxQjJ6WQmU52Gq
   w==;
X-CSE-ConnectionGUID: yLaHnOvuQdWSUbhgdx9Ztg==
X-CSE-MsgGUID: vFEBxhJ/SDqpd59bLdMrSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30888073"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="30888073"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 22:52:01 -0700
X-CSE-ConnectionGUID: n9A2r0oJRlCM0bdHKGvg9w==
X-CSE-MsgGUID: wk1NooulSza2RFLK0atdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="114267204"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Oct 2024 22:51:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz8ZA-000BvC-0v;
	Fri, 11 Oct 2024 05:51:56 +0000
Date: Fri, 11 Oct 2024 13:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	hao.yao@intel.com, dongcheng.yan@linux.intel.com
Subject: Re: [PATCH v1] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202410111318.K3x5juFo-lkp@intel.com>
References: <20241010071010.3275452-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010071010.3275452-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6ba59ff4227927d3a8530fc2973b80e94b54d58f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20241010-161811
base:   6ba59ff4227927d3a8530fc2973b80e94b54d58f
patch link:    https://lore.kernel.org/r/20241010071010.3275452-1-dongcheng.yan%40intel.com
patch subject: [PATCH v1] media: i2c: add lt6911uxe hdmi bridge driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241011/202410111318.K3x5juFo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111318.K3x5juFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111318.K3x5juFo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/lt6911uxe.c: In function 'lt6911uxe_init_controls':
>> drivers/media/i2c/lt6911uxe.c:222:50: error: 'V4L2_CID_CUR_LINK_FREQ' undeclared (first use in this function); did you mean 'V4L2_CID_LINK_FREQ'?
     222 |                                                  V4L2_CID_CUR_LINK_FREQ, 0,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                                  V4L2_CID_LINK_FREQ
   drivers/media/i2c/lt6911uxe.c:222:50: note: each undeclared identifier is reported only once for each function it appears in


vim +222 drivers/media/i2c/lt6911uxe.c

   208	
   209	static int lt6911uxe_init_controls(struct lt6911uxe *lt6911uxe)
   210	{
   211		struct v4l2_ctrl_handler *ctrl_hdlr;
   212		s64 pixel_rate;
   213		int ret;
   214	
   215		ctrl_hdlr = &lt6911uxe->ctrl_handler;
   216		ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
   217		if (ret)
   218			return ret;
   219	
   220		ctrl_hdlr->lock = &lt6911uxe->mutex;
   221		lt6911uxe->link_freq = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
 > 222							 V4L2_CID_CUR_LINK_FREQ, 0,
   223							 LT6911UXE_MAX_LINK_FREQ, 1,
   224							 lt6911uxe->cur_mode.link_freq);
   225	
   226		pixel_rate = get_pixel_rate(lt6911uxe);
   227		lt6911uxe->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
   228							  V4L2_CID_PIXEL_RATE,
   229							  pixel_rate, pixel_rate, 1,
   230							  pixel_rate);
   231	
   232		if (ctrl_hdlr->error) {
   233			ret = ctrl_hdlr->error;
   234			goto hdlr_free;
   235		}
   236		lt6911uxe->sd.ctrl_handler = ctrl_hdlr;
   237	
   238		return 0;
   239	
   240	hdlr_free:
   241		v4l2_ctrl_handler_free(ctrl_hdlr);
   242		return ret;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

