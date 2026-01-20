Return-Path: <linux-media+bounces-51099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79ED3C23F
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F2154A0C51
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 08:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215E63B8D6D;
	Tue, 20 Jan 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF92j4M8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57993559CA
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896414; cv=none; b=izmGBKIFOJJiF4Zi7H95RlQd9sdkUG6f+gB6eRPOm6oMCkX6hq+s0qO0uUrhgRx455QbYfSGlOXk4GK/b20A4Sz7W+TP6MAOERYiK3vuCW9WQ/pF/HEQBSErLSp5eEeUWJEoNea3zHDuRGBNFrwuonuRrtfIzc2yHctKnRmAgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896414; c=relaxed/simple;
	bh=Z3G82xCby4bZzS2x7NMyDD/j2z/bAzs6NbPILeSwbAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VqKDwXHG6NhBEY6c5GN29pW/v09+qCh5gEPcnZV5P89VFtHL1F4miS0p7k4lZWTCnLXhxI0aa/vmfWsw49tYD/LYQLBS97mluTWdUAHwiLRnzn9g4/OwqHbo1wJuXA6qGEiH4OpYcqTgWZabK4IE7fSnA9WFENaL/JEVLHVQ/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mF92j4M8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768896412; x=1800432412;
  h=date:from:to:cc:subject:message-id;
  bh=Z3G82xCby4bZzS2x7NMyDD/j2z/bAzs6NbPILeSwbAA=;
  b=mF92j4M8YMeC/dYBupxd18soDFkv37GHm9pe1XqN8HncDgMEEyFSOfs6
   t10lAq7HlUmCOmyY54EJOT4ifpJfKI/CsAE/FAkxkjObMeGg+eNn03/0P
   e17aqaqmzR0FTgQm73N6TVSsvnrQoKD4+nyg1sc+zouoxDT/00nmIGupt
   r9qrCt3YP5SWZTqWoN+8g/6GF4mkcCIw85nHX+qSULSnI0gS5i1T0+/d2
   SK46J76HsNQ/4Xf6LjqVm5rXthwPTBpBKb0S4bd2ev+DN3YUc5Q+3ybPp
   k8kPnD+1wWaQjklTrD3Hfbm+266URI+zPLpdfTJ9kIALhw45wUS0+l7GH
   A==;
X-CSE-ConnectionGUID: O27Q7WO3Rm+A/1QOL7KJOA==
X-CSE-MsgGUID: beqg+eVWSWi7UwUACdycVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80400156"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80400156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 00:06:52 -0800
X-CSE-ConnectionGUID: CyRl13YDSgiPoc0MB8UNwg==
X-CSE-MsgGUID: cI1qX4udTyWxrTnXojuElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="236740113"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 00:06:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi6lA-00000000OiL-3qdD;
	Tue, 20 Jan 2026 08:06:44 +0000
Date: Tue, 20 Jan 2026 16:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 95/113]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:3: error: call to
 undeclared function 'close_streaming_firmware'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202601201651.C9Hhgyud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 2085a6131710b0e5e886b3d14118d986c34b2087 [95/113] media: ipu6: Move streaming control to CSI-2 receiver driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260120/202601201651.C9Hhgyud-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201651.C9Hhgyud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201651.C9Hhgyud-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:3: error: call to undeclared function 'close_streaming_firmware'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1026 |                 close_streaming_firmware(av);
         |                 ^
   1 error generated.


vim +/close_streaming_firmware +1026 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

3c1dfb5a69cf83 Bingbu Cao   2024-01-31   986  
2085a6131710b0 Sakari Ailus 2025-11-10   987  int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   988  {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   989  	struct v4l2_subdev_krouting *routing;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   990  	struct ipu6_isys_stream *stream = av->stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   991  	struct v4l2_subdev_state *subdev_state;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   992  	struct device *dev = &av->isys->adev->auxdev.dev;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   993  	struct v4l2_subdev *sd;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   994  	struct media_pad *r_pad;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   995  	u32 sink_pad, sink_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   996  	u64 r_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   997  	u64 stream_mask = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   998  	int ret = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   999  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1000  	dev_dbg(dev, "set stream: %d\n", state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1001  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1002  	sd = &stream->asd->sd;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1003  	r_pad = media_pad_remote_pad_first(&av->pad);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1004  	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1005  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1006  	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1007  	routing = &subdev_state->routing;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1008  	ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1009  						    r_stream, &sink_pad,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1010  						    &sink_stream);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1011  	v4l2_subdev_unlock_state(subdev_state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1012  	if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1013  		return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1014  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1015  	stream_mask = get_stream_mask_by_pipeline(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1016  	if (!state) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1017  		/* stop sub-device which connects with video */
3a5c59ad926b89 Sakari Ailus 2024-05-30  1018  		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
3a5c59ad926b89 Sakari Ailus 2024-05-30  1019  			sd->name, r_pad->index, stream_mask);
3a5c59ad926b89 Sakari Ailus 2024-05-30  1020  		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
3a5c59ad926b89 Sakari Ailus 2024-05-30  1021  						  stream_mask);
2b08b7007e55bd Sakari Ailus 2026-01-07  1022  		if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1023  			dev_err(dev, "stream off %s failed with %d\n", sd->name,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1024  				ret);
2b08b7007e55bd Sakari Ailus 2026-01-07  1025  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31 @1026  		close_streaming_firmware(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1027  	} else {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1028  		/* start sub-device which connects with video */
3a5c59ad926b89 Sakari Ailus 2024-05-30  1029  		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
3a5c59ad926b89 Sakari Ailus 2024-05-30  1030  			r_pad->index, stream_mask);
3a5c59ad926b89 Sakari Ailus 2024-05-30  1031  		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
2085a6131710b0 Sakari Ailus 2025-11-10  1032  		if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1033  			dev_err(dev, "stream on %s failed with %d\n", sd->name,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1034  				ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1035  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1036  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1037  	av->streaming = state;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1038  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1039  	return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1040  }
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1041  

:::::: The code at line 1026 was first introduced by commit
:::::: 3c1dfb5a69cf836f513a2a49113ee946a4b9d95d media: intel/ipu6: input system video nodes and buffer queues

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

