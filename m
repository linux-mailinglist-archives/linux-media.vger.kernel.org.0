Return-Path: <linux-media+bounces-28771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755AAA71565
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277A4179FEE
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA3A1E1E14;
	Wed, 26 Mar 2025 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gs5WNPsk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEB21DF963;
	Wed, 26 Mar 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987429; cv=none; b=DfTvV+uhRXa4F1OL5fQ3p7/YV4qOSAv7rbvjExdS0UW/n//sR/2iZTIukjcGRgkFG9V2DqJq0Syd3x5oyJLQ/ZOVlawP0xmoQXxlZck6fSerPDHOlx/dsfRg6/LmreefAVyBYJN7Q/cf3MZptIkPsweYBrL0O2u50CUC+nu+mv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987429; c=relaxed/simple;
	bh=belfbHJAk/4wDSUWKwSGFsMJp8VqA/wPEL2IyDXlAUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAuDBYV5MCWwRDAufCGrR24JPj+yMKWKmG5ZdsKvNA+AyDZxF7q40cT390kH9j4fHVugcl8cdZk/Wti9fjX6T6I84ZUrm3zxO92oOqn7vZW/DqWtV3uu3p1dnZyDB7UtQh9FCg/OnstjasLLIa1OQZM8tTAzlsezPjLSaHLINsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gs5WNPsk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5DD410D4;
	Wed, 26 Mar 2025 12:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987309;
	bh=belfbHJAk/4wDSUWKwSGFsMJp8VqA/wPEL2IyDXlAUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gs5WNPskCg3GQ/gMl4FSLTba8R85APIXRGEQHmyWXa2BAjJ4DLVaxzzcelGr0BUXw
	 RccZ7ndhy5OlEaWpcjoLrdx9FZvWTZNxsdz+rRNAhrnN6SatgelB8RjHVCVT1dsrwI
	 NCTXG/MqbB5iS/TVEdLZ1p0wKVfUlT99vkp194ek=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:26 +0200
Subject: [PATCH v2 04/15] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-4-d0d7002c641f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=belfbHJAk/4wDSUWKwSGFsMJp8VqA/wPEL2IyDXlAUU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CQSAZGE3pVKkr9kSvEB7xGvUg2Dr/sNdJY0
 HVjnlYGLzOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkAAKCRD6PaqMvJYe
 9XmcEACttX9MdnoK7SqXEl3kAwhldzdi2L8lP7d+RiV/VHy3mJkuzoaRQRxGjMHLuDMvhgSqGCI
 pB6nGz11CxJp1STmIYWv1HuxgTCQltRJl/SYeWcFO84ZIvMdc3hN3O9KP8t2FLVouBv0O6+jtff
 PWlE3pBom+gdZOp7/HmMRN/JGDt6ON0T/tomHouwS2Z5ARhg5+ovufUKAmmziVfgn0Wgua5zlj0
 D1+c4HJXE8HAtxaoMB63ICwQoJrwBYpM5l/JMxmEEr+SGFUCuueGkgd6+K25ARoFfRrRKZVuGl5
 8byyBagxklkVKxQoi9Z/2aJNzml5fuSwVQTUsYE2bd0uf+gfBAjLWiH70nGgibPIaDoHiQc/0BK
 /cBbvqCN9lIU/98iPpGZUexv7UUrXoPgHdGvd+K64J1smMOegD6tY47w+iEcGj+0xDlYre6jAMd
 goAuxT41OQAZTx6Av5l+Jf5vYw6uJP/Kp+VcLnoCfK2+7lYZvibugAINBnxkwTC4ehHjbyClvDc
 a4lIom1flZCj1Kpo90GJ4kWX2pHWeM7NVz06MIgvHXxDr5o1V2DKsFmm62Qc4vxALcc1i4kzW6C
 LI7nuhUO+jnEEmxHvwEFWqnC8jW9rq8JaWbnIqHH2gvAsSxn5fVJuGxk6WbKWhk80nIBz+EoVR3
 5bUOJmoqTMwx6QQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the CSI-2 hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
rcsi2_start() and rcsi2_stop().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index ddbdde23c122..698eb0e60f32 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1573,20 +1573,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 		return ret;
 	}
 
-	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
-	if (ret) {
-		rcsi2_enter_standby(priv);
-		return ret;
-	}
-
 	return 0;
 }
 
 static void rcsi2_stop(struct rcar_csi2 *priv)
 {
 	rcsi2_enter_standby(priv);
-	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
 }
 
 static int rcsi2_enable_streams(struct v4l2_subdev *sd,
@@ -1608,6 +1600,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		rcsi2_stop(priv);
+		return ret;
+	}
+
 	priv->stream_count += 1;
 
 	return ret;
@@ -1629,6 +1628,8 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
+	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
+
 	priv->stream_count -= 1;
 
 	return ret;

-- 
2.43.0


