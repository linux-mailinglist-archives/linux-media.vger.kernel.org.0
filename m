Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9004AD0CE
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 06:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244386AbiBHFcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 00:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347088AbiBHE7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 23:59:53 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB0FC0401DC
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 20:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644296392; x=1675832392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBHiuHEZEFmC5lf0KD2XYEiYvcv4G3i2lqQU/xw85yI=;
  b=bo+++KuWhYbaQsXo/FkjFgaBRiGslEHFiskg+yoXDOJIeWmasYNAELPW
   9MmqWGlRMHeC5ixRcQpRjzAdjH56b7zJn5nvDwdRnFeQsbkm1xOdMdplb
   KITRYiBxp6n5lSIdXdLxX15At6/zMBGig583Yp3GGdBrmwYy71g9KK7/r
   A8PoVh4rzOTItxeoIC/0pHO21Wa9NmraEh4LMrsYaqXAXMP5JVM74638U
   vIAucDuYSfdwkExtiOHBZHzUE0cyjpXHOOoMjt/Ko4OFe3moRE+hG0OvB
   0FKjQleBDUa5Gof8q8T1Hg4AsQ3ZWH6YvM1FgweUoN7izd2FqBg8olILT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="309615369"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="309615369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 20:59:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="567723142"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2022 20:59:15 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHIaw-0001N8-NZ; Tue, 08 Feb 2022 04:59:14 +0000
Date:   Tue, 8 Feb 2022 12:58:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     kbuild-all@lists.01.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 7/7] media: subdev: rename
 v4l2_subdev_pad_config.try_* fields
Message-ID: <202202081223.gzH6LYK9-lkp@intel.com>
References: <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on tegra/for-next v5.17-rc3]
[cannot apply to next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen/v4l-subdev-active-state/20220208-002350
base:   git://linuxtv.org/media_tree.git master
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220208/202202081223.gzH6LYK9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8283dea08111c6a813e9340d735c158df3fcbe5f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/v4l-subdev-active-state/20220208-002350
        git checkout 8283dea08111c6a813e9340d735c158df3fcbe5f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/media/tegra-video/vi.c: In function '__tegra_channel_try_format':
>> drivers/staging/media/tegra-video/vi.c:544:39: error: 'struct v4l2_subdev_pad_config' has no member named 'try_crop'
     544 |                         sd_state->pads->try_crop.width = 0;
         |                                       ^~
   drivers/staging/media/tegra-video/vi.c:545:39: error: 'struct v4l2_subdev_pad_config' has no member named 'try_crop'
     545 |                         sd_state->pads->try_crop.height = 0;
         |                                       ^~
   drivers/staging/media/tegra-video/vi.c:552:39: error: 'struct v4l2_subdev_pad_config' has no member named 'try_crop'
     552 |                         sd_state->pads->try_crop.width = sdsel.r.width;
         |                                       ^~
   drivers/staging/media/tegra-video/vi.c:553:39: error: 'struct v4l2_subdev_pad_config' has no member named 'try_crop'
     553 |                         sd_state->pads->try_crop.height = sdsel.r.height;
         |                                       ^~
   drivers/staging/media/tegra-video/vi.c:556:31: error: 'struct v4l2_subdev_pad_config' has no member named 'try_crop'
     556 |                 sd_state->pads->try_crop.width = fse.max_width;
         |                               ^~
   drivers/staging/media/tegra-video/vi.c:557:31: error: 'struct v4l2_subdev_pad_config' has no member named 'try_crop'
     557 |                 sd_state->pads->try_crop.height = fse.max_height;
         |                               ^~


vim +544 drivers/staging/media/tegra-video/vi.c

3d8a97eabef088 Sowjanya Komatineni 2020-05-04  489  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  490  static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  491  				      struct v4l2_pix_format *pix)
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  492  {
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  493  	const struct tegra_video_format *fmtinfo;
d156949c999153 Tomi Valkeinen      2022-02-07  494  	static struct lock_class_key key;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  495  	struct v4l2_subdev *subdev;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  496  	struct v4l2_subdev_format fmt;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  497  	struct v4l2_subdev_state *sd_state;
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  498  	struct v4l2_subdev_frame_size_enum fse = {
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  499  		.which = V4L2_SUBDEV_FORMAT_TRY,
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  500  	};
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  501  	struct v4l2_subdev_selection sdsel = {
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  502  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  503  		.target = V4L2_SEL_TGT_CROP_BOUNDS,
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  504  	};
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  505  	int ret;
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  506  
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  507  	subdev = tegra_channel_get_remote_source_subdev(chan);
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  508  	if (!subdev)
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  509  		return -ENODEV;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  510  
d156949c999153 Tomi Valkeinen      2022-02-07  511  	/*
d156949c999153 Tomi Valkeinen      2022-02-07  512  	 * FIXME: Drop this call, drivers are not supposed to use
d156949c999153 Tomi Valkeinen      2022-02-07  513  	 * __v4l2_subdev_state_alloc().
d156949c999153 Tomi Valkeinen      2022-02-07  514  	 */
d156949c999153 Tomi Valkeinen      2022-02-07  515  	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
d156949c999153 Tomi Valkeinen      2022-02-07  516  					     &key);
ba7a93e507f883 Dan Carpenter       2021-06-22  517  	if (IS_ERR(sd_state))
ba7a93e507f883 Dan Carpenter       2021-06-22  518  		return PTR_ERR(sd_state);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  519  	/*
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  520  	 * Retrieve the format information and if requested format isn't
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  521  	 * supported, keep the current format.
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  522  	 */
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  523  	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  524  	if (!fmtinfo) {
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  525  		pix->pixelformat = chan->format.pixelformat;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  526  		pix->colorspace = chan->format.colorspace;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  527  		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  528  						     pix->pixelformat);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  529  	}
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  530  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  531  	pix->field = V4L2_FIELD_NONE;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  532  	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  533  	fmt.pad = 0;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  534  	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  535  
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  536  	/*
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  537  	 * Attempt to obtain the format size from subdev.
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  538  	 * If not available, try to get crop boundary from subdev.
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  539  	 */
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  540  	fse.code = fmtinfo->code;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  541  	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  542  	if (ret) {
56f64b82356b74 Sowjanya Komatineni 2020-12-11  543  		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10 @544  			sd_state->pads->try_crop.width = 0;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  545  			sd_state->pads->try_crop.height = 0;
56f64b82356b74 Sowjanya Komatineni 2020-12-11  546  		} else {
56f64b82356b74 Sowjanya Komatineni 2020-12-11  547  			ret = v4l2_subdev_call(subdev, pad, get_selection,
56f64b82356b74 Sowjanya Komatineni 2020-12-11  548  					       NULL, &sdsel);
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  549  			if (ret)
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  550  				return -EINVAL;
56f64b82356b74 Sowjanya Komatineni 2020-12-11  551  
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  552  			sd_state->pads->try_crop.width = sdsel.r.width;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  553  			sd_state->pads->try_crop.height = sdsel.r.height;
56f64b82356b74 Sowjanya Komatineni 2020-12-11  554  		}
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  555  	} else {
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  556  		sd_state->pads->try_crop.width = fse.max_width;
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  557  		sd_state->pads->try_crop.height = fse.max_height;
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  558  	}
bdcad5ce6dde6e Sowjanya Komatineni 2020-08-12  559  
0d346d2a6f54f0 Tomi Valkeinen      2021-06-10  560  	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  561  	if (ret < 0)
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  562  		return ret;
1ebaeb09830f36 Sowjanya Komatineni 2020-08-12  563  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  564  	v4l2_fill_pix_format(pix, &fmt.format);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  565  	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  566  
a702cbb5ddd2f7 Tomi Valkeinen      2022-02-07  567  	__v4l2_subdev_state_free(sd_state);
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  568  
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  569  	return 0;
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  570  }
3d8a97eabef088 Sowjanya Komatineni 2020-05-04  571  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
