Return-Path: <linux-media+bounces-19036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A437B98EE01
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 13:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A85E1F218A7
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8843154458;
	Thu,  3 Oct 2024 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfMOywnD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE291422C7;
	Thu,  3 Oct 2024 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954671; cv=none; b=nGgxJH03UATALcCH9fjql/14b4hoUH/3ckoix7Sc0hrjC8xw6J/19cqyfvlXWxhl01tMGNozGrfNcobTNs8D4zg7RXvnlcZOkSrI31yqXWeK6WvbRReE5CamazdJbmfqLgNDo+WBHqJhRF05BomnZ33ax+b5/71JK9k4Xi0PdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954671; c=relaxed/simple;
	bh=PwXsnFC86QN4dkeTF+0QUd4AS8fr7EzNr7PQUgpbuh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkFm+4Bw2kKzbe3mdsHm9j7qohEsT9Fh0NKk1ELylsXdN+ttGD77W2TQx0717N8JB6Sfu9L4l60/VOL8MkYQKOwIM1lPt2mLFwztwR6+KcNeKJt+XaSH2rJI+q1rYXsrSKVC9Hr1tWPpiotErnWHw1CFDlbqytOMy/oR7b+8rIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfMOywnD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727954670; x=1759490670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PwXsnFC86QN4dkeTF+0QUd4AS8fr7EzNr7PQUgpbuh0=;
  b=HfMOywnDA4PmgSLAeg73xL+qcPcnIr7/g80LU/9B+cjf/gSnNoCDpq8H
   Hc57jO1sA6jKY/8HWImdEN8jQKb75+0WLBg4FSi6Vkb7GhkE/5TR5rM/w
   FTM9BwCYBiWNUkYJR0qvGUO8A5bfxklr5gInmfH3+coT8voRW6x/hya31
   wf3U5HJ9NfyqUbkd3lHuvHm9BGibmTBgoOZIHhLWqQV4TxQ5B2/J2Nnzz
   5wg9oHOcpg9kuow1D2nSzk+g9lg0rxTXcOKA0VIK1Wrzzo3Ft+K17oj/6
   NDzDUe9jBHg8Qde0pQR1YWqtaKcOjsKlKdqRYaRNuGU5ZV4k7Ogh3gihL
   w==;
X-CSE-ConnectionGUID: 8JivxtXqTvuxQ+YWFSQ/9g==
X-CSE-MsgGUID: k92CTveTQWqCmkNMIe876Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="49667113"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="49667113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:24:29 -0700
X-CSE-ConnectionGUID: 4V+6lN7WSs2LJypLBQQbwg==
X-CSE-MsgGUID: GINP/FDRSY+xIwmyQjrt/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74001457"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2024 04:24:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swJwW-0000L4-1E;
	Thu, 03 Oct 2024 11:24:24 +0000
Date: Thu, 3 Oct 2024 19:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH] media: Add t4ka3 camera sensor driver
Message-ID: <202410031909.fcXYISbG-lkp@intel.com>
References: <20241002093037.50875-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002093037.50875-1-hpa@redhat.com>

Hi Kate,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.12-rc1 next-20241003]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kate-Hsuan/media-Add-t4ka3-camera-sensor-driver/20241002-173303
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20241002093037.50875-1-hpa%40redhat.com
patch subject: [PATCH] media: Add t4ka3 camera sensor driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031909.fcXYISbG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031909.fcXYISbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031909.fcXYISbG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/t4ka3.c:628:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     628 |         if (sensor->streaming == enable) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/t4ka3.c:689:9: note: uninitialized use occurs here
     689 |         return ret;
         |                ^~~
   drivers/media/i2c/t4ka3.c:628:2: note: remove the 'if' if its condition is always false
     628 |         if (sensor->streaming == enable) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     629 |                 dev_warn(sensor->dev, "Stream already %s\n", enable ? "started" : "stopped");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     630 |                 goto error_unlock;
         |                 ~~~~~~~~~~~~~~~~~~
     631 |         }
         |         ~
   drivers/media/i2c/t4ka3.c:624:9: note: initialize the variable 'ret' to silence this warning
     624 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +628 drivers/media/i2c/t4ka3.c

   620	
   621	static int t4ka3_s_stream(struct v4l2_subdev *sd, int enable)
   622	{
   623		struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
   624		int ret;
   625	
   626		mutex_lock(&sensor->lock);
   627	
 > 628		if (sensor->streaming == enable) {
   629			dev_warn(sensor->dev, "Stream already %s\n", enable ? "started" : "stopped");
   630			goto error_unlock;
   631		}
   632	
   633		if (enable) {
   634			ret = pm_runtime_get_sync(sensor->sd.dev);
   635			if (ret) {
   636				dev_err(sensor->dev, "power-up err.\n");
   637				goto error_unlock;
   638			}
   639	
   640			cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
   641					    ARRAY_SIZE(t4ka3_init_config), &ret);
   642			/* enable group hold */
   643			cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
   644			cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
   645					    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
   646			if (ret)
   647				goto error_powerdown;
   648	
   649			ret = t4ka3_set_mode(sensor);
   650			if (ret)
   651				goto error_powerdown;
   652	
   653			ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
   654						  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
   655			if (ret)
   656				goto error_powerdown;
   657	
   658			/* Restore value of all ctrls */
   659			ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
   660			if (ret)
   661				goto error_powerdown;
   662	
   663			/* disable group hold */
   664			cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
   665			cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
   666			if (ret)
   667				goto error_powerdown;
   668	
   669			sensor->streaming = 1;
   670		} else {
   671			ret = cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
   672			if (ret)
   673				goto error_powerdown;
   674	
   675			ret = pm_runtime_put(sensor->sd.dev);
   676			if (ret)
   677				goto error_unlock;
   678	
   679			sensor->streaming = 0;
   680		}
   681	
   682		mutex_unlock(&sensor->lock);
   683		return ret;
   684	
   685	error_powerdown:
   686		ret = pm_runtime_put(sensor->sd.dev);
   687	error_unlock:
   688		mutex_unlock(&sensor->lock);
   689		return ret;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

