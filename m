Return-Path: <linux-media+bounces-13490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306590C0F8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 03:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB061F22744
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 01:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDCEDDA0;
	Tue, 18 Jun 2024 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdZNFtXC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876CCD26A
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718672909; cv=none; b=iIJW9V4x0g7CO2imAHZLiCDBauNmm9wlF1KUlmnPksffDfvKN7+h9nMaVKoI4IARy0CArKDPEVDZa9SWxBUoKx26Obj3znRK56Jm2jiKJFbzD2QE9Wm1H0PYTS9TlH8iwT4x2vZeTEWObH/mUjUdP7NQZ6HEwbhxjUhuiF+EKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718672909; c=relaxed/simple;
	bh=dS5esjXfFNI3UiXP2jKde5U1Ifn9NAvclfAm559dwIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMM8ylQKd7oNf/cHyZNud9TwELOF9ZMrdzk7VVT7u//OM8L3Ej/IsnA3PUamveGhCmFzPJZrBSGuRy+QfrvbgZ/HXtP/WWbqhnBmE89xZ9GBlVHC16hfsalyEQN3s7+OeiXt2IrXVmMV36v3nSzYtpH0+yKl50MkAc740/Y+a90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdZNFtXC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718672907; x=1750208907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dS5esjXfFNI3UiXP2jKde5U1Ifn9NAvclfAm559dwIw=;
  b=jdZNFtXCrWvN0WdMwoOVprp7xVqbAzZCLympLUfcIpA419mgdqX7pWVE
   GgAw1faqQ26MLc6eYyiPWU190Ared8/vw07RWE3fcI++75IUOep+kzvdC
   E212tMW3CQSckM6gKmEmE5z3xow/gM1Sk1iRKpIxCVNI20egyzRkZCjeK
   aOdnMnCL40TpxzA4pr2I7RsiCFqTjX6LROcEWEKbdr9CyZlwd/LmXKVRT
   /XzH8bCT2DlrTdZshUTmu55xkEQswXrLQsVDBzpX/vhxBjdbuo7Sn5nmp
   7OShbXG8eQfJFemuWzx8ntd5A1egMYIw1f80BOXFY+ghUWTsN6/gfAnyV
   A==;
X-CSE-ConnectionGUID: nnxU3BYrQVSRUS3g5pDlcg==
X-CSE-MsgGUID: fp2nlwdvTkCQQBPR8F/LVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26939618"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="26939618"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 18:08:26 -0700
X-CSE-ConnectionGUID: kc2BPfYhTjaj1CjVKw3gOQ==
X-CSE-MsgGUID: dRzlPVyGToeRLFHCwNsNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="72123463"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2024 18:08:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJNKe-00054l-1q;
	Tue, 18 Jun 2024 01:08:20 +0000
Date: Tue, 18 Jun 2024 09:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, bingbu.cao@linux.intel.com,
	dave.stevenson@raspberrypi.com, daxing.li@intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
Message-ID: <202406180807.dvu7E34U-lkp@intel.com>
References: <20240614080941.3938212-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614080941.3938212-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/master linuxtv-media-stage/master linus/master v6.10-rc4 next-20240617]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-Add-ar0234-camera-sensor-driver/20240614-161208
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240614080941.3938212-1-dongcheng.yan%40intel.com
patch subject: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
config: powerpc64-randconfig-r064-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180807.dvu7E34U-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180807.dvu7E34U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180807.dvu7E34U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ar0234.c:508:3: error: expected expression
                   u64 reg;
                   ^
>> drivers/media/i2c/ar0234.c:511:12: error: use of undeclared identifier 'reg'; did you mean 'ret'?
                                  &reg, NULL);
                                   ^~~
                                   ret
   drivers/media/i2c/ar0234.c:464:6: note: 'ret' declared here
           int ret;
               ^
   drivers/media/i2c/ar0234.c:515:3: error: use of undeclared identifier 'reg'; did you mean 'ret'?
                   reg &= ~(AR0234_ORIENTATION_HFLIP |
                   ^~~
                   ret
   drivers/media/i2c/ar0234.c:464:6: note: 'ret' declared here
           int ret;
               ^
   drivers/media/i2c/ar0234.c:518:4: error: use of undeclared identifier 'reg'; did you mean 'ret'?
                           reg |= AR0234_ORIENTATION_HFLIP;
                           ^~~
                           ret
   drivers/media/i2c/ar0234.c:464:6: note: 'ret' declared here
           int ret;
               ^
   drivers/media/i2c/ar0234.c:520:4: error: use of undeclared identifier 'reg'; did you mean 'ret'?
                           reg |= AR0234_ORIENTATION_VFLIP;
                           ^~~
                           ret
   drivers/media/i2c/ar0234.c:464:6: note: 'ret' declared here
           int ret;
               ^
   drivers/media/i2c/ar0234.c:523:5: error: use of undeclared identifier 'reg'; did you mean 'ret'?
                                   reg, NULL);
                                   ^~~
                                   ret
   drivers/media/i2c/ar0234.c:464:6: note: 'ret' declared here
           int ret;
               ^
   6 errors generated.


vim +508 drivers/media/i2c/ar0234.c

   455	
   456	static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
   457	{
   458		struct ar0234 *ar0234 =
   459			container_of(ctrl->handler, struct ar0234, ctrl_handler);
   460		struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
   461		s64 exposure_max, exposure_def;
   462		struct v4l2_subdev_state *state;
   463		const struct v4l2_mbus_framefmt *format;
   464		int ret;
   465	
   466		state = v4l2_subdev_get_locked_active_state(&ar0234->sd);
   467		format = v4l2_subdev_state_get_format(state, 0);
   468	
   469		/* Propagate change of current control to all related controls */
   470		if (ctrl->id == V4L2_CID_VBLANK) {
   471			/* Update max exposure while meeting expected vblanking */
   472			exposure_max = format->height + ctrl->val -
   473				       AR0234_EXPOSURE_MAX_MARGIN;
   474			exposure_def = format->height - AR0234_EXPOSURE_MAX_MARGIN;
   475			__v4l2_ctrl_modify_range(ar0234->exposure,
   476						 ar0234->exposure->minimum,
   477						 exposure_max, ar0234->exposure->step,
   478						 exposure_def);
   479		}
   480	
   481		/* V4L2 controls values will be applied only when power is already up */
   482		if (!pm_runtime_get_if_in_use(&client->dev))
   483			return 0;
   484	
   485		switch (ctrl->id) {
   486		case V4L2_CID_ANALOGUE_GAIN:
   487			ret = cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
   488					ctrl->val, NULL);
   489			break;
   490	
   491		case V4L2_CID_DIGITAL_GAIN:
   492			ret = cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
   493					ctrl->val, NULL);
   494			break;
   495	
   496		case V4L2_CID_EXPOSURE:
   497			ret = cci_write(ar0234->regmap, AR0234_REG_EXPOSURE,
   498					ctrl->val, NULL);
   499			break;
   500	
   501		case V4L2_CID_VBLANK:
   502			ret = cci_write(ar0234->regmap, AR0234_REG_VTS,
   503					ar0234->cur_mode->height + ctrl->val, NULL);
   504			break;
   505	
   506		case V4L2_CID_HFLIP:
   507		case V4L2_CID_VFLIP:
 > 508			u64 reg;
   509	
   510			ret = cci_read(ar0234->regmap, AR0234_REG_ORIENTATION,
 > 511				       &reg, NULL);
   512			if (ret)
   513				break;
   514	
   515			reg &= ~(AR0234_ORIENTATION_HFLIP |
   516				 AR0234_ORIENTATION_VFLIP);
   517			if (ar0234->hflip->val)
   518				reg |= AR0234_ORIENTATION_HFLIP;
   519			if (ar0234->vflip->val)
   520				reg |= AR0234_ORIENTATION_VFLIP;
   521	
   522			ret = cci_write(ar0234->regmap, AR0234_REG_ORIENTATION,
   523					reg, NULL);
   524			break;
   525	
   526		case V4L2_CID_TEST_PATTERN:
   527			ret = cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN,
   528					ar0234_test_pattern_val[ctrl->val], NULL);
   529			break;
   530	
   531		default:
   532			ret = -EINVAL;
   533			break;
   534		}
   535	
   536		pm_runtime_put(&client->dev);
   537	
   538		return ret;
   539	}
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

