Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2D456D2E7
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 04:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiGKCMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 22:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiGKCMa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 22:12:30 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BE81838C
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 19:12:28 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 857A43200437;
        Sun, 10 Jul 2022 22:12:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 10 Jul 2022 22:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657505547; x=1657591947; bh=hWC7cnV3u0
        /WqBn4JaJa+zLs79UTwQ6f06De1X6rols=; b=IrFs2qPi6nHqRxEHxwO4BFVWqz
        YYQ3HgAqNtMQ5RFt3+SYVJ2ZI+eDxR/+cox93+DqPbLhFtStY+LMPXNwPRezj7g2
        A4xEiH+KhEb6DKu3qRgWxyFLsAWfwHHydaf0lLZ6OsktovATyz0eF8i+llC+qN7c
        VdcUf3Cm/vi17OeM8xhmAMcBDL+Zi6zsvS2cd0ttsF4vRa2f0ElT0ztqKfLs1usK
        d6hlkuA6QfJggC7PL2IWVbPum4OoW1SWptbO6s6FuYayGrAy+w8djCIlNGGkQFcf
        IBNO9GtnIwh50fqbEMY+EMTBeJRZMmCVHjDpNbKLr7/HYr8vlCF5zwdc1UrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657505547; x=1657591947; bh=hWC7cnV3u0/WqBn4JaJa+zLs79UT
        wQ6f06De1X6rols=; b=CRSpocwVab4KGAJsuzMWtap45ZqGd0diguyqk//v13qj
        DcwMQvzsxFM8lLwYJmvMzO/7E0l3jiRQD87cqSiMyrq7pdfwm+jje43Bm42i73hV
        YHPqHXLuMBMZu6Zn0cNkXn/OKCVcrFy+p7u+oGsLr5UkKoVzl35qqImqcUCgSqPr
        aLtArdqBfkNuaHzytpCdHKUPt8ivU/st8Ki9zIFaF9E+ILkVx/VELtwMecvLtVa4
        gDB+kYzcoqOOzCMXDkjqt1B2GAh7I8n6mmLSeTH9pLpZWiOphXqITexSkhpCEdtm
        yM0VPGep133I2Dgn6bqt6o0MSE9EPVp/jb94CewiWA==
X-ME-Sender: <xms:CofLYhyuxr5Mfj9Gjn6KXAesOjAxcjKY2zatfZQ4Zfam3WZJzK8SRg>
    <xme:CofLYhRmy8ywsBWSTMZpnGGnSzAr4-TWroe6hRj1tOb34Dwbkpu6MMxrXUI45-U_G
    YE8en9KDWQyQWnxBTg>
X-ME-Received: <xmr:CofLYrXGIFp0JMdjho1TB8jdtx_tA5iZThuaz0bFXI5Wy3pCNsSvxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeevtdffuedtvedugfehvdfhheevkefhheejvdffveffffdtgfdt
    feetffdvheejhfenucffohhmrghinhepsggrshgvrdhiugdpihhnfhhrrgguvggrugdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    rghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:CofLYjilOjxXbabXaNPDk--Xzj5hp_52xWZfxxfpkIY8SD-JC6eCPA>
    <xmx:CofLYjBtTHGxhfDqewdefmpKoLab7OEfONxr7_Mqt1ubGRFHlPWnGQ>
    <xmx:CofLYsI5yrAvjyUlLRef54ZLspIujiEdighkh3iQypYzqGmXVvfWmQ>
    <xmx:C4fLYu-HU8kuIkldoKBkbNAWh8HrZNN0WepGM7uUbOGSCB_nsXzKLA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 22:12:24 -0400 (EDT)
Date:   Mon, 11 Jul 2022 05:12:21 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 43/55] media: rkisp1: Support the ISP parallel input
Message-ID: <20220711021221.pm5kmszgd2t5vhod@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-44-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-44-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:07, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>The ISP has a parallel input, exposed through port 1 in the device tree
>node. While the driver supports configuring the ISP for the parallel and
>BT.656 input modes, the DT parsing code, the subdev bound handler and
>the ISP stream start handler only support the CSI input. Extend them to
>support the parallel input.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 68 ++++++++++++++++---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 18 ++++-
> 3 files changed, 77 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index 84832e1367ff..e436f1572566 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -130,6 +130,7 @@ struct rkisp1_info {
>  * @mbus_flags:		media bus (V4L2_MBUS_*) flags
>  * @sd:			a pointer to v4l2_subdev struct of the sensor
>  * @pixel_rate_ctrl:	pixel rate of the sensor, used to initialize the phy
>+ * @port:		port number (0: MIPI, 1: Parallel)
>  */
> struct rkisp1_sensor_async {
> 	struct v4l2_async_subdev asd;
>@@ -140,6 +141,7 @@ struct rkisp1_sensor_async {
> 	unsigned int mbus_flags;
> 	struct v4l2_subdev *sd;
> 	struct v4l2_ctrl *pixel_rate_ctrl;
>+	unsigned int port;
> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 0eb37ba557ce..1dcade2fd2a7 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -129,6 +129,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> 	struct rkisp1_sensor_async *s_asd =
> 		container_of(asd, struct rkisp1_sensor_async, asd);
> 	int source_pad;
>+	int ret;
>
> 	s_asd->sd = sd;
>
>@@ -140,7 +141,20 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> 		return source_pad;
> 	}
>
>-	return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, source_pad);
>+	if (s_asd->port == 0)
>+		return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, source_pad);
>+
>+	ret = media_create_pad_link(&sd->entity, source_pad,
>+				    &rkisp1->isp.sd.entity,
>+				    RKISP1_ISP_PAD_SINK_VIDEO,
>+				    !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
>+	if (ret) {
>+		dev_err(rkisp1->dev, "failed to link source pad of %s\n",
>+			sd->name);
>+		return ret;
>+	}
>+
>+	return 0;
> }
>
> static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
>@@ -178,12 +192,33 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 	ntf->ops = &rkisp1_subdev_notifier_ops;
>
> 	fwnode_graph_for_each_endpoint(fwnode, ep) {
>-		struct v4l2_fwnode_endpoint vep = {
>-			.bus_type = V4L2_MBUS_CSI2_DPHY
>-		};
>+		struct fwnode_handle *port;
>+		struct v4l2_fwnode_endpoint vep = { };
> 		struct rkisp1_sensor_async *rk_asd;
> 		struct fwnode_handle *source;
>+		u32 reg = 0;
>
>+		/* Select the bus type based on the port. */
>+		port = fwnode_get_parent(ep);
>+		fwnode_property_read_u32(port, "reg", &reg);
>+		fwnode_handle_put(port);
>+
>+		switch (reg) {
>+		case 0:
>+			vep.bus_type = V4L2_MBUS_CSI2_DPHY;
>+			break;
>+
>+		case 1:
>+			/*
>+			 * Parallel port. The bus-type property in DT is
>+			 * mandatory for port 1, it will be used to determine if
>+			 * it's PARALLEL or BT656.
>+			 */
>+			vep.bus_type = V4L2_MBUS_UNKNOWN;
>+			break;
>+		}
>+
>+		/* Parse the endpoint and validate the bus type. */
> 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> 		if (ret) {
> 			dev_err(rkisp1->dev, "failed to parse endpoint %pfw\n",
>@@ -191,6 +226,17 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 			break;
> 		}
>
>+		if (vep.base.port == 1) {
>+			if (vep.bus_type != V4L2_MBUS_PARALLEL &&
>+			    vep.bus_type != V4L2_MBUS_BT656) {
>+				dev_err(rkisp1->dev,
>+					"port 1 must be parallel or BT656\n");
>+				ret = -EINVAL;
>+				break;
>+			}
>+		}
>+
>+		/* Add the async subdev to the notifier. */
> 		source = fwnode_graph_get_remote_endpoint(ep);
> 		if (!source) {
> 			dev_err(rkisp1->dev,
>@@ -211,11 +257,17 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> 		rk_asd->index = index++;
> 		rk_asd->source_ep = source;
> 		rk_asd->mbus_type = vep.bus_type;
>-		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
>-		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
>+		rk_asd->port = vep.base.port;
>
>-		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
>-			vep.base.id, rk_asd->lanes);
>+		if (vep.bus_type == V4L2_MBUS_CSI2_DPHY) {
>+			rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
>+			rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
>+		} else {
>+			rk_asd->mbus_flags = vep.bus.parallel.flags;
>+		}
>+
>+		dev_dbg(rkisp1->dev, "registered ep id %d, bus type %u, %u lanes\n",
>+			vep.base.id, rk_asd->mbus_type, rk_asd->lanes);
> 	}
>
> 	if (ret) {
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index ea0bbccb5aee..383a3ec83ca9 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -729,6 +729,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
> 	struct media_pad *source_pad;
> 	struct media_pad *sink_pad;
>+	enum v4l2_mbus_type mbus_type;
>+	u32 mbus_flags;
> 	int ret;
>
> 	if (!enable) {
>@@ -751,12 +753,22 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		return -EPIPE;
> 	}
>
>-	if (rkisp1->source != &rkisp1->csi.sd)
>-		return -EPIPE;
>+	if (rkisp1->source == &rkisp1->csi.sd) {
>+		mbus_type = V4L2_MBUS_CSI2_DPHY;
>+		mbus_flags = 0;
>+	} else {
>+		const struct rkisp1_sensor_async *asd;
>+
>+		asd = container_of(rkisp1->source->asd,
>+				   struct rkisp1_sensor_async, asd);
>+
>+		mbus_type = asd->mbus_type;
>+		mbus_flags = asd->mbus_flags;
>+	}
>
> 	isp->frame_sequence = -1;
> 	mutex_lock(&isp->ops_lock);
>-	ret = rkisp1_config_cif(isp, V4L2_MBUS_CSI2_DPHY, 0);
>+	ret = rkisp1_config_cif(isp, mbus_type, mbus_flags);
> 	if (ret)
> 		goto mutex_unlock;
>
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
