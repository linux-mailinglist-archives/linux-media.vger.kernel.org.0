Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3182E715B
	for <lists+linux-media@lfdr.de>; Tue, 29 Dec 2020 15:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgL2O1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Dec 2020 09:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgL2O1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Dec 2020 09:27:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F56C0613D6
        for <linux-media@vger.kernel.org>; Tue, 29 Dec 2020 06:26:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03F0C98;
        Tue, 29 Dec 2020 15:26:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609251982;
        bh=xYegokcCVQNhaviJy+OEdZjImJkQbD/fHEkVlyZGHS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X4PkxuG7jtbvMgAVSiE1MIEgwRhnjO7qjyWDYH6HqVqmkfP6Z5CZwCw28B8ZD31wB
         T+dkzBD2lOzWFsYvPt0qDE1lyAiU/oSfjjdmcAMGfqIW6hg4K3lqlRlVrAwI387Lnv
         wTIzmNHO9iBD9QQQ0RG8uJB085p4T/MdAi9Dkw50=
Date:   Tue, 29 Dec 2020 16:26:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] media: imx6-mipi-csi2: Call remote subdev
 get_mbus_config to get active lanes
Message-ID: <X+s8gxxrkAT7h1C/@pendragon.ideasonboard.com>
References: <20201229103102.45547-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201229103102.45547-1-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Tue, Dec 29, 2020 at 07:31:02AM -0300, Ezequiel Garcia wrote:
> Currently, the CSI2 subdevice is using the data-lanes from the
> neareast endpoint to config the CSI2 lanes.
> 
> While this may work, the proper way to configure the hardware is
> to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
> and then call get_mbus_config using the remote subdevice to get
> the active lanes.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/TODO             |  12 ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 101 ++++++++++++++++++---
>  2 files changed, 90 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> index 9cfc1c1e78dc..c575f419204a 100644
> --- a/drivers/staging/media/imx/TODO
> +++ b/drivers/staging/media/imx/TODO
> @@ -2,18 +2,6 @@
>  - The Frame Interval Monitor could be exported to v4l2-core for
>    general use.
>  
> -- The CSI subdevice parses its nearest upstream neighbor's device-tree
> -  bus config in order to setup the CSI. Laurent Pinchart argues that
> -  instead the CSI subdev should call its neighbor's g_mbus_config op
> -  (which should be propagated if necessary) to get this info. However
> -  Hans Verkuil is planning to remove the g_mbus_config op. For now this
> -  driver uses the parsed DT bus config method until this issue is
> -  resolved.
> -
> -  2020-06: g_mbus has been removed in favour of the get_mbus_config pad
> -  operation which should be used to avoid parsing the remote endpoint
> -  configuration.
> -
>  - This media driver supports inheriting V4L2 controls to the
>    video capture devices, from the subdevices in the capture device's
>    pipeline. The controls for each capture device are updated in the
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 94d87d27d389..bf6a61dd34c2 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -42,7 +42,10 @@ struct csi2_dev {
>  	struct clk             *pllref_clk;
>  	struct clk             *pix_clk; /* what is this? */
>  	void __iomem           *base;
> -	struct v4l2_fwnode_bus_mipi_csi2 bus;
> +
> +	struct v4l2_subdev	*remote;
> +	unsigned int		remote_pad;
> +	unsigned short		data_lanes;
>  
>  	/* lock to protect all members below */
>  	struct mutex lock;
> @@ -138,10 +141,8 @@ static void csi2_enable(struct csi2_dev *csi2, bool enable)
>  	}
>  }
>  
> -static void csi2_set_lanes(struct csi2_dev *csi2)
> +static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
>  {
> -	int lanes = csi2->bus.num_data_lanes;
> -
>  	writel(lanes - 1, csi2->base + CSI2_N_LANES);
>  }
>  
> @@ -250,12 +251,13 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>  }
>  
>  /* Waits for low-power LP-11 state on data and clock lanes. */
> -static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2,
> +				     unsigned int lanes)
>  {
>  	u32 mask, reg;
>  	int ret;
>  
> -	mask = PHY_STOPSTATECLK | (((1 << csi2->bus.num_data_lanes) - 1) <<
> +	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) <<
>  				   PHY_STOPSTATEDATA_BIT);

This now holds on a single line.

>  
>  	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
> @@ -300,8 +302,56 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
>  	writel(reg, csi2->base + CSI2IPU_GASKET);
>  }
>  
> +static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)

The function could return the number of lanes, instead of using an
output parameter. Up to you.

> +{
> +	struct v4l2_mbus_config mbus_config = { 0 };
> +	unsigned int num_lanes = UINT_MAX;
> +	int ret;
> +
> +	*lanes = csi2->data_lanes;
> +
> +	ret = v4l2_subdev_call(csi2->remote, pad, get_mbus_config,
> +			       csi2->remote_pad, &mbus_config);
> +	if (ret == -ENOIOCTLCMD) {
> +		dev_dbg(csi2->dev, "No remote mbus configuration available\n");
> +		return 0;
> +	}
> +
> +	if (ret) {
> +		dev_err(csi2->dev, "Failed to get remote mbus configuration\n");
> +		return ret;
> +	}
> +
> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(csi2->dev, "Unsupported media bus type %u\n",
> +			mbus_config.type);
> +		return -EINVAL;
> +	}
> +
> +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> +		num_lanes = 1;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> +		num_lanes = 2;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> +		num_lanes = 3;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> +		num_lanes = 4;
> +
> +	if (num_lanes > csi2->data_lanes) {
> +		dev_err(csi2->dev,
> +			"Unsupported mbus config: too many data lanes %u\n",
> +			num_lanes);
> +		return -EINVAL;
> +	}
> +
> +	*lanes = num_lanes;
> +
> +	return 0;
> +}

It could make sense to move this to a core V4L2 helper, but it can be
done later.

> +
>  static int csi2_start(struct csi2_dev *csi2)
>  {
> +	unsigned int lanes;
>  	int ret;
>  
>  	ret = clk_prepare_enable(csi2->pix_clk);
> @@ -316,12 +366,16 @@ static int csi2_start(struct csi2_dev *csi2)
>  	if (ret)
>  		goto err_disable_clk;
>  
> +	ret = csi2_get_active_lanes(csi2, &lanes);
> +	if (ret)
> +		goto err_disable_clk;
> +
>  	/* Step 4 */
> -	csi2_set_lanes(csi2);
> +	csi2_set_lanes(csi2, lanes);
>  	csi2_enable(csi2, true);
>  
>  	/* Step 5 */
> -	csi2_dphy_wait_stopstate(csi2);
> +	csi2_dphy_wait_stopstate(csi2, lanes);
>  
>  	/* Step 6 */
>  	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
> @@ -544,12 +598,37 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
>  {
>  	struct csi2_dev *csi2 = notifier_to_dev(notifier);
>  	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
> +	int pad;
> +
> +	pad = media_entity_get_fwnode_pad(&sd->entity, asd->match.fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0) {
> +		dev_err(csi2->dev, "Failed to find pad for %s\n", sd->name);
> +		return pad;
> +	}
> +
> +	csi2->remote = sd;
> +	csi2->remote_pad = pad;
> +
> +	dev_dbg(csi2->dev, "Bound %s pad: %d\n", sd->name, pad);
>  
>  	return v4l2_create_fwnode_links_to_pad(sd, sink);
>  }
>  
> +static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *sd,
> +			       struct v4l2_async_subdev *asd)
> +{
> +	struct csi2_dev *csi2 = notifier_to_dev(notifier);
> +
> +	csi2->remote = NULL;
> +
> +	dev_dbg(csi2->dev, "Unbind %s\n", sd->name);

I'm not sure if this debug message is useful, I think I'd drop it.

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  static const struct v4l2_async_notifier_operations csi2_notify_ops = {
>  	.bound = csi2_notify_bound,
> +	.unbind = csi2_notify_unbind,
>  };
>  
>  static int csi2_async_register(struct csi2_dev *csi2)
> @@ -572,10 +651,10 @@ static int csi2_async_register(struct csi2_dev *csi2)
>  	if (ret)
>  		goto err_parse;
>  
> -	csi2->bus = vep.bus.mipi_csi2;
> +	csi2->data_lanes = vep.bus.mipi_csi2.num_data_lanes;
>  
> -	dev_dbg(csi2->dev, "data lanes: %d\n", csi2->bus.num_data_lanes);
> -	dev_dbg(csi2->dev, "flags: 0x%08x\n", csi2->bus.flags);
> +	dev_dbg(csi2->dev, "data lanes: %d\n", vep.bus.mipi_csi2.num_data_lanes);
> +	dev_dbg(csi2->dev, "flags: 0x%08x\n", vep.bus.mipi_csi2.flags);
>  
>  	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
>  	if (!asd) {

-- 
Regards,

Laurent Pinchart
