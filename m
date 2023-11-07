Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405FA7E415C
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 14:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbjKGN6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 08:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbjKGN63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 08:58:29 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26273AA7
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699364879; x=1730900879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTAF+Du+Y8H3z09zvQ/TgfITnpAL17YxZRFs+4UOyjM=;
  b=Ve8Tz2YJr9s39Zcm8k5AZDpItYN6XogIYHZm/K8P8o7tKt3Au2D3iu9F
   2owNuv9Mvf0Z3Ndd/d0pn/dLFYlvtMDFIB03v8kLmZDByPbZ8VBPhKXOm
   x5hrwPQOlVwNog8MmVXXki8BvpRO+BE59Vt/iZww9vDXOyGkFo15SZVj/
   yg0Qf2H2Uuf27wSrLo1bypqAJ+zwXq+wfN0ZHb6NWZJZqgT9rN/oFZrMN
   UgwWD0QMqm8yvM1yKAc2YJOLiYJcavtbfUw4/45WCQ3XGveusB81rPKhx
   gVaGbyUeiGnTp7je8KfaTTs8U0LN9HTsIyDDsJsD7iWH0qI5Yhz+jjge7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="8159611"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="8159611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 05:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712567827"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="712567827"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2023 05:47:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r0MQr-00077m-39;
        Tue, 07 Nov 2023 13:47:53 +0000
Date:   Tue, 7 Nov 2023 21:47:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 34/35] drivers/media/i2c/imx274.c:1021:26:
 warning: assignment to 'const struct v4l2_rect *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202311072145.SQJlg9yg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   0cb702cb56ea536100c79ca1fb21cbded087a686
commit: 2d3188eac44a6cd51caefdc7edd3242c133cb034 [34/35] media: v4l: subdev: Remove stream-unaware sub-device state access
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231107/202311072145.SQJlg9yg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072145.SQJlg9yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072145.SQJlg9yg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx274.c: In function '__imx274_change_compose':
   drivers/media/i2c/imx274.c:1021:28: error: implicit declaration of function 'v4l2_subdev_get_pad_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
    1021 |                 cur_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
         |                            v4l2_subdev_state_get_crop
>> drivers/media/i2c/imx274.c:1021:26: warning: assignment to 'const struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1021 |                 cur_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
         |                          ^
   drivers/media/i2c/imx274.c:1022:27: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
    1022 |                 tgt_fmt = v4l2_subdev_get_pad_format(&imx274->sd, sd_state, 0);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           v4l2_subdev_get_fmt
>> drivers/media/i2c/imx274.c:1022:25: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1022 |                 tgt_fmt = v4l2_subdev_get_pad_format(&imx274->sd, sd_state, 0);
         |                         ^
   drivers/media/i2c/imx274.c: In function 'imx274_set_fmt':
   drivers/media/i2c/imx274.c:1115:17: error: invalid type argument of unary '*' (have 'int')
    1115 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx274.c: In function 'imx274_get_selection':
   drivers/media/i2c/imx274.c:1146:26: warning: assignment to 'const struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1146 |                 src_crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
         |                          ^
>> drivers/media/i2c/imx274.c:1147:25: warning: assignment to 'const struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1147 |                 src_fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
         |                         ^
   drivers/media/i2c/imx274.c: In function 'imx274_set_selection_crop':
>> drivers/media/i2c/imx274.c:1218:26: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1218 |                 tgt_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
         |                          ^
   cc1: some warnings being treated as errors
--
   drivers/media/i2c/ov2680.c: In function 'ov2680_init_cfg':
   drivers/media/i2c/ov2680.c:763:10: error: implicit declaration of function 'v4l2_subdev_get_pad_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
     763 |         *v4l2_subdev_get_pad_crop(sd, sd_state, 0) = ov2680_default_crop;
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
         |          v4l2_subdev_state_get_crop
   drivers/media/i2c/ov2680.c:763:9: error: invalid type argument of unary '*' (have 'int')
     763 |         *v4l2_subdev_get_pad_crop(sd, sd_state, 0) = ov2680_default_crop;
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2680.c:765:36: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     765 |         ov2680_fill_format(sensor, v4l2_subdev_get_pad_format(sd, sd_state, 0),
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    v4l2_subdev_get_fmt
>> drivers/media/i2c/ov2680.c:765:36: warning: passing argument 2 of 'ov2680_fill_format' makes pointer from integer without a cast [-Wint-conversion]
     765 |         ov2680_fill_format(sensor, v4l2_subdev_get_pad_format(sd, sd_state, 0),
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    int
   drivers/media/i2c/ov2680.c:330:59: note: expected 'struct v4l2_mbus_framefmt *' but argument is of type 'int'
     330 |                                struct v4l2_mbus_framefmt *fmt,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   drivers/media/i2c/ov6650.c: In function 'ov6650_get_selection':
   drivers/media/i2c/ov6650.c:479:24: error: implicit declaration of function 'v4l2_subdev_get_pad_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
     479 |                 rect = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
         |                        v4l2_subdev_state_get_crop
>> drivers/media/i2c/ov6650.c:479:22: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     479 |                 rect = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
         |                      ^
   drivers/media/i2c/ov6650.c: In function 'ov6650_set_selection':
>> drivers/media/i2c/ov6650.c:535:25: warning: initialization of 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     535 |                         v4l2_subdev_get_pad_crop(sd, sd_state, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov6650.c:537:25: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     537 |                         v4l2_subdev_get_pad_format(sd, sd_state, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         v4l2_subdev_get_fmt
>> drivers/media/i2c/ov6650.c:537:25: warning: initialization of 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/media/i2c/ov6650.c: In function 'ov6650_get_fmt':
   drivers/media/i2c/ov6650.c:594:25: warning: initialization of 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     594 |                         v4l2_subdev_get_pad_format(sd, sd_state, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov6650.c: In function 'ov6650_set_fmt':
   drivers/media/i2c/ov6650.c:725:22: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     725 |                 crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
         |                      ^
   drivers/media/i2c/ov6650.c:733:25: warning: initialization of 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     733 |                         v4l2_subdev_get_pad_format(sd, sd_state, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function 'isc_try_fse':
   drivers/staging/media/deprecated/atmel/atmel-isc-base.c:824:17: error: implicit declaration of function 'v4l2_subdev_get_pad_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
     824 |                 v4l2_subdev_get_pad_crop(isc->current_subdev->sd, sd_state, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 v4l2_subdev_state_get_crop
>> drivers/staging/media/deprecated/atmel/atmel-isc-base.c:824:17: warning: initialization of 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   drivers/media/platform/microchip/microchip-isc-base.c: In function 'isc_try_fse':
   drivers/media/platform/microchip/microchip-isc-base.c:858:17: error: implicit declaration of function 'v4l2_subdev_get_pad_crop'; did you mean 'v4l2_subdev_state_get_crop'? [-Werror=implicit-function-declaration]
     858 |                 v4l2_subdev_get_pad_crop(isc->current_subdev->sd, sd_state, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 v4l2_subdev_state_get_crop
>> drivers/media/platform/microchip/microchip-isc-base.c:858:17: warning: initialization of 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +1021 drivers/media/i2c/imx274.c

39dd23dc9d4c51 Luca Ceresoli    2018-07-25   980  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   981  /**
a4184b4f99019f Hans Verkuil     2021-03-03   982   * __imx274_change_compose - Helper function to change binning and set both
a4184b4f99019f Hans Verkuil     2021-03-03   983   *	compose and format.
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   984   *
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   985   * We have two entry points to change binning: set_fmt and
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   986   * set_selection(COMPOSE). Both have to compute the new output size
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   987   * and set it in both the compose rect and the frame format size. We
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   988   * also need to do the same things after setting cropping to restore
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   989   * 1:1 binning.
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   990   *
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   991   * This function contains the common code for these three cases, it
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   992   * has many arguments in order to accommodate the needs of all of
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   993   * them.
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   994   *
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   995   * Must be called with imx274->lock locked.
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   996   *
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   997   * @imx274: The device object
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10   998   * @sd_state: The subdev state we are editing for TRY requests
39dd23dc9d4c51 Luca Ceresoli    2018-07-25   999   * @which:  V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY from the caller
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1000   * @width:  Input-output parameter: set to the desired width before
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1001   *          the call, contains the chosen value after returning successfully
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1002   * @height: Input-output parameter for height (see @width)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1003   * @flags:  Selection flags from struct v4l2_subdev_selection, or 0 if not
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1004   *          available (when called from set_fmt)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1005   */
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1006  static int __imx274_change_compose(struct stimx274 *imx274,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1007  				   struct v4l2_subdev_state *sd_state,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1008  				   u32 which,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1009  				   u32 *width,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1010  				   u32 *height,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1011  				   u32 flags)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1012  {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1013  	struct device *dev = &imx274->client->dev;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1014  	const struct v4l2_rect *cur_crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1015  	struct v4l2_mbus_framefmt *tgt_fmt;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1016  	unsigned int i;
9648cb577b76ec Luca Ceresoli    2018-08-24  1017  	const struct imx274_mode *best_mode = &imx274_modes[0];
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1018  	int best_goodness = INT_MIN;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1019  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1020  	if (which == V4L2_SUBDEV_FORMAT_TRY) {
c1eec69cbc5285 Laurent Pinchart 2023-10-24 @1021  		cur_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
c1eec69cbc5285 Laurent Pinchart 2023-10-24 @1022  		tgt_fmt = v4l2_subdev_get_pad_format(&imx274->sd, sd_state, 0);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1023  	} else {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1024  		cur_crop = &imx274->crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1025  		tgt_fmt = &imx274->format;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1026  	}
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1027  
9648cb577b76ec Luca Ceresoli    2018-08-24  1028  	for (i = 0; i < ARRAY_SIZE(imx274_modes); i++) {
f70ad2aced3079 Eugen Hristev    2020-09-15  1029  		u8 wratio = imx274_modes[i].wbin_ratio;
f70ad2aced3079 Eugen Hristev    2020-09-15  1030  		u8 hratio = imx274_modes[i].hbin_ratio;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1031  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1032  		int goodness = imx274_binning_goodness(
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1033  			imx274,
f70ad2aced3079 Eugen Hristev    2020-09-15  1034  			cur_crop->width / wratio, *width,
f70ad2aced3079 Eugen Hristev    2020-09-15  1035  			cur_crop->height / hratio, *height,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1036  			flags);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1037  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1038  		if (goodness >= best_goodness) {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1039  			best_goodness = goodness;
9648cb577b76ec Luca Ceresoli    2018-08-24  1040  			best_mode = &imx274_modes[i];
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1041  		}
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1042  	}
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1043  
f70ad2aced3079 Eugen Hristev    2020-09-15  1044  	*width = cur_crop->width / best_mode->wbin_ratio;
f70ad2aced3079 Eugen Hristev    2020-09-15  1045  	*height = cur_crop->height / best_mode->hbin_ratio;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1046  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1047  	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1048  		imx274->mode = best_mode;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1049  
f70ad2aced3079 Eugen Hristev    2020-09-15  1050  	dev_dbg(dev, "%s: selected %ux%u binning\n",
f70ad2aced3079 Eugen Hristev    2020-09-15  1051  		__func__, best_mode->wbin_ratio, best_mode->hbin_ratio);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1052  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1053  	tgt_fmt->width = *width;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1054  	tgt_fmt->height = *height;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1055  	tgt_fmt->field = V4L2_FIELD_NONE;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1056  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1057  	return 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1058  }
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1059  
0985dd306f727d Leon Luo         2017-10-05  1060  /**
0985dd306f727d Leon Luo         2017-10-05  1061   * imx274_get_fmt - Get the pad format
0985dd306f727d Leon Luo         2017-10-05  1062   * @sd: Pointer to V4L2 Sub device structure
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1063   * @sd_state: Pointer to sub device state structure
0985dd306f727d Leon Luo         2017-10-05  1064   * @fmt: Pointer to pad level media bus format
0985dd306f727d Leon Luo         2017-10-05  1065   *
0985dd306f727d Leon Luo         2017-10-05  1066   * This function is used to get the pad format information.
0985dd306f727d Leon Luo         2017-10-05  1067   *
0985dd306f727d Leon Luo         2017-10-05  1068   * Return: 0 on success
0985dd306f727d Leon Luo         2017-10-05  1069   */
0985dd306f727d Leon Luo         2017-10-05  1070  static int imx274_get_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1071  			  struct v4l2_subdev_state *sd_state,
0985dd306f727d Leon Luo         2017-10-05  1072  			  struct v4l2_subdev_format *fmt)
0985dd306f727d Leon Luo         2017-10-05  1073  {
0985dd306f727d Leon Luo         2017-10-05  1074  	struct stimx274 *imx274 = to_imx274(sd);
0985dd306f727d Leon Luo         2017-10-05  1075  
0985dd306f727d Leon Luo         2017-10-05  1076  	mutex_lock(&imx274->lock);
0985dd306f727d Leon Luo         2017-10-05  1077  	fmt->format = imx274->format;
0985dd306f727d Leon Luo         2017-10-05  1078  	mutex_unlock(&imx274->lock);
0985dd306f727d Leon Luo         2017-10-05  1079  	return 0;
0985dd306f727d Leon Luo         2017-10-05  1080  }
0985dd306f727d Leon Luo         2017-10-05  1081  
0985dd306f727d Leon Luo         2017-10-05  1082  /**
0985dd306f727d Leon Luo         2017-10-05  1083   * imx274_set_fmt - This is used to set the pad format
0985dd306f727d Leon Luo         2017-10-05  1084   * @sd: Pointer to V4L2 Sub device structure
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1085   * @sd_state: Pointer to sub device state information structure
0985dd306f727d Leon Luo         2017-10-05  1086   * @format: Pointer to pad level media bus format
0985dd306f727d Leon Luo         2017-10-05  1087   *
0985dd306f727d Leon Luo         2017-10-05  1088   * This function is used to set the pad format.
0985dd306f727d Leon Luo         2017-10-05  1089   *
0985dd306f727d Leon Luo         2017-10-05  1090   * Return: 0 on success
0985dd306f727d Leon Luo         2017-10-05  1091   */
0985dd306f727d Leon Luo         2017-10-05  1092  static int imx274_set_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1093  			  struct v4l2_subdev_state *sd_state,
0985dd306f727d Leon Luo         2017-10-05  1094  			  struct v4l2_subdev_format *format)
0985dd306f727d Leon Luo         2017-10-05  1095  {
0985dd306f727d Leon Luo         2017-10-05  1096  	struct v4l2_mbus_framefmt *fmt = &format->format;
0985dd306f727d Leon Luo         2017-10-05  1097  	struct stimx274 *imx274 = to_imx274(sd);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1098  	int err = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1099  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1100  	mutex_lock(&imx274->lock);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1101  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1102  	err = __imx274_change_compose(imx274, sd_state, format->which,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1103  				      &fmt->width, &fmt->height, 0);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1104  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1105  	if (err)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1106  		goto out;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1107  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1108  	/*
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1109  	 * __imx274_change_compose already set width and height in the
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1110  	 * applicable format, but we need to keep all other format
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1111  	 * values, so do a full copy here
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1112  	 */
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1113  	fmt->field = V4L2_FIELD_NONE;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1114  	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
c1eec69cbc5285 Laurent Pinchart 2023-10-24  1115  		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1116  	else
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1117  		imx274->format = *fmt;
0985dd306f727d Leon Luo         2017-10-05  1118  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1119  out:
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1120  	mutex_unlock(&imx274->lock);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1121  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1122  	return err;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1123  }
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1124  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1125  static int imx274_get_selection(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1126  				struct v4l2_subdev_state *sd_state,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1127  				struct v4l2_subdev_selection *sel)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1128  {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1129  	struct stimx274 *imx274 = to_imx274(sd);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1130  	const struct v4l2_rect *src_crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1131  	const struct v4l2_mbus_framefmt *src_fmt;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1132  	int ret = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1133  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1134  	if (sel->pad != 0)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1135  		return -EINVAL;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1136  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1137  	if (sel->target == V4L2_SEL_TGT_CROP_BOUNDS) {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1138  		sel->r.left = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1139  		sel->r.top = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1140  		sel->r.width = IMX274_MAX_WIDTH;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1141  		sel->r.height = IMX274_MAX_HEIGHT;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1142  		return 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1143  	}
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1144  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1145  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
c1eec69cbc5285 Laurent Pinchart 2023-10-24  1146  		src_crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
c1eec69cbc5285 Laurent Pinchart 2023-10-24 @1147  		src_fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1148  	} else {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1149  		src_crop = &imx274->crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1150  		src_fmt = &imx274->format;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1151  	}
0985dd306f727d Leon Luo         2017-10-05  1152  
0985dd306f727d Leon Luo         2017-10-05  1153  	mutex_lock(&imx274->lock);
0985dd306f727d Leon Luo         2017-10-05  1154  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1155  	switch (sel->target) {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1156  	case V4L2_SEL_TGT_CROP:
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1157  		sel->r = *src_crop;
0985dd306f727d Leon Luo         2017-10-05  1158  		break;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1159  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1160  		sel->r.top = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1161  		sel->r.left = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1162  		sel->r.width = src_crop->width;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1163  		sel->r.height = src_crop->height;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1164  		break;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1165  	case V4L2_SEL_TGT_COMPOSE:
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1166  		sel->r.top = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1167  		sel->r.left = 0;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1168  		sel->r.width = src_fmt->width;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1169  		sel->r.height = src_fmt->height;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1170  		break;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1171  	default:
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1172  		ret = -EINVAL;
0985dd306f727d Leon Luo         2017-10-05  1173  	}
0985dd306f727d Leon Luo         2017-10-05  1174  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1175  	mutex_unlock(&imx274->lock);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1176  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1177  	return ret;
0985dd306f727d Leon Luo         2017-10-05  1178  }
0985dd306f727d Leon Luo         2017-10-05  1179  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1180  static int imx274_set_selection_crop(struct stimx274 *imx274,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1181  				     struct v4l2_subdev_state *sd_state,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1182  				     struct v4l2_subdev_selection *sel)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1183  {
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1184  	struct v4l2_rect *tgt_crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1185  	struct v4l2_rect new_crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1186  	bool size_changed;
0985dd306f727d Leon Luo         2017-10-05  1187  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1188  	/*
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1189  	 * h_step could be 12 or 24 depending on the binning. But we
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1190  	 * won't know the binning until we choose the mode later in
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1191  	 * __imx274_change_compose(). Thus let's be safe and use the
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1192  	 * most conservative value in all cases.
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1193  	 */
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1194  	const u32 h_step = 24;
0985dd306f727d Leon Luo         2017-10-05  1195  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1196  	new_crop.width = min_t(u32,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1197  			       IMX274_ROUND(sel->r.width, h_step, sel->flags),
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1198  			       IMX274_MAX_WIDTH);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1199  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1200  	/* Constraint: HTRIMMING_END - HTRIMMING_START >= 144 */
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1201  	if (new_crop.width < 144)
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1202  		new_crop.width = 144;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1203  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1204  	new_crop.left = min_t(u32,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1205  			      IMX274_ROUND(sel->r.left, h_step, 0),
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1206  			      IMX274_MAX_WIDTH - new_crop.width);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1207  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1208  	new_crop.height = min_t(u32,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1209  				IMX274_ROUND(sel->r.height, 2, sel->flags),
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1210  				IMX274_MAX_HEIGHT);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1211  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1212  	new_crop.top = min_t(u32, IMX274_ROUND(sel->r.top, 2, 0),
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1213  			     IMX274_MAX_HEIGHT - new_crop.height);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1214  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1215  	sel->r = new_crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1216  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1217  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
c1eec69cbc5285 Laurent Pinchart 2023-10-24 @1218  		tgt_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
0985dd306f727d Leon Luo         2017-10-05  1219  	else
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1220  		tgt_crop = &imx274->crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1221  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1222  	mutex_lock(&imx274->lock);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1223  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1224  	size_changed = (new_crop.width != tgt_crop->width ||
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1225  			new_crop.height != tgt_crop->height);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1226  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1227  	/* __imx274_change_compose needs the new size in *tgt_crop */
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1228  	*tgt_crop = new_crop;
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1229  
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1230  	/* if crop size changed then reset the output image size */
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1231  	if (size_changed)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1232  		__imx274_change_compose(imx274, sd_state, sel->which,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1233  					&new_crop.width, &new_crop.height,
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1234  					sel->flags);
0985dd306f727d Leon Luo         2017-10-05  1235  
0985dd306f727d Leon Luo         2017-10-05  1236  	mutex_unlock(&imx274->lock);
39dd23dc9d4c51 Luca Ceresoli    2018-07-25  1237  
0985dd306f727d Leon Luo         2017-10-05  1238  	return 0;
0985dd306f727d Leon Luo         2017-10-05  1239  }
0985dd306f727d Leon Luo         2017-10-05  1240  

:::::: The code at line 1021 was first introduced by commit
:::::: c1eec69cbc52854011e492315c3ef86ac68daa9b media: i2c: Use accessors for pad config 'try_*' fields

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
