Return-Path: <linux-media+bounces-26379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED9A3C098
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB33A189B5C8
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBAE1F560B;
	Wed, 19 Feb 2025 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aeFwpwwo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD551F4628;
	Wed, 19 Feb 2025 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973000; cv=none; b=XgeFSJ1yG1PIwA2B/E3pVgxOviSPX5DBz4zZJpYQN5pjUcDLKuj2IedDXWvtVEhUqnH9jz+uOuE+CvIGqFRr3Q9bQWMqXDS6aUteh36cASdTxeDEp276w2FXWWGmVMvTDw5v1yrfl9qkBCrCiPigXmNlDy/1Ukw6jPF11LfIfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973000; c=relaxed/simple;
	bh=eUsO9jmJhoqRME33BAeDwGxOQbvR7uX22YuUt/KjcIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0CysHYIY2lbXZf048C/EFQKJZvE7mqmWHDxusFvNnQ2F/tdfVB+U7P/z+FxlxLdXLHJsKZu/h9Z2/iMi8SHCHXFfGQ8B6GIKcWu+bY8+qQg1otWJE7b+FgbRfW3RydlkojOcNg7ik3U3tFEamlnydG6XitX9dT82TgxkU+z46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aeFwpwwo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAE37169;
	Wed, 19 Feb 2025 14:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972907;
	bh=eUsO9jmJhoqRME33BAeDwGxOQbvR7uX22YuUt/KjcIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aeFwpwwocaQqI2rUrmJmn7qch1BPhvfy0cE5dFz9xXJpocltrysStbBkWRkQpfhfs
	 /EkW2hm430jWdReomqr8s6bwO+oWUpEe6+mZX8+Kk7D5ZRQLpmnt6EFP1YKXqap7Nq
	 gHyzur/srg5PjwGRZ/W6IXf5/d6RG/Fx6FRosE8o=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:03 +0200
Subject: [PATCH 09/18] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-9-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=3426;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eUsO9jmJhoqRME33BAeDwGxOQbvR7uX22YuUt/KjcIM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFyDYIGr14/Ao5iFLLyHR/fbjbYiGdShW5nX
 BOBIziSYg2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcgAKCRD6PaqMvJYe
 9agrD/wJ+VRUDklmTGUUNM4PQF8VyMSKujUadIAX1DIQ+klFAsvD+gMFwuK/B20t4bpJrsKP4LD
 czFAKXQTA06DcIz7IM42LSgCyK5Pdjtww5eJLugUn9pjruOiw1qTxcCzZkbDhEOkm8b9J+f2+Oa
 nJMfqiYyxyKp5UazZc25op/DVJ5NREEebKal7ikpqDzeYGRy1OX818jHwlOgxuXeQ8PQsJaaL80
 QrTM4nuBB02IDsekfboy8P6NqRNrZY9RAb0J8TfmXNWfWK7QnCwpKopt6oxp4DMJyLiVv8feGGh
 ZaY6LZ3xaaApFk6qGS++37eydQijWPtxPwI86E9sLzYEdNMLYdxC37lNCbIp3dYxT0J3O9AukfH
 pZCuqKULFIy8y3snJCssSLQ9EQPxr+Vet5rmP97bZYNanV1lwPr9y/Zd54VttNQ4RdxacsMi9Lo
 HKt30LopSZI7EUJ1Tjui8lLc6+h9/JY3CyCS51s3RX5JcrVjBx1f1I6Au4McMjjja/X6/0MM2ma
 Yex1pV66+PBzCsPK5QIjt2kjWLUmDHhOE5DzvQQqJYBfXh7bUbsNMLvM1V6+/lfD4Ta6WPz1Bwd
 HB5p+dKBLqu1JwnJutzK6qXsjGR9dnMp2MJCal8kE8fhudlTUZRitnbWZUgOUAwl+3jjg2MjdA3
 JzAbUw5wKApulmg==
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
index 8de0f88aca61..f8b581e10886 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -998,18 +998,37 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
+			   struct v4l2_subdev_state *state)
 {
+	const struct rcar_csi2_format *format;
+	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev *source;
+	unsigned int lanes;
+	unsigned int bpp;
 	s64 freq;
 	u64 mbps;
+	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
 
 	source = priv->remote;
 
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
 	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
 	if (freq < 0) {
 		int ret = (int)freq;
@@ -1090,7 +1109,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 
@@ -1298,23 +1317,15 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
 static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int mbps;
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
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 
@@ -1492,23 +1503,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
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


