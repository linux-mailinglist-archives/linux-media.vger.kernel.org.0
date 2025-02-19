Return-Path: <linux-media+bounces-26409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75557A3C850
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 080BD1701B8
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885D521CC59;
	Wed, 19 Feb 2025 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDbegj5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB021ADA9;
	Wed, 19 Feb 2025 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992317; cv=none; b=JguK7Z7t85OGtwlNYoQYS244Ij61HjRZi8UOpkc2+4SyEP/AbY1Ib5x65n8/qhGlVbPBsQpZZT0hs3fKgTXVsLFhsSi4mcX75YfOrv/W5tpd5LG8FCCkIC6+VTiBA6CxU1oWPKWmdgDOKxWFxFMae2nnkgCp6T+866NkP3Raab8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992317; c=relaxed/simple;
	bh=jmA5+mv7y4YYnczHfeTR7YA2lkIzoroaa+RiRkCmeVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMLGPFoTJoEoHPtwV4HSlSvd0a7eS6hxxgFV8RfC2ccPymcBqJckkpJzkLwi315Kv0SNM98eCSxlKH56+0OkEuuFEpiPCaSoXPBrsCljmZ9vRkeut23TTxPNem8Uvu8+lNVvbWYBQs5njPJjR+guTbmv1trdLPRLb3ZZzDOSqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDbegj5j; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb7f539c35so38164766b.1;
        Wed, 19 Feb 2025 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992313; x=1740597113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=;
        b=PDbegj5jWSMWbq69i8SehFy+XtvpvRYRD+f1Y2c0gwq4v2uW4Av52RX1SdL6d6ziZV
         iqWSxzx6jVxxQRmCXBvSspBtB8tEwIhESfg47YmpHXpl3koeuhZtbz20z+WL8IeD6yXb
         CNLRZ1/0F1AEZy9MhH33dF19wDWgDLdsGpVIyLCV8KFR8EedAQjlsNAf4k/iONSLY7B0
         baF9t8KQXi/xW3VtTqwXpaT/kGDRBXYhu1X5jrqIEVnOejTOIAOAckcBgjc3dreJV3pq
         Pve1CzNcjz76Y1X9nhPUlThyIuVLBtjXv5WRdaks6EDNdWC6Hyo86LyF9cYj/8rr/r6c
         drgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992313; x=1740597113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=;
        b=dngkiDGhVAU/uqT5chiqD+cE3UvPYdtinInqs7EeA0AZFTdFa++IAIz0nne6ASY7mB
         LQXqlgO8V8iNMpGyPmKfBBfwBK8ELC42h1XagOYGKm+ER5FoFoWIS4dqw9ROSX7//Fz5
         AX4wyfSQa5BuV4uyToVbyBUQPrnbbzn6xxRS5nkEPhbyo5JCoWirFB8SXtiQw/da65gq
         np/dVpZcVx7PHNbqdrV2Tkdo1ri++UA3Q3mDa3d3tM9fx5R+WZGQvAYxupD2kTTrCMrN
         oXmx38e8CVIOYQI+oBnVYSelH8tj8tDkTPqaxq1HgbGgNCLWkRRZz6AMWYkFCrFO2DgQ
         L5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoQyjx7wG/NhpFPn2aekhduNvWfjYsJ+as3Sle5YWS+CiuW4zVBhbpbC6y2fHkouTdugeui8Df9Wmkp5I=@vger.kernel.org, AJvYcCXtvCdCeSpgTN/ZmEgltQVWtru9q3qRMFi1x+4KRJ+41C72pbhwiaOXw0hMYrbe6rXoRP62iBZWA5PMQd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7hOxwJMD+OxAfHEqodX1rgSS/bia6cGQeIv6MRWtMntM2eGh
	GBtQ3QGr9baOvHl7FADzQKJuoFgxUb4PRk5RjgbnyOCYJLtStHDZ
X-Gm-Gg: ASbGnct64Kcm2/+2OuhZsoCzwLPLgFT9yFVDdnZkC6uUcC+1Ka3/cMKGmodiJlWl519
	ek8Fxs4L3gF9hfljjrFDdY+NJaRID1cAOYP93YgL/YQ6JPsDjs73v7jBJxOmDhzFWH9wowQt70I
	uOdLoYxSMPcWEYh5v3YHg/ydHMZLpSgopZBv/RiJ+hAmJYBkdlsbaZ75mwW7Naw+1O5J2PEgTv0
	xkdFZuqUVV0agFObyPOznQiWkXOgwfpUNMVNOcfxrU3UiBU6U3fLCzXVxklgDeD1AhsoXqVgQS8
	VSRIoa6M+X1bRorNuNUr3R14erak
X-Google-Smtp-Source: AGHT+IEIElAhIncM7Zr/Vqckj3vDoXiYUCL9ogHbzv7UIans32TGHh2oeqc5N+BExx1k+LESN0G7ig==
X-Received: by 2002:a17:906:315b:b0:ab7:d179:249a with SMTP id a640c23a62f3a-abb70b1e782mr1529786166b.15.1739992313056;
        Wed, 19 Feb 2025 11:11:53 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:52 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] media: use v4l2_subdev_routing_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:31 +0200
Message-ID: <20250219191136.215151-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace current usages of v4l2_subdev_state_xlate_streams() with
v4l2_subdev_routing_xlate_streams() in preperations for the removal of
v4l2_subdev_state_xlate_streams().

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 6 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bfb..b8dfcf730baa2 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -252,9 +252,10 @@ static int ub913_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
-						       UB913_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB913_PAD_SOURCE,
+							 UB913_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
@@ -274,9 +275,10 @@ static int ub913_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
-						       UB913_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB913_PAD_SOURCE,
+							 UB913_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332d..c239ede968423 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -683,9 +683,10 @@ static int ub953_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB953_PAD_SOURCE,
+							 UB953_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
@@ -705,9 +706,10 @@ static int ub953_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB953_PAD_SOURCE,
+							 UB953_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777c..c982bca708ff5 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -272,10 +272,10 @@ static int max96714_enable_streams(struct v4l2_subdev *sd,
 		}
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96714_PAD_SOURCE,
+							  MAX96714_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_enable_streams(priv->rxport.source.sd,
 						 priv->rxport.source.pad,
@@ -306,10 +306,10 @@ static int max96714_disable_streams(struct v4l2_subdev *sd,
 		int ret;
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96714_PAD_SOURCE,
+							  MAX96714_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_disable_streams(priv->rxport.source.sd,
 						  priv->rxport.source.pad,
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 9259d58ba734e..e18b07b3259c1 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -446,9 +446,10 @@ static int max96717_set_fmt(struct v4l2_subdev *sd,
 
 	stream_source_mask = BIT(format->stream);
 
-	return v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
-					       MAX96717_PAD_SINK,
-					       &stream_source_mask);
+	return v4l2_subdev_routing_xlate_streams(&state->routing,
+						 MAX96717_PAD_SOURCE,
+						 MAX96717_PAD_SINK,
+						 &stream_source_mask);
 }
 
 static int max96717_init_state(struct v4l2_subdev *sd,
@@ -508,10 +509,10 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 
 	if (!priv->pattern) {
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96717_PAD_SOURCE,
+							  MAX96717_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_enable_streams(priv->source_sd,
 						 priv->source_sd_pad,
@@ -551,10 +552,10 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
 		int ret;
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96717_PAD_SOURCE,
+							  MAX96717_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_disable_streams(priv->source_sd,
 						  priv->source_sd_pad,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f43..c39c15709a170 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -360,9 +360,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 CSI2_PAD_SRC,
+							 CSI2_PAD_SINK,
+							 &streams_mask);
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
@@ -390,9 +391,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *remote_pad;
 	u64 sink_streams;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 CSI2_PAD_SRC,
+							 CSI2_PAD_SINK,
+							 &streams_mask);
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..8f61145435e32 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -141,7 +141,7 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	 * routing table are guaranteed to have the same sink pad.
 	 *
 	 * TODO: This is likely worth a helper function, it could perhaps be
-	 * supported by v4l2_subdev_state_xlate_streams() with pad1 set to -1.
+	 * supported by v4l2_subdev_routing_xlate_streams() with pad1 set to -1.
 	 */
 	for_each_active_route(&state->routing, route) {
 		if (route->source_pad != source_pad ||
-- 
2.48.1


