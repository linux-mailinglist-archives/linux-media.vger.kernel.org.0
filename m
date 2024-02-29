Return-Path: <linux-media+bounces-6199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FF86D2DF
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 20:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E6441C2184D
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 19:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954351369B2;
	Thu, 29 Feb 2024 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYB6/ldw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE71350E4
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709233752; cv=none; b=bHlP/jBzHrL7l2J4q2j3XWXjq5K5LZ3qH+P+cISt5hvQbERCIx9z+e3/Mwx5OyfRj6Q1QMF4MhVn3D82VcZEYAkvq9BNrWPRa0OlqVOq6vgSqnk1q85nCrgx+xKfrWNxlKqp0uoJqvugeQkfvcb403kF7g7jDRhx5JCme+/drA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709233752; c=relaxed/simple;
	bh=DcjArtAxqSyQQ8Q7oiDuU3o2jIQEGJ1zMYnhR4883l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHJaHoj3KV27mqYTP1/gD+hNSosvWhDhZLejvFFrgYURVOxt2v5cgngjdn4/NVfiHk1mgsUASsgAUsnyTOtj1zP3F9wnQTo+XMhA49560STk7Arnlg8ixdBpXIYDYabWJnUsoHa9UTFViju55WwOOM/z4QwJSMHy550NBak1cic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYB6/ldw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709233750; x=1740769750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DcjArtAxqSyQQ8Q7oiDuU3o2jIQEGJ1zMYnhR4883l8=;
  b=QYB6/ldwrhktc+GADWiUP9UOb2PspuhlZCNwIpiK/Gm3K0LEbSv5c9K/
   QnOnR59N1ck1kcajIVs1IP3xMxDqocNDiox4o6CKtvlFswrWQEwdkzxjl
   jIwNfVIV4iXT9baAXHeO6N2IueX8BY6ELfRVLhuW1xrEuwZ1+G8GE6JRB
   5AaXX7YzX3+nGsjAIjHO0e6gVzisvEb8JciCjXsFpApC70asBoKB2ZFs7
   TYFaZiAvelff/J6FmiXV6hdwe5h5izyOOzVy4/h5QH74EsJ5hjokqIHDP
   NSX2V/zASQDl7gAj23jUYPhN5SCLp5DhvOsygHZkHFA8MgepxvPzLm58M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21190649"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21190649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 11:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12608367"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 11:08:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfllx-000DDh-1z;
	Thu, 29 Feb 2024 19:08:49 +0000
Date: Fri, 1 Mar 2024 03:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hongju Wang <hongju.wang@intel.com>
Subject: [sailus-media-tree:ipu6 63/68]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:348: undefined reference to
 `vb2_queue_change_type'
Message-ID: <202403010320.sbbGkQjA-lkp@intel.com>
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
commit: 9f2b4e29db3a4167042cf2465ed32b8d56941209 [63/68] media: ipu6/isys: support line-based metadata capture support
config: x86_64-randconfig-075-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010320.sbbGkQjA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010320.sbbGkQjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010320.sbbGkQjA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_register_devices':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:796: undefined reference to `v4l2_device_register'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:825: undefined reference to `v4l2_device_unregister'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_notifier_init':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:717: undefined reference to `v4l2_async_nf_init'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:731: undefined reference to `v4l2_fwnode_endpoint_parse'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:737: undefined reference to `__v4l2_async_nf_add_fwnode_remote'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:761: undefined reference to `v4l2_async_nf_register'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:764: undefined reference to `v4l2_async_nf_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_complete_ext_device_registration':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:137: undefined reference to `v4l2_device_unregister_subdev'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_unregister_devices':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:840: undefined reference to `v4l2_device_unregister'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `isys_notifier_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys.c:772: undefined reference to `v4l2_async_nf_unregister'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.c:773: undefined reference to `v4l2_async_nf_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys.o: in function `v4l2_device_register_subdev_nodes':
   include/media/v4l2-device.h:201: undefined reference to `__v4l2_device_register_subdev_nodes'
   ld: include/media/v4l2-device.h:201: undefined reference to `__v4l2_device_register_subdev_nodes'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_get_sel':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:449: undefined reference to `v4l2_subdev_state_get_opposite_stream_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:455: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_set_sel':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:400: undefined reference to `v4l2_subdev_state_get_opposite_stream_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:406: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:410: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:506: undefined reference to `v4l2_device_unregister_subdev'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:507: undefined reference to `v4l2_subdev_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:506: undefined reference to `v4l2_device_unregister_subdev'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:507: undefined reference to `v4l2_subdev_cleanup'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:535: undefined reference to `__v4l2_subdev_init_finalize'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:541: undefined reference to `v4l2_device_register_subdev'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_sof_event_by_stream':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:565: undefined reference to `v4l2_event_queue'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_get_remote_desc':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:604: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:604: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:604: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:604: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:604: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `csi2_subscribe_event':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:115: undefined reference to `v4l2_event_subscribe'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:117: undefined reference to `v4l2_ctrl_subscribe_event'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o: in function `ipu6_isys_csi2_get_link_freq':
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:100: undefined reference to `v4l2_get_link_freq'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x490): undefined reference to `v4l2_subdev_link_validate'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x498): undefined reference to `v4l2_subdev_has_pad_interdep'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x538): undefined reference to `v4l2_subdev_get_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.o:(.rodata+0x700): undefined reference to `v4l2_event_subdev_unsubscribe'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_drvdata':
   include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `vidioc_create_bufs':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:348: undefined reference to `vb2_queue_change_type'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_drvdata':
   include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `vidioc_request_qbufs':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:332: undefined reference to `vb2_queue_change_type'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_drvdata':
   include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: include/media/v4l2-dev.h:516: undefined reference to `video_devdata'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `link_validate':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:386: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_configure_stream_watermark':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:757: undefined reference to `v4l2_g_ctrl'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_set_streaming':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:998: undefined reference to `v4l2_subdev_routing_find_opposite_end'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1014: undefined reference to `v4l2_subdev_disable_streams'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1025: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1025: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1041: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1041: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1051: undefined reference to `v4l2_subdev_enable_streams'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1066: undefined reference to `v4l2_subdev_disable_streams'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1025: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1041: undefined reference to `v4l2_subdev_call_wrappers'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_setup_video':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1217: undefined reference to `__v4l2_subdev_next_active_route'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1257: undefined reference to `video_device_pipeline_start'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1255: undefined reference to `video_device_pipeline_alloc_start'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1265: undefined reference to `video_device_pipeline_stop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1306: undefined reference to `video_device_release_empty'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_register_device':
   include/media/v4l2-dev.h:383: undefined reference to `__video_register_device'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1327: undefined reference to `vb2_video_unregister_device'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1331: undefined reference to `vb2_queue_release'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `ipu6_isys_video_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1341: undefined reference to `vb2_video_unregister_device'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `vidioc_create_bufs':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:352: undefined reference to `vb2_ioctl_create_bufs'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `vidioc_request_qbufs':
>> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:336: undefined reference to `vb2_ioctl_reqbufs'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o: in function `video_open':
   drivers/media/pci/intel/ipu6/ipu6-isys-video.c:109: undefined reference to `v4l2_fh_open'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb18): undefined reference to `vb2_fop_poll'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb20): undefined reference to `video_ioctl2'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb38): undefined reference to `vb2_fop_mmap'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xb48): undefined reference to `vb2_fop_release'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd58): undefined reference to `vb2_ioctl_querybuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd60): undefined reference to `vb2_ioctl_qbuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd68): undefined reference to `vb2_ioctl_expbuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd70): undefined reference to `vb2_ioctl_dqbuf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xd80): undefined reference to `vb2_ioctl_prepare_buf'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xda0): undefined reference to `vb2_ioctl_streamon'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-video.o:(.rodata+0xda8): undefined reference to `vb2_ioctl_streamoff'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o: in function `ipu6_isys_stream_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:517: undefined reference to `video_device_pipeline_stop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:517: undefined reference to `video_device_pipeline_stop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o: in function `ipu6_isys_queue_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:812: undefined reference to `vb2_queue_init'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o:(.rodata+0x468): undefined reference to `vb2_ops_wait_prepare'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-queue.o:(.rodata+0x470): undefined reference to `vb2_ops_wait_finish'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `subdev_set_routing':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:224: undefined reference to `v4l2_subdev_routing_validate'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:229: undefined reference to `v4l2_subdev_set_routing_with_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_subdev_set_fmt':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:159: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:169: undefined reference to `v4l2_subdev_state_get_opposite_stream_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:176: undefined reference to `v4l2_subdev_routing_find_opposite_end'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:184: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:141: undefined reference to `v4l2_subdev_get_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_get_stream_pad_fmt':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:242: undefined reference to `__v4l2_subdev_state_get_format'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_get_stream_pad_crop':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:260: undefined reference to `__v4l2_subdev_state_get_crop'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `subdev_set_routing':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:224: undefined reference to `v4l2_subdev_routing_validate'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_subdev_init':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:332: undefined reference to `v4l2_subdev_init'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:359: undefined reference to `v4l2_ctrl_handler_init_class'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:377: undefined reference to `v4l2_ctrl_handler_free'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `subdev_set_routing':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:229: undefined reference to `v4l2_subdev_set_routing_with_fmt'
   ld: drivers/media/pci/intel/ipu6/ipu6-isys-subdev.o: in function `ipu6_isys_subdev_cleanup':
   drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:388: undefined reference to `v4l2_ctrl_handler_free'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - VIDEO_INTEL_IPU6 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]


vim +348 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

   322	
   323	static int vidioc_request_qbufs(struct file *file, void *priv,
   324					struct v4l2_requestbuffers *p)
   325	{
   326		struct ipu6_isys_video *av = video_drvdata(file);
   327		int ret;
   328	
   329		av->aq.vbq.is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(p->type);
   330		av->aq.vbq.is_output = V4L2_TYPE_IS_OUTPUT(p->type);
   331	
   332		ret = vb2_queue_change_type(&av->aq.vbq, p->type);
   333		if (ret)
   334			return ret;
   335	
 > 336		return vb2_ioctl_reqbufs(file, priv, p);
   337	}
   338	
   339	static int vidioc_create_bufs(struct file *file, void *priv,
   340				      struct v4l2_create_buffers *p)
   341	{
   342		struct ipu6_isys_video *av = video_drvdata(file);
   343		int ret;
   344	
   345		av->aq.vbq.is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(p->format.type);
   346		av->aq.vbq.is_output = V4L2_TYPE_IS_OUTPUT(p->format.type);
   347	
 > 348		ret = vb2_queue_change_type(&av->aq.vbq, p->format.type);
   349		if (ret)
   350			return ret;
   351	
 > 352		return vb2_ioctl_create_bufs(file, priv, p);
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

