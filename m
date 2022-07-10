Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87AB856D126
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 21:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGJTty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 15:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGJTtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 15:49:53 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757C42BE9
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 12:49:52 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D7F6F5C0061;
        Sun, 10 Jul 2022 15:49:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 10 Jul 2022 15:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657482591; x=1657568991; bh=V6JgLWdccE
        IMz+qv1sEblb9V6yseT1o4V/fe7MLIkq8=; b=G/K9Cw3DfpEp4F58KWEYMW6O6S
        PRjzZ4BlzsG0poDf+S2dPB0tBobYKR6KOr1cQlx/uPHIR0MG1SAbu4Cb1ER8XAku
        uu1F/myIoSThPUxJriJG8B0BGwyJvC5otCSTJnVYcC7ZjjF8dk9tmpY8nOtqarjl
        KTQSOp/WM0IZ7AM3qIMiLlnmgRNT9x8UCgTxKoerSMwmkucCeI5aKCA0bAbBkoCR
        nCNkcO1IKERZHyt71mUR7l1jPUSL/kqX4jn3AgtmhKB5JXkmX+a0EColKWYJmrLT
        IWP421BgNMwHakeW/0fhZeSJoU9PCW5BJhKiZlHfEEsxHOK8ZfCcCuGwTGlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657482591; x=1657568991; bh=V6JgLWdccEIMz+qv1sEblb9V6yse
        T1o4V/fe7MLIkq8=; b=mjxGXwK8i6EUa18MeIuvAd+2yLvI6dv73Y/mxJmb6Qm+
        L5kN3ymZ+WJ4IRYlsQQx99oOlfLlvYvvchxHMQl5eKLcgouKeRTB+ZPyclvDYGno
        v0KpXFj/hiu7dqmkYlXxTTRPgNBtY/bQyGWtZ0lAEWm8OJBwXVGoKdMWyNrsPOaH
        ZPl93fj96EKNWYlNfpnqsCgeRHn1dAuUy/gZIpe1vC+SWYgyj0dp+XAY9oXdkMkU
        S+RoqDuNPvzcAH7VkaKecUmFcs+X5A2RxPI+/DwPnO+h+1x3JtvMKiWk7+gGTZzO
        /NfX92dshxv+xl9/sh7Du5B4269ajI9y5pCfcG2Lgg==
X-ME-Sender: <xms:Xy3LYmsvXnZ-2PAF1ni0r3HbGzfxLCqV1YBtZgROk8GhG3yP0aDinA>
    <xme:Xy3LYrduTs3NTrLnu7vWFd6WYI-KBdSY43oIN0EYWwrwBfbxt7orV6zKakPKAi2VT
    g7HsKmC9PDqZ6VYens>
X-ME-Received: <xmr:Xy3LYhzm8Zv8irxSZ7nC82aFXWDzwaEZkuHtScd9wy25aldsT3ttRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejuddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepheeivdejhedvffelkeffvdejvdeiheehtdethfdvtdeufeeu
    keelhfetuddugfejnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Xy3LYhOOb2n2WBSScMhH8SqtZ24J_Bzg4AfL3W6ROqPZLQXO7TJePA>
    <xmx:Xy3LYm9U7M3CN_5RFyQkxl60iJsGTbSy6h7jwFz-XaXxLuxTX0a7xg>
    <xmx:Xy3LYpVJtpqvD9eQxsoQGqQTRPCe0iMmGJZMwD6i-GSrTrLWxVpBCg>
    <xmx:Xy3LYqY6ZrKCtrQPIXjVPeh3E2bCwoz3z_lzIwYKEjSM3X8a7okobg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 15:49:49 -0400 (EDT)
Date:   Sun, 10 Jul 2022 22:49:46 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     paul.elder@ideasonboard.com
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 18/55] media: rkisp1: Fix sensor source pad retrieval
 at bound time
Message-ID: <20220710194946.5v2q5qmp2loje4vc@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-19-laurent.pinchart@ideasonboard.com>
 <20220707140123.GM3886060@pyrite.rasen.tech>
 <YsbyFwtuhBChV+gn@pendragon.ideasonboard.com>
 <20220707145052.GP3886060@pyrite.rasen.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220707145052.GP3886060@pyrite.rasen.tech>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07.07.2022 23:50, paul.elder@ideasonboard.com wrote:
>Hi Laurent,
>
>On Thu, Jul 07, 2022 at 05:47:51PM +0300, Laurent Pinchart wrote:
>> Hi Paul,
>>
>> On Thu, Jul 07, 2022 at 11:01:23PM +0900, paul.elder@ideasonboard.com wrote:
>> > On Fri, Jul 01, 2022 at 02:06:36AM +0300, Laurent Pinchart wrote:
>> > > When a sensor is bound, its source pad is retrieved in the .bound()
>> > > operation with a call to media_entity_get_fwnode_pad(). The function
>> > > should be called with the source endpoint fwnode of the sensor, but is
>> > > instead called with the sensor's device fwnode.
>> > >
>> > > Fix this, which involves storing a reference to the source endpoint
>> > > fwnode in the rkisp1_sensor_async structure, and thus implementing the
>> > > subdev notifier .destroy() operation to release the reference.
>> > >
>> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > > ---
>> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
>> > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 28 ++++++++++++++++---
>> > >  2 files changed, 26 insertions(+), 4 deletions(-)
>> > >
>> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> > > index b0896b508db3..f08b3dec1465 100644
>> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> > > @@ -117,6 +117,7 @@ struct rkisp1_info {
>> > >   *
>> > >   * @asd:		async_subdev variable for the sensor
>> > >   * @index:		index of the sensor (counting sensor found in DT)
>> > > + * @source_ep:		fwnode for the sensor source endpoint
>> > >   * @lanes:		number of lanes
>> > >   * @mbus_type:		type of bus (currently only CSI2 is supported)
>> > >   * @mbus_flags:		media bus (V4L2_MBUS_*) flags
>> > > @@ -127,6 +128,7 @@ struct rkisp1_info {
>> > >  struct rkisp1_sensor_async {
>> > >  	struct v4l2_async_subdev asd;
>> > >  	unsigned int index;
>> > > +	struct fwnode_handle *source_ep;
>> > >  	unsigned int lanes;
>> > >  	enum v4l2_mbus_type mbus_type;
>> > >  	unsigned int mbus_flags;
>> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> > > index 2e68f35e8ea5..813c013139ea 100644
>> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> > > @@ -138,7 +138,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>> > >  	phy_init(s_asd->dphy);
>> > >
>> > >  	/* Create the link to the sensor. */
>> > > -	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>> > > +	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
>> > >  						 MEDIA_PAD_FL_SOURCE);
>> > >  	if (source_pad < 0) {
>> > >  		dev_err(rkisp1->dev, "failed to find source pad for %s\n",
>> > > @@ -170,10 +170,19 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
>> > >  	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
>> > >  }
>> > >
>> > > +static void rkisp1_subdev_notifier_destroy(struct v4l2_async_subdev *asd)
>> > > +{
>> > > +	struct rkisp1_sensor_async *rk_asd =
>> > > +		container_of(asd, struct rkisp1_sensor_async, asd);
>> > > +
>> > > +	fwnode_handle_put(rk_asd->source_ep);
>> > > +}
>> > > +
>> > >  static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
>> > >  	.bound = rkisp1_subdev_notifier_bound,
>> > >  	.unbind = rkisp1_subdev_notifier_unbind,
>> > >  	.complete = rkisp1_subdev_notifier_complete,
>> > > +	.destroy = rkisp1_subdev_notifier_destroy,
>> > >  };
>> > >
>> > >  static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>> > > @@ -190,6 +199,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>> > >  			.bus_type = V4L2_MBUS_CSI2_DPHY
>> > >  		};
>> > >  		struct rkisp1_sensor_async *rk_asd;
>> > > +		struct fwnode_handle *source = NULL;
>> > >  		struct fwnode_handle *ep;
>> > >
>> > >  		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
>> > > @@ -202,15 +212,24 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>> > >  		if (ret)
>> > >  			goto err_parse;
>> > >
>> > > -		rk_asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
>> > > -							 struct
>> > > -							 rkisp1_sensor_async);
>> > > +		source = fwnode_graph_get_remote_endpoint(ep);
>> > > +		if (!source) {
>> > > +			dev_err(rkisp1->dev,
>> > > +				"endpoint %pfw has no remote endpoint\n",
>> > > +				ep);
>> > > +			ret = -ENODEV;
>> > > +			goto err_parse;
>> >
>> > source is error here so you don't need to fwnode_handle_put() it later I
>> > think.
>>
>> That's right, but I still need the fwnode_handle_put(ep) and
>> v4l2_async_nf_cleanup(ntf). As fwnode_handle_put(NULL) is a no-op, I
>> didn't add a NULL check before calling it.
>
>Ah, I see. Understandable.
>
>Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>
>>
>> > > +		}
>> > > +
>> > > +		rk_asd = v4l2_async_nf_add_fwnode(ntf, source,
>> > > +						  struct rkisp1_sensor_async);
>> > >  		if (IS_ERR(rk_asd)) {
>> > >  			ret = PTR_ERR(rk_asd);
>> > >  			goto err_parse;
>> > >  		}
>> > >
>> > >  		rk_asd->index = index++;
>> > > +		rk_asd->source_ep = source;
>> > >  		rk_asd->mbus_type = vep.bus_type;
>> > >  		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
>> > >  		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
>> > > @@ -225,6 +244,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>> > >  		continue;
>> > >  err_parse:
>> > >  		fwnode_handle_put(ep);
>> > > +		fwnode_handle_put(source);
>> > >  		v4l2_async_nf_cleanup(ntf);
>> > >  		return ret;
>> > >  	}
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
