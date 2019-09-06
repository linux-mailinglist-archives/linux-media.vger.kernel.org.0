Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687EDAB3A0
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 10:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732567AbfIFIBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 04:01:34 -0400
Received: from retiisi.org.uk ([95.216.213.190]:54980 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727816AbfIFIBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 04:01:34 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 353D0634C87;
        Fri,  6 Sep 2019 11:01:19 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i69BH-0000kb-9U; Fri, 06 Sep 2019 11:01:19 +0300
Date:   Fri, 6 Sep 2019 11:01:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jan Kotas <jank@cadence.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, rafalc@cadence.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: Add support for Cadence CSI2RX 2.1
Message-ID: <20190906080119.GF1586@valkosipuli.retiisi.org.uk>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-4-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905105601.27034-4-jank@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jan,

On Thu, Sep 05, 2019 at 11:56:01AM +0100, Jan Kotas wrote:
> This patch adds support for CSI2RX v2.1 version of the controller.
> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 139 ++++++++++++++++++++++-----
>  1 file changed, 116 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 97ec09e72..aa1d46111 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Driver for Cadence MIPI-CSI2 RX Controller v1.3
> + * Driver for Cadence MIPI-CSI2 RX Controller
>   *
>   * Copyright (C) 2017-2019 Cadence Design Systems Inc.
>   */
> @@ -26,6 +26,9 @@
>  #define CSI2RX_SOFT_RESET_PROTOCOL			BIT(1)
>  #define CSI2RX_SOFT_RESET_FRONT				BIT(0)
>  
> +#define CSI2RX_V2_CORE_CTRL_REG			0x004
> +#define CSI2RX_V2_CORE_CTRL_START			BIT(0)
> +
>  #define CSI2RX_STATIC_CFG_REG			0x008
>  #define CSI2RX_STATIC_CFG_DLANE_MAP(llane, plane)	((plane) << (16 + (llane) * 4))
>  #define CSI2RX_STATIC_CFG_LANES_MASK			GENMASK(11, 8)
> @@ -54,6 +57,15 @@ enum csi2rx_pads {
>  	CSI2RX_PAD_MAX,
>  };
>  
> +struct csi2rx_priv;
> +
> +/* CSI2RX Variant Operations */
> +struct csi2rx_vops {
> +	void (*get_dev_cfg)(struct csi2rx_priv *csi2rx);
> +	void (*reset)(struct csi2rx_priv *csi2rx);
> +	void (*map_static)(struct csi2rx_priv *csi2rx);
> +};
> +
>  struct csi2rx_priv {
>  	struct device			*dev;
>  	unsigned int			count;
> @@ -69,6 +81,7 @@ struct csi2rx_priv {
>  	struct clk			*p_clk;
>  	struct clk			*pixel_clk[CSI2RX_STREAMS_MAX];
>  	struct phy			*dphy;
> +	struct csi2rx_vops		*vops;

const?

>  
>  	u8				lanes[CSI2RX_LANES_MAX];
>  	u8				num_lanes;
> @@ -92,6 +105,32 @@ struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>  	return container_of(subdev, struct csi2rx_priv, subdev);
>  }
>  
> +static void csi2rx_get_dev_cfg(struct csi2rx_priv *csi2rx)
> +{
> +	u32 dev_cfg;
> +
> +	clk_prepare_enable(csi2rx->p_clk);
> +	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
> +	clk_disable_unprepare(csi2rx->p_clk);
> +
> +	csi2rx->max_lanes = dev_cfg & 7;
> +	csi2rx->max_streams = (dev_cfg >> 4) & 7;
> +	csi2rx->has_internal_dphy = dev_cfg & BIT(3) ? true : false;

Could you spell out these a little, by adding #defines for the register
bits? Same below.

> +}
> +
> +static void csi2rx_v2_get_dev_cfg(struct csi2rx_priv *csi2rx)
> +{
> +	u32 dev_cfg;
> +
> +	clk_prepare_enable(csi2rx->p_clk);
> +	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
> +	clk_disable_unprepare(csi2rx->p_clk);
> +
> +	csi2rx->max_lanes = dev_cfg & 0xF;
> +	csi2rx->max_streams = (dev_cfg >> 5) & 0xF;
> +	csi2rx->has_internal_dphy = dev_cfg & BIT(4) ? true : false;
> +}
> +
>  static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  {
>  	writel(CSI2RX_SOFT_RESET_PROTOCOL | CSI2RX_SOFT_RESET_FRONT,
> @@ -102,18 +141,21 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  	writel(0, csi2rx->base + CSI2RX_SOFT_RESET_REG);
>  }
>  
> -static int csi2rx_start(struct csi2rx_priv *csi2rx)
> +static void csi2rx_v2_reset(struct csi2rx_priv *csi2rx)
> +{
> +	writel(0, csi2rx->base + CSI2RX_V2_CORE_CTRL_REG);
> +
> +	udelay(10);
> +
> +	writel(CSI2RX_V2_CORE_CTRL_START,
> +	       csi2rx->base + CSI2RX_V2_CORE_CTRL_REG);
> +}
> +
> +static void csi2rx_map_static(struct csi2rx_priv *csi2rx)
>  {
>  	unsigned int i;
>  	unsigned long lanes_used = 0;
>  	u32 reg;
> -	int ret;
> -
> -	ret = clk_prepare_enable(csi2rx->p_clk);
> -	if (ret)
> -		return ret;
> -
> -	csi2rx_reset(csi2rx);
>  
>  	reg = csi2rx->num_lanes << 8;
>  	for (i = 0; i < csi2rx->num_lanes; i++) {
> @@ -135,6 +177,32 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	}
>  
>  	writel(reg, csi2rx->base + CSI2RX_STATIC_CFG_REG);
> +}
> +
> +static void csi2rx_v2_map_static(struct csi2rx_priv *csi2rx)
> +{
> +	u32 reg;
> +
> +	reg = csi2rx->num_lanes << 4;
> +	writel(reg, csi2rx->base + CSI2RX_STATIC_CFG_REG);
> +}
> +
> +static int csi2rx_start(struct csi2rx_priv *csi2rx)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	ret = clk_prepare_enable(csi2rx->p_clk);
> +	if (ret)
> +		return ret;
> +
> +	if (csi2rx->vops) {
> +		if (csi2rx->vops->reset)
> +			csi2rx->vops->reset(csi2rx);
> +
> +		if (csi2rx->vops->map_static)
> +			csi2rx->vops->map_static(csi2rx);
> +	}
>  
>  	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
>  	if (ret)
> @@ -282,7 +350,6 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
>  {
>  	struct resource *res;
>  	unsigned char i;
> -	u32 dev_cfg;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	csi2rx->base = devm_ioremap_resource(&pdev->dev, res);
> @@ -316,26 +383,25 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
>  		return -EINVAL;
>  	}
>  
> -	clk_prepare_enable(csi2rx->p_clk);
> -	dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
> -	clk_disable_unprepare(csi2rx->p_clk);
> +	if (csi2rx->vops && csi2rx->vops->get_dev_cfg) {
> +		csi2rx->vops->get_dev_cfg(csi2rx);
> +	} else {
> +		dev_err(&pdev->dev, "Couldn't get device configuration\n");
> +		return -EINVAL;
> +	}
>  
> -	csi2rx->max_lanes = dev_cfg & 7;
>  	if (csi2rx->max_lanes > CSI2RX_LANES_MAX) {
>  		dev_err(&pdev->dev, "Invalid number of lanes: %u\n",
>  			csi2rx->max_lanes);
>  		return -EINVAL;
>  	}
>  
> -	csi2rx->max_streams = (dev_cfg >> 4) & 7;
>  	if (csi2rx->max_streams > CSI2RX_STREAMS_MAX) {
>  		dev_err(&pdev->dev, "Invalid number of streams: %u\n",
>  			csi2rx->max_streams);
>  		return -EINVAL;
>  	}
>  
> -	csi2rx->has_internal_dphy = dev_cfg & BIT(3) ? true : false;
> -
>  	/*
>  	 * FIXME: Once we'll have internal D-PHY support, the check
>  	 * will need to be removed.
> @@ -426,9 +492,39 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  	return ret;
>  }
>  
> +static const struct csi2rx_vops csi2rx_vops = {
> +	.get_dev_cfg = csi2rx_get_dev_cfg,
> +	.reset = csi2rx_reset,
> +	.map_static = csi2rx_map_static
> +};
> +
> +static const struct csi2rx_vops csi2rx_v2_vops = {
> +	.get_dev_cfg = csi2rx_v2_get_dev_cfg,
> +	.reset = csi2rx_v2_reset,
> +	.map_static = csi2rx_v2_map_static
> +};
> +
> +static const struct of_device_id csi2rx_of_table[] = {
> +	{
> +		.compatible = "cdns,csi2rx",
> +		.data = &csi2rx_vops
> +	},
> +	{
> +		.compatible = "cdns,csi2rx-1.3",
> +		.data = &csi2rx_vops
> +	},
> +	{
> +		.compatible = "cdns,csi2rx-2.1",
> +		.data = &csi2rx_v2_vops
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, csi2rx_of_table);
> +
>  static int csi2rx_probe(struct platform_device *pdev)
>  {
>  	struct csi2rx_priv *csi2rx;
> +	const struct of_device_id *of_id;
>  	unsigned int i;
>  	int ret;
>  
> @@ -439,6 +535,9 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	csi2rx->dev = &pdev->dev;
>  	mutex_init(&csi2rx->lock);
>  
> +	of_id = of_match_node(csi2rx_of_table, pdev->dev.of_node);
> +	csi2rx->vops = (struct csi2rx_vops *)of_id->data;

The cast isn't needed, is it?

> +
>  	ret = csi2rx_get_resources(csi2rx, pdev);
>  	if (ret)
>  		goto err_free_priv;
> @@ -493,12 +592,6 @@ static int csi2rx_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id csi2rx_of_table[] = {
> -	{ .compatible = "cdns,csi2rx" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, csi2rx_of_table);
> -
>  static struct platform_driver csi2rx_driver = {
>  	.probe	= csi2rx_probe,
>  	.remove	= csi2rx_remove,

-- 
Kind regards,

Sakari Ailus
