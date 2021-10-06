Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DD9424A94
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhJFXmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:42:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhJFXmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:42:14 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D53049DC;
        Thu,  7 Oct 2021 01:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633563620;
        bh=bdv7pciiMzLi2+PZQS2+VEF6hNAg6blr2RYhAFrkIt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eCYwgkIw0Q9qxiNTlQVxup6KoK9fdZ9UN+gWK/hn8TaNErZWM3d3MAEblnNmVvUdT
         SNwSmqdtXRZTZN4i3J0KpXIqKzXypRYLJanqIZk/cfqKx+LRi48JthTHXpArSAIX6I
         zMnPBh0QN2xIUQWxOjEwrDemIX3G5kaPD3YfxkME=
Date:   Thu, 7 Oct 2021 02:40:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 02/11] media: cadence: csi2rx: Add external DPHY
 support
Message-ID: <YV4z27N9+S8e5M7U@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-3-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-3-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:31PM +0530, Pratyush Yadav wrote:
> Some platforms like TI's J721E can have the CSI2RX paired with an
> external DPHY. Add support to enable and configure the DPHY using the
> generic PHY framework.
> 
> Get the pixel rate and bpp from the subdev and pass them on to the DPHY
> along with the number of lanes. All other settings are left to their
> default values.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v4:
> - Drop the call to set PHY submode. It is now being done via compatible
>   on the DPHY side.
> 
> Changes in v3:
> - Use v4l2_get_link_freq() to calculate pixel clock.
> 
> Changes in v2:
> - Use phy_pm_runtime_get_sync() and phy_pm_runtime_put() before making
>   calls to set PHY mode, etc. to make sure it is ready.
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c | 143 +++++++++++++++++--
>  1 file changed, 133 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index d60975f905d6..c06e039a1aa8 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -30,6 +30,12 @@
>  #define CSI2RX_STATIC_CFG_DLANE_MAP(llane, plane)	((plane) << (16 + (llane) * 4))
>  #define CSI2RX_STATIC_CFG_LANES_MASK			GENMASK(11, 8)
>  
> +#define CSI2RX_DPHY_LANE_CTRL_REG		0x40
> +#define CSI2RX_DPHY_CL_RST			BIT(16)
> +#define CSI2RX_DPHY_DL_RST(i)			BIT((i) + 12)
> +#define CSI2RX_DPHY_CL_EN			BIT(4)
> +#define CSI2RX_DPHY_DL_EN(i)			BIT(i)
> +
>  #define CSI2RX_STREAM_BASE(n)		(((n) + 1) * 0x100)
>  
>  #define CSI2RX_STREAM_CTRL_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x000)
> @@ -54,6 +60,11 @@ enum csi2rx_pads {
>  	CSI2RX_PAD_MAX,
>  };
>  
> +struct csi2rx_fmt {
> +	u32				code;
> +	u8				bpp;
> +};
> +
>  struct csi2rx_priv {
>  	struct device			*dev;
>  	unsigned int			count;
> @@ -85,6 +96,37 @@ struct csi2rx_priv {
>  	int				source_pad;
>  };
>  
> +static const struct csi2rx_fmt formats[] = {
> +	{
> +		.code	= MEDIA_BUS_FMT_YUYV8_2X8,

On CSI-2 we use the _1X16 media bus codes (it's a convention, neither
the 1X16 nor th 2X8 actually described accurately how data is
transported on the bus).

> +		.bpp	= 16,
> +	},
> +	{
> +		.code	= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.bpp	= 16,
> +	},
> +	{
> +		.code	= MEDIA_BUS_FMT_YVYU8_2X8,
> +		.bpp	= 16,
> +	},
> +	{
> +		.code	= MEDIA_BUS_FMT_VYUY8_2X8,
> +		.bpp	= 16,
> +	},
> +};
> +
> +static u8 csi2rx_get_bpp(u32 code)
> +{
> +	int i;

i only takes positive values, it can be an unsigned int.

> +
> +	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> +		if (formats[i].code == code)
> +			return formats[i].bpp;
> +	}
> +
> +	return 0;
> +}

It's a bit convoluted for a function that returns 16 for all formats :-)
I understand it's meant to be extended, so that fine.

> +
>  static inline
>  struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>  {
> @@ -101,6 +143,66 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  	writel(0, csi2rx->base + CSI2RX_SOFT_RESET_REG);
>  }
>  
> +static int csi2rx_configure_external_dphy(struct csi2rx_priv *csi2rx)
> +{
> +	union phy_configure_opts opts = { };
> +	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> +	struct v4l2_subdev_format sd_fmt;
> +	s64 pixel_clock;
> +	int ret;
> +	u8 bpp;
> +	bool got_pm = true;
> +
> +	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	sd_fmt.pad = 0;
> +
> +	ret = v4l2_subdev_call(csi2rx->source_subdev, pad, get_fmt, NULL,
> +			       &sd_fmt);

Subdevs should not call into their neighbours (except to start/stop
streaming). You should instead use the format configured on the sink pad
the the csi2rx. This means you'll need to implement .get_fmt() and
.set_fmt(), which should be done anyway.

> +	if (ret)
> +		return ret;
> +
> +	bpp = csi2rx_get_bpp(sd_fmt.format.code);
> +	if (!bpp)
> +		return -EINVAL;
> +
> +	/*
> +	 * Do not divide by the number of lanes here. That will be done by
> +	 * phy_mipi_dphy_get_default_config().
> +	 */
> +	pixel_clock = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
> +					 1, 2);
> +	if (pixel_clock < 0)
> +		return pixel_clock;
> +
> +	ret = phy_mipi_dphy_get_default_config(pixel_clock, bpp,
> +					       csi2rx->num_lanes, cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_pm_runtime_get_sync(csi2rx->dphy);
> +	if (ret == -ENOTSUPP)
> +		got_pm = false;
> +	else if (ret)
> +		return ret;
> +
> +	ret = phy_power_on(csi2rx->dphy);
> +	if (ret)
> +		goto out;
> +
> +	ret = phy_configure(csi2rx->dphy, &opts);
> +	if (ret) {
> +		/* Can't do anything if it fails. Ignore the return value. */
> +		phy_power_off(csi2rx->dphy);
> +		goto out;
> +	}
> +
> +out:
> +	if (got_pm)
> +		phy_pm_runtime_put(csi2rx->dphy);
> +
> +	return ret;
> +}
> +
>  static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  {
>  	unsigned int i;
> @@ -139,6 +241,17 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	if (ret)
>  		goto err_disable_pclk;
>  
> +	/* Enable DPHY clk and data lanes. */
> +	if (csi2rx->dphy) {
> +		reg = CSI2RX_DPHY_CL_EN | CSI2RX_DPHY_CL_RST;
> +		for (i = 0; i < csi2rx->num_lanes; i++) {
> +			reg |= CSI2RX_DPHY_DL_EN(csi2rx->lanes[i] - 1);
> +			reg |= CSI2RX_DPHY_DL_RST(csi2rx->lanes[i] - 1);
> +		}
> +
> +		writel(reg, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
> +	}
> +
>  	/*
>  	 * Create a static mapping between the CSI virtual channels
>  	 * and the output stream.
> @@ -169,10 +282,21 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	if (ret)
>  		goto err_disable_pixclk;
>  
> +	if (csi2rx->dphy) {
> +		ret = csi2rx_configure_external_dphy(csi2rx);
> +		if (ret) {
> +			dev_err(csi2rx->dev,
> +				"Failed to configure external DPHY: %d\n", ret);
> +			goto err_disable_sysclk;
> +		}
> +	}
> +
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
>  	return 0;
>  
> +err_disable_sysclk:
> +	clk_disable_unprepare(csi2rx->sys_clk);
>  err_disable_pixclk:
>  	for (; i > 0; i--)
>  		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
> @@ -200,6 +324,13 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  
>  	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
>  		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> +
> +	if (csi2rx->dphy) {
> +		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
> +
> +		if (phy_power_off(csi2rx->dphy))
> +			dev_warn(csi2rx->dev, "Couldn't power off DPHY\n");
> +	}
>  }
>  
>  static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> @@ -307,15 +438,6 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
>  		return PTR_ERR(csi2rx->dphy);
>  	}
>  
> -	/*
> -	 * FIXME: Once we'll have external D-PHY support, the check
> -	 * will need to be removed.
> -	 */
> -	if (csi2rx->dphy) {
> -		dev_err(&pdev->dev, "External D-PHY not supported yet\n");
> -		return -EINVAL;
> -	}
> -
>  	ret = clk_prepare_enable(csi2rx->p_clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Couldn't prepare and enable P clock\n");
> @@ -345,7 +467,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
>  	 * FIXME: Once we'll have internal D-PHY support, the check
>  	 * will need to be removed.
>  	 */
> -	if (csi2rx->has_internal_dphy) {
> +	if (!csi2rx->dphy && csi2rx->has_internal_dphy) {
>  		dev_err(&pdev->dev, "Internal D-PHY not supported yet\n");
>  		return -EINVAL;
>  	}
> @@ -464,6 +586,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	dev_info(&pdev->dev,
>  		 "Probed CSI2RX with %u/%u lanes, %u streams, %s D-PHY\n",
>  		 csi2rx->num_lanes, csi2rx->max_lanes, csi2rx->max_streams,
> +		 csi2rx->dphy ? "external" :
>  		 csi2rx->has_internal_dphy ? "internal" : "no");
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
