Return-Path: <linux-media+bounces-32472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC10AB69DB
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7D6D4A51DD
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2100E27A45D;
	Wed, 14 May 2025 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O33zdEur"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB5270572;
	Wed, 14 May 2025 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222008; cv=none; b=qWSGLmUyur/FpG7Vta8/+jcQVSY5hYYA7We8NZqrqder9bV5Cc+Dk28ocflDxL9Pix+QaeYlC1SqHNcx0k4mYfGOpLW8KQiE52sLxyPelILN8buoBiz9YCtCM2ZTxtdIMDkBOVhIBb50MYJ6s+MTISjvPGvyHJdkt5qmCt6oZNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222008; c=relaxed/simple;
	bh=CSHXV3EadsjvkdiHCaKvpUa7eAsZ1q2YkRu6It6HUHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=puo+N8t7YqgRL7pfdzb+F1/cB/2Wb9FKkxdAJrcmpHEKN38RMsFqjnDlkppHnysgoP20U9G4w14vFwPuajjCTe2EALj5T1BPmyCP4u5oeh0Ou/IcKxYmN1YJIPrgqyDvF50gvhDmvDC2VMtc2N8f0HoHs6WbRhGB4jjk6uzfbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O33zdEur; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBQVgI2604854
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 06:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747221991;
	bh=hHHsvAB2qhpUPs/VSqeejQWzaVBiODFnez8w0yCPsg8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O33zdEurHJQlY3iPtQij2jI7QE1jSLlw4XSvACB7IZpSy07xBmFlZtf+h1VgpI9to
	 OY8VuRcXaBRixaINMlGpvFs53N+kRnLDphxpXhaxPUrXfet12mGJ/CHPW6IPYj7tcu
	 Ohst1YecGd3ztB56gkwDUtazMJxtxIUN8iHj3xNg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBQVem031131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 06:26:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 06:26:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 06:26:31 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EBPSVF107507;
	Wed, 14 May 2025 06:26:25 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
Date: Wed, 14 May 2025 16:55:24 +0530
Message-ID: <20250514112527.1983068-10-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514112527.1983068-1-r-donadkar@ti.com>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Jai Luthra <j-luthra@ti.com>

Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
of data over the same physical interface using MIPI Virtual Channels.

While the hardware IP supports usecases where streams coming in the sink
pad can be broadcasted to multiple source pads, the driver will need
significant re-architecture to make that possible. The two users of this
IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
have only integrated the first source pad i.e stream0 of this IP. So for
now keep it simple and only allow 1-to-1 mapping of streams from sink to
source, without any broadcasting.

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev. Use this
API instead of  s_stream() API.

Implement the enable_stream and disable_stream hooks in place of the
stream-unaware s_stream hook.

Implement a fallback s_stream hook that internally calls enable_stream
on each source pad, for consumer drivers that don't use multi-stream
APIs to still work. The helper function v4l2_subdev_s_stream_helper()
form the v4l2 framework is not used here as it is meant only for the
subedvs that have a single source pad and this hardware IP supports
having multiple source pads.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 352 +++++++++++++++----
 1 file changed, 275 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index b7e9225f66a41..103c3bda653b9 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -90,6 +90,7 @@ struct csi2rx_priv {
 	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
 	struct phy			*dphy;
 
+	u32				vc_select[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -179,29 +180,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 
 static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 {
-	struct media_pad *src_pad =
-		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	struct v4l2_subdev_format sd_fmt = {
-		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad	= CSI2RX_PAD_SINK,
-	};
+	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_subdev_state *state;
 	const struct csi2rx_fmt *fmt;
+	int source_pad = csi2rx->source_pad;
+	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
 	s64 link_freq;
 	int ret;
+	u32 bpp;
 
-	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
-					    &sd_fmt);
-	if (ret < 0)
-		return ret;
+	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
+
+	/*
+	 * For multi-stream transmitters there is no single pixel rate.
+	 *
+	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
+	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
+	 */
+	if (state->routing.num_routes > 1) {
+		bpp = 0;
+	} else {
+		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
+		if (!framefmt) {
+			dev_err(csi2rx->dev, "Did not find active sink format\n");
+			return -EINVAL;
+		}
 
-	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
+		fmt = csi2rx_get_fmt_by_code(framefmt->code);
+		bpp = fmt->bpp;
+	}
 
-	link_freq = v4l2_get_link_freq(src_pad,
-				       fmt->bpp, 2 * csi2rx->num_lanes);
-	if (link_freq < 0)
+	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
+	if (link_freq < 0) {
+		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
 		return link_freq;
+	}
 
 	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
 							 csi2rx->num_lanes, cfg);
@@ -294,11 +309,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
 
-		/*
-		 * Enable one virtual channel. When multiple virtual channels
-		 * are supported this will have to be changed.
-		 */
-		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
+		writel(csi2rx->vc_select[i],
 		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
 
 		writel(CSI2RX_STREAM_CTRL_START,
@@ -311,16 +322,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 	reset_control_deassert(csi2rx->sys_rst);
 
-	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
-	if (ret)
-		goto err_disable_sysclk;
-
 	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
 
-err_disable_sysclk:
-	clk_disable_unprepare(csi2rx->sys_clk);
 err_disable_pixclk:
 	for (; i > 0; i--) {
 		reset_control_assert(csi2rx->pixel_rst[i - 1]);
@@ -367,9 +372,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->p_rst);
 	clk_disable_unprepare(csi2rx->p_clk);
 
-	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
-		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -378,37 +380,134 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	}
 }
 
-static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
+static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
+				    struct v4l2_subdev_state *state)
 {
-	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
-	int ret = 0;
-
-	mutex_lock(&csi2rx->lock);
-
-	if (enable) {
-		/*
-		 * If we're not the first users, there's no need to
-		 * enable the whole controller.
-		 */
-		if (!csi2rx->count) {
-			ret = csi2rx_start(csi2rx);
-			if (ret)
-				goto out;
+	struct v4l2_mbus_frame_desc fd = {0};
+	struct v4l2_subdev_route *route;
+	unsigned int i;
+	int ret;
+
+	/* Capture VC=0 by default */
+	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
+		csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
+
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
+	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_dbg(csi2rx->dev,
+			"Failed to get source frame desc, allowing only VC=0\n");
+		return;
+	}
+
+	/* If source provides per-stream VC info, use it to filter by VC */
+	memset(csi2rx->vc_select, 0, sizeof(csi2rx->vc_select));
+
+	for_each_active_route(&state->routing, route) {
+		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
+
+		for (i = 0; i < fd.num_entries; i++) {
+			if (fd.entry[i].stream != route->sink_stream)
+				continue;
+
+			csi2rx->vc_select[cdns_stream] |=
+				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
 		}
+	}
+}
 
-		csi2rx->count++;
-	} else {
-		csi2rx->count--;
+static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
+
+	guard(mutex)(&csi2rx->lock);
+	/*
+	 * If we're not the first users, there's no need to
+	 * enable the whole controller.
+	 */
+	if (!csi2rx->count) {
+		csi2rx_update_vc_select(csi2rx, state);
+		ret = csi2rx_start(csi2rx);
+		if (ret)
+			return ret;
+	}
 
-		/*
-		 * Let the last user turn off the lights.
-		 */
+	/* Start streaming on the source */
+	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
+					 sink_streams);
+	if (ret) {
+		dev_err(csi2rx->dev,
+			"Failed to start streams %#llx on subdev\n",
+			sink_streams);
 		if (!csi2rx->count)
 			csi2rx_stop(csi2rx);
+		return ret;
+	}
+
+	csi2rx->count++;
+	return 0;
+}
+
+static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	u64 sink_streams;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
+
+	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
+					csi2rx->source_pad, sink_streams)) {
+		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
+	}
+
+	guard(mutex)(&csi2rx->lock);
+	csi2rx->count--;
+
+	/* Let the last user turn off the lights. */
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+
+	return 0;
+}
+
+static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	u64 mask[CSI2RX_PAD_MAX] = {0};
+	int i, ret;
+
+	/* Find the stream mask on all source pads */
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
+		for_each_active_route(&state->routing, route) {
+			if (route->source_pad == i)
+				mask[i] |= BIT_ULL(route->source_stream);
+		}
+	}
+	v4l2_subdev_unlock_state(state);
+
+	/* Start streaming on each pad */
+	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
+		if (enable)
+			ret = v4l2_subdev_enable_streams(sd, i, mask[i]);
+		else
+			ret = v4l2_subdev_disable_streams(sd, i, mask[i]);
+		if (ret)
+			return ret;
 	}
 
-out:
-	mutex_unlock(&csi2rx->lock);
 	return ret;
 }
 
@@ -424,12 +523,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(subdev, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
+}
+
+static int csi2rx_set_routing(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
+		return -EBUSY;
+
+	ret = _csi2rx_set_routing(subdev, state, routing);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt;
-	unsigned int i;
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad != CSI2RX_PAD_SINK)
@@ -441,14 +584,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Set sink format */
-	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	/* Propagate to source formats */
-	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
-		fmt = v4l2_subdev_state_get_format(state, i);
-		*fmt = format->format;
-	}
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -456,40 +601,92 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 static int csi2rx_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format format = {
-		.pad = CSI2RX_PAD_SINK,
-		.format = {
-			.width = 640,
-			.height = 480,
-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
-			.field = V4L2_FIELD_NONE,
-			.colorspace = V4L2_COLORSPACE_SRGB,
-			.ycbcr_enc = V4L2_YCBCR_ENC_601,
-			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-			.xfer_func = V4L2_XFER_FUNC_SRGB,
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI2RX_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
 	};
 
-	return csi2rx_set_fmt(subdev, state, &format);
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _csi2rx_set_routing(subdev, state, &routing);
 }
 
 static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	struct v4l2_mbus_frame_desc source_fd = {0};
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
+	if (ret)
+		return ret;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
-	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(csi2rx->dev,
+				"Failed to find stream from source frame desc\n");
+			ret = -EPIPE;
+			goto err_missing_stream;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = source_entry->flags;
+		fd->entry[fd->num_entries].length = source_entry->length;
+		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc =
+			source_entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt =
+			source_entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+err_missing_stream:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
-	.enum_mbus_code	= csi2rx_enum_mbus_code,
-	.get_fmt	= v4l2_subdev_get_fmt,
-	.set_fmt	= csi2rx_set_fmt,
-	.get_frame_desc	= csi2rx_get_frame_desc,
+	.enum_mbus_code		= csi2rx_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi2rx_set_fmt,
+	.get_frame_desc		= csi2rx_get_frame_desc,
+	.set_routing		= csi2rx_set_routing,
+	.enable_streams		= csi2rx_enable_streams,
+	.disable_streams	= csi2rx_disable_streams,
 };
 
 static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
-	.s_stream	= csi2rx_s_stream,
+	.s_stream	= csi2rx_s_stream_fallback,
 };
 
 static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
@@ -721,7 +918,8 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
 		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
-	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+		V4L2_SUBDEV_FL_STREAMS;
 	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
 
 	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
-- 
2.34.1


