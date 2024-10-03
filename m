Return-Path: <linux-media+bounces-19049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196E98F02D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 15:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA15E1F21F45
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8588D19B3EC;
	Thu,  3 Oct 2024 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/68iiWB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB5199929;
	Thu,  3 Oct 2024 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961415; cv=none; b=GFq9zJh1X13+0fLy3OZUg0QWDN24bncPwhqKCPgrm1kIP8Nw9CZyTZqEcc30raAw/u/0zrOcLYOk/TrswjULXMyZQRUFSxj9nVYEXwPGwSq58c8R5aoSGe8t/oIRUiGS91imW2BcK8MGDN284oJvkQEa9wdKYi5ujvAzH+/4enc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961415; c=relaxed/simple;
	bh=soH+u4II1QUckYu7sPWuE5e9cSuPAG2SEtdTn8iTT3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPe4o0MWiA5U0NURTcNZGmGgyfby2SDkpIPOi/eh4TdGWDYZMVQC6DigpkYm0gT1dCBwxHMBTyb4GFF6Tnf+SUBqcwOMxSyDavp+YGeZHstOQH1X/bJ18qBrPg+G1N6QI70+LqPgfn05r3rBtfZmEhwtwuvWYmXfAIo1Os+/O/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/68iiWB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a90349aa7e5so133159866b.0;
        Thu, 03 Oct 2024 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727961411; x=1728566211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rIfO1z+/fu5QTA1LsC8pkp6hGHm7/hrwtqpOr7VZ4Q=;
        b=F/68iiWBuOI1wnCFMCF+aD5QTJNfs2vXICRiVbyvxWsSM507UNImNyxqWRf4U6nj/x
         J0kXf1xNiXzb6JqEP8lDQPWlXX08EKFhMWV/JGG35qbc7z3qHqFWPCboWDXakEOni1v+
         KsvO7OHOF2BjBsszYlFmq79Nxx1b5TBOdY7kKA69wTpqTwsoCg3nDoeeIJjUhmII5gn7
         xY4DpU+MdsyxoHyB/VDTsuYv2EkW4PpxIadfMlRoaCTJVYvpZhAFZHo12Bht8mw5oTel
         n+w4JcSV94yRguNGgH19VGY2SvVl/JMtRbwao2q2nLeUVaIG9lRmV+Swinc8rv4PRAHm
         JDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727961411; x=1728566211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rIfO1z+/fu5QTA1LsC8pkp6hGHm7/hrwtqpOr7VZ4Q=;
        b=KnVO7fAyYvyjX/uPV7rQzcykRmGiEZqYLeGPXR9/BlQE6gTji2VZirw98HvAFsgVmJ
         ojctMukdaq469K0One5udxpT+Ug+AxyNf9LFHc5LQBvHcAhPLqiOo5Y/RDrheBd5fG10
         ZYpH4KaN6+2DCw2LvUe6E0UJrIRCVRNgydoXb6RPEWNz7BJPK9z9xOe3lBSpQpbwBRMC
         IZ5CKLxJAtz2r8nnAwGvkJ45wN0QcXsRJP5gzQ5z5W0mDtEnwDRmyqSj5qN9NCzP23XC
         NlT1aWYxnyVSHpzRMI4Wv4eKdOl4NqVBSBBH782AgichcEjBa7eb5wK1GdxsNU8QEDD4
         53wg==
X-Forwarded-Encrypted: i=1; AJvYcCVBEYPxqXvsGwno3XxkCcp6smuUUwKzzypFLo2Velmk0SDIuMgg1UeEp43NI0RAVknPcXY1WUj0e1l2u1w=@vger.kernel.org, AJvYcCVsVcU3sn5St0jeYbxw7S2ILY4LQujchg5UZ3vfEcOeyTxaBTUxP+fOTC1jGUObFaTO9aSsnOlrg0ILRZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWyX8t4hb5GW4L+K3sHK9d0e4WdR/jwtMDen5rclkUk33OBor
	/fo6EqUixEbO6bs7hspxIm4cEEc0CcJwlxnwScRTbrUpdcBeViNL2Z6Apg==
X-Google-Smtp-Source: AGHT+IEKiecDkwki6H7iVGaVC7EFMpsLS5Bunq1/tt63EDLn0AZKfSJZt4/T36O/ikvGjyyQCHNZAA==
X-Received: by 2002:a17:907:7288:b0:a8d:6073:2c13 with SMTP id a640c23a62f3a-a98f825a9a5mr601470966b.33.1727961411196;
        Thu, 03 Oct 2024 06:16:51 -0700 (PDT)
Received: from demon-pc.localdomain ([79.119.121.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910285a22sm85603466b.54.2024.10.03.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 06:16:50 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2] media: i2c: ds90ub960: clarify stream_enable_mask indexing
Date: Thu,  3 Oct 2024 16:16:26 +0300
Message-ID: <20241003131628.926923-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variables containing port numbers are used to index arrays which should
be indexed by pad numbers.

Coincidentally, the order in which pad numbers are assigned makes it
avoid any conflicts, but it's still confusing.

Clarify the situation by adding port_to_pad helpers and using them.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/ds90ub960.c | 41 +++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f86476..d1595c88f7632 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -527,6 +527,7 @@ struct ub960_data {
 
 	u8 stored_fwd_ctl;
 
+	/* Indexed by pad number */
 	u64 stream_enable_mask[UB960_MAX_NPORTS];
 
 	/* These are common to all ports */
@@ -561,6 +562,16 @@ static inline unsigned int ub960_pad_to_port(struct ub960_data *priv, u32 pad)
 		return pad - priv->hw_data->num_rxports;
 }
 
+static inline unsigned int ub960_rxport_to_pad(struct ub960_data *priv, u32 port)
+{
+	return port;
+}
+
+static inline unsigned int ub960_txport_to_pad(struct ub960_data *priv, u32 port)
+{
+	return port + priv->hw_data->num_rxports;
+}
+
 struct ub960_format_info {
 	u32 code;
 	u32 bpp;
@@ -2558,6 +2569,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 	struct device *dev = &priv->client->dev;
+	/* Indexed by rx port number */
 	u64 sink_streams[UB960_MAX_RX_NPORTS] = {};
 	struct v4l2_subdev_route *route;
 	unsigned int failed_port;
@@ -2595,11 +2607,13 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+		unsigned int sink_pad = ub960_rxport_to_pad(priv, nport);
+
 		if (!sink_streams[nport])
 			continue;
 
 		/* Enable the RX port if not yet enabled */
-		if (!priv->stream_enable_mask[nport]) {
+		if (!priv->stream_enable_mask[sink_pad]) {
 			ret = ub960_enable_rx_port(priv, nport);
 			if (ret) {
 				failed_port = nport;
@@ -2607,7 +2621,7 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 			}
 		}
 
-		priv->stream_enable_mask[nport] |= sink_streams[nport];
+		priv->stream_enable_mask[sink_pad] |= sink_streams[nport];
 
 		dev_dbg(dev, "enable RX port %u streams %#llx\n", nport,
 			sink_streams[nport]);
@@ -2617,9 +2631,9 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 			priv->rxports[nport]->source.pad,
 			sink_streams[nport]);
 		if (ret) {
-			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
+			priv->stream_enable_mask[sink_pad] &= ~sink_streams[nport];
 
-			if (!priv->stream_enable_mask[nport])
+			if (!priv->stream_enable_mask[sink_pad])
 				ub960_disable_rx_port(priv, nport);
 
 			failed_port = nport;
@@ -2633,6 +2647,8 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 
 err:
 	for (nport = 0; nport < failed_port; nport++) {
+		unsigned int sink_pad = ub960_rxport_to_pad(priv, nport);
+
 		if (!sink_streams[nport])
 			continue;
 
@@ -2646,10 +2662,10 @@ static int ub960_enable_streams(struct v4l2_subdev *sd,
 		if (ret)
 			dev_err(dev, "Failed to disable streams: %d\n", ret);
 
-		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
+		priv->stream_enable_mask[sink_pad] &= ~sink_streams[nport];
 
 		/* Disable RX port if no active streams */
-		if (!priv->stream_enable_mask[nport])
+		if (!priv->stream_enable_mask[sink_pad])
 			ub960_disable_rx_port(priv, nport);
 	}
 
@@ -2689,6 +2705,8 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 	}
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+		unsigned int sink_pad = ub960_rxport_to_pad(priv, nport);
+
 		if (!sink_streams[nport])
 			continue;
 
@@ -2702,10 +2720,10 @@ static int ub960_disable_streams(struct v4l2_subdev *sd,
 		if (ret)
 			dev_err(dev, "Failed to disable streams: %d\n", ret);
 
-		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
+		priv->stream_enable_mask[sink_pad] &= ~sink_streams[nport];
 
 		/* Disable RX port if no active streams */
-		if (!priv->stream_enable_mask[nport])
+		if (!priv->stream_enable_mask[sink_pad])
 			ub960_disable_rx_port(priv, nport);
 	}
 
@@ -3460,6 +3478,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
 	priv->strobe.manual = fwnode_property_read_bool(links_fwnode, "ti,manual-strobe");
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+		unsigned int pad = ub960_rxport_to_pad(priv, nport);
 		struct fwnode_handle *link_fwnode;
 		struct fwnode_handle *ep_fwnode;
 
@@ -3468,7 +3487,7 @@ static int ub960_parse_dt_rxports(struct ub960_data *priv)
 			continue;
 
 		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-							    nport, 0, 0);
+							    pad, 0, 0);
 		if (!ep_fwnode) {
 			fwnode_handle_put(link_fwnode);
 			continue;
@@ -3503,11 +3522,11 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
 	int ret;
 
 	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
-		unsigned int port = nport + priv->hw_data->num_rxports;
+		unsigned int pad = ub960_txport_to_pad(priv, nport);
 		struct fwnode_handle *ep_fwnode;
 
 		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-							    port, 0, 0);
+							    pad, 0, 0);
 		if (!ep_fwnode)
 			continue;
 
-- 
2.46.1


