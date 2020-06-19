Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40E7201125
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 17:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405115AbgFSPhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 11:37:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33998 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404463AbgFSPhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 11:37:00 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FC6B552;
        Fri, 19 Jun 2020 17:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592581018;
        bh=5PCfGFRccPAS7oceW2xy4dkXgOlqPQr7HTDzT3Vu/5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AGhC7yLtUhQBuT8LfGVxbUOIDbw/bAlAq7ScFAYXTPhu2kTrumOrTOT9+WkyJnQ4w
         rIwtFV3UGSM5TCJcEoc4m3t5WZMTOW3JpT1Hffdk72veOStbESXsjEoMdOLR+f9O49
         o3L+rB92pzDAkHUwLOCm7yexizApbINJGBaeqvT8=
Date:   Fri, 19 Jun 2020 18:36:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 056/107] media: ti-vpe: cal: Add
 cal_camerarx_destroy() to cleanup CAMERARX
Message-ID: <20200619153634.GG5823@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-57-laurent.pinchart@ideasonboard.com>
 <7b83dfbe-529f-7dce-5ca0-882d6000e7da@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b83dfbe-529f-7dce-5ca0-882d6000e7da@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jun 17, 2020 at 11:43:25AM +0100, Kieran Bingham wrote:
> On 15/06/2020 00:58, Laurent Pinchart wrote:
> > The cal_camerarx_create() function allocates resources with devm_*, and
> > thus doesn't need any manual cleanup. Those won't hold true for long, as
> > we will need to store resources that have no devm_* allocation variant
> > in cal_camerarx. Furthermore, devm_kzalloc() is the wrong memory
> > allocation API for structures that can be accessed from userspace, as
> > device nodes can be kept open across device removal.
> 
> I still think that should be fixed by making devm_ allocations able to
> be reference counted so that it doesn't remove until until references
> (from open file handles) are released ;-) but that's completely out of
> scope here...

I don't think we can use devm_* for this purpose, as the resources are
tied to the lifetime of the device to driver binding, and that's the
completely wrong option in most cases. Fixing devm_* is likely not
possible. Ideally, I'd like devres to be moved to a different container
than struct device (kref comes to mind, there's probably other options),
and devm_* should be updated accordingly. We could then create a
separate devres-based API for resources visible to userspace.

Daniel Vetter has proposed a different approach, specific to DRM, see
include/drm/drm_managed.h. I don't like it much as it's a bit of a "I
don't care about the rest of the world I'll do my own thing and leave
others behind" approach, but I also agree that sometimes the rest of the
world has a too large inertia. The Linux kernel is like any human
construct, it has progressive and conservative sides.

> > Add a cal_camerarx_destroy() function to destroy a CAMERARX instance
> > explicitly, and switch to kzalloc() for memory allocation.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 35 ++++++++++++++++++++++++-----
> >  1 file changed, 29 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index b8c7ad8e39cd..c9fef333c532 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -931,7 +931,7 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  	struct cal_camerarx *phy;
> >  	int ret;
> >  
> > -	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> > +	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
> >  	if (!phy)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > @@ -946,7 +946,8 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
> >  	if (IS_ERR(phy->base)) {
> >  		cal_err(cal, "failed to ioremap\n");
> > -		return ERR_CAST(phy->base);
> > +		ret = PTR_ERR(phy->base);
> > +		goto error;
> >  	}
> >  
> >  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> > @@ -954,9 +955,21 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  
> >  	ret = cal_camerarx_regmap_init(cal, phy);
> >  	if (ret)
> > -		return ERR_PTR(ret);
> > +		goto error;
> >  
> >  	return phy;
> > +
> > +error:
> > +	kfree(phy);
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +static void cal_camerarx_destroy(struct cal_camerarx *phy)
> > +{
> > +	if (!phy)
> > +		return;
> > +
> > +	kfree(phy);
> >  }
> >  
> >  static int cal_camerarx_init_regmap(struct cal_dev *cal)
> > @@ -2252,15 +2265,17 @@ static int cal_probe(struct platform_device *pdev)
> >  	/* Create CAMERARX PHYs. */
> >  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
> >  		cal->phy[i] = cal_camerarx_create(cal, i);
> > -		if (IS_ERR(cal->phy[i]))
> > -			return PTR_ERR(cal->phy[i]);
> > +		if (IS_ERR(cal->phy[i])) {
> > +			ret = PTR_ERR(cal->phy[i]);
> 
> here, cal->phy[i] is an error value, but you then iterate them and call
> cal_camerarx_destroy() on this value.
> 
> Perhaps you should set the following here, before jumping:
> 
> 			cal->phy[i] = NULL;

Good catch, I'll fix that.

> > +			goto error_camerarx;
> > +		}
> >  	}
> >  
> >  	/* Register the V4L2 device. */
> >  	ret = v4l2_device_register(&pdev->dev, &cal->v4l2_dev);
> >  	if (ret) {
> >  		cal_err(cal, "Failed to register V4L2 device\n");
> > -		return ret;
> > +		goto error_camerarx;
> >  	}
> >  
> >  	/* Create contexts. */
> > @@ -2301,6 +2316,11 @@ static int cal_probe(struct platform_device *pdev)
> >  
> >  error_v4l2:
> >  	v4l2_device_unregister(&cal->v4l2_dev);
> > +
> > +error_camerarx:
> > +	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
> > +		cal_camerarx_destroy(cal->phy[i]);
> > +
> >  	return ret;
> >  }
> >  
> > @@ -2329,6 +2349,9 @@ static int cal_remove(struct platform_device *pdev)
> >  
> >  	v4l2_device_unregister(&cal->v4l2_dev);
> >  
> > +	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
> > +		cal_camerarx_destroy(cal->phy[i]);
> > +
> >  	pm_runtime_put_sync(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  

-- 
Regards,

Laurent Pinchart
