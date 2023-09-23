Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4FE7AC226
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 15:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjIWNCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 09:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjIWNCu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 09:02:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9559C11D
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695474164; x=1727010164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/939OpOkW4oebMU9FB0wV1pgeWlOrFM7eE5g9lGMvg=;
  b=acIKtQ6FLyisnmTGSmwuQp3BD6jLjxJn23Lcgq4vExdu01EDAJZSZhk5
   cduYoyXpopsSlROMV0LNRKd2SJd8bDIOJgUk+GuYyLVhvgcnujPiBjiWd
   JpCQcqNv9J7aADs5YJho0kTKREiKfQvsyt99ULwb4NIRmBTQme4X5h1qV
   Q+tZT5mhbTcLH1MCQOleD35pjka6U0QE1/rn1tmTMzqM3M2RHvKnMIFh8
   wFoh1F9Bc5BuRd2GWJJvjfY+osdlgKhgpBeRz35sWdtBHljYkc3CSwkjP
   +uvlwGIJ1Jll74I/tYY9W9vJFqsteWuBOzCHckWtTs3DrjzGdzl2rckDg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371332803"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371332803"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 06:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838088332"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="838088332"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2023 06:02:42 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qk2HQ-0002O3-0r;
        Sat, 23 Sep 2023 13:02:40 +0000
Date:   Sat, 23 Sep 2023 21:02:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 27/37]
 drivers/media/i2c/ccs/ccs-core.c:2421:55: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202309232011.PQpo1XF0-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ecdcf40f8de5c43837eecf44f4927cfd4e1b7f5d
commit: aad8c9a0d2db42312d3e6c64bbbc2248f8915c30 [27/37] media: ccs: Add support for embedded data stream
config: x86_64-randconfig-123-20230923 (https://download.01.org/0day-ci/archive/20230923/202309232011.PQpo1XF0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232011.PQpo1XF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232011.PQpo1XF0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ccs/ccs-core.c:2421:55: sparse: sparse: Using plain integer as NULL pointer

vim +2421 drivers/media/i2c/ccs/ccs-core.c

  2395	
  2396	static int ccs_set_format(struct v4l2_subdev *subdev,
  2397				  struct v4l2_subdev_state *sd_state,
  2398				  struct v4l2_subdev_format *fmt)
  2399	{
  2400		struct ccs_sensor *sensor = to_ccs_sensor(subdev);
  2401		struct ccs_subdev *ssd = to_ccs_subdev(subdev);
  2402		struct v4l2_rect *crops[CCS_PADS];
  2403	
  2404		if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
  2405			return ccs_get_format(subdev, sd_state, fmt);
  2406	
  2407		mutex_lock(&sensor->mutex);
  2408	
  2409		if (subdev == &sensor->src->sd && fmt->stream == CCS_STREAM_META) {
  2410			ccs_set_format_meta(subdev, sd_state, &fmt->format);
  2411	
  2412			mutex_unlock(&sensor->mutex);
  2413	
  2414			return 0;
  2415		}
  2416	
  2417		if (fmt->pad == ssd->source_pad) {
  2418			int rval;
  2419	
  2420			rval = ccs_set_format_source(subdev, sd_state, fmt);
> 2421			ccs_set_format_meta(subdev, sd_state, 0);
  2422	
  2423			mutex_unlock(&sensor->mutex);
  2424	
  2425			return rval;
  2426		}
  2427	
  2428		/* Sink pad. Width and height are changeable here. */
  2429		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
  2430		fmt->format.width &= ~1;
  2431		fmt->format.height &= ~1;
  2432		fmt->format.field = V4L2_FIELD_NONE;
  2433	
  2434		fmt->format.width =
  2435			clamp(fmt->format.width,
  2436			      CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
  2437			      CCS_LIM(sensor, MAX_X_OUTPUT_SIZE));
  2438		fmt->format.height =
  2439			clamp(fmt->format.height,
  2440			      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
  2441			      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
  2442	
  2443		ccs_get_crop_compose(subdev, sd_state, crops, NULL);
  2444	
  2445		crops[ssd->sink_pad]->left = 0;
  2446		crops[ssd->sink_pad]->top = 0;
  2447		crops[ssd->sink_pad]->width = fmt->format.width;
  2448		crops[ssd->sink_pad]->height = fmt->format.height;
  2449		ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
  2450	
  2451		mutex_unlock(&sensor->mutex);
  2452	
  2453		return 0;
  2454	}
  2455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
