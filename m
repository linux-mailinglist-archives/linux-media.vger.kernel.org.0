Return-Path: <linux-media+bounces-55407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GEJIeJ0sWnovQIAu9opvQ
	(envelope-from <linux-media+bounces-55407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:57:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E2264EE9
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65A183004C88
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32FF3C3447;
	Wed, 11 Mar 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cikwbb8N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4E36DA1A;
	Wed, 11 Mar 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237266; cv=none; b=BheiYdfTxSYID6Y+K6gOv4GCodfjOLs4Wl3NV9SGhZw4cKbeLdiCJFrCw+WOQ+Nkelzxme9IE66B2Vg2uy2Ny6QiU/AlnA0utAp/kXtIE68yX/ytQoQCKdtYkIsAbon/n5GqaMBM9OtQt8oe0pKhSqJz5Ng63bRm2OcLwof/w1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237266; c=relaxed/simple;
	bh=OJ0cPcpsl2j4Ke/j3qEGXccRhFAy5Qw4fqRwl/curv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSNTqe+M/6BBIMgG/4uDsZ85peXjaTiQJ6rXnDOW/W/9xNomYT6eFy9e7W+dFKhi4hAL6M3IWl7zDaT+f6Ls2gniVA2TQwABE7cOlsytZ3OMr1JIRC/fpReiQAdE16yHLyTAT83CX8PLgESHJ7GOeHqpiFWGQrx/2vnAhVTdiVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cikwbb8N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 370F613D9;
	Wed, 11 Mar 2026 14:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237168;
	bh=OJ0cPcpsl2j4Ke/j3qEGXccRhFAy5Qw4fqRwl/curv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cikwbb8N3bPUFKxRibkX6NHoU+uzAlmIl7ie1rOdw4EfCqQXKBh4F+SoEf/GFzAwi
	 LHbSE4zXeqpqJsZ523aUnF7m80tXwkxQI1ljsHcTu2lrW08UK6htHVftB6ke3GfNZk
	 aygOk8Xv8GI5Gz9x+bl9pwi1hxfaRGyeGLp98zKc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:22 +0200
Subject: [PATCH v5 09/10] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-9-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4411;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=OJ0cPcpsl2j4Ke/j3qEGXccRhFAy5Qw4fqRwl/curv0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPsAtTPHtVFFfVY5Vd0vjw1PyjrLEsNMdlx1
 kMbGgLUl0SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz7AAKCRD6PaqMvJYe
 9Z2DEACsr0edT7xFiLEPzf+AQ03s5JPeFYuXRxykM8pe1mNqQNdv7WxsoepM/M7O29+Dou5m7ds
 0GBUJZJLxY1KPsYwyVeRpUBlrw/xYT30DPJ1Q8XdQlyrZbP8lq/IJ/c3ayum34CPzv74GVNvKkv
 rrAJjTpn575KOoOFKHSK2mlhUpxJkkH8xsIdx43u29WIsKNMduG3MROJOIc6ZMiIKzDrm7iYgSC
 2q43T4+uUosDHff9TtImmMHWCcUWDhsPqrF4qrNpzGLyvUD9ElDImlM0t0wU5Xzk1i91JzpfmTP
 0O6qUdtcR1qTa8MQKEHdHREtl5PuNzJQnT8LJHp/3OHkUZH/mr7M2uTEAYosTmxrqz/mX64bIQP
 xhCqTEcE+vy8XCw7G/cuQIT/0HlpiYRQm1FCwQvXJhnlXn1Jhn5GuY7MuxfruHWwc2W/WOazrs5
 b0mHeX/DJj/2Sfo2C2kUCep/rtGcSBNFzgo4q8VcRga5BACHsbkN6n9ohVTVX1MaN8tqo96CtoI
 nc8XFYAMM8e8BEHHiPB8QfwdBenbOxlzPrPWEH2JlIKP1b03988k6B8YfnTxGF73AomiLoP76Xx
 cAfYNv7QE4LkS0ym7PLBY4VgJ414beLOJv4hdrpvs/z6Y1MYd/N27tdWJamVbNVx+8wSGPOBAYq
 5MIToBnweftqXuw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: BF6E2264EE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55407-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 75 ++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 831a5ec27233..04afde4fe195 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -702,6 +702,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 	},
 };
 
+static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
+	.width		= 1920,
+	.height		= 1080,
+	.code		= MEDIA_BUS_FMT_RGB888_1X24,
+	.colorspace	= V4L2_COLORSPACE_SRGB,
+	.field		= V4L2_FIELD_NONE,
+	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+	.quantization	= V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+};
+
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
@@ -1883,10 +1894,8 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	int ret = 0;
-
-	if (source_streams_mask != 1)
-		return -EINVAL;
+	u64 sink_streams;
+	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1897,8 +1906,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       RCAR_CSI2_SOURCE_VC0,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		if (priv->stream_count == 0)
 			rcsi2_stop(priv);
@@ -1915,19 +1929,22 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 				 u32 source_pad, u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	u64 sink_streams;
 	int ret;
 
-	if (source_streams_mask != 1)
-		return -EINVAL;
-
 	if (!priv->remote)
 		return -ENODEV;
 
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       RCAR_CSI2_SOURCE_VC0,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
-					  BIT_ULL(0));
+					  sink_streams);
 	if (ret)
 		return ret;
 
@@ -1966,6 +1983,34 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	if (priv->info->use_isp) {
+		ret = v4l2_subdev_routing_validate(sd, routing,
+						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	} else {
+		ret = v4l2_subdev_routing_validate(sd, routing,
+						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+						   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	}
+
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &rcar_csi2_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
 					 unsigned int pad,
 					 struct v4l2_mbus_frame_desc *fd)
@@ -2041,6 +2086,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 
+	.set_routing = rcsi2_set_routing,
 	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
@@ -2061,17 +2107,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
-		.width		= 1920,
-		.height		= 1080,
-		.code		= MEDIA_BUS_FMT_RGB888_1X24,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
-		.field		= V4L2_FIELD_NONE,
-		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
-		.quantization	= V4L2_QUANTIZATION_DEFAULT,
-		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
-	};
-
 	static const struct v4l2_subdev_krouting routing = {
 		.num_routes = ARRAY_SIZE(routes),
 		.routes = routes,

-- 
2.43.0


