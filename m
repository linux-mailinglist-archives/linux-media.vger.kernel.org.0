Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C285D56D276
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 03:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiGKBW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 21:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGKBW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 21:22:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9A3DED1
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 18:22:22 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 1C33832008FA;
        Sun, 10 Jul 2022 21:22:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 10 Jul 2022 21:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657502538; x=1657588938; bh=OAP5lNOnto
        QCi0i7yGreoCicpCjNWew+wb4az/Ml9fY=; b=Ekotzg9b8ujG3Bihrp2cUkyy87
        pIB80ptjLPENA3FJVs9MJQdfXR2BoXGERhpiWff6HMuDDsXraP5Ee92Pqg15doEB
        Y4V4lGizpzl8mbkm9196vvYWWlNpu0WAIsJo6vEz7pRQWeyDUm+8relwPQAUpSvo
        kWnshApor9r9Z4A8GsiAJ4bvqiaYznJ2E+MhdCZrOKvQ1ONa2VZ+y5RY76/kUjnb
        CjGKjVqttAzkY/gJXgUP1WyYT576GAZWwpAaN1nPSThsdBp3kiX/LjwOMoojqE/x
        XYYj+uaAm3NuQisHr71xNCZPbSKcPk8MoCctRFMbwQTzPjfRmJhfWnWXK6uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657502538; x=1657588938; bh=OAP5lNOntoQCi0i7yGreoCicpCjN
        Wew+wb4az/Ml9fY=; b=22Vlrd35tlVdaHAfb8qQrgTMqyAAPcLvi8QHwoSTtOFs
        uIwB5d4ISI/fVNqGGEiuKoMStk/emwrYH4eoDs22MdgTgXtIeFSPU19Co0M62yrj
        AnTQSD1y1nbdoRUhGTtbzNkwLt1tVjOHADN7HyYwt8crtNq+KETu/v/PZfnJcKXK
        Hj17MyofrZawKiSUC+tGfpCMFGUBr1fP1CtE5pACxhPzUo0sXMOlQakK+GPoeC/7
        pDXm3u6+SeBnOhmqSlWeYvITeELhYBizRKDsI0KagYFLTOE3H8Xu/ObodvTCQFJe
        BG3aLC/ujGgIN4UEXytDJXYMEm/jD/QNTjarxzqJOA==
X-ME-Sender: <xms:SnvLYlo_i-6GXAecZIYEjbbsyt5g16a2eWfFd1ZPXnAbkTQCYtYMtA>
    <xme:SnvLYnrxImdvApSP88KxjWzoCqM3D5erqGS0ShWSgyo-R4hMZY9rrnyuZaxLf__hv
    dbdvpur_Pah9v4B4zE>
X-ME-Received: <xmr:SnvLYiPFrK7VQS00iS9Uifx6QrJXsPFNw-meCGJTHFYldx4D7wTOIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:SnvLYg7O1PMu0p-0eF5cmcMkTuWcft68OlprQfII2qqwcg5mlM9bVQ>
    <xmx:SnvLYk4U6Fe5ujAjhBg3B0cobc0G2X5R3NFvf5nHIj619TcSG19zdQ>
    <xmx:SnvLYohV3cyOKOloYpcWJkGFzmtUYB70IdjD8mg5SNjC20jwQvYC6Q>
    <xmx:SnvLYv2a6G4yKpfCcMRcTLUzNpbFMsPGNB-49WtHNhWs3weYug51SA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 21:22:15 -0400 (EDT)
Date:   Mon, 11 Jul 2022 04:22:12 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 39/55] media: rkisp1: csi: Implement a V4L2 subdev for
 the CSI receiver
Message-ID: <20220711012212.kfppk5oundhrhou4@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-40-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-40-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:06, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>The CSI receiver is a component separate from the ISP or the resizers.
>It is actually optional, not all device model include a CSI receiver. On
>some SoCs CSI-2 support can be provided through an external CSI-2
>receiver, connected to the ISP's parallel input.
>
>To support those use cases, create a V4L2 subdev to model the CSI
>receiver. It will allow the driver to handle both internal and external
>CSI receivers the same way.
>
>The next commit will plumb the CSI subdev to the rest of the driver,
>replacing direct function calls.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
>Changes since v1:
>
>- Rename RKISP1_CSI_PAD_MAX to RKISP1_CSI_PAD_NUM
>- Simplify format propagation
>- Fix usage of uninitialized variables
>- White space fixes
>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  17 ++
> .../platform/rockchip/rkisp1/rkisp1-csi.c     | 288 ++++++++++++++++++
> .../platform/rockchip/rkisp1/rkisp1-csi.h     |   4 +
> .../platform/rockchip/rkisp1/rkisp1-dev.c     |   5 +
> 4 files changed, 314 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index 5301461d3ea3..84832e1367ff 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -68,6 +68,13 @@ enum rkisp1_rsz_pad {
> 	RKISP1_RSZ_PAD_MAX
> };
>
>+/* enum for the csi receiver pads */
>+enum rkisp1_csi_pad {
>+	RKISP1_CSI_PAD_SINK,
>+	RKISP1_CSI_PAD_SRC,
>+	RKISP1_CSI_PAD_NUM
>+};
>+
> /* enum for the capture id */
> enum rkisp1_stream_id {
> 	RKISP1_MAINPATH,
>@@ -141,11 +148,21 @@ struct rkisp1_sensor_async {
>  * @rkisp1: pointer to the rkisp1 device
>  * @dphy: a pointer to the phy
>  * @is_dphy_errctrl_disabled: if dphy errctrl is disabled (avoid endless interrupt)
>+ * @sd: v4l2_subdev variable
>+ * @pads: media pads
>+ * @pad_cfg: configurations for the pads
>+ * @ops_lock: a lock for the subdev ops
>+ * @source: source in-use, set when starting streaming
>  */
> struct rkisp1_csi {
> 	struct rkisp1_device *rkisp1;
> 	struct phy *dphy;
> 	bool is_dphy_errctrl_disabled;
>+	struct v4l2_subdev sd;
>+	struct media_pad pads[RKISP1_CSI_PAD_NUM];
>+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_CSI_PAD_NUM];
>+	struct mutex ops_lock; /* serialize the subdevice ops */
>+	struct rkisp1_sensor_async *source;
> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>index 81849c8e9c73..173a0550af5c 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>@@ -15,10 +15,35 @@
> #include <linux/phy/phy-mipi-dphy.h>
>
> #include <media/v4l2-ctrls.h>
>+#include <media/v4l2-fwnode.h>
>
> #include "rkisp1-common.h"
> #include "rkisp1-csi.h"
>
>+#define RKISP1_CSI_DEV_NAME	RKISP1_DRIVER_NAME "_csi"
>+
>+#define RKISP1_CSI_DEF_FMT	MEDIA_BUS_FMT_SRGGB10_1X10
>+
>+static inline struct rkisp1_csi *to_rkisp1_csi(struct v4l2_subdev *sd)
>+{
>+	return container_of(sd, struct rkisp1_csi, sd);
>+}
>+
>+static struct v4l2_mbus_framefmt *
>+rkisp1_csi_get_pad_fmt(struct rkisp1_csi *csi,
>+		       struct v4l2_subdev_state *sd_state,
>+		       unsigned int pad, u32 which)
>+{
>+	struct v4l2_subdev_state state = {
>+		.pads = csi->pad_cfg
>+	};
>+
>+	if (which == V4L2_SUBDEV_FORMAT_TRY)
>+		return v4l2_subdev_get_try_format(&csi->sd, sd_state, pad);
>+	else
>+		return v4l2_subdev_get_try_format(&csi->sd, &state, pad);
>+}
>+
> static int rkisp1_csi_config(struct rkisp1_csi *csi,
> 			     const struct rkisp1_sensor_async *sensor)
> {
>@@ -186,6 +211,269 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
> 	return IRQ_HANDLED;
> }
>
>+/* ----------------------------------------------------------------------------
>+ * Subdev pad operations
>+ */
>+
>+static void rkisp1_csi_set_src_fmt(struct rkisp1_csi *csi,
>+				   struct v4l2_subdev_state *sd_state,
>+				   struct v4l2_mbus_framefmt *format,
>+				   unsigned int which)
>+{
>+	struct v4l2_mbus_framefmt *sink_fmt;
>+
>+	/* We don't set the src format directly; take it from the sink format */
>+	sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SINK,
>+					  which);
>+
>+	*format = *sink_fmt;
>+}
>+
>+static void rkisp1_csi_set_sink_fmt(struct rkisp1_csi *csi,
>+				    struct v4l2_subdev_state *sd_state,
>+				    struct v4l2_mbus_framefmt *format,
>+				    unsigned int which)
>+{
>+	const struct rkisp1_mbus_info *mbus_info;
>+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>+
>+	sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SINK,
>+					  which);
>+	src_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SRC,
>+					 which);
>+
>+	sink_fmt->code = format->code;
>+
>+	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>+	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
>+		sink_fmt->code = RKISP1_CSI_DEF_FMT;
>+		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>+	}
>+
>+	sink_fmt->width = clamp_t(u32, format->width,
>+				  RKISP1_ISP_MIN_WIDTH,
>+				  RKISP1_ISP_MAX_WIDTH);
>+	sink_fmt->height = clamp_t(u32, format->height,
>+				   RKISP1_ISP_MIN_HEIGHT,
>+				   RKISP1_ISP_MAX_HEIGHT);
>+
>+	/* Propagate to source pad */
>+	*src_fmt = *sink_fmt;
>+
>+	*format = *sink_fmt;
>+}
>+
>+static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
>+				     struct v4l2_subdev_state *sd_state,
>+				     struct v4l2_subdev_mbus_code_enum *code)
>+{
>+	unsigned int i;
>+	int pos = 0;
>+
>+	for (i = 0; ; i++) {
>+		const struct rkisp1_mbus_info *fmt =
>+			rkisp1_mbus_info_get_by_index(i);
>+
>+		if (!fmt)
>+			return -EINVAL;
>+
>+		if (fmt->direction & RKISP1_ISP_SD_SINK)
>+			pos++;
>+
>+		if (code->index == pos - 1) {
>+			code->code = fmt->mbus_code;
>+			return 0;
>+		}
>+	}
>+
>+	return -EINVAL;
>+}
>+
>+static int rkisp1_csi_init_config(struct v4l2_subdev *sd,
>+				  struct v4l2_subdev_state *sd_state)
>+{
>+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>+
>+	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>+					      RKISP1_CSI_PAD_SINK);
>+	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>+					     RKISP1_CSI_PAD_SRC);
>+
>+	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
>+	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
>+	sink_fmt->field = V4L2_FIELD_NONE;
>+	sink_fmt->code = RKISP1_CSI_DEF_FMT;
>+
>+	*src_fmt = *sink_fmt;
>+
>+	return 0;
>+}
>+
>+static int rkisp1_csi_get_fmt(struct v4l2_subdev *sd,
>+			      struct v4l2_subdev_state *sd_state,
>+			      struct v4l2_subdev_format *fmt)
>+{
>+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
>+
>+	mutex_lock(&csi->ops_lock);
>+	fmt->format = *rkisp1_csi_get_pad_fmt(csi, sd_state, fmt->pad,
>+					      fmt->which);
>+	mutex_unlock(&csi->ops_lock);
>+	return 0;
>+}
>+
>+static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
>+			      struct v4l2_subdev_state *sd_state,
>+			      struct v4l2_subdev_format *fmt)
>+{
>+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
>+
>+	mutex_lock(&csi->ops_lock);
>+	if (fmt->pad == RKISP1_CSI_PAD_SINK)
>+		rkisp1_csi_set_sink_fmt(csi, sd_state, &fmt->format,
>+					fmt->which);
>+	else
>+		rkisp1_csi_set_src_fmt(csi, sd_state, &fmt->format,
>+				       fmt->which);
>+
>+	mutex_unlock(&csi->ops_lock);
>+	return 0;
>+}
>+
>+/* ----------------------------------------------------------------------------
>+ * Subdev video operations
>+ */
>+
>+static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
>+{
>+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
>+	struct rkisp1_device *rkisp1 = csi->rkisp1;
>+	struct media_pad *source_pad;
>+	struct v4l2_subdev *source;
>+	int ret;
>+
>+	if (!enable) {
>+		v4l2_subdev_call(csi->source->sd, video, s_stream,
>+				 false);
>+
>+		rkisp1_csi_stop(csi);
>+
>+		return 0;
>+	}
>+
>+	source_pad = media_entity_remote_source_pad_unique(&sd->entity);
>+	if (IS_ERR(source_pad)) {
>+		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %d\n",
>+			IS_ERR(source_pad));

s/IS_ERR/PTR_ERR/

>+		return -EPIPE;
>+	}
>+
>+	source = media_entity_to_v4l2_subdev(source_pad->entity);
>+	if (!source) {
>+		/* This should really not happen, so is not worth a message. */
>+		return -EPIPE;
>+	}
>+
>+	csi->source = container_of(source->asd, struct rkisp1_sensor_async,
>+				   asd);
>+
>+	if (csi->source->mbus_type != V4L2_MBUS_CSI2_DPHY)
>+		return -EINVAL;

I would set here csi->source to NULL, and shouldn't setting it be inside the lock?

thanks,
Dafna

>+
>+	mutex_lock(&csi->ops_lock);
>+	ret = rkisp1_csi_start(csi, csi->source);
>+	mutex_unlock(&csi->ops_lock);
>+	if (ret)
>+		return ret;
>+
>+	v4l2_subdev_call(csi->source->sd, video, s_stream, true);
>+
>+	return 0;
>+}
>+
>+/* ----------------------------------------------------------------------------
>+ * Registration
>+ */
>+
>+static const struct media_entity_operations rkisp1_csi_media_ops = {
>+	.link_validate = v4l2_subdev_link_validate,
>+};
>+
>+static const struct v4l2_subdev_video_ops rkisp1_csi_video_ops = {
>+	.s_stream = rkisp1_csi_s_stream,
>+};
>+
>+static const struct v4l2_subdev_pad_ops rkisp1_csi_pad_ops = {
>+	.enum_mbus_code = rkisp1_csi_enum_mbus_code,
>+	.init_cfg = rkisp1_csi_init_config,
>+	.get_fmt = rkisp1_csi_get_fmt,
>+	.set_fmt = rkisp1_csi_set_fmt,
>+};
>+
>+static const struct v4l2_subdev_ops rkisp1_csi_ops = {
>+	.video = &rkisp1_csi_video_ops,
>+	.pad = &rkisp1_csi_pad_ops,
>+};
>+
>+int rkisp1_csi_register(struct rkisp1_device *rkisp1)
>+{
>+	struct rkisp1_csi *csi = &rkisp1->csi;
>+	struct v4l2_subdev_state state = {};
>+	struct media_pad *pads;
>+	struct v4l2_subdev *sd;
>+	int ret;
>+
>+	csi->rkisp1 = rkisp1;
>+	mutex_init(&csi->ops_lock);
>+
>+	sd = &csi->sd;
>+	v4l2_subdev_init(sd, &rkisp1_csi_ops);
>+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>+	sd->entity.ops = &rkisp1_csi_media_ops;
>+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>+	sd->owner = THIS_MODULE;
>+	strscpy(sd->name, RKISP1_CSI_DEV_NAME, sizeof(sd->name));
>+
>+	pads = csi->pads;
>+	pads[RKISP1_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
>+					  MEDIA_PAD_FL_MUST_CONNECT;
>+	pads[RKISP1_CSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
>+					 MEDIA_PAD_FL_MUST_CONNECT;
>+
>+	ret = media_entity_pads_init(&sd->entity, RKISP1_CSI_PAD_NUM, pads);
>+	if (ret)
>+		goto error;
>+
>+	state.pads = csi->pad_cfg;
>+	rkisp1_csi_init_config(sd, &state);
>+
>+	ret = v4l2_device_register_subdev(&csi->rkisp1->v4l2_dev, sd);
>+	if (ret) {
>+		dev_err(sd->dev, "Failed to register csi receiver subdev\n");
>+		goto error;
>+	}
>+
>+	return 0;
>+
>+error:
>+	media_entity_cleanup(&sd->entity);
>+	mutex_destroy(&csi->ops_lock);
>+	csi->rkisp1 = NULL;
>+	return ret;
>+}
>+
>+void rkisp1_csi_unregister(struct rkisp1_device *rkisp1)
>+{
>+	struct rkisp1_csi *csi = &rkisp1->csi;
>+
>+	if (!csi->rkisp1)
>+		return;
>+
>+	v4l2_device_unregister_subdev(&csi->sd);
>+	media_entity_cleanup(&csi->sd.entity);
>+	mutex_destroy(&csi->ops_lock);
>+}
>+
> int rkisp1_csi_init(struct rkisp1_device *rkisp1)
> {
> 	struct rkisp1_csi *csi = &rkisp1->csi;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>index 97ce7e7959ab..ddf8e5e08f55 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>@@ -13,10 +13,14 @@
>
> struct rkisp1_device;
> struct rkisp1_sensor_async;
>+struct v4l2_subdev;
>
> int rkisp1_csi_init(struct rkisp1_device *rkisp1);
> void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
>
>+int rkisp1_csi_register(struct rkisp1_device *rkisp1);
>+void rkisp1_csi_unregister(struct rkisp1_device *rkisp1);
>+
> int rkisp1_csi_start(struct rkisp1_csi *csi,
> 		     const struct rkisp1_sensor_async *sensor);
> void rkisp1_csi_stop(struct rkisp1_csi *csi);
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 2c441665c017..5428e19e818f 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -324,6 +324,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>
> static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
> {
>+	rkisp1_csi_unregister(rkisp1);
> 	rkisp1_params_unregister(rkisp1);
> 	rkisp1_stats_unregister(rkisp1);
> 	rkisp1_capture_devs_unregister(rkisp1);
>@@ -355,6 +356,10 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
> 	if (ret)
> 		goto error;
>
>+	ret = rkisp1_csi_register(rkisp1);
>+	if (ret)
>+		goto error;
>+
> 	ret = rkisp1_create_links(rkisp1);
> 	if (ret)
> 		goto error;
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
