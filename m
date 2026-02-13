Return-Path: <linux-media+bounces-52787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI6RKfaxj2k4SwEAu9opvQ
	(envelope-from <linux-media+bounces-52787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 00:21:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40438139F62
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 00:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF62301F175
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 23:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8018D33D6D6;
	Fri, 13 Feb 2026 23:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tpxp+Pib"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB333CE86;
	Fri, 13 Feb 2026 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771024854; cv=none; b=KEfbLAXHwM2J7EsbvqZKj6jKAZIgmr4MZxOQf4hY5ax6q2KGWTT1dH8jZI6rvSi8qMNZb8XKh9fBPZJug7MoTnqFk/g73x2FSvtIQxXJ4PHEglnPpm8oc8g6VjToj2Vni2cMIxY9C5cCjiIk5GSUbSbLXiB6DxS1euEVOFpvims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771024854; c=relaxed/simple;
	bh=UP1k3/aqKqvuuTAexXLYVIICFg/RGeQzEYaH3Yj4530=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMDZh2ZxR/pCAtq4zYKb1olyeDgBm+w6CxsExKihLYmfhWEtlsuhMWK8FF8TFr1VvNCfCw8p7FDav2FAQR1lB9Dx/YFNgf8jojfm2P0HDpfvmcucV2xCj+cnnwkRJXNWhOWNNizxqi4BOQCG3a4IKwIYoZyU8/VLCj/rfl/hyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tpxp+Pib; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771024853; x=1802560853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UP1k3/aqKqvuuTAexXLYVIICFg/RGeQzEYaH3Yj4530=;
  b=Tpxp+PibEgLk9bvu9HFD+9MjlhGUCwr1eehfm/Qu3BVl0dcYqAgrI9jF
   kG1CSn4BZBwUtiSCxsFnwAUbSz+FXL3czN0Bq3ncGDGFSuckDzagHIse1
   jGruVvXoJkLmJ3UmP7CItkkNZjAJu5LJwYSZ47Q/Tf/j4zffel5THL6Qm
   y6Dmmg1pQk7CZLa+1/bt27ane+hpC8b0ozSJ3rYvO6U0XkASNoJICeUuq
   DyfT3chF0SaD7M63fuLivkfaILup16hI7q7L9RN+NQACggkhfVfiqtb3u
   l6lscL537mNDu2HlufDo7ScRu1qwn5c76GdKWHi9YQvtlx/iRTd8AmmPG
   w==;
X-CSE-ConnectionGUID: ckwYwzL6TFmNtxurAAmtCg==
X-CSE-MsgGUID: 12AB7rs1T/+p5rJfjk46LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72202996"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72202996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:20:53 -0800
X-CSE-ConnectionGUID: GOQOO2YpQQC3VCOaEwHDZQ==
X-CSE-MsgGUID: unp07YppQcmFZMvxem8dIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="242391086"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2026 15:20:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2Su-00000000vtk-0Tdb;
	Fri, 13 Feb 2026 23:20:48 +0000
Date: Sat, 14 Feb 2026 07:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 25/25] media: i2c: imx283: Simplify VFLIP control
 setting
Message-ID: <202602140716.ayhsqB6c-lkp@intel.com>
References: <20260213-mainline-imx283-v2-v2-25-be40a3770ebf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-mainline-imx283-v2-v2-25-be40a3770ebf@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52787-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 40438139F62
X-Rspamd-Action: no action

Hi Kieran,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Kieran-Bingham/media-i2c-imx283-Report-correct-V4L2_SEL_TGT_CROP/20260213-221320
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260213-mainline-imx283-v2-v2-25-be40a3770ebf%40ideasonboard.com
patch subject: [PATCH v2 25/25] media: i2c: imx283: Simplify VFLIP control setting
config: openrisc-randconfig-r071-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140716.ayhsqB6c-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140716.ayhsqB6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140716.ayhsqB6c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/imx283.c: In function 'imx283_set_ctrl':
>> drivers/media/i2c/imx283.c:951:3: error: a label can only be part of a statement and a declaration is not a statement
     951 |   u8 trim = IMX283_HTRIMMING_EN;
         |   ^~


vim +951 drivers/media/i2c/imx283.c

   850	
   851	static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
   852	{
   853		struct imx283 *imx283 = container_of(ctrl->handler, struct imx283,
   854						     ctrl_handler);
   855		const struct imx283_mode *mode;
   856		struct v4l2_mbus_framefmt *fmt;
   857		const struct imx283_mode *mode_list;
   858		struct v4l2_subdev_state *state;
   859		unsigned int num_modes;
   860		u64 shr;
   861		int ret = 0;
   862	
   863		state = v4l2_subdev_get_locked_active_state(&imx283->sd);
   864		fmt = v4l2_subdev_state_get_format(state, 0);
   865	
   866		get_mode_table(fmt->code, &mode_list, &num_modes);
   867		mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
   868					      fmt->width, fmt->height);
   869	
   870		/*
   871		 * The VBLANK/HBLANK controls change the limits of usable exposure,
   872		 * so check and adjust if necessary.
   873		 */
   874		if (ctrl->id == V4L2_CID_HBLANK) {
   875			u64 pixel_rate = imx283_pixel_rate(imx283, mode);
   876			u32 max_width = mode->crop.width + ctrl->val;
   877	
   878			imx283->hmax = imx283_internal_clock(pixel_rate, max_width);
   879		}
   880	
   881		if (ctrl->id == V4L2_CID_VBLANK)
   882			imx283->vmax = mode->crop.height + ctrl->val;
   883	
   884		if (ctrl->id == V4L2_CID_HBLANK ||
   885		    ctrl->id == V4L2_CID_VBLANK) {
   886			/* Honour the VBLANK limits when setting exposure. */
   887			s64 current_exposure, max_exposure, min_exposure;
   888	
   889			imx283_exposure_limits(imx283, mode,
   890					       &min_exposure, &max_exposure);
   891	
   892			current_exposure = imx283->exposure->val;
   893			current_exposure = clamp(current_exposure, min_exposure,
   894						 max_exposure);
   895	
   896			__v4l2_ctrl_modify_range(imx283->exposure, min_exposure,
   897						 max_exposure, 1, current_exposure);
   898		}
   899	
   900		/*
   901		 * Applying V4L2 control value only happens
   902		 * when power is up for streaming
   903		 */
   904		if (!pm_runtime_get_if_active(imx283->dev))
   905			return 0;
   906	
   907		switch (ctrl->id) {
   908		case V4L2_CID_EXPOSURE:
   909			shr = imx283_shr(imx283, mode, ctrl->val);
   910			dev_dbg(imx283->dev, "V4L2_CID_EXPOSURE : %d - SHR: %lld\n",
   911				ctrl->val, shr);
   912			ret = cci_write(imx283->cci, IMX283_REG_SHR, shr, NULL);
   913			break;
   914	
   915		case V4L2_CID_HBLANK:
   916			dev_dbg(imx283->dev, "V4L2_CID_HBLANK : %d  HMAX : %u\n",
   917				ctrl->val, imx283->hmax);
   918			ret = cci_write(imx283->cci, IMX283_REG_HMAX, imx283->hmax, NULL);
   919	
   920			/* Recompute the SHR based on the new timings */
   921			shr = imx283_shr(imx283, mode, imx283->exposure->val);
   922			cci_write(imx283->cci, IMX283_REG_SHR, shr, &ret);
   923	
   924			break;
   925	
   926		case V4L2_CID_VBLANK:
   927			imx283->vmax = mode->crop.height + ctrl->val;
   928			dev_dbg(imx283->dev, "V4L2_CID_VBLANK : %d  VMAX : %u\n",
   929				ctrl->val, imx283->vmax);
   930			ret = cci_write(imx283->cci, IMX283_REG_VMAX, imx283->vmax, NULL);
   931	
   932			/* Recompute the SHR based on the new timings */
   933			shr = imx283_shr(imx283, mode, imx283->exposure->val);
   934			cci_write(imx283->cci, IMX283_REG_SHR, shr, &ret);
   935	
   936			break;
   937	
   938		case V4L2_CID_ANALOGUE_GAIN:
   939			ret = cci_write(imx283->cci, IMX283_REG_ANALOG_GAIN, ctrl->val, NULL);
   940			break;
   941	
   942		case V4L2_CID_DIGITAL_GAIN:
   943			ret = cci_write(imx283->cci, IMX283_REG_DIGITAL_GAIN, ctrl->val, NULL);
   944			break;
   945	
   946		case V4L2_CID_VFLIP:
   947			/*
   948			 * VFLIP is managed by BIT(0) of IMX283_REG_HTRIMMING address, hence
   949			 * both need to be set simultaneously.
   950			 */
 > 951			u8 trim = IMX283_HTRIMMING_EN;
   952	
   953			trim |= ctrl->val ? IMX283_MDVREV : 0;
   954			cci_write(imx283->cci, IMX283_REG_HTRIMMING, trim, &ret);
   955	
   956			break;
   957	
   958		case V4L2_CID_TEST_PATTERN:
   959			ret = imx283_update_test_pattern(imx283, ctrl->val);
   960			break;
   961	
   962		default:
   963			dev_err(imx283->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
   964				ctrl->id, ctrl->val);
   965			break;
   966		}
   967	
   968		pm_runtime_put(imx283->dev);
   969	
   970		return ret;
   971	}
   972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

