Return-Path: <linux-media+bounces-50763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A470ED23D43
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C36D33024255
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CB0361DA3;
	Thu, 15 Jan 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tl0aBZLZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBB3612F1;
	Thu, 15 Jan 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471732; cv=none; b=jfx0dNyOz4RsiH1zpQvJb8v3qnSRb3T1kUvOM7vw6ihvUpg+Mjp9DLgoTLtnsEx74+LXZ0ExSSs6sbMuLuyYOGV8o0PkpJCQKQ+GoDdqBd8vgCYZNu9am0/g2xSMuY8xGOLY4pTGC2+06brjYpHz4I/r+fEH9pOIobIfbxfwjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471732; c=relaxed/simple;
	bh=oJTMzq1/AjVMQ8PbrqI2byVCzIoQUjjtUIKEjmzniEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myltZv1QloXBMpoQDBLVVjN9RhKzQR8iIEVIEJKXOADK/xqFkLkrAM1EwcI5jFDGdMwdaBu0GEyc1+SFQD6RptkiEh0/CtNWbUSYAMtKVnQuKVb+u9aHuzkev2rPE4Eggxe+A7cHZEwJpC3b5lPiEav9BCcjd6agvmZzg5fw1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tl0aBZLZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8BE728F5;
	Thu, 15 Jan 2026 11:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768471699;
	bh=oJTMzq1/AjVMQ8PbrqI2byVCzIoQUjjtUIKEjmzniEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tl0aBZLZVm+X7rNcZf4tFmrTMQS9Tc+DAP1UWflRiqi5uJewdSbEQ5dp7Fq+NDYGN
	 mpnfnpaDCQNR+yMds1Kuef9H5Ns606oztkZ8v4VNR+WKQGa0YhnQQsZwJh5CYMyZIa
	 Jh9vc/uOBI0FgzTmgco7eLvFphnmC56aIfFWBuEM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 15 Jan 2026 12:06:59 +0200
Subject: [PATCH 3/5] media: rcar-csi2: Move rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260115-rcar-streams-prep-1-v1-3-f87700926c11@ideasonboard.com>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
In-Reply-To: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=oJTMzq1/AjVMQ8PbrqI2byVCzIoQUjjtUIKEjmzniEU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLyqEa1KfRPmOM1br6Ps7xj8XBKbyZTvJ9pmW
 k9qK/kipJGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWi8qgAKCRD6PaqMvJYe
 9aYyD/oDJ3euuXmXCt2bZKc+vvqnmqT3yu2xlY9cR/Q/Fc5dh8Q/WMy0Tqw6PqgH8iUuvVdUEt/
 M1zoSDRu22LZDximQ07SC77IYsuDBJRTKK0cBubqdp3qjOPw/dq6JhyVYvn2qBrCzhA1H3dM7dk
 nmb7+4uUli3iRWPtgUQMuVvPycGweBWD8yR2Elp34HftwmMLIoW/JOQvLgKWmRPgAp4ssNPD/bV
 KlYC+BlZyVs8pmcnSncctqhAxJYPhJOiwp9/r7Kes2CucPKHJ/kCDxWENvrcLkfiT0zRNFsGR7F
 8oLbbYbx4fptqqmNKavtHcXU/3b8an4j54/FLoYUDG3sYSP8VhBbKOMZnorbfjWtXLTQ1YAuZ2z
 eqbrQRBpoqj8SC8hlKrOK5bfXNrJppAeZ9eFThUhvKSlDT/i9m1qVlNozNlavIBkN6XGT46TqSw
 BGhKQF3f/HHsUyVqUsuZ7YKhz+tPL5Bjf8CyVPqK1FZTUPeEZbPoYuq/AigD07Z9jKTbD/4TxYW
 F/ogBFa60wSyj15w70H9E/y8FvZyRWsM2SMPQ7//2F/wGmqhYpHmCyd5Wr1yvbPpzShGX5+taKi
 RyAtS+SroBibZY6qSfRhaKAg1zNssFtReTRCnDvnzq4UANDbIHWisuw1rK0037IsfsKob/YN3fj
 BZrn+Nffm4LL7hQ==
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


