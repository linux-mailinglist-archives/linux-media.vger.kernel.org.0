Return-Path: <linux-media+bounces-56522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEWSJe1AvWn28AIAu9opvQ
	(envelope-from <linux-media+bounces-56522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:43:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7952DA6D9
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2581F313BF7D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4326B3B2FC8;
	Fri, 20 Mar 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkDEMlkj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B462D0605
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010413; cv=none; b=M58UqJSFI/VXqlkXGjAb0IfEtPphhv7WzZIhQMqDldgfV+tTxV1OQlvrMq1SBMLj1qmoq5+lBbxc42B+53Hs4eLOFOoyQy0uaczHRNHH4MRr+Jjg5L3lA5wDJ7wKI+DxgXpsgTRpxsdSdQ5YAOc6Em9UlKbIfNkox9ZTM8yMPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010413; c=relaxed/simple;
	bh=ChvT6ccIwWQ61J6CtudzlN40oVW7OdfydHTTiOWgvBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGBrwHtJQENRrFQtbmpeFtKIuk9fuB1ca0vZBQeWHyBCXX7aIZy7WCPHHuIULzj9mXk6pl18yWiQMKmtS8gYpquBGF3vxZzSthqm0HIw6F9Xvwgd3K3u4sBoq4T4l2enPVviRROnMPMmYmqoC7yh6l1aKD2/boAlW0LKd/FCT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkDEMlkj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774010407; x=1805546407;
  h=date:from:to:cc:subject:message-id;
  bh=ChvT6ccIwWQ61J6CtudzlN40oVW7OdfydHTTiOWgvBg=;
  b=DkDEMlkj5DQSgTDx5m1rq62LTLA6is9DiOeeNnOF13u75yore53Zzu8W
   ABEC8ndeorHjF7J606pKYr8MNXKnB5bLBfkw4F0Nh+ZA9uzS6ye9AOZ43
   pnEzBfVxiDBIf66LcqPrZ6bh4a9lJ/UV9valsIj8qbTvnIQ5VJlApxnPT
   H2G49Te8EYsDyHkpD6R31e8FomYu3YrzAdf3zZAcBJZCCHRo7495gT7Ii
   udtSq61RMCOpFIqpe2yAmS/Sm55gS+h4UGAI5pUX1rpWcysiTa1nsvjBV
   mp+CsWulgXjadIptfcH95Y3RwH/lhwjUQwxu0uXZ89POFBvkoa0T5BO+z
   A==;
X-CSE-ConnectionGUID: zZHpyIOASTGb4r5VHa59Ig==
X-CSE-MsgGUID: 6qP8PL5YTqGGKB/wuKbWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75166682"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75166682"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 05:39:51 -0700
X-CSE-ConnectionGUID: m+/15mgfSuGocpb9wsgHMg==
X-CSE-MsgGUID: CeIsbWNBSKaASBdNuKD8ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228004949"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 05:39:50 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Z8l-000000002Mb-19IN;
	Fri, 20 Mar 2026 12:39:47 +0000
Date: Fri, 20 Mar 2026 20:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 22/106]
 drivers/media/i2c/og01a1b.c:767:32: error: passing argument 2 of
 'og01a1b_set_format' from incompatible pointer type
Message-ID: <202603202019.logGbtI4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56522-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 6F7952DA6D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   7a108073e0c1f6e9035329a152d5835f9d4f9507
commit: ad5c2cba760033425f80420f0cf45a560a646d7e [22/106] media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603202019.logGbtI4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202019.logGbtI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202019.logGbtI4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx412.c:715 function parameter 'ci' not described in 'imx412_get_pad_format'
>> Warning: drivers/media/i2c/imx412.c:746 function parameter 'ci' not described in 'imx412_set_pad_format'
>> Warning: drivers/media/i2c/imx412.c:715 function parameter 'ci' not described in 'imx412_get_pad_format'
>> Warning: drivers/media/i2c/imx412.c:746 function parameter 'ci' not described in 'imx412_set_pad_format'
--
   drivers/media/i2c/og01a1b.c: In function 'og01a1b_init_state':
>> drivers/media/i2c/og01a1b.c:767:32: error: passing argument 2 of 'og01a1b_set_format' from incompatible pointer type [-Wincompatible-pointer-types]
     767 |         og01a1b_set_format(sd, state, &fmt);
         |                                ^~~~~
         |                                |
         |                                struct v4l2_subdev_state *
   drivers/media/i2c/og01a1b.c:680:69: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
     680 |                               const struct v4l2_subdev_client_info *ci,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   drivers/media/i2c/og01a1b.c:767:39: error: passing argument 3 of 'og01a1b_set_format' from incompatible pointer type [-Wincompatible-pointer-types]
     767 |         og01a1b_set_format(sd, state, &fmt);
         |                                       ^~~~
         |                                       |
         |                                       struct v4l2_subdev_format *
   drivers/media/i2c/og01a1b.c:681:57: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     681 |                               struct v4l2_subdev_state *sd_state,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/media/i2c/og01a1b.c:767:9: error: too few arguments to function 'og01a1b_set_format'; expected 4, have 3
     767 |         og01a1b_set_format(sd, state, &fmt);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/og01a1b.c:679:12: note: declared here
     679 | static int og01a1b_set_format(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~
--
>> Warning: drivers/media/i2c/imx335.c:885 function parameter 'ci' not described in 'imx335_set_pad_format'
>> Warning: drivers/media/i2c/imx335.c:962 function parameter 'ci' not described in 'imx335_get_selection'
>> Warning: drivers/media/i2c/imx335.c:885 function parameter 'ci' not described in 'imx335_set_pad_format'
>> Warning: drivers/media/i2c/imx335.c:962 function parameter 'ci' not described in 'imx335_get_selection'
--
>> Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
>> Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
>> Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
>> Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
--
>> Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
>> Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
>> Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
>> Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
--
>> Warning: drivers/media/i2c/ov9282.c:794 function parameter 'ci' not described in 'ov9282_get_pad_format'
>> Warning: drivers/media/i2c/ov9282.c:822 function parameter 'ci' not described in 'ov9282_set_pad_format'
>> Warning: drivers/media/i2c/ov9282.c:794 function parameter 'ci' not described in 'ov9282_get_pad_format'
>> Warning: drivers/media/i2c/ov9282.c:822 function parameter 'ci' not described in 'ov9282_set_pad_format'
--
>> Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
>> Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'
>> Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
>> Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'
--
>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     161 | int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/renesas/vsp1/vsp1_entity.c:19:
   drivers/media/platform/renesas/vsp1/vsp1_entity.h:178:5: note: previous declaration of 'vsp1_subdev_get_pad_format' with type 'int(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
     178 | int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/og01a1b_set_format +767 drivers/media/i2c/og01a1b.c

472377febf848a Shawn Tu           2022-02-15  752  
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  753  static int og01a1b_init_state(struct v4l2_subdev *sd,
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  754  			      struct v4l2_subdev_state *state)
472377febf848a Shawn Tu           2022-02-15  755  {
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  756  	struct og01a1b *og01a1b = to_og01a1b(sd);
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  757  	struct v4l2_subdev_format fmt = {
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  758  		.which = V4L2_SUBDEV_FORMAT_TRY,
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  759  		.pad = 0,
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  760  		.format = {
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  761  			.width = og01a1b->cur_mode->width,
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  762  			.height = og01a1b->cur_mode->height,
4369a7d34d649d Vladimir Zapolskiy 2026-02-26  763  			.code = og01a1b->code,
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  764  		},
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  765  	};
d935219d19daf1 Vladimir Zapolskiy 2026-02-26  766  
d935219d19daf1 Vladimir Zapolskiy 2026-02-26 @767  	og01a1b_set_format(sd, state, &fmt);
472377febf848a Shawn Tu           2022-02-15  768  
472377febf848a Shawn Tu           2022-02-15  769  	return 0;
472377febf848a Shawn Tu           2022-02-15  770  }
472377febf848a Shawn Tu           2022-02-15  771  

:::::: The code at line 767 was first introduced by commit
:::::: d935219d19daf1d43d116e14c253a17bb23cd480 media: i2c: og01a1b: Replace .open with .init_state internal ops

:::::: TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

