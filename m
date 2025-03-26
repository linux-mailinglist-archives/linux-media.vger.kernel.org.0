Return-Path: <linux-media+bounces-28774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2CA7156A
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1FE41773F0
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B201EB9E2;
	Wed, 26 Mar 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nyhlDUeN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4B1E833C;
	Wed, 26 Mar 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987434; cv=none; b=Q8Z/4XcHlOwphOsIK5XdhpQl2ISWGWmUMfHMaxZVxf91hXKrWgyJytbC5xko71kI+Jt9FjbRknli5MC2Htsns4+5c4hIwWp2eHKTjokVjtn8u/hHuQj+kta/BVbhUR8GxRvDDv0RRJCA3cXrGCMGzmt0L3haXLTRB7mcD6BxRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987434; c=relaxed/simple;
	bh=wX8xnb5JJonq7MBfmlA0sa10fSG4A6We7UuS2Jc3MDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbzziODTt/gU3kQVHg3j5nyBGZXjZxfVniqGgMTm8MLKQDzlli59+/zkD6c5Y45esWh/lZjSb/dtYK+KX/ZmaobyLTPzA+GW6/y4q8t9q5q9Wo9swJ/REbMsmU24GI949vAb86CzXqCpIWR9XWKCBkfEFSrtxhBAXiiV3byCBxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nyhlDUeN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C85301934;
	Wed, 26 Mar 2025 12:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987311;
	bh=wX8xnb5JJonq7MBfmlA0sa10fSG4A6We7UuS2Jc3MDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nyhlDUeNFOZeJ10kXGd5n7SHA7DDGlAvDi6j89nWzKkvGkFANDklblux0jkYsXNTj
	 H6+RPFGmMUV/m9rT3r/QlCUXOXFWZBWD/RKndpWG/HBbSddaT0U0DOqwhjy35xTiyc
	 SIIBsE2o77Qhh8aSb651+XM6PMK7sCp67mIc0wVc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:29 +0200
Subject: [PATCH v2 07/15] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-7-d0d7002c641f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2872;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=wX8xnb5JJonq7MBfmlA0sa10fSG4A6We7UuS2Jc3MDg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CR9+GCX7j4ohWc8Pk0oEpf0NtOd8k0XhQIn
 DWfk68Yf/2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkQAKCRD6PaqMvJYe
 9ZTaEACQcaFwNXzoIxgYyXfdS3XLh+tYjSZ8zLpU6WFzYnFn9gk5FNzRlaxKlOSYnvU2vc1BXwJ
 iNB/NF61kMY2fzCVt1gDegkIqXpUoXO4C+KNnhqVGF6HbEac1RO83KrK1WAEgAhJ1jpIAf23RVf
 qPSrZ3ct7/TKFl1sPjXVMFkP/uSxox7hRTjjARkoOqldXFTwGEPSOgj9nSYhtfpahKc598hGGrv
 1IpSuMGKeKq84jZpAyGfRkh2bGWa9vQ5qNH63Wda0jgMC8aC9Re1DNuCjYGT/MOXCM5Gb/pazGt
 UvbpO/bcgl4EA7yoWONp/eZbU4ztMgy+5DFXXLn8DB1qWKkEneolUZzQQz1BsC3UvfHTMVm6DS4
 1AD3iO8VYIiEG1CAjL/yxJFzJI+ffsYImUPtLHpFXktvuehu9y7fUbM9W/QqJTwWyg5Q0orzhd/
 IBX48BOY1YjpoGJzJVgHRrAHSoqkCoEwPYKTKWsSymNmC9l41LS9508afj22gxQpL4XAE233uFO
 Gna0N6We5PMbMt4SddYcMp8kOVFMKsFemX4X+vJvglU3cAeXqGP3oucgd9trTzRaAfMwFuWiofO
 IrfjIVHSDCSmtdBPKDsHMm35fw0QEcu3Ok4JtGSb+Y7+c8PexkqIzF/PRbsqLP4iSMdLk99SEyY
 eUyR+GpCES1bn1w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With modern drivers supporting link-freq, we don't need to do any
calculations based on the bpp and number of lanes when figuring out the
link frequency. However, the code currently always runs code to get the
bpp and number of lanes.

Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
when querying the link-freq is not supported by the upstream subdevice.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 90973f3cba38..e0a0fd96459b 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1001,15 +1001,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
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
@@ -1017,28 +1012,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
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
+		struct v4l2_mbus_framefmt *fmt;
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


