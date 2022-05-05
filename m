Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA5751C5D6
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 19:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382472AbiEERP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 13:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242491AbiEERP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 13:15:27 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671AF5C75D
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651770707; x=1683306707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u1FYaTGfAwYIyvT2VgCzuIDSbbEnT2oLmYjIT11cmiw=;
  b=PxrmJWL2PfhZ6ShJ6Bi7GHTMEkflMaknVLgPO64TixHiWQQ2z8vU/upe
   pQYtdKLZC6rX9/o9nzoZNcoG8rhmetR4RL2oWKJvEo1MXN/Yikv2tQuu+
   dMksMQ5LzTwBAsmLIsZzaJ2CduOtK4v4F5ouVIe052J+l/LEIjNXl1+/7
   hxSwyfpodWiRxjIHsblz9Gww8+Mov+oqm7J8YmcKZyoanVgRVUMxyxNzV
   ot7DL4LzeOOblVIVBkknqiRsUVbvG+j0DSC+pLOt6uEVZYWz/gYc9L/XG
   hCRWLwaKbheY0+bLcxSLJmvBSd1GkLbc5ZMR1SfKvhdG6iu6CCZJu6X01
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248095038"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="248095038"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 10:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="632527981"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 May 2022 10:11:44 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmf0x-000CbM-TP;
        Thu, 05 May 2022 17:11:43 +0000
Date:   Fri, 6 May 2022 01:11:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, andriy.shevchenko@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Message-ID: <202205060133.HrXVpuXG-lkp@intel.com>
References: <20220504223027.3480287-16-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504223027.3480287-16-djrscally@gmail.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc5 next-20220505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220505-063608
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220506/202205060133.HrXVpuXG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/132a5a799bbe214b679bc8e242193c5c1ff1d967
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220505-063608
        git checkout 132a5a799bbe214b679bc8e242193c5c1ff1d967
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/crypto/ drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov7251.c:1218:18: warning: variable 'vblank_def' set but not used [-Wunused-but-set-variable]
           int vblank_max, vblank_def;
                           ^
   drivers/media/i2c/ov7251.c:193:37: warning: unused variable 'ov7251_pll1_cfg_24_mhz_319_2_mhz' [-Wunused-const-variable]
   static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
                                       ^
   2 warnings generated.


vim +/vblank_def +1218 drivers/media/i2c/ov7251.c

  1211	
  1212	static int ov7251_set_format(struct v4l2_subdev *sd,
  1213				     struct v4l2_subdev_state *sd_state,
  1214				     struct v4l2_subdev_format *format)
  1215	{
  1216		struct ov7251 *ov7251 = to_ov7251(sd);
  1217		struct v4l2_mbus_framefmt *__format;
> 1218		int vblank_max, vblank_def;
  1219		struct v4l2_rect *__crop;
  1220		const struct ov7251_mode_info *new_mode;
  1221		int ret = 0;
  1222	
  1223		mutex_lock(&ov7251->lock);
  1224	
  1225		__crop = __ov7251_get_pad_crop(ov7251, sd_state, format->pad,
  1226					       format->which);
  1227	
  1228		new_mode = v4l2_find_nearest_size(ov7251_mode_info_data,
  1229					ARRAY_SIZE(ov7251_mode_info_data),
  1230					width, height,
  1231					format->format.width, format->format.height);
  1232	
  1233		__crop->width = new_mode->width;
  1234		__crop->height = new_mode->height;
  1235	
  1236		if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
  1237			ret = __v4l2_ctrl_modify_range(ov7251->exposure,
  1238						       1, new_mode->exposure_max,
  1239						       1, new_mode->exposure_def);
  1240			if (ret < 0)
  1241				goto exit;
  1242	
  1243			ret = __v4l2_ctrl_s_ctrl(ov7251->exposure,
  1244						 new_mode->exposure_def);
  1245			if (ret < 0)
  1246				goto exit;
  1247	
  1248			ret = __v4l2_ctrl_s_ctrl(ov7251->gain, 16);
  1249			if (ret < 0)
  1250				goto exit;
  1251	
  1252			vblank_max = OV7251_TIMING_MAX_VTS - new_mode->height;
  1253			vblank_def = new_mode->vts - new_mode->height;
  1254			ret = __v4l2_ctrl_modify_range(ov7251->vblank,
  1255						       OV7251_TIMING_MIN_VTS,
  1256						       vblank_max, 1, vblank_max);
  1257			if (ret < 0)
  1258				goto exit;
  1259	
  1260			ov7251->current_mode = new_mode;
  1261		}
  1262	
  1263		__format = __ov7251_get_pad_format(ov7251, sd_state, format->pad,
  1264						   format->which);
  1265		__format->width = __crop->width;
  1266		__format->height = __crop->height;
  1267		__format->code = MEDIA_BUS_FMT_Y10_1X10;
  1268		__format->field = V4L2_FIELD_NONE;
  1269		__format->colorspace = V4L2_COLORSPACE_SRGB;
  1270		__format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(__format->colorspace);
  1271		__format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
  1272					__format->colorspace, __format->ycbcr_enc);
  1273		__format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(__format->colorspace);
  1274	
  1275		format->format = *__format;
  1276	
  1277	exit:
  1278		mutex_unlock(&ov7251->lock);
  1279	
  1280		return ret;
  1281	}
  1282	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
