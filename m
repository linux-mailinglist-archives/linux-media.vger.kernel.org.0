Return-Path: <linux-media+bounces-51078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D4D3B4F5
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 18:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 981E930150D6
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 17:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6DE32AABD;
	Mon, 19 Jan 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jR1iFfT8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2B21D3CD
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845425; cv=none; b=WHVuJ0Xv9URKvhQEXm/f+gqXqbOitOex0X0GwE53QiKaemI2dFfYi9Rm8ON7WZKhwUfqANH5BwMHvSth2+AdGA0SbdDLr7QKUqxEDcOpupSAPXufDGU3EWcfwfKNBXupEi/BbBsUO2YVP3dSd9HDe+bUjE5zIheYAMKfgvvJXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845425; c=relaxed/simple;
	bh=hCrqs1pY3U0IdYsTdm5o1T4YdrGbfH56/1QPzUqgwk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YCG2mjGv8Pp2YAOhiNPYuD04B1cSugjz+tAt5RdB0siuqusZtrPRfL+ZFOvNSpGf1vbEpvusjAWOn640S7cxQOS/TtGTpzp4AMfLPLRIGow2LjSzQ5QmnY8mjSkf8Uo/2VmEQ0MktIsEgC0iajzAYBiisMvmXHMU5BvniwYLX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jR1iFfT8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768845424; x=1800381424;
  h=date:from:to:cc:subject:message-id;
  bh=hCrqs1pY3U0IdYsTdm5o1T4YdrGbfH56/1QPzUqgwk8=;
  b=jR1iFfT8DuddTxjcG56O9OkKUEAiohckRlxFQKBSeXn4ScOngpqRFrez
   GQfnvRv1gYnanOPkujQQ0mI5G07oSvPDP2lDvEt1ZZnpFy7W0/d6gSuiL
   Mxm5cZQ9vB7qPfqr1ys5dXMw7L74PiNIrnOggv0o5kimzEznBGzYl5gNX
   3tbB+4WKCTapQLaHyUQueLCv1kwWahNORMZ1+QWErZ63jeGeHkvMl6goo
   wL+lm1qlraZFP6sThKx85Sk64qRDZXQyVGVujZvVoIf3grUrOwLp2Z6Ue
   oHx1o+v/kp1RN3B9VjAJxw2FmCT0yBqvx6k5bR4hBjSA9mHxNWrCMUqDI
   g==;
X-CSE-ConnectionGUID: B3VtkJrgQiG8+zvkmzXaTA==
X-CSE-MsgGUID: xxLi5akYRsGSOkM8LOheQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69962233"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69962233"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:57:03 -0800
X-CSE-ConnectionGUID: VujGPM7YTiK72ijdtQ537g==
X-CSE-MsgGUID: nFuRYAlZRSmZhA/KPlwyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237188575"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 09:57:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhtUq-00000000O8d-00Fz;
	Mon, 19 Jan 2026 17:57:00 +0000
Date: Tue, 20 Jan 2026 01:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 109/113]
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:541:14: warning: variable
 'first' set but not used
Message-ID: <202601200156.XCbBK9ms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 45316ce8af169db8834efe3f2bd997e28772c2df [109/113] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601200156.XCbBK9ms-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200156.XCbBK9ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200156.XCbBK9ms-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c: In function 'start_streaming':
>> drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:541:14: warning: variable 'first' set but not used [-Wunused-but-set-variable]
     541 |         bool first;
         |              ^~~~~


vim +/first +541 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

3c1dfb5a69cf83 Bingbu Cao   2024-01-31  532  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  533  static int start_streaming(struct vb2_queue *q, unsigned int count)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  534  {
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  535  	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  536  	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  537  	struct device *dev = &av->isys->adev->auxdev.dev;
d3bd039cd2a009 Bingbu Cao   2024-01-31  538  	const struct ipu6_isys_pixelformat *pfmt =
d3bd039cd2a009 Bingbu Cao   2024-01-31  539  		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
e660207a1d080c Sakari Ailus 2025-11-07  540  	struct media_pad *source_pad, *remote_pad;
7ff82d1f5490c1 Sakari Ailus 2025-12-11 @541  	bool first;
7ff82d1f5490c1 Sakari Ailus 2025-12-11  542  	int ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  543  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  544  	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
d3bd039cd2a009 Bingbu Cao   2024-01-31  545  		av->vdev.name, ipu6_isys_get_frame_width(av),
d3bd039cd2a009 Bingbu Cao   2024-01-31  546  		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  547  
e660207a1d080c Sakari Ailus 2025-11-07  548  	remote_pad = media_pad_remote_pad_unique(&av->pad);
e660207a1d080c Sakari Ailus 2025-11-07  549  	if (IS_ERR(remote_pad)) {
e660207a1d080c Sakari Ailus 2025-11-07  550  		dev_dbg(dev, "failed to get remote pad\n");
e660207a1d080c Sakari Ailus 2025-11-07  551  		ret = PTR_ERR(remote_pad);
e660207a1d080c Sakari Ailus 2025-11-07  552  		goto out_return_buffers;
e660207a1d080c Sakari Ailus 2025-11-07  553  	}
e660207a1d080c Sakari Ailus 2025-11-07  554  
e660207a1d080c Sakari Ailus 2025-11-07  555  	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
e660207a1d080c Sakari Ailus 2025-11-07  556  	if (IS_ERR(source_pad)) {
e660207a1d080c Sakari Ailus 2025-11-07  557  		dev_dbg(dev, "No external source entity\n");
e660207a1d080c Sakari Ailus 2025-11-07  558  		ret = PTR_ERR(source_pad);
e660207a1d080c Sakari Ailus 2025-11-07  559  		goto out_return_buffers;
e660207a1d080c Sakari Ailus 2025-11-07  560  	}
e660207a1d080c Sakari Ailus 2025-11-07  561  
45316ce8af169d Sakari Ailus 2025-12-01  562  	bool has_pipeline = (bool)video_device_pipeline(&av->vdev);
45316ce8af169d Sakari Ailus 2025-12-01  563  
45316ce8af169d Sakari Ailus 2025-12-01  564  	ret = video_device_pipeline_alloc_start(&av->vdev);
45316ce8af169d Sakari Ailus 2025-12-01  565  	if (ret < 0)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  566  		goto out_return_buffers;
45316ce8af169d Sakari Ailus 2025-12-01  567  
45316ce8af169d Sakari Ailus 2025-12-01  568  	first = !has_pipeline;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  569  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  570  	ret = ipu6_isys_link_fmt_validate(aq);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  571  	if (ret) {
4ff61c4ce93677 Sakari Ailus 2024-05-02  572  		dev_dbg(dev,
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  573  			"%s: link format validation failed (%d)\n",
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  574  			av->vdev.name, ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  575  		goto out_pipeline_stop;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  576  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  577  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  578  	ret = ipu6_isys_fw_open(av->isys);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  579  	if (ret)
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  580  		goto out_pipeline_stop;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  581  
2085a6131710b0 Sakari Ailus 2025-11-10  582  	ret = ipu6_isys_stream_start(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  583  	if (ret)
45316ce8af169d Sakari Ailus 2025-12-01  584  		goto out_fw_close;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  585  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  586  	return 0;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  587  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  588  out_fw_close:
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  589  	ipu6_isys_fw_close(av->isys);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  590  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  591  out_pipeline_stop:
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  592  	ipu6_isys_stream_cleanup(av);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  593  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  594  out_return_buffers:
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  595  	return_buffers(aq, VB2_BUF_STATE_QUEUED);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  596  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  597  	return ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  598  }
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  599  

:::::: The code at line 541 was first introduced by commit
:::::: 7ff82d1f5490c155b938c69a670296b08334bd49 media: ipu6: Remove nr_queues and nr_streaming fields in ipu6_isys_stream

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

