Return-Path: <linux-media+bounces-28611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09EA6D5CB
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0561892A78
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F6A25D55E;
	Mon, 24 Mar 2025 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qubhuNz1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699F25D532;
	Mon, 24 Mar 2025 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803509; cv=none; b=Jhdt1oIRu8sBFaBAQ1RtuR8WCIKKoH8WqLfOekl07dVlmHWj5q70DCjgZoSkmrEuLWI8MEK4CIBPwv1WXs3bvaVx8N7/Mb4TNX1rWdECVdPyvgzRyp8iAAzp/y0+LZyHisaUjH5wsmEWH4s2ABlgEVnYnnh0V+ib8VjiePd5e6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803509; c=relaxed/simple;
	bh=CW2HMs0XwwdWNF0z9jeJT15ET7DbR6dbxCPOb57gTgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZDCdgMIx+JsVLWQkTDCIhOuhzPyb1A/S+iLyLdkkrl4W4fCa23cog+zvvnEG71I9pW3AB35AbxotX8fSt/pDvlxeN1QBkwknbths6rO7UEsz440cmN9EMlXVGd/eVZKq+Q8/e20XKFzvFrGgko9mkjMUz7tg8c8jvSoaauEd+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qubhuNz1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD9F410DD;
	Mon, 24 Mar 2025 09:03:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803397;
	bh=CW2HMs0XwwdWNF0z9jeJT15ET7DbR6dbxCPOb57gTgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qubhuNz1O7vm9OLTwB/ck3S/HfuYsRk9dGn6UMXYdKMOkGmUUfhJJEZenY9ja00Yg
	 8H1Hde5YgCxBJot+9+vTzDk0b0/REca/RUU1X78iwjV7kOHk3lr4rsaPsLVCgmM/Ap
	 M+JLqgeV2XTJSpkOaTYOjuxDwvR9mOtOWoZiwYrs=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 10:04:46 +0200
Subject: [PATCH v4 3/3] media: i2c: ds90ub913: Use
 v4l2_subdev_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-frame-desc-passthrough-v4-3-dbe2412297cc@ideasonboard.com>
References: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
In-Reply-To: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2627;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=CW2HMs0XwwdWNF0z9jeJT15ET7DbR6dbxCPOb57gTgY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4RIs2d3FK4AfzpkhoaSd1vrqISNwE4XJC0Z35
 lObQtayJZ2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ESLAAKCRD6PaqMvJYe
 9QsjEACRgtJezDL/Lywj7jagb4Rfy1jhwRAR3R88JSCKWSv3MVyc3QRGXOezUd/RQkm0btQE7ed
 hxwBvywetxt9LvBhaCJIBgtcauLOee+qPp+zIgp77eMmPGbvSTd3FIbt+TI2fV/Ax3kT8Vt/EKW
 8vdbDevP8JyUj5CgT4m/AhRhf93eK8+Gf2sFm4eu+5QfLtCNrxgqVpXoFRQgf4ySGu8twUPs0xo
 r9zNzPbcaSc++opGCJ8ooYalK7HnlYvW7tK0kWJXhqymYqA6iXrxAsJY90VOCzuRoBqsymbt23d
 QaopHw19GF/PZWi45FKP4heBFU2Q4csC8a2Gz5HtYwBRPe5cEjEFvo0lWk1btmMWcpFSqaHhoay
 bo0n9GuWgRSgjSst25W7MnDdeSRl26B4MRyAVuc3v9Lt/Hg5ko3pGA7+dBoiYoqEbHuvspAm3sj
 W5dQv0u3k8+M/TjufNdkws5HlgFxzwZcasKkxMjChUWbFhrc8HAuI8WIKS+clTWJwq5HIJ6AUN9
 woJP+hQHz/mf2AYLNXcEqAxMmDsvvnbqXMpWmW1uZhqqTicNvlXzyl+5gU1knRhWrJVxdkslRHZ
 dadO0qF3uKbvhn6BN/lWI12KC8txzisCokwAWeA3FY4e1AgVf1wGsCff8zxHu6Es3CqY680cUym
 pQYPPyI8772aPfA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new v4l2_subdev_get_frame_desc_passthrough helper for
.get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 59 +------------------------------------------
 1 file changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bf..f3b9d2a84bad 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -358,63 +358,6 @@ static int ub913_set_routing(struct v4l2_subdev *sd,
 	return _ub913_set_routing(sd, state, routing);
 }
 
-static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_frame_desc *fd)
-{
-	struct ub913_data *priv = sd_to_ub913(sd);
-	const struct v4l2_subdev_krouting *routing;
-	struct v4l2_mbus_frame_desc source_fd;
-	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	if (pad != UB913_PAD_SOURCE)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
-			       priv->source_sd_pad, &source_fd);
-	if (ret)
-		return ret;
-
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	routing = &state->routing;
-
-	for_each_active_route(routing, route) {
-		unsigned int i;
-
-		if (route->source_pad != pad)
-			continue;
-
-		for (i = 0; i < source_fd.num_entries; i++) {
-			if (source_fd.entry[i].stream == route->sink_stream)
-				break;
-		}
-
-		if (i == source_fd.num_entries) {
-			dev_err(&priv->client->dev,
-				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
-		}
-
-		fd->entry[fd->num_entries].stream = route->source_stream;
-		fd->entry[fd->num_entries].flags = source_fd.entry[i].flags;
-		fd->entry[fd->num_entries].length = source_fd.entry[i].length;
-		fd->entry[fd->num_entries].pixelcode =
-			source_fd.entry[i].pixelcode;
-
-		fd->num_entries++;
-	}
-
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
 static int ub913_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
@@ -514,7 +457,7 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
 	.enable_streams = ub913_enable_streams,
 	.disable_streams = ub913_disable_streams,
 	.set_routing = ub913_set_routing,
-	.get_frame_desc = ub913_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
 };

-- 
2.43.0


