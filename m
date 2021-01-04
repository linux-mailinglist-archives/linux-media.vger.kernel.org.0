Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07B12E962F
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbhADNlz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 08:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbhADNlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 08:41:55 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5189DC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 05:41:15 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwQ6j-0004d6-Un; Mon, 04 Jan 2021 14:41:13 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwQ6i-0003kv-CB; Mon, 04 Jan 2021 14:41:12 +0100
Message-ID: <183b9760df78c00ca036b350dc76175b0123de47.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: imx6-mipi-csi2: Call remote subdev
 get_mbus_config to get active lanes
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Mon, 04 Jan 2021 14:41:12 +0100
In-Reply-To: <20210103154155.318300-1-ezequiel@collabora.com>
References: <20210103154155.318300-1-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

thank you for picking this up.

On Sun, 2021-01-03 at 12:41 -0300, Ezequiel Garcia wrote:
> Currently, the CSI2 subdevice is using the data-lanes from the
> neareast endpoint to config the CSI2 lanes.
> 
> While this may work, the proper way to configure the hardware is
> to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
> and then call get_mbus_config using the remote subdevice to get
> the active lanes.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Same comment as Laurent, csi2_get_active_lanes() looks to be the same as
rcsi2_get_active_lanes() in rcar-csi2, so this could benefit from a
common helper (later).

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  drivers/staging/media/imx/TODO             | 12 ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 99 +++++++++++++++++++---
>  2 files changed, 87 insertions(+), 24 deletions(-)
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
> index 94d87d27d389..8cfd6358c306 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
[...]
> @@ -300,8 +300,56 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
>  	writel(reg, csi2->base + CSI2IPU_GASKET);
>  }
>  
> +static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
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

I'd turn this into a
	switch (mbus_config.flags & V4L2_MBUS_CSI2_LANES) { }
to catch erroneous values of 0 or multiple bits set, as for those the
following error message doesn't make much sense:

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

Still, this patch looks good to me.

regards
Philipp
