Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2847BF92E
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 13:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjJJLGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 07:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjJJLGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 07:06:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2D294
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696936001; x=1728472001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYNPXEXyl8RWhiSV0o9uJDzObOReC36Oqr08dOYNnjQ=;
  b=XalSuLSCm6AzeljtSCggv8QSGmjGPsIGbNjfrjcHPh5kTtCkt1MzXt9j
   Ry78mPGmtOnUv1I6NrlHCza23Qy/hDil7znDOgYzSlq6ypyjzdktYWbNT
   kcI03aaCZRTDWOswxpOLmrzTycLhGCfBj2ykMuHuqHv4T3v9BfqyZWcij
   PmIdKhDJm9fLQQRieJaBJqK1jiP3PpeHNp5yD7UC8/YkHZ7xs+ngAogws
   QYo8QcGU0f4xYb2QbKLIFJsVek1HwLRdL9Bl5nOXSdb1byHrW8h1k0x3Q
   1BVhR+Vz8/8siY5qbMfB4hw0U3qKXDP0bnjPPG/PbJY/w5QYNODBMBCCe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369430697"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="369430697"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 04:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="747037062"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="747037062"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 04:06:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qqAZQ-0000II-23;
        Tue, 10 Oct 2023 11:06:36 +0000
Date:   Tue, 10 Oct 2023 19:06:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 31/36]
 drivers/media/i2c/ccs/ccs-core.c:2222:22: warning: unused variable 'i'
Message-ID: <202310101832.SmsDPmoW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   278fe7fc8a0bdc0cc01b934edf4e2193b0dc195e
commit: f815633f0acd64a5a663a205f74db43d814c7a73 [31/36] media: ccs: Remove ccs_get_crop_compose helper
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310101832.SmsDPmoW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101832.SmsDPmoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101832.SmsDPmoW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ccs/ccs-core.c: In function 'ccs_propagate':
>> drivers/media/i2c/ccs/ccs-core.c:2222:22: warning: unused variable 'i' [-Wunused-variable]
    2222 |         unsigned int i;
         |                      ^


vim +/i +2222 drivers/media/i2c/ccs/ccs-core.c

  2212	
  2213	/* Changes require propagation only on sink pad. */
  2214	static void ccs_propagate(struct v4l2_subdev *subdev,
  2215				  struct v4l2_subdev_state *sd_state, int which,
  2216				  int target)
  2217	{
  2218		struct ccs_sensor *sensor = to_ccs_sensor(subdev);
  2219		struct ccs_subdev *ssd = to_ccs_subdev(subdev);
  2220		struct v4l2_rect *comp, *crop;
  2221		struct v4l2_mbus_framefmt *fmt;
> 2222		unsigned int i;
  2223	
  2224		comp = v4l2_subdev_get_compose_ptr(subdev, sd_state,
  2225						   ssd->sink_pad, CCS_STREAM_PIXEL);
  2226		switch (target) {
  2227		case V4L2_SEL_TGT_CROP:
  2228			crop = v4l2_subdev_get_crop_ptr(subdev, sd_state, CCS_PAD_SINK,
  2229							CCS_STREAM_PIXEL);
  2230			comp->width = crop->width;
  2231			comp->height = crop->height;
  2232			if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
  2233				if (ssd == sensor->scaler) {
  2234					sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
  2235					sensor->scaling_mode =
  2236						CCS_SCALING_MODE_NO_SCALING;
  2237					sensor->scaler_sink = *comp;
  2238				} else if (ssd == sensor->binner) {
  2239					sensor->binning_horizontal = 1;
  2240					sensor->binning_vertical = 1;
  2241				}
  2242			}
  2243			fallthrough;
  2244		case V4L2_SEL_TGT_COMPOSE:
  2245			crop = v4l2_subdev_get_crop_ptr(subdev, sd_state, CCS_PAD_SRC,
  2246							CCS_STREAM_PIXEL);
  2247			*crop = *comp;
  2248			fmt = v4l2_subdev_get_pad_format(subdev, sd_state, CCS_PAD_SRC);
  2249			fmt->width = comp->width;
  2250			fmt->height = comp->height;
  2251			if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
  2252				sensor->src_src = *crop;
  2253			break;
  2254		default:
  2255			WARN_ON_ONCE(1);
  2256		}
  2257	}
  2258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
