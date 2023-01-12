Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08547667CC6
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 18:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjALRkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 12:40:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjALRkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 12:40:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E1E6D50F
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 08:59:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FE5F10B;
        Thu, 12 Jan 2023 17:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673542753;
        bh=LQEIH/k9144rFdlUEP5kTnOSwQzrQX4DezugO+R2KrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U1gEGiTcNTR4h2zygiq23IQMJT7kL4wT71ricTDD7tRMffz2kBj3DNFYBdfpHrOj7
         TKedhn0IHpQ0Lnp74xz12Qfk/GqpRFvE9MZ2PwPbRKZgkzE8fetFt9JkB+p7kDvhwK
         +IMVoZH9PPcROE8udel5//iQjDrkUZFUolCVrfbM=
Date:   Thu, 12 Jan 2023 18:59:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v1 2/6] media: imx-pxp: Add media controller support
Message-ID: <Y8A8YExjE1FCiQdn@pendragon.ideasonboard.com>
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
 <20230106133227.13685-3-laurent.pinchart@ideasonboard.com>
 <20230112135820.GN24101@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112135820.GN24101@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Thu, Jan 12, 2023 at 02:58:20PM +0100, Michael Tretter wrote:
> On Fri, 06 Jan 2023 15:32:23 +0200, Laurent Pinchart wrote:
> > Register a media device for the PXP, using the v4l2-mem2mem MC
> > infrastructure to populate the media graph. No media device operation is
> > implemented, the main use of the MC API is to allow consistent discovery
> > of media devices for userspace.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-pxp.c | 37 ++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> > index dcb04217288b..132065c8b8b4 100644
> > --- a/drivers/media/platform/nxp/imx-pxp.c
> > +++ b/drivers/media/platform/nxp/imx-pxp.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> >  
> > +#include <media/media-device.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> > @@ -200,6 +201,9 @@ struct pxp_pdata {
> >  struct pxp_dev {
> >  	struct v4l2_device	v4l2_dev;
> >  	struct video_device	vfd;
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	struct media_device	mdev;
> > +#endif
> >  
> >  	struct clk		*clk;
> >  	void __iomem		*mmio;
> > @@ -1832,8 +1836,36 @@ static int pxp_probe(struct platform_device *pdev)
> >  		goto err_m2m;
> >  	}
> >  
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	dev->mdev.dev = &pdev->dev;
> > +	strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
> > +	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info), "platform:%s",
> > +		 dev_name(&pdev->dev));
> 
> v4l2-compliance gives the following warning:
> 
> 	warn: v4l2-compliance.cpp(642): media bus_info 'platform:30700000.pxp' differs from V4L2 bus_info 'platform:pxp'
> 
> I would change this patch to use the same name as in the V4L2 bus_info. Do you
> have a reason for including the address in the bus_info?

Actually, I should drop bus_info here. The documentation of
media_device_init() states

 * The bus_info field is set by media_device_init() for PCI and platform devices
 * if the field begins with '\0'.

media_device_init() calls media_set_bus_info() which is defined as

/**
 * media_set_bus_info() - Set bus_info field
 *
 * @bus_info:		Variable where to write the bus info (char array)
 * @bus_info_size:	Length of the bus_info
 * @dev:		Related struct device
 *
 * Sets bus information based on &dev. This is currently done for PCI and
 * platform devices. dev is required to be non-NULL for this to happen.
 *
 * This function is not meant to be called from drivers.
 */
static inline void
media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
{
	if (!dev)
		strscpy(bus_info, "no bus info", bus_info_size);
	else if (dev_is_platform(dev))
		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
	else if (dev_is_pci(dev))
		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
}

v4l_querycap() also calls media_set_bus_info(). Including the device
name is thus the recommended option.

I'll include in v2 another patch that drops the bus_info from the
video_device to make v4l2-compliance happy.

> > +	media_device_init(&dev->mdev);
> > +	dev->v4l2_dev.mdev = &dev->mdev;
> > +
> > +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> > +						 MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to initialize media device\n");
> > +		goto err_vfd;
> > +	}
> > +
> > +	ret = media_device_register(&dev->mdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to register media device\n");
> > +		goto err_m2m_mc;
> > +	}
> > +#endif
> > +
> >  	return 0;
> >  
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +err_m2m_mc:
> > +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> > +err_vfd:
> > +	video_unregister_device(vfd);
> > +#endif
> >  err_m2m:
> >  	v4l2_m2m_release(dev->m2m_dev);
> >  err_v4l2:
> > @@ -1854,6 +1886,11 @@ static int pxp_remove(struct platform_device *pdev)
> >  	clk_disable_unprepare(dev->clk);
> >  
> >  	v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	media_device_unregister(&dev->mdev);
> > +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> > +#endif
> >  	video_unregister_device(&dev->vfd);
> >  	v4l2_m2m_release(dev->m2m_dev);
> >  	v4l2_device_unregister(&dev->v4l2_dev);

-- 
Regards,

Laurent Pinchart
