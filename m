Return-Path: <linux-media+bounces-26300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4EA3A25E
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 17:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 889CF7A45C4
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFEE26FA54;
	Tue, 18 Feb 2025 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gjIwmzEO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989126F44F;
	Tue, 18 Feb 2025 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739895364; cv=none; b=ce/xpnpWLFYdoKOuaS7pGfAhi1xdZSCLlwSfK6QAR3oAdDKfAiG6tZVKvipXCFFxbhpgYry6shSA14yeu11TXgnHOJ8O+xwMPbreEJSEThedZKjtv8LDlDPEPuszum1ADX5vcyngMddIIoXXXP1gi7i21cAvJEtKtCZJP1gN4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739895364; c=relaxed/simple;
	bh=3aGNDO4JPGcz2XPIJhdm7F9SVuX+jTc81pEhyWCKxhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fe0jMpHLLiuPafZqWIqcoLw6RMIPuXsu+IRVOJiHZunDGiE2dbrNWLLdkLlHGeYQup5S8hq/pTYjLpaed6/cF0wx9tzrvIw9OtVIo5PYzmdrs5sY6sf/4ItA4+9CNjasXHqUaE3iy0J2Yjx9sQH927JZvyY/JANC1jbuWXlUQ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gjIwmzEO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4482D11B3;
	Tue, 18 Feb 2025 17:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739895270;
	bh=3aGNDO4JPGcz2XPIJhdm7F9SVuX+jTc81pEhyWCKxhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gjIwmzEO1uZhW6pDh5xLgRLSclVd/TqvKdDUAmiJ1ZSsqsQH88mYygZJjRpWZjMK+
	 wBFHJlLtJi51oFNSoKYfiUomm7l3/drzTc/ovhMtI6cVdA8DqH2oqbrA+lh9xfeSwx
	 P2KH2qTgrkv4hJZfO1JYb5P0BQD7POXkKicZpR5A=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 18 Feb 2025 18:15:45 +0200
Subject: [PATCH 3/3] media: i2c: ds90ub913: Use
 v4l2_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-frame-desc-passthrough-v1-3-a32458f53714@ideasonboard.com>
References: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
In-Reply-To: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=3aGNDO4JPGcz2XPIJhdm7F9SVuX+jTc81pEhyWCKxhI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntLI28ANwKJQokEh7xxdkjn3nkeg60xVF3Cjru
 01VvcAxb6mJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7SyNgAKCRD6PaqMvJYe
 9TWBD/kBbmglgL+bJymB7/EInkgH2b3/ZmxiFDs27ybq0xyzuLRwVm88MB1UttgmDUE5dmZExDr
 oyhUanOfI6a4ysIQzVrP1aHynz911fOIqFsF+5QWvRr3QUOLkjEc8gU7ZxZ+LBOh8VNBb1nGdIc
 Yal1s1BXnz8LLZfPNUYamun6F28XTRv/SD2sEPxEUTxPBfZcDjlXa4LCFb4F8NinfAjUr4JiGJ7
 HAYsK1wyce/WSlGst1wIJhDwwcXGdYoTRNJxsKC5Mq7sfqgLQA0rYdNWYjd9ceJB1nOVcxnSiWT
 bmcMDRk7gG3XoeZ3gJ4AMmM9ZRRwPWW5VmcrYS4VgvPgb1GlcTTvvJ9IEfCe20Aj6EDdc0LRx0N
 suB3+OPjs5VFk0DEFo/kVPY8/efSMPC/N+DQHGnBd5x4oFu19ou3HCoIPVK9DpvADFjR194Flwt
 RiTVT37DMAcUFS1cFhvAKfDQjdJsxk/t8MQsho7n4cQQDrGah/vXa6HBNvMuSP9v+Vu1g2cL/yn
 GuZRj2Fn91lx59IPc+mNZ/tkuBMmikTxMhcQHB0TVquzlta6HaEA4fNNnl6qwtp5/VQnDoiqhv8
 cs1VNHzibiCyrEfDbxT6aQtk8TZFepT4pMTEfhcqRNPj/sZ5Z33FcwdSYqF+8LBl1gf4ZBKX+Kv
 Ig+gogsE0/zMVmw==
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


