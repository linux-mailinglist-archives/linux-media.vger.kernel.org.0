Return-Path: <linux-media+bounces-59946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH9jNEvC8WkbkQEAu9opvQ
	(envelope-from <linux-media+bounces-59946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:33:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2EE49139D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 685B63082800
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37D93B27CD;
	Wed, 29 Apr 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbjSYDWp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00123B2FD6
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777451367; cv=none; b=sUub9z8FDH+wft5L2tonoFyYU+fTa/xE/pg/hgybDLS0phvNJzsgr4w9JVhIixyKPbPsCpzd+KYIo1mV6CU9hnNjbpY40I9KU22B1PhYIlZAuFkqRMG++3VJXQ5bi5GtY8zOCMQlDpoc4TDmyHaSQ100key7iwCK+sj2UsrLP1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777451367; c=relaxed/simple;
	bh=qVj3Ep/cYjVWxLUl8DR8hKE1FQ4EOx1iqoIhcnbXjeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TGkBruix1Y0jn56kA4tJshrKS+0/WFuAqhd8RGU/SBZNOb5KNqvcl9XrfVoo/JPnyS4a9UpcoDxE8FaQBocViIhEX3aEatYqxihO5yV8DVixHnx7dSoVCKvuqJ7PfotI1MoMIDgMAmKqtxl5jjzcWbyIsdiHMO/zDMfKu90WUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbjSYDWp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777451366; x=1808987366;
  h=date:from:to:cc:subject:message-id;
  bh=qVj3Ep/cYjVWxLUl8DR8hKE1FQ4EOx1iqoIhcnbXjeA=;
  b=nbjSYDWp8dN+E9irrKb4prwLtU40cKUy6EvKqAmT2QgIBtiJZ4LigA+i
   SEA3nb0sO1ZwGf23tnswe53tmsmHbFKt6It2dIu4AFDCrNGPTWjTfAWhG
   VWpXisoK1wZcV5WT5ZAkIWDGP4uZ4HHuhmX1keQMzAxg4Hs1ey3mnOWUK
   6eBc+zpQUWW//ePxc4rIsKD+gSk0omGQm+DkkoNiD1R7/zT4tyW/yUTyq
   cGti9tcy9FIwOGQuHWrE30tcV2H7dr1BaHsFoGgjs+EMXeK/YMMQRDf3d
   JtzsdiJha4VSMY5kAhAe5U09/M1MkBxP5LK/D/B6x3+O8keOweZSfA8vq
   w==;
X-CSE-ConnectionGUID: Hqrs/6KoTqGwDUoVo9n51w==
X-CSE-MsgGUID: WM3vvQB4Sza/LDyyMxtRHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95793597"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="95793597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 01:29:25 -0700
X-CSE-ConnectionGUID: Zp37nzjwTc6RJPcVzLRpPQ==
X-CSE-MsgGUID: W3qG9V9iQ++FHrCCIukZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="231551308"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2026 01:29:24 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wI0IL-00000000ApA-0AUM;
	Wed, 29 Apr 2026 08:29:21 +0000
Date: Wed, 29 Apr 2026 16:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:metadata 91/122]
 drivers/media/i2c/imx219.c:982:24: error: too many arguments to function
 'v4l2_subdev_get_fmt'; expected 3, have 4
Message-ID: <202604291638.d493kmZ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 4F2EE49139D
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-59946-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: 0a4acc9d6279bb839202e8731d03c772e7cb0291 [91/122] media: imx219: Add internal pads, routes for common raw sensor model
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604291638.d493kmZ2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291638.d493kmZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291638.d493kmZ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/imx219.c: In function 'imx219_set_pad_format':
   drivers/media/i2c/imx219.c:982:48: error: passing argument 2 of 'v4l2_subdev_get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     982 |                 return v4l2_subdev_get_fmt(sd, ci, state, fmt);
         |                                                ^~
         |                                                |
         |                                                const struct v4l2_subdev_client_info *
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/i2c/imx219.c:28:
   include/media/v4l2-subdev.h:1477:75: note: expected 'struct v4l2_subdev_state *' but argument is of type 'const struct v4l2_subdev_client_info *'
    1477 | int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/media/i2c/imx219.c:982:52: error: passing argument 3 of 'v4l2_subdev_get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     982 |                 return v4l2_subdev_get_fmt(sd, ci, state, fmt);
         |                                                    ^~~~~
         |                                                    |
         |                                                    struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1478:52: note: expected 'struct v4l2_subdev_format *' but argument is of type 'struct v4l2_subdev_state *'
    1478 |                         struct v4l2_subdev_format *format);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/media/i2c/imx219.c:982:24: error: too many arguments to function 'v4l2_subdev_get_fmt'; expected 3, have 4
     982 |                 return v4l2_subdev_get_fmt(sd, ci, state, fmt);
         |                        ^~~~~~~~~~~~~~~~~~~                ~~~
   include/media/v4l2-subdev.h:1477:5: note: declared here
    1477 | int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/v4l2_subdev_get_fmt +982 drivers/media/i2c/imx219.c

   969	
   970	static int imx219_set_pad_format(struct v4l2_subdev *sd,
   971					 const struct v4l2_subdev_client_info *ci,
   972					 struct v4l2_subdev_state *state,
   973					 struct v4l2_subdev_format *fmt)
   974	{
   975		struct imx219 *imx219 = to_imx219(sd);
   976		struct v4l2_mbus_framefmt *format;
   977	
   978		if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
   979			return imx219_set_pad_format_compat(sd, state, fmt);
   980	
   981		if (fmt->pad != IMX219_PAD_SOURCE)
 > 982			return v4l2_subdev_get_fmt(sd, ci, state, fmt);
   983	
   984		format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
   985	
   986		format->code = fmt->format.code =
   987			imx219_get_format_code(imx219, fmt->format.code);
   988	
   989		return 0;
   990	}
   991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

