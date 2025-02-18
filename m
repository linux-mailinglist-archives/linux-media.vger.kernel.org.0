Return-Path: <linux-media+bounces-26299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDBA3A262
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 17:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D22616209C
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D126126F472;
	Tue, 18 Feb 2025 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cEDH5VYj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A720626E65D;
	Tue, 18 Feb 2025 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739895364; cv=none; b=HnU3t+DvimuMmosEG0C98f2p6wlkP/Brpw3w2YedVSz7vUzV9ZmxgtI/eGVQ5u7kj8V2uO/QKd8YQc7NDUa3B+E0fovsU/ywehEx66YlulKxFe6LYtsHzQvGQWw1q+MGmDWPJt9Cy80W7qi3aUKcYBDsYy5D16G1SwgHtRgOSAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739895364; c=relaxed/simple;
	bh=oeUCSWR9CCrCrP5eG3cO6wj/6eGU83kC+RAzKws5f+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqNR6ak7IMEzU+2ZibJKqZRO2ilzxCXZZ+7N97WaTl7HKSo14kMBQlN6wnoxRPKplBKom7oDKReySvNReWIwEJc0UjtLJlWfihzLMSIuHjRnXxQcSP7Jja69+3RIu3uwuqQ5wsKjfEzbzDzAHa1akdApXn3rBQmxLAoP5oJuoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cEDH5VYj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C254C8BF;
	Tue, 18 Feb 2025 17:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739895270;
	bh=oeUCSWR9CCrCrP5eG3cO6wj/6eGU83kC+RAzKws5f+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cEDH5VYjrmuzeGoQz6ycPXW+2lfo+OVGzp7/MPIjOkrMZ3xMmbCZzcoAF2QZ2xC8H
	 e8FoYPVIneO9Lk5d2oFCpm5Qg+qMUebimIsaAeIf1pERiT1d6z1O/z+EkgLopZYQsm
	 FujtDmJFiaeAaaN49lEgkyE0h0yf8P5maab3GSzU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 18 Feb 2025 18:15:44 +0200
Subject: [PATCH 2/3] media: i2c: ds90ub953: Use
 v4l2_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-frame-desc-passthrough-v1-2-a32458f53714@ideasonboard.com>
References: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
In-Reply-To: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=oeUCSWR9CCrCrP5eG3cO6wj/6eGU83kC+RAzKws5f+Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntLI1FHpVymdpu7dBWZidfAH4HQ6qjxZ1HLGqG
 fjYQCtvgASJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7SyNQAKCRD6PaqMvJYe
 9YvnD/4nhBeP0lE9LL5P1AUoL1b/1Qt+VzXGC57MvIcm3PRIeGxT9yayuP6xBuE6yKwlKB0MTX1
 ociJr3f37AKR5B567Bg+4umeEbyZ2RWYS7c1MA2x+mMIwi61x9wT1L8maP1XjfIjbYKXCcGD2Do
 q582t1LMX6H3q4yT2sFc+5DJ6DRJXT5PGyPaeuczwJeo6z6TwhY7jUhP0zrWFD5CfCGmBZWIyBq
 GQn3CKEYl9yg7Fljl3k4O2hDayXRXl7yjjnlSoT2y6sQtaPX+z1SKBwoTbj7KnwvZW9jl2CPuYn
 RxSFEB8BdpwN3OTsGojNCcPqGaso4Pt+Aaee/wpEJha4iQd5ibnHV8dq7FjB0Dt8xdF+fPprvLd
 VyT9neD84J3mHraz9Mh5R+/fwwZME1/csN7NChFlxXAaKkxcGhG6/x0Ws7oTh2OtPWQqZXyDzMS
 t0QoKVpah2fBjEga2GsGVAJWa70Bjolg9LvMuaHHz0dE0MbGsHKfIGjC/WzDuVgPr+x+TROBw8x
 6jWr01djv6J0ztxGRkY8C5SPWs5a114sgK0Phs64S4WxL1tpznKl1IeJnX9X7PtwqkBDISWNqb1
 llotpFV3Y77+v6DGIfBvSdgiZwbgvDkBgXgG0XziwNEoDfdIEzpbovmsg15DmcKtn0dFGRbVl2B
 s51+lWvqQM26DbQ==
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


