Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDF4650BF42
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 20:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiDVSEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 14:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbiDVR7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 13:59:16 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7036AC0E52
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650650181; x=1682186181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOrSfq4soGt2N88z6hStkRBr6XcwAVoqR0AjhznAV8w=;
  b=E+0IqfXUx4A3wKR9GeU0Z7y0bL5rWKKXNiMh8SoDDJvpgGoV34jL/zlO
   W7+UBOT1gmCIgHY+eLQZptFSQtTFp5Ko1cNobQbK11S7BdZ0CFdfe8ALX
   SdJDTsi4Mm9oZrjgf8DXA80j+XDfQty+FKd8kFs4QdVttdIno95x1aNzl
   Q/Yf9o35288Ii27/oEBAVTqdYq0IbM2V1lX9V5u4Y8j/tQfTdbT83KnDv
   vmVI2uGcRup0Qemq2HZSl9vmgThAMGJ6ncyc4GGv9DmwSliI07HnEQ8Lx
   UmC+XItPx5VoTZpVVMbqdx0nysFB4V0u1Hv/rwfq7hDmCutkqPxBRJDBW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264903849"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="264903849"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 10:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="563125697"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2022 10:35:54 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nhxCD-000AP8-Io;
        Fri, 22 Apr 2022 17:35:53 +0000
Date:   Sat, 23 Apr 2022 01:35:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4] media: ov5640: Use runtime PM
Message-ID: <202204230149.9CdMTZ0P-lkp@intel.com>
References: <20220422105327.1918427-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422105327.1918427-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Elder/media-ov5640-Use-runtime-PM/20220422-185657
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220423/202204230149.9CdMTZ0P-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/35b46d84ba0a6794350f826f2f70899e266a6064
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Elder/media-ov5640-Use-runtime-PM/20220422-185657
        git checkout 35b46d84ba0a6794350f826f2f70899e266a6064
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov5640.c:3171:1: warning: unused label 'free_ctrls' [-Wunused-label]
   free_ctrls:
   ^~~~~~~~~~~
   1 warning generated.


vim +/free_ctrls +3171 drivers/media/i2c/ov5640.c

0f7acb52911066 Hugues Fruchet      2018-01-03  3028  
e671499303e4c0 Kieran Bingham      2019-07-10  3029  static int ov5640_probe(struct i2c_client *client)
19a81c1426c185 Steve Longerbeam    2017-06-07  3030  {
19a81c1426c185 Steve Longerbeam    2017-06-07  3031  	struct device *dev = &client->dev;
19a81c1426c185 Steve Longerbeam    2017-06-07  3032  	struct fwnode_handle *endpoint;
19a81c1426c185 Steve Longerbeam    2017-06-07  3033  	struct ov5640_dev *sensor;
e6441fde848737 Hugues Fruchet      2018-03-06  3034  	struct v4l2_mbus_framefmt *fmt;
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3035  	u32 rotation;
19a81c1426c185 Steve Longerbeam    2017-06-07  3036  	int ret;
19a81c1426c185 Steve Longerbeam    2017-06-07  3037  
19a81c1426c185 Steve Longerbeam    2017-06-07  3038  	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
19a81c1426c185 Steve Longerbeam    2017-06-07  3039  	if (!sensor)
19a81c1426c185 Steve Longerbeam    2017-06-07  3040  		return -ENOMEM;
19a81c1426c185 Steve Longerbeam    2017-06-07  3041  
19a81c1426c185 Steve Longerbeam    2017-06-07  3042  	sensor->i2c_client = client;
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3043  
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3044  	/*
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3045  	 * default init sequence initialize sensor to
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3046  	 * YUV422 UYVY VGA@30fps
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3047  	 */
e6441fde848737 Hugues Fruchet      2018-03-06  3048  	fmt = &sensor->fmt;
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3049  	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
fb98e29ff1ea5a Hugues Fruchet      2018-08-16  3050  	fmt->colorspace = V4L2_COLORSPACE_SRGB;
e6441fde848737 Hugues Fruchet      2018-03-06  3051  	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
e6441fde848737 Hugues Fruchet      2018-03-06  3052  	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
e6441fde848737 Hugues Fruchet      2018-03-06  3053  	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
e6441fde848737 Hugues Fruchet      2018-03-06  3054  	fmt->width = 640;
e6441fde848737 Hugues Fruchet      2018-03-06  3055  	fmt->height = 480;
e6441fde848737 Hugues Fruchet      2018-03-06  3056  	fmt->field = V4L2_FIELD_NONE;
19a81c1426c185 Steve Longerbeam    2017-06-07  3057  	sensor->frame_interval.numerator = 1;
19a81c1426c185 Steve Longerbeam    2017-06-07  3058  	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
19a81c1426c185 Steve Longerbeam    2017-06-07  3059  	sensor->current_fr = OV5640_30_FPS;
19a81c1426c185 Steve Longerbeam    2017-06-07  3060  	sensor->current_mode =
086c25f8fef9ce Maxime Ripard       2018-12-03  3061  		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
985cdcb08a0488 Hugues Fruchet      2018-09-11  3062  	sensor->last_mode = sensor->current_mode;
19a81c1426c185 Steve Longerbeam    2017-06-07  3063  
19a81c1426c185 Steve Longerbeam    2017-06-07  3064  	sensor->ae_target = 52;
19a81c1426c185 Steve Longerbeam    2017-06-07  3065  
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3066  	/* optional indication of physical rotation of sensor */
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3067  	ret = fwnode_property_read_u32(dev_fwnode(&client->dev), "rotation",
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3068  				       &rotation);
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3069  	if (!ret) {
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3070  		switch (rotation) {
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3071  		case 180:
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3072  			sensor->upside_down = true;
1771e9fb67e2d6 Gustavo A. R. Silva 2020-07-25  3073  			fallthrough;
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3074  		case 0:
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3075  			break;
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3076  		default:
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3077  			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3078  				 rotation);
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3079  		}
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3080  	}
c3f3ba3e6f78ea Hugues Fruchet      2018-06-18  3081  
ce96bcf5b4dbd9 Sakari Ailus        2018-04-24  3082  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
ce96bcf5b4dbd9 Sakari Ailus        2018-04-24  3083  						  NULL);
19a81c1426c185 Steve Longerbeam    2017-06-07  3084  	if (!endpoint) {
19a81c1426c185 Steve Longerbeam    2017-06-07  3085  		dev_err(dev, "endpoint node not found\n");
19a81c1426c185 Steve Longerbeam    2017-06-07  3086  		return -EINVAL;
19a81c1426c185 Steve Longerbeam    2017-06-07  3087  	}
19a81c1426c185 Steve Longerbeam    2017-06-07  3088  
19a81c1426c185 Steve Longerbeam    2017-06-07  3089  	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
19a81c1426c185 Steve Longerbeam    2017-06-07  3090  	fwnode_handle_put(endpoint);
19a81c1426c185 Steve Longerbeam    2017-06-07  3091  	if (ret) {
19a81c1426c185 Steve Longerbeam    2017-06-07  3092  		dev_err(dev, "Could not parse endpoint\n");
19a81c1426c185 Steve Longerbeam    2017-06-07  3093  		return ret;
19a81c1426c185 Steve Longerbeam    2017-06-07  3094  	}
19a81c1426c185 Steve Longerbeam    2017-06-07  3095  
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3096  	if (sensor->ep.bus_type != V4L2_MBUS_PARALLEL &&
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3097  	    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY &&
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3098  	    sensor->ep.bus_type != V4L2_MBUS_BT656) {
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3099  		dev_err(dev, "Unsupported bus type %d\n", sensor->ep.bus_type);
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3100  		return -EINVAL;
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3101  	}
2c61e48d0a19ef Lad Prabhakar       2020-09-04  3102  
19a81c1426c185 Steve Longerbeam    2017-06-07  3103  	/* get system clock (xclk) */
19a81c1426c185 Steve Longerbeam    2017-06-07  3104  	sensor->xclk = devm_clk_get(dev, "xclk");
19a81c1426c185 Steve Longerbeam    2017-06-07  3105  	if (IS_ERR(sensor->xclk)) {
19a81c1426c185 Steve Longerbeam    2017-06-07  3106  		dev_err(dev, "failed to get xclk\n");
19a81c1426c185 Steve Longerbeam    2017-06-07  3107  		return PTR_ERR(sensor->xclk);
19a81c1426c185 Steve Longerbeam    2017-06-07  3108  	}
19a81c1426c185 Steve Longerbeam    2017-06-07  3109  
19a81c1426c185 Steve Longerbeam    2017-06-07  3110  	sensor->xclk_freq = clk_get_rate(sensor->xclk);
19a81c1426c185 Steve Longerbeam    2017-06-07  3111  	if (sensor->xclk_freq < OV5640_XCLK_MIN ||
19a81c1426c185 Steve Longerbeam    2017-06-07  3112  	    sensor->xclk_freq > OV5640_XCLK_MAX) {
19a81c1426c185 Steve Longerbeam    2017-06-07  3113  		dev_err(dev, "xclk frequency out of range: %d Hz\n",
19a81c1426c185 Steve Longerbeam    2017-06-07  3114  			sensor->xclk_freq);
19a81c1426c185 Steve Longerbeam    2017-06-07  3115  		return -EINVAL;
19a81c1426c185 Steve Longerbeam    2017-06-07  3116  	}
19a81c1426c185 Steve Longerbeam    2017-06-07  3117  
19a81c1426c185 Steve Longerbeam    2017-06-07  3118  	/* request optional power down pin */
19a81c1426c185 Steve Longerbeam    2017-06-07  3119  	sensor->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
19a81c1426c185 Steve Longerbeam    2017-06-07  3120  						    GPIOD_OUT_HIGH);
8791a102ce5793 Fabio Estevam       2019-06-28  3121  	if (IS_ERR(sensor->pwdn_gpio))
8791a102ce5793 Fabio Estevam       2019-06-28  3122  		return PTR_ERR(sensor->pwdn_gpio);
8791a102ce5793 Fabio Estevam       2019-06-28  3123  
19a81c1426c185 Steve Longerbeam    2017-06-07  3124  	/* request optional reset pin */
19a81c1426c185 Steve Longerbeam    2017-06-07  3125  	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
19a81c1426c185 Steve Longerbeam    2017-06-07  3126  						     GPIOD_OUT_HIGH);
8791a102ce5793 Fabio Estevam       2019-06-28  3127  	if (IS_ERR(sensor->reset_gpio))
8791a102ce5793 Fabio Estevam       2019-06-28  3128  		return PTR_ERR(sensor->reset_gpio);
19a81c1426c185 Steve Longerbeam    2017-06-07  3129  
19a81c1426c185 Steve Longerbeam    2017-06-07  3130  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
19a81c1426c185 Steve Longerbeam    2017-06-07  3131  
2d18fbc5518f05 Akinobu Mita        2018-11-12  3132  	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
2d18fbc5518f05 Akinobu Mita        2018-11-12  3133  			    V4L2_SUBDEV_FL_HAS_EVENTS;
19a81c1426c185 Steve Longerbeam    2017-06-07  3134  	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
19a81c1426c185 Steve Longerbeam    2017-06-07  3135  	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
19a81c1426c185 Steve Longerbeam    2017-06-07  3136  	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
19a81c1426c185 Steve Longerbeam    2017-06-07  3137  	if (ret)
19a81c1426c185 Steve Longerbeam    2017-06-07  3138  		return ret;
19a81c1426c185 Steve Longerbeam    2017-06-07  3139  
19a81c1426c185 Steve Longerbeam    2017-06-07  3140  	ret = ov5640_get_regulators(sensor);
19a81c1426c185 Steve Longerbeam    2017-06-07  3141  	if (ret)
19a81c1426c185 Steve Longerbeam    2017-06-07  3142  		return ret;
19a81c1426c185 Steve Longerbeam    2017-06-07  3143  
19a81c1426c185 Steve Longerbeam    2017-06-07  3144  	mutex_init(&sensor->lock);
19a81c1426c185 Steve Longerbeam    2017-06-07  3145  
35b46d84ba0a67 Paul Elder          2022-04-22  3146  	ret = ov5640_init_controls(sensor);
0f7acb52911066 Hugues Fruchet      2018-01-03  3147  	if (ret)
0f7acb52911066 Hugues Fruchet      2018-01-03  3148  		goto entity_cleanup;
0f7acb52911066 Hugues Fruchet      2018-01-03  3149  
35b46d84ba0a67 Paul Elder          2022-04-22  3150  	pm_runtime_set_active(dev);
35b46d84ba0a67 Paul Elder          2022-04-22  3151  	pm_runtime_enable(dev);
35b46d84ba0a67 Paul Elder          2022-04-22  3152  	pm_runtime_get(dev);
35b46d84ba0a67 Paul Elder          2022-04-22  3153  
35b46d84ba0a67 Paul Elder          2022-04-22  3154  	ret = ov5640_check_chip_id(sensor);
19a81c1426c185 Steve Longerbeam    2017-06-07  3155  	if (ret)
35b46d84ba0a67 Paul Elder          2022-04-22  3156  		goto err_pm_runtime;
19a81c1426c185 Steve Longerbeam    2017-06-07  3157  
15786f7b564eff Sakari Ailus        2021-03-05  3158  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
19a81c1426c185 Steve Longerbeam    2017-06-07  3159  	if (ret)
35b46d84ba0a67 Paul Elder          2022-04-22  3160  		goto err_pm_runtime;
35b46d84ba0a67 Paul Elder          2022-04-22  3161  
35b46d84ba0a67 Paul Elder          2022-04-22  3162  	pm_runtime_set_autosuspend_delay(dev, 1000);
35b46d84ba0a67 Paul Elder          2022-04-22  3163  	pm_runtime_use_autosuspend(dev);
35b46d84ba0a67 Paul Elder          2022-04-22  3164  	pm_runtime_put_autosuspend(dev);
19a81c1426c185 Steve Longerbeam    2017-06-07  3165  
19a81c1426c185 Steve Longerbeam    2017-06-07  3166  	return 0;
19a81c1426c185 Steve Longerbeam    2017-06-07  3167  
35b46d84ba0a67 Paul Elder          2022-04-22  3168  err_pm_runtime:
35b46d84ba0a67 Paul Elder          2022-04-22  3169  	pm_runtime_disable(dev);
35b46d84ba0a67 Paul Elder          2022-04-22  3170  	pm_runtime_put_autosuspend(dev);
19a81c1426c185 Steve Longerbeam    2017-06-07 @3171  free_ctrls:
19a81c1426c185 Steve Longerbeam    2017-06-07  3172  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
19a81c1426c185 Steve Longerbeam    2017-06-07  3173  entity_cleanup:
19a81c1426c185 Steve Longerbeam    2017-06-07  3174  	media_entity_cleanup(&sensor->sd.entity);
bfcba38d95a0ae Tomi Valkeinen      2020-03-25  3175  	mutex_destroy(&sensor->lock);
19a81c1426c185 Steve Longerbeam    2017-06-07  3176  	return ret;
19a81c1426c185 Steve Longerbeam    2017-06-07  3177  }
19a81c1426c185 Steve Longerbeam    2017-06-07  3178  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
