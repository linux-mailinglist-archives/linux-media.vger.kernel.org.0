Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F5F454BCD
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 18:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239343AbhKQRU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 12:20:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhKQRUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 12:20:25 -0500
Received: from pendragon.ideasonboard.com (85-76-75-165-nat.elisa-mobile.fi [85.76.75.165])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4372651D;
        Wed, 17 Nov 2021 18:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637169444;
        bh=Cjf4AGr9RDOWFSbLypnkcR8vi1nf8X1AM+PsijSaGeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HPHqgJQGZy1adWL0s5cAhEHuFxEUUR5M53LH6Pwbe6BCMUQh7Iwp2APpaai/bKLpq
         v/6vX3bN0D0OVW5GqGqXRzHtSkgHXegjx9CObuIxrfi88XDTY6L+ISmSFH2ig/MX/M
         IgJyMI0Vv3i6sjv2oDBpV4DJ4LnyTq/SuVlYBhzM=
Date:   Wed, 17 Nov 2021 19:16:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>, mchehab@kernel.org,
        robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        kernel@puri.sm, linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx7-media-csi: add support for imx8mq
Message-ID: <YZU5C0E3WBd7VLS2@pendragon.ideasonboard.com>
References: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
 <CFS51AQQ7SCD.7FK8RLAWLXRH@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CFS51AQQ7SCD.7FK8RLAWLXRH@arch-thunder>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 02:51:48PM +0000, Rui Miguel Silva wrote:
> Hi Martin,
> Thanks for the patch.
> 
> On Wed Nov 17, 2021 at 9:27 AM WET, Martin Kepplinger wrote:
> 
> > Modeled after the NXP driver mx6s_capture.c that this driver is based on,
> > imx8mq needs different settings for the baseaddr_switch mechanism. Define
> > the needed bits and set that for imx8mq.
> >
> > Without these settings, the system will "sometimes" hang completely when
> > starting to stream (the interrupt will never be called).

Do we know why ? Are all the bits that you set required ?

> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 34 ++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index 2288dadb2683..8619cf2fc694 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> > +#include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > @@ -122,6 +123,10 @@
> >  #define BIT_DATA_FROM_MIPI		BIT(22)
> >  #define BIT_MIPI_YU_SWAP		BIT(21)
> >  #define BIT_MIPI_DOUBLE_CMPNT		BIT(20)
> > +#define BIT_MASK_OPTION_FIRST_FRAME	(0 << 18)
> > +#define BIT_MASK_OPTION_CSI_EN		(1 << 18)
> > +#define BIT_MASK_OPTION_SECOND_FRAME	(2 << 18)
> > +#define BIT_MASK_OPTION_ON_DATA		(3 << 18)
> >  #define BIT_BASEADDR_CHG_ERR_EN		BIT(9)
> >  #define BIT_BASEADDR_SWITCH_SEL		BIT(5)
> >  #define BIT_BASEADDR_SWITCH_EN		BIT(4)
> > @@ -154,6 +159,12 @@
> >  #define CSI_CSICR18			0x48
> >  #define CSI_CSICR19			0x4c
> >  
> > +enum imx_soc {
> > +	IMX6UL = 0,
> > +	IMX7,
> > +	IMX8MQ,
> 
> maybe instead of this enum we could use a bool in structure...

An enum would be more extensible, but we shouldn't define different
values for IMX6UL and IMX7 if they're compatible. Maybe an enum
imx_csi_model with two values (IMX_CSI_IMX7 and IMX_CSI_IMX8MQ ?).

Are there other SoCs in the i.MX8 family that require this ? The BSP
driver sets the baseaddr switch mechanism for i.MX8MM too, but it seems
to work fine without it.

> >+};
> > +
> >  struct imx7_csi {
> >  	struct device *dev;
> >  	struct v4l2_subdev sd;
> > @@ -189,6 +200,8 @@ struct imx7_csi {
> >  	bool is_csi2;
> >  
> >  	struct completion last_eof_completion;
> > +
> > +	enum imx_soc type;
> 
> here, bool is_imx8mq?
> 
> >  };
> >  
> >  static struct imx7_csi *
> > @@ -537,6 +550,16 @@ static void imx7_csi_deinit(struct imx7_csi *csi,
> >  	clk_disable_unprepare(csi->mclk);
> >  }
> >  
> > +static void imx8mq_baseaddr_switch(struct imx7_csi *csi)
> 
> I think this function needs a better name. First add the imx7_csi
> prefix that all functions have, and also you are setting it specific
> to second frame and the function should not be specific to imx8.
> 
> maybe something:
> 
> imx7_csi_write_on_second_frame_enable, maybe?
> 
> > +{
> > +	u32 cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
> > +
> > +	cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> > +		BIT_BASEADDR_CHG_ERR_EN;
> > +	cr18 |= BIT_MASK_OPTION_SECOND_FRAME;
> > +	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> > +}
> > +
> >  static void imx7_csi_enable(struct imx7_csi *csi)
> >  {
> >  	/* Clear the Rx FIFO and reflash the DMA controller. */
> > @@ -551,7 +574,11 @@ static void imx7_csi_enable(struct imx7_csi *csi)
> >  
> >  	/* Enable the RxFIFO DMA and the CSI. */
> >  	imx7_csi_dmareq_rff_enable(csi);
> > +
> 
> unrelated new line.
> 
> >  	imx7_csi_hw_enable(csi);
> > +
> > +	if (csi->type == IMX8MQ)
> > +		imx8mq_baseaddr_switch(csi);
> 
> change this to new types and names?
> 
> >  }
> >  
> >  static void imx7_csi_disable(struct imx7_csi *csi)
> > @@ -1155,6 +1182,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >  	if (IS_ERR(csi->regbase))
> >  		return PTR_ERR(csi->regbase);
> >  
> > +	csi->type = (enum imx_soc)of_device_get_match_data(&pdev->dev);
> 
> here something:
>         csi->is_imx8mq = of_device_is_compatible(np, "fsl,imx8mq-csi");
>
> > +
> >  	spin_lock_init(&csi->irqlock);
> >  	mutex_init(&csi->lock);
> >  
> > @@ -1249,8 +1278,9 @@ static int imx7_csi_remove(struct platform_device *pdev)
> >  }
> >  
> >  static const struct of_device_id imx7_csi_of_match[] = {
> > -	{ .compatible = "fsl,imx7-csi" },
> > -	{ .compatible = "fsl,imx6ul-csi" },
> > +	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX8MQ },
> 
> and with the above you should not need to add the data field here.

I like match data personally (especially if we keep a device model
enum). This is exactly what match data has been designed for, to avoid
is_compatible() checks.

> > +	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7 },
> > +	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX6UL },
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, imx7_csi_of_match);

-- 
Regards,

Laurent Pinchart
