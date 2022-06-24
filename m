Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1903E55A10D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 20:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiFXSkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 14:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiFXSkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 14:40:18 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C9A62722
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 11:40:16 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 678B95C018F;
        Fri, 24 Jun 2022 14:40:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 24 Jun 2022 14:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656096016; x=1656182416; bh=pjFPXj84m6
        KFDSgAdcMGclNdb/HUpI1/4W6Laso8Hzk=; b=gkngKiNZQ3c3KQm146Pm9k4M4O
        d3P5EXwy/AXu9y2pvH+YyA2KXrgcacft6haXd3PcikmBGTNXFGKCKspHARXHP0OJ
        GkP7NiDojAw1pVNT8O5Cdy71QilgFL93bIT2hU1HGE8U6/YfW7fiJ+X4r24cqyON
        9DTGOsHnaIYNwVRDNAb3RBAnav5PbDrwvudmv2ZN/hJtl3GpZKzWOuQ0S8IaLC8g
        WM0doDFsk/dMxXp3WHuRcT6IskHrB+zBky75zoQNJ/j1IM/vMODaawIjH0BF3xrU
        1YgyJaadprocN0C6+7yZVDIcx0L2pyj10Hv1LwGOOTIA9oP0VP7/SKf0yhsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656096016; x=1656182416; bh=pjFPXj84m6KFDSgAdcMGclNdb/HU
        pI1/4W6Laso8Hzk=; b=O4aKZFObEh0si7qSU4CJHbsuXB1++CCZgz53J1t7zAPf
        z28wAFCueWkK/1FcW40nrt3Ho4OcYR/9yqmrl+kK0pHJl9CKKiA9GZtq7Ccakp+q
        /2tTWgQyHcfEpkKzgP9AUrJVq2zsH4d5n5mcUmsOqOXXZDHNRDJYeBggaHu+eyd1
        igifYXh0h4l4YlGIk7E3GEZnKuzIkwGby91eRleHhteXJRc/6RdxGrOouN7IJ8vP
        cbGBuzg7Mx33eXrfW2EpukAwlZR6jOhCvkqRkT2mL8MXbuVvg2t7wDDa2dU5YN1Q
        T/qnUaxMti49/NvU38UFKWMRKdhLXJM5UUZGKzHZ0g==
X-ME-Sender: <xms:DwW2YrfUMKzc_8cQ7oD4Q09ZfUEpcqj2lxzwNJazUDQ7rkhQFXRCaQ>
    <xme:DwW2YhMYkUJ6nNQSfOWIFxFXsbSko9VdY-m1DGLtpridAd800v0uhAUHbkEQO1Yrr
    bBd3bprUxjRYP1a3aI>
X-ME-Received: <xmr:DwW2YkiqTFbKZ-CU13zhvxCsUNKV-YFWk3bsFaREPwC60HR670e7ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:DwW2Ys-c5E4wDsti1aaK7e4wm3T0eGVm94XkLQr0uFgxIQY_97zNdQ>
    <xmx:DwW2YnuCUEkWkq7XYyFQmR7CnNjJ9ckNqtHYxaTb74LU0lzHXNsugg>
    <xmx:DwW2YrGszADsg7xt-_hy-QryaGynaZtNqe2EI-vufjUgN5vMUfCn4g>
    <xmx:EAW2Yg_NDAQBSBEk3vbCY3L-J_NVqfgkgbmEqMKdSMTEwpyzhIro6A>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 14:40:12 -0400 (EDT)
Date:   Fri, 24 Jun 2022 21:40:09 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 13/55] media: rkisp1: Create link from sensor to ISP at
 notifier bound time
Message-ID: <20220624184009.4kvszup73lha3fln@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-14-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-14-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:10, Paul Elder wrote:
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>Links from sensors to the ISP can be created as sensors are bound. Move
>the link creation from rkisp1_create_links() to the bound notifier, and
>clean up the rkisp1_create_links() function while at it.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 87 ++++++++-----------
> 2 files changed, 40 insertions(+), 49 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index c7d5c57607bd..ba11baf75fa9 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -116,6 +116,7 @@ struct rkisp1_info {
>  *				of the v4l2-async API
>  *
>  * @asd:		async_subdev variable for the sensor
>+ * @index:		index of the sensor (counting sensor found in DT)
>  * @lanes:		number of lanes
>  * @mbus_type:		type of bus (currently only CSI2 is supported)
>  * @mbus_flags:		media bus (V4L2_MBUS_*) flags
>@@ -125,6 +126,7 @@ struct rkisp1_info {
>  */
> struct rkisp1_sensor_async {
> 	struct v4l2_async_subdev asd;
>+	unsigned int index;
> 	unsigned int lanes;
> 	enum v4l2_mbus_type mbus_type;
> 	unsigned int mbus_flags;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 7fc617d51f44..4501aea265cb 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -111,72 +111,46 @@ struct rkisp1_isr_data {
>
> static int rkisp1_create_links(struct rkisp1_device *rkisp1)
> {
>-	struct media_entity *source, *sink;
>-	unsigned int flags, source_pad;
>-	struct v4l2_subdev *sd;
> 	unsigned int i;
> 	int ret;
>
>-	/* sensor links */
>-	flags = MEDIA_LNK_FL_ENABLED;
>-	list_for_each_entry(sd, &rkisp1->v4l2_dev.subdevs, list) {
>-		if (sd == &rkisp1->isp.sd ||
>-		    sd == &rkisp1->resizer_devs[RKISP1_MAINPATH].sd ||
>-		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
>-			continue;
>-
>-		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>-						  MEDIA_PAD_FL_SOURCE);
>-		if (ret < 0) {
>-			dev_err(rkisp1->dev, "failed to find src pad for %s\n",
>-				sd->name);
>-			return ret;
>-		}
>-		source_pad = ret;
>-
>-		ret = media_create_pad_link(&sd->entity, source_pad,
>-					    &rkisp1->isp.sd.entity,
>-					    RKISP1_ISP_PAD_SINK_VIDEO,
>-					    flags);
>-		if (ret)
>-			return ret;
>-
>-		flags = 0;
>-	}
>-
>-	flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
>-
> 	/* create ISP->RSZ->CAP links */
> 	for (i = 0; i < 2; i++) {
>-		source = &rkisp1->isp.sd.entity;
>-		sink = &rkisp1->resizer_devs[i].sd.entity;
>-		ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_VIDEO,
>-					    sink, RKISP1_RSZ_PAD_SINK,
>+		struct media_entity *resizer =
>+			&rkisp1->resizer_devs[i].sd.entity;
>+		struct media_entity *capture =
>+			&rkisp1->capture_devs[i].vnode.vdev.entity;;
>+
>+		ret = media_create_pad_link(&rkisp1->isp.sd.entity,
>+					    RKISP1_ISP_PAD_SOURCE_VIDEO,
>+					    resizer, RKISP1_RSZ_PAD_SINK,
> 					    MEDIA_LNK_FL_ENABLED);
> 		if (ret)
> 			return ret;
>
>-		source = sink;
>-		sink = &rkisp1->capture_devs[i].vnode.vdev.entity;
>-		ret = media_create_pad_link(source, RKISP1_RSZ_PAD_SRC,
>-					    sink, 0, flags);
>+		ret = media_create_pad_link(resizer, RKISP1_RSZ_PAD_SRC,
>+					    capture, 0,
>+					    MEDIA_LNK_FL_ENABLED |
>+					    MEDIA_LNK_FL_IMMUTABLE);
> 		if (ret)
> 			return ret;
> 	}
>
> 	/* params links */
>-	source = &rkisp1->params.vnode.vdev.entity;
>-	sink = &rkisp1->isp.sd.entity;
>-	ret = media_create_pad_link(source, 0, sink,
>-				    RKISP1_ISP_PAD_SINK_PARAMS, flags);
>+	ret = media_create_pad_link(&rkisp1->params.vnode.vdev.entity, 0,
>+				    &rkisp1->isp.sd.entity,
>+				    RKISP1_ISP_PAD_SINK_PARAMS,
>+				    MEDIA_LNK_FL_ENABLED |
>+				    MEDIA_LNK_FL_IMMUTABLE);
> 	if (ret)
> 		return ret;
>
> 	/* 3A stats links */
>-	source = &rkisp1->isp.sd.entity;
>-	sink = &rkisp1->stats.vnode.vdev.entity;
>-	return media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_STATS,
>-				     sink, 0, flags);
>+	return media_create_pad_link(&rkisp1->isp.sd.entity,
>+				     RKISP1_ISP_PAD_SOURCE_STATS,
>+				     &rkisp1->stats.vnode.vdev.entity, 0,
>+				     MEDIA_LNK_FL_ENABLED |
>+				     MEDIA_LNK_FL_IMMUTABLE);
> }
>
> static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>@@ -187,6 +161,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> 		container_of(notifier, struct rkisp1_device, notifier);
> 	struct rkisp1_sensor_async *s_asd =
> 		container_of(asd, struct rkisp1_sensor_async, asd);
>+	int source_pad;
>
> 	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
> 						V4L2_CID_PIXEL_RATE);
>@@ -206,7 +181,19 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>
> 	phy_init(s_asd->dphy);
>
>-	return 0;
>+	/* Create the link to the sensor. */
>+	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>+						 MEDIA_PAD_FL_SOURCE);
>+	if (source_pad < 0) {
>+		dev_err(rkisp1->dev, "failed to find source pad for %s\n",
>+			sd->name);
>+		return source_pad;
>+	}
>+
>+	return media_create_pad_link(&sd->entity, source_pad,
>+				     &rkisp1->isp.sd.entity,
>+				     RKISP1_ISP_PAD_SINK_VIDEO,
>+				     !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
> }
>
> static void rkisp1_subdev_notifier_unbind(struct v4l2_async_notifier *notifier,
>@@ -248,6 +235,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> {
> 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
> 	unsigned int next_id = 0;
>+	unsigned int index = 0;
> 	int ret;
>
> 	v4l2_async_nf_init(ntf);
>@@ -277,6 +265,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> 			goto err_parse;
> 		}
>
>+		rk_asd->index = index++;
> 		rk_asd->mbus_type = vep.bus_type;
> 		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> 		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
>-- 
>2.30.2
>
