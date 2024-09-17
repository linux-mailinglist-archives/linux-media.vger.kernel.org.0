Return-Path: <linux-media+bounces-18337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915297B11E
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DFB41C20DE6
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B75318892A;
	Tue, 17 Sep 2024 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lOShdXFy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5AC1865FB;
	Tue, 17 Sep 2024 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582216; cv=none; b=kwVfsxAZZblgYRTGXwhfFLiPeu6bGBZX/e8B0Kcw7K1rWZmb5z6ArNfRd9lm3FiIPc1mceen1GyuE+MX8qdCRoV1jFFOBAaDHrRM4R+Zl+OK4MXQ2aDL16Tiv5ttfCNHWw2xiR3GHzgtIXRDdDoRLXN7d+YjdcBVJ/fkNoPdMvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582216; c=relaxed/simple;
	bh=MQejPUhA+YLEWckuXq06Okd8VmXhHdkXVmMWosZvBuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTsZZTTYhFXCEjnrpCJAZN355SsMcCYRLjBBqD4bVNQ2TnhY5onts2QN5KKEMDYtgcZXtJ1+HEGErhOtw63Kx2rpYUEv6IETLCQ0bwUWhu5Y4WZz5HNTehmtOmFd401+IfuB08AMvunemb8J1dp6I+yp8gPc2m3IbhEHMXRKbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lOShdXFy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0A3AF86;
	Tue, 17 Sep 2024 16:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726582126;
	bh=MQejPUhA+YLEWckuXq06Okd8VmXhHdkXVmMWosZvBuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lOShdXFyeyghnksDq3BUEuaAHxnMrKyuEQgc5wKLPICFYn0EVRTnbJOSlpZ5AETlK
	 qz0hiKaD8bx4l+bA6Yr69EQOo2Ru/F0zbWgdz20Ug2aIJStfwB363kv3M6TYsyKqNJ
	 ltBKkzppKTd/O3ACPDMsT3FRT5j6fKwD4hZ6wi6U=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Sep 2024 17:09:32 +0300
Subject: [PATCH 4/4] media: i2c: ds90ub9xx: Use state cleanup macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-scoped-state-v1-4-b8ba3fbe5952@ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
In-Reply-To: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6178;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jLqnCfsN8nWchZxolR03Bfc5Bu6MqE3ssrg54dj55Ws=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm6Y28wB6Ai7xXG80tcbePYq2sntO19C9gE02uH
 /PaWbLMZL6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZumNvAAKCRD6PaqMvJYe
 9SjYD/90l4x4d+2tL/hXEM8LzacA4AJAFJD7izawzpBX7JaoQdz/Ixk4yITPnA2mobPeajwrgWm
 KDs1DDVmmvJ2mV5T2lo8rRdA7t6mHuuhyEw8BYEb1LX1UUJQMCTLf9fInREGC2rikDFn/U4c2Ob
 7LUa7btVgJpWwDjtxT2N8HmbrseqX7OCQEZgAzsX/qywGU/8qAL/mMoaZTC0ftazkqb9T4cTvQT
 iqUR1K11wv8SiKvXyEnzDFDYfMQUOGaMkEKukrzzR6pQRQ4hn5sjk2+xd6/o6y7x3KMVwBouYfC
 5CGCd7sZyQ+EbxwnUDITLJHNAqJun365W0KZhciXHVfAjP0hThDBhbp4aJDextQh1U7ArUQLQFc
 LxU2z4hSSEst8hZfrhJGpAX+zaD1umPTikraTgkIsnmJEIR8ecqKpP5iqfgXLtGorhb8HT006Cz
 +6xBzoxi/7dSouWql8xIYzvOraIVCiKwACoYQV2uOAXovz0947WBcFkNcykBo0yuoHzU8o/O9Dq
 hQ9kuDt7BunsnM/U7vSBktDXlPhmEdk+PVHzgQRcDaXbrQC/lYvRRi7UrxR0Xl9ywzznVzunbc/
 4sOpdeM3oqSAoRSez8lDAkO06bcwkxxXcVuAzF+L4mGC1j5W/6IO3JFwCWMTcBla9DS+wX50DOw
 Ct3S0oZ3RdGwZyQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Use the new subdev state cleanup macros.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 11 +++--------
 drivers/media/i2c/ds90ub953.c | 11 +++--------
 drivers/media/i2c/ds90ub960.c | 27 ++++++++-------------------
 3 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index ca9bb29dab89..7a53b68db1b4 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -351,7 +351,6 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	const struct v4l2_subdev_krouting *routing;
 	struct v4l2_mbus_frame_desc source_fd;
 	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (pad != UB913_PAD_SOURCE)
@@ -364,7 +363,7 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd);
 
 	routing = &state->routing;
 
@@ -382,8 +381,7 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (i == source_fd.num_entries) {
 			dev_err(&priv->client->dev,
 				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
+			return -EPIPE;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -395,10 +393,7 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
+	return 0;
 }
 
 static int ub913_set_fmt(struct v4l2_subdev *sd,
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 16f88db14981..131b1523c3a5 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -488,7 +488,6 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	struct ub953_data *priv = sd_to_ub953(sd);
 	struct v4l2_mbus_frame_desc source_fd;
 	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (pad != UB953_PAD_SOURCE)
@@ -501,7 +500,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd);
 
 	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
@@ -520,8 +519,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (!source_entry) {
 			dev_err(&priv->client->dev,
 				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
+			return -EPIPE;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -536,10 +534,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
+	return 0;
 }
 
 static int ub953_set_fmt(struct v4l2_subdev *sd,
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..e873611bf5c7 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2777,7 +2777,6 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
 	int ret = 0;
 	struct device *dev = &priv->client->dev;
 	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
@@ -2787,7 +2786,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
-	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->sd);
 
 	ub960_get_vc_maps(priv, state, vc_map);
 
@@ -2810,7 +2809,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			dev_err(dev,
 				"Failed to get source frame desc for pad %u\n",
 				route->sink_pad);
-			goto out_unlock;
+			return ret;
 		}
 
 		for (i = 0; i < source_fd.num_entries; i++) {
@@ -2823,8 +2822,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (!source_entry) {
 			dev_err(dev,
 				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
+			return -EPIPE;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -2844,16 +2842,13 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			fmt = v4l2_subdev_state_get_format(state, pad,
 							   route->source_stream);
 
-			if (!fmt) {
-				ret = -EINVAL;
-				goto out_unlock;
-			}
+			if (!fmt)
+				return -EINVAL;
 
 			ub960_fmt = ub960_find_format(fmt->code);
 			if (!ub960_fmt) {
 				dev_err(dev, "Unable to find format\n");
-				ret = -EINVAL;
-				goto out_unlock;
+				return -EINVAL;
 			}
 
 			fd->entry[fd->num_entries].bus.csi2.dt =
@@ -2863,10 +2858,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
+	return 0;
 }
 
 static int ub960_set_fmt(struct v4l2_subdev *sd,
@@ -2944,14 +2936,13 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 	struct device *dev = &priv->client->dev;
-	struct v4l2_subdev_state *state;
 	unsigned int nport;
 	unsigned int i;
 	u16 v16 = 0;
 	u8 v = 0;
 	u8 id[UB960_SR_FPD3_RX_ID_LEN];
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd);
 
 	for (i = 0; i < sizeof(id); i++)
 		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
@@ -3078,8 +3069,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		}
 	}
 
-	v4l2_subdev_unlock_state(state);
-
 	return 0;
 }
 

-- 
2.43.0


