Return-Path: <linux-media+bounces-59930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Nr/BvK08WmjjwEAu9opvQ
	(envelope-from <linux-media+bounces-59930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:36:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0A4908B9
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B945302C36B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256923A6411;
	Wed, 29 Apr 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx4pRaJa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A2359A6D
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448122; cv=none; b=Z6qIzHxI+KIgJJULpb+x2WJmG4NxtFRraV3MDCdvnWGLZjJNE/0usor/zdqtywgVBS9C1K8/V8xqwBGhQ2TZI8AO1WeDdkH7ouccQea4ETBVdG8CBi4u++q6awL5TyNRe9xPsldTri2Th3KH0zWroCjGC+iYSAx1ESwhwLfD28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448122; c=relaxed/simple;
	bh=I3TJhs9tOrf5vAYSpXpoa+xlvXb2xN5nzYyPHlYoWjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OlfeDv/bG3bewYMZUY2y01AkbO6jivSWcurKoI4oPhgJio+Q775UvgZADHiLE8gVEni+6pLIdvAdk8ceADMhx8CiIhIsaNRSNadcyiR5YHTIXV1PlCScBq+X6gWUJhRt5rf3OIk0rRHzx7kuOi84+e3C623hvmr43JdfwPYgDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bx4pRaJa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777448120; x=1808984120;
  h=date:from:to:cc:subject:message-id;
  bh=I3TJhs9tOrf5vAYSpXpoa+xlvXb2xN5nzYyPHlYoWjI=;
  b=Bx4pRaJa8Og7Vm+kPhZTUfpUkWayCfn/Lg/hd1rs4EstdMK0G7VHgxFe
   /oeMKgDJoD8uqasEq4jw9yVc99n45aL/CNRu4iM5/B50k5e932p3TNjAW
   CzigAe5DZoBoZ9MwrUd6vlH8wOemiovkHXVGn9RPfs4M8lcI+uCfiFgin
   zqhT73Q33AqK956n5d3pwfNoXwcX69FAbHUTC3tl3AhsQuNyY2OMRLqDv
   3kffBC+dhu3KJ4ZYzYrdUKRRpkvitO7R+CiVqOx6IxUQAVSIs3v0s5+ZP
   pB5uUqLEdWHTbSGddEzQE6QZS/4UUWibzApIJHR1EZiy432aVCYsXshal
   w==;
X-CSE-ConnectionGUID: ijFUM/6RRMe4H6H9pVmz5A==
X-CSE-MsgGUID: +IZ2JWeUSXOri1ihKJE5XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95937273"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="95937273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:35:19 -0700
X-CSE-ConnectionGUID: MytCV6LoQO6f9apH7MHiiA==
X-CSE-MsgGUID: 5uR59AVSQcSIfNYW4nqqHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="238524080"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2026 00:35:17 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHzRy-00000000Akm-1x8v;
	Wed, 29 Apr 2026 07:35:14 +0000
Date: Wed, 29 Apr 2026 15:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 80/122]
 drivers/media/i2c/ccs/ccs-core.c:2486:24: error: too many arguments to
 function 'ccs_get_format'; expected 3, have 4
Message-ID: <202604291554.jge9fFXX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 7BA0A4908B9
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
	TAGGED_FROM(0.00)[bounces-59930-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: f3d14633599ac2e30aeb1e1af17db73b46682931 [80/122] media: ccs: Add support for embedded data stream
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604291554.jge9fFXX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291554.jge9fFXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291554.jge9fFXX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ccs/ccs-core.c: In function 'ccs_set_format':
   drivers/media/i2c/ccs/ccs-core.c:2486:47: error: passing argument 2 of 'ccs_get_format' from incompatible pointer type [-Wincompatible-pointer-types]
    2486 |                 return ccs_get_format(subdev, ci, sd_state, fmt);
         |                                               ^~
         |                                               |
         |                                               const struct v4l2_subdev_client_info *
   drivers/media/i2c/ccs/ccs-core.c:2299:53: note: expected 'struct v4l2_subdev_state *' but argument is of type 'const struct v4l2_subdev_client_info *'
    2299 |                           struct v4l2_subdev_state *sd_state,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2486:51: error: passing argument 3 of 'ccs_get_format' from incompatible pointer type [-Wincompatible-pointer-types]
    2486 |                 return ccs_get_format(subdev, ci, sd_state, fmt);
         |                                                   ^~~~~~~~
         |                                                   |
         |                                                   struct v4l2_subdev_state *
   drivers/media/i2c/ccs/ccs-core.c:2300:54: note: expected 'struct v4l2_subdev_format *' but argument is of type 'struct v4l2_subdev_state *'
    2300 |                           struct v4l2_subdev_format *fmt)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/media/i2c/ccs/ccs-core.c:2486:24: error: too many arguments to function 'ccs_get_format'; expected 3, have 4
    2486 |                 return ccs_get_format(subdev, ci, sd_state, fmt);
         |                        ^~~~~~~~~~~~~~                       ~~~
   drivers/media/i2c/ccs/ccs-core.c:2298:12: note: declared here
    2298 | static int ccs_get_format(struct v4l2_subdev *subdev,
         |            ^~~~~~~~~~~~~~


vim +/ccs_get_format +2486 drivers/media/i2c/ccs/ccs-core.c

  2475	
  2476	static int ccs_set_format(struct v4l2_subdev *subdev,
  2477				  const struct v4l2_subdev_client_info *ci,
  2478				  struct v4l2_subdev_state *sd_state,
  2479				  struct v4l2_subdev_format *fmt)
  2480	{
  2481		struct ccs_sensor *sensor = to_ccs_sensor(subdev);
  2482		struct ccs_subdev *ssd = to_ccs_subdev(subdev);
  2483		struct v4l2_rect *crop;
  2484	
  2485		if (ssd == sensor->src && fmt->pad == CCS_PAD_META)
> 2486			return ccs_get_format(subdev, ci, sd_state, fmt);
  2487	
  2488		if (ssd == sensor->src && fmt->stream == CCS_STREAM_META) {
  2489			ccs_set_format_meta(subdev, sd_state, &fmt->format);
  2490	
  2491			return 0;
  2492		}
  2493	
  2494		if (fmt->pad == ssd->source_pad) {
  2495			int rval;
  2496	
  2497			rval = ccs_set_format_source(subdev, NULL, sd_state, fmt);
  2498			if (ccs_embedded_data_lines(sensor) && ssd == sensor->src)
  2499				ccs_set_format_meta(subdev, sd_state, NULL);
  2500	
  2501			return rval;
  2502		}
  2503	
  2504		/* Sink pad. Width and height are changeable here. */
  2505		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
  2506	
  2507		fmt->format.width &= ~1;
  2508		fmt->format.height &= ~1;
  2509		fmt->format.field = V4L2_FIELD_NONE;
  2510	
  2511		fmt->format.width =
  2512			clamp(fmt->format.width,
  2513			      CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
  2514			      CCS_LIM(sensor, MAX_X_OUTPUT_SIZE));
  2515		fmt->format.height =
  2516			clamp(fmt->format.height,
  2517			      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
  2518			      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
  2519	
  2520		crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
  2521						  CCS_STREAM_PIXEL);
  2522	
  2523		crop->left = 0;
  2524		crop->top = 0;
  2525		crop->width = fmt->format.width;
  2526		crop->height = fmt->format.height;
  2527		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
  2528	
  2529		return 0;
  2530	}
  2531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

