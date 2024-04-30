Return-Path: <linux-media+bounces-10427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E48B6FCC
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4B31C21A3D
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CF012C490;
	Tue, 30 Apr 2024 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tychqfqf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72CE12C461;
	Tue, 30 Apr 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473619; cv=none; b=FBsvgSyvDlziYwEsZbaCmgRQxJ1AHVtE1N1aw5UWkfRiLfsHL2mJpfp9ZL6pWHVOrCuvqilJc3s9l2JP0YJXNooH/k7Q3Z5r0AYNeOErj5HABFIfn0Fnxfqif5wSOsmyYlLWVIFOKurZG4sjW6EXRB/JY8sxPZ0z00tHVh2JXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473619; c=relaxed/simple;
	bh=ui49580PtOSxa8zyrBcON9gZ59ipoxzdHjTGl4OK2N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whoj4jfT0XQfaN0kAuaJNSwYDGBqa10s6+VG08ErNtT0AdDIVsyo5KZfb5Qbi/6Vcm1F3W/NMJea7Zf6S6geBguc7Naz4ipLrrWFJZgPkKQc3Pl8zY9Gf6Qz+ZT4bzuCW9qPhHdqYZIysyFXLcVl1/j1x6pXlXPr2JyYMZwFSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tychqfqf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E66E2E45;
	Tue, 30 Apr 2024 12:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473557;
	bh=ui49580PtOSxa8zyrBcON9gZ59ipoxzdHjTGl4OK2N0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tychqfqf09SczTYVasRVGRL8aXgMlHnQbnTzBbHA0YX3ZOU90XP3iep/tVtu5UIgC
	 Qi/DIqLWxFI2HFZyGZ3OsVh518zr+CafSn3FJV+5W5qExlvo/M4iXc08Q2lbL5gTEA
	 2Al/hWbEA6KSBpCOwxxeGTIn77Q/aX1yajaSxMqU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 03/19] media: adv748x: Use V4L2 streams
Date: Tue, 30 Apr 2024 12:39:39 +0200
Message-ID: <20240430103956.60190-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize the CSI-2 subdevice with the V4L2_SUBDEV_FL_STREAMS flag
and initialize a simple routing table by implementing the .init_state()
operation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 28 ++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 60bf1dc0f58b..d929db7e8ef2 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -59,7 +59,30 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
 
 /* -----------------------------------------------------------------------------
  * v4l2_subdev_internal_ops
- *
+ */
+
+static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = ADV748X_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = ADV748X_CSI2_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing(sd, state, &routing);
+}
+
+/*
  * We use the internal registered operation to be able to ensure that our
  * incremental subdevices (not connected in the forward path) can be registered
  * against the resulting video path and media device.
@@ -109,6 +132,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
 }
 
 static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
+	.init_state = adv748x_csi2_init_state,
 	.registered = adv748x_csi2_registered,
 };
 
@@ -245,7 +269,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 		return 0;
 
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
-			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
+			    MEDIA_ENT_F_VID_IF_BRIDGE, V4L2_SUBDEV_FL_STREAMS,
 			    is_txa(tx) ? "txa" : "txb");
 
 	/* Register internal ops for incremental subdev registration */
-- 
2.44.0


