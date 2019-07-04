Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 877A35FAEF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 17:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfGDPfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 11:35:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41993 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfGDPfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 11:35:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so6527222lje.9
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2019 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ftfuE0nCe9GeYL9rpNN9TbJjc6SpeucbJqhehh2vn8c=;
        b=f6PY250eXONMBeCA9FWE/xX12IP4OGlh7AdaFbBTHd/yrFH/ltOBVPREc1Rz3W4d53
         R/rG4pozpsVzM39FcU9p8gtxsMp/ihk/8SXdQ4gcttTGChJKDM9F6LcbELmPq3orBApX
         ltcapx8sYxOCNYldrEoXo4e289f4cOBH+mdGgEgWHFKBNsOLh/15yoI6CxhpK7KcVlRG
         av+ls6tdyOmLu9tf0sruGESNQK7MEVxLO+Q8n8M80qIZZQOSfr/cONWPL+3NFoFI39j2
         URaplO4qSm4EaT/Jid8/seoQlhfQiuP79ikz1Ln/7dcIjQvebEugX5Cxbduyf3OTCjZM
         FNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ftfuE0nCe9GeYL9rpNN9TbJjc6SpeucbJqhehh2vn8c=;
        b=SPcHf9a4AGFeufI2/zuSj1mEgs9poTD7pz+oVtfuHVANcPNnkCbN6mAhGoV8TNDdS2
         CaVIB9z9EwLCz9waedxfeOzuCOlo0mfK1pV6m2UvrnO0VIQ4fVrRTK6ECZxxg1V1X9xG
         t9avFad+YeWhofpBJ4hyLWsrOJds31Kj+sfmXLWsQPLWvRunAnxxQjoEdw5bb5OjUt8g
         O1NrRs/74ffULGBpsYhtwa1dGOz3hFleDGpBhtiGOG+RJbthxfnHnQL+2JepqoykY8yh
         w64ke14SY7YL/Q3OefHsFdLD+0V7mpoHRee+xiV2OiFEQuo1FbYfeT6Yl1TozQu1cxrP
         Ntcw==
X-Gm-Message-State: APjAAAXC8so+hFy0Lsojz7Ei8f1bwgdcJzV9gxSQBXX3YePF3HU/PN3+
        PjBaC7Ixul1CYvSjoNRyNUrUCw==
X-Google-Smtp-Source: APXvYqzI69ANW+izLKkCmCYp9JfZz1UXPyrWRqy2uqWMip0tC/OzEf0bHli/IPQaOMRA1RPH8MklMA==
X-Received: by 2002:a2e:968e:: with SMTP id q14mr1412921lji.195.1562254507238;
        Thu, 04 Jul 2019 08:35:07 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id m25sm224034lfc.83.2019.07.04.08.35.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 08:35:06 -0700 (PDT)
Date:   Thu, 4 Jul 2019 17:35:05 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] rcar-vin: Add control for alpha component
Message-ID: <20190704153505.GE17685@bigcity.dyn.berto.se>
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
 <20190704015817.17083-3-niklas.soderlund+renesas@ragnatech.se>
 <c1c5dded-8a39-131e-4bef-ed13dc2fba47@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1c5dded-8a39-131e-4bef-ed13dc2fba47@ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for your feedback.

On 2019-07-04 16:15:54 +0100, Kieran Bingham wrote:
> Hi Niklas,
> 
> On 04/07/2019 02:58, Niklas Söderlund wrote:
> > In preparation to adding support for RGB pixel formats with an alpha
> > component add a control to allow the user to control which alpha value
> > should be used.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Comment/Question below, but:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
> 
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
> 
> There's quite a few lines duplicated between rvin_mc_init() and
> rvin_parallel_subdevice_attach() to instantiate the controls. Could that
> code be shared in a single function, which would make it easier to
> extend with new controls?

Yes there is, and I have deliberately keep them so. Reason for this is 
that I'm trying to work up the courage to split this driver in two, one 
which is pure video device centric (Gen2 only) and one that is media 
device centric (Gen2 and Gen3). Then marking the Gen2 only driver as 
deprecated and in time delete it completely making rcar-vin media device 
centric only for both Gen2 and Gen3. Another option is of course to skip 
the splitting step and sometime in the future delete the video device 
centric mode directly.

In both cases it will be easier to do if the two modes init code are 
split to make it easier to move or delete. So I would prefer to keep the 
code as it is for now.

> 
> Perhaps no other controls are expected though.

No other controls are expected for Gen3.

> 
> Anyway, that's not so crucial - so RB tag added above.

Thanks.

> 
> 
> 
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
> > 
> 

-- 
Regards,
Niklas Söderlund
