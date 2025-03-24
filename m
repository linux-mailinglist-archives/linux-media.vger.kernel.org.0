Return-Path: <linux-media+bounces-28610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9CA6D5CC
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E9237A49BB
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE76D25D543;
	Mon, 24 Mar 2025 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gAOR74OT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362825D522;
	Mon, 24 Mar 2025 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803508; cv=none; b=dsWVi+eCMSHH5NTI6czTyUxbl1cnlifZh1xZ2xCnZJgW8sqgrIWuqL7uWIiNy5BJBV/6LwL5QO6CBva+5JJhXXTUkS9o/C0fGNPFIphtAD+uJgmO3VOTqM3/RrdILRicNFy7RNngQq0qplclzaCJ+2tjZD6nIVwjnM9lk/5T+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803508; c=relaxed/simple;
	bh=EwtCfSMyC1bK19UIOk34q1JdivYUQPm+OZei5Yp7ZCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMbK4f+HhkT3Z49Fz2t3Nzw1ERIBQc+EopYgazy0jOYfTvnZJfxygivYO3mifjYfmMkncbrsLMAnAGFuLQoBYmtaj3WrZbBWUdnnKul/I+dHPdgFkqiyFT2ETDTvDtMIaYoB+nBVOD5Jh91wpKPxyA+DWsaj/DfD+1JX2Ej64XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gAOR74OT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 594561059;
	Mon, 24 Mar 2025 09:03:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803396;
	bh=EwtCfSMyC1bK19UIOk34q1JdivYUQPm+OZei5Yp7ZCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gAOR74OTJX+dJ3q3EHNcUwGczhV4Bsm4Rqvsbr+4/YzDrh8zhFwJA+SIaPe7njqk5
	 RZ7kHr9sr5Rw9vP9m68IOK1b5GaF5G7yHZ2X94ubXSo4B2heD6lm2wsQ8051Bmg7ie
	 W9zsuI3kdvtuusZrBg/PDUcyw0eXHxwBm5JE/r7Y=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 10:04:45 +0200
Subject: [PATCH v4 2/3] media: i2c: ds90ub953: Use
 v4l2_subdev_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-frame-desc-passthrough-v4-2-dbe2412297cc@ideasonboard.com>
References: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
In-Reply-To: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2742;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=EwtCfSMyC1bK19UIOk34q1JdivYUQPm+OZei5Yp7ZCg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4RIsaoTwrUKPNgTci5Ivzka+6jPVZnRt0c3fn
 AxhLH7FKjeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ESLAAKCRD6PaqMvJYe
 9fLsEACrlTGE7J6rN5mHRsYSftoEm6aZBZyyH5V6TI3U8XHB+AU005S2goTY/kwt6j8iFAegk3p
 cMOjgl803EL8bM9d6nmsPsmTrBUOM3fcZUbMD5+S3x0PdtdXmG8I/A3hH4MX4iHM2yumBTWR574
 iMUdo8o3lbp0ClKU0RhGxEjnR3OrhnMgoDnofztWdES81yVp+8d135Qz4F0OTa7ZW6bBqlgb+sU
 G2g49DO7ziMp0FctVlKiRZSoOiLFVZV152gwYeYeVA8uyy9ZT082sqgugHklhsoQ2xxg0R572Jp
 aYvRH37lf9/u4uRP/7GPKLKVGvWH51LblAWPo2CL6D5j9GyN/7rVuKZ9si5msIT7PsuACXYn8f5
 AyZQwCidpHsuh47Ug5PO6ANZc+iJ/JQwl1V8Qg1RPnk4jDTrtGEyxWgfJAiKLjmfrRoC+Jx0/a3
 oAaE26eS3/FKf/r98q7UYDGj8YsJeoC5w0guTHjcHW6lWOJRGxFzUGvDEW+2F66m9xEW9poHqpJ
 HbnMCp6rPZUw5q0TK+HMPTcGAayioiSjphD/seXwckCXMKR6Nqvucvttbxs0+jdgHfFR3tadyZr
 +zKl9a8zGgilmK5NSaNyotveNqs1frHCK17TaIgYuw7umDpFMHcI839stRtQMpZfFuKQruQEhaX
 rTmAbHSz0OLzeSA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new v4l2_subdev_get_frame_desc_passthrough helper for
.get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 61 +------------------------------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332..b5896d20f9c5 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -489,65 +489,6 @@ static int ub953_set_routing(struct v4l2_subdev *sd,
 	return _ub953_set_routing(sd, state, routing);
 }
 
-static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_frame_desc *fd)
-{
-	struct ub953_data *priv = sd_to_ub953(sd);
-	struct v4l2_mbus_frame_desc source_fd;
-	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	if (pad != UB953_PAD_SOURCE)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
-			       priv->source_sd_pad, &source_fd);
-	if (ret)
-		return ret;
-
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	for_each_active_route(&state->routing, route) {
-		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
-		unsigned int i;
-
-		if (route->source_pad != pad)
-			continue;
-
-		for (i = 0; i < source_fd.num_entries; i++) {
-			if (source_fd.entry[i].stream == route->sink_stream) {
-				source_entry = &source_fd.entry[i];
-				break;
-			}
-		}
-
-		if (!source_entry) {
-			dev_err(&priv->client->dev,
-				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
-		}
-
-		fd->entry[fd->num_entries].stream = route->source_stream;
-		fd->entry[fd->num_entries].flags = source_entry->flags;
-		fd->entry[fd->num_entries].length = source_entry->length;
-		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
-		fd->entry[fd->num_entries].bus.csi2.vc =
-			source_entry->bus.csi2.vc;
-		fd->entry[fd->num_entries].bus.csi2.dt =
-			source_entry->bus.csi2.dt;
-
-		fd->num_entries++;
-	}
-
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
 
 static int ub953_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
@@ -723,7 +664,7 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 	.enable_streams = ub953_enable_streams,
 	.disable_streams = ub953_disable_streams,
 	.set_routing = ub953_set_routing,
-	.get_frame_desc = ub953_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub953_set_fmt,
 };

-- 
2.43.0


