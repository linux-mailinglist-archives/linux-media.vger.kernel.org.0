Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351C46601BA
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 15:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbjAFOCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 09:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbjAFOBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 09:01:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F15C7BDF3
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 06:01:44 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnHy-0002wo-A9; Fri, 06 Jan 2023 15:01:42 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnHx-0003Um-H1; Fri, 06 Jan 2023 15:01:41 +0100
Date:   Fri, 6 Jan 2023 15:01:41 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] media: imx-pxp: detect PXP version
Message-ID: <20230106140141.GC24101@pengutronix.de>
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
 <20230105134729.59542-3-m.tretter@pengutronix.de>
 <Y7gKUtGM+PRVgWja@pendragon.ideasonboard.com>
 <Y7gT/+2c5G9lT8jM@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7gT/+2c5G9lT8jM@pendragon.ideasonboard.com>
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

On Fri, 06 Jan 2023 14:28:47 +0200, Laurent Pinchart wrote:
> On Fri, Jan 06, 2023 at 01:47:32PM +0200, Laurent Pinchart wrote:
> > Thank you for the patch.
> > 
> > On Thu, Jan 05, 2023 at 02:47:23PM +0100, Michael Tretter wrote:
> > > Different versions of the Pixel Pipeline have different blocks and their
> > > routing may be different. Read the PXP_HW_VERSION register to determine
> > > the version of the PXP and print it to the log for debugging purposes.
> > 
> > Is there a specific reason you chose to read the version register
> > instead of basing the decision on the compatible string ?
> 
> Reading the rest of the series, you use the compatible strings later,
> and never use the hw_version field. I'm tempted to propose dropping this
> patch.

My first try was to use the version register, but it turned out that the
version is the same at least on i.MX6ULL and i.MX7D. I kept it to avoid that
others fall into the same trap.

> 
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  drivers/media/platform/nxp/imx-pxp.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> > > index 689ae5e6ac62..05abe40558b0 100644
> > > --- a/drivers/media/platform/nxp/imx-pxp.c
> > > +++ b/drivers/media/platform/nxp/imx-pxp.c
> > > @@ -10,6 +10,7 @@
> > >   * Pawel Osciak, <pawel@osciak.com>
> > >   * Marek Szyprowski, <m.szyprowski@samsung.com>
> > >   */
> > > +#include <linux/bitfield.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/dma-mapping.h>
> > > @@ -52,6 +53,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
> > >  #define MEM2MEM_HFLIP	(1 << 0)
> > >  #define MEM2MEM_VFLIP	(1 << 1)
> > >  
> > > +#define PXP_VERSION_MAJOR(version) \
> > > +	FIELD_GET(BM_PXP_VERSION_MAJOR, version)
> > > +#define PXP_VERSION_MINOR(version) \
> > > +	FIELD_GET(BM_PXP_VERSION_MINOR, version)
> > > +
> > >  #define dprintk(dev, fmt, arg...) \
> > >  	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
> > >  
> > > @@ -192,6 +198,8 @@ struct pxp_dev {
> > >  	struct clk		*clk;
> > >  	void __iomem		*mmio;
> > >  
> > > +	u32			hw_version;
> > > +
> > >  	atomic_t		num_inst;
> > >  	struct mutex		dev_mutex;
> > >  	spinlock_t		irqlock;
> > > @@ -1660,6 +1668,11 @@ static int pxp_soft_reset(struct pxp_dev *dev)
> > >  	return 0;
> > >  }
> > >  
> > > +static u32 pxp_read_version(struct pxp_dev *dev)
> > > +{
> > > +	return readl(dev->mmio + HW_PXP_VERSION);
> > > +}
> > > +
> > >  static int pxp_probe(struct platform_device *pdev)
> > >  {
> > >  	struct pxp_dev *dev;
> > > @@ -1705,6 +1718,11 @@ static int pxp_probe(struct platform_device *pdev)
> > >  		goto err_clk;
> > >  	}
> > >  
> > > +	dev->hw_version = pxp_read_version(dev);
> > > +	dev_info(&pdev->dev, "PXP Version %d.%d\n",
> > 
> > As the version can't be negative, I'd use %u.%u.
> > 
> > > +		 PXP_VERSION_MAJOR(dev->hw_version),
> > > +		 PXP_VERSION_MINOR(dev->hw_version));
> > > +
> > 
> > The driver now prints two messages at probe time, it would be nice to
> > combine them, or remove the other one. That's a candidate for a future
> > patch though.

I would reduce the level to dev_debug. Then the version is not always printed,
but it can be easily enabled if necessary for the bringup on another platform.

Michael

> > 
> > >  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > >  	if (ret)
> > >  		goto err_clk;
