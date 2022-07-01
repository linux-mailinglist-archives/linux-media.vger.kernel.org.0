Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C48C562A91
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 06:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiGAEgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 00:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiGAEgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 00:36:52 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62495675A0
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 21:36:51 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 22E895C00C9;
        Fri,  1 Jul 2022 00:36:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 01 Jul 2022 00:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656650208; x=1656736608; bh=WnBgrnf9TK
        KXhLuH5ml1t97t1F6KrIgS/NWBIjpmGrw=; b=mt7BQ7p/Yn45SJJvb2SxEq0MW6
        Dy2wutm1MepAOzQnk1OqeLzf33+CRooci02YDGtPJMBF7TaX/FuU/w15t7pUhDrC
        7734wpPFCxzzi+t5+8yC9mjqhbreN9iXei1ZEeOAd7c3cy4KTX6H04nvm6PnxsfO
        s3tiB8pbIuOZ2+g0QQi8RhSA1HSdS0z/dPfgHxj85bCyiNc5Az1aQ7fgZ2qDJzJo
        EIr35Ths2E5/9ZJNdti1NXy6R7/Gl07ezPDTUIMEjBdqVByfxFpJl6Td607uGdqb
        gYWOfjgYLLOBID4pJKAFbR6ZbuiTwibW099ajGlobm/na9FWeDWXbls389Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656650208; x=1656736608; bh=WnBgrnf9TKKXhLuH5ml1t97t1F6K
        rIgS/NWBIjpmGrw=; b=Ko7YQZ1DfxK4jL8PT1C65YBzXbAg4D1wlbdoZkMM8lfK
        G5TnyNQ5thfE4kKDMsXQ4450g4ex2eOknpl0vdSdPWYh5OdBMGanPNuEpxYUHi+q
        HXmpZOCm/LQiNUIHNAVXYHJkp9ELhDuW88n5TKMk4K+rwobz0wfsFZMlTD5MoypS
        rq16XoNwUfB8MaRbPw/h7Ra3xJoDejHUgDrQqkRBqOk1xSQSU2BlXwfaJJdRnX3j
        DqWgFETx5v/yLcSgPq12BcwAGZ+E3eBFGn3qjHPiHoTn4Kn+WYc/bmpY86DbfkbU
        pxAJ0aaGc/G51vtATOS3J8/aF9pRdwW8cvz9czVWww==
X-ME-Sender: <xms:33m-YrCdztfziJVydebwDz6dJNN5lMn8MQ05PwEHmFJL86p8kYs9iA>
    <xme:33m-Yhhg28peYplEvlgscz-OkKeu_TjjzHzZT0IcGutXvWvCi4k7nGV1vHhV8Wlun
    a_bl7knIl7mSTbYjxY>
X-ME-Received: <xmr:33m-YmnSPdW7aQeG7Q5WiW3LyV-zx1JPPPl5aygOhCX3Z7-lq3TXFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:33m-YtxYDKITD5yYQ_7z-MUtHmAjrmlAnveaMIVov_WsfuXPnFQS5g>
    <xmx:33m-YgRCKwaoohh27ifsch6edDKFN7wQN1ZckdAchmYJRV64a77jLw>
    <xmx:33m-YgZQUVLDfs546-i072SausQ7axykd2chTwa8_kTrTIL5sOcD5g>
    <xmx:4Hm-YlQgvbVnaCutoT2gH5KX6TW98B6jirkw1mnwbJJdDiji2rmxvg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 00:36:44 -0400 (EDT)
Date:   Fri, 1 Jul 2022 07:36:41 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 17/55] media: rkisp1: Fix sensor source pad retrieval at
 bound time
Message-ID: <20220701043641.bo3sgetazko3fwoi@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-18-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-18-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:10, Paul Elder wrote:
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>When a sensor is bound, its source pad is retrieved in the .bound()
>operation with a call to media_entity_get_fwnode_pad(). The function
>should be called with the source endpoint fwnode of the sensor, but is
>instead called with the sensor's device fwnode.
>
>Fix this, which involves storing a reference to the source endpoint
>fwnode in the rkisp1_sensor_async structure, and thus implementing the
>subdev notifier .destroy() operation to release the reference.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 28 ++++++++++++++++---
> 2 files changed, 26 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index ba11baf75fa9..60c5462e1746 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -117,6 +117,7 @@ struct rkisp1_info {
>  *
>  * @asd:		async_subdev variable for the sensor
>  * @index:		index of the sensor (counting sensor found in DT)
>+ * @source_ep:		fwnode for the sensor source endpoint
>  * @lanes:		number of lanes
>  * @mbus_type:		type of bus (currently only CSI2 is supported)
>  * @mbus_flags:		media bus (V4L2_MBUS_*) flags
>@@ -127,6 +128,7 @@ struct rkisp1_info {
> struct rkisp1_sensor_async {
> 	struct v4l2_async_subdev asd;
> 	unsigned int index;
>+	struct fwnode_handle *source_ep;
> 	unsigned int lanes;
> 	enum v4l2_mbus_type mbus_type;
> 	unsigned int mbus_flags;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 386c1c17aec2..0f3e45cdbf2a 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -138,7 +138,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> 	phy_init(s_asd->dphy);
>
> 	/* Create the link to the sensor. */
>-	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>+	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
> 						 MEDIA_PAD_FL_SOURCE);
> 	if (source_pad < 0) {
> 		dev_err(rkisp1->dev, "failed to find source pad for %s\n",
>@@ -170,10 +170,19 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> 	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
> }
>
>+static void rkisp1_subdev_notifier_destroy(struct v4l2_async_subdev *asd)
>+{
>+	struct rkisp1_sensor_async *rk_asd =
>+		container_of(asd, struct rkisp1_sensor_async, asd);
>+
>+	fwnode_handle_put(rk_asd->source_ep);
>+}
>+
> static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
> 	.bound = rkisp1_subdev_notifier_bound,
> 	.unbind = rkisp1_subdev_notifier_unbind,
> 	.complete = rkisp1_subdev_notifier_complete,
>+	.destroy = rkisp1_subdev_notifier_destroy,
> };
>
> static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>@@ -190,6 +199,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 			.bus_type = V4L2_MBUS_CSI2_DPHY
> 		};
> 		struct rkisp1_sensor_async *rk_asd;
>+		struct fwnode_handle *source = NULL;
> 		struct fwnode_handle *ep;
>
> 		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
>@@ -202,15 +212,24 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 		if (ret)
> 			goto err_parse;
>
>-		rk_asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
>-							 struct
>-							 rkisp1_sensor_async);
>+		source = fwnode_graph_get_remote_endpoint(ep);
>+		if (!source) {
>+			dev_err(rkisp1->dev,
>+				"endpoint %pfw has no remote endpoint\n",
>+				ep);
>+			ret = -ENODEV;
>+			goto err_parse;
>+		}
>+
>+		rk_asd = v4l2_async_nf_add_fwnode(ntf, source,
>+						  struct rkisp1_sensor_async);
> 		if (IS_ERR(rk_asd)) {
> 			ret = PTR_ERR(rk_asd);
> 			goto err_parse;
> 		}
>
> 		rk_asd->index = index++;
>+		rk_asd->source_ep = source;

here do 'source = NULL', see reason below

> 		rk_asd->mbus_type = vep.bus_type;
> 		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> 		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
>@@ -225,6 +244,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 		continue;
> err_parse:
> 		fwnode_handle_put(ep);
>+		fwnode_handle_put(source);

if v4l2_fwnode_endpoint_parse fails then here you put the source of previous iteration

thanks,
Dafna

> 		v4l2_async_nf_cleanup(ntf);
> 		return ret;
> 	}
>-- 
>2.30.2
>
