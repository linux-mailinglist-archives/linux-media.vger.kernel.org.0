Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D4A4B599E
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 19:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357364AbiBNSNa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 13:13:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbiBNSN3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 13:13:29 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8515A60D88;
        Mon, 14 Feb 2022 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644862400; x=1676398400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRuGqYqvQT7YIu8hO9Kj5VsFn7/ndEIqjgTesKxCEWQ=;
  b=mBdcrpc5R7ezavZGHfThc//q3kO6oEZ4RVxcUAKa48XyAjFgDpFOVlaM
   +QsUDvkmfe3lo2y0ke2EcYJev+6Xeo9mV62NA5LX0nkYD9pCFhFnArX2P
   jVQv1sHTwoWGiuUyymJOO8xnEWYhIefqjpPs8Oifge9FXGlVTcmPS6uC4
   wFTwMM6ZcbYwoWwoJDnUdIDeK5lpbVLvxkvkwdQrkzJ56vQ8oZ/0q/+55
   tLwFCSRjYnflkGhc1QIKI3a+TFhl2nu4I0OchX10+av2WsaktAiMfn/DQ
   XXsSrfnjrVNdlc6xEeanQprQRjz6agxkd2A6zBv8rpKnOZZHfkrh8EAtO
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230117120"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="230117120"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 10:13:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="632273282"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 10:12:59 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BCA7F202AE;
        Mon, 14 Feb 2022 20:12:57 +0200 (EET)
Date:   Mon, 14 Feb 2022 20:12:57 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 30/66] media: sun6i-csi: Add bridge v4l2 subdev with
 port management
Message-ID: <YgqbqVRinNxQ8+WV@paasikivi.fi.intel.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-31-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-31-paul.kocialkowski@bootlin.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Sat, Feb 05, 2022 at 07:53:53PM +0100, Paul Kocialkowski wrote:
> Introduce a bridge v4l2 subdev to prepare for separation between the
> processing part (bridge) and the dma engine, which is required to
> properly support ths isp workflow later on.
> 
> Currently the bridge just manages fwnode mapping to media pads,
> using an async notifier (which was previously in the main code).
> The s_stream video op just forwards to the connected v4l2 subdev
> (sensor or MIPI CSI-2 bridge).
> 
> The video capture device is now registered after the bridge and
> attaches to it with a media link.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/platform/sunxi/sun6i-csi/Makefile   |   2 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 156 +-----
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  12 +-
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 473 ++++++++++++++++++
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |  44 ++
>  .../platform/sunxi/sun6i-csi/sun6i_video.c    |  19 +
>  6 files changed, 571 insertions(+), 135 deletions(-)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/Makefile b/drivers/media/platform/sunxi/sun6i-csi/Makefile
> index e7e315347804..7a699580a641 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/Makefile
> +++ b/drivers/media/platform/sunxi/sun6i-csi/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -sun6i-csi-y += sun6i_video.o sun6i_csi.o
> +sun6i-csi-y += sun6i_video.o sun6i_csi.o sun6i_csi_bridge.o
>  
>  obj-$(CONFIG_VIDEO_SUN6I_CSI) += sun6i-csi.o
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index c8fe31cc38b5..a1847ae3e88e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -34,16 +34,17 @@
>  bool sun6i_csi_is_format_supported(struct sun6i_csi_device *csi_dev,
>  				   u32 pixformat, u32 mbus_code)
>  {
> -	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
> +	struct v4l2_fwnode_endpoint *endpoint =
> +		&csi_dev->bridge.source->endpoint;
>  
>  	/*
>  	 * Some video receivers have the ability to be compatible with
>  	 * 8bit and 16bit bus width.
>  	 * Identify the media bus format from device tree.
>  	 */
> -	if ((v4l2->v4l2_ep.bus_type == V4L2_MBUS_PARALLEL
> -	     || v4l2->v4l2_ep.bus_type == V4L2_MBUS_BT656)
> -	     && v4l2->v4l2_ep.bus.parallel.bus_width == 16) {
> +	if ((endpoint->bus_type == V4L2_MBUS_PARALLEL
> +	     || endpoint->bus_type == V4L2_MBUS_BT656)
> +	     && endpoint->bus.parallel.bus_width == 16) {
>  		switch (pixformat) {
>  		case V4L2_PIX_FMT_NV12_16L16:
>  		case V4L2_PIX_FMT_NV12:
> @@ -328,7 +329,8 @@ static enum csi_input_seq get_csi_input_seq(struct sun6i_csi_device *csi_dev,
>  
>  static void sun6i_csi_setup_bus(struct sun6i_csi_device *csi_dev)
>  {
> -	struct v4l2_fwnode_endpoint *endpoint = &csi_dev->v4l2.v4l2_ep;
> +	struct v4l2_fwnode_endpoint *endpoint =
> +		&csi_dev->bridge.source->endpoint;
>  	struct sun6i_csi_config *config = &csi_dev->config;
>  	unsigned char bus_width;
>  	u32 flags;
> @@ -583,95 +585,11 @@ static const struct media_device_ops sun6i_csi_media_ops = {
>  
>  /* V4L2 */
>  
> -static int sun6i_csi_link_entity(struct sun6i_csi_device *csi_dev,
> -				 struct media_entity *entity,
> -				 struct fwnode_handle *fwnode)
> +int sun6i_csi_v4l2_complete(struct sun6i_csi_device *csi_dev)
>  {
> -	struct media_entity *sink;
> -	struct media_pad *sink_pad;
> -	int src_pad_index;
> -	int ret;
> -
> -	ret = media_entity_get_fwnode_pad(entity, fwnode, MEDIA_PAD_FL_SOURCE);
> -	if (ret < 0) {
> -		dev_err(csi_dev->dev,
> -			"%s: no source pad in external entity %s\n", __func__,
> -			entity->name);
> -		return -EINVAL;
> -	}
> -
> -	src_pad_index = ret;
> -
> -	sink = &csi_dev->video.video_dev.entity;
> -	sink_pad = &csi_dev->video.pad;
> -
> -	dev_dbg(csi_dev->dev, "creating %s:%u -> %s:%u link\n",
> -		entity->name, src_pad_index, sink->name, sink_pad->index);
> -	ret = media_create_pad_link(entity, src_pad_index, sink,
> -				    sink_pad->index,
> -				    MEDIA_LNK_FL_ENABLED |
> -				    MEDIA_LNK_FL_IMMUTABLE);
> -	if (ret < 0) {
> -		dev_err(csi_dev->dev, "failed to create %s:%u -> %s:%u link\n",
> -			entity->name, src_pad_index,
> -			sink->name, sink_pad->index);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int sun6i_subdev_notify_complete(struct v4l2_async_notifier *notifier)
> -{
> -	struct sun6i_csi_device *csi_dev =
> -		container_of(notifier, struct sun6i_csi_device,
> -			     v4l2.notifier);
> -	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
> -	struct v4l2_device *v4l2_dev = &v4l2->v4l2_dev;
> -	struct v4l2_subdev *sd;
> -	int ret;
> -
> -	dev_dbg(csi_dev->dev, "notify complete, all subdevs registered\n");
> -
> -	sd = list_first_entry(&v4l2_dev->subdevs, struct v4l2_subdev, list);
> -	if (!sd)
> -		return -EINVAL;
> -
> -	ret = sun6i_csi_link_entity(csi_dev, &sd->entity, sd->fwnode);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = v4l2_device_register_subdev_nodes(v4l2_dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -static const struct v4l2_async_notifier_operations sun6i_csi_async_ops = {
> -	.complete = sun6i_subdev_notify_complete,
> -};
> -
> -static int sun6i_csi_fwnode_parse(struct device *dev,
> -				  struct v4l2_fwnode_endpoint *vep,
> -				  struct v4l2_async_subdev *asd)
> -{
> -	struct sun6i_csi_device *csi_dev = dev_get_drvdata(dev);
> +	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
>  
> -	if (vep->base.port || vep->base.id) {
> -		dev_warn(dev, "Only support a single port with one endpoint\n");
> -		return -ENOTCONN;
> -	}
> -
> -	switch (vep->bus_type) {
> -	case V4L2_MBUS_PARALLEL:
> -	case V4L2_MBUS_BT656:
> -		csi_dev->v4l2.v4l2_ep = *vep;
> -		return 0;
> -	default:
> -		dev_err(dev, "Unsupported media bus type\n");
> -		return -ENOTCONN;
> -	}
> +	return v4l2_device_register_subdev_nodes(v4l2_dev);
>  }
>  
>  static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
> @@ -679,7 +597,6 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
>  	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
>  	struct media_device *media_dev = &v4l2->media_dev;
>  	struct v4l2_device *v4l2_dev = &v4l2->v4l2_dev;
> -	struct v4l2_async_notifier *notifier = &v4l2->notifier;
>  	struct device *dev = csi_dev->dev;
>  	int ret;
>  
> @@ -720,42 +637,8 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
>  		goto error_v4l2_ctrl;
>  	}
>  
> -	/* Video */
> -
> -	ret = sun6i_video_setup(csi_dev);
> -	if (ret)
> -		goto error_v4l2_device;
> -
> -	/* V4L2 Async */
> -
> -	v4l2_async_nf_init(notifier);
> -	notifier->ops = &sun6i_csi_async_ops;
> -
> -	ret = v4l2_async_nf_parse_fwnode_endpoints(dev, notifier,
> -						   sizeof(struct
> -							  v4l2_async_subdev),
> -						   sun6i_csi_fwnode_parse);
> -	if (ret)
> -		goto error_video;
> -
> -	ret = v4l2_async_nf_register(v4l2_dev, notifier);
> -	if (ret) {
> -		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
> -			ret);
> -		goto error_v4l2_async_notifier;
> -	}
> -
>  	return 0;
>  
> -error_v4l2_async_notifier:
> -	v4l2_async_nf_cleanup(notifier);
> -
> -error_video:
> -	sun6i_video_cleanup(csi_dev);
> -
> -error_v4l2_device:
> -	v4l2_device_unregister(&v4l2->v4l2_dev);
> -
>  error_v4l2_ctrl:
>  	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
>  
> @@ -771,9 +654,6 @@ static void sun6i_csi_v4l2_cleanup(struct sun6i_csi_device *csi_dev)
>  	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
>  
>  	media_device_unregister(&v4l2->media_dev);
> -	v4l2_async_nf_unregister(&v4l2->notifier);
> -	v4l2_async_nf_cleanup(&v4l2->notifier);
> -	sun6i_video_cleanup(csi_dev);
>  	v4l2_device_unregister(&v4l2->v4l2_dev);
>  	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
>  	media_device_cleanup(&v4l2->media_dev);
> @@ -995,8 +875,22 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
>  	if (ret)
>  		goto error_resources;
>  
> +	ret = sun6i_csi_bridge_setup(csi_dev);
> +	if (ret)
> +		goto error_v4l2;
> +
> +	ret = sun6i_video_setup(csi_dev);
> +	if (ret)
> +		goto error_bridge;
> +
>  	return 0;
>  
> +error_bridge:
> +	sun6i_csi_bridge_cleanup(csi_dev);
> +
> +error_v4l2:
> +	sun6i_csi_v4l2_cleanup(csi_dev);
> +
>  error_resources:
>  	sun6i_csi_resources_cleanup(csi_dev);
>  
> @@ -1007,6 +901,8 @@ static int sun6i_csi_remove(struct platform_device *pdev)
>  {
>  	struct sun6i_csi_device *csi_dev = platform_get_drvdata(pdev);
>  
> +	sun6i_video_cleanup(csi_dev);
> +	sun6i_csi_bridge_cleanup(csi_dev);
>  	sun6i_csi_v4l2_cleanup(csi_dev);
>  	sun6i_csi_resources_cleanup(csi_dev);
>  
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index 4dd83e57bafa..576c7f10289e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -13,11 +13,16 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/videobuf2-v4l2.h>
>  
> +#include "sun6i_csi_bridge.h"
>  #include "sun6i_video.h"
>  
>  #define SUN6I_CSI_NAME		"sun6i-csi"
>  #define SUN6I_CSI_DESCRIPTION	"Allwinner A31 CSI Device"
>  
> +enum sun6i_csi_port {
> +	SUN6I_CSI_PORT_PARALLEL		= 0,
> +};
> +
>  struct sun6i_csi_buffer {
>  	struct vb2_v4l2_buffer		v4l2_buffer;
>  	struct list_head		list;
> @@ -46,10 +51,6 @@ struct sun6i_csi_v4l2 {
>  	struct v4l2_device		v4l2_dev;
>  	struct v4l2_ctrl_handler	ctrl_handler;
>  	struct media_device		media_dev;
> -
> -	struct v4l2_async_notifier	notifier;
> -	/* video port settings */
> -	struct v4l2_fwnode_endpoint	v4l2_ep;
>  };
>  
>  struct sun6i_csi_device {
> @@ -57,6 +58,7 @@ struct sun6i_csi_device {
>  
>  	struct sun6i_csi_config		config;
>  	struct sun6i_csi_v4l2		v4l2;
> +	struct sun6i_csi_bridge		bridge;
>  	struct sun6i_video		video;
>  
>  	struct regmap			*regmap;
> @@ -156,4 +158,6 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>  	return 0;
>  }
>  
> +int sun6i_csi_v4l2_complete(struct sun6i_csi_device *csi_dev);
> +
>  #endif /* __SUN6I_CSI_H__ */
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> new file mode 100644
> index 000000000000..74706d883359
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2021-2022 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#include "sun6i_csi.h"
> +#include "sun6i_csi_bridge.h"
> +
> +/* Format */
> +
> +static const u32 sun6i_csi_bridge_mbus_codes[] = {
> +	/* Bayer */
> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SBGGR12_1X12,
> +	MEDIA_BUS_FMT_SGBRG12_1X12,
> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> +	MEDIA_BUS_FMT_SRGGB12_1X12,
> +	/* RGB */
> +	MEDIA_BUS_FMT_RGB565_2X8_LE,
> +	MEDIA_BUS_FMT_RGB565_2X8_BE,
> +	/* YUV422 */
> +	MEDIA_BUS_FMT_YUYV8_2X8,
> +	MEDIA_BUS_FMT_UYVY8_2X8,
> +	MEDIA_BUS_FMT_YVYU8_2X8,
> +	MEDIA_BUS_FMT_UYVY8_2X8,
> +	MEDIA_BUS_FMT_VYUY8_2X8,
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_YVYU8_1X16,
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_VYUY8_1X16,
> +	/* Compressed */
> +	MEDIA_BUS_FMT_JPEG_1X8,
> +};
> +
> +static bool sun6i_csi_bridge_mbus_code_check(u32 mbus_code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sun6i_csi_bridge_mbus_codes); i++)
> +		if (sun6i_csi_bridge_mbus_codes[i] == mbus_code)
> +			return true;
> +
> +	return false;
> +}
> +
> +/* V4L2 Subdev */
> +
> +static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
> +{
> +	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> +	struct v4l2_subdev *source_subdev;
> +	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
> +	int ret = 0;
> +
> +	/* Source */
> +
> +	if (!csi_dev->bridge.source)
> +		return -ENODEV;
> +
> +	source_subdev = csi_dev->bridge.source->subdev;
> +
> +	if (!on) {
> +		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> +		goto disable;
> +	}
> +
> +	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
> +	if (ret && ret != -ENOIOCTLCMD)
> +		goto disable;
> +
> +	return 0;
> +
> +disable:
> +	csi_dev->bridge.source = NULL;
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops sun6i_csi_bridge_video_ops = {
> +	.s_stream	= sun6i_csi_bridge_s_stream,
> +};
> +
> +static void
> +sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
> +{
> +	if (!sun6i_csi_bridge_mbus_code_check(mbus_format->code))
> +		mbus_format->code = sun6i_csi_bridge_mbus_codes[0];
> +
> +	mbus_format->field = V4L2_FIELD_NONE;
> +	mbus_format->colorspace = V4L2_COLORSPACE_RAW;
> +	mbus_format->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
> +				     struct v4l2_subdev_state *state)
> +{
> +	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
> +	struct v4l2_mbus_framefmt *mbus_format =
> +		v4l2_subdev_get_try_format(subdev, state, pad);
> +
> +	mbus_format->code = sun6i_csi_bridge_mbus_codes[0];
> +	mbus_format->width = 1280;
> +	mbus_format->height = 720;
> +
> +	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +
> +	return 0;
> +}
> +
> +static int
> +sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_mbus_code_enum *code_enum)
> +{
> +	if (code_enum->index >= ARRAY_SIZE(sun6i_csi_bridge_mbus_codes))
> +		return -EINVAL;
> +
> +	code_enum->code = sun6i_csi_bridge_mbus_codes[code_enum->index];
> +
> +	return 0;
> +}
> +
> +static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
> +				    struct v4l2_subdev_state *state,
> +				    struct v4l2_subdev_format *format)
> +{
> +	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> +	struct v4l2_mbus_framefmt *mbus_format = &format->format;
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
> +							   format->pad);
> +	else
> +		*mbus_format = csi_dev->bridge.mbus_format;
> +
> +	return 0;
> +}
> +
> +static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
> +				    struct v4l2_subdev_state *state,
> +				    struct v4l2_subdev_format *format)
> +{
> +	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> +	struct v4l2_mbus_framefmt *mbus_format = &format->format;
> +
> +	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
> +			*mbus_format;
> +	else
> +		csi_dev->bridge.mbus_format = *mbus_format;

Note that the driver is responsible for serialising access to its data,
i.e. you have to acquire the mutex here.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
> +	.init_cfg	= sun6i_csi_bridge_init_cfg,
> +	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
> +	.get_fmt	= sun6i_csi_bridge_get_fmt,
> +	.set_fmt	= sun6i_csi_bridge_set_fmt,
> +};
> +
> +const struct v4l2_subdev_ops sun6i_csi_bridge_subdev_ops = {
> +	.video	= &sun6i_csi_bridge_video_ops,
> +	.pad	= &sun6i_csi_bridge_pad_ops,
> +};
> +
> +/* Media Entity */
> +
> +static int sun6i_csi_bridge_link_validate(struct media_link *link)
> +{
> +	struct v4l2_subdev *subdev =
> +		media_entity_to_v4l2_subdev(link->sink->entity);
> +	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> +	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
> +	struct device *dev = csi_dev->dev;
> +	struct v4l2_subdev *source_subdev =
> +		media_entity_to_v4l2_subdev(link->source->entity);
> +	int ret;
> +
> +	/* Only support one enabled source at a time. */
> +	if (bridge->source) {
> +		dev_err(dev, "multiple sources are connected to the bridge\n");
> +		return -EBUSY;
> +	}
> +
> +	ret = v4l2_subdev_link_validate(link);
> +	if (ret)
> +		return ret;
> +
> +	if (source_subdev == bridge->source_parallel.subdev)
> +		bridge->source = &bridge->source_parallel;
> +	else

Useless use of else.

> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations sun6i_csi_bridge_entity_ops = {
> +	.link_validate	= sun6i_csi_bridge_link_validate,
> +};
> +
> +/* V4L2 Async */
> +
> +static int sun6i_csi_bridge_link(struct sun6i_csi_device *csi_dev,
> +				 int sink_pad_index,
> +				 struct v4l2_subdev *remote_subdev,
> +				 bool enabled)
> +{
> +	struct device *dev = csi_dev->dev;
> +	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
> +	struct media_entity *sink_entity = &subdev->entity;
> +	struct media_entity *source_entity = &remote_subdev->entity;
> +	int source_pad_index;
> +	int ret;
> +
> +	/* Get the first remote source pad. */
> +	ret = media_entity_get_fwnode_pad(source_entity, remote_subdev->fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (ret < 0) {
> +		dev_err(dev, "missing source pad in external entity %s\n",
> +			source_entity->name);
> +		return -EINVAL;
> +	}
> +
> +	source_pad_index = ret;
> +
> +	dev_dbg(dev, "creating %s:%u -> %s:%u link\n", source_entity->name,
> +		source_pad_index, sink_entity->name, sink_pad_index);
> +
> +	ret = media_create_pad_link(source_entity, source_pad_index,
> +				    sink_entity, sink_pad_index,
> +				    enabled ? MEDIA_LNK_FL_ENABLED : 0);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to create %s:%u -> %s:%u link\n",
> +			source_entity->name, source_pad_index,
> +			sink_entity->name, sink_pad_index);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *remote_subdev,
> +				struct v4l2_async_subdev *async_subdev)
> +{
> +	struct sun6i_csi_device *csi_dev =
> +		container_of(notifier, struct sun6i_csi_device,
> +			     bridge.notifier);
> +	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
> +	struct sun6i_csi_bridge_source *source = NULL;
> +	struct fwnode_handle *fwnode = dev_fwnode(csi_dev->dev);
> +	struct fwnode_handle *handle = NULL;
> +	bool enabled;
> +	int ret;
> +
> +	while ((handle = fwnode_graph_get_next_endpoint(fwnode, handle))) {

I'd instead store the information you need here in struct sun6i_csi_bridge.
You could remove the loop here.

> +		struct fwnode_endpoint endpoint = { 0 };
> +		struct fwnode_handle *remote_fwnode;
> +
> +		remote_fwnode = fwnode_graph_get_remote_port_parent(handle);
> +		if (!remote_fwnode)
> +			continue;
> +
> +		if (remote_fwnode != remote_subdev->fwnode)
> +			goto next;
> +
> +		ret = fwnode_graph_parse_endpoint(handle, &endpoint);
> +		if (ret < 0)
> +			goto next;
> +
> +		switch (endpoint.port) {
> +		case SUN6I_CSI_PORT_PARALLEL:
> +			source = &bridge->source_parallel;
> +			enabled = true;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +next:
> +		fwnode_handle_put(remote_fwnode);
> +	}
> +
> +	if (!source)
> +		return -EINVAL;
> +
> +	source->subdev = remote_subdev;
> +
> +	return sun6i_csi_bridge_link(csi_dev, SUN6I_CSI_BRIDGE_PAD_SINK,
> +				     remote_subdev, enabled);
> +}
> +
> +static int
> +sun6i_csi_bridge_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct sun6i_csi_device *csi_dev =
> +		container_of(notifier, struct sun6i_csi_device,
> +			     bridge.notifier);
> +
> +	return sun6i_csi_v4l2_complete(csi_dev);

You could call v4l2_device_register_subdev_nodes() here.

> +}
> +
> +static const struct v4l2_async_notifier_operations
> +sun6i_csi_bridge_notifier_ops = {
> +	.bound		= sun6i_csi_bridge_notifier_bound,
> +	.complete	= sun6i_csi_bridge_notifier_complete,
> +};
> +
> +/* Bridge */
> +
> +static int sun6i_csi_bridge_source_setup(struct sun6i_csi_device *csi_dev,
> +					 struct sun6i_csi_bridge_source *source,
> +					 u32 port,
> +					 enum v4l2_mbus_type *bus_types)
> +{
> +	struct device *dev = csi_dev->dev;
> +	struct v4l2_async_notifier *notifier = &csi_dev->bridge.notifier;
> +	struct v4l2_fwnode_endpoint *endpoint = &source->endpoint;
> +	struct v4l2_async_subdev *async_subdev;
> +	struct fwnode_handle *handle;
> +	int ret;
> +
> +	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), port, 0, 0);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
> +	if (ret)
> +		goto complete;
> +
> +	if (bus_types) {
> +		bool valid = false;
> +		unsigned int i;
> +
> +		for (i = 0; bus_types[i] != V4L2_MBUS_INVALID; i++) {
> +			if (endpoint->bus_type == bus_types[i]) {
> +				valid = true;
> +				break;
> +			}
> +		}
> +
> +		if (!valid) {
> +			dev_err(dev, "unsupported bus type for port %d\n",
> +				port);
> +			ret = -EINVAL;
> +			goto complete;
> +		}
> +	}
> +
> +	async_subdev = v4l2_async_nf_add_fwnode_remote(notifier, handle,
> +		struct v4l2_async_subdev);
> +	if (IS_ERR(async_subdev)) {
> +		ret = PTR_ERR(async_subdev);
> +		goto complete;
> +	}
> +
> +	source->expected = true;
> +
> +complete:
> +	fwnode_handle_put(handle);
> +
> +	return ret;
> +}
> +
> +int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
> +{
> +	struct device *dev = csi_dev->dev;
> +	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
> +	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
> +	struct v4l2_subdev *subdev = &bridge->subdev;
> +	struct v4l2_async_notifier *notifier = &bridge->notifier;
> +	struct media_pad *pads = bridge->pads;
> +	enum v4l2_mbus_type parallel_mbus_types[] = {
> +		V4L2_MBUS_PARALLEL,
> +		V4L2_MBUS_BT656,
> +		V4L2_MBUS_INVALID
> +	};
> +	int ret;
> +
> +	/* V4L2 Subdev */
> +
> +	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
> +	strscpy(subdev->name, SUN6I_CSI_BRIDGE_NAME, sizeof(subdev->name));
> +	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	subdev->owner = THIS_MODULE;
> +	subdev->dev = dev;
> +
> +	v4l2_set_subdevdata(subdev, csi_dev);
> +
> +	/* Media Entity */
> +
> +	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	subdev->entity.ops = &sun6i_csi_bridge_entity_ops;
> +
> +	/* Media Pads */
> +
> +	pads[SUN6I_CSI_BRIDGE_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[SUN6I_CSI_BRIDGE_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
> +						  MEDIA_PAD_FL_MUST_CONNECT;
> +
> +	ret = media_entity_pads_init(&subdev->entity,
> +				     SUN6I_CSI_BRIDGE_PAD_COUNT, pads);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* V4L2 Subdev */
> +
> +	ret = v4l2_device_register_subdev(v4l2_dev, subdev);
> +	if (ret) {
> +		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
> +		goto error_media_entity;
> +	}
> +
> +	/* V4L2 Async */
> +
> +	v4l2_async_nf_init(notifier);
> +	notifier->ops = &sun6i_csi_bridge_notifier_ops;
> +
> +	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_parallel,
> +				      SUN6I_CSI_PORT_PARALLEL,
> +				      parallel_mbus_types);
> +
> +	ret = v4l2_async_nf_register(v4l2_dev, notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
> +			ret);
> +		goto error_v4l2_async_notifier;
> +	}
> +
> +	return 0;
> +
> +error_v4l2_async_notifier:
> +	v4l2_async_nf_cleanup(notifier);
> +
> +	v4l2_device_unregister_subdev(subdev);
> +
> +error_media_entity:
> +	media_entity_cleanup(&subdev->entity);
> +
> +	return ret;
> +}
> +
> +void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
> +{
> +	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
> +	struct v4l2_async_notifier *notifier = &csi_dev->bridge.notifier;
> +
> +	v4l2_async_nf_unregister(notifier);
> +	v4l2_async_nf_cleanup(notifier);
> +
> +	v4l2_device_unregister_subdev(subdev);
> +
> +	media_entity_cleanup(&subdev->entity);
> +}
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> new file mode 100644
> index 000000000000..2ee7878102b6
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2021 Bootlin

2022?

> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _SUN6I_CSI_BRIDGE_H_
> +#define _SUN6I_CSI_BRIDGE_H_
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define SUN6I_CSI_BRIDGE_NAME	"sun6i-csi-bridge"
> +
> +enum sun6i_csi_bridge_pad {
> +	SUN6I_CSI_BRIDGE_PAD_SINK	= 0,
> +	SUN6I_CSI_BRIDGE_PAD_SOURCE	= 1,
> +	SUN6I_CSI_BRIDGE_PAD_COUNT	= 2,
> +};
> +
> +struct sun6i_csi_device;
> +
> +struct sun6i_csi_bridge_source {
> +	struct v4l2_subdev		*subdev;
> +	struct v4l2_fwnode_endpoint	endpoint;
> +	bool				expected;
> +};
> +
> +struct sun6i_csi_bridge {
> +	struct v4l2_subdev		subdev;
> +	struct v4l2_async_notifier	notifier;
> +	struct media_pad		pads[2];
> +	struct v4l2_mbus_framefmt	mbus_format;
> +
> +	struct sun6i_csi_bridge_source	source_parallel;
> +	struct sun6i_csi_bridge_source	*source;
> +};
> +
> +/* Bridge */
> +
> +int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev);
> +void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev);
> +
> +#endif
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> index d32ff6b81f8a..fa5bf3697ace 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> @@ -632,6 +632,7 @@ int sun6i_video_setup(struct sun6i_csi_device *csi_dev)
>  {
>  	struct sun6i_video *video = &csi_dev->video;
>  	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
> +	struct v4l2_subdev *bridge_subdev = &csi_dev->bridge.subdev;
>  	struct video_device *video_dev = &video->video_dev;
>  	struct vb2_queue *queue = &video->queue;
>  	struct media_pad *pad = &video->pad;
> @@ -715,8 +716,26 @@ int sun6i_video_setup(struct sun6i_csi_device *csi_dev)
>  	v4l2_info(v4l2_dev, "device %s registered as %s\n", video_dev->name,
>  		  video_device_node_name(video_dev));
>  
> +	/* Media Pad Link */
> +
> +	ret = media_create_pad_link(&bridge_subdev->entity,
> +				    SUN6I_CSI_BRIDGE_PAD_SOURCE,
> +				    &video_dev->entity, 0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret < 0) {
> +		v4l2_err(v4l2_dev, "failed to create %s:%u -> %s:%u link\n",
> +			 bridge_subdev->entity.name,
> +			 SUN6I_CSI_BRIDGE_PAD_SOURCE,
> +			 video_dev->entity.name, 0);
> +		goto error_video_device;
> +	}
> +
>  	return 0;
>  
> +error_video_device:
> +	vb2_video_unregister_device(video_dev);
> +
>  error_media_entity:
>  	media_entity_cleanup(&video_dev->entity);
>  

-- 
Sakari Ailus
