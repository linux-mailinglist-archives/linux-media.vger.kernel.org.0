Return-Path: <linux-media+bounces-50764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E92D23D4C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF032300D405
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933AF334C3F;
	Thu, 15 Jan 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PLVma0cN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A767361DBE;
	Thu, 15 Jan 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471735; cv=none; b=OmrIot9nfw0ERbBagwnjNpPiX2IIEaHwiCzf3cw69SvAct9VsIaig7oKshSbek4jmDMKPU3fYIM6s6mCE6xiTNRHJLMx2/4dgF/ppBmYFpg0+Yn8qGVBMC6PgrZ/gLPO2yn7wfUj/L3Ed+OiVCTHq3tOrZCoHsyQZiIuI0+IB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471735; c=relaxed/simple;
	bh=NL9eNhiG2nuGrT5ZCLL8BloiD5r1HsSyMJQi7O2DGME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyK5n1dVyRx8U9gen9n6HBN+Q6NnfXgZkQSyStPi75odpIXZDDlbbHr3kbm5VtFzSDwY7fy0sv67ZFktzIiVj578SHgoPxeZ01aiLvZnn98OGJ0faxOPkIrMfnMXxaXYR38RQRuPqHMB9tMvHcUtGSn3ueNFEfY1CBTZGKi4NO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PLVma0cN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F58D28F9;
	Thu, 15 Jan 2026 11:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768471700;
	bh=NL9eNhiG2nuGrT5ZCLL8BloiD5r1HsSyMJQi7O2DGME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PLVma0cNUuoQ5hghKI2m8LskdrJnlfQPaQFCi8fDhpeijF3vzqlW3knnWS9foFRrK
	 muhwUq4sP3gX1CBP1qTIMhdXjig2snJTOLw7N8Cucn+rizGfS7psUVRapRLR7fTlXj
	 DPx7akITp4aJNlQkaIFsSyFGO6RXhBbT8asowHw8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 15 Jan 2026 12:07:01 +0200
Subject: [PATCH 5/5] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-rcar-streams-prep-1-v1-5-f87700926c11@ideasonboard.com>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2953;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=NL9eNhiG2nuGrT5ZCLL8BloiD5r1HsSyMJQi7O2DGME=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLyr7zKkqrSX+/2ZKNqUxCmfR7pLed9qOHq33
 cuj9kD9zJSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWi8qwAKCRD6PaqMvJYe
 9SfyD/0Y0rxmGTiAUyx+GUgohGw/0yeVAwxig+h0HHfII5ucUUo4s4xM+ZETju3sYGN3DGobj/0
 eKq+JUD24M7OxbepAItXISg5MsOBQdd2SDw87v1YbeQdEa9lrM18qx6WPy40s7n6Ct85XavI5vy
 5YhzOu36bGB4yqQ5BG3jrTmKgKXrjacJ84S0ZfuCKVA7ygHFv25aGlND2AKz0O14ItWCrdC4gcG
 EAFYBucVZjfJJpfcjRrAWfqMCelORty9D186I0c/YIpz41Jl1yqkkDwL37seEgEMyq1bdh4A6ud
 IxvT3cRp1ZnW55mMJUu6mPACA0RCycUnHOL44u/ct1C3jpw+OViRCfWZppiiBO1RxI2aYl2Mno0
 svAO6nKU5UImH0zkhAoZ7jHrdmXbs6ql/HByQOn8G3TUZMxqckZw7X6OYE7htEBTg9rAbZk/Cz5
 aAO18DW7pZ7/ER7ZUTovmafPgw/g+afFjEsVbVQUAvhi+oX0Zf2f24WuF0qucZR2Gt7E0szW4pp
 wEgnsupESPACNteo0hX2v9cDduy0nAKfFuO4mRgSjhDXGRmWZcFOTDToUglTfsl0ataLo9Gm8/7
 lBf4pRYV/hy1kc/mIPJ/pMpSAYwmMF6ic9gmFwh6Z/6KCEwR209/VLgWThNc+R8asfveSoqE88h
 3fpGbFsZq+3T9yw==
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


