Return-Path: <linux-media+bounces-24592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127CA08B36
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94ADD160993
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAB920CCEF;
	Fri, 10 Jan 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OhdHO0UO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7E420C484;
	Fri, 10 Jan 2025 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500535; cv=none; b=h4stYMrG8USsQR0Y4spyQWycF9FgyEotShvIFwrs1G1nUxWXVnPhWxHXGvaaaY2pi4xOoDN6KmHmVg9ZiXCrDKovu+Bx68s4hjYhJ8LUpYcZb+pOlpdUajBjr4KMjLJu7QAg3xqEn8b58F9HJ00BZwJOIRKsWkK7r3ta4S0szUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500535; c=relaxed/simple;
	bh=v0ungztLXSbnrvol002IoXFz0dIRmoYaP/UVyF/feSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhG2r+bmRVQwRXxYYPkYdJeeO8N4c3ohKItpLs1lSdGeOzL+2QK7IkP7U81lM3sHZpb0CRRLP5a0L/cRV4pAdTO603V9X171Vao0p9iooRBuknoTY/r7s/ce/41g5G0HApXF68rlTIolWlq9fY2OTZP/ACcsPFyUS1urgYfXJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OhdHO0UO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07D7F1F1A;
	Fri, 10 Jan 2025 10:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500457;
	bh=v0ungztLXSbnrvol002IoXFz0dIRmoYaP/UVyF/feSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OhdHO0UOgbB7XTDE5qn+BJXraNjXIrYuuc3duTvBJ8DiPj9nIbASvRI8oKDR6GzGx
	 ZUE+E3Z2WS125s2hGILAqSQ4qGofGWdyhIi+FTPDinjU95fdmW2noeInZC1P4Hgehh
	 YK9JTLYM9kLzG7oxwfAYNp73bYy0fhyJEpvCM97s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:12 +0200
Subject: [PATCH 12/19] media: i2c: ds90ub960: Add RX port iteration support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-12-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18076;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=v0ungztLXSbnrvol002IoXFz0dIRmoYaP/UVyF/feSk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUUQrvWY3BmXO3RMeJ2WnppBP37mnHKbkDkO
 WctGT+ZY0yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFAAKCRD6PaqMvJYe
 9X//EACaYMBLJ8SRw7QfiNwIIRLx+VYBOtv4/JOilKWqu6tPlS3jrpm73eZPJKHgp6sFUoR46Qc
 6S1wtVuLSdm/d0lIpZLzqKSJnIaIzXf2r0I0WuwTiIr4a+6GFXtuP/bXUSopQwl20sb8kra0uNE
 G3vk7us1n0xAebbc0EJWMZ8wgDK2XfXsJ+JMPS/j0d6vfjqakSm//03U01TBlpymIEtyZOZe89h
 5zpcdKQ6Kx1tX9mY+h1Bm3cFcmcvzC8nSqL30zZwwNvx7qz39J3x6emL3wl32hVgz4lwqKbHEnH
 VTDvVUvUtG5R0HMPWRH/h3ADQk5CIc6LwcwgBTwD1OBbDtOg+Az9o4s0MLizOUZMiw409MiN84l
 RpDk62z3Mqc2qoJPvbSLK+42uYgqsf/msSgmIStmQifrooq0QDDqmG8G3rDhj/+MLkvASYtwP4Y
 Wbrri5EljQ53J83lSI+8Z8HMr1FBqDeI0jiG+CefmgDJW9CrcAsgz0wokvnztSspOizLE0ueDRG
 w0OicRTRBQz+P+Dr3arLFm8H7ilqkLupkc9lz+jz2ZLVUCXesYW7NAbxlp9frWgx3av1OFQADJf
 1PRGAaTUEirDwuZYSM50qE8s2HWHea6NAAWR3+TO0T4Z+j6V3oF52HyhGOX9nmeS62SGXorxCT1
 7rco9dqaHx8OQCQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver does a lot of iteration over the RX ports with for loops. In
most cases the driver will skip unused RX ports. Also, in the future
patches the FPD-Link IV support will be refreshed with TI's latest init
sequences which involves a lot of additional iterations over the RX
ports, often only for FPD-Link IV ports.

To make the iteration simpler and to make it clearer what we're
iterating over (all or only-active, all or only-fpd4), add macros and
support functions for iterating the RX ports. Use the macros in the
driver, replacing the for loops.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 260 ++++++++++++++++++++++--------------------
 1 file changed, 135 insertions(+), 125 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index bca858172942..02e22ae813fa 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -649,6 +649,63 @@ static const struct ub960_format_info *ub960_find_format(u32 code)
 	return NULL;
 }
 
+struct ub960_rxport_iter {
+	unsigned int nport;
+	struct ub960_rxport *rxport;
+};
+
+enum ub960_iter_flags {
+	UB960_ITER_ACTIVE_ONLY = BIT(0),
+	UB960_ITER_FPD4_ONLY = BIT(1),
+};
+
+static struct ub960_rxport_iter ub960_iter_rxport(struct ub960_data *priv,
+						  struct ub960_rxport_iter it,
+						  enum ub960_iter_flags flags)
+{
+	for (; it.nport < priv->hw_data->num_rxports; it.nport++) {
+		it.rxport = priv->rxports[it.nport];
+
+		if ((flags & UB960_ITER_ACTIVE_ONLY) && !it.rxport)
+			continue;
+
+		if ((flags & UB960_ITER_FPD4_ONLY) &&
+		    it.rxport->cdr_mode != RXPORT_CDR_FPD4)
+			continue;
+
+		return it;
+	}
+
+	it.rxport = NULL;
+
+	return it;
+}
+
+#define for_each_rxport(priv)                                                 \
+	for (struct ub960_rxport_iter it =                                    \
+		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
+				       0);                                    \
+	     it.nport < (priv)->hw_data->num_rxports;                         \
+	     it.nport++, it = ub960_iter_rxport(priv, it, 0))
+
+#define for_each_active_rxport(priv)                                          \
+	for (struct ub960_rxport_iter it =                                    \
+		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
+				       UB960_ITER_ACTIVE_ONLY);               \
+	     it.nport < (priv)->hw_data->num_rxports;                         \
+	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
+						UB960_ITER_ACTIVE_ONLY))
+
+#define for_each_active_rxport_fpd4(priv)                                     \
+	for (struct ub960_rxport_iter it =                                    \
+		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
+				       UB960_ITER_ACTIVE_ONLY |               \
+					       UB960_ITER_FPD4_ONLY);         \
+	     it.nport < (priv)->hw_data->num_rxports;                         \
+	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
+						UB960_ITER_ACTIVE_ONLY |      \
+							UB960_ITER_FPD4_ONLY))
+
 /* -----------------------------------------------------------------------------
  * Basic device access
  */
@@ -1356,25 +1413,25 @@ static int  ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
 
 static int ub960_rxport_enable_vpocs(struct ub960_data *priv)
 {
-	unsigned int nport;
+	unsigned int failed_nport;
 	int ret;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
-
-		if (!rxport || !rxport->vpoc)
+	for_each_active_rxport(priv) {
+		if (!it.rxport->vpoc)
 			continue;
 
-		ret = regulator_enable(rxport->vpoc);
-		if (ret)
+		ret = regulator_enable(it.rxport->vpoc);
+		if (ret) {
+			failed_nport = it.nport;
 			goto err_disable_vpocs;
+		}
 	}
 
 	return 0;
 
 err_disable_vpocs:
-	while (nport--) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
+	while (failed_nport--) {
+		struct ub960_rxport *rxport = priv->rxports[failed_nport];
 
 		if (!rxport || !rxport->vpoc)
 			continue;
@@ -1387,15 +1444,11 @@ static int ub960_rxport_enable_vpocs(struct ub960_data *priv)
 
 static void ub960_rxport_disable_vpocs(struct ub960_data *priv)
 {
-	unsigned int nport;
-
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
-
-		if (!rxport || !rxport->vpoc)
+	for_each_active_rxport(priv) {
+		if (!it.rxport->vpoc)
 			continue;
 
-		regulator_disable(rxport->vpoc);
+		regulator_disable(it.rxport->vpoc);
 	}
 }
 
@@ -1420,12 +1473,10 @@ static int ub960_rxport_clear_errors(struct ub960_data *priv,
 
 static int ub960_clear_rx_errors(struct ub960_data *priv)
 {
-	unsigned int nport;
-
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		int ret;
+	int ret;
 
-		ret = ub960_rxport_clear_errors(priv, nport);
+	for_each_rxport(priv) {
+		ret = ub960_rxport_clear_errors(priv, it.nport);
 		if (ret)
 			return ret;
 	}
@@ -1928,30 +1979,27 @@ static void ub960_rxport_remove_serializer(struct ub960_data *priv, u8 nport)
 /* Add serializer i2c devices for all initialized ports */
 static int ub960_rxport_add_serializers(struct ub960_data *priv)
 {
-	unsigned int nport;
+	unsigned int failed_nport;
 	int ret;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
-
-		if (!rxport)
-			continue;
-
-		ret = ub960_rxport_add_serializer(priv, nport);
-		if (ret)
+	for_each_active_rxport(priv) {
+		ret = ub960_rxport_add_serializer(priv, it.nport);
+		if (ret) {
+			failed_nport = it.nport;
 			goto err_remove_sers;
+		}
 	}
 
 	return 0;
 
 err_remove_sers:
-	while (nport--) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
+	while (failed_nport--) {
+		struct ub960_rxport *rxport = priv->rxports[failed_nport];
 
 		if (!rxport)
 			continue;
 
-		ub960_rxport_remove_serializer(priv, nport);
+		ub960_rxport_remove_serializer(priv, failed_nport);
 	}
 
 	return ret;
@@ -1959,16 +2007,8 @@ static int ub960_rxport_add_serializers(struct ub960_data *priv)
 
 static void ub960_rxport_remove_serializers(struct ub960_data *priv)
 {
-	unsigned int nport;
-
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
-
-		if (!rxport)
-			continue;
-
-		ub960_rxport_remove_serializer(priv, nport);
-	}
+	for_each_active_rxport(priv)
+		ub960_rxport_remove_serializer(priv, it.nport);
 }
 
 static int ub960_init_tx_port(struct ub960_data *priv,
@@ -2453,19 +2493,13 @@ static int ub960_init_rx_port_ub9702(struct ub960_data *priv,
 
 static int ub960_init_rx_ports(struct ub960_data *priv)
 {
-	unsigned int nport;
-
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
+	for_each_active_rxport(priv) {
 		int ret;
 
-		if (!rxport)
-			continue;
-
 		if (priv->hw_data->is_ub9702)
-			ret = ub960_init_rx_port_ub9702(priv, rxport);
+			ret = ub960_init_rx_port_ub9702(priv, it.rxport);
 		else
-			ret = ub960_init_rx_port_ub960(priv, rxport);
+			ret = ub960_init_rx_port_ub960(priv, it.rxport);
 
 		if (ret)
 			return ret;
@@ -2683,20 +2717,14 @@ static int ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
  */
 static int ub960_validate_stream_vcs(struct ub960_data *priv)
 {
-	unsigned int nport;
-	unsigned int i;
-
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
+	for_each_active_rxport(priv) {
 		struct v4l2_mbus_frame_desc desc;
 		int ret;
 		u8 vc;
 
-		if (!rxport)
-			continue;
-
-		ret = v4l2_subdev_call(rxport->source.sd, pad, get_frame_desc,
-				       rxport->source.pad, &desc);
+		ret = v4l2_subdev_call(it.rxport->source.sd, pad,
+				       get_frame_desc, it.rxport->source.pad,
+				       &desc);
 		if (ret)
 			return ret;
 
@@ -2708,13 +2736,13 @@ static int ub960_validate_stream_vcs(struct ub960_data *priv)
 
 		vc = desc.entry[0].bus.csi2.vc;
 
-		for (i = 1; i < desc.num_entries; i++) {
+		for (unsigned int i = 1; i < desc.num_entries; i++) {
 			if (vc == desc.entry[i].bus.csi2.vc)
 				continue;
 
 			dev_err(&priv->client->dev,
 				"rx%u: source with multiple virtual-channels is not supported\n",
-				nport);
+				it.nport);
 			return -ENODEV;
 		}
 	}
@@ -2804,21 +2832,21 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	 */
 	fwd_ctl = GENMASK(7, 4);
 
-	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports;
-	     nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
+	for_each_active_rxport(priv) {
+		unsigned long nport = it.nport;
+
 		u8 vc = vc_map[nport];
 
 		if (rx_data[nport].num_streams == 0)
 			continue;
 
-		switch (rxport->rx_mode) {
+		switch (it.rxport->rx_mode) {
 		case RXPORT_MODE_RAW10:
 			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
 				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
 				&ret);
 
-			ub960_rxport_write(priv, rxport->nport,
+			ub960_rxport_write(priv, nport,
 				UB960_RR_RAW_EMBED_DTYPE,
 				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
 					rx_data[nport].meta_dt, &ret);
@@ -2886,7 +2914,6 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams[UB960_MAX_RX_NPORTS] = {};
 	struct v4l2_subdev_route *route;
 	unsigned int failed_port;
-	unsigned int nport;
 	int ret;
 
 	if (!priv->streaming) {
@@ -2908,6 +2935,8 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 
 	/* Collect sink streams per pad which we need to enable */
 	for_each_active_route(&state->routing, route) {
+		unsigned int nport;
+
 		if (route->source_pad != source_pad)
 			continue;
 
@@ -2919,7 +2948,9 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 		sink_streams[nport] |= BIT_ULL(route->sink_stream);
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+	for_each_rxport(priv) {
+		unsigned int nport = it.nport;
+
 		if (!sink_streams[nport])
 			continue;
 
@@ -2957,7 +2988,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err:
-	for (nport = 0; nport < failed_port; nport++) {
+	for (unsigned int nport = 0; nport < failed_port; nport++) {
 		if (!sink_streams[nport])
 			continue;
 
@@ -2997,11 +3028,12 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 	struct device *dev = &priv->client->dev;
 	u64 sink_streams[UB960_MAX_RX_NPORTS] = {};
 	struct v4l2_subdev_route *route;
-	unsigned int nport;
 	int ret;
 
 	/* Collect sink streams per pad which we need to disable */
 	for_each_active_route(&state->routing, route) {
+		unsigned int nport;
+
 		if (route->source_pad != source_pad)
 			continue;
 
@@ -3013,7 +3045,9 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 		sink_streams[nport] |= BIT_ULL(route->sink_stream);
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+	for_each_rxport(priv) {
+		unsigned int nport = it.nport;
+
 		if (!sink_streams[nport])
 			continue;
 
@@ -3335,7 +3369,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	struct ub960_data *priv = sd_to_ub960(sd);
 	struct device *dev = &priv->client->dev;
 	struct v4l2_subdev_state *state;
-	unsigned int nport;
 	u16 v16 = 0;
 	u8 v = 0;
 	u8 id[UB960_SR_FPD3_RX_ID_LEN];
@@ -3351,7 +3384,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
 
-	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+	for (unsigned int nport = 0; nport < priv->hw_data->num_txports;
+	     nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		dev_info(dev, "TX %u\n", nport);
@@ -3397,12 +3431,12 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\tline error counter %u\n", v16);
 	}
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
+	for_each_rxport(priv) {
+		unsigned int nport = it.nport;
 
 		dev_info(dev, "RX %u\n", nport);
 
-		if (!rxport) {
+		if (!it.rxport) {
 			dev_info(dev, "\tNot initialized\n");
 			continue;
 		}
@@ -3514,7 +3548,6 @@ static const struct media_entity_operations ub960_entity_ops = {
 static irqreturn_t ub960_handle_events(int irq, void *arg)
 {
 	struct ub960_data *priv = arg;
-	unsigned int i;
 	u8 int_sts;
 	u8 fwd_sts;
 	int ret;
@@ -3531,7 +3564,7 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 
 	dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
 
-	for (i = 0; i < priv->hw_data->num_txports; i++) {
+	for (unsigned int i = 0; i < priv->hw_data->num_txports; i++) {
 		if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i)) {
 			ret = ub960_csi_handle_events(priv, i);
 			if (ret)
@@ -3539,12 +3572,9 @@ static irqreturn_t ub960_handle_events(int irq, void *arg)
 		}
 	}
 
-	for (i = 0; i < priv->hw_data->num_rxports; i++) {
-		if (!priv->rxports[i])
-			continue;
-
-		if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i)) {
-			ret = ub960_rxport_handle_events(priv, i);
+	for_each_active_rxport(priv) {
+		if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(it.nport)) {
+			ret = ub960_rxport_handle_events(priv, it.nport);
 			if (ret)
 				return IRQ_NONE;
 		}
@@ -3582,19 +3612,12 @@ static void ub960_txport_free_ports(struct ub960_data *priv)
 
 static void ub960_rxport_free_ports(struct ub960_data *priv)
 {
-	unsigned int nport;
-
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
-
-		if (!rxport)
-			continue;
-
-		fwnode_handle_put(rxport->source.ep_fwnode);
-		fwnode_handle_put(rxport->ser.fwnode);
+	for_each_active_rxport(priv) {
+		fwnode_handle_put(it.rxport->source.ep_fwnode);
+		fwnode_handle_put(it.rxport->ser.fwnode);
 
-		kfree(rxport);
-		priv->rxports[nport] = NULL;
+		kfree(it.rxport);
+		priv->rxports[it.nport] = NULL;
 	}
 }
 
@@ -3853,7 +3876,6 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
 	struct fwnode_handle *links_fwnode;
-	unsigned int nport;
 	int ret;
 
 	links_fwnode = fwnode_get_named_child_node(dev_fwnode(dev), "links");
@@ -3868,9 +3890,10 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
 
 	priv->strobe.manual = fwnode_property_read_bool(links_fwnode, "ti,manual-strobe");
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+	for_each_rxport(priv) {
 		struct fwnode_handle *link_fwnode;
 		struct fwnode_handle *ep_fwnode;
+		unsigned int nport = it.nport;
 
 		link_fwnode = ub960_fwnode_get_link_by_regs(links_fwnode, nport);
 		if (!link_fwnode)
@@ -3959,7 +3982,6 @@ static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
 	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
 	struct device *dev = &priv->client->dev;
 	u8 nport = rxport->nport;
-	unsigned int i;
 	int ret;
 
 	ret = media_entity_get_fwnode_pad(&subdev->entity,
@@ -3984,8 +4006,8 @@ static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
-	for (i = 0; i < priv->hw_data->num_rxports; i++) {
-		if (priv->rxports[i] && !priv->rxports[i]->source.sd) {
+	for_each_active_rxport(priv) {
+		if (!it.rxport->source.sd) {
 			dev_dbg(dev, "Waiting for more subdevs to be bound\n");
 			return 0;
 		}
@@ -4011,29 +4033,24 @@ static const struct v4l2_async_notifier_operations ub960_notify_ops = {
 static int ub960_v4l2_notifier_register(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
-	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
 
-	for (i = 0; i < priv->hw_data->num_rxports; i++) {
-		struct ub960_rxport *rxport = priv->rxports[i];
+	for_each_active_rxport(priv) {
 		struct ub960_asd *asd;
 
-		if (!rxport)
-			continue;
-
 		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
-					       rxport->source.ep_fwnode,
+					       it.rxport->source.ep_fwnode,
 					       struct ub960_asd);
 		if (IS_ERR(asd)) {
 			dev_err(dev, "Failed to add subdev for source %u: %pe",
-				i, asd);
+				it.nport, asd);
 			v4l2_async_nf_cleanup(&priv->notifier);
 			return PTR_ERR(asd);
 		}
 
-		asd->rxport = rxport;
+		asd->rxport = it.rxport;
 	}
 
 	priv->notifier.ops = &ub960_notify_ops;
@@ -4304,7 +4321,6 @@ static int ub960_probe(struct i2c_client *client)
 	struct ub960_data *priv;
 	unsigned int port_lock_mask;
 	unsigned int port_mask;
-	unsigned int nport;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -4357,14 +4373,8 @@ static int ub960_probe(struct i2c_client *client)
 
 	port_mask = 0;
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
-		struct ub960_rxport *rxport = priv->rxports[nport];
-
-		if (!rxport)
-			continue;
-
-		port_mask |= BIT(nport);
-	}
+	for_each_active_rxport(priv)
+		port_mask |= BIT(it.nport);
 
 	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
 	if (ret)
@@ -4403,9 +4413,9 @@ static int ub960_probe(struct i2c_client *client)
 			      msecs_to_jiffies(UB960_POLL_TIME_MS));
 
 #ifdef UB960_DEBUG_I2C_RX_ID
-	for (unsigned int i = 0; i < priv->hw_data->num_rxports; i++)
-		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
-			    (UB960_DEBUG_I2C_RX_ID + i) << 1, NULL);
+	for_each_rxport(priv)
+		ub960_write(priv, UB960_SR_I2C_RX_ID(it.nport),
+			    (UB960_DEBUG_I2C_RX_ID + it.nport) << 1, NULL);
 #endif
 
 	return 0;

-- 
2.43.0


