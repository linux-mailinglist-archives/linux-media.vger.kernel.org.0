Return-Path: <linux-media+bounces-26338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E8A3BADD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D142F3B26D7
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380DD1BC9F0;
	Wed, 19 Feb 2025 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ook6ip7K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2560F1CD213;
	Wed, 19 Feb 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958273; cv=none; b=qAxn2Jjt6vfuZc6Ct1vzTmsPh5AqEgx84qbp0DkMiPwXxfKDAwRuhTsqwpktaPuDucNl2bCslaJnBBZPpSD8PIPEOnH5+l0gwWFC/3Y6mbmWjUreriq+6x66A6n6oUZBXgB/GGjiOIY3L9RQh/OaH/v7RQ0IHMAtBaqh10ln9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958273; c=relaxed/simple;
	bh=3aGNDO4JPGcz2XPIJhdm7F9SVuX+jTc81pEhyWCKxhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuhrSW+QiKlNtUoi5l7e62FyjD/k6pMB/+DLr/pnip0WcBmeZgZScKXgI28Lrsnkm7potvOeRpqqp+oX/2ZJtNhhgS6XWSzHsEFkE713w1RKyL4HDHWLfpnMtindfwkmH3hzB+vm8K9ThJtn/67jN6wKVyk4ei5dkoJMm+O2tB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ook6ip7K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C6EED21;
	Wed, 19 Feb 2025 10:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739958184;
	bh=3aGNDO4JPGcz2XPIJhdm7F9SVuX+jTc81pEhyWCKxhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ook6ip7KEZmPutIEMqsGQficvTdxqcrR6VZggTSxlZdVjEEauX2We9C16073Q0hwq
	 iTyjjlBsrYb92k3YY1H+FFnIde1nYciwmlEWRAL25bFTfq6uGHauPgmBxnZJbVQGIa
	 HVv/mvDsnusQuJk3qzbepdzeoDrKjrikXchdK9iw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 11:44:09 +0200
Subject: [PATCH v2 3/3] media: i2c: ds90ub913: Use
 v4l2_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-frame-desc-passthrough-v2-3-5135d57ecd6a@ideasonboard.com>
References: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
In-Reply-To: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=3aGNDO4JPGcz2XPIJhdm7F9SVuX+jTc81pEhyWCKxhI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntaf4z7ZLOrBGD/K17IhmUXio4xWHAQT52VRq0
 IbUyql9CGiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7Wn+AAKCRD6PaqMvJYe
 9aWwD/4g4IdEzXw9peib70gAmY3Ndm22YVviyzgRWtez6ZntuOwlUtM90ZP9LT6+z0cmSyNEca9
 hPEyt3d9F3C+InY1FCVlzwUbHClpeDAc/oUHt+oJMjopbAKXk80SCIS5Fu4Ag1D4zO9vtLC7Rzg
 rxoFzoyjNQZBnenfsSIPafGBs5HVaGx5Qy/yS1LoPXxoYcbIHki/LVCPSpNdVPQfZPombhQ4mjz
 UE50QVtQxY4xuihyrJ6El6ZJhskVBmQxTzb5gy4LBi+i79P7WUHeHlA+hhW3WAyOe/Z0d7gBBgq
 4JuTgQUwOdXY0GsFd1eqFXMvrvxPEhz5nJJ1wIcys9d7u7OXnRJUnDcLCDAPCBwDqV+a3xj+UXR
 YoU1pza8jTzOLeHEJ1upBxcafmjk9JwT+YVzuN4Gv5kakIkCc7IcD/vtER3yvd+LnXOzcoRE9+N
 btt2V8n804o2pdZNMg2LMZGycB5tK7B9Kiswo+g9uVL8W0KYl+ETN/QzIblc0JhW3De3FQqYU4q
 mP9wtADl/rMVrwdL6VdTuhWndDMMIEijZrRU365FqbH+BvQG2rTb9hJ0ICe8gNno7CaON2U74lG
 N7oUZTmLG6j6/pGKCXWY8zpDqgeH2S0ju109pjGtrn77Fs1xbHBOUJ2HKzWd10nSrR6th5mEN0W
 QI8p8TK8YU+m5+g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new v4l2_get_frame_desc_passthrough helper for .get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 59 +------------------------------------------
 1 file changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bf..9ae761d7e3a5 100644
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
+	.get_frame_desc = v4l2_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
 };

-- 
2.43.0


