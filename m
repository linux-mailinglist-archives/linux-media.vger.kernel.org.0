Return-Path: <linux-media+bounces-48901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F8CC4098
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73F5D3011FB6
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7CC350A26;
	Tue, 16 Dec 2025 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7GsIRG1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F134FF4A;
	Tue, 16 Dec 2025 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898362; cv=none; b=i6JB8sV/ekKYMoRKpSRK60s0LOLiVh9gCZ5qBhoUzzDrlEcnhoaR4MTsjsfKAdl4sAN9P2JaaX3h70h2zp60U9K3AHb0swfIC2dh7dzf0XT88+XQb4yjtsmPtyb8BE6DoHyl6ChxFuJUkztg4OmMenCEDEbhlna10RSs9IHfbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898362; c=relaxed/simple;
	bh=E1CJ0rQnAi0EUDChncm+qXC9IRTJno6m1t3x5jgRLOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPQ4Rjs70lsGJL+6gKX4aA2cyZG/8xf1XiiYyPV7JYutTbK4jst1Ac528FpLP0KuMjZOnemSIDuKBSRXRpatjsFkKdAmqTecWevEQWhCoz/2uLcqygxMbIUU/HVNynlLrGmOB6p0lBlvzqPpNcId1fAs7+7UN3Gt3w60YUD5jVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G7GsIRG1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAAFC1552;
	Tue, 16 Dec 2025 16:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898345;
	bh=E1CJ0rQnAi0EUDChncm+qXC9IRTJno6m1t3x5jgRLOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G7GsIRG1IpkLsiRj/eQDz3jMvgCNpvhRfgEPI3e5I9lLGDjfOcnyTUViuBB9+m8Ti
	 LFQCgJf00gUrbDVDn/MJrRnBiD644yRWELBzYMaVAjqrw3N9AJPGqytAiJ9CzPTVMy
	 /zScey6ZbLmGeBzBWowSSLWcAsPxSu/pdj0fk9gM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:24 +0200
Subject: [PATCH v4 07/15] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-7-f28b4831cc67@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2882;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=E1CJ0rQnAi0EUDChncm+qXC9IRTJno6m1t3x5jgRLOo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhlHlHgo9ICb/tIn7YtdZO24bxLNHEOyRmrJ
 k62qgaXQwSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZQAKCRD6PaqMvJYe
 9e88D/9RfDElh1M02pZypkhFHz2LbfT5qFQmXyqPiuwCpgdC+9C5/LdmNTvHfIMbp2AMAYlvvx3
 lZ1r9wNSDKAaXo0V/cuBnVR5MSvKL5huKVTwTA0gYWx9Fp1kMWxyQ4N7CIT79lTBWQJO03GJlKq
 8vRCbd7fSi4k8fd2xK5+GEOwz/zvlArNXuHB6KAOFRsfxckZZtHRx0MTYgxg+CT3pnnmLovFjAg
 JrRHSyR/SK/E1mBcG2Rm+7v+efgS9zf7tVtyvTH0j7sgOsTP1q8CdtxnpSCfhn63DPC9bzWR4jy
 B68q0+ROwneyxjSaEekQoK2bIQO92ZUdzoOmfVsS5vwL65ng5AEojuarRNT76EZgFc0bNEhvj4w
 mGt4ZVBE1gcNdgymsE7y2OVixhzErrpE9pCfzWh15SCYhMk8u6pJ2vU2u8yJZukJ3ZNi6Qn9Uc4
 S7XmQzVXOdY6aZ0havBmKcZa9g0eo7uAfMxqr0hp/oLWxPdiGMDOrkU3+iXEVE1qJvgk4isb/E9
 owuNrKvYWaEE69exDIyQHWLvIfFOYopR5GxpmYEYA0UeqWAlbzwab3V9qePwrorHG9xfMvqd677
 ZmzCBjfjNFGcsdAF26z6ozqFCFoexTl4kiCMN1OWe1QRPWy0roeyTbbLsP3BOaVpRR6/7LEUBH0
 Tu9SpwT1/rILGlw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the ISP hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
risp_start() and risp_stop().

On Gen4, a side effect of this change is that if the sink side devices
call .enable_streams() on rcar-isp multiple times, the second call will
fail. This is because we always use stream ID 0, so the second call
would attempt to enable the same stream again, leading to an error. In
other words, a normal single-stream setup continues to work, but trying
to use the current driver's custom VC based routing will fail.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 27 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..58a9a3bd9f75 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
-	if (ret)
-		risp_power_off(isp);
-
-	return ret;
+	return 0;
 }
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
-
 	/* Stop ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
 
@@ -291,7 +284,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
-	int ret = 0;
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -305,9 +298,17 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		if (isp->stream_count == 0)
+			risp_stop(isp);
+		return ret;
+	}
+
 	isp->stream_count += 1;
 
-	return ret;
+	return 0;
 }
 
 static int risp_disable_streams(struct v4l2_subdev *sd,
@@ -315,6 +316,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -322,6 +324,11 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
+					  BIT_ULL(0));
+	if (ret)
+		return ret;
+
 	if (isp->stream_count == 1)
 		risp_stop(isp);
 

-- 
2.43.0


