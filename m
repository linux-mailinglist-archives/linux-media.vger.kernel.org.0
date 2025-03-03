Return-Path: <linux-media+bounces-27372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29699A4C62C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6777E1895698
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF1522F178;
	Mon,  3 Mar 2025 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lyeF5+ut"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661CA22F15C;
	Mon,  3 Mar 2025 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017808; cv=none; b=dH7jmIzxXeDzBLWw0TmbKB7ZbpbrdbK2qm3az0fDBrNEisPpNOYAOk6AIb+2utCYWQyoYEEnzReSA9D4HgXQ6YE2o04fdzrvkISUYd/XBGjAHagJq22QH/5gltdJLc6lMwdxnK4BpBxNOBS8zTsmTy4CvmiWMPnNwL6E3QH6uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017808; c=relaxed/simple;
	bh=ye8T+T4AXwPste1Az6Che5D8l2fjCzBWR4bJUTUi+/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly9Kb9nLOj7Z8xWPr7ZQDpI54R04ggPGytlcuI7XuBr3UCvOyrq470/HzQ5M+Vx+D8jW/4sEapVhPfGiNVCEnEMiq1WBtthJkzw4Og78Z+EDa5im9V50sWD8WzgLrIzrXqDjb/8yUzrpao0VXcIV9KuxOsqQJd+8qouTfYJfPpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lyeF5+ut; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B27A22A;
	Mon,  3 Mar 2025 17:01:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017713;
	bh=ye8T+T4AXwPste1Az6Che5D8l2fjCzBWR4bJUTUi+/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lyeF5+utEbzIV+vcaWWght6KHUl0BkFHWJO8Axh2+9zh04f3nAU/34TJPVeloJoPy
	 pHlCjoK063qrSomKdKhq3SUckLudAN3MQfMO+RAADd4e63HEQF6CdIkYmEHpr+XblI
	 r6RXFQ//rxkjQ2fw9vAJBf/4fOJBd8otlQRwjxKc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:16 +0530
Subject: [PATCH v3 13/19] media: i2c: ds90ub960: Add RX port iteration
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-13-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18261;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=wWAjZLtJT+WKoPfOIxOIcMMHIgFjvwRC9w3PQnCsPk8=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKAxyeaeaYZKfi72g7xpxbDaGRMuVpL9/+PQ
 +2NOD4kT7SJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgAAKCRBD3pH5JJpx
 Rb6zEADEDk8AOZgbKTlSr1OMcr4gLJ+bGmNENrvkqZiDiF5/jHrhgdYKsV571AMk+2A0uLnWuZT
 l/Y/7a2mjGfXhJrJ5t0EfKUrQgL5pyAcOE6S8636KQDBzbVw1XzF9zB8EHsvzqwLoHJxN7J6fbH
 AdSOXhc2v3pGuEkB1xTc44kH/xLqHjLlvV1R9k/FJ/2fKxeU4vI3L70qV4e/ADUByCE7R/+gpTO
 hE1w7BR11CI2HhDuaR/7bqx8jy2qqVOQ75UN6Ps2oUSZSqMUSsx0B+o72oezIKeoRCbVIQjOKy2
 7Oqf/TwzZCxf85QQa6W/v5h5YBLgaClE+1WDeO74qGGnJBcNSOVV8tcaFI+fUqKRAf6G6gWMV5s
 whijNCm5fNcg3hUXYkWs0hKe9lMiE2uXLtXwM2tbCaI6h5oprmPLHRFNy2eVSyjIAlaG1winGLm
 cJBkFHmYMr/QUshXD8mw3qJEbVWL38G1NMTT6aqGxAS9MP7Bp/wyxMUbsehf6nrNli1BLRAg1uH
 jxu1PhJnrvWkpVXCXu9p/r7u75TIevAx6zYE0kY5NRU5i6ZAYP6gVs2cV69uKojN92/WW5MLaSZ
 jQvEs893MRiIM4oM4xxclWpbW2nBzPRBWXoraYt6Lp92fFnKxnu3iYjAwGt92wbpa8eU2ZnW1oE
 bIoEriWTw+c/tOQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

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
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 260 ++++++++++++++++++++++--------------------
 1 file changed, 135 insertions(+), 125 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ed49508d2b79283a95f2f3315b53f21d4301b089..af7ba1c824b12893bd31bed7a88a6e3bf8a62f7e 100644
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
+#define for_each_rxport(priv, it)                                             \
+	for (struct ub960_rxport_iter it =                                    \
+		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
+				       0);                                    \
+	     it.nport < (priv)->hw_data->num_rxports;                         \
+	     it.nport++, it = ub960_iter_rxport(priv, it, 0))
+
+#define for_each_active_rxport(priv, it)                                      \
+	for (struct ub960_rxport_iter it =                                    \
+		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
+				       UB960_ITER_ACTIVE_ONLY);               \
+	     it.nport < (priv)->hw_data->num_rxports;                         \
+	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
+						UB960_ITER_ACTIVE_ONLY))
+
+#define for_each_active_rxport_fpd4(priv, it)                                 \
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it)
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_rxport(priv, it) {
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
+	for_each_rxport(priv, it) {
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
+	for_each_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it) {
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
+	for_each_active_rxport(priv, it)
+		port_mask |= BIT(it.nport);
 
 	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
 	if (ret)
@@ -4403,9 +4413,9 @@ static int ub960_probe(struct i2c_client *client)
 			      msecs_to_jiffies(UB960_POLL_TIME_MS));
 
 #ifdef UB960_DEBUG_I2C_RX_ID
-	for (unsigned int i = 0; i < priv->hw_data->num_rxports; i++)
-		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
-			    (UB960_DEBUG_I2C_RX_ID + i) << 1, NULL);
+	for_each_rxport(priv, it)
+		ub960_write(priv, UB960_SR_I2C_RX_ID(it.nport),
+			    (UB960_DEBUG_I2C_RX_ID + it.nport) << 1, NULL);
 #endif
 
 	return 0;

-- 
2.48.1


