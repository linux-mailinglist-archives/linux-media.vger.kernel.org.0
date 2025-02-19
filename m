Return-Path: <linux-media+bounces-26381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E438A3C09F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FEB7189447C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1593A1F7545;
	Wed, 19 Feb 2025 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e/MgA4NT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26301F5837;
	Wed, 19 Feb 2025 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973003; cv=none; b=JCtS6caZQqd04PUWLAX3ZEik4hfKcrzG2Ei0LaMBgR6P5WyXrXUM1w0RRho9KEF5aGNiBmmxcQMGK+srPGnNsm4BRIpvBZSnXZUlOWeu91A73l6nO4tW2Rmzw5vx+TdDoyWXgkU6MAosm7k0J3i36M5PfEUGDzDO8e1RhJXdLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973003; c=relaxed/simple;
	bh=viJXLf5qesszZisZjfDfCS6B8SB7JofUtDlzQmb2wWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e03MEB0MMkU/RVq5VBF7g5lXRzSSq5uOlfbWSG8wUg9UIK9f8yyZwVxLuB4kFgUALeahxJ74MJq9Smjt0Q9qbt6r1/H5g7sDR0ANvYSW/8vQPyTrLfngoDevVGU7HODQ1sRww8z+Y/IKS9/7LiO67WkyzOTEMehZo3egE9bIu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e/MgA4NT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A974D6B5;
	Wed, 19 Feb 2025 14:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972908;
	bh=viJXLf5qesszZisZjfDfCS6B8SB7JofUtDlzQmb2wWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e/MgA4NTIEOgo09qQ8yH57zv9tZ5cJZhfOVl+oMYrNxJxtmW8jXlUK/6MMQetbsmM
	 yyu7dHeDCOUs4peydKnuqkHQHtdgFQyLA4aTk3idkgBt43y6iBa0XWor8H7pWKwMxA
	 7ZK9+0agggx3dK/NBp9Na/VmkfZp/3V+0xmTr47o=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:04 +0200
Subject: [PATCH 10/18] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-10-f1b93e370aab@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=viJXLf5qesszZisZjfDfCS6B8SB7JofUtDlzQmb2wWg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFz2itzgqVD1jVMjzPHBPjeEYU16vWCtR4qw
 aWzFEueyayJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcwAKCRD6PaqMvJYe
 9WANEACEZxzbcWF6noX7DGwaYrMe6e6FGGGy1afvEikmWWbRG/I9bT+ynbOVAAncwAIDL5IBE0f
 S5TYBRDiiqLjOk3OMTWRbFYAj6DWwtw7foGHnvcSeRkch861GmcxsVCdmjamVOosUR1Tc1KWpcH
 aeLpU1Cyi2g8HjmrlWkZ5AxUaCv8S0eM4idTi+l1TsMYlw6Z017coSrTzEfJkz3rKH7CkRWHKnp
 T+vrSuil1zzwAf0rANUU7GH8lR2Ehaw+tacZOabNNgPi3vxl0z8dQO7O9ZKzcwqU9rtRdUgzHq1
 y5Lm5NcMZdtD+ghhwdc3JXA5UThPTLA/GKvrf0mPSF0+6DDFsVHNc+W3Lr14B71uqAmfa72FHQW
 cPGJ6XWCKzAGvXUnLWNPSDzW7rTQ6iJg7fpL6JahTNQ3+YDGHPdIfaMHdOyd6APpSjh9mdW3Erk
 dH/Wq1BdtZgy3mQpj6ACNvuIGbBaGJlR4D+odX+qlA4P2UG7hMlICEJwuY2bGy+vu3r5B/7FxHi
 w8/ScEmz6ymppDbltp4agzS4TuD83g5HsxESLeJqFsLQHJEvq5T5EeGCvE8ZLU6xdnGGmjGl2O/
 meNGxFfz+ePXhPhc7mOjMvq28pZlzP9HsJcYHQZ7V5ZhOItsDjQGqk2YV/+nmv3/7ZQMCzTFumP
 i8G+bB1SbHkewqw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With modern drivers supporting V4L2_CID_LINK_FREQ, we don't need to do
any calculations based on the bpp and number of lanes when figuring out
the link frequency. However, the code currently always runs code to get
the bpp and number of lanes.

Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
when V4L2_CID_LINK_FREQ is not supported by the upstream subdevice.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 32 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index f8b581e10886..d6d5c18b0b4c 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1001,33 +1001,39 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 			   struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev *source;
 	unsigned int lanes;
 	unsigned int bpp;
 	s64 freq;
 	u64 mbps;
-	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
 
 	source = priv->remote;
 
-	ret = rcsi2_get_active_lanes(priv, &lanes);
-	if (ret)
-		return ret;
+	if (v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_LINK_FREQ)) {
+		bpp = 0;
+		lanes = 0;
+	} else {
+		const struct rcar_csi2_format *format;
+		struct v4l2_mbus_framefmt *fmt;
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
+
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
 
-	bpp = format->bpp;
+		bpp = format->bpp;
+	}
 
 	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
 	if (freq < 0) {

-- 
2.43.0


