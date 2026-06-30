Return-Path: <linux-media+bounces-66078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S3RwO0W2Q2pufgoAu9opvQ
	(envelope-from <linux-media+bounces-66078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:27:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD56E4296
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:27:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="b/4qU1p3";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66078-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66078-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 935C630444F0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4937840B398;
	Tue, 30 Jun 2026 12:27:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F1408617
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:27:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822446; cv=none; b=H/OpkAg2S8efHRMlwo6by6qLfJeIZBdjdh6VKWQCCPiRy5EmApk56v/lgloPpUyZNKLr20t2BEp8m3Edv4KXICr1rR86gINx/IIHJDIImnU4IKaEdrdtNlDs+G7EgekPfkB55Zy0q5tTIvwZUhVwKGC5r72XV7gLDqFr5vd9zUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822446; c=relaxed/simple;
	bh=p3yHKdJMZrR8ssi9hb90/QMcVwTuEiccwUmY8qJv5y8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DC1n5/Wp2RkOzDyZyx/MSqiPwEGijGdjimeYthDeMeLZT+npaTAZe5sAuNzsOHUB/7qh+v8hwLrP2/R9mCwrjKciizOZZ//Skac8ckaO086Z2o4ywUZ+0TWHS6G6hC0M+LaLvN/YvsDbnGC0i2kNTIQapEnp1f1uryEIpSCq0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/4qU1p3; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782822445; x=1814358445;
  h=date:from:to:cc:subject:message-id;
  bh=p3yHKdJMZrR8ssi9hb90/QMcVwTuEiccwUmY8qJv5y8=;
  b=b/4qU1p3dsHZNv7jl94XJIEISbVV1yRIsuRP6t7qD/Sjx+ULSQk0PvP1
   lJ4XKqnwXv7lTRCZ+hOJ7ycvcCSmhDApPIXs4C/fV0n2v8shi/bcqy79C
   IaCCJ1liwLYBoz1KpnhgRiZShCO2v+s0fX+VU3jaGLitfLAVKXvoZOiZV
   16SaQGhg1EYviInSuBqLJaJWD5ALJN0kMqY/4RHCMfAQjeRWkdUwu7hJu
   Aur2AgPlTctnPyiKJt/QW0dd9VsOx4w9dX7elscEEHmIBIPifZZTrHTFQ
   v2GgXw8Pz0fBWVyWomI64i7ZmXi69mG4MzJswd3cY0/hESHslJXarkDYM
   Q==;
X-CSE-ConnectionGUID: Kcu7gk5GRIu9KQ/tt6lEnw==
X-CSE-MsgGUID: w00ybk9YSeCo8jI0ptxIMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83560178"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83560178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:27:25 -0700
X-CSE-ConnectionGUID: /up156W4TXyJ8/WE3AWosg==
X-CSE-MsgGUID: I8Ay4DPTTLyGyJvcBGifKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="245904262"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2026 05:27:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weXYe-000000008L0-2e0m;
	Tue, 30 Jun 2026 12:27:20 +0000
Date: Tue, 30 Jun 2026 20:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 17/17]
 drivers/media/i2c/ml86v7667.c:301:13: error: use of undeclared identifier
 'v4l2_subdev_get_fmt_ci'; did you mean 'v4l2_subdev_notify'?
Message-ID: <202606302010.Icm10dbc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66078-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ABD56E4296

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   66c090febbc3c412ced4e71cb69f47b05eea0331
commit: 66c090febbc3c412ced4e71cb69f47b05eea0331 [17/17] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: arm64-randconfig-003 (https://download.01.org/0day-ci/archive/20260630/202606302010.Icm10dbc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302010.Icm10dbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302010.Icm10dbc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ml86v7667.c:301:13: error: use of undeclared identifier 'v4l2_subdev_get_fmt_ci'; did you mean 'v4l2_subdev_notify'?
     301 |         .set_fmt = v4l2_subdev_get_fmt_ci,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
         |                    v4l2_subdev_notify
   include/media/v4l2-device.h:238:20: note: 'v4l2_subdev_notify' declared here
     238 | static inline void v4l2_subdev_notify(struct v4l2_subdev *sd,
         |                    ^
>> drivers/media/i2c/ml86v7667.c:301:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'void (struct v4l2_subdev *, unsigned int, void *)' [-Wincompatible-function-pointer-types]
     301 |         .set_fmt = v4l2_subdev_get_fmt_ci,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/media/i2c/ak881x.c:220:13: error: use of undeclared identifier 'v4l2_subdev_get_fmt_ci'; did you mean 'v4l2_subdev_notify'?
     220 |         .set_fmt        = v4l2_subdev_get_fmt_ci,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
         |                           v4l2_subdev_notify
   include/media/v4l2-device.h:238:20: note: 'v4l2_subdev_notify' declared here
     238 | static inline void v4l2_subdev_notify(struct v4l2_subdev *sd,
         |                    ^
>> drivers/media/i2c/ak881x.c:220:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'void (struct v4l2_subdev *, unsigned int, void *)' [-Wincompatible-function-pointer-types]
     220 |         .set_fmt        = v4l2_subdev_get_fmt_ci,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +301 drivers/media/i2c/ml86v7667.c

   297	
   298	static const struct v4l2_subdev_pad_ops ml86v7667_subdev_pad_ops = {
   299		.enum_mbus_code = ml86v7667_enum_mbus_code,
   300		.get_fmt = ml86v7667_fill_fmt,
 > 301		.set_fmt = v4l2_subdev_get_fmt_ci,
   302		.get_mbus_config = ml86v7667_get_mbus_config,
   303	};
   304	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

