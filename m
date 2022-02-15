Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE4F4B6AC9
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 12:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236921AbiBOL1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 06:27:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiBOL1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 06:27:35 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2E7272D;
        Tue, 15 Feb 2022 03:27:23 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2F1581C0014;
        Tue, 15 Feb 2022 11:27:18 +0000 (UTC)
Date:   Tue, 15 Feb 2022 12:28:28 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC PATCH 5/8] media: v4l2-mediabus: Use structures to describe
 bus configuration
Message-ID: <20220215112828.ygnt5dpuefgptdt4@uno.localdomain>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-6-laurent.pinchart+renesas@ideasonboard.com>
 <20220215111316.qpdxnxc253blt6bd@uno.localdomain>
 <YguLXJVz8sZ9+W2Y@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YguLXJVz8sZ9+W2Y@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 15, 2022 at 01:15:40PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Tue, Feb 15, 2022 at 12:13:16PM +0100, Jacopo Mondi wrote:
> > On Mon, Jan 03, 2022 at 06:24:11PM +0200, Laurent Pinchart wrote:
> > > The media bus configuration is specified through a set of flags, some of
> > > which being mutually exclusive. This doesn't scale to express more
> > > complex configurations. Improve the API by replacing the single flags
> > > field in v4l2_mbus_config by a union of v4l2_mbus_config_* structures.
> > > The flags themselves are still used in those structures, so they are
> > > kept here. Drivers are however updated to use structure fields instead
> > > of flags when already possible.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/ipu-v3/ipu-csi.c                |  6 ++---
> > >  drivers/media/i2c/adv7180.c                 |  8 ++++---
> > >  drivers/media/i2c/adv748x/adv748x-csi2.c    | 18 +--------------
> > >  drivers/media/i2c/ml86v7667.c               |  5 +++--
> > >  drivers/media/i2c/mt9m001.c                 |  8 ++++---
> > >  drivers/media/i2c/mt9m111.c                 | 16 +++++++------
> > >  drivers/media/i2c/ov6650.c                  | 14 ++++++------
> > >  drivers/media/i2c/ov9640.c                  |  8 ++++---
> > >  drivers/media/i2c/tc358743.c                | 20 ++---------------
> > >  drivers/media/i2c/tvp5150.c                 |  6 +++--
> > >  drivers/media/platform/pxa_camera.c         | 12 +++++-----
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 16 +++----------
> > >  drivers/staging/media/imx/imx-media-csi.c   |  7 +++---
> > >  drivers/staging/media/imx/imx6-mipi-csi2.c  | 25 +++------------------
> >
> > drivers conversions looks good to me
> >
> > >  include/media/v4l2-mediabus.h               | 20 ++++++++++++++---
> > >  15 files changed, 78 insertions(+), 111 deletions(-)
> > >
> > > diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
> > > index a9639d098893..778bc26d3ba5 100644
> > > --- a/drivers/gpu/ipu-v3/ipu-csi.c
> > > +++ b/drivers/gpu/ipu-v3/ipu-csi.c
> > > @@ -357,11 +357,11 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *csicfg,
> > >  	switch (mbus_cfg->type) {
> > >  	case V4L2_MBUS_PARALLEL:
> > >  		csicfg->ext_vsync = 1;
> > > -		csicfg->vsync_pol = (mbus_cfg->flags &
> > > +		csicfg->vsync_pol = (mbus_cfg->bus.parallel.flags &
> > >  				     V4L2_MBUS_VSYNC_ACTIVE_LOW) ? 1 : 0;
> > > -		csicfg->hsync_pol = (mbus_cfg->flags &
> > > +		csicfg->hsync_pol = (mbus_cfg->bus.parallel.flags &
> > >  				     V4L2_MBUS_HSYNC_ACTIVE_LOW) ? 1 : 0;
> > > -		csicfg->pixclk_pol = (mbus_cfg->flags &
> > > +		csicfg->pixclk_pol = (mbus_cfg->bus.parallel.flags &
> > >  				      V4L2_MBUS_PCLK_SAMPLE_FALLING) ? 1 : 0;
> > >  		csicfg->clk_mode = IPU_CSI_CLK_MODE_GATED_CLK;
> > >  		break;
> > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > > index d9a99fcfacb1..286f5017d9c3 100644
> > > --- a/drivers/media/i2c/adv7180.c
> > > +++ b/drivers/media/i2c/adv7180.c
> > > @@ -784,7 +784,8 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
> > >
> > >  	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
> > >  		cfg->type = V4L2_MBUS_CSI2_DPHY;
> > > -		cfg->flags = V4L2_MBUS_CSI2_1_LANE |
> > > +		cfg->bus.mipi_csi2.num_data_lanes = 1;
> > > +		cfg->bus.mipi_csi2.flags =
> > >  				V4L2_MBUS_CSI2_CHANNEL_0 |
> > >  				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> > >  	} else {
> > > @@ -792,8 +793,9 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
> > >  		 * The ADV7180 sensor supports BT.601/656 output modes.
> > >  		 * The BT.656 is default and not yet configurable by s/w.
> > >  		 */
> > > -		cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_PCLK_SAMPLE_RISING |
> > > -				 V4L2_MBUS_DATA_ACTIVE_HIGH;
> > > +		cfg->bus.parallel.flags = V4L2_MBUS_MASTER |
> > > +					  V4L2_MBUS_PCLK_SAMPLE_RISING |
> > > +					  V4L2_MBUS_DATA_ACTIVE_HIGH;
> > >  		cfg->type = V4L2_MBUS_BT656;
> > >  	}
> > >
> > > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > index 589e9644fcdc..bd4f3fe0e309 100644
> > > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > @@ -222,23 +222,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
> > >  		return -EINVAL;
> > >
> > >  	config->type = V4L2_MBUS_CSI2_DPHY;
> > > -	switch (tx->active_lanes) {
> > > -	case 1:
> > > -		config->flags = V4L2_MBUS_CSI2_1_LANE;
> > > -		break;
> > > -
> > > -	case 2:
> > > -		config->flags = V4L2_MBUS_CSI2_2_LANE;
> > > -		break;
> > > -
> > > -	case 3:
> > > -		config->flags = V4L2_MBUS_CSI2_3_LANE;
> > > -		break;
> > > -
> > > -	case 4:
> > > -		config->flags = V4L2_MBUS_CSI2_4_LANE;
> > > -		break;
> > > -	}
> > > +	config->bus.mipi_csi2.num_data_lanes = tx->active_lanes;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
> > > index 4a1410ebb4c8..48cc0b0922f4 100644
> > > --- a/drivers/media/i2c/ml86v7667.c
> > > +++ b/drivers/media/i2c/ml86v7667.c
> > > @@ -223,9 +223,10 @@ static int ml86v7667_get_mbus_config(struct v4l2_subdev *sd,
> > >  				     unsigned int pad,
> > >  				     struct v4l2_mbus_config *cfg)
> > >  {
> > > -	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_PCLK_SAMPLE_RISING |
> > > -		     V4L2_MBUS_DATA_ACTIVE_HIGH;
> > >  	cfg->type = V4L2_MBUS_BT656;
> > > +	cfg->bus.parallel.flags = V4L2_MBUS_MASTER |
> > > +				  V4L2_MBUS_PCLK_SAMPLE_RISING |
> > > +				  V4L2_MBUS_DATA_ACTIVE_HIGH;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > > index c9f0bd997ea7..ad13b0c890c0 100644
> > > --- a/drivers/media/i2c/mt9m001.c
> > > +++ b/drivers/media/i2c/mt9m001.c
> > > @@ -695,10 +695,12 @@ static int mt9m001_get_mbus_config(struct v4l2_subdev *sd,
> > >  				   struct v4l2_mbus_config *cfg)
> > >  {
> > >  	/* MT9M001 has all capture_format parameters fixed */
> > > -	cfg->flags = V4L2_MBUS_PCLK_SAMPLE_FALLING |
> > > -		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> > > -		V4L2_MBUS_DATA_ACTIVE_HIGH | V4L2_MBUS_MASTER;
> > >  	cfg->type = V4L2_MBUS_PARALLEL;
> > > +	cfg->bus.parallel.flags = V4L2_MBUS_PCLK_SAMPLE_FALLING |
> > > +				  V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_DATA_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_MASTER;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> > > index 91a44359bcd3..6cf3ccf85d27 100644
> > > --- a/drivers/media/i2c/mt9m111.c
> > > +++ b/drivers/media/i2c/mt9m111.c
> > > @@ -1143,15 +1143,17 @@ static int mt9m111_get_mbus_config(struct v4l2_subdev *sd,
> > >  {
> > >  	struct mt9m111 *mt9m111 = container_of(sd, struct mt9m111, subdev);
> > >
> > > -	cfg->flags = V4L2_MBUS_MASTER |
> > > -		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> > > -		V4L2_MBUS_DATA_ACTIVE_HIGH;
> > > -
> > > -	cfg->flags |= mt9m111->pclk_sample ? V4L2_MBUS_PCLK_SAMPLE_RISING :
> > > -		V4L2_MBUS_PCLK_SAMPLE_FALLING;
> > > -
> > >  	cfg->type = V4L2_MBUS_PARALLEL;
> > >
> > > +	cfg->bus.parallel.flags = V4L2_MBUS_MASTER |
> > > +				  V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_DATA_ACTIVE_HIGH;
> > > +
> > > +	cfg->bus.parallel.flags |= mt9m111->pclk_sample ?
> > > +				   V4L2_MBUS_PCLK_SAMPLE_RISING :
> > > +				   V4L2_MBUS_PCLK_SAMPLE_FALLING;
> > > +
> > >  	return 0;
> > >  }
> > >
> > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > index 455a627e35a0..b2654b32bc62 100644
> > > --- a/drivers/media/i2c/ov6650.c
> > > +++ b/drivers/media/i2c/ov6650.c
> > > @@ -932,15 +932,15 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_DATA_ACTIVE_HIGH
> > > -		   | ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
> > > -						: V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > -		   | ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
> > > -						: V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > -		   | ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
> > > -						: V4L2_MBUS_PCLK_SAMPLE_FALLING);
> > >  	cfg->type = V4L2_MBUS_PARALLEL;
> > >
> > > +	cfg->bus.parallel.flags = V4L2_MBUS_MASTER | V4L2_MBUS_DATA_ACTIVE_HIGH
> > > +		| ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
> > > +					     : V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > +		| ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
> > > +					     : V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > +		| ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
> > > +					     : V4L2_MBUS_PCLK_SAMPLE_FALLING);
> > >  	return 0;
> > >  }
> > >
> > > diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
> > > index 0bab8c2cf160..9f44ed52d164 100644
> > > --- a/drivers/media/i2c/ov9640.c
> > > +++ b/drivers/media/i2c/ov9640.c
> > > @@ -652,10 +652,12 @@ static int ov9640_get_mbus_config(struct v4l2_subdev *sd,
> > >  				  unsigned int pad,
> > >  				  struct v4l2_mbus_config *cfg)
> > >  {
> > > -	cfg->flags = V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_MASTER |
> > > -		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> > > -		V4L2_MBUS_DATA_ACTIVE_HIGH;
> > >  	cfg->type = V4L2_MBUS_PARALLEL;
> > > +	cfg->bus.parallel.flags = V4L2_MBUS_PCLK_SAMPLE_RISING |
> > > +				  V4L2_MBUS_MASTER |
> > > +				  V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> > > +				  V4L2_MBUS_DATA_ACTIVE_HIGH;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> > > index 40512004afba..dfbc42675143 100644
> > > --- a/drivers/media/i2c/tc358743.c
> > > +++ b/drivers/media/i2c/tc358743.c
> > > @@ -1613,24 +1613,8 @@ static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
> > >  	cfg->type = V4L2_MBUS_CSI2_DPHY;
> > >
> > >  	/* Support for non-continuous CSI-2 clock is missing in the driver */
> > > -	cfg->flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> > > -
> > > -	switch (state->csi_lanes_in_use) {
> > > -	case 1:
> > > -		cfg->flags |= V4L2_MBUS_CSI2_1_LANE;
> > > -		break;
> > > -	case 2:
> > > -		cfg->flags |= V4L2_MBUS_CSI2_2_LANE;
> > > -		break;
> > > -	case 3:
> > > -		cfg->flags |= V4L2_MBUS_CSI2_3_LANE;
> > > -		break;
> > > -	case 4:
> > > -		cfg->flags |= V4L2_MBUS_CSI2_4_LANE;
> > > -		break;
> > > -	default:
> > > -		return -EINVAL;
> > > -	}
> > > +	cfg->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> > > +	cfg->bus.mipi_csi2.num_data_lanes = state->csi_lanes_in_use;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > > index 4b16ffcaef98..65472438444b 100644
> > > --- a/drivers/media/i2c/tvp5150.c
> > > +++ b/drivers/media/i2c/tvp5150.c
> > > @@ -1198,8 +1198,10 @@ static int tvp5150_get_mbus_config(struct v4l2_subdev *sd,
> > >  	struct tvp5150 *decoder = to_tvp5150(sd);
> > >
> > >  	cfg->type = decoder->mbus_type;
> > > -	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_PCLK_SAMPLE_RISING
> > > -		   | V4L2_MBUS_FIELD_EVEN_LOW | V4L2_MBUS_DATA_ACTIVE_HIGH;
> > > +	cfg->bus.parallel.flags = V4L2_MBUS_MASTER
> > > +				| V4L2_MBUS_PCLK_SAMPLE_RISING
> > > +				| V4L2_MBUS_FIELD_EVEN_LOW
> > > +				| V4L2_MBUS_DATA_ACTIVE_HIGH;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
> > > index b5644cf37fe9..35145e3348f0 100644
> > > --- a/drivers/media/platform/pxa_camera.c
> > > +++ b/drivers/media/platform/pxa_camera.c
> > > @@ -1587,24 +1587,26 @@ static int pxa_camera_set_bus_param(struct pxa_camera_dev *pcdev)
> > >  	 * PXA does not support V4L2_MBUS_DATA_ACTIVE_LOW and the bus mastering
> > >  	 * roles should match.
> > >  	 */
> > > -	if (cfg.flags != mbus_config) {
> > > +	if (cfg.bus.parallel.flags != mbus_config) {
> > >  		unsigned int pxa_mbus_role = mbus_config & (V4L2_MBUS_MASTER |
> > >  							    V4L2_MBUS_SLAVE);
> > > -		if (pxa_mbus_role != (cfg.flags & (V4L2_MBUS_MASTER |
> > > -						   V4L2_MBUS_SLAVE))) {
> > > +		unsigned int flags = cfg.bus.parallel.flags;
> > > +
> > > +		if (pxa_mbus_role != (flags & (V4L2_MBUS_MASTER |
> > > +					       V4L2_MBUS_SLAVE))) {
> > >  			dev_err(pcdev_to_dev(pcdev),
> > >  				"Unsupported mbus configuration: bus mastering\n");
> > >  			return -EINVAL;
> > >  		}
> > >
> > > -		if (cfg.flags & V4L2_MBUS_DATA_ACTIVE_LOW) {
> > > +		if (flags & V4L2_MBUS_DATA_ACTIVE_LOW) {
> > >  			dev_err(pcdev_to_dev(pcdev),
> > >  				"Unsupported mbus configuration: DATA_ACTIVE_LOW\n");
> > >  			return -EINVAL;
> > >  		}
> > >  	}
> > >
> > > -	pxa_camera_setup_cicr(pcdev, cfg.flags, pixfmt);
> > > +	pxa_camera_setup_cicr(pcdev, cfg.bus.parallel.flags, pixfmt);
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index 8c939cb3073d..cbac5801720b 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -603,7 +603,6 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
> > >  				  unsigned int *lanes)
> > >  {
> > >  	struct v4l2_mbus_config mbus_config = { 0 };
> > > -	unsigned int num_lanes = UINT_MAX;
> > >  	int ret;
> > >
> > >  	*lanes = priv->lanes;
> > > @@ -626,23 +625,14 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
> > >  		return -EINVAL;
> > >  	}
> > >
> > > -	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> > > -		num_lanes = 1;
> > > -	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> > > -		num_lanes = 2;
> > > -	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> > > -		num_lanes = 3;
> > > -	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> > > -		num_lanes = 4;
> > > -
> > > -	if (num_lanes > priv->lanes) {
> > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > priv->lanes) {
> > >  		dev_err(priv->dev,
> > >  			"Unsupported mbus config: too many data lanes %u\n",
> > > -			num_lanes);
> > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > >  		return -EINVAL;
> > >  	}
> > >
> > > -	*lanes = num_lanes;
> > > +	*lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > index bd7f156f2d52..b2b1f4dd41d7 100644
> > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > @@ -718,9 +718,10 @@ static int csi_setup(struct csi_priv *priv)
> > >
> > >  	/* compose mbus_config from the upstream endpoint */
> > >  	mbus_cfg.type = priv->upstream_ep.bus_type;
> > > -	mbus_cfg.flags = is_parallel_bus(&priv->upstream_ep) ?
> > > -		priv->upstream_ep.bus.parallel.flags :
> > > -		priv->upstream_ep.bus.mipi_csi2.flags;
> > > +	if (is_parallel_bus(&priv->upstream_ep))
> > > +		mbus_cfg.bus.parallel = priv->upstream_ep.bus.parallel;
> > > +	else
> > > +		mbus_cfg.bus.mipi_csi2 = priv->upstream_ep.bus.mipi_csi2;
> > >
> > >  	if_fmt = *infmt;
> > >  	crop = priv->crop;
> > > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > > index 558b256ac935..c4cb558a85c6 100644
> > > --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> > > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > > @@ -303,7 +303,6 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
> > >  static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
> > >  {
> > >  	struct v4l2_mbus_config mbus_config = { 0 };
> > > -	unsigned int num_lanes = UINT_MAX;
> > >  	int ret;
> > >
> > >  	*lanes = csi2->data_lanes;
> > > @@ -326,32 +325,14 @@ static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
> > >  		return -EINVAL;
> > >  	}
> > >
> > > -	switch (mbus_config.flags & V4L2_MBUS_CSI2_LANES) {
> > > -	case V4L2_MBUS_CSI2_1_LANE:
> > > -		num_lanes = 1;
> > > -		break;
> > > -	case V4L2_MBUS_CSI2_2_LANE:
> > > -		num_lanes = 2;
> > > -		break;
> > > -	case V4L2_MBUS_CSI2_3_LANE:
> > > -		num_lanes = 3;
> > > -		break;
> > > -	case V4L2_MBUS_CSI2_4_LANE:
> > > -		num_lanes = 4;
> > > -		break;
> > > -	default:
> > > -		num_lanes = csi2->data_lanes;
> > > -		break;
> > > -	}
> > > -
> > > -	if (num_lanes > csi2->data_lanes) {
> > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csi2->data_lanes) {
> > >  		dev_err(csi2->dev,
> > >  			"Unsupported mbus config: too many data lanes %u\n",
> > > -			num_lanes);
> > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > >  		return -EINVAL;
> > >  	}
> > >
> > > -	*lanes = num_lanes;
> > > +	*lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > > index 9c4970fbd8ea..269aaf57ba32 100644
> > > --- a/include/media/v4l2-mediabus.h
> > > +++ b/include/media/v4l2-mediabus.h
> > > @@ -166,12 +166,26 @@ enum v4l2_mbus_type {
> > >
> > >  /**
> > >   * struct v4l2_mbus_config - media bus configuration
> > > - * @type:	in: interface type
> > > - * @flags:	in / out: configuration flags, depending on @type
> > > + * @type: interface type
> > > + * @bus: bus configuration data structure
> > > + * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> > > + *		  Used if the bus is parallel or BT.656.
> > > + * @bus.mipi_csi1: embedded &struct v4l2_mbus_config_mipi_csi1.
> > > + *		   Used if the bus is MIPI Alliance's Camera Serial
> > > + *		   Interface version 1 (MIPI CSI1) or Standard
> > > + *		   Mobile Imaging Architecture's Compact Camera Port 2
> > > + *		   (SMIA CCP2).
> > > + * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
> > > + *		   Used if the bus is MIPI Alliance's Camera Serial
> > > + *		   Interface version 2 (MIPI CSI2).
> > >   */
> > >  struct v4l2_mbus_config {
> > >  	enum v4l2_mbus_type type;
> > > -	unsigned int flags;
> > > +	union {
> > > +		struct v4l2_mbus_config_parallel parallel;
> > > +		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> > > +		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> >
> > I wonder if we would be able to use a single structure for D-PHY and
> > C-PHY. The clock lane index does not make much sense for the latter,
> > but it was already there, so it can be changed on top in case it is
> > required
>
> I'm not sure to follow you here. CSI1 and CSI2 are not D-PHY versus
> C-PHY.
>

I meant if we will be able to correctly represent CSI-2 on C-PHY with
struct v4l2_mbus_config_mipi_csi2.

> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > > +	} bus;
> > >  };
> > >
> > >  /**
>
> --
> Regards,
>
> Laurent Pinchart
