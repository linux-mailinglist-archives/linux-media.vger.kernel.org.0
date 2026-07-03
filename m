Return-Path: <linux-media+bounces-66421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bHlRLbItR2oSUAAAu9opvQ
	(envelope-from <linux-media+bounces-66421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 05:34:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9A06FE397
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 05:34:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="g9wl/XB2";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66421-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66421-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9351306EDE8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 03:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807DA2F12C5;
	Fri,  3 Jul 2026 03:21:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AEF2F3622
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 03:21:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783048882; cv=none; b=LxiAKFgu/GQAfp6HGLkj7l8g0rWOexZ7RhIYr2O+ZVzXn2l44Mf9e9qYJupEEsWWJVloHuz9pD9a9X2MbkqzULM+nU/zZVmOM6FY6Ux/VXysCTHaQK8P1QvRz/ejuFX9yDBMgCr2jpx94JmHiYhrDTBPLL1KJXpkpFJT+PYJxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783048882; c=relaxed/simple;
	bh=hv4qiR9uwritaH6baukUyVxNoKcLupLAE21emuEFsh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRXkrYnAq59ao9H7/CynuPUqCp/0GbrvNRbCCwwPLvP91AZ8wyOtGgVcYr63HTVq334eR8sprCdwoOsKKd6RbaLLgeQQgpB0xUSzoGNd0yizhzTviLlTeOdCq5qCKCR5ybcLOsObExdY3Nm2IfRikj3zBG2o8A6QkAyoZCThQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9wl/XB2; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783048880; x=1814584880;
  h=date:from:to:cc:subject:message-id;
  bh=hv4qiR9uwritaH6baukUyVxNoKcLupLAE21emuEFsh0=;
  b=g9wl/XB2TXGZRwu6qxfgoFfv75x07CgBe6p4cAajLdf8uLvEWcwMg935
   QcWLCvVOgHwxlaCJbVt/WERe+ta08gILvBcugYsJRrug/w16jtIaQMyPf
   oaqsnqrpsyHcmPXfytsS370CiieV/zaDqb7fa91IV5vp+XHhnlZADIgqk
   uuc+rxnVOTBVGMd+rco9eoM9lrYjhrJfml4IatVXVR8WM9Xbicfv8PIDR
   IpcVpVHhPNrYChzVRTJH0FUJh48qNAnswat+nvaRN06iAKQm7fk6F+TtF
   6JoDp0D3YgSFJTsrg7oRccu1wskv4qiDU88AIqEpMDLTqiL1jylhzCX4c
   g==;
X-CSE-ConnectionGUID: eAWh3M2WSluZRwguM9EF5w==
X-CSE-MsgGUID: xQEdwGwgS3KZKabQCIQxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83667432"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83667432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 20:21:19 -0700
X-CSE-ConnectionGUID: MNObQy2aQuq1fqMMsHx/2w==
X-CSE-MsgGUID: dYIoikI5TKSxzqoSIWIU4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250352389"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2026 20:21:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfUSZ-00000000Bbx-3cE0;
	Fri, 03 Jul 2026 03:21:05 +0000
Date: Fri, 03 Jul 2026 11:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 70/105]
 drivers/media/i2c/ov2740.c:759:9: error: call to undeclared function
 'v4l2_subdev_sensor_fll_llp_set'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607031103.hxGeHth5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	LONG_SUBJ(1.52)[202];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66421-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D9A06FE397

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   a6d4ce993bcd76851cfc7f28cc33aac011a30fa9
commit: d9f13ba7fd6bf9278ac1eeb18c0191bbfdb78cd1 [70/105] media: ov2740: Add support for FLL and LLP controls
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260703/202607031103.hxGeHth5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031103.hxGeHth5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031103.hxGeHth5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2740.c:759:9: error: call to undeclared function 'v4l2_subdev_sensor_fll_llp_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     759 |                 ret = v4l2_subdev_sensor_fll_llp_set(ov2740->fll, ov2740->vblank,
         |                       ^
   drivers/media/i2c/ov2740.c:759:9: note: did you mean 'v4l2_sensor_fll_llp_set'?
   include/media/v4l2-common.h:782:5: note: 'v4l2_sensor_fll_llp_set' declared here
     782 | int v4l2_sensor_fll_llp_set(struct v4l2_ctrl *fll, struct v4l2_ctrl *vblank,
         |     ^
   1 error generated.


vim +/v4l2_subdev_sensor_fll_llp_set +759 drivers/media/i2c/ov2740.c

   740	
   741	static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
   742	{
   743		struct ov2740 *ov2740 = container_of(ctrl->handler,
   744						     struct ov2740, ctrl_handler);
   745		int ret = 0;
   746	
   747		/* Propagate change of current control to all related controls */
   748		switch (ctrl->id) {
   749		case V4L2_CID_FRAME_LENGTH_LINES:
   750		case V4L2_CID_VBLANK:
   751		case V4L2_CID_LINE_LENGTH_PIXELS:
   752		case V4L2_CID_HBLANK: {
   753			struct v4l2_subdev_state *state =
   754				v4l2_subdev_get_locked_active_state(&ov2740->sd);
   755			const struct v4l2_mbus_framefmt *format =
   756				v4l2_subdev_state_get_format(state, OV2740_PAD_SOURCE,
   757							     OV2740_STREAM_PIXEL);
   758	
 > 759			ret = v4l2_subdev_sensor_fll_llp_set(ov2740->fll, ov2740->vblank,
   760							     ov2740->llp, ov2740->hblank,
   761							     ov2740->exposure, format,
   762							     ctrl, &ov2740->setting_ctrl,
   763							     OV2740_EXPOSURE_MAX_MARGIN);
   764			if (ret)
   765				return ret;
   766		}
   767		}
   768	
   769		/* V4L2 controls values will be applied only when power is already up */
   770		if (!pm_runtime_get_if_in_use(ov2740->dev))
   771			return 0;
   772	
   773		switch (ctrl->id) {
   774		case V4L2_CID_ANALOGUE_GAIN:
   775			ret = ov2740_write_reg(ov2740, OV2740_REG_ANALOG_GAIN, 2,
   776					       ctrl->val);
   777			break;
   778	
   779		case V4L2_CID_DIGITAL_GAIN:
   780			ret = ov2740_update_digital_gain(ov2740, ctrl->val);
   781			break;
   782	
   783		case V4L2_CID_EXPOSURE:
   784			/* 4 least significant bits of expsoure are fractional part */
   785			ret = ov2740_write_reg(ov2740, OV2740_REG_EXPOSURE, 3,
   786					       ctrl->val << 4);
   787			break;
   788	
   789		case V4L2_CID_VBLANK:
   790			break;
   791	
   792		case V4L2_CID_FRAME_LENGTH_LINES:
   793			ret = ov2740_write_reg(ov2740, OV2740_REG_VTS, 2, ctrl->val);
   794			break;
   795	
   796		case V4L2_CID_TEST_PATTERN:
   797			ret = ov2740_test_pattern(ov2740, ctrl->val);
   798			break;
   799	
   800		default:
   801			ret = -EINVAL;
   802			break;
   803		}
   804	
   805		pm_runtime_put(ov2740->dev);
   806	
   807		return ret;
   808	}
   809	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

