Return-Path: <linux-media+bounces-52328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHNBEVRfhmnLMQQAu9opvQ
	(envelope-from <linux-media+bounces-52328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 22:38:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3A1037DE
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 22:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A14133040FBC
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 21:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C773311C07;
	Fri,  6 Feb 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g65wRFvC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600B27D77D
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770413901; cv=none; b=BTwA5DjDW1SMtf1qKRTdDJnAlZS7HJ7uGfCLWqb9VzK7bQK6RTq2pECJizbirj0nMl0ZckkaHxxXBbUVL8aVQwH3RbIqg1rLdGkFulXK20QWstsNyIW104wSQ+7LovgO8emUE3RdvVPXa0MMD+liJe9ueWj2I/YxZvdfK4wQ2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770413901; c=relaxed/simple;
	bh=DRmWdDIX9KF1rrcEcDuvReaOHe+q98pwNqo15IvvYMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=avQb+Dc41B3jVGJMBlsc6Xbjh9WPc7B2XB6w+LwaBF3PVdihEEuObHDlB3Nf/ATn4tKRTTev/d4MkjA8pI7jgUW/oFl9mkdZGNYA6UUCx2Hu1W7rQCjIO+6Ut0+sfe20lrBqvueJj188ylPM5cJV34WF1wlIsbGbGybPrd0Y9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g65wRFvC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770413901; x=1801949901;
  h=date:from:to:cc:subject:message-id;
  bh=DRmWdDIX9KF1rrcEcDuvReaOHe+q98pwNqo15IvvYMI=;
  b=g65wRFvC0HpSPigvqsl1LVT11SlKeI4dxzJlbA31Zlbc9VOsNRh2z/wy
   taWP2cFKxxai/r0EZHjB9SMCmTZE0T5IfAjwz+ea/ywEVkXpmi7qb5L6h
   6A+DqOkvNg2Vtgc/sddL87JLu+YLWgZEjSOksj9veILH/EXollaMjN5iV
   nGCWJN4Oj4pQGWx2VAfTD+wigHSs2BxyjJTjFjBYfKkwpqgJjxBbwkwgZ
   qSTsv/zE4f1XkNsJjpIcmT5xUAIkw+hApHqWvPRhcurrTat4Gh2bdG+bg
   hm6spg6NvZulysidv5tEvgDZTIzBar57OV1yA7QadIXjJNT7bSwSuFxpf
   A==;
X-CSE-ConnectionGUID: jEhyjF2YRlqTtl34K6VPLw==
X-CSE-MsgGUID: xANoA4HcQT2sVBWbHRDtzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83070738"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83070738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:38:20 -0800
X-CSE-ConnectionGUID: PG9RoDGSTD6l64RzN3bAyw==
X-CSE-MsgGUID: SF0QY2/cSeutiAirCPgXDQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Feb 2026 13:38:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTWq-00000000lBW-2MRR;
	Fri, 06 Feb 2026 21:38:16 +0000
Date: Sat, 07 Feb 2026 05:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 84/88]
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:561:14: warning: unused
 variable 'has_pipeline'
Message-ID: <202602070511.edhvpmc9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52328-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0F3A1037DE
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   17d48829c902c064710e9518b453bd252674ae5e
commit: 3abc7ff80549f9bb5bfe4267da5456bf89e78740 [84/88] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
config: x86_64-randconfig-013-20260207 (https://download.01.org/0day-ci/archive/20260207/202602070511.edhvpmc9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070511.edhvpmc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070511.edhvpmc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c: In function 'start_streaming':
>> drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:561:14: warning: unused variable 'has_pipeline' [-Wunused-variable]
     561 |         bool has_pipeline = (bool)video_device_pipeline(&av->vdev);
         |              ^~~~~~~~~~~~


vim +/has_pipeline +561 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

   532	
   533	static int start_streaming(struct vb2_queue *q, unsigned int count)
   534	{
   535		struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
   536		struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
   537		struct device *dev = &av->isys->adev->auxdev.dev;
   538		const struct ipu6_isys_pixelformat *pfmt =
   539			ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
   540		struct media_pad *source_pad, *remote_pad;
   541		int ret;
   542	
   543		dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
   544			av->vdev.name, ipu6_isys_get_frame_width(av),
   545			ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
   546	
   547		remote_pad = media_pad_remote_pad_unique(&av->pad);
   548		if (IS_ERR(remote_pad)) {
   549			dev_dbg(dev, "failed to get remote pad\n");
   550			ret = PTR_ERR(remote_pad);
   551			goto out_return_buffers;
   552		}
   553	
   554		source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
   555		if (IS_ERR(source_pad)) {
   556			dev_dbg(dev, "No external source entity\n");
   557			ret = PTR_ERR(source_pad);
   558			goto out_return_buffers;
   559		}
   560	
 > 561		bool has_pipeline = (bool)video_device_pipeline(&av->vdev);
   562	
   563		ret = video_device_pipeline_alloc_start(&av->vdev);
   564		if (ret < 0)
   565			goto out_return_buffers;
   566	
   567		ret = ipu6_isys_link_fmt_validate(aq);
   568		if (ret) {
   569			dev_dbg(dev,
   570				"%s: link format validation failed (%d)\n",
   571				av->vdev.name, ret);
   572			goto out_pipeline_stop;
   573		}
   574	
   575		ret = ipu6_isys_fw_open(av->isys);
   576		if (ret)
   577			goto out_pipeline_stop;
   578	
   579		ret = ipu6_isys_stream_start(av);
   580		if (ret)
   581			goto out_fw_close;
   582	
   583		return 0;
   584	
   585	out_fw_close:
   586		ipu6_isys_fw_close(av->isys);
   587	
   588	out_pipeline_stop:
   589		ipu6_isys_stream_cleanup(av);
   590	
   591	out_return_buffers:
   592		return_buffers(aq, VB2_BUF_STATE_QUEUED);
   593	
   594		return ret;
   595	}
   596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

