Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF07165FFC5
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 12:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjAFLrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 06:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjAFLrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 06:47:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A056F97F;
        Fri,  6 Jan 2023 03:47:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 713B14AE;
        Fri,  6 Jan 2023 12:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673005655;
        bh=XNQC90BPL01qhL4tDOTNnvszldIBSECjIvhcAKBYTo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rYWQ9ZHq2wl7Ljd+jBOEZqrfFab5hETw7r0dkNsjNlxduZlqqc8x8d4E+4HKX9H/4
         astYzkukeCSJUVXfuvWJBYzJeqgud/SAz4WkP1PM7CNT9jN46yPMbmzGJg/SMMHjYi
         nOlLeMy8Wy0ugE0wHrDjfX8GbOdVAqj3jG/GYNCI=
Date:   Fri, 6 Jan 2023 13:47:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] media: imx-pxp: detect PXP version
Message-ID: <Y7gKUtGM+PRVgWja@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-3-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-3-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Jan 05, 2023 at 02:47:23PM +0100, Michael Tretter wrote:
> Different versions of the Pixel Pipeline have different blocks and their
> routing may be different. Read the PXP_HW_VERSION register to determine
> the version of the PXP and print it to the log for debugging purposes.

Is there a specific reason you chose to read the version register
instead of basing the decision on the compatible string ?

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 689ae5e6ac62..05abe40558b0 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -10,6 +10,7 @@
>   * Pawel Osciak, <pawel@osciak.com>
>   * Marek Szyprowski, <m.szyprowski@samsung.com>
>   */
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -52,6 +53,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
>  #define MEM2MEM_HFLIP	(1 << 0)
>  #define MEM2MEM_VFLIP	(1 << 1)
>  
> +#define PXP_VERSION_MAJOR(version) \
> +	FIELD_GET(BM_PXP_VERSION_MAJOR, version)
> +#define PXP_VERSION_MINOR(version) \
> +	FIELD_GET(BM_PXP_VERSION_MINOR, version)
> +
>  #define dprintk(dev, fmt, arg...) \
>  	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
>  
> @@ -192,6 +198,8 @@ struct pxp_dev {
>  	struct clk		*clk;
>  	void __iomem		*mmio;
>  
> +	u32			hw_version;
> +
>  	atomic_t		num_inst;
>  	struct mutex		dev_mutex;
>  	spinlock_t		irqlock;
> @@ -1660,6 +1668,11 @@ static int pxp_soft_reset(struct pxp_dev *dev)
>  	return 0;
>  }
>  
> +static u32 pxp_read_version(struct pxp_dev *dev)
> +{
> +	return readl(dev->mmio + HW_PXP_VERSION);
> +}
> +
>  static int pxp_probe(struct platform_device *pdev)
>  {
>  	struct pxp_dev *dev;
> @@ -1705,6 +1718,11 @@ static int pxp_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> +	dev->hw_version = pxp_read_version(dev);
> +	dev_info(&pdev->dev, "PXP Version %d.%d\n",

As the version can't be negative, I'd use %u.%u.

> +		 PXP_VERSION_MAJOR(dev->hw_version),
> +		 PXP_VERSION_MINOR(dev->hw_version));
> +

The driver now prints two messages at probe time, it would be nice to
combine them, or remove the other one. That's a candidate for a future
patch though.

>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret)
>  		goto err_clk;

-- 
Regards,

Laurent Pinchart
