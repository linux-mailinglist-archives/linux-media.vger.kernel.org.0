Return-Path: <linux-media+bounces-66420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XCaEIPglR2rqTgAAu9opvQ
	(envelope-from <linux-media+bounces-66420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 05:01:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC096FE0A8
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 05:01:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RR29JL4n;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66420-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66420-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 268293033086
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 03:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1003C271A9A;
	Fri,  3 Jul 2026 03:00:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9C24886A
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 03:00:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047634; cv=none; b=u3ZXGevTPSKCDQp9Opjv/D19vvsviOAhm6AGvW4r2dksPiAsHvzr1QYsytes38VJRgBnUFPwF1yvCUZgonq9UgN4Y9IAVB+tVHLAIQxucyb53XDO+zH0jPn1mJezs+DOvP4quU0JDwEWqPROAc1vZzhhqm7gpH5pS9Sj39I1dWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047634; c=relaxed/simple;
	bh=sNbGTDzn706teQFYlKL2YhG06ZNCjjszGbiPtQE1vsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C1j7fu2R/UDkde+GeHA9AO3c+MDEY+s5RhejcGgtKqOLA8zaqGC1l7d5bvmsNW8+9JFt+idcseYnhfSDBb85LVjiBthJ8g03e+M3KsEvDrw7STXDPsiSfL3etK7AT2tHWAkqLXTikJyO1h1miJSefA9XqJdS5xaVAFsPK0f2eAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR29JL4n; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783047631; x=1814583631;
  h=date:from:to:cc:subject:message-id;
  bh=sNbGTDzn706teQFYlKL2YhG06ZNCjjszGbiPtQE1vsU=;
  b=RR29JL4nvSNwoFDDv87Z/5IacwEAVbZPzynig8UtMP4ZDQlbYxQDrsC6
   QO6L99WdhwWuBYO1rp4QdflneYb2K6ogm1nyUgZ2V4mg9vk1G0qKMCXFk
   KDhWQr3oqIGHrZX1TWVm4rdGQ/gUIVmx7mpqgtULv+8eQF0pVGc5SQcrs
   y74HYtZKVd9+9FzGci3Omo7irZA0qlE1DWc5onKxaJNqXfH03S8h/DvAi
   kKlG7hFHrc5EbQ5WHHznHlAhqUfLkC8+z1dQ7HtSK8ucd9kYwkoODfK4H
   NiQ/GTagaFZa3lgYLpbC1a4j3jg+rz8YmXE1CnWB3XaP9kftBNFXO6bvU
   w==;
X-CSE-ConnectionGUID: XU1QOwEQRey7pSDKngupDA==
X-CSE-MsgGUID: tMZXoIn+RSSyqmnGnmWYYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="109345879"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="109345879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 20:00:31 -0700
X-CSE-ConnectionGUID: u5FemmV8Qi6kXSLqnrK6vQ==
X-CSE-MsgGUID: CeNRU9iZRyO1DPC9Ev5TWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256895145"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2026 20:00:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfU8g-00000000BaR-35FX;
	Fri, 03 Jul 2026 03:00:26 +0000
Date: Fri, 03 Jul 2026 10:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 70/105]
 drivers/media/i2c/ov2740.c:759:23: error: implicit declaration of function
 'v4l2_subdev_sensor_fll_llp_set'; did you mean 'v4l2_sensor_fll_llp_set'?
Message-ID: <202607031040.if7JWI9A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66420-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBC096FE0A8

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   a6d4ce993bcd76851cfc7f28cc33aac011a30fa9
commit: d9f13ba7fd6bf9278ac1eeb18c0191bbfdb78cd1 [70/105] media: ov2740: Add support for FLL and LLP controls
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260703/202607031040.if7JWI9A-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031040.if7JWI9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031040.if7JWI9A-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ov2740.c: In function 'ov2740_set_ctrl':
>> drivers/media/i2c/ov2740.c:759:23: error: implicit declaration of function 'v4l2_subdev_sensor_fll_llp_set'; did you mean 'v4l2_sensor_fll_llp_set'? [-Werror=implicit-function-declaration]
     759 |                 ret = v4l2_subdev_sensor_fll_llp_set(ov2740->fll, ov2740->vblank,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       v4l2_sensor_fll_llp_set
   cc1: some warnings being treated as errors


vim +759 drivers/media/i2c/ov2740.c

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

