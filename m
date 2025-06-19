Return-Path: <linux-media+bounces-35331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393DDAE05A5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9F73A68ED
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE6E23D2BC;
	Thu, 19 Jun 2025 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBu3+7LU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DF122F38E
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335837; cv=none; b=qmDw3RRn2VVJA9bjahL9GVOFHv1OYkeT7fS2UdMGOT7tJq0XcR+7/ushM/8FHYkDtWMY9mBxd/86VybhVA8jpA2b9+DUpfj5a+r3AJ6lHXzuxMJT+hiAlk2lZHoqx49iN6Cq23v2WocE7dJzAEdT27J4OfHNAgtY8aTezxa3a7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335837; c=relaxed/simple;
	bh=0QJAMmfXDrawq3qYw9ljtYencMx4d7TtQEbbS+QLU5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6dKOVejmL5zih4tUr5gDTNeCYGda+mOeXTpWpRW0ADcqRJlOk1xWPPUjLvWEdLsWPyRuRChH1ag9YiGQqa4kh1unczp1Bg/kkQde34wppXrzZjU5dybxc0DLBMmXK0zTAdMYfMP+uagzgcy9uP1hNdXabgnvx/9xvQfOkVQBAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBu3+7LU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335836; x=1781871836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0QJAMmfXDrawq3qYw9ljtYencMx4d7TtQEbbS+QLU5Y=;
  b=GBu3+7LU04ddwCE3Ds33NrD0JCvMaK0LFpxt4P55hPdHLeY6dT5ZbcKZ
   EPabkagRKGuXzfp1dJVH56D63E0Hb7YndlwoB14aKxeoy7Als2UNCItXS
   tkxMZ2rFsaCPo7J7DXPrSeWpYyn72Y0rUVYtmSCeVziM2XMi/3uOae9rR
   vPL8BeqRTQ+nGmBDDfVP1Oq6fTRoNZ5f2fVrzcE8z+oznLA8j4deL7cjJ
   n3/Q7VVbL7Eaaw+8w3/V0ZbZSifRx0ST40hOJOqGbLPFX0kqQLf9jMlYq
   L+tZTWtJHJepRO/OwSwVQ8PNYpJ68bGfgnCo/zxOiJs4h+7E2vQXdg3B4
   g==;
X-CSE-ConnectionGUID: AvpAj1SwRMKg2OTXfoV9aA==
X-CSE-MsgGUID: JmvdXy7XSfiUqhiFtGQsZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52678357"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52678357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:23:55 -0700
X-CSE-ConnectionGUID: ZbxDFBjbTGGFIZ3RQU8Xjw==
X-CSE-MsgGUID: mW35Cv3sRDm810u41lDGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154915200"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jun 2025 05:23:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSEJ4-000KkI-0G;
	Thu, 19 Jun 2025 12:23:50 +0000
Date: Thu, 19 Jun 2025 20:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bingbu.cao@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 03/13] media: ipu6: Enable and disable each stream at
 CSI-2 subdev source pad
Message-ID: <202506192043.sWSo3Ycl-lkp@intel.com>
References: <20250619081546.1582969-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-4-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master v6.16-rc2 next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Use-correct-pads-for-xlate_streams/20250619-161847
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619081546.1582969-4-sakari.ailus%40linux.intel.com
patch subject: [PATCH 03/13] media: ipu6: Enable and disable each stream at CSI-2 subdev source pad
config: i386-buildonly-randconfig-005-20250619 (https://download.01.org/0day-ci/archive/20250619/202506192043.sWSo3Ycl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506192043.sWSo3Ycl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506192043.sWSo3Ycl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:996:6: warning: variable 'stream_mask' set but not used [-Wunused-but-set-variable]
     996 |         u64 stream_mask = 0;
         |             ^
   1 warning generated.


vim +/stream_mask +996 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

3c1dfb5a69cf83 Bingbu Cao   2024-01-31   983  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   984  int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   985  				  struct ipu6_isys_buffer_list *bl)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   986  {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   987  	struct v4l2_subdev_krouting *routing;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   988  	struct ipu6_isys_stream *stream = av->stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   989  	struct v4l2_subdev_state *subdev_state;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   990  	struct device *dev = &av->isys->adev->auxdev.dev;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   991  	struct v4l2_subdev *sd;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   992  	struct media_pad *r_pad;
e232e72fbaa788 Sakari Ailus 2025-06-19   993  	unsigned int i;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   994  	u32 sink_pad, sink_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   995  	u64 r_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  @996  	u64 stream_mask = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   997  	int ret = 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   998  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31   999  	dev_dbg(dev, "set stream: %d\n", state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1000  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1001  	if (WARN(!stream->source_entity, "No source entity for stream\n"))
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1002  		return -ENODEV;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1003  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1004  	sd = &stream->asd->sd;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1005  	r_pad = media_pad_remote_pad_first(&av->pad);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1006  	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1007  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1008  	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1009  	routing = &subdev_state->routing;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1010  	ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1011  						    r_stream, &sink_pad,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1012  						    &sink_stream);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1013  	v4l2_subdev_unlock_state(subdev_state);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1014  	if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1015  		return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1016  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1017  	stream_mask = get_stream_mask_by_pipeline(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1018  	if (!state) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1019  		stop_streaming_firmware(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1020  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1021  		/* stop sub-device which connects with video */
e232e72fbaa788 Sakari Ailus 2025-06-19  1022  		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
e232e72fbaa788 Sakari Ailus 2025-06-19  1023  			if (!media_pad_pipeline(&sd->entity.pads[i]))
e232e72fbaa788 Sakari Ailus 2025-06-19  1024  				continue;
e232e72fbaa788 Sakari Ailus 2025-06-19  1025  			ret = v4l2_subdev_disable_streams(sd, i, 1U);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1026  			if (ret) {
e232e72fbaa788 Sakari Ailus 2025-06-19  1027  				dev_err(dev, "stream off %s failed with %d\n",
e232e72fbaa788 Sakari Ailus 2025-06-19  1028  					sd->name, ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1029  				return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1030  			}
e232e72fbaa788 Sakari Ailus 2025-06-19  1031  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1032  		close_streaming_firmware(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1033  	} else {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1034  		ret = start_stream_firmware(av, bl);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1035  		if (ret) {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1036  			dev_err(dev, "start stream of firmware failed\n");
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1037  			return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1038  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1039  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1040  		/* start sub-device which connects with video */
e232e72fbaa788 Sakari Ailus 2025-06-19  1041  		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
e232e72fbaa788 Sakari Ailus 2025-06-19  1042  			if (!media_pad_pipeline(&sd->entity.pads[i]))
e232e72fbaa788 Sakari Ailus 2025-06-19  1043  				continue;
e232e72fbaa788 Sakari Ailus 2025-06-19  1044  			ret = v4l2_subdev_enable_streams(sd, i, 1U);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1045  			if (ret) {
e232e72fbaa788 Sakari Ailus 2025-06-19  1046  				dev_err(dev, "stream on %s failed with %d\n",
e232e72fbaa788 Sakari Ailus 2025-06-19  1047  					sd->name, ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1048  				goto out_media_entity_stop_streaming_firmware;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1049  			}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1050  		}
e232e72fbaa788 Sakari Ailus 2025-06-19  1051  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1052  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1053  	av->streaming = state;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1054  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1055  	return 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1056  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1057  out_media_entity_stop_streaming_firmware:
e232e72fbaa788 Sakari Ailus 2025-06-19  1058  	while (i-- > CSI2_PAD_SRC) {
e232e72fbaa788 Sakari Ailus 2025-06-19  1059  		int ret2;
e232e72fbaa788 Sakari Ailus 2025-06-19  1060  
e232e72fbaa788 Sakari Ailus 2025-06-19  1061  		if (!media_pad_pipeline(&sd->entity.pads[i]))
e232e72fbaa788 Sakari Ailus 2025-06-19  1062  			continue;
e232e72fbaa788 Sakari Ailus 2025-06-19  1063  		ret2 = v4l2_subdev_disable_streams(sd, i, 1U);
e232e72fbaa788 Sakari Ailus 2025-06-19  1064  		dev_err(dev, "stream off %s failed with %d\n", sd->name, ret2);
e232e72fbaa788 Sakari Ailus 2025-06-19  1065  	}
e232e72fbaa788 Sakari Ailus 2025-06-19  1066  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1067  	stop_streaming_firmware(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1068  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1069  	return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1070  }
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  1071  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

