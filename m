Return-Path: <linux-media+bounces-26378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A4A3C0AD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7311317BCDA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED611EFF9B;
	Wed, 19 Feb 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z4E2rmpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E96D1F4176;
	Wed, 19 Feb 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972997; cv=none; b=VjUNhWfiCnfkpW5ik/UfAH1Q4OgRXUfLMgE2FvlMirMCHLc3HiHD1BBdAXnN2KaNxkL2wQuyBDLUm6sHLJutKtDz8l5jrX0YoDgYdbCQkqz5TezXvLVJboDE9NyVRysRTpd+dMnfYlvghF69meBcomz9Rg9qTve+as7VSbdfGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972997; c=relaxed/simple;
	bh=xFvCyhRSDHkL00smllyvHTMBcw/7LCqO1172ZwdpHWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZZfeH94lNt8cB8m7K/yE7n0JqvW12+xCFoOg8fMDmnUV14hnAPn/Bme0OVkaFhTiY/EP2yDqgTSheSUY1PT00GS6Trtj0Z+/QLrp8nh1G29KNngNo+rYNqpPRutSGLAHUt983MENzTTbac28MBkj3+acAuNL6NFy9c/8qX/0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z4E2rmpQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF61211B3;
	Wed, 19 Feb 2025 14:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972905;
	bh=xFvCyhRSDHkL00smllyvHTMBcw/7LCqO1172ZwdpHWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z4E2rmpQsJgeZz0sstaPt+XjDX0u7LhxVd+AOYfk1tScu91VbKCn1nPNX6yMbF9DU
	 jPcQSrYp1Tl927hoWT0anywzKb9zuj1pfxOBs326wgqkt7xswj8XjAyAB5bB1+z57e
	 /DfTjWJmFPDDo6wQGN52tCZYRMgoXv93L9ojkbJ0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:00 +0200
Subject: [PATCH 06/18] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-6-f1b93e370aab@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=xFvCyhRSDHkL00smllyvHTMBcw/7LCqO1172ZwdpHWE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFxstggz+FhA/AuDZJ0J+pm2IjeTGBY7xGNX
 hwQ8Zv/S+uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcQAKCRD6PaqMvJYe
 9WQfD/90d5oD1SIcCjjCizz8EpGSwfM27a1R5FH9LYIVujieO/qHqwEjfqDrR80Mp3HLixu55Wx
 htY89iOG6xTRLvcaEswBT9ZCzd0/3dOdAj6muS3/kA+Az6ACS3+JPBuUYMtH5Dby2yuD4uLKY8+
 HEVYm9ZbX/J/+kx+scaaXqacJpQ+HFVms47I4iBam2nIbPWgr6izgPO4bk0O43rspClsSMoNeYX
 h+Y4t/oB3cyUDdOV6uYUNTgtIIFd4uIKqtvCBZySaFfGFrRxYLruA3VixLFkqI3QrFFWWlN8Hu8
 UFTVmQtKDmTRPF3H4SzF9NQVe4J9ZO9KrWnmT7BXKjB3y/b+zXnYp3D17kLxu/pWlM2jEFWa1e5
 UqkYpEnMhcocsPmdkb/F8DJykU2asRKGczc0KvtrmCy6ppSoNIR/LUqQvb69CtlxXSuENEeRZK2
 z4/4QSrrcXGXpD5hT3QBrRTP52sZS2rDmeqgp4I2wC2aJOv5+CJrg+6E4+MMquMOmKHFM7E1ZJL
 3KJZU4EFwAcf0frPOUTSrkaYMGyDvRgKVUBxdHZrZEJ8oB6IWO24NOf1/83OS6O/rv7mwlccnip
 8RPgymbw2BcGL1XDaakVfQSSexz+b9zPSOAB9KW+o8slRcupZ9zz6PU5FMF/v1PtFAQsioNBIcu
 xZ45wbjfl+nHAwg==
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
index 9979de4f6ef1..845fb3e155f1 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1571,20 +1571,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
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
@@ -1606,6 +1598,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -1627,6 +1626,8 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
+	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
+
 	priv->stream_count -= 1;
 
 	return ret;

-- 
2.43.0


