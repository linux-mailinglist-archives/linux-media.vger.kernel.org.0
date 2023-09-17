Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106A57A3678
	for <lists+linux-media@lfdr.de>; Sun, 17 Sep 2023 17:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbjIQPyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Sep 2023 11:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236146AbjIQPxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Sep 2023 11:53:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47D8129
        for <linux-media@vger.kernel.org>; Sun, 17 Sep 2023 08:53:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15FAA128D;
        Sun, 17 Sep 2023 17:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694965914;
        bh=8jL+IPvjZnCPgxNKSjzVVaaRs2Mh19kulMj4OehP6Qg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LbCfQAnYPx8eiU0QzuCNCJ7FlACOsHeuiZkl8TQ5iJBlUGifuJZfMR9CJfGtQdPek
         WsCDx+fhlE31jP0pzfpmctnPtKDV6qUAbLwNAn2SpKpsrEpbbPMoDf+tXJEuc6I3Gf
         BuA24gT1/TKtltkUhKL3RD2AtfiTw4sV6Q7tSE7Y=
Date:   Sun, 17 Sep 2023 18:53:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for onsemi MT9M114 camera
 sensor
Message-ID: <20230917155342.GA5256@pendragon.ideasonboard.com>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-3-laurent.pinchart@ideasonboard.com>
 <YggbHIrgrmBL8NML@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YggbHIrgrmBL8NML@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Feb 12, 2022 at 10:39:56PM +0200, Sakari Ailus wrote:
> On Mon, Feb 07, 2022 at 03:20:55AM +0200, Laurent Pinchart wrote:
> > The MT9M114 is a CMOS camera sensor that combines a 1296x976 pixel array
> > with a 10-bit dynamic range together with an internal ISP. The driver
> > exposes two subdevs, one for the pixel array and one for the ISP (named
> > IFP for Image Flow Processor). Major supported features are
> > 
> > - Full configuration of analog crop and binning in the pixel array
> > - Full configuration of scaling in the ISP
> > - Automatic exposure and white balance
> > - Manual exposure and analog gain
> > - Horizontal and vertical flip
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Add locking to protect formats and selection rectangles
> > - Move PLL configuration out of register array to code
> > - Add V4L2_SEL_TGT_NATIVE_SIZE support
> > - Add V4L2_CID_PIXEL_RATE support
> > - Set bus_type to V4L2_MBUS_UNKNOWN explicitly
> > - Add OF match table support
> > - Rename MAX_FRAME_RATE macro with MT9M114 prefix and use it through the
> >   driver
> > - Fix crash if controls initialization fails
> > - Fix indentation
> > - Add support for test pattern generator
> > - Define colorspace-related registers
> > - Fix typo in comment
> > - Centralize format information
> > - Select media bus formats based on bus type
> > - Add MIPI timing registers
> > - Print monitor version
> > - Fix clock retrieval error code
> > - Manually enter standby in parallel mode
> > - Use the ISP media entity function for the IFP
> > - Fix access to 32-bit registers
> > - Use OF device match unconditionally
> > - Switch to V4L2_CID_EXPOSURE
> > - Update to the latest subdev API
> > - Rename Aptina to onsemi
> > ---
> >  MAINTAINERS                 |    3 +-
> >  drivers/media/i2c/Kconfig   |   11 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/mt9m114.c | 2467 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 2481 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/media/i2c/mt9m114.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9919a359c12..ed467d03a0b8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13101,7 +13101,8 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> > -F:	Documentation/devicetree/bindings/media/i2c.onnn,mt9m114.yaml
> > +F:	Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > +F:	drivers/media/i2c/mt9m114.c
> >  
> >  MT9P031 APTINA CAMERA SENSOR
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 69c56e24a612..24487e8f94e3 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -1261,6 +1261,17 @@ config VIDEO_MT9M111
> >  	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
> >  	  Micron/Aptina
> >  
> > +config VIDEO_MT9M114
> > +	tristate "onsemi MT9M114 sensor support"
> > +	depends on I2C && OF && VIDEO_V4L2
> > +	select V4L2_FWNODE
> > +	help
> > +	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
> > +	  camera.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called mt9m114.
> > +
> >  config VIDEO_MT9P031
n> >  	tristate "Aptina MT9P031 support"
> >  	depends on I2C && VIDEO_V4L2
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index b01f6cd05ee8..72fc5a7f9ce6 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -94,6 +94,7 @@ obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
> >  obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
> >  obj-$(CONFIG_VIDEO_MT9M032) += mt9m032.o
> >  obj-$(CONFIG_VIDEO_MT9M111) += mt9m111.o
> > +obj-$(CONFIG_VIDEO_MT9M114) += mt9m114.o
> >  obj-$(CONFIG_VIDEO_MT9P031) += mt9p031.o
> >  obj-$(CONFIG_VIDEO_MT9T001) += mt9t001.o
> >  obj-$(CONFIG_VIDEO_MT9T112) += mt9t112.o
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > new file mode 100644
> > index 000000000000..112f764725bf
> > --- /dev/null
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -0,0 +1,2467 @@

[snip]

> > +static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > +{
> > +	struct v4l2_subdev *sd = &sensor->ifp.sd;
> > +	struct media_pad *pads = sensor->ifp.pads;
> > +	struct v4l2_ctrl_handler *hdl = &sensor->ifp.hdl;
> > +	int ret;
> > +
> > +	/* Initialize the subdev. */
> > +	v4l2_i2c_subdev_init(sd, sensor->client, &mt9m114_ifp_ops);
> > +	v4l2_i2c_subdev_set_name(sd, sensor->client, "mt9m114", " ifp");
> 
> The third argument is the driver name override, you could pass NULL here.
> 
> > +
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	sd->internal_ops = &mt9m114_ifp_internal_ops;
> > +
> > +	/* Initialize the media entity. */
> > +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> > +	sd->entity.ops = &mt9m114_entity_ops;
> > +	pads[0].flags = MEDIA_PAD_FL_SINK;
> > +	pads[1].flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&sd->entity, 2, pads);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Initialize the control handler. */
> > +	v4l2_ctrl_handler_init(hdl, 8);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_AUTO_WHITE_BALANCE,
> > +			  0, 1, 1, 1);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_HFLIP,
> > +			  0, 1, 1, 0);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_VFLIP,
> > +			  0, 1, 1, 0);
> > +	v4l2_ctrl_new_std_menu(hdl, &mt9m114_ifp_ctrl_ops,
> > +			       V4L2_CID_EXPOSURE_AUTO,
> > +			       V4L2_EXPOSURE_MANUAL, 0,
> > +			       V4L2_EXPOSURE_AUTO);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_PIXEL_RATE,
> > +			  sensor->pixrate, sensor->pixrate, 1,
> > +			  sensor->pixrate);
> > +
> > +	sensor->ifp.tpg[MT9M114_TPG_PATTERN] =
> > +		v4l2_ctrl_new_std_menu_items(hdl, &mt9m114_ifp_ctrl_ops,
> > +					     V4L2_CID_TEST_PATTERN,
> > +					     ARRAY_SIZE(mt9m114_test_pattern_menu) - 1,
> > +					     0, 0, mt9m114_test_pattern_menu);
> > +	sensor->ifp.tpg[MT9M114_TPG_RED] =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +				  V4L2_CID_TEST_PATTERN_RED,
> > +				  0, 1023, 1, 1023);
> > +	sensor->ifp.tpg[MT9M114_TPG_GREEN] =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +				  V4L2_CID_TEST_PATTERN_GREENR,
> > +				  0, 1023, 1, 1023);
> > +	sensor->ifp.tpg[MT9M114_TPG_BLUE] =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +				  V4L2_CID_TEST_PATTERN_BLUE,
> > +				  0, 1023, 1, 1023);
> 
> Could you add the LINK_FREQ control, please?

I'll give it a try. The sensor documentation isn't very clear on how the
clock tree operates, so I may get it completely wrong :-)

> > +
> > +	v4l2_ctrl_cluster(ARRAY_SIZE(sensor->ifp.tpg), sensor->ifp.tpg);
> > +
> > +	if (hdl->error)
> > +		return hdl->error;
> > +
> > +	ret = v4l2_ctrl_handler_setup(hdl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	sd->ctrl_handler = hdl;
> > +
> > +	/* Initialize the pads formats and selection rectangles. */
> > +	mt9m114_ifp_init_cfg(sd, NULL);
> > +
> > +	sensor->ifp.frame_rate = MT9M114_MAX_FRAME_RATE;
> > +
> > +	return 0;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart
