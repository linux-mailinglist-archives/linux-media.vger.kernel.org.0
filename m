Return-Path: <linux-media+bounces-51073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAEED3B333
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 18:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 568823088DBA
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 16:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674283033CC;
	Mon, 19 Jan 2026 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvDaZ2IV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF62279DC3
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841462; cv=none; b=T62gO9XzcqanOPkubB16Y2Mx1O9YBmSeX6VgScdUfl6PxtaqJ/XpxtUOkP6h/qoUB78yqv8L+4L38HfYSu/RUNJ/hWIpW6FeqcpUgOtvh4gDY7EpQU9nJVVSMpOWfQkJgqIzLaxMmoqvPZf8Mst70Z8vi+Qon9zNipBCj5WKiSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841462; c=relaxed/simple;
	bh=nX07GncPo0u5I2+4OSUddBAUDPLKEf2x3P2JgzvbumU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oWSLq4co5yiKELUyF/sI8vvPkWkBngvgfyrybxuk6aQVkmV1Ubb0LrRhREL0Xrjo99AosO2f3kPwZMN/kno9CCWpoKIZTQ0Qc5SGGAGq0A45e9Is77VgFqw9GhqDCm2rBx9HWZ4D9FjrG0FDXsF6pQt9N6Dn+uisRjY2itLMan8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvDaZ2IV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768841460; x=1800377460;
  h=date:from:to:cc:subject:message-id;
  bh=nX07GncPo0u5I2+4OSUddBAUDPLKEf2x3P2JgzvbumU=;
  b=YvDaZ2IVGEDi6Vl0CQ17R2I0pGEM1G2GXA/xY4KnOM7tzSWILvoPlvtO
   z65vnmMAOy4xAqzPii9sFEDUi1rr7UYQUlzGUyABzakZ38rXNgjNQYoh9
   INJCpyiykNom/6MFu+4TrW+k+fiPpTLeCsfAwgqdJEGAAF3JXFzC+abNT
   Sl+lwvrjbpy5vyGsKxGdajkvBZi7VRBlGMaDEUMt8lSpRqtajX1iHDDGL
   drlOv9guFGGrvWqdQczs4/zMnfM/M6FShaxhTautkYW7HbEoX4Sgxf0FR
   R6XxGm489sDMM6ECX6dH8j/Q03eLX9c5D2nC47HCXQfA1yuJ8KN4ehhPa
   g==;
X-CSE-ConnectionGUID: p8PpWoi9SWyW43AzoV2dNA==
X-CSE-MsgGUID: Parm8evaSRuEQEGqu0sk7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57609703"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57609703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:51:00 -0800
X-CSE-ConnectionGUID: Lceet55YR8mAJjkvz5uCvA==
X-CSE-MsgGUID: VbmjVPTxTfuj4bA/yeS70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236584882"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 08:50:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhsSt-00000000O4f-2HG6;
	Mon, 19 Jan 2026 16:50:55 +0000
Date: Tue, 20 Jan 2026 00:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 95/113]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:17: error: implicit
 declaration of function 'close_streaming_firmware'; did you mean
 'ipu6_isys_close_streaming_firmware'?
Message-ID: <202601200058.QeQb8IRb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 2085a6131710b0e5e886b3d14118d986c34b2087 [95/113] media: ipu6: Move streaming control to CSI-2 receiver driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601200058.QeQb8IRb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200058.QeQb8IRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200058.QeQb8IRb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-isys-video.c: In function 'ipu6_isys_video_set_streaming':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:17: error: implicit declaration of function 'close_streaming_firmware'; did you mean 'ipu6_isys_close_streaming_firmware'? [-Wimplicit-function-declaration]
    1026 |                 close_streaming_firmware(av);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 ipu6_isys_close_streaming_firmware


vim +1026 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

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

