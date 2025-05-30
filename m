Return-Path: <linux-media+bounces-33672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7BAC909F
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93530A27271
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C056B22F3B0;
	Fri, 30 May 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VUHkc98H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933A22DF84;
	Fri, 30 May 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613101; cv=none; b=o+ACLDyE9oQVK18K6cqATn3lyxbJiAonbx8F5gpcNDsvTFeq6PUPFzvyJSJr0xKuoc+vcwzYY+/SDBW1XNzTIK88VJraqQrnH91lN/xps8q6/3g8VvEWP0r62wuJjVc3hq1a2jxEgOmF46MT+FYIZvPiFVDc6gVLq2g2nXl6s0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613101; c=relaxed/simple;
	bh=qIwc/mCCkgIMzyAyWFhxe7hb7H6PsuoxUxDGrtcsi/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2JxlXK//vhCNGmnwdiYLI64EErl7nvtBw7dIXGw+dpopq7daza7WT8SzKgDnK935tP0grsOz1ljpt6Lsg9mgwLAglctTap8UNcThxR2bAw/NUnGXeH/BT4XDihBdEKI4R+iDufvnpnazKeSpIy88WZKuc2F4UKYFev3ST1IMLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VUHkc98H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3B1817C1;
	Fri, 30 May 2025 15:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613065;
	bh=qIwc/mCCkgIMzyAyWFhxe7hb7H6PsuoxUxDGrtcsi/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VUHkc98HWhed+vpIdhccuyuXTTcpC18AuIsBwIsd1ggKUXbx6NO6dKZVxW7Gt3NwU
	 PCHmBqM9hBXfN6Q5uKOQ3oWcVFS/1QN14E/Ud1jrxVhfpQLrK3ifA+yIh6C5QQEhut
	 nIwuB/O5Yjp3TfuE2oO6nBgMc7CYxYtsjZgIx0uM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:34 +0300
Subject: [PATCH v3 05/15] media: rcar-csi2: Move rcar2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-5-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2390;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=qIwc/mCCkgIMzyAyWFhxe7hb7H6PsuoxUxDGrtcsi/o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfctDcfT6hfgCPjTbCOG2kAa+pVLeecltsX5
 3qHdE0Vvs+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33AAKCRD6PaqMvJYe
 9XDiEACmN4VmeSBzigNfWRuYTc0vRTzvSEXZHFS05d5pIBuJp4Xk4iC1b4W+BpZ6U5THv3bxW/3
 ZsLXWV4/h43KCOxsszeTepREMBInrI8+3PD9lhuez/UytP8RtO42HM1lpljNkf4k1luZDC6Btgg
 vy7xS4ct6A8Qh/QVWoOOc6wmISR9Yong6a2CbqgnUjVSBZBbF3sxwgJi6b0Gk9Vti8in3sy5fOM
 vEFf2aqQTE5tsvkoz1Ph6Dg3JL/2GqgGvudOJSbjoLZRtzhzWLB1Wss/kvp5H6Md9jnID7ZFTlW
 l10mshfB7mrwGBznmpdvYfHxHI06cSTdaND5uTP1ekg2PsWNsQd67o7QhOiiPTW2EgFCTu67nUN
 JLwwUi5iLXw+lcA9LGJtUwH9h1yzfFytJgYU1lSOXYlpXGRMLU/+xX3KWjcx4Rl0keybCiPbqph
 bP96fEh8vgP5cHrQmw60IaLlzWMVpWy5U8DUBQU+VcU91CbjJHPhe7SimB0l5cCdzNwRfD3Ruff
 ddJC4tAyO6KTZ6BfpTUZ81RD7NoY97GhCvbzTemk95XKbV/XATj+E5iygD2J1zWDTZcXxy0FTN/
 RZ3CTpgNlAxvugAGFmsyHVUbvinKLAU83+IDPUNzbbpflh/m5WURp5RIKpeKCegypBx0yckaWAO
 pODVvuSvqfWMvsg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the function so that it can call rcsi2_get_active_lanes() in the
following patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 66 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 698eb0e60f32..8aca35096408 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -951,39 +951,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
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
-	/* Adjust for C-PHY, divide by 2.8. */
-	if (priv->cphy)
-		mbps = div_u64(mbps * 5, 14);
-
-	return mbps;
-}
-
 static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 				  unsigned int *lanes)
 {
@@ -1031,6 +998,39 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
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
+	/* Adjust for C-PHY, divide by 2.8. */
+	if (priv->cphy)
+		mbps = div_u64(mbps * 5, 14);
+
+	return mbps;
+}
+
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {

-- 
2.43.0


