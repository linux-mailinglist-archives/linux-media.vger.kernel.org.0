Return-Path: <linux-media+bounces-48899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC2CC434E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 17:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92437304D21B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5EF34E747;
	Tue, 16 Dec 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vSolm9hy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CED34D916;
	Tue, 16 Dec 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898359; cv=none; b=IkS8lHfT7B8rMMFdyeC2dQt6blyueaUbkawZ7ZlhvQz0py4qSLGhH8dylkZ5GRb90mqMrCca/Tfif6+kowWwAPS0H+o/JS9qWdy2Kcv/tjoUyjvtjRvl3SA8AU5//c8SdY/BDyWCiB8MNOiUZ5H7+m9p2rBzDGDVHU4eZZfZ8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898359; c=relaxed/simple;
	bh=NL9eNhiG2nuGrT5ZCLL8BloiD5r1HsSyMJQi7O2DGME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQy+Qx1FdPY1q/U6GZknTBifqizmLaI3KWnSn/H8NY9xM0r2vygBFTIJQOT7zDRXD5AXipFFbpIJZWIeithsawX7TghyQdgGauFBD9qF1nfF3EL2LUF74/TM5NpwhsE5Y2nFLrWhmdxPBiMxBf4/TuScbT/ZzI6TPnhvu9gR7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vSolm9hy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FB071449;
	Tue, 16 Dec 2025 16:19:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898343;
	bh=NL9eNhiG2nuGrT5ZCLL8BloiD5r1HsSyMJQi7O2DGME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vSolm9hyI/rCTxNzjN7i9EIXWeLBgH12ocNwqVn5Kqi27h6ufvjCPryzPVlIEW2Cp
	 jeFrL1806xxl96gCE8Z0a4zQJXA9ci++lUBH03uhUYUUpEcZDA4QySM4jM1re7TI8N
	 W0ZU9fsFl5wZNnY8kTBJLKlMKOd2EcfiriZ4ly4g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:22 +0200
Subject: [PATCH v4 05/15] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-5-f28b4831cc67@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2953;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=NL9eNhiG2nuGrT5ZCLL8BloiD5r1HsSyMJQi7O2DGME=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhkhowJ7KiEjs9aotzL0mwEdH1J1i4K1thDi
 DfvWyBXFpaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZAAKCRD6PaqMvJYe
 9XtrD/9q4JipqUq9il0Zt1YBb4SorY3h/H9wVCZk3VflvVCb5x8/IwMIsfPKu94ijcHC+DP5egK
 Q2TztKZECoMNo7KNW4enLhpDPW2x/qQCYVfuvAq3mSy5OnksmYghD7hGuRKXIIYjZWHsXXkv6a1
 NPhevO7a8r6wAmwGLRTxyttqwZ0io56pa5uI6wj8hCiZDKNZEFz60em6MmwEmZGITLohbc0umCG
 KtX01J7XkChZfJdfKet02VTqi0S7W7MAiAjQlVMxrs1iNBYJlGgwP9SUuEfghbeKaFNsb+2om22
 y+aKu2GyVVUdHeR3EvvhxttqMvvkdRvjBa2LFwFPtkVYDRYVQn4y5E7rbVZDOnQ0e3Xbgau3PV1
 lThR2ca847xsx8bfnexLEB+V1yZt2FwRMokrbofm5NQy7yvyjT4g90ozCMJ5BbMH8k9A+f2gqCl
 amyRyrHl4+mbpVCt8cCmKjt0975OD8WvmRSIAWZVAUFmmPZoheDLJ2FCfZD5QEQVWrfJl5YS6BN
 wXe7an6Q9fBiEnuOnJm4us0aX+BsKU7eIMOtOPq6tiv0vsdgvN+wPs2PiUnKgbuYwzkqRD3+3fZ
 ZNc0vT7x26GtrmFXdFE8nU3tO/3ttIlw8iftpiqT8NTqH/aUq5wfdAh90VI+tl3OsX13KxeqKSu
 juLZjJZT/E4fE0w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With modern drivers supporting link-freq, we don't need to do any
calculations based on the bpp and number of lanes when figuring out the
link frequency. However, the code currently always runs code to get the
bpp and number of lanes.

Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
when querying the link-freq is not supported by the upstream subdevice.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index a2a87c5bfd7c..7305cc4a04cb 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1006,15 +1006,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 			   struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	struct v4l2_mbus_framefmt *fmt;
 	struct media_pad *remote_pad;
 	struct v4l2_subdev *source;
-	unsigned int lanes;
-	unsigned int bpp;
 	s64 freq;
 	u64 mbps;
-	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1022,28 +1017,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 	source = priv->remote;
 	remote_pad = &source->entity.pads[priv->remote_pad];
 
-	ret = rcsi2_get_active_lanes(priv, &lanes);
-	if (ret)
-		return ret;
+	/*
+	 * First try to get the real link freq. If that fails, try the heuristic
+	 * method with bpp and lanes (but that only works for one route).
+	 */
+	freq = v4l2_get_link_freq(remote_pad, 0, 0);
+	if (freq < 0) {
+		const struct rcar_csi2_format *format;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int lanes;
+		unsigned int bpp;
+		int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
-	if (!fmt)
-		return -EINVAL;
+		ret = rcsi2_get_active_lanes(priv, &lanes);
+		if (ret)
+			return ret;
 
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		if (!fmt)
+			return -EINVAL;
 
-	bpp = format->bpp;
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
 
-	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
-	if (freq < 0) {
-		int ret = (int)freq;
+		bpp = format->bpp;
 
-		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
-			source->name, ret);
+		freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
+		if (freq < 0) {
+			int ret = (int)freq;
 
-		return ret;
+			dev_err(priv->dev, "failed to get link freq for %s: %d\n",
+				source->name, ret);
+
+			return ret;
+		}
 	}
 
 	mbps = div_u64(freq * 2, MEGA);

-- 
2.43.0


