Return-Path: <linux-media+bounces-26337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB90A3BAB6
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F92F7A21C4
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242171D61B1;
	Wed, 19 Feb 2025 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k8miZrTT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8D1C831A;
	Wed, 19 Feb 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958272; cv=none; b=sZp37T2uD0Blgx3uXojqaHvg/yqlGTAXHtHrJdJLcQbYOaVtzfj11c7uZR5xbd+1bxhWrsjc6NEWnaEnSvv/oiNTy3ar+InvivmLOWgn1xk47UMyRRCpxQrFM7KUKFOvuRBPux0KeQIrrTI+E9PAXUlJhC5ybKkE7kP90XkW3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958272; c=relaxed/simple;
	bh=oeUCSWR9CCrCrP5eG3cO6wj/6eGU83kC+RAzKws5f+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJMx0nyoaJrAHkfVj1bW7A/tNlfGB87mE03rVTRkRJ4dlZTDJpZAfl9YYHNS3Y8+fQghLn82tvy6Gvxe1gdJh3xhGiXeN4u2WYXnheyB+2WTLjSYWreuit0QT3pHw389QIZsLg3gg0wTyGvJJkDxIuHSGbwxbJxVviVzCUvFuEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k8miZrTT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03D2DBEB;
	Wed, 19 Feb 2025 10:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739958184;
	bh=oeUCSWR9CCrCrP5eG3cO6wj/6eGU83kC+RAzKws5f+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k8miZrTT3k1mf/aLSl+hxnzBsFmoENK0iKIwV2bH3HgUimN8UNVTEqh9dMeouNs2p
	 X3R+m57hPSYw1Zio2Vtj8SJkp4VidnCkPKY1D0J9OUccXxG8to7fkfla8u3dTWoAnb
	 nvFbFnPujaJ+36y45lNMMbMvjz7fOSf4q5qtte5A=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 11:44:08 +0200
Subject: [PATCH v2 2/3] media: i2c: ds90ub953: Use
 v4l2_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-frame-desc-passthrough-v2-2-5135d57ecd6a@ideasonboard.com>
References: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
In-Reply-To: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=oeUCSWR9CCrCrP5eG3cO6wj/6eGU83kC+RAzKws5f+Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntaf43ssz0i6fx0J4CLSv0AOvF3NQhKWvLe+vX
 3If6t3II8qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7Wn+AAKCRD6PaqMvJYe
 9XiGD/9CNGJY9DDuG4RpSwNcuHYDA5zmjI253as2dME5Ejo7zD0vmwr2/ja+yhsLqwbJybRzU0I
 YklhxpGFLyRxNFzTGvP2aOfEztBjV8e79SIKKSxfrzXgV/kO1HXBXkcXHjz6BXhu3a+y/HeI2eE
 sgeGJ3+4nVw9dIldtVIoEChWmgQ+kRVAkpZnJ4ML4CflkAdTs3e6hauzI9I0B/MnzW+WI3fonjH
 CV0lMSLW+QaNTucMIOAd5Xgp0C2PVbNJ8YhfLDMu3YXbIPvkXWaTZV08lOIVhfQ4ZIHWbunX2hk
 3PJEgoEyOzUyj9vXQw+OwvWVewqsMwbmybtZc7nFPvwAf5V1XOrjWvssOV7JEHsc/3kZ/g9whET
 hdO2LJxcA4rMj5Mn4TySndCEVGBW37kznn/OPPWsEGrkHU7tgmj4ZaVDj2PIsL/rwZG3ALfX1SH
 8z2bKOXBKwNzdnhYZweoBy2fwV3GEzq7iz5hBMujgdcsdQzp1Ecybci5HsH7ddTOm9sj2rX8HsY
 r9kbJzACBjUSLJjUY5pO06huek1+/6X41KET72Bi7M86wLUG7h80Lzrihwdx4vYjllWkmCysfcP
 5Iara0IUq8rQNV8D5Uh1iZCUrHwmoAcKvBFIKDFU+TaFPbTGaFvkezcEpfTadfG+/fbiL2KHgU+
 AklcOnArDHd9pUw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new v4l2_get_frame_desc_passthrough helper for .get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 61 +------------------------------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332..6622a150f802 100644
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
+	.get_frame_desc = v4l2_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub953_set_fmt,
 };

-- 
2.43.0


