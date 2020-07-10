Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3713821B44A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 13:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGJLvz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 07:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGJLvy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 07:51:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908EBC08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 04:51:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30FFC2C0;
        Fri, 10 Jul 2020 13:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594381910;
        bh=OHN50b6JAGOqsAEb7spbdDVp9oXXMrsu5bS5Y1ZUNTo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CmnINs3OqZb41yVM2gnf+S8TBROXbGtqFJVWWlBHUchVjIRG0AqcVNmU/Eg2EJBht
         wr5dGe9zikJORujPPDSdOxvEwWdjW+y8O5rukjchoxOZMAJixRYudypqYOYmAvjm7L
         ctbOIs6/zlD6kTsMW567HLYSOzue/vbBUXMufnYQ=
Date:   Fri, 10 Jul 2020 14:51:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v2 057/108] media: ti-vpe: cal: Add
 cal_camerarx_destroy() to cleanup CAMERARX
Message-ID: <20200710115143.GL5964@pendragon.ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
 <20200706183709.12238-58-laurent.pinchart@ideasonboard.com>
 <fe5265b8-2ad4-3017-d223-d8d55e3b7082@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe5265b8-2ad4-3017-d223-d8d55e3b7082@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 10, 2020 at 01:24:28PM +0200, Hans Verkuil wrote:
> On 06/07/2020 20:36, Laurent Pinchart wrote:
> > The cal_camerarx_create() function allocates resources with devm_*, and
> > thus doesn't need any manual cleanup. Those won't hold true for long, as
> > we will need to store resources that have no devm_* allocation variant
> > in cal_camerarx. Furthermore, devm_kzalloc() is the wrong memory
> > allocation API for structures that can be accessed from userspace, as
> > device nodes can be kept open across device removal.
> > 
> > Add a cal_camerarx_destroy() function to destroy a CAMERARX instance
> > explicitly, and switch to kzalloc() for memory allocation.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Set cal->phy[i] to NULL in error path
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++++++++-----
> >  1 file changed, 30 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 5580913a1356..492141f07d69 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -932,7 +932,7 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  	struct cal_camerarx *phy;
> >  	int ret;
> >  
> > -	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> > +	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
> >  	if (!phy)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > @@ -947,7 +947,8 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
> >  	if (IS_ERR(phy->base)) {
> >  		cal_err(cal, "failed to ioremap\n");
> > -		return ERR_CAST(phy->base);
> > +		ret = PTR_ERR(phy->base);
> > +		goto error;
> >  	}
> >  
> >  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> > @@ -955,9 +956,21 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
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
> 
> This isn't necessary since kfree already tests for this.

The function later gets expanded to perform more cleanups that would
crash if phy was null. I'd rather keep the check here to show that
calling cal_camerarx_destroy() with a null pointer is allowed by design.

> > +
> > +	kfree(phy);
> >  }
> >  
> >  static int cal_camerarx_init_regmap(struct cal_dev *cal)
> > @@ -2253,15 +2266,18 @@ static int cal_probe(struct platform_device *pdev)
> >  	/* Create CAMERARX PHYs. */
> >  	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> >  		cal->phy[i] = cal_camerarx_create(cal, i);
> > -		if (IS_ERR(cal->phy[i]))
> > -			return PTR_ERR(cal->phy[i]);
> > +		if (IS_ERR(cal->phy[i])) {
> > +			ret = PTR_ERR(cal->phy[i]);
> > +			cal->phy[i] = NULL;
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
> > @@ -2302,6 +2318,11 @@ static int cal_probe(struct platform_device *pdev)
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
> > @@ -2330,6 +2351,9 @@ static int cal_remove(struct platform_device *pdev)
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
