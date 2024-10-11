Return-Path: <linux-media+bounces-19388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0644A999C1A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF8928593A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F78F1F9415;
	Fri, 11 Oct 2024 05:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuSrlhBs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AD61BFDF7
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728624482; cv=none; b=HBc1VQ3bFXH8mlaN4hIZy36PVCnD6LJc6ZXkW1J4z78bl4hekrQJ61qAgmBg7s9f14Q/XGxp40EvSmKZUKFvB3XALlVahjNf9Mm1fYBflbxGt/KwN0KqPHhwNQ77+80S1oYFT6LYQc4NHpfhfaG7BQEyKKU4cnUp7gKNyKY0o1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728624482; c=relaxed/simple;
	bh=goCG6LuCMyfTeKQKHyln6y/2A0/7zl/mSrjhumcIpf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo85jTe2bVVqzAGLdDsP/ev3J1kgEE2spHPXHRzGmvQaGwzHNYZxwGY0uDwwH4lq/wVINhKVd5fD4rsKU8g4PoQUxhc3jzIAjo1ebxUtO/EqV58JQL5qjV/kK6cY5/6m66i4YtNRrgFKg6dSb/i3HjRv1dRS6tM3qpSw72KyZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuSrlhBs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728624480; x=1760160480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=goCG6LuCMyfTeKQKHyln6y/2A0/7zl/mSrjhumcIpf8=;
  b=BuSrlhBsGdesdRYHx2Vyot5wvyD6FKH4hcmYWmAYZ93e/RT0MJBe9m8J
   pqLlcn3Z1soF/fLwtY+xjtxqACLvEXJHI1a2Os1WrjrlDG4JId7SfssJw
   c2/3UIYZx5CGXZVLavmtEz1J1iZLXFzq38W56K+2npR3BDPQSWFr+2T2E
   4+H6Uy8tRetkF1/ugjY/F/YHlHX2ZbaPShTPfcb6+YvczaWRURgM/8arU
   Bfh4q2RbvcPIaDiz8DSvX7V+/RUh6ftc8zsDjxGdWhNPgkDmp+6mJHb3c
   F72qeo0IaACDiHVHiMOUQk7IDjg5jVRtSUuMKEBGVkbuXB0jxXVIihR3r
   w==;
X-CSE-ConnectionGUID: p3gOSYE/QfSto7sWSUMb5g==
X-CSE-MsgGUID: AjNo6+DlS22VR3R/UvfI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28145117"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="28145117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 22:27:59 -0700
X-CSE-ConnectionGUID: gr19AF24RDe1lwNh+/M43w==
X-CSE-MsgGUID: AUDeKc8zTfmC6HBM0MTIHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77017453"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2024 22:27:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz8Bu-000Bqb-1h;
	Fri, 11 Oct 2024 05:27:54 +0000
Date: Fri, 11 Oct 2024 13:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	daxing.li@intel.com, hao.yao@intel.com,
	dongcheng.yan@linux.intel.com
Subject: Re: [PATCH v1] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202410111357.m9iK4rKf-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241011/202410111357.m9iK4rKf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111357.m9iK4rKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111357.m9iK4rKf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/lt6911uxe.c:222:8: error: use of undeclared identifier 'V4L2_CID_CUR_LINK_FREQ'
     222 |                                                  V4L2_CID_CUR_LINK_FREQ, 0,
         |                                                  ^
   1 error generated.


vim +/V4L2_CID_CUR_LINK_FREQ +222 drivers/media/i2c/lt6911uxe.c

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

