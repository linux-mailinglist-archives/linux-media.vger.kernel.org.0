Return-Path: <linux-media+bounces-6140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B386C86B
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 12:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01B01C20C70
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 11:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C487C6F6;
	Thu, 29 Feb 2024 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu61MAPn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE87C6EE
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709207294; cv=none; b=M4Obc8TSjC7WDskWWsl/65R7dalZ5SN2ESe8W0uTkg1KchRGVTm2WOI0yERVFWlvICUN/taxWichuLFYm/4F9hxcheworYRrPkJqZqKNYu55BFfFaqFVt/I9exHona9fulzsbiUvihbQIN5R755X1NGWfAgbsqIogxs2sRo0tbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709207294; c=relaxed/simple;
	bh=IpNGHPVrXlWkQZU3Gyz5qgSdkeyMiWqbv7C8LCf/c90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaGd6EN3pWGuZwMm6DVp9APlQzxBfxi9hmAbKSpCJF50/ks2T8X6+lgfiAbp/l5vk89D777KQI4dyx54tBOpZE+MzVCwX5hyqNnkI3XAKsXeJOGvAuvOPjshTRBBDdlGyd212P+IARnjQFJAg4/NT33J6jbQ6Xur6BxHQ4avBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yu61MAPn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709207291; x=1740743291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IpNGHPVrXlWkQZU3Gyz5qgSdkeyMiWqbv7C8LCf/c90=;
  b=Yu61MAPnoaUYNR2x7j9qRTevv/q0fuo8kuVOxImHGr8DMWm5e5vL8Ln2
   ZZxj/sCzxUXRG0uI7qOO2ynWZ32W0Po6DvZaVxaAnci0Tnlyi1eCZeJtV
   vZfJhSvhgnUzVDKwKcVai6DVO0PEsg70XUN2d0XtnNJKxn0mZTgNejF0n
   oLU9CuuCwY+8k1jLh5rBMUxk0mbnfpUgtOpDfMHv/YMYff2l+N4CHh22K
   bCie3akiWDs1CFtBhlp/hpptCud6XRS4vAWxPmQE0S5BfcS1lW4UsgxgI
   qfZ6y50a9NUMOsCv/0vDzOnjyQ6MPRiNACUkvYgh8VTjb0vD0HA2b34It
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14307068"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14307068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 03:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12370586"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 03:48:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfetS-000Cu3-1x;
	Thu, 29 Feb 2024 11:48:06 +0000
Date: Thu, 29 Feb 2024 19:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: [sailus-media-tree:ipu6 59/68]
 drivers/media/pci/intel/ipu6/ipu6-isys.c:796: undefined reference to
 `v4l2_device_register'
Message-ID: <202402291945.uaBiqrXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   3733f0aae05e6ac2c55192a4159bc81c5aaf5681
commit: d6c211a676c0a2de6ddfde4d7589878140a0371e [59/68] media: intel/ipu6: add Kconfig and Makefile
config: x86_64-randconfig-075-20240229 (https://download.01.org/0day-ci/archive/20240229/202402291945.uaBiqrXL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291945.uaBiqrXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291945.uaBiqrXL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_register_devices':
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:796: undefined reference to `v4l2_device_register'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:825: undefined reference to `v4l2_device_unregister'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_notifier_init':
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:717: undefined reference to `v4l2_async_nf_init'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:731: undefined reference to `v4l2_fwnode_endpoint_parse'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:737: undefined reference to `__v4l2_async_nf_add_fwnode_remote'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:761: undefined reference to `v4l2_async_nf_register'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:764: undefined reference to `v4l2_async_nf_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_complete_ext_device_registration':
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:137: undefined reference to `v4l2_device_unregister_subdev'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_unregister_devices':
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:840: undefined reference to `v4l2_device_unregister'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_notifier_cleanup':
>> drivers/media/pci/intel/ipu6/ipu6-isys.c:772: undefined reference to `v4l2_async_nf_unregister'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:773: undefined reference to `v4l2_async_nf_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `v4l2_device_register_subdev_nodes':
   include/media/v4l2-device.h:201: undefined reference to `__v4l2_device_register_subdev_nodes'
   ld: include/media/v4l2-device.h:201: undefined reference to `__v4l2_device_register_subdev_nodes'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_get_sel':
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:444: undefined reference to `v4l2_subdev_state_get_opposite_stream_format'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:450: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_set_sel':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:395: undefined reference to `v4l2_subdev_state_get_opposite_stream_format'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:401: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:405: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_cleanup':
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:501: undefined reference to `v4l2_device_unregister_subdev'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:502: undefined reference to `v4l2_subdev_cleanup'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:501: undefined reference to `v4l2_device_unregister_subdev'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:502: undefined reference to `v4l2_subdev_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_init':
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:530: undefined reference to `__v4l2_subdev_init_finalize'
>> ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:536: undefined reference to `v4l2_device_register_subdev'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_sof_event_by_stream':
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:560: undefined reference to `v4l2_event_queue'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_get_remote_desc':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:599: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:599: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:599: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:599: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:599: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `csi2_subscribe_event':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:110: undefined reference to `v4l2_event_subscribe'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:112: undefined reference to `v4l2_ctrl_subscribe_event'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_get_link_freq':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:95: undefined reference to `v4l2_get_link_freq'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x490): undefined reference to `v4l2_subdev_link_validate'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x498): undefined reference to `v4l2_subdev_has_pad_interdep'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x538): undefined reference to `v4l2_subdev_get_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x700): undefined reference to `v4l2_event_subdev_unsubscribe'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_drvdata':
   include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `link_validate':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:295: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_configure_stream_watermark':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:664: undefined reference to `v4l2_g_ctrl'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_set_streaming':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:905: undefined reference to `v4l2_subdev_routing_find_opposite_end'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:921: undefined reference to `v4l2_subdev_disable_streams'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:932: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:932: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:948: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:948: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:958: undefined reference to `v4l2_subdev_enable_streams'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:973: undefined reference to `v4l2_subdev_disable_streams'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:932: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:948: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_setup_video':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1120: undefined reference to `__v4l2_subdev_next_active_route'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1160: undefined reference to `video_device_pipeline_start'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1158: undefined reference to `video_device_pipeline_alloc_start'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1168: undefined reference to `video_device_pipeline_stop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1208: undefined reference to `video_device_release_empty'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_register_device':
   include/media/v4l2-dev.h:383: undefined reference to `__video_register_device'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1229: undefined reference to `vb2_video_unregister_device'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1233: undefined reference to `vb2_queue_release'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1243: undefined reference to `vb2_video_unregister_device'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_open':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:104: undefined reference to `v4l2_fh_open'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb18): undefined reference to `vb2_fop_poll'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb20): undefined reference to `video_ioctl2'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb38): undefined reference to `vb2_fop_mmap'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb48): undefined reference to `vb2_fop_release'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd50): undefined reference to `vb2_ioctl_reqbufs'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd58): undefined reference to `vb2_ioctl_querybuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd60): undefined reference to `vb2_ioctl_qbuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd68): undefined reference to `vb2_ioctl_expbuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd70): undefined reference to `vb2_ioctl_dqbuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd78): undefined reference to `vb2_ioctl_create_bufs'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd80): undefined reference to `vb2_ioctl_prepare_buf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xda0): undefined reference to `vb2_ioctl_streamon'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xda8): undefined reference to `vb2_ioctl_streamoff'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o: in function `ipu6_isys_stream_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:512: undefined reference to `video_device_pipeline_stop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:512: undefined reference to `video_device_pipeline_stop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o: in function `ipu6_isys_queue_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:807: undefined reference to `vb2_queue_init'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o:(.rodata+0x408): undefined reference to `vb2_ops_wait_prepare'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o:(.rodata+0x410): undefined reference to `vb2_ops_wait_finish'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `subdev_set_routing':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:219: undefined reference to `v4l2_subdev_routing_validate'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:224: undefined reference to `v4l2_subdev_set_routing_with_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_subdev_set_fmt':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:154: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:164: undefined reference to `v4l2_subdev_state_get_opposite_stream_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:171: undefined reference to `v4l2_subdev_routing_find_opposite_end'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:179: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:136: undefined reference to `v4l2_subdev_get_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_get_stream_pad_fmt':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:237: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_get_stream_pad_crop':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:255: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `subdev_set_routing':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:219: undefined reference to `v4l2_subdev_routing_validate'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_subdev_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:327: undefined reference to `v4l2_subdev_init'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:354: undefined reference to `v4l2_ctrl_handler_init_class'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:372: undefined reference to `v4l2_ctrl_handler_free'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `subdev_set_routing':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:224: undefined reference to `v4l2_subdev_set_routing_with_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_subdev_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:383: undefined reference to `v4l2_ctrl_handler_free'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - VIDEO_INTEL_IPU6 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]


vim +796 drivers/media/pci/intel/ipu6/ipu6-isys.c

365931dd66c449 Bingbu Cao 2024-01-31  708  
365931dd66c449 Bingbu Cao 2024-01-31  709  #define ISYS_MAX_PORTS 8
365931dd66c449 Bingbu Cao 2024-01-31  710  static int isys_notifier_init(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  711  {
365931dd66c449 Bingbu Cao 2024-01-31  712  	struct ipu6_device *isp = isys->adev->isp;
365931dd66c449 Bingbu Cao 2024-01-31  713  	struct device *dev = &isp->pdev->dev;
365931dd66c449 Bingbu Cao 2024-01-31  714  	unsigned int i;
365931dd66c449 Bingbu Cao 2024-01-31  715  	int ret;
365931dd66c449 Bingbu Cao 2024-01-31  716  
365931dd66c449 Bingbu Cao 2024-01-31 @717  	v4l2_async_nf_init(&isys->notifier, &isys->v4l2_dev);
365931dd66c449 Bingbu Cao 2024-01-31  718  
365931dd66c449 Bingbu Cao 2024-01-31  719  	for (i = 0; i < ISYS_MAX_PORTS; i++) {
365931dd66c449 Bingbu Cao 2024-01-31  720  		struct v4l2_fwnode_endpoint vep = {
365931dd66c449 Bingbu Cao 2024-01-31  721  			.bus_type = V4L2_MBUS_CSI2_DPHY
365931dd66c449 Bingbu Cao 2024-01-31  722  		};
365931dd66c449 Bingbu Cao 2024-01-31  723  		struct sensor_async_sd *s_asd;
365931dd66c449 Bingbu Cao 2024-01-31  724  		struct fwnode_handle *ep;
365931dd66c449 Bingbu Cao 2024-01-31  725  
365931dd66c449 Bingbu Cao 2024-01-31  726  		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), i, 0,
365931dd66c449 Bingbu Cao 2024-01-31  727  						FWNODE_GRAPH_ENDPOINT_NEXT);
365931dd66c449 Bingbu Cao 2024-01-31  728  		if (!ep)
365931dd66c449 Bingbu Cao 2024-01-31  729  			continue;
365931dd66c449 Bingbu Cao 2024-01-31  730  
365931dd66c449 Bingbu Cao 2024-01-31 @731  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
365931dd66c449 Bingbu Cao 2024-01-31  732  		if (ret) {
365931dd66c449 Bingbu Cao 2024-01-31  733  			dev_err(dev, "fwnode endpoint parse failed: %d\n", ret);
365931dd66c449 Bingbu Cao 2024-01-31  734  			goto err_parse;
365931dd66c449 Bingbu Cao 2024-01-31  735  		}
365931dd66c449 Bingbu Cao 2024-01-31  736  
365931dd66c449 Bingbu Cao 2024-01-31 @737  		s_asd = v4l2_async_nf_add_fwnode_remote(&isys->notifier, ep,
365931dd66c449 Bingbu Cao 2024-01-31  738  							struct sensor_async_sd);
365931dd66c449 Bingbu Cao 2024-01-31  739  		if (IS_ERR(s_asd)) {
365931dd66c449 Bingbu Cao 2024-01-31  740  			ret = PTR_ERR(s_asd);
365931dd66c449 Bingbu Cao 2024-01-31  741  			dev_err(dev, "add remove fwnode failed: %d\n", ret);
365931dd66c449 Bingbu Cao 2024-01-31  742  			goto err_parse;
365931dd66c449 Bingbu Cao 2024-01-31  743  		}
365931dd66c449 Bingbu Cao 2024-01-31  744  
365931dd66c449 Bingbu Cao 2024-01-31  745  		s_asd->csi2.port = vep.base.port;
365931dd66c449 Bingbu Cao 2024-01-31  746  		s_asd->csi2.nlanes = vep.bus.mipi_csi2.num_data_lanes;
365931dd66c449 Bingbu Cao 2024-01-31  747  
365931dd66c449 Bingbu Cao 2024-01-31  748  		dev_dbg(dev, "remote endpoint port %d with %d lanes added\n",
365931dd66c449 Bingbu Cao 2024-01-31  749  			s_asd->csi2.port, s_asd->csi2.nlanes);
365931dd66c449 Bingbu Cao 2024-01-31  750  
365931dd66c449 Bingbu Cao 2024-01-31  751  		fwnode_handle_put(ep);
365931dd66c449 Bingbu Cao 2024-01-31  752  
365931dd66c449 Bingbu Cao 2024-01-31  753  		continue;
365931dd66c449 Bingbu Cao 2024-01-31  754  
365931dd66c449 Bingbu Cao 2024-01-31  755  err_parse:
365931dd66c449 Bingbu Cao 2024-01-31  756  		fwnode_handle_put(ep);
365931dd66c449 Bingbu Cao 2024-01-31  757  		return ret;
365931dd66c449 Bingbu Cao 2024-01-31  758  	}
365931dd66c449 Bingbu Cao 2024-01-31  759  
365931dd66c449 Bingbu Cao 2024-01-31  760  	isys->notifier.ops = &isys_async_ops;
365931dd66c449 Bingbu Cao 2024-01-31 @761  	ret = v4l2_async_nf_register(&isys->notifier);
365931dd66c449 Bingbu Cao 2024-01-31  762  	if (ret) {
365931dd66c449 Bingbu Cao 2024-01-31  763  		dev_err(dev, "failed to register async notifier : %d\n", ret);
365931dd66c449 Bingbu Cao 2024-01-31 @764  		v4l2_async_nf_cleanup(&isys->notifier);
365931dd66c449 Bingbu Cao 2024-01-31  765  	}
365931dd66c449 Bingbu Cao 2024-01-31  766  
365931dd66c449 Bingbu Cao 2024-01-31  767  	return ret;
365931dd66c449 Bingbu Cao 2024-01-31  768  }
365931dd66c449 Bingbu Cao 2024-01-31  769  
365931dd66c449 Bingbu Cao 2024-01-31  770  static void isys_notifier_cleanup(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  771  {
365931dd66c449 Bingbu Cao 2024-01-31 @772  	v4l2_async_nf_unregister(&isys->notifier);
365931dd66c449 Bingbu Cao 2024-01-31  773  	v4l2_async_nf_cleanup(&isys->notifier);
365931dd66c449 Bingbu Cao 2024-01-31  774  }
365931dd66c449 Bingbu Cao 2024-01-31  775  
365931dd66c449 Bingbu Cao 2024-01-31  776  static int isys_register_devices(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  777  {
365931dd66c449 Bingbu Cao 2024-01-31  778  	struct device *dev = &isys->adev->auxdev.dev;
365931dd66c449 Bingbu Cao 2024-01-31  779  	struct pci_dev *pdev = isys->adev->isp->pdev;
365931dd66c449 Bingbu Cao 2024-01-31  780  	int ret;
365931dd66c449 Bingbu Cao 2024-01-31  781  
365931dd66c449 Bingbu Cao 2024-01-31  782  	isys->media_dev.dev = dev;
365931dd66c449 Bingbu Cao 2024-01-31  783  	media_device_pci_init(&isys->media_dev,
365931dd66c449 Bingbu Cao 2024-01-31  784  			      pdev, IPU6_MEDIA_DEV_MODEL_NAME);
365931dd66c449 Bingbu Cao 2024-01-31  785  
365931dd66c449 Bingbu Cao 2024-01-31  786  	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
365931dd66c449 Bingbu Cao 2024-01-31  787  		sizeof(isys->v4l2_dev.name));
365931dd66c449 Bingbu Cao 2024-01-31  788  
365931dd66c449 Bingbu Cao 2024-01-31  789  	ret = media_device_register(&isys->media_dev);
365931dd66c449 Bingbu Cao 2024-01-31  790  	if (ret < 0)
365931dd66c449 Bingbu Cao 2024-01-31  791  		goto out_media_device_unregister;
365931dd66c449 Bingbu Cao 2024-01-31  792  
365931dd66c449 Bingbu Cao 2024-01-31  793  	isys->v4l2_dev.mdev = &isys->media_dev;
365931dd66c449 Bingbu Cao 2024-01-31  794  	isys->v4l2_dev.ctrl_handler = NULL;
365931dd66c449 Bingbu Cao 2024-01-31  795  
365931dd66c449 Bingbu Cao 2024-01-31 @796  	ret = v4l2_device_register(dev->parent, &isys->v4l2_dev);
365931dd66c449 Bingbu Cao 2024-01-31  797  	if (ret < 0)
365931dd66c449 Bingbu Cao 2024-01-31  798  		goto out_media_device_unregister;
365931dd66c449 Bingbu Cao 2024-01-31  799  
365931dd66c449 Bingbu Cao 2024-01-31  800  	ret = isys_register_video_devices(isys);
365931dd66c449 Bingbu Cao 2024-01-31  801  	if (ret)
365931dd66c449 Bingbu Cao 2024-01-31  802  		goto out_v4l2_device_unregister;
365931dd66c449 Bingbu Cao 2024-01-31  803  
365931dd66c449 Bingbu Cao 2024-01-31  804  	ret = isys_csi2_register_subdevices(isys);
365931dd66c449 Bingbu Cao 2024-01-31  805  	if (ret)
365931dd66c449 Bingbu Cao 2024-01-31  806  		goto out_isys_unregister_video_device;
365931dd66c449 Bingbu Cao 2024-01-31  807  
365931dd66c449 Bingbu Cao 2024-01-31  808  	ret = isys_csi2_create_media_links(isys);
365931dd66c449 Bingbu Cao 2024-01-31  809  	if (ret)
365931dd66c449 Bingbu Cao 2024-01-31  810  		goto out_isys_unregister_subdevices;
365931dd66c449 Bingbu Cao 2024-01-31  811  
365931dd66c449 Bingbu Cao 2024-01-31  812  	ret = isys_notifier_init(isys);
365931dd66c449 Bingbu Cao 2024-01-31  813  	if (ret)
365931dd66c449 Bingbu Cao 2024-01-31  814  		goto out_isys_unregister_subdevices;
365931dd66c449 Bingbu Cao 2024-01-31  815  
365931dd66c449 Bingbu Cao 2024-01-31  816  	return 0;
365931dd66c449 Bingbu Cao 2024-01-31  817  
365931dd66c449 Bingbu Cao 2024-01-31  818  out_isys_unregister_subdevices:
365931dd66c449 Bingbu Cao 2024-01-31  819  	isys_csi2_unregister_subdevices(isys);
365931dd66c449 Bingbu Cao 2024-01-31  820  
365931dd66c449 Bingbu Cao 2024-01-31  821  out_isys_unregister_video_device:
365931dd66c449 Bingbu Cao 2024-01-31  822  	isys_unregister_video_devices(isys);
365931dd66c449 Bingbu Cao 2024-01-31  823  
365931dd66c449 Bingbu Cao 2024-01-31  824  out_v4l2_device_unregister:
365931dd66c449 Bingbu Cao 2024-01-31 @825  	v4l2_device_unregister(&isys->v4l2_dev);
365931dd66c449 Bingbu Cao 2024-01-31  826  
365931dd66c449 Bingbu Cao 2024-01-31  827  out_media_device_unregister:
365931dd66c449 Bingbu Cao 2024-01-31  828  	media_device_unregister(&isys->media_dev);
365931dd66c449 Bingbu Cao 2024-01-31  829  	media_device_cleanup(&isys->media_dev);
365931dd66c449 Bingbu Cao 2024-01-31  830  
365931dd66c449 Bingbu Cao 2024-01-31  831  	dev_err(dev, "failed to register isys devices\n");
365931dd66c449 Bingbu Cao 2024-01-31  832  
365931dd66c449 Bingbu Cao 2024-01-31  833  	return ret;
365931dd66c449 Bingbu Cao 2024-01-31  834  }
365931dd66c449 Bingbu Cao 2024-01-31  835  
365931dd66c449 Bingbu Cao 2024-01-31  836  static void isys_unregister_devices(struct ipu6_isys *isys)
365931dd66c449 Bingbu Cao 2024-01-31  837  {
365931dd66c449 Bingbu Cao 2024-01-31  838  	isys_unregister_video_devices(isys);
365931dd66c449 Bingbu Cao 2024-01-31  839  	isys_csi2_unregister_subdevices(isys);
365931dd66c449 Bingbu Cao 2024-01-31 @840  	v4l2_device_unregister(&isys->v4l2_dev);
365931dd66c449 Bingbu Cao 2024-01-31  841  	media_device_unregister(&isys->media_dev);
365931dd66c449 Bingbu Cao 2024-01-31  842  	media_device_cleanup(&isys->media_dev);
365931dd66c449 Bingbu Cao 2024-01-31  843  }
365931dd66c449 Bingbu Cao 2024-01-31  844  

:::::: The code at line 796 was first introduced by commit
:::::: 365931dd66c449c09eaf98792640b16ab4578280 media: intel/ipu6: add input system driver

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

