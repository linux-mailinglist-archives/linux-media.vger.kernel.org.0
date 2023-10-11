Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443D87C4C89
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 10:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjJKIBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 04:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjJKIA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 04:00:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC9398
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 01:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697011255; x=1728547255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFSAtXo2c5uFO8rZF1ptbHHC65ADRzbScT8LWgffKi4=;
  b=juUjw3A9j2GXY5QwzZQIs2a/WiS7W3aMAXgQpziP9UCtgyqAsJR1sC5f
   UeXunytDCRTREp8sarAyVfHsG74y+AP8Qvz58r5R5P4dZLlJEeZ/Riq7p
   Jrc830d/q7eJx3i+z2ZBo9CuPg/4zgYTn0JzAdecJIL9EdT0nkZumDKE4
   Gy/GX8vOVAK2KjjIRbTTbLRrCw9rmagrg/eK/0+EldCZq/a4GoUpw9tqe
   4da+536Ipk6P7o97XqFQ34iVUTHG4WlYT/FcynV9SxZmtg2ACUH+0byAJ
   Q9UpkV/sNi84cXA769Gu6s2FdsK8BcSnuUGAlfWLficQCI9vfzmuVpCuN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374947454"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="374947454"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 01:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747360836"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747360836"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 01:00:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qqU9D-0001xh-27;
        Wed, 11 Oct 2023 08:00:51 +0000
Date:   Wed, 11 Oct 2023 15:59:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 1/36]
 drivers/staging/media/tegra-video/vi.c:452:20: error: too few arguments to
 function '__v4l2_subdev_state_alloc'
Message-ID: <202310111512.HGE16GfN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   278fe7fc8a0bdc0cc01b934edf4e2193b0dc195e
commit: 089d1f64f9b8140ae312d7ff739af58040904ba3 [1/36] media: v4l: subdev: Set sub-device active state earlier
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231011/202310111512.HGE16GfN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111512.HGE16GfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111512.HGE16GfN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/tegra-video/vi.c: In function '__tegra_channel_try_format':
>> drivers/staging/media/tegra-video/vi.c:452:20: error: too few arguments to function '__v4l2_subdev_state_alloc'
     452 |         sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/media/v4l2-device.h:13,
                    from drivers/staging/media/tegra-video/vi.h:19,
                    from drivers/staging/media/tegra-video/vi.c:30:
   include/media/v4l2-subdev.h:1347:27: note: declared here
    1347 | struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c: In function 'rvin_try_format':
>> drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c:269:20: error: too few arguments to function '__v4l2_subdev_state_alloc'
     269 |         sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/media/v4l2-mc.h:15,
                    from drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c:17:
   include/media/v4l2-subdev.h:1347:27: note: declared here
    1347 | struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/renesas/vsp1/vsp1_entity.c: In function 'vsp1_entity_init':
>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:682:26: error: too few arguments to function '__v4l2_subdev_state_alloc'
     682 |         entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/renesas/vsp1/vsp1_entity.c:15:
   include/media/v4l2-subdev.h:1347:27: note: declared here
    1347 | struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__v4l2_subdev_state_alloc +452 drivers/staging/media/tegra-video/vi.c

3d8a97eabef088 Sowjanya Komatineni 2020-05-04  424  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  425  static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  426  				      struct v4l2_pix_format *pix)
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  427  {
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  428  	const struct tegra_video_format *fmtinfo;
ed647ea668fb27 Tomi Valkeinen      2022-04-12  429  	static struct lock_class_key key;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  430  	struct v4l2_subdev *subdev;
ecefa105cc44ff Laurent Pinchart    2023-02-15  431  	struct v4l2_subdev_format fmt = {
ecefa105cc44ff Laurent Pinchart    2023-02-15  432  		.which = V4L2_SUBDEV_FORMAT_TRY,
ecefa105cc44ff Laurent Pinchart    2023-02-15  433  	};
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  434  	struct v4l2_subdev_state *sd_state;
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  435  	struct v4l2_subdev_frame_size_enum fse = {
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  436  		.which = V4L2_SUBDEV_FORMAT_TRY,
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  437  	};
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  438  	struct v4l2_subdev_selection sdsel = {
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  439  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  440  		.target = V4L2_SEL_TGT_CROP_BOUNDS,
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  441  	};
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  442  	int ret;
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  443  
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  444  	subdev = tegra_channel_get_remote_source_subdev(chan);
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  445  	if (!subdev)
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  446  		return -ENODEV;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  447  
40aaab9d773b07 Tomi Valkeinen      2022-04-12  448  	/*
40aaab9d773b07 Tomi Valkeinen      2022-04-12  449  	 * FIXME: Drop this call, drivers are not supposed to use
40aaab9d773b07 Tomi Valkeinen      2022-04-12  450  	 * __v4l2_subdev_state_alloc().
40aaab9d773b07 Tomi Valkeinen      2022-04-12  451  	 */
ed647ea668fb27 Tomi Valkeinen      2022-04-12 @452  	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
ed647ea668fb27 Tomi Valkeinen      2022-04-12  453  					     &key);
ba7a93e507f883 Dan Carpenter       2021-06-22  454  	if (IS_ERR(sd_state))
ba7a93e507f883 Dan Carpenter       2021-06-22  455  		return PTR_ERR(sd_state);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  456  	/*
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  457  	 * Retrieve the format information and if requested format isn't
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  458  	 * supported, keep the current format.
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  459  	 */
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  460  	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  461  	if (!fmtinfo) {
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  462  		pix->pixelformat = chan->format.pixelformat;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  463  		pix->colorspace = chan->format.colorspace;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  464  		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  465  						     pix->pixelformat);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  466  	}
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  467  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  468  	pix->field = V4L2_FIELD_NONE;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  469  	fmt.pad = 0;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  470  	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  471  
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  472  	/*
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  473  	 * Attempt to obtain the format size from subdev.
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  474  	 * If not available, try to get crop boundary from subdev.
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  475  	 */
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  476  	fse.code = fmtinfo->code;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  477  	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  478  	if (ret) {
56f64b82356b74 Sowjanya Komatineni 2020-12-11  479  		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  480  			sd_state->pads->try_crop.width = 0;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  481  			sd_state->pads->try_crop.height = 0;
56f64b82356b74 Sowjanya Komatineni 2020-12-11  482  		} else {
56f64b82356b74 Sowjanya Komatineni 2020-12-11  483  			ret = v4l2_subdev_call(subdev, pad, get_selection,
56f64b82356b74 Sowjanya Komatineni 2020-12-11  484  					       NULL, &sdsel);
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  485  			if (ret)
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  486  				return -EINVAL;
56f64b82356b74 Sowjanya Komatineni 2020-12-11  487  
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  488  			sd_state->pads->try_crop.width = sdsel.r.width;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  489  			sd_state->pads->try_crop.height = sdsel.r.height;
56f64b82356b74 Sowjanya Komatineni 2020-12-11  490  		}
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  491  	} else {
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  492  		sd_state->pads->try_crop.width = fse.max_width;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  493  		sd_state->pads->try_crop.height = fse.max_height;
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  494  	}
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  495  
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  496  	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  497  	if (ret < 0)
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  498  		return ret;
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  499  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  500  	v4l2_fill_pix_format(pix, &fmt.format);
1a3ea975d79418 Luca Ceresoli       2023-04-18  501  	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  502  
40aaab9d773b07 Tomi Valkeinen      2022-04-12  503  	__v4l2_subdev_state_free(sd_state);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  504  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  505  	return 0;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  506  }
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  507  

:::::: The code at line 452 was first introduced by commit
:::::: ed647ea668fb27cd21408d5cb7cc7d4c30417332 media: subdev: add subdev state locking

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
