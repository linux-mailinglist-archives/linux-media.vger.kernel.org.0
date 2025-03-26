Return-Path: <linux-media+bounces-28772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2CA7155C
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D043BA639
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3421E521B;
	Wed, 26 Mar 2025 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FHSsPBzp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828251DB34C;
	Wed, 26 Mar 2025 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987431; cv=none; b=PDe92Jl4MhgIqhcdSdfizJintyGE4gYVOhJ8byoqdBU63tAJPp6rYurCWZkLdlQMWal6rfCyacI3qbPOZuPEGiCgt6BQQwyUWlWmVGw3imsrBdECIQLP8NptS7o0wSbnUsn81qCv6LsvcJrMIFxCuW+kiqO354oR/x8AlUyP8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987431; c=relaxed/simple;
	bh=qIwc/mCCkgIMzyAyWFhxe7hb7H6PsuoxUxDGrtcsi/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwjpNCXBLJqAWvbw8twUEGVn1KSdLjrz8yLNsfJ5wvPc28r6h7ycaDExkompsFuxGtkwyn+GzTq8VfpU30q692zOKXp8GLIxwYfzhITjciJ1iOcH3uWzbVHmeAXkxT5Tq9+HQrXk2lp5Z9XcaK5j0DMpjRsYb8Ai3noRZ5LeVnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FHSsPBzp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BB0111D9;
	Wed, 26 Mar 2025 12:08:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987309;
	bh=qIwc/mCCkgIMzyAyWFhxe7hb7H6PsuoxUxDGrtcsi/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FHSsPBzpYxQkT4Ux5BdjIS6aasGxcLBmRT5HqZwybaGjl68mY2vWHO7v5D8iNxReh
	 16cF5OG56HYqKX0PokySfyuOMSrZtWGnk6fCqvUjgRQcCve82ZVg9rdytV3TAyXvrK
	 s2aMjvyl9xK6hzHrIyvuFQ0pu8WAmnn8OSyemaR0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:27 +0200
Subject: [PATCH v2 05/15] media: rcar-csi2: Move rcar2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-5-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CRIEQOtju64AmJvXyl8j/Lzq5Bom9kqUAcb
 jvBkxvzPqSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkQAKCRD6PaqMvJYe
 9R/mD/9NvrjQbKkR1iSaRMVpTMdDjpSVteoFBZ+10Yuofv+AabORXen6WOTOMs0mkmhB7lKV5Kc
 GWZM6Okob3NqCcx4I1apQliVKAilrxtJcoSztZkLYmtOkwIn3UU41jMv+BVwPoU/kjnBBY+n6FJ
 3w9lV7RWXWTEE0jKj23FqjyqQR5zbGlLMrE6TKTSaGCHw1YRAxiwI2R6sogEFTybFyJ8JWn0Tnn
 gs6Hn9zhNgNYSuvcl1T2vnNQj8kfbx/uj88mHM23RAa10fgk9VRqEXNUEBFVM991U3joDp+x/4q
 cPoTs+alP4fKfcsqSBiE0C2vKz4gpm42OEAN7nbTtJCdx0zvgE1ZBV8NEkIbkA2xyKS9Aexp73Q
 FjctdxnUREvK8DolmaI4coZbpEZgiNVehXgrgl0qo3M0yTXU5s+oSlye35HBMLFOYpuOeairFSQ
 H+XDnu3z2Q3rkXdeA+7uhY+KVCQiemADePFkVpiQ8XGMnng6ptYQLmBmmvh9yS8Tb3gAOARZtnX
 fAWSFBWJ1eV7T+BlgZi+JUEl6INxaHfk7MAoEXyzrgiHXOlM22ev+4KaS258AoFfrHVfTFnDfaq
 /2Wokx2cuta2hNNasShJEE4IMjs/sn+RpQQSz1Adoo5HJZrlL64KFZ4JIZv0Vr8YxQKZu2rortK
 aYSqos4W+deMNGQ==
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


