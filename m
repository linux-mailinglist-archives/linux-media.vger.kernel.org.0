Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 310676601CF
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 15:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbjAFOLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 09:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjAFOLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 09:11:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0A077D2D
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 06:11:43 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnRd-0004Qm-I6; Fri, 06 Jan 2023 15:11:41 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnRd-0004ck-5w; Fri, 06 Jan 2023 15:11:41 +0100
Date:   Fri, 6 Jan 2023 15:11:41 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] media: imx-pxp: make data_path_ctrl0 platform
 dependent
Message-ID: <20230106141141.GE24101@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-7-m.tretter@pengutronix.de>
 <Y7gUfByMdqL3WFJI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7gUfByMdqL3WFJI@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 06 Jan 2023 14:30:52 +0200, Laurent Pinchart wrote:
> On Thu, Jan 05, 2023 at 02:47:27PM +0100, Michael Tretter wrote:
> > Unfortunately, the PXP_HW_VERSION register reports the PXP on the i.MX7D
> > and on the i.MX6ULL as version 3.0, although the PXP versions on these
> > SoCs have significant differences.
> > 
> > Use the compatible to configure the ctrl0 register as required dependent
> > on the platform.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/media/platform/nxp/imx-pxp.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> > index 1d649b9cadad..4e182f80a36b 100644
> > --- a/drivers/media/platform/nxp/imx-pxp.c
> > +++ b/drivers/media/platform/nxp/imx-pxp.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> >  
> > @@ -191,6 +192,11 @@ static struct pxp_fmt *find_format(struct v4l2_format *f)
> >  	return &formats[k];
> >  }
> >  
> > +struct pxp_ctx;
> 
> Please add a blank line here.
> 
> > +struct pxp_pdata {
> > +	u32 (*data_path_ctrl0)(struct pxp_ctx *ctx);
> > +};
> > +
> >  struct pxp_dev {
> >  	struct v4l2_device	v4l2_dev;
> >  	struct video_device	vfd;
> > @@ -199,6 +205,7 @@ struct pxp_dev {
> >  	void __iomem		*mmio;
> >  
> >  	u32			hw_version;
> > +	const struct pxp_pdata	*pdata;
> >  
> >  	atomic_t		num_inst;
> >  	struct mutex		dev_mutex;
> > @@ -726,7 +733,7 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
> >  	}
> >  }
> >  
> > -static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
> > +static u32 pxp_imx6ull_data_path_ctrl0(struct pxp_ctx *ctx)
> >  {
> >  	u32 ctrl0;
> >  
> > @@ -756,6 +763,16 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
> >  	return ctrl0;
> >  }
> >  
> > +static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
> > +{
> > +	struct pxp_dev *dev = ctx->dev;
> > +
> > +	if (dev->pdata && dev->pdata->data_path_ctrl0)
> > +		return dev->pdata->data_path_ctrl0(ctx);
> > +
> > +	return pxp_imx6ull_data_path_ctrl0(ctx);
> 
> Do you need this fallback, given that all compatible strings give you
> valid pdata ? I'd rather be explicit.
> 
> This function then becomes so small that I would inline it in the
> caller.

I was a bit paranoid that there may be cases in which pdata is not set. I will
change this to assume that pdata is always valid and just be explicit.

Michael

> 
> > +}
> > +
> >  static void pxp_set_data_path(struct pxp_ctx *ctx)
> >  {
> >  	struct pxp_dev *dev = ctx->dev;
> > @@ -1711,6 +1728,8 @@ static int pxp_probe(struct platform_device *pdev)
> >  	if (!dev)
> >  		return -ENOMEM;
> >  
> > +	dev->pdata = of_device_get_match_data(&pdev->dev);
> > +
> >  	dev->clk = devm_clk_get(&pdev->dev, "axi");
> >  	if (IS_ERR(dev->clk)) {
> >  		ret = PTR_ERR(dev->clk);
> > @@ -1811,8 +1830,12 @@ static int pxp_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > +static const struct pxp_pdata pxp_imx6ull_pdata = {
> > +	.data_path_ctrl0 = pxp_imx6ull_data_path_ctrl0,
> > +};
> > +
> >  static const struct of_device_id pxp_dt_ids[] = {
> > -	{ .compatible = "fsl,imx6ull-pxp", .data = NULL },
> > +	{ .compatible = "fsl,imx6ull-pxp", .data = &pxp_imx6ull_pdata },
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, pxp_dt_ids);
