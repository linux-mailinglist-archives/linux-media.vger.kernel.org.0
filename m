Return-Path: <linux-media+bounces-48897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0CCC3F15
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE279307C6D5
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC327347BCB;
	Tue, 16 Dec 2025 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MlSRp2dA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70B33D4F3;
	Tue, 16 Dec 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898356; cv=none; b=MCR4y5rcpymDSvBjkWTjVYR1xFKk2LB+N8ESKv84urfdNhSrROXtcWPU35AqeJyKTIIWtm1N+Z6azn5hKGGSM8Y+vdN771q9uFvp1fv6ieoVi46TZiUbX/tryudt7dyWHhWDLeGankhtF3s0IB6UYarDJX4O4Ifr18cDegyBc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898356; c=relaxed/simple;
	bh=oJTMzq1/AjVMQ8PbrqI2byVCzIoQUjjtUIKEjmzniEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zk0GyrYjPlB33hEqXbbtsZ7doTzAstMYHXh50Cua0asHjAjukTg6SWrlvRkLOfatCRYhO5KJi6NXw6Vq+zMw5NVfQahVlQbyel+wSv+a7boEfUtWmPNz7tRIEtP9rz6bGqfG5QGHs32P+41xQqvVpDQgSydXJCV8cKPOKKgmCzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MlSRp2dA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D597A11EF;
	Tue, 16 Dec 2025 16:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898342;
	bh=oJTMzq1/AjVMQ8PbrqI2byVCzIoQUjjtUIKEjmzniEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MlSRp2dAc66xujn3Xc5tbAoPpCSdWNTlpKWZjl+DN9xE8jtrUMByRNqfAgDtmWR8Q
	 XkwydvtoGehOMUdq6iYFeUvnODBX3SU7pG+UIUPeg5IV+CGXeYzaZ/vRJkJjBCsn2P
	 LsMKMGPbRvI1pG8p4vCMMHnrywFBR5Hvk0Y8EcRQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:20 +0200
Subject: [PATCH v4 03/15] media: rcar-csi2: Move rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251216-rcar-streams-v4-3-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=oJTMzq1/AjVMQ8PbrqI2byVCzIoQUjjtUIKEjmzniEU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhjcfJYxlxouDjt0jTrZVqKPKUTTHnGRbe5q
 azFVysG0H6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4YwAKCRD6PaqMvJYe
 9SGlEACjKpoEnw5joRmdVTHRYQUWmRgIo1j0JlNyzZiXoLC7g4uAS5JWQc6H7TuC9dwjKf2RplA
 RarVjHJht6vZ6kkW2CTesYMHfsAYfDnmW/TMUdLiiLoIMCUZ2pTOWCrLNE3fQLzS9PbrVyxytsA
 yVGRF2QMgQTE17jUZq2aslui6Fp8brXMTsn0TYgCSpbxWCsC0T5FkywlxM6mXtcSicpv4ZLpmWr
 32uJSMgTGqj3Mm5fsZTAcuH6qr/GL2Cs8uOYURWDRMHI1PhtgcmcOAl95mG+ON5rOO7Cfc2umLD
 oMk5RBCIBaRJ+X7w/HrgT347bMnEJUy9vvECHIPUnyFK0gV/5wUtYWwUc6QEpudROSqRARKU/nz
 yxyqhJpQuD63514YK476+T6T08VjOsvA5Dja5L6lviv+KeORKUyN9eD6xvNQcW6LxmmoLBxkr1/
 9vBt+MNX9O2p7RnHmZ9QC2IboF9FHbZgOCW4fif7TJ+TnjiqDsz4FzpdYmxawI0IlTi11MrWAp8
 DQBKALvnDctU4GLdEz/RwFeDkSykEfSoZwkmWX5h+mXqcDfbtlHwie9TYqohfWRudmKzvQKe4Bs
 c1G7xxcY4ZO8cjejJSVQSdUz3YEBVc4hYQgnBoSNZvj7KdK2oOzSk1G8wI18bjqIn+Gyl+RN6Zf
 Pw2AKuKOLPRFNxA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the function so that it can call rcsi2_get_active_lanes() in the
following patch.

No functional change intended.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 58 +++++++++++++++---------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 3cd35adb6803..8032fa4f7a8a 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -956,35 +956,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
-{
-	struct media_pad *remote_pad;
-	struct v4l2_subdev *source;
-	s64 freq;
-	u64 mbps;
-
-	if (!priv->remote)
-		return -ENODEV;
-
-	source = priv->remote;
-	remote_pad = &source->entity.pads[priv->remote_pad];
-
-	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
-	if (freq < 0) {
-		int ret = (int)freq;
-
-		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
-			source->name, ret);
-
-		return ret;
-	}
-
-	mbps = div_u64(freq * 2, MEGA);
-
-	return mbps;
-}
-
 static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 				  unsigned int *lanes)
 {
@@ -1032,6 +1003,35 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
+			   unsigned int lanes)
+{
+	struct media_pad *remote_pad;
+	struct v4l2_subdev *source;
+	s64 freq;
+	u64 mbps;
+
+	if (!priv->remote)
+		return -ENODEV;
+
+	source = priv->remote;
+	remote_pad = &source->entity.pads[priv->remote_pad];
+
+	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
+	if (freq < 0) {
+		int ret = (int)freq;
+
+		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
+			source->name, ret);
+
+		return ret;
+	}
+
+	mbps = div_u64(freq * 2, MEGA);
+
+	return mbps;
+}
+
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {

-- 
2.43.0


