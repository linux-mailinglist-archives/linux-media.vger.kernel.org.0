Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 589C020790
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 15:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfEPNEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 09:04:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45432 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfEPNEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 09:04:34 -0400
Received: by mail-lf1-f66.google.com with SMTP id n22so2544556lfe.12
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QmYIA/bPPfJ5nYfReI91DNvI6fTYoBR5zHF++KGo7ME=;
        b=nIbyg0XFxHaLbZPsvZRKM+PonaSRycdwm6iL0UY9N/ERxbrB3oPc0R3vIEHlYFCsTD
         NwI1d74u2yAgf56C9T5DGq8h4+oLD87YW0Q5snzeUtx3luMlbNISgQdwcnkqdbBVOkWo
         k2RTsA5nxfiJbpoosX+PKVI+EcgiE/mKPWkfxo3K/JsP/cREJeFu+fR5+3b8gedUZHRY
         PwIB8Ag8I33N4D/lGlu15WktgCQDAj3iWo6mOZQzwcFqswPDL0WH761+j5Oty8l+n/7z
         0VqZ8WnbNggLk227V7UzI+LLAsBrqYeYTOeoFzEm0CbU/0NrzJhzwurDCor4duJ3HNE/
         h97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QmYIA/bPPfJ5nYfReI91DNvI6fTYoBR5zHF++KGo7ME=;
        b=Q2feWGO/ftpqh575JDatYH3H+qCFEbzBXknBZGrAX98UWhx0VmHhxgagDzULFfMLmB
         srGMoEzXEjQKuD5cRSx8SGs/6r5Iz7cUa/I7DzhtvTOjP+i2DU4jpmpuYkkKrgBXg8SQ
         zsrrbWd2zuYwu7zN4xsH0S2aW2KsWgtZS+LisqpkGEvonZKTP9dyYmYMkUipMB6JtEaX
         EetvqhuNO7LVSfIgoT9gjGCVcUKpSU+PTKdIy0oKlsttkNoCw3qBorWtOYmuQCZcRDgY
         OHvQ7p7W8P5cD1d1pvpOdOGCxbhoQLskcE2d/91Il1beBpaCVXe9yLX0Zg+kt9qbU7oB
         N8JQ==
X-Gm-Message-State: APjAAAVzVEqkYOzbwxOT69pO91fYqn3kwnMGT0fpH9y8nc2bIIvr2tvj
        ykCgWN9ikA3TKJgQg0XfwUu+RHXG8ZU=
X-Google-Smtp-Source: APXvYqwDbpUJ/DrOxZitsTSTcx9JCIZK4sqvQioDBeIuF+JNPxz3DCq5SeDzlStI3CIL3X6U7eZ1+w==
X-Received: by 2002:ac2:5505:: with SMTP id j5mr19953711lfk.60.1558011871113;
        Thu, 16 May 2019 06:04:31 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id k18sm869760ljk.70.2019.05.16.06.04.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 06:04:30 -0700 (PDT)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 16 May 2019 15:04:30 +0200
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] rcar-vin: Add control for alpha component
Message-ID: <20190516130430.GD31788@bigcity.dyn.berto.se>
References: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516004746.3794-3-niklas.soderlund+renesas@ragnatech.se>
 <20190516100138.GB4995@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516100138.GB4995@pendragon.ideasonboard.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-05-16 13:01:38 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, May 16, 2019 at 02:47:45AM +0200, Niklas Söderlund wrote:
> > In preparation to adding support for RGB pixel formats with an alpha
> > component add a control to allow the user to control which alpha value
> > should be used.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 53 ++++++++++++++++++++-
> >  drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++
> >  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++
> >  3 files changed, 61 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 64f9cf790445d14e..ee6e6cb39c749675 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -389,6 +389,28 @@ static void rvin_group_put(struct rvin_dev *vin)
> >  	kref_put(&group->refcount, rvin_group_release);
> >  }
> >  
> > +/* -----------------------------------------------------------------------------
> > + * Controls
> > + */
> > +
> > +static int rvin_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct rvin_dev *vin =
> > +		container_of(ctrl->handler, struct rvin_dev, ctrl_handler);
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_ALPHA_COMPONENT:
> > +		rvin_set_alpha(vin, ctrl->val);
> 
> You can set vin->alpha here directly, no need for a rvin_set_alpha()
> function.

I think you discovers the reason for this in 3/3. I could set vin->alpha 
directly here and introduce rvin_set_alpha() in 3/3. I opted for this 
approach as the reason form not margin 2/3 and 3/3 into a single patch 
is that I only want the register writes in 3/3.

> 
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
> > +	.s_ctrl = rvin_s_ctrl,
> > +};
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Async notifier
> >   */
> > @@ -478,6 +500,15 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > +
> > +	if (vin->ctrl_handler.error) {
> > +		ret = vin->ctrl_handler.error;
> > +		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +		return ret;
> > +	}
> > +
> >  	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
> >  				    NULL, true);
> >  	if (ret < 0) {
> > @@ -870,6 +901,21 @@ static int rvin_mc_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		rvin_group_put(vin);
> >  
> > +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> > +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> > +
> > +	if (vin->ctrl_handler.error) {
> > +		ret = vin->ctrl_handler.error;
> > +		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +		return ret;
> > +	}
> > +
> > +	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> > +
> >  	return ret;
> >  }
> >  
> > @@ -1245,6 +1291,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  
> >  	vin->dev = &pdev->dev;
> >  	vin->info = of_device_get_match_data(&pdev->dev);
> > +	vin->alpha = 0xff;
> >  
> >  	/*
> >  	 * Special care is needed on r8a7795 ES1.x since it
> > @@ -1288,6 +1335,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  	return 0;
> >  
> >  error_group_unregister:
> > +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +
> >  	if (vin->info->use_mc) {
> >  		mutex_lock(&vin->group->lock);
> >  		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> > @@ -1323,10 +1372,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
> >  		}
> >  		mutex_unlock(&vin->group->lock);
> >  		rvin_group_put(vin);
> > -	} else {
> > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> >  	}
> >  
> > +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > +
> >  	rvin_dma_unregister(vin);
> >  
> >  	return 0;
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 2d146ecf93d66ad5..4e991cce5fb56a90 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -1343,3 +1343,8 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
> >  
> >  	return 0;
> >  }
> > +
> > +void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
> > +{
> > +	vin->alpha = alpha;
> > +}
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index 0b13b34d03e3dce4..365dfde06ec25add 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -178,6 +178,8 @@ struct rvin_info {
> >   * @compose:		active composing
> >   * @source:		active size of the video source
> >   * @std:		active video standard of the video source
> > + *
> 
> Do you need a blank line here ?

I don't need it, but it make sens in my head on how I group variables in 
sturct rvin_info. There already exists blank lines in the structure for 
this grouping of variables thinking. If you are OK with it I would 
prefer to keep it, but I do not feel strongly about it.

> 
> Apart from that the patch looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> > + * @alpha:		Alpha component to fill in for supported pixel formats
> >   */
> >  struct rvin_dev {
> >  	struct device *dev;
> > @@ -215,6 +217,8 @@ struct rvin_dev {
> >  	struct v4l2_rect compose;
> >  	struct v4l2_rect source;
> >  	v4l2_std_id std;
> > +
> > +	unsigned int alpha;
> >  };
> >  
> >  #define vin_to_source(vin)		((vin)->parallel->subdev)
> > @@ -266,5 +270,6 @@ const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat);
> >  void rvin_crop_scale_comp(struct rvin_dev *vin);
> >  
> >  int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel);
> > +void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha);
> >  
> >  #endif
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
