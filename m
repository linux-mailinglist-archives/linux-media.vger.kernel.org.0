Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE5C5625C1
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 23:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbiF3V5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 17:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237617AbiF3V5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 17:57:24 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595ED564FB
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 14:57:23 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0D0423200A1D;
        Thu, 30 Jun 2022 17:57:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 30 Jun 2022 17:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656626241; x=1656712641; bh=gYS3J5Ca4h
        8qz/MDexEyw7DF4q+FKi51Y6TnlVjbSf8=; b=EgH5lLyOfUZF1ZVFmf6copmhyo
        afVkhqq/9TBNkdhr/nwW/jXOxEDQ9CZEBtMnNfYrHXk/1jXliBb349Ty+Lw3Z4nD
        ZH102bveQUBnzy/e9+h447ZB4i3/4uiFoWiKk00mZNeDxiz69Ej8Jbdya5pYw60L
        J2HMQ03XjmZmkaaBvUddGq7nUJI8lIq9Hm9GLY9HLcIjFlAA1k280Y2YZfJ67Gk4
        Xpulb8DYODFeL7qBJ/gb/P1UEgzzWGp03aLAW8ecMG0JIXFZI2hcWtFlW9jtmjP8
        U4R98mABAt0IyUotYV+wltUHehbRcxhhJfqwn6r+udWinDakRKZubKxOI7aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656626241; x=1656712641; bh=gYS3J5Ca4h8qz/MDexEyw7DF4q+F
        Ki51Y6TnlVjbSf8=; b=BfeC/JdgCM0lP4Uh4Jj8+hVylbWmMsgo5LuMr970NWu8
        P54nzE32fMbnKPIceNZ3hXvDa4SqBqc5kn8fUomB0dD3GKxuf2IIOk9hTZzL3iWd
        VLaRqnPjk22GX+FigWqLXO4rMqrDBejMdX0v4BW8g0fSOWYSOpe/Wxf7bDQ88/lc
        xvc5y15TwOCuMgJsheVaDMdrN27ANZ1GJpG1xkJUTEMQnG1lT9bs6nKYRWbdAF2V
        gbGPpvGWNAHXSp929Ono+Qy3kcDLtO6yshIwujmIc4+Ka4kGrgoR5gH/VboUZNbY
        k5DKPoU5yHc4MgRhH08loSah+UUpKqXwYPJmFH034Q==
X-ME-Sender: <xms:QRy-YrqfNldGTXLFHrEKaFnR7rKe5h7CgnzfL5f1auJG5ImOhmLtaw>
    <xme:QRy-Ylo6MQkUNbIQFHus0n8WTERFqZhPJcv2Y5Dd_Ixss2uZM6gcs4YDE_GJWflQo
    4kIaXd3NBzabW6o-34>
X-ME-Received: <xmr:QRy-YoMMu_KHVJ7hjQIbn3tANK_grAKGNQ0IMIzHF0CrqNlmxrhnzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:QRy-Yu5xic5P0tyiMMtZmaMTEqxhcKJIng8TJW3AbfT54rlUL52vbQ>
    <xmx:QRy-Yq4ajRQy49AItxohWF5RXm7EYAjRs62YAGKOP6xKytndsv45SA>
    <xmx:QRy-YmhMW4P6eX7p4DsxQPZ5d4PnYcSmBiRYRKLYi9KKj0IweuHf8w>
    <xmx:QRy-YhYPJts8fjMh5EE4KQ1hRCHCi74sPqBjyTZ_DqCsMiaCXmvUjw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 17:57:18 -0400 (EDT)
Date:   Fri, 1 Jul 2022 00:57:15 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 27/55] media: rkisp1: isp: Rename
 rkisp1_device.active_sensor to source
Message-ID: <20220630215715.fc7fynqpd36d55hf@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-28-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-28-paul.elder@ideasonboard.com>
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
>The active_sensor field of the rkisp1_device structure points to the ASD
>data for the active source. The source may however not be a sensor, so
>the naming is a bit confusing. Furthermore, the driver doesn't need to
>access the full ASD from the active_sensor field, only the subdev
>pointer is needed, when stopping streaming.
>
>Rename the field to source, and turn it into a v4l2_subdev pointer.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

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
