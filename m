Return-Path: <linux-media+bounces-33673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD4AC90A4
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F16C71BC7411
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FE722FE0C;
	Fri, 30 May 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n+NrvRvP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820EE22F177;
	Fri, 30 May 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613103; cv=none; b=GKN7ujo7terrlS1s+0Ys2+nWOiyjLdhdU1y1SiPLetFG25DpGPuYe7UyirHB3Y18l7QMdDvXYBnNbAd8PtY1Dmo462iCH3nViNupkvnXmQhB8pIsELHL5rzGtC24oAae6hJ1/a3RspX2sWDAbdS0VNSI8/nAWrplepg050ApDug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613103; c=relaxed/simple;
	bh=f9Zu08iRKcpOonJQPT1z5w861yw0MT1qatoa5Fhmp1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2XM/cV+FaThyuYKN7esCu613aIDmjJMkOfJRDhIjH7/waaMiE2PHzBFkjM4XLs8kZR/r9D/dJtKbtHuBCRTetyo0qgvJ39HMTJnU16ZNMh560nq3u/3dftERmE2fN5SXsNFZv+7YE9LGhGF56aHr2ZbX40GnMd+IxdAFCCgKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n+NrvRvP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7903918B9;
	Fri, 30 May 2025 15:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613066;
	bh=f9Zu08iRKcpOonJQPT1z5w861yw0MT1qatoa5Fhmp1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n+NrvRvPFHrs2RxiCfukHYWAgrkAw5dlXignOfRYlDHhmOEeYve7xqOQbtWOTJKgx
	 0TO0VN8oReqPeeDGgeAP3LpJBf7+pePxXzBpQAdum/CfKoaApftxx4bE+eqOLgkivJ
	 r3RwHbDvpPvmILEVqDVzRmSdsNkbELdGYL9LlSF0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:35 +0300
Subject: [PATCH v3 06/15] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-6-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3595;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=f9Zu08iRKcpOonJQPT1z5w861yw0MT1qatoa5Fhmp1w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfcPSkp3vyJSwbTde2dwYrlWJfHsNOBgz5yX
 c8Ovq/E/dGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33AAKCRD6PaqMvJYe
 9TLuD/0T+gn4n8w5SPNtPddeWlQzF+0598QNlON16oJCj2ksX5gaJ42JSyuUV5EVvhlZq1v4wny
 LPnmFlTS6X1kn4tTHHWw0weslcv5/ChXCmwsGxvPkU4MxoI2XJGs7tvXavUKUik3us+nJ1FdKhE
 tU1smuiXdcBsFkXTRenffZSkM4fMYfez2o9fhNcERPUjZiClfNRxTfRh5nbQcjPxAGNyn1N0ZLU
 MiWtouyw1KU4W4MGNFkOI2TmImyPNvsLV8LwM9mUb5+ltL31xB25hrSzNWVq0QDg6+OlMOXCl4d
 mKqSbgz3N82fit7YWL/ek29SriTGHfHyr3OTMzmGd1xzJvGuNhQaLQDPDlJ6Gwv4XMYwOH6l/Nj
 LKHfcmNFW7ahfdyBqCXZbCJ3J0CqCc/Wzren2rAq2rAL/mWgPzjl7uesMsAh7F39hj26a7vF7mo
 iKSDLNnaJaZUNXKFgecjGKEwqk1Jm9iRSYV73V+sdTpxazro1CKxP6LTDylzKtECJKUsVI0rkLV
 eJwh3i1oY+Vv9IiVT7zNianT6tcSWvL4ncndTNH40vYuw4Plo2xZnCocD9bsj/nQu1umOR11uCx
 wcv1y6ZM9gtRenuDkIBJwHKwWUyRdEGSsKLnQotC6ECCUcN+Xb9KnRJEkMVoi0Ue2xjVSA82QEB
 BikkiwK9rFqbkfg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of taking the bpp and the number of lanes as parameters to
rcsi2_calc_mbps(), change the function to get those parameters inside
the function. This centralizes the code a bit and makes it easier to add
streams support.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 45 ++++++++++++++++--------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 8aca35096408..90973f3cba38 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -998,13 +998,18 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
+			   struct v4l2_subdev_state *state)
 {
+	const struct rcar_csi2_format *format;
+	struct v4l2_mbus_framefmt *fmt;
 	struct media_pad *remote_pad;
 	struct v4l2_subdev *source;
+	unsigned int lanes;
+	unsigned int bpp;
 	s64 freq;
 	u64 mbps;
+	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1012,6 +1017,20 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 	source = priv->remote;
 	remote_pad = &source->entity.pads[priv->remote_pad];
 
+	ret = rcsi2_get_active_lanes(priv, &lanes);
+	if (ret)
+		return ret;
+
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	if (!fmt)
+		return -EINVAL;
+
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format)
+		return -EINVAL;
+
+	bpp = format->bpp;
+
 	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
 	if (freq < 0) {
 		int ret = (int)freq;
@@ -1092,7 +1111,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 
@@ -1300,23 +1319,15 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
 static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int msps;
 	int ret;
 
-	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
-
 	ret = rcsi2_get_active_lanes(priv, &lanes);
 	if (ret)
 		return ret;
 
-	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	msps = rcsi2_calc_mbps(priv, state);
 	if (msps < 0)
 		return msps;
 
@@ -1494,23 +1505,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
 static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int mbps;
 	int ret;
 
-	/* Calculate parameters */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
-
 	ret = rcsi2_get_active_lanes(priv, &lanes);
 	if (ret)
 		return ret;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 

-- 
2.43.0


