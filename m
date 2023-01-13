Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3502E669495
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 11:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjAMKqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 05:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241311AbjAMKqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 05:46:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AF2777C0;
        Fri, 13 Jan 2023 02:44:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (85-131-99-81.bb.dnainternet.fi [85.131.99.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7505A4D4;
        Fri, 13 Jan 2023 11:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673606672;
        bh=jQe8bELRpakqILNHk4rOJgvTETgI/bwME5HNZmZ2sRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FQ0nH4d3KOV3Lf96/S86FUl+4Qt0lB2ZLE6+f/s+EnM4fRP065G/gLJlUtIdlsZqj
         BK0fWbWd2oXBloA2w0rObnhJ/ml7b/IpI6lIb7tOzbxsQymsAezw+OqQWOwlmYpZca
         MMtAs+vyr5jBYedcQPweKRiZ7xMNf25+NZJoO1qc=
Date:   Fri, 13 Jan 2023 12:44:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/16] media: imx-pxp: detect PXP version
Message-ID: <Y8E2Dx7ngjiUYVfO@pendragon.ideasonboard.com>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-2-e2281da1db55@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112-imx-pxp-v2-2-e2281da1db55@pengutronix.de>
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

On Fri, Jan 13, 2023 at 10:54:08AM +0100, Michael Tretter wrote:
> Different versions of the Pixel Pipeline have different blocks and their
> routing may be different. Read the PXP_HW_VERSION register to determine
> the version of the PXP and print it to the log for debugging purposes.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> 
> - reduce debug level for version to dev_dbg
> - drop hw_version field from struct pxp_dev
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 689ae5e6ac62..5b671c6e5cae 100644
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
> @@ -1665,6 +1671,7 @@ static int pxp_probe(struct platform_device *pdev)
>  	struct pxp_dev *dev;
>  	struct video_device *vfd;
>  	int irq;
> +	u32 hw_version;

I'd move this one line up. Up to you, with or without that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	int ret;
>  
>  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> @@ -1705,6 +1712,10 @@ static int pxp_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> +	hw_version = readl(dev->mmio + HW_PXP_VERSION);
> +	dev_dbg(&pdev->dev, "PXP Version %u.%u\n",
> +		PXP_VERSION_MAJOR(hw_version), PXP_VERSION_MINOR(hw_version));
> +
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret)
>  		goto err_clk;
> 

-- 
Regards,

Laurent Pinchart
