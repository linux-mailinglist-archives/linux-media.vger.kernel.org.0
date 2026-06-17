Return-Path: <linux-media+bounces-65115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Z6VEzWNMmrf1wUAu9opvQ
	(envelope-from <linux-media+bounces-65115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:04:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49988699754
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:04:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Sv4rIjRU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65115-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65115-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EE543080EEB
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784B8401A16;
	Wed, 17 Jun 2026 11:56:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B0D3F1ABA;
	Wed, 17 Jun 2026 11:56:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697380; cv=none; b=PaIvvrGH3+wVAdn8DUMkbd67CjL9jRjR4r+cCnBcx8rVu1KTiN5vx+nMDTKi84LiBLjNAkNhwc/q+J2Y82OAV22cG7SxjlnD2rOpAcdSyxFWEbwg8XZ8QcfCQC6VExI1ld8SIABLZLBL8VbHV9pefDK4VCpwgeg/Q+nDtkcwcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697380; c=relaxed/simple;
	bh=S3avSRgMOsfZq/Te9AKc1SpCJwVfwV1BwRoIOQBoDcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwjBGAhgm3x4aYsv/aEWe9CmetsfSKnRbYWOSMDH5xq+UQU6C4R61kULka7nEyGSFYVd/7dlRyg/zPHJDpQ8zRqMBZ+HdoTAL1ZnDgLYTSivUxGKkBwF8XboMvCp4rIIpv0sMS3ktQl15ozvjDmS8bq801JloSrfsskv3hmwSTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sv4rIjRU; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20243259E;
	Wed, 17 Jun 2026 13:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697325;
	bh=S3avSRgMOsfZq/Te9AKc1SpCJwVfwV1BwRoIOQBoDcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sv4rIjRUFtCW02lIDE4KaV9768qUpjMWklHCZHonFyRUD0rpcRQv4ZZJ+2UEucpHL
	 +PWej2nAWWsrjlg14UmtitUCmbFiO7shv++JRdfaM4FCBpfrGE0v+zZik8FS7ZUNRp
	 MgVdRrOJPtSKj//mD59BFM9EOaYz6zzd9ugVwb6g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:55:03 +0300
Subject: [PATCH v6 10/11] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-10-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6107;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=S3avSRgMOsfZq/Te9AKc1SpCJwVfwV1BwRoIOQBoDcs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotGBmysIDAVSPZ2BgINGWeNYAOsQynFOm/eb
 Ks1SfgbHM6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRgAKCRD6PaqMvJYe
 9bEwD/4ys6CtU0wWw9hNA4TvDhTYrxuUrQ0pCxofQ2OhX8cNFsLgVYy3/bz3cM5FqpPWcSplRfG
 q7KCVvw+qMbOKPUT/+7uz0EFPC2dUTPEChWY//hR/OtUsl0cBVHpS03cD9Zuo/09rTCwHAwaccC
 IOomli4luz38nH1wRkgkmIDcjUJcTkdw/mKaG+bg1hztaZhPZfocyHN7BVrVKkBtxhbkV4PrMZO
 J4DdPoQFLJ1qVNo0UFiObLt00qo5H6WPm3v8EKPc5o7cz7Me7mWUqLd8555CLKy6rwiNOQKADK5
 8I7N+cw22QhD1K8b6voMsSUB+THjwirfZO7Ruq0vOlHbumMnn9ZSYo3kfEFHj9AGuy2p98sgvnN
 ghbitO1ZOSmmFblzyfyOz53TU7DrbmYXPFI0PFHizu0oNxRcnRiDDejgZaPR0/QwolrjG8I4A5y
 czL/0d/ZErusxdVPwESFf5gGZLjWgASgwlFfZ2fOWiKDUWf/M7Wrgh5NYfybj3r4cmeClI0yjJ1
 zYC/A+c/qaFqLXYnmwfP3IudooS/08jACMoUPIWhpCMzPOAAsZ5sWih2gGuP59qRzeKJsWwFRW7
 6rXUItG/Kc2E7rcv+NKfNBxeT02mN4QRTrw9z2b5Jo/A63GHQ4L7txHMBhxK12phtw/YVPxwx8o
 YmiBURGg4s0N34g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65115-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49988699754

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask
- Track enabled sink streams so that in rcsi2_irq_thread() we can
  disable and enable all currently enabled streams

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 95 ++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 8cd38b4cbc7f..34899e5409da 100644
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
@@ -773,7 +784,7 @@ struct rcar_csi2 {
 
 	int channel_vc[4];
 
-	int stream_count;
+	u64 enabled_sink_streams_mask;
 
 	bool cphy;
 	unsigned short lanes;
@@ -1883,29 +1894,32 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
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
 
-	if (priv->stream_count == 0) {
+	if (!priv->enabled_sink_streams_mask) {
 		ret = rcsi2_start(priv, state);
 		if (ret)
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
-		if (priv->stream_count == 0)
+		if (!priv->enabled_sink_streams_mask)
 			rcsi2_stop(priv);
 		return ret;
 	}
 
-	priv->stream_count += 1;
+	priv->enabled_sink_streams_mask |= sink_streams;
 
 	return ret;
 }
@@ -1915,23 +1929,26 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
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
 
-	if (priv->stream_count == 1)
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
+	if (priv->enabled_sink_streams_mask == sink_streams)
 		rcsi2_stop(priv);
 
 	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
-					  BIT_ULL(0));
+					  sink_streams);
 	if (ret)
 		return ret;
 
-	priv->stream_count -= 1;
+	priv->enabled_sink_streams_mask &= ~sink_streams;
 
 	return 0;
 }
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
@@ -2045,6 +2090,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 
+	.set_routing = rcsi2_set_routing,
 	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
@@ -2065,17 +2111,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
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
@@ -2120,13 +2155,13 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
 
-	if (priv->stream_count == 0)
+	if (!priv->enabled_sink_streams_mask)
 		goto out;
 
 	rcsi2_stop(priv);
 
 	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
-					  BIT_ULL(0));
+					  priv->enabled_sink_streams_mask);
 	if (ret) {
 		dev_warn(priv->dev,
 			 "Error recovery: failed to disable streams: %d\n",
@@ -2145,7 +2180,7 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 	}
 
 	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
+					 priv->enabled_sink_streams_mask);
 	if (ret) {
 		dev_warn(priv->dev,
 			 "Error recovery: failed to start streams: %d\n",
@@ -2748,8 +2783,6 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 
-	priv->stream_count = 0;
-
 	ret = rcsi2_probe_resources(priv, pdev);
 	if (ret) {
 		dev_err(priv->dev, "Failed to get resources\n");

-- 
2.43.0


