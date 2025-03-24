Return-Path: <linux-media+bounces-28606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5FA6D5B2
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B51189344A
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239C925D526;
	Mon, 24 Mar 2025 08:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eVJPC3bz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD325D1F7;
	Mon, 24 Mar 2025 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803254; cv=none; b=nEvNHRPQ6VUqZgr4j82/jhMSx2L/xYb0cICaZUoLrI1G7KFsXtsExiUvPcRLCcfsIS//CL7vBdNHhsj2z3IiMUp+Q8+B9nxxNful3RFMcysyUWC5G30H2bBvioLzzPCMEVgMDQqYrGcpSCSd5WuLiPHAcCDqytB5rVZEvgtNsVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803254; c=relaxed/simple;
	bh=Z7qhj397sWj/XKrwjJPBIaqt/OgIzo0k41A6Jd78daA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JX0eTfzjPffaut+qq/W1Ka/PNa511Af7W7TZCMOV5wp2Z8z+3w1IVRoRHbdfBRd0lUlmMNjH/nVUEDAM1MVKyEw3YDcqv9AiXPZnl0b951LRqUmBqh8LL0MTZJ/SHSDVqfsl0pUzQh+qFikGhWwIDne+vPHGcLS1d+wc8+3P9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eVJPC3bz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E10A61059;
	Mon, 24 Mar 2025 08:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803137;
	bh=Z7qhj397sWj/XKrwjJPBIaqt/OgIzo0k41A6Jd78daA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eVJPC3bzFt2pyOrIxSJETrNL7WxoWYBd8sad9B13feTjNYYIGum32xxSFR1uEKfUC
	 UIA4lQqXiP5XjN/iuFdlfBvq85FteySL4ddWkLDZVabsajcOuuW2kMB1ZyETGHT/yO
	 P0bs4h9dbeTUqqGYfVqGwaX2GRfOoh6G3ScMzEB4=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 10:00:12 +0200
Subject: [PATCH v3 2/3] media: i2c: ds90ub953: Use
 v4l2_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-frame-desc-passthrough-v3-2-993839a1f9b3@ideasonboard.com>
References: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
In-Reply-To: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Z7qhj397sWj/XKrwjJPBIaqt/OgIzo0k41A6Jd78daA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4REpTWnmzdQGi9yp26TWf2NXTYCV8HoiLT2BG
 eLBUcvJ5oSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ERKQAKCRD6PaqMvJYe
 9fE9D/sFHKwqliO24pQ2X6zTPccqTT/eClMjhO5WFobVBnX0TI6HrHfxSomKlIN0WikWzgBF4+1
 11VnDQ9HYK+LC5mP2/CeN5UJFGDh7xGAAgoGxvhyof7AUlKsP9mUK++OEybfr2F6PyDJdQDMhsp
 58ckZNWqQXYIB70sgGEkQWlhDokrASopK+CV+8EkaO09Fv5fxRxe+N7/dfFAiC0P9KCrfPk+y/4
 dwdsnc5VmiEEerEjstqLcHDLE0I/lYT0C2sqYFYQ9bF/jhOT+QcYVexFbQh+WEdUtH3jmlWQX5i
 fGnF9Ejs6LJpcptOFJtm27+owXhCtgqs7yJyOKaISfwHPXz4YVMxqmdNw47Ro7yXFz5UdawQpjI
 cgrE9SjrY1J46pSanP83/qsvhii2vNODHPNfvKjOa/5EcpAOuH4Wwoh3vJxPlf2f7KFndZJBNLq
 thJ0i3uR/Eo5kHSOk1dYEKic9eJYWoBdALy9xHtfwFrQM3vY6GPDFnGT9BsdjWtyNffzuNUAj5x
 eVi7gEpAHPAd/6AxV8UUPeOYQayZDMHhleDB2DjC9Hx4YvpK/MrVPgFmeBGQBayDUco/utgk49e
 G9rZrcmMO41qL+yayKSNfbr+Zuv56JJIP34kg77L7uj0nlMrKsCMd/6k2JQL53zzI6qqbTEqS0V
 PvlMNeNRQqhq54w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new v4l2_get_frame_desc_passthrough helper for .get_frame_desc.

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


