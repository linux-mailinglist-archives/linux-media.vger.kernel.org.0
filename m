Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62D6562A9E
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 06:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbiGAEmh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 00:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiGAEmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 00:42:37 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114AF5A45F
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 21:42:36 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 7226A5C00AD;
        Fri,  1 Jul 2022 00:42:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Jul 2022 00:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656650555; x=1656736955; bh=OqVLEXyvPl
        GzQaJY6sYzjYIQuDqr30Gwq0YxHID7YM0=; b=RZhkUwti+gRPIXwyhQ/n6YxwJ8
        SXzW4RIdtQ3AsiIgIGCLkdkPy+YD1+Gbka5aV9o1iT+0QllH/nZqfImX0I3Cwpqx
        bEFdHB2V7PVkVll70UEKeZ8aaOzm07Zha/G+EEMXlCLRCloSpxLt1+ezZlwOyzBh
        RYagahge+3g1/dwQyN7btdh5BdZzNCO+FyKiyrUzj1tLy8438Yl4j837zMGYfRyf
        F1Bwo+xoz41Ca7JALeHl3h/sZRDJ0Bm9KbV+7m8HvfZ0g0amw5kZQBI5SlG/Alu4
        cm+asJjuDFdFvCQDI7beqw7hHE00GEjnnmYMMtIrQ4G4BgYNqDoDIXPIjopQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656650555; x=1656736955; bh=OqVLEXyvPlGzQaJY6sYzjYIQuDqr
        30Gwq0YxHID7YM0=; b=NbHoGhNPPKgN9xz3SWLK7HF/66UfMxt74reUGWdFxPZH
        9lAi59gpkuTE9KX3HMCIZKQ3ksNYyoKGuCHHiQnMD/lowDkXApwMS8K6+lWwkmfQ
        SRu3Rvn0d59QFKljTUn6fblkQ7s8LKVWZ59Awio8Nr8aTchsbuNGlw30xnqCyjnQ
        ZkSpx38ZKTDLBqQNoc6Tlet0vfV896pquXWcF01dohXTTtR1km0fsjpjhHhnaWG4
        SIDeTQcAsDsY6TcSMHYyLMSmCHxef0vF/mirejy5WFkOqZk18m4hz/xs9kH8Zjg4
        qmtcAagVGUDIcLFBM1baVuq2P8ZjVLcXpEHxiT6JdQ==
X-ME-Sender: <xms:O3u-YqcuXKzKst3qekpE-95wBpP9EVc3NvImnxznY7uB0sy2Tnhhvg>
    <xme:O3u-YkMDFFEeKJm2x79bujPV5wzNiHr7KFBI3v47JqaM8nll6f2eHsfDr-jW7dVyI
    GT9wCJi0dA02uY_nCw>
X-ME-Received: <xmr:O3u-Yrjtl5NDgRvEVcGy6NTaTQB0zS9MRyabxi04GWiiqub7RcjWhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:O3u-Yn_zxlFHGoicbrYCvqv1OfqrmteUQsDPa58ku_pBj_GuOHJkow>
    <xmx:O3u-YmuL0Wc4Q2ID6yGUb1q4_VjGinMn1MV4JaoWyN_4APk7N8fEzg>
    <xmx:O3u-YuEaBUm9MTW_X_MLfebNrVEaUxNxAa7zkmvkphWao8BPti9Ipw>
    <xmx:O3u-Yj_k4EoFz8PZxMXyvvzZiL92nRrrhErdXAZm7W8tPf26mc_UmQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 00:42:31 -0400 (EDT)
Date:   Fri, 1 Jul 2022 07:42:28 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 27/55] media: rkisp1: isp: Rename
 rkisp1_device.active_sensor to source
Message-ID: <20220701044228.qpv2zi5t2hwgokpz@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-28-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-28-paul.elder@ideasonboard.com>
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

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>
>The active_sensor field of the rkisp1_device structure points to the ASD
>data for the active source. The source may however not be a sensor, so
>the naming is a bit confusing. Furthermore, the driver doesn't need to
>access the full ASD from the active_sensor field, only the subdev
>pointer is needed, when stopping streaming.
>
>Rename the field to source, and turn it into a v4l2_subdev pointer.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  4 +--
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++----------
> 2 files changed, 14 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index dbf1baca623a..7a6f55a31bb0 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -419,7 +419,7 @@ struct rkisp1_debug {
>  * @v4l2_dev:	   v4l2_device variable
>  * @media_dev:	   media_device variable
>  * @notifier:	   a notifier to register on the v4l2-async API to be notified on the sensor
>- * @active_sensor: sensor in-use, set when streaming on
>+ * @source:        source subdev in-use, set when starting streaming
>  * @csi:	   internal CSI-2 receiver
>  * @isp:	   ISP sub-device
>  * @resizer_devs:  resizer sub-devices
>@@ -439,7 +439,7 @@ struct rkisp1_device {
> 	struct v4l2_device v4l2_dev;
> 	struct media_device media_dev;
> 	struct v4l2_async_notifier notifier;
>-	struct rkisp1_sensor_async *active_sensor;
>+	struct v4l2_subdev *source;
> 	struct rkisp1_csi csi;
> 	struct rkisp1_isp isp;
> 	struct rkisp1_resizer resizer_devs[2];
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index f6d1c93dd99d..4f12fc0b7694 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -58,7 +58,7 @@
>  * Helpers
>  */
>
>-static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
>+static struct v4l2_subdev *rkisp1_get_remote_source(struct v4l2_subdev *sd)
> {
> 	struct media_pad *local, *remote;
> 	struct media_entity *sensor_me;
>@@ -749,12 +749,11 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 	struct rkisp1_device *rkisp1 =
> 		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
> 	struct rkisp1_isp *isp = &rkisp1->isp;
>-	struct v4l2_subdev *sensor_sd;
>+	struct rkisp1_sensor_async *asd;
> 	int ret;
>
> 	if (!enable) {
>-		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
>-				 false);
>+		v4l2_subdev_call(rkisp1->source, video, s_stream, false);
>
> 		rkisp1_csi_stop(&rkisp1->csi);
> 		rkisp1_isp_stop(rkisp1);
>@@ -762,35 +761,33 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		return 0;
> 	}
>
>-	sensor_sd = rkisp1_get_remote_sensor(sd);
>-	if (!sensor_sd) {
>-		dev_warn(rkisp1->dev, "No link between isp and sensor\n");
>+	rkisp1->source = rkisp1_get_remote_source(sd);
>+	if (!rkisp1->source) {
>+		dev_warn(rkisp1->dev, "No link between isp and source\n");
> 		return -ENODEV;
> 	}
>
>-	rkisp1->active_sensor = container_of(sensor_sd->asd,
>-					     struct rkisp1_sensor_async, asd);
>+	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
>+			   asd);
>
>-	if (rkisp1->active_sensor->mbus_type != V4L2_MBUS_CSI2_DPHY)
>+	if (asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
> 		return -EINVAL;
>
> 	rkisp1->isp.frame_sequence = -1;
> 	mutex_lock(&isp->ops_lock);
>-	ret = rkisp1_config_cif(rkisp1, rkisp1->active_sensor->mbus_type,
>-				rkisp1->active_sensor->mbus_flags);
>+	ret = rkisp1_config_cif(rkisp1, asd->mbus_type, asd->mbus_flags);
> 	if (ret)
> 		goto mutex_unlock;
>
> 	rkisp1_isp_start(rkisp1);
>
>-	ret = rkisp1_csi_start(&rkisp1->csi, rkisp1->active_sensor);
>+	ret = rkisp1_csi_start(&rkisp1->csi, asd);
> 	if (ret) {
> 		rkisp1_isp_stop(rkisp1);
> 		goto mutex_unlock;
> 	}
>
>-	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
>-			       true);
>+	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
> 	if (ret) {
> 		rkisp1_isp_stop(rkisp1);
> 		rkisp1_csi_stop(&rkisp1->csi);
>-- 
>2.30.2
>
