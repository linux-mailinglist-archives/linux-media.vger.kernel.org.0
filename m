Return-Path: <linux-media+bounces-19006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D098E11E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 18:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCDA5B23B40
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 16:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5CA1D0E3C;
	Wed,  2 Oct 2024 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3CghJw0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8102564;
	Wed,  2 Oct 2024 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727887449; cv=none; b=f+RqqdAxbXApBm70Bw6U1qqPCfUgMJHraBLAnB09y4mi/+EGCVjOSjPnUKefDwM2/qWRdWVpqZylD+yS1o4leNwWWM2XcrtgJQvr+NBX/IJHD8oZ7rvwaHio4u2VUez6RbjX3qgeAnvb30jVdoo+SqByPamMrdVTQ0rSl7BNQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727887449; c=relaxed/simple;
	bh=w/eK9QXRSmO3sKXIieyQ+EBUhoyHMjiI+u5Dpjjv53c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMlYBf9G01Y5gGNaG1ZlewjiHITc7E0ZQT1Xh+2mffel2w9Bp2Kejgvv3qdm0wfSjN7pFFFgFm87rnfm+7we1G76iajaNyX5yv+Y92wPZlittyHaB/peTBjkhRSouywtgTfy+d3GaBeLf9pHKCQlBVpg5JSQjpYZKkzZS39CP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3CghJw0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so63616885e9.1;
        Wed, 02 Oct 2024 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727887446; x=1728492246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Swtlu5FKJnmla/VpUj7gtrQFFdG+HR/GaiOjw03KglA=;
        b=k3CghJw0vTLVxd/WhKJ1V3FkYeue6V6YbDGQDHD5TneNILertLqEXtTbl4VEE9oToH
         ttKLc/+vUYkWCG58gQR9h1fnswT+tHJPxsWr9HWDdwFGwNiO8dBu0TWQf8m/FdKjQaKI
         v6C+GJqLefzNLFE/1qKmqjRlRlN6uP5WDk/mBMdHAtfn8ajuyz0Ti+I9+75KIrR10UL1
         Svv+WtEgMs766Fnk3pH/0sGnK9wGeNDmYJ4slwPI+PzeLTH2wAaw8S620W9Dt7YfGIna
         hYp5WQD2x7HbXJsKGb9IoOf6N2/G+DkrA2WTNkss9h+zeMxntzHYqMetijmlXlEZnFtr
         vazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727887446; x=1728492246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Swtlu5FKJnmla/VpUj7gtrQFFdG+HR/GaiOjw03KglA=;
        b=VRQpttjko5cDeoz39OFpkY4CKSvw5sqCHGcAE59ejiHv4xzhR5VQHJot6eNzQbxfmE
         SjbHIb0HUjxu8P0A3cgu8kGnVHblKIqoTHrUZ86KIYMRlLdAc7S6ovOpAQQ0ohmMZvpI
         1bTa5c0O+qB9FMqvdNggADhLMcVw/AnOMWlbWBFY3s5MgrDz7K9zoxK3k5TZs9LXga9J
         2ivUiYYMLZbk9/pDKwzV510MYxzBUS7hS/CHtT1AhLbgk7qEG81wzIh+bQEaJf1p9t54
         VRFlgEFVkfoeTD7IcJVwrEeUpOv0aZ/HBVDvSJ0ejf9H+TAyGjRJ6LqRMvum/Gd7yjia
         tPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEc1lrKJ+qri6K7wzqC2nK/dsz9IidgPU5LpvAo1l1IHQ6xi6W1GV3JwtrzvMdmSRyl3D7TVxyMjAW1+E=@vger.kernel.org, AJvYcCUPRGdgqXCsj41bibw4zGeJuo9nPfu6vAiFC3bAdNJu9xmvLsligrmpWWgFghZlzcwIrZMKiln86F8xJIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRF8NnL9xT11Pa20mLlugZwFfQL6o0v7VL8Cvzb+Y8tHu2AO4Y
	R7W15clOOPePMElrQaxrPz7zCtYGuuWG3LQfgiOshYDlBKRuqwikMCyJSA==
X-Google-Smtp-Source: AGHT+IEpWC1+9ophD00uk//1MQqw/GkjtRdQ9SZGrLnSWK6F/9IxRsZF3IYzaw6KzL3tfY/IE5uuzg==
X-Received: by 2002:a05:600c:4686:b0:426:627e:37af with SMTP id 5b1f17b1804b1-42f777b24bcmr28751735e9.3.1727887445917;
        Wed, 02 Oct 2024 09:44:05 -0700 (PDT)
Received: from demon-pc.localdomain ([79.119.121.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730fbbsm14397383f8f.77.2024.10.02.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 09:44:05 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] media: i2c: ub960: clarify stream_enable_mask indexing
Date: Wed,  2 Oct 2024 19:43:45 +0300
Message-ID: <20241002164347.899083-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variables containing port numbers are used to index
arrays which should be indexed by pad numbers.
Coincidentally, the order in which pad numbers are
assigned makes it avoid any conflicts, but it's still
confusing.

Clarify the situation by adding port_to_pad helpers
and using them.

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


