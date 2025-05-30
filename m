Return-Path: <linux-media+bounces-33671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B0AC909E
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC29A40AC8
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78DC22DFF3;
	Fri, 30 May 2025 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X+ogWk9V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5222D9F6;
	Fri, 30 May 2025 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613100; cv=none; b=iMwdI1WU7pswIOBwA061s6RAvB2lfTiAmiFDAnWpH5LwYvfNDLNhWLR0KOQej1vGPeBv0HEdbKYzgjTzWekTKrqyQdKR4TYZPcgwFLxThEbUYNWHze44YLU5Q7Euy5JF4cq1BBdKNlRrDai4RN7ei8PBokT+qRZZvK476m5ms8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613100; c=relaxed/simple;
	bh=belfbHJAk/4wDSUWKwSGFsMJp8VqA/wPEL2IyDXlAUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBjFFm3ipUjnK0Es1O6zqdR2OoGRpa+x2uiGUwOOcu00sf8HtkkKj9TKxCv9Q40Pq17HGfLuXGqbN/EMITa5kKsawmwng1KStLuL6kTZyTC4XRkm68BL+bsHdZCPvccTwnp/GXCtGXim4hY1BTGGSvo2r/JtZd/LKfGgOTrL5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X+ogWk9V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E83AD1666;
	Fri, 30 May 2025 15:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613064;
	bh=belfbHJAk/4wDSUWKwSGFsMJp8VqA/wPEL2IyDXlAUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X+ogWk9VPFjZtbwsD1rp/bU5256vKS+bdOF2FVQT+trwuqtw8L4ML9j/8ZmQy2IIE
	 5MYKbkPNIsyUL/zLtdH3CGIjCdfKj7hQpPgvfYVPwbgIlKo+n1vw04yBq52UZTxFh6
	 YJGcqL0Ja9fC4J5S8e1n6fFOrsfQkkRbBpyYinC8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:33 +0300
Subject: [PATCH v3 04/15] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-4-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=belfbHJAk/4wDSUWKwSGFsMJp8VqA/wPEL2IyDXlAUU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfcZ30/6NKB39m6h8M5YJUN7nu3yF2Fq3WlE
 GRSnCg4HK6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33AAKCRD6PaqMvJYe
 9RyqEACD7oyValMIy4peGKeczF54eXZ2KNpuAkW/mNFwcugGxYD35K4k06QJTu6XIccGpAL1Gl6
 Za6JyycOdoArT2izk7b6y2bA8AQwqgr8f0BdqZHZZLXr+ITqCFyXz1Lxz1Dm6w1QXYJ+F7QMJnp
 +YtF86Z3y/obo8eKszbNdUl0uATcjrB18SNWJTAHWOcWTJMQiNlFykrgpuLh7DJljYTu1reT3uG
 IDe3MBGVKcl2KGt4A7pOvMAYMc9TwLjm0rCpcCE+DBxFRUobjf8uSagrh/rdfbNoF3IoDezXymz
 ZY8/nHByf5YOhE8ALz8xf6BpbvLRy12wYOpFQ1nVDAl2Qqhn2PWqPC4zORjwVEI6kbkWXoiMVEa
 FdUo1Bxz9iFotgg2l1gKmDCgwZJm752FZtcDsRO2/CNZFiH9tEF4Vkzl0XWEzBfFipKfAuXOaDc
 JyOxBRYoPL8GlnaabhMKLL+8BEulNepAvpwZt6g8JcKWDxBLCMUe1psPRO7/8C1xNQu4T1Zakck
 4h2+Dacgxa48EukH9UD3gmL3sLC6nV9l76EFBsOBZJ6kNneH8hO0BP1eIqYeAejNc6aZjPgEBTd
 8EB0dUsjhOMjdGAvt4fHSHaJHk21FUsZK+pSAj/I0nmGbeE08Y+/RF+GSD0ijyfnQB7PsU6fYiO
 y52JTfGp1PetyMg==
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


