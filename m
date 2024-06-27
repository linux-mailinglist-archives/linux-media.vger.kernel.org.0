Return-Path: <linux-media+bounces-14254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043791A792
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A7A1F22BE9
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E0B193071;
	Thu, 27 Jun 2024 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HN4Oyu8J"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02619148F;
	Thu, 27 Jun 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493859; cv=none; b=UAiWIFTujIoMRFJi7bvgyVQ1wkQF8Uc0BS/0GFQVAASKJNAzwgaur8Mw0P0oStaGocRdDjoO4pPL6JiDmOH4GsuzKgO65JxpqkVINhsUpRe0zMCojCoWgd4dEEzjQLL70LWwPU2uaNRqGNMRpK5H+B3cLCAKML0wx3pp5x62wpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493859; c=relaxed/simple;
	bh=WZ2gAxTS7fZA7Ln7bwpB4aZ+mMTaAMP5yoJH7VSPXII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ow9UF8Cq6XUjgfa8shb8A5ONeHgN31sl+me+Qkyie4iRw6LbCSgnWNqVswMuRatTtpDtWpdiPKoU4GfJRUPCWAuujgPmWBak13+707C/rDiNwzoM/RlTg+SDViTEysYCqv5Yz7O4UIQSIZOHzM5Xnuk2dHJUuxmqQKS8va6UUCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HN4Oyu8J; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAfoN118794;
	Thu, 27 Jun 2024 08:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493841;
	bh=TuGcjpY/SSWwMollyfrfG2FCoWRm4VbYrHc8nyRtYiM=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=HN4Oyu8Jm5AOD6w28sbaTCoDWKijMldXVZy1bjg0ZhMlv4SXGghJ1doBHux/7HxOq
	 TXJbc9d1d8cJZMSOO3mejCWHPVOba1HEyH2tXI2vz7yyOJ2SbZDKQbwTyiCVl2I/ME
	 SqwhXrlXd7d4UQsvD6ysIOdvGcDGcXMPlmewn0IY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAfUJ029383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:41 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAeEW038757;
	Thu, 27 Jun 2024 08:10:41 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:06 +0530
Subject: [PATCH v2 11/13] media: cadence: csi2rx: Enable multi-stream
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-11-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=17618; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=WZ2gAxTS7fZA7Ln7bwpB4aZ+mMTaAMP5yoJH7VSPXII=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS8kXWgUxWEmhheeqfIJ3N/gJAQoee87ZgJj
 BqsAwEXNteJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kvAAKCRBD3pH5JJpx
 RY7nD/43z7oRdY/2s4jXmQYZl/vxw7EmMt1wCYeai0UjJ4BLxkE4eEALCtB4LSPulKO/ClQ5LoS
 tFaS9dWOx8JiKXmcUhGs8pa0Q6+AthBms6zJL1eXptJMexQN+pdUiySXnz+eMJzd2Ac+DGiMyaZ
 L4xmegJZ/oRy4/TXtWuoqbDReqnUHylDNgCknhKq07Borte8LuL83fcbR9hWNus2MFZasHz39Gh
 1auogaceZBUqjKUMYCszGzvDmSrofi2TTb1fgw+V5p1jDEUZ4hSPiDpcFkC/CdZWm33Fnis6Ymc
 oiKnUbK5Uuxb6Gh8u8PC3YRgDgs2bMLVIGzSIWmm8AP4WrwKswXjUi02vyCrvJ+NhCFNhiCcfsJ
 k/mW8r4SSXoT2PSxp9JapXTcr0hT1dHOSCptXv5GCLN2uRUtdR7VPjeSAhBaADsIxMoC1ZwFs8M
 J3Ijh2FdShAU9/nCzujxiCzphk50KmMIN7R1QqW20TBeACVLJbQvRAOZsAKkqjLv70/2gi5Y27E
 Iqu6IoWSRRON3Q3JxNp7AOxDUSqGH8iGmN6WKvDBhb4n6UU/Kd8JR7b4/1nBM4s1JO8h3rnaS0b
 riLWDSmlELrAcBK2q+LLbnOSYuu1Ald6CHQd9AWdNHhnF7ZC9mLiTVl7OjMsZa/hyLLtGu6z/zQ
 mwVDONTECvt8SYw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
of data over the same physical interface using MIPI Virtual Channels.

The V4L2 subdev APIs should reflect this capability and allow per-stream
routing and controls.

While the hardware IP supports usecases where streams coming in the sink
pad can be broadcasted to multiple source pads, the driver will need
significant re-architecture to make that possible. The two users of this
IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
have only integrated the first source pad i.e stream0 of this IP. So for
now keep it simple and only allow 1-to-1 mapping of streams from sink to
source, without any broadcasting.

With stream routing now supported in the driver, implement the
enable_stream and disable_stream hooks in place of the stream-unaware
s_stream hook.

This allows consumer devices like a DMA bridge or ISP, to enable
particular streams on a source pad, which in turn can be used to enable
only particular streams on the CSI-TX device connected on the sink pad.

Implement a fallback s_stream hook that internally calls enable_stream
on each source pad, for consumer drivers that don't use multi-stream
APIs to still work.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 407 ++++++++++++++++++++-------
 1 file changed, 313 insertions(+), 94 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 2ec34fc9c524..b0c91a9c65e8 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -90,6 +90,7 @@ struct csi2rx_priv {
 	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
 	struct phy			*dphy;
 
+	u32				vc_select[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -179,27 +180,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 
 static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 {
+	struct v4l2_ctrl_handler *handler = csi2rx->source_subdev->ctrl_handler;
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	struct v4l2_subdev_format sd_fmt = {
-		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad	= CSI2RX_PAD_SINK,
-	};
+	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_subdev_state *state;
 	const struct csi2rx_fmt *fmt;
 	s64 link_freq;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
-					    &sd_fmt);
-	if (ret < 0)
-		return ret;
+	if (v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ)) {
+		link_freq = v4l2_get_link_freq(handler, 0, 0);
+	} else {
+		state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
+		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
+							0);
+
+		if (framefmt) {
+			fmt = csi2rx_get_fmt_by_code(framefmt->code);
+		} else {
+			dev_err(csi2rx->dev,
+				"Did not find active sink format\n");
+			return -EINVAL;
+		}
 
-	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
+		link_freq = v4l2_get_link_freq(handler, fmt->bpp,
+					       2 * csi2rx->num_lanes);
 
-	link_freq = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
-				       fmt->bpp, 2 * csi2rx->num_lanes);
-	if (link_freq < 0)
+		dev_warn(csi2rx->dev,
+			 "Guessing link frequency using bitdepth of stream 0.\n");
+		dev_warn(csi2rx->dev,
+			 "V4L2_CID_LINK_FREQ control is required for multi format sources.\n");
+	}
+
+	if (link_freq < 0) {
+		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
 		return link_freq;
+	}
 
 	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
 							 csi2rx->num_lanes, cfg);
@@ -222,18 +239,10 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 static int csi2rx_start(struct csi2rx_priv *csi2rx)
 {
 	unsigned int i;
-	struct media_pad *remote_pad;
 	unsigned long lanes_used = 0;
 	u32 reg;
 	int ret;
 
-	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
-	if (!remote_pad) {
-		dev_err(csi2rx->dev,
-			"Failed to find connected source\n");
-		return -ENODEV;
-	}
-
 	ret = clk_prepare_enable(csi2rx->p_clk);
 	if (ret)
 		return ret;
@@ -300,11 +309,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
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
@@ -317,17 +322,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 	reset_control_deassert(csi2rx->sys_rst);
 
-	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev,
-					 remote_pad->index, BIT(0));
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
@@ -346,7 +344,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 {
-	struct media_pad *remote_pad;
 	unsigned int i;
 	u32 val;
 	int ret;
@@ -375,13 +372,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->p_rst);
 	clk_disable_unprepare(csi2rx->p_clk);
 
-	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
-	if (!remote_pad ||
-	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
-					remote_pad->index, BIT(0))) {
-		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
-	}
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -390,47 +380,167 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	}
 }
 
-static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
+static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
+				    struct v4l2_subdev_state *state)
 {
-	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
-	int ret = 0;
+	struct v4l2_mbus_frame_desc fd = {0};
+	struct v4l2_subdev_route *route;
+	unsigned int i;
+	int ret;
 
-	if (enable) {
-		ret = pm_runtime_resume_and_get(csi2rx->dev);
-		if (ret < 0)
-			return ret;
+	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
+		csi2rx->vc_select[i] = 0;
+
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
+	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_dbg(csi2rx->dev,
+			"Failed to get source frame desc, allowing only VC=0\n");
+		goto err_no_fd;
 	}
 
-	mutex_lock(&csi2rx->lock);
+	/* If source provides per-stream VC info, use it to filter by VC */
+	for_each_active_route(&state->routing, route) {
+		int cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
+		u8 used_vc = 0;
 
-	if (enable) {
-		/*
-		 * If we're not the first users, there's no need to
-		 * enable the whole controller.
-		 */
-		if (!csi2rx->count) {
-			ret = csi2rx_start(csi2rx);
-			if (ret) {
-				pm_runtime_put(csi2rx->dev);
-				goto out;
+		for (i = 0; i < fd.num_entries; i++) {
+			if (fd.entry[i].stream == route->sink_stream) {
+				used_vc = fd.entry[i].bus.csi2.vc;
+				break;
 			}
 		}
+		csi2rx->vc_select[cdns_stream] |=
+			CSI2RX_STREAM_DATA_CFG_VC_SELECT(used_vc);
+	}
 
-		csi2rx->count++;
-	} else {
-		csi2rx->count--;
+err_no_fd:
+	for (i = 0; i < CSI2RX_STREAMS_MAX; i++) {
+		if (!csi2rx->vc_select[i]) {
+			csi2rx->vc_select[i] =
+				CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
+		}
+	}
+}
 
-		/*
-		 * Let the last user turn off the lights.
-		 */
-		if (!csi2rx->count)
-			csi2rx_stop(csi2rx);
+static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+	int ret;
+
+	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev,
+			"Failed to find connected source\n");
+		return -ENODEV;
+	}
+
+	ret = pm_runtime_resume_and_get(csi2rx->dev);
+	if (ret < 0)
+		return ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
 
-		pm_runtime_put(csi2rx->dev);
+	mutex_lock(&csi2rx->lock);
+	/*
+	 * If we're not the first users, there's no need to
+	 * enable the whole controller.
+	 */
+	if (!csi2rx->count) {
+		ret = csi2rx_start(csi2rx);
+		if (ret)
+			goto err_stream_start;
 	}
 
-out:
+	/* Start streaming on the source */
+	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, remote_pad->index,
+					 sink_streams);
+	if (ret) {
+		dev_err(csi2rx->dev,
+			"Failed to start streams %#llx on subdev\n",
+			sink_streams);
+		goto err_subdev_enable;
+	}
+
+	csi2rx->count++;
+	mutex_unlock(&csi2rx->lock);
+
+	return 0;
+
+err_subdev_enable:
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+err_stream_start:
 	mutex_unlock(&csi2rx->lock);
+	pm_runtime_put(csi2rx->dev);
+	return ret;
+}
+
+static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
+
+	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
+	if (!remote_pad ||
+	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
+					remote_pad->index, sink_streams)) {
+		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
+	}
+
+	mutex_lock(&csi2rx->lock);
+	csi2rx->count--;
+	/*
+	 * Let the last user turn off the lights.
+	 */
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+	mutex_unlock(&csi2rx->lock);
+
+	pm_runtime_put(csi2rx->dev);
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
+	}
+
 	return ret;
 }
 
@@ -446,12 +556,63 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
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
+	ret = v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
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
+
+	if (ret)
+		return ret;
+
+	csi2rx_update_vc_select(csi2rx, state);
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
@@ -463,14 +624,19 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Set sink format */
-	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
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
@@ -478,40 +644,92 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
-	.get_frame_desc = csi2rx_get_frame_desc,
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
@@ -766,7 +984,8 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
 		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
-	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		V4L2_SUBDEV_FL_STREAMS;
 	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
 
 	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,

-- 
2.43.0


