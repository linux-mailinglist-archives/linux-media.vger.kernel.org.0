Return-Path: <linux-media+bounces-52324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNgKHWA3hmmcLAQAu9opvQ
	(envelope-from <linux-media+bounces-52324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:48:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B11023AB
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36893305A435
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 18:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E16428466;
	Fri,  6 Feb 2026 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idYZrr8R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609E423A92
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402973; cv=none; b=j4zACZ9slXFxeL7t7h3JW9BGZZWhMe+GQ7oZWJFwVjLkgr1Zf8Tp9UZLu/Hm2ZEk2JqlZL9fnMdmf1M9CYMI9Qg9XyC2ezJn50P87GwhVyIZN6igapulLtvmxciKv3wSz8nXBSKg8wdOBf9NJrZ6Q/YHbEJXrgqMluSj7wXbJtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402973; c=relaxed/simple;
	bh=nLf2k4uhakuDES57YW3WXsUboceq/7O8tKvO58urRSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YnUj89gMaEBeN223uuhryIhOjGIWtI1QS/shiZIRfzjStyji9PexpPORfpx0oDWx5YmGAbJ/+8KAOEup+Uv2vyJ4BC68JKLnhp51ireExtY6JLJVhGmkI41oJZHXxOh8h+WUmZVaSzlHyXIhAlOPK8KjuewXjdypuf36P9n03wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idYZrr8R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770402973; x=1801938973;
  h=date:from:to:cc:subject:message-id;
  bh=nLf2k4uhakuDES57YW3WXsUboceq/7O8tKvO58urRSc=;
  b=idYZrr8RsS2rcDXHkonlcna4Ds7ujbcR5r4rcNfbdXtZEidOSaZavyxz
   SNyD+tXQ7ZeAfViiy0zOkx8NlyfDKzYyW9jYOXIiLO+LVrCAI5Q0Z3zcg
   qOB82YBzGJRQbKN8R50J3Zilw1GzkO8mlmDLP4IzH0ColXKy5uqcANGx8
   K+AuE+9QWEJiYc0zBvjJjYramRUa9QF7qfGlP3r87PMd/mo4ITn1+4/+a
   gUCe1tlRHZGD0oB6gUnB4WS+pbyriCXsHGk/WxTtlhN2EAZ+pFQKLq51h
   SiHA7BA1RQwN0JSqyhKMjTsuYU+8c9B3+mnRggxSurLU8m8FhE6RdhDTx
   A==;
X-CSE-ConnectionGUID: MA2ulqT6S9Og0wrGiT9V0g==
X-CSE-MsgGUID: Td7jzO+TSoaNJ1ep8BYVLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516906"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71516906"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 10:36:12 -0800
X-CSE-ConnectionGUID: 6kGuDO/gRUCGBpEG7j1d+w==
X-CSE-MsgGUID: KY5k6ircTf+sudvbFsjs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210033539"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Feb 2026 10:36:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voQga-00000000l1U-1hjj;
	Fri, 06 Feb 2026 18:36:08 +0000
Date: Sat, 07 Feb 2026 02:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 51/88]
 drivers/media/i2c/ov2740.c:1301:26: error: initialization of 'int (*)(struct
 v4l2_subdev *, const struct v4l2_subdev_client_info *, struct
 v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible
 pointer type 'int (*)(struct v4l2_subdev *, ...
Message-ID: <202602070234.rlTGLzL7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	LONG_SUBJ(2.20)[293];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52324-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C55B11023AB
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   17d48829c902c064710e9518b453bd252674ae5e
commit: bd8706aed5a5e6b8d7c0fcc9dbbdc5896b6684a4 [51/88] media: ov2740: Add support for G_SELECTION IOCTL
config: i386-buildonly-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602070234.rlTGLzL7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070234.rlTGLzL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070234.rlTGLzL7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2740.c:1301:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    1301 |         .get_selection = ov2740_get_selection,
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2740.c:1301:26: note: (near initialization for 'ov2740_pad_ops.get_selection')


vim +1301 drivers/media/i2c/ov2740.c

  1297	
  1298	static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
  1299		.get_fmt = v4l2_subdev_get_fmt,
  1300		.set_fmt = ov2740_set_format,
> 1301		.get_selection = ov2740_get_selection,
  1302		.enum_mbus_code = ov2740_enum_mbus_code,
  1303		.enum_frame_size = ov2740_enum_frame_size,
  1304		.enable_streams = ov2740_enable_streams,
  1305		.disable_streams = ov2740_disable_streams,
  1306		.get_frame_desc = ov2740_get_frame_desc,
  1307	};
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

