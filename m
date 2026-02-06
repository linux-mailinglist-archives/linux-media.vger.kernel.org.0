Return-Path: <linux-media+bounces-52318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLcOFWMjhmklKAQAu9opvQ
	(envelope-from <linux-media+bounces-52318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 18:22:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A184F100E80
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 18:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98C10300E399
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 17:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57673DA7C7;
	Fri,  6 Feb 2026 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvki4MUE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E43B530F
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398533; cv=none; b=PifqA/x2uXsYEULtbmXtqJAspi4FCJ5OLpvp8ZxDZbpfrS6PxR5SYHQTfUIxs5ffsoy0cvTEBDvILOz8ki+xYMYemvwrpHLZ2M/j3AFNOv8y9B7AABLpueHzVqHs0lI3VkJ+zRmwgXfjHWlx2HpHJu/gF8t7Z5vImk4RbXlS2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398533; c=relaxed/simple;
	bh=SqZlD/qHeZhtq/QbFu010KrzKljFkKfaSPJCYfz3IG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0uJczlE/XU1qXgnPed6t3r8Kpx5pVH6/lNwAz/xCkHs7J8k2DQSLYf4/TinTfphE6jQ7Ln2xImMzG06NmBeO0m0uXfHCYqC1EzA58mkEb2q/BYr4/c8Gp1m9V7TdYM8BlwTQKANzrO6uB85ZBtGLEQKLpA93PxHIY1E7ucCR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvki4MUE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770398533; x=1801934533;
  h=date:from:to:cc:subject:message-id;
  bh=SqZlD/qHeZhtq/QbFu010KrzKljFkKfaSPJCYfz3IG8=;
  b=mvki4MUEg8YgAMCWwTX6DFfU/tEg6RMxE6N8HcKZxN7nzflSZXfIRY6n
   /j8ZbB6Brogrd3xnCPpXCRRAlrRGAs86o9Wt+q4/i7kf9Ara6KPomg9wr
   +tiqdSxtyGyxWNsJilMwG60RNeMtfDpg9P+ABIPRvm1kS3zqCDD7t7sqS
   S9eTAgcQCltiI9wD1ur+RKufFdOm+zhA9amkYW/wV2WzKKn8YCLsC5YX/
   yYsytAfGkWtTfUm3zcNEFLTsdIuXnXwncrPc74R3n7pV4s61EDgNzPy8C
   b6veUqEYK4EscytG0kTTXr75yoE+WLstmLvtVpzicP2wxWLFu38CY79zn
   A==;
X-CSE-ConnectionGUID: DZTyYb06Q7mJw3M4HPLr2g==
X-CSE-MsgGUID: ZHZA57GcR6mOEx0wN+9SSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83050347"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="83050347"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:22:09 -0800
X-CSE-ConnectionGUID: Dh+CaMpRRQ21Hmck3KvmdA==
X-CSE-MsgGUID: npSXVEo7TrmgS8ucH1V46w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210796034"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 09:22:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voPWv-00000000kxO-2IYj;
	Fri, 06 Feb 2026 17:22:05 +0000
Date: Sat, 07 Feb 2026 01:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 11/13]
 drivers/media/platform/nxp/imx7-media-csi.c:1415:8: error: too few arguments
 to function call, expected 4, have 3
Message-ID: <202602070139.HB5ypt6u-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52318-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: A184F100E80
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: e7ba02736fa5365cfe31dfd34c5557f10c4348fa [11/13] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: hexagon-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070139.HB5ypt6u-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070139.HB5ypt6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070139.HB5ypt6u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx7-media-csi.c:1415:8: error: too few arguments to function call, expected 4, have 3
    1415 |         ret = v4l2_subdev_call_state_active(&csi->sd, pad, get_fmt, &fmt_src);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1939:14: note: expanded from macro 'v4l2_subdev_call_state_active'
    1939 |                 __result = v4l2_subdev_call(sd, o, f, state, ##args);   \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1909:20: note: expanded from macro 'v4l2_subdev_call'
    1908 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1909 |                                                         __sd, ##args);  \
         |                                                                     ^
>> drivers/media/platform/nxp/imx7-media-csi.c:1415:8: error: too few arguments to function call, expected 4, have 3
    1415 |         ret = v4l2_subdev_call_state_active(&csi->sd, pad, get_fmt, &fmt_src);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1939:14: note: expanded from macro 'v4l2_subdev_call_state_active'
    1939 |                 __result = v4l2_subdev_call(sd, o, f, state, ##args);   \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1911:43: note: expanded from macro 'v4l2_subdev_call'
    1911 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/nxp/imx7-media-csi.c:2024:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    2024 |         .set_fmt        = imx7_csi_set_fmt,
         |                           ^~~~~~~~~~~~~~~~
   3 errors generated.


vim +1415 drivers/media/platform/nxp/imx7-media-csi.c

01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1404  
31959b981c231fd drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1405  static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1406  {
d01a1c30777e46b drivers/media/platform/nxp/imx7-media-csi.c Laurent Pinchart 2023-01-26  1407  	struct v4l2_subdev_format fmt_src = {
d01a1c30777e46b drivers/media/platform/nxp/imx7-media-csi.c Laurent Pinchart 2023-01-26  1408  		.pad = IMX7_CSI_PAD_SRC,
d01a1c30777e46b drivers/media/platform/nxp/imx7-media-csi.c Laurent Pinchart 2023-01-26  1409  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
d01a1c30777e46b drivers/media/platform/nxp/imx7-media-csi.c Laurent Pinchart 2023-01-26  1410  	};
e352833d32e6932 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1411  	const struct imx7_csi_pixfmt *cc;
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1412  	int ret;
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1413  
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1414  	/* Retrieve the media bus format on the source subdev. */
1d59fbeb37a70f3 drivers/media/platform/nxp/imx7-media-csi.c Laurent Pinchart 2023-01-26 @1415  	ret = v4l2_subdev_call_state_active(&csi->sd, pad, get_fmt, &fmt_src);
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1416  	if (ret)
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1417  		return ret;
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1418  
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1419  	/*
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1420  	 * Verify that the media bus size matches the size set on the video
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1421  	 * node. It is sufficient to check the compose rectangle size without
084158200fda600 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1422  	 * checking the rounded size from pix_fmt, as the rounded size is
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1423  	 * derived directly from the compose rectangle size, and will thus
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1424  	 * always match if the compose rectangle matches.
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1425  	 */
084158200fda600 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1426  	if (csi->vdev_compose.width != fmt_src.format.width ||
084158200fda600 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1427  	    csi->vdev_compose.height != fmt_src.format.height)
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1428  		return -EPIPE;
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1429  
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1430  	/*
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1431  	 * Verify that the media bus code is compatible with the pixel format
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1432  	 * set on the video node.
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1433  	 */
2d35c1ff83c0951 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-10  1434  	cc = imx7_csi_find_mbus_format(fmt_src.format.code);
a61bfe662591ad2 drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-10  1435  	if (!cc || csi->vdev_cc->yuv != cc->yuv)
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1436  		return -EPIPE;
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1437  
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1438  	return 0;
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1439  }
01ac6b7542872ec drivers/staging/media/imx/imx7-media-csi.c  Laurent Pinchart 2022-05-09  1440  

:::::: The code at line 1415 was first introduced by commit
:::::: 1d59fbeb37a70f36ba3f03e41128515eee59f5fb media: imx: imx7-media-csi: Use V4L2 subdev active state

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

