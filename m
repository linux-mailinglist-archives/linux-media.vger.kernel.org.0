Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27245722A5
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 20:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbiGLSbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 14:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiGLSbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 14:31:51 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C5B655B5
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 11:31:50 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 8FECF320069B;
        Tue, 12 Jul 2022 14:31:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 12 Jul 2022 14:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657650706; x=1657737106; bh=11+yKhQNtk
        qsc3WIsu7dmoWcuraQOIE2WFMl1lviQZk=; b=AvvCCbMfc+3RfQC3BcM0YaNczL
        XC3Eg1HHj7rEzg1/Mmif3I/6q81c+ElZcH0ep8P0b48UO1NYuXonm9xNJYhYtWOI
        R3ScybKtE8nqtMruKUk8WXS7CR+XcttqrhTMYZ2OOm97oS5JsUesIxc2M3T6vxt9
        9/r3fEYBZgGKcVCgY+vVHBljs9Tb3kArQNeZG/hasZVryWlXyO0XM+keYAuIJonn
        7Ng9l0N94GVQFqH2WcCw6oYH14s9XsW5ykApMZhKFTh9BNzzuN3cWDNBjC3MwCvm
        caDNUIIAhicUpJ9sizc6tDI9oHs9geDiT7ioYVbOUzc9ETnkElvXiPfRzF5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657650706; x=1657737106; bh=11+yKhQNtkqsc3WIsu7dmoWcuraQ
        OIE2WFMl1lviQZk=; b=uoJitkKWfV9Q9hsZpl9s2BKwhbUCrff0WmK6y26cvHIn
        h7yAHWHWc1qk24S1Fc41OATnDDS/TDjH/ie0ATgnyczuFFIqE+NLqaRUNKNix/Z3
        vktmPxmwaGJRgTrXBr7tqievdj2G5PHAlGqJoH0Sq/BavEc7oK/MAz2TQ24eIOtc
        AkYBMmAjv3OwKBL1WcS2Up9r8VbSDB/fVMvSbrkE7QgdgY1t7k3jjXwY1dpXZdn9
        biTn+9NQeHwuxDbpmRTVeIeHtq7r4ZWvxg6oMaFxXWSrqe/oo6CU7Ljgectr3VUC
        /4MJRjgpsQ8ZkK41FJqBp32/YRA5+nC4lJoBoWWa3Q==
X-ME-Sender: <xms:Eb7NYsQf_8LN5N85P1A-1ZUC6M2Qk3x6cEVWRx9NVhliF0zNxJnm9w>
    <xme:Eb7NYpy60MXLgvIcHTaliPSFZUtw-Od87juJi2_Gyq0yhwtCMaDavtzH6Z-mYb7Bd
    dMZHW05lg3j77Pb5Ww>
X-ME-Received: <xmr:Eb7NYp30twhwfif6tQeKuMXbEoi1Bm3usAFcIIZLQw1mEdWuzynVzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Eb7NYgCht-fTQAc1wNNgjAzfvkijysCK8D3RFju6vNmcN2Qoz5isvg>
    <xmx:Eb7NYlhRGUyvcR0xl9F4jQL-l0-6nBl3hC7T6aNDG-d7WhY_lCCBdQ>
    <xmx:Eb7NYspO4_NZnyBpDe1I_5QV3p8vG8rvhcwgzxEFcSThRMzRYKNZEA>
    <xmx:Er7NYlfRT9SCm13rqt1nOz3rWa9Pv59_gyJuXQEsdZafE80_Y2rrxA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 14:31:42 -0400 (EDT)
Date:   Tue, 12 Jul 2022 21:31:39 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v3 39/46] media: rkisp1: csi: Implement a V4L2 subdev for
 the CSI receiver
Message-ID: <20220712183139.lhwp4voinuf2tujw@guri>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
 <20220711124248.2683-40-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220711124248.2683-40-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11.07.2022 15:42, Laurent Pinchart wrote:
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

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
>Changes since v2:
>
>- Store source subdev instead of asd in rkisp1_csi
>- Store sink format info in rkisp1_csi and use it instead of
>  isp->sink_fmt
>- Fix v4l2-compliance failures with rkisp1_csi_enum_mbus_code()
>- Handle source s_stream errors
>- Fix s/IS_ERR/PTR_ERR/
>- Drop forward declaration of struct v4l2_subdev in rkisp1-csi.h
>- Add lockdep assertion
>- Rename ops_lock to lock
>
>Changes since v1:
>
>- Rename RKISP1_CSI_PAD_MAX to RKISP1_CSI_PAD_NUM
>- Simplify format propagation
>- Fix usage of uninitialized variables
>- White space fixes
>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  19 ++
> .../platform/rockchip/rkisp1/rkisp1-csi.c     | 306 +++++++++++++++++-
> .../platform/rockchip/rkisp1/rkisp1-csi.h     |   3 +
> .../platform/rockchip/rkisp1/rkisp1-dev.c     |   5 +
> 4 files changed, 329 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index 5301461d3ea3..3465d35cf102 100644
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
>@@ -141,11 +148,23 @@ struct rkisp1_sensor_async {
>  * @rkisp1: pointer to the rkisp1 device
>  * @dphy: a pointer to the phy
>  * @is_dphy_errctrl_disabled: if dphy errctrl is disabled (avoid endless interrupt)
>+ * @sd: v4l2_subdev variable
>+ * @pads: media pads
>+ * @pad_cfg: configurations for the pads
>+ * @sink_fmt: input format
>+ * @lock: protects pad_cfg and sink_fmt
>+ * @source: source in-use, set when starting streaming
>  */
> struct rkisp1_csi {
> 	struct rkisp1_device *rkisp1;
> 	struct phy *dphy;
> 	bool is_dphy_errctrl_disabled;
>+	struct v4l2_subdev sd;
>+	struct media_pad pads[RKISP1_CSI_PAD_NUM];
>+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_CSI_PAD_NUM];
>+	const struct rkisp1_mbus_info *sink_fmt;
>+	struct mutex lock;
>+	struct v4l2_subdev *source;
> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>index 81849c8e9c73..0c90f76ba9b3 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>@@ -11,19 +11,46 @@
>
> #include <linux/delay.h>
> #include <linux/device.h>
>+#include <linux/lockdep.h>
> #include <linux/phy/phy.h>
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
>+	lockdep_assert_held(&csi->lock);
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
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
>-	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
> 	unsigned int lanes = sensor->lanes;
> 	u32 mipi_ctrl;
>
>@@ -43,7 +70,7 @@ static int rkisp1_csi_config(struct rkisp1_csi *csi,
>
> 	/* Configure Data Type and Virtual Channel */
> 	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL,
>-		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
>+		     RKISP1_CIF_MIPI_DATA_SEL_DT(csi->sink_fmt->mipi_dt) |
> 		     RKISP1_CIF_MIPI_DATA_SEL_VC(0));
>
> 	/* Clear MIPI interrupts */
>@@ -114,8 +141,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
> 		return -EINVAL;
> 	}
>
>-	phy_mipi_dphy_get_default_config(pixel_clock,
>-					 rkisp1->isp.sink_fmt->bus_width,
>+	phy_mipi_dphy_get_default_config(pixel_clock, csi->sink_fmt->bus_width,
> 					 sensor->lanes, cfg);
> 	phy_set_mode(csi->dphy, PHY_MODE_MIPI_DPHY);
> 	phy_configure(csi->dphy, &opts);
>@@ -186,6 +212,278 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
> 	return IRQ_HANDLED;
> }
>
>+/* ----------------------------------------------------------------------------
>+ * Subdev pad operations
>+ */
>+
>+static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
>+				     struct v4l2_subdev_state *sd_state,
>+				     struct v4l2_subdev_mbus_code_enum *code)
>+{
>+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
>+	unsigned int i;
>+	int pos = 0;
>+
>+	if (code->pad == RKISP1_CSI_PAD_SRC) {
>+		const struct v4l2_mbus_framefmt *sink_fmt;
>+
>+		if (code->index)
>+			return -EINVAL;
>+
>+		mutex_lock(&csi->lock);
>+
>+		sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state,
>+						  RKISP1_CSI_PAD_SINK,
>+						  code->which);
>+		code->code = sink_fmt->code;
>+
>+		mutex_unlock(&csi->lock);
>+
>+		return 0;
>+	}
>+
>+	for (i = 0; ; i++) {
>+		const struct rkisp1_mbus_info *fmt =
>+			rkisp1_mbus_info_get_by_index(i);
>+
>+		if (!fmt)
>+			return -EINVAL;
>+
>+		if (!(fmt->direction & RKISP1_ISP_SD_SINK))
>+			continue;
>+
>+		if (code->index == pos) {
>+			code->code = fmt->mbus_code;
>+			return 0;
>+		}
>+
>+		pos++;
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
>+	mutex_lock(&csi->lock);
>+	fmt->format = *rkisp1_csi_get_pad_fmt(csi, sd_state, fmt->pad,
>+					      fmt->which);
>+	mutex_unlock(&csi->lock);
>+
>+	return 0;
>+}
>+
>+static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
>+			      struct v4l2_subdev_state *sd_state,
>+			      struct v4l2_subdev_format *fmt)
>+{
>+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
>+	const struct rkisp1_mbus_info *mbus_info;
>+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>+
>+	/* The format on the source pad always matches the sink pad. */
>+	if (fmt->pad == RKISP1_CSI_PAD_SRC)
>+		return rkisp1_csi_get_fmt(sd, sd_state, fmt);
>+
>+	mutex_lock(&csi->lock);
>+
>+	sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SINK,
>+					  fmt->which);
>+
>+	sink_fmt->code = fmt->format.code;
>+
>+	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>+	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
>+		sink_fmt->code = RKISP1_CSI_DEF_FMT;
>+		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>+	}
>+
>+	sink_fmt->width = clamp_t(u32, fmt->format.width,
>+				  RKISP1_ISP_MIN_WIDTH,
>+				  RKISP1_ISP_MAX_WIDTH);
>+	sink_fmt->height = clamp_t(u32, fmt->format.height,
>+				   RKISP1_ISP_MIN_HEIGHT,
>+				   RKISP1_ISP_MAX_HEIGHT);
>+
>+	fmt->format = *sink_fmt;
>+
>+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>+		csi->sink_fmt = mbus_info;
>+
>+	/* Propagate the format to the source pad. */
>+	src_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SRC,
>+					 fmt->which);
>+	*src_fmt = *sink_fmt;
>+
>+	mutex_unlock(&csi->lock);
>+
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
>+	struct rkisp1_sensor_async *source_asd;
>+	struct media_pad *source_pad;
>+	struct v4l2_subdev *source;
>+	int ret;
>+
>+	if (!enable) {
>+		v4l2_subdev_call(csi->source, video, s_stream, false);
>+
>+		rkisp1_csi_stop(csi);
>+
>+		return 0;
>+	}
>+
>+	source_pad = media_entity_remote_source_pad_unique(&sd->entity);
>+	if (IS_ERR(source_pad)) {
>+		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %ld\n",
>+			PTR_ERR(source_pad));
>+		return -EPIPE;
>+	}
>+
>+	source = media_entity_to_v4l2_subdev(source_pad->entity);
>+	if (!source) {
>+		/* This should really not happen, so is not worth a message. */
>+		return -EPIPE;
>+	}
>+
>+	source_asd = container_of(source->asd, struct rkisp1_sensor_async, asd);
>+	if (source_asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
>+		return -EINVAL;
>+
>+	mutex_lock(&csi->lock);
>+	ret = rkisp1_csi_start(csi, source_asd);
>+	mutex_unlock(&csi->lock);
>+	if (ret)
>+		return ret;
>+
>+	ret = v4l2_subdev_call(source, video, s_stream, true);
>+	if (ret) {
>+		rkisp1_csi_stop(csi);
>+		return ret;
>+	}
>+
>+	csi->source = source;
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
>+	mutex_init(&csi->lock);
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
>+	csi->sink_fmt = rkisp1_mbus_info_get_by_code(RKISP1_CSI_DEF_FMT);
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
>+	mutex_destroy(&csi->lock);
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
>+	mutex_destroy(&csi->lock);
>+}
>+
> int rkisp1_csi_init(struct rkisp1_device *rkisp1)
> {
> 	struct rkisp1_csi *csi = &rkisp1->csi;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>index 96ac70bae595..f75babaac1cb 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>@@ -18,6 +18,9 @@ struct rkisp1_sensor_async;
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
