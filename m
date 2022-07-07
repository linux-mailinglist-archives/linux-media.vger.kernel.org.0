Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F66C56A62D
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 16:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiGGOwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 10:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbiGGOve (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 10:51:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6B25070D
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 07:51:04 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EDD6326;
        Thu,  7 Jul 2022 16:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657205462;
        bh=1FMM9lyOL9bqaepNMdMa8h7pr7/6KwIZW3RNznvcj8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hXO4MKJmGPOLNud35PmrobKlZfzFgt5Ot9dIjCRM5S3SV89aBs0M1428iYTnxNcCG
         YKXJYj6jnIxQo2h0G0znD7iSVzYOT5Q2IPAyrg4sXksM+Zy6p3iDfvmHROpoENvgBN
         o6ONdCi2hDcQRAQpfqyWAjknzXCCvtXaVGxubpvQ=
Date:   Thu, 7 Jul 2022 23:50:52 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 18/55] media: rkisp1: Fix sensor source pad retrieval
 at bound time
Message-ID: <20220707145052.GP3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-19-laurent.pinchart@ideasonboard.com>
 <20220707140123.GM3886060@pyrite.rasen.tech>
 <YsbyFwtuhBChV+gn@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsbyFwtuhBChV+gn@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jul 07, 2022 at 05:47:51PM +0300, Laurent Pinchart wrote:
> Hi Paul,
> 
> On Thu, Jul 07, 2022 at 11:01:23PM +0900, paul.elder@ideasonboard.com wrote:
> > On Fri, Jul 01, 2022 at 02:06:36AM +0300, Laurent Pinchart wrote:
> > > When a sensor is bound, its source pad is retrieved in the .bound()
> > > operation with a call to media_entity_get_fwnode_pad(). The function
> > > should be called with the source endpoint fwnode of the sensor, but is
> > > instead called with the sensor's device fwnode.
> > > 
> > > Fix this, which involves storing a reference to the source endpoint
> > > fwnode in the rkisp1_sensor_async structure, and thus implementing the
> > > subdev notifier .destroy() operation to release the reference.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
> > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 28 ++++++++++++++++---
> > >  2 files changed, 26 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > index b0896b508db3..f08b3dec1465 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > @@ -117,6 +117,7 @@ struct rkisp1_info {
> > >   *
> > >   * @asd:		async_subdev variable for the sensor
> > >   * @index:		index of the sensor (counting sensor found in DT)
> > > + * @source_ep:		fwnode for the sensor source endpoint
> > >   * @lanes:		number of lanes
> > >   * @mbus_type:		type of bus (currently only CSI2 is supported)
> > >   * @mbus_flags:		media bus (V4L2_MBUS_*) flags
> > > @@ -127,6 +128,7 @@ struct rkisp1_info {
> > >  struct rkisp1_sensor_async {
> > >  	struct v4l2_async_subdev asd;
> > >  	unsigned int index;
> > > +	struct fwnode_handle *source_ep;
> > >  	unsigned int lanes;
> > >  	enum v4l2_mbus_type mbus_type;
> > >  	unsigned int mbus_flags;
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > index 2e68f35e8ea5..813c013139ea 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > @@ -138,7 +138,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> > >  	phy_init(s_asd->dphy);
> > >  
> > >  	/* Create the link to the sensor. */
> > > -	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
> > > +	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
> > >  						 MEDIA_PAD_FL_SOURCE);
> > >  	if (source_pad < 0) {
> > >  		dev_err(rkisp1->dev, "failed to find source pad for %s\n",
> > > @@ -170,10 +170,19 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> > >  	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
> > >  }
> > >  
> > > +static void rkisp1_subdev_notifier_destroy(struct v4l2_async_subdev *asd)
> > > +{
> > > +	struct rkisp1_sensor_async *rk_asd =
> > > +		container_of(asd, struct rkisp1_sensor_async, asd);
> > > +
> > > +	fwnode_handle_put(rk_asd->source_ep);
> > > +}
> > > +
> > >  static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
> > >  	.bound = rkisp1_subdev_notifier_bound,
> > >  	.unbind = rkisp1_subdev_notifier_unbind,
> > >  	.complete = rkisp1_subdev_notifier_complete,
> > > +	.destroy = rkisp1_subdev_notifier_destroy,
> > >  };
> > >  
> > >  static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> > > @@ -190,6 +199,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> > >  			.bus_type = V4L2_MBUS_CSI2_DPHY
> > >  		};
> > >  		struct rkisp1_sensor_async *rk_asd;
> > > +		struct fwnode_handle *source = NULL;
> > >  		struct fwnode_handle *ep;
> > >  
> > >  		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> > > @@ -202,15 +212,24 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> > >  		if (ret)
> > >  			goto err_parse;
> > >  
> > > -		rk_asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
> > > -							 struct
> > > -							 rkisp1_sensor_async);
> > > +		source = fwnode_graph_get_remote_endpoint(ep);
> > > +		if (!source) {
> > > +			dev_err(rkisp1->dev,
> > > +				"endpoint %pfw has no remote endpoint\n",
> > > +				ep);
> > > +			ret = -ENODEV;
> > > +			goto err_parse;
> > 
> > source is error here so you don't need to fwnode_handle_put() it later I
> > think.
> 
> That's right, but I still need the fwnode_handle_put(ep) and
> v4l2_async_nf_cleanup(ntf). As fwnode_handle_put(NULL) is a no-op, I
> didn't add a NULL check before calling it.

Ah, I see. Understandable.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> 
> > > +		}
> > > +
> > > +		rk_asd = v4l2_async_nf_add_fwnode(ntf, source,
> > > +						  struct rkisp1_sensor_async);
> > >  		if (IS_ERR(rk_asd)) {
> > >  			ret = PTR_ERR(rk_asd);
> > >  			goto err_parse;
> > >  		}
> > >  
> > >  		rk_asd->index = index++;
> > > +		rk_asd->source_ep = source;
> > >  		rk_asd->mbus_type = vep.bus_type;
> > >  		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> > >  		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> > > @@ -225,6 +244,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> > >  		continue;
> > >  err_parse:
> > >  		fwnode_handle_put(ep);
> > > +		fwnode_handle_put(source);
> > >  		v4l2_async_nf_cleanup(ntf);
> > >  		return ret;
> > >  	}
