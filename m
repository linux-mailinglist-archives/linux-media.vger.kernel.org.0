Return-Path: <linux-media+bounces-10426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6DE8B6FCB
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8DF52851B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9363712C48B;
	Tue, 30 Apr 2024 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5KKQabM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DC12BF32;
	Tue, 30 Apr 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473619; cv=none; b=Mo9YrNPySNc6DWPqB1OlGR/dTh4pz7Z7pVyuOxLHLjYXTzL0JSq/zZ+OC0j78PJwdsIasUKK3pYqtrjocW4pbqlnFVu37wD1nT3lISxSDyQSopnUdkmymmmN9nmFYKHaMYjjye5E5zkQ9VqTa1S4YjJEebq8eo3v2zSR/lfsJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473619; c=relaxed/simple;
	bh=e3pk1gdzuhYggRaz5spSo19QcErgLvK7Fz4buvD7hLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apirhijGfQ8wsEMjsTnA7banFZy74tHKLUhZaaD7gE6RR/LDvmdOVUWyVlvTs55nbWWOccUnnGdMVQTm2IWmBUgPdpWUYimVPH+phul9fg+eUBkPFTGvdd7+HLzrSB6+idjEfB7UsK5n+RIVi75TqYADwwqgc1vmHcHqFlCrPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J5KKQabM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E62BDFB;
	Tue, 30 Apr 2024 12:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473556;
	bh=e3pk1gdzuhYggRaz5spSo19QcErgLvK7Fz4buvD7hLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5KKQabMeiGVRq7d6w+HjJZbh/gS8t6//aOiwRDRwQErLgG0oBc2f60dxFIzonQV7
	 /pXa7wbJbmcPe0ONYC24WD7EC60DMltLxNzgyT0+zOSUOgEPgc2IfuU5BTc0ASPVEH
	 dZHVE0jnyqcIjazX0QLwJ3vbkhCqzBhgwLqMIxro=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/19] media: adv748x: Add flags to adv748x_subdev_init()
Date: Tue, 30 Apr 2024 12:39:38 +0200
Message-ID: <20240430103956.60190-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a flags parameter to the adv748x_subdev_init() function that
allows to pass additional flags to the v4l2_subdevice.

This will be used to identify the CSI-2 subdevices as multiplexed.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 2 +-
 drivers/media/i2c/adv748x/adv748x-core.c | 4 ++--
 drivers/media/i2c/adv748x/adv748x-csi2.c | 2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 2 +-
 drivers/media/i2c/adv748x/adv748x.h      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 50d9fbadbe38..5951ddebc59d 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -510,7 +510,7 @@ int adv748x_afe_init(struct adv748x_afe *afe)
 	afe->curr_norm = V4L2_STD_NTSC_M;
 
 	adv748x_subdev_init(&afe->sd, state, &adv748x_afe_ops,
-			    MEDIA_ENT_F_ATV_DECODER, "afe");
+			    MEDIA_ENT_F_ATV_DECODER, 0, "afe");
 
 	/* Identify the first connector found as a default input if set */
 	for (i = ADV748X_PORT_AIN0; i <= ADV748X_PORT_AIN7; i++) {
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3eb6d5e8f082..3abc73ea8ccb 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -583,10 +583,10 @@ static int __maybe_unused adv748x_resume_early(struct device *dev)
 
 void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
 			 const struct v4l2_subdev_ops *ops, u32 function,
-			 const char *ident)
+			 u32 flags, const char *ident)
 {
 	v4l2_subdev_init(sd, ops);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | flags;
 
 	/* the owner is the same as the i2c_client's driver owner */
 	sd->owner = state->dev->driver->owner;
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 435b0909bbef..60bf1dc0f58b 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -245,7 +245,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 		return 0;
 
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
-			    MEDIA_ENT_F_VID_IF_BRIDGE,
+			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
 			    is_txa(tx) ? "txa" : "txb");
 
 	/* Register internal ops for incremental subdev registration */
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index a4db9bae5f79..9e4a5aa4ed55 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -741,7 +741,7 @@ int adv748x_hdmi_init(struct adv748x_hdmi *hdmi)
 	hdmi->aspect_ratio.denominator = 9;
 
 	adv748x_subdev_init(&hdmi->sd, state, &adv748x_ops_hdmi,
-			    MEDIA_ENT_F_IO_DTV, "hdmi");
+			    MEDIA_ENT_F_IO_DTV, 0, "hdmi");
 
 	hdmi->pads[ADV748X_HDMI_SINK].flags = MEDIA_PAD_FL_SINK;
 	hdmi->pads[ADV748X_HDMI_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 9bc0121d0eff..be24bc57767c 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -424,7 +424,7 @@ static inline struct v4l2_subdev *adv748x_get_remote_sd(struct media_pad *pad)
 
 void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
 			 const struct v4l2_subdev_ops *ops, u32 function,
-			 const char *ident);
+			 u32 flags, const char *ident);
 
 int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
 
-- 
2.44.0


