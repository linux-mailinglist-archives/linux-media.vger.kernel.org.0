Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D920955AB7E
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 18:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbiFYQHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 12:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiFYQHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 12:07:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1FB17062
        for <linux-media@vger.kernel.org>; Sat, 25 Jun 2022 09:07:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF0F931A;
        Sat, 25 Jun 2022 18:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656173267;
        bh=DT8TCTCfD7B4E8hvJMa3uUrTH8T5gucwYYlZSbGEJzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mi+jqLTPwikcwHeaz/XmpeLIPHYqrBO+IU+enR2Uk7420bYdZkYCn6ar+j/ITSSp7
         JNA8b+SeWe7a9zWipj3ZvXmi0CZhteNul2Wh8oF/32k4o/XAIxfBmL/FYDQzBXBpSj
         A5uM+iKCGk1mUhWW9gFiag8CowQV4v7j33e5qDb8=
Date:   Sat, 25 Jun 2022 19:07:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 41/55] media: rkisp1: csi: Plumb the CSI RX subdev
Message-ID: <YrcywfQYnR6TNsha@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-42-paul.elder@ideasonboard.com>
 <20220625074559.2gikye7mzx4gmcpr@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220625074559.2gikye7mzx4gmcpr@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Sat, Jun 25, 2022 at 10:45:59AM +0300, Dafna Hirschfeld wrote:
> On 15.06.2022 04:11, Paul Elder wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Connect the CSI receiver subdevice into the rest of the driver. This
> > includes:
> 
> To make it clear where you put the csi, i'll add here
> 'Connect the CSI subdevice between the source
> and the isp' or something like that.
> 
> Also the sketch 'Media Topology' in rkisp1-dev.c should be updated.

Good point, I'll do that.

> I'd also wonder if we should ignore src configuration of the isp entity
> since it must be identical to the sink of the csi.

What do you mean exactly by ignoring it ?

> > - calling the subdevice via the v4l2 subdev API
> > - moving the async notifier for the sensor from the ISP to the CSI
> >   receiver
> > - in the ISP, create a media link to the CSI receiver, and remove the
> >   media link creation to the sensor
> > - in the CSI receiver, create a media link to the sensor
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-csi.c     | 34 ++++++++++++++++--
> >  .../platform/rockchip/rkisp1/rkisp1-csi.h     |  6 ++--
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 36 +++++++++----------
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 21 ++---------
> >  4 files changed, 53 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > index 8182694a6fe0..96712b467dde 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > @@ -43,6 +43,34 @@ rkisp1_csi_get_pad_fmt(struct rkisp1_csi *csi,
> >  		return v4l2_subdev_get_try_format(&csi->sd, &state, pad);
> >  }
> > 
> > +int rkisp1_csi_link_sensor(struct rkisp1_device *rkisp1, struct v4l2_subdev *sd,
> > +			   struct rkisp1_sensor_async *s_asd,
> > +			   unsigned int source_pad)
> > +{
> > +	struct rkisp1_csi *csi = &rkisp1->csi;
> > +	int ret;		
> 
> extra space after 'ret;' ?

Oh.

Paul, did you get so used to the fact that checkstyle.py is integrated
in git hooks in libcamera that you forgot that checkpatch.pl has to be
run manually ? :-)

> > +
> > +	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
> > +						V4L2_CID_PIXEL_RATE);
> > +	if (!s_asd->pixel_rate_ctrl) {
> > +		dev_err(rkisp1->dev, "No pixel rate control in subdev %s\n",
> > +			sd->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Create the link from the sensor to the CSI receiver. */
> > +	ret = media_create_pad_link(&sd->entity, source_pad,
> > +				    &csi->sd.entity, RKISP1_CSI_PAD_SINK,
> > +				    !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
> > +	if (ret) {
> > +		dev_err(csi->rkisp1->dev, "failed to link src pad of %s\n",
> > +			sd->name);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int rkisp1_csi_config(struct rkisp1_csi *csi,
> >  			     const struct rkisp1_sensor_async *sensor)
> >  {
> > @@ -118,8 +146,8 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
> >  		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
> >  }
> > 
> > -int rkisp1_csi_start(struct rkisp1_csi *csi,
> > -		     const struct rkisp1_sensor_async *sensor)
> > +static int rkisp1_csi_start(struct rkisp1_csi *csi,
> > +			    const struct rkisp1_sensor_async *sensor)
> >  {
> >  	struct rkisp1_device *rkisp1 = csi->rkisp1;
> >  	union phy_configure_opts opts;
> > @@ -155,7 +183,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
> >  	return 0;
> >  }
> > 
> > -void rkisp1_csi_stop(struct rkisp1_csi *csi)
> > +static void rkisp1_csi_stop(struct rkisp1_csi *csi)
> >  {
> >  	rkisp1_csi_disable(csi);
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
> > index ddf8e5e08f55..eadcd24f65fb 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
> > @@ -21,8 +21,8 @@ void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
> >  int rkisp1_csi_register(struct rkisp1_device *rkisp1);
> >  void rkisp1_csi_unregister(struct rkisp1_device *rkisp1);
> > 
> > -int rkisp1_csi_start(struct rkisp1_csi *csi,
> > -		     const struct rkisp1_sensor_async *sensor);
> > -void rkisp1_csi_stop(struct rkisp1_csi *csi);
> > +int rkisp1_csi_link_sensor(struct rkisp1_device *rkisp1, struct v4l2_subdev *sd,
> > +			   struct rkisp1_sensor_async *s_asd,
> > +			   unsigned int source_pad);
> > 
> >  #endif /* _RKISP1_CSI_H */
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index faf2cd4c8149..a3e182c86bdd 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/pm_runtime.h>
> >  #include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mc.h>
> > 
> >  #include "rkisp1-common.h"
> >  #include "rkisp1-csi.h"
> > @@ -119,17 +120,8 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> >  		container_of(asd, struct rkisp1_sensor_async, asd);
> >  	int source_pad;
> > 
> > -	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
> > -						V4L2_CID_PIXEL_RATE);
> > -	if (!s_asd->pixel_rate_ctrl) {
> > -		dev_err(rkisp1->dev, "No pixel rate control in subdev %s\n",
> > -			sd->name);
> > -		return -EINVAL;
> > -	}
> > -
> >  	s_asd->sd = sd;
> > 
> > -	/* Create the link to the sensor. */
> >  	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
> >  						 MEDIA_PAD_FL_SOURCE);
> >  	if (source_pad < 0) {
> > @@ -138,10 +130,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> >  		return source_pad;
> >  	}
> > 
> > -	return media_create_pad_link(&sd->entity, source_pad,
> > -				     &rkisp1->isp.sd.entity,
> > -				     RKISP1_ISP_PAD_SINK_VIDEO,
> > -				     !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
> > +	return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, source_pad);
> >  }
> > 
> >  static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> > @@ -283,6 +272,14 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
> >  	unsigned int i;
> >  	int ret;
> > 
> > +	/* Link the CSI receiver to the ISP. */
> > +	ret = media_create_pad_link(&rkisp1->csi.sd.entity, RKISP1_CSI_PAD_SRC,
> > +				    &rkisp1->isp.sd.entity,
> > +				    RKISP1_ISP_PAD_SINK_VIDEO,
> > +				    MEDIA_LNK_FL_ENABLED);
> 
> should this also be immutable?

I don't think so, because one could connect a parallel sensor directly
to the ISP parallel input. This isn't well supported in the driver today
though, probably because nobody has cared much about upstreaming support
for such a setup, but I think it's a valid hardware option.

> > +	if (ret)
> > +		return ret;
> > +
> >  	/* create ISP->RSZ->CAP links */
> >  	for (i = 0; i < 2; i++) {
> >  		struct media_entity *resizer =
> > @@ -364,13 +361,6 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
> >  	if (ret)
> >  		goto error;
> > 
> > -	ret = rkisp1_subdev_notifier_register(rkisp1);
> > -	if (ret) {
> > -		dev_err(rkisp1->dev,
> > -			"Failed to register subdev notifier(%d)\n", ret);
> > -		goto error;
> > -	}
> > -
> >  	return 0;
> > 
> >  error:
> > @@ -534,10 +524,16 @@ static int rkisp1_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto err_cleanup_csi;
> > 
> > +	ret = rkisp1_subdev_notifier_register(rkisp1);
> > +	if (ret)
> > +		goto err_unreg_entities;
> > +
> >  	rkisp1_debug_init(rkisp1);
> > 
> >  	return 0;
> > 
> > +err_unreg_entities:
> > +	rkisp1_entities_unregister(rkisp1);
> >  err_cleanup_csi:
> >  	rkisp1_csi_cleanup(rkisp1);
> >  err_unreg_media_dev:
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 5afb8be311c7..260c9ce0dca4 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -16,7 +16,6 @@
> >  #include <media/v4l2-event.h>
> > 
> >  #include "rkisp1-common.h"
> > -#include "rkisp1-csi.h"
> > 
> >  #define RKISP1_DEF_SINK_PAD_FMT MEDIA_BUS_FMT_SRGGB10_1X10
> >  #define RKISP1_DEF_SRC_PAD_FMT MEDIA_BUS_FMT_YUYV8_2X8
> > @@ -728,16 +727,12 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> >  	struct rkisp1_device *rkisp1 = isp->rkisp1;
> > -	const struct rkisp1_sensor_async *asd;
> >  	struct media_pad *source_pad;
> >  	int ret;
> > 
> >  	if (!enable) {
> >  		v4l2_subdev_call(rkisp1->source, video, s_stream, false);
> > -
> > -		rkisp1_csi_stop(&rkisp1->csi);
> >  		rkisp1_isp_stop(isp);
> > -
> >  		return 0;
> >  	}
> > 
> > @@ -754,30 +749,20 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> >  		return -EPIPE;
> >  	}
> > 
> > -	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
> > -			   asd);
> > -
> > -	if (asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
> > -		return -EINVAL;
> > +	if (rkisp1->source != &rkisp1->csi.sd)
> > +		return -EPIPE;
> 
> This is not very clear, 'source' should point to the remote source (the one outside this driver)
> so why should it be 'csi.sd' ?
> Or is it that now 'rkips1->source' might be either the remote source or csi? if so I think it is a bit confusing.

rkisp1->source is the source of the ISP. it can be the CSI-2 receiver,
or if a parallel sensor is connected directly to the ISP, the sensor
itself. The check here is meant to catch bugs in the implementation
while transitioning, as in this patch external CSI-2 receivers or
parallel sensors are not supported yet. Patch "media: rkisp1: Support
the ISP parallel input" then changes this code.

> > 
> >  	isp->frame_sequence = -1;
> >  	mutex_lock(&isp->ops_lock);
> > -	ret = rkisp1_config_cif(isp, asd->mbus_type, asd->mbus_flags);
> > +	ret = rkisp1_config_cif(isp, V4L2_MBUS_CSI2_DPHY, 0);
> >  	if (ret)
> >  		goto mutex_unlock;
> > 
> >  	rkisp1_isp_start(isp);
> > 
> > -	ret = rkisp1_csi_start(&rkisp1->csi, asd);
> > -	if (ret) {
> > -		rkisp1_isp_stop(isp);
> > -		goto mutex_unlock;
> > -	}
> > -
> >  	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
> 
> Now that isp should call 's_stream' for 'rkisp1->csi->sd' and not 'rkisp1->source'.

As explained above, I think source is correct here, as rkisp1->csi is
the internal CSI-2 receiver, which may or may not be the source of the
ISP, depending on link configuration.

> >  	if (ret) {
> >  		rkisp1_isp_stop(isp);
> > -		rkisp1_csi_stop(&rkisp1->csi);
> >  		goto mutex_unlock;
> >  	}
> > 

-- 
Regards,

Laurent Pinchart
