Return-Path: <linux-media+bounces-36228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB35AED200
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 02:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F583AB173
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 00:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0531443164;
	Mon, 30 Jun 2025 00:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YT2bttxx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DA1A285
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 00:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244392; cv=none; b=l1pLMA1/wEcXlERc4yxokQs2tZHgdveamH1fgTo/+6cKm5/TLU19jPvb6vMYko1g7X4wM65tX2LD0/msw4BSdFizrGhuV33aiWiz01N/Fww3W4A5vej43f97xIML963g1+TR0bAnzge6HstNjWgCWlmFxZtvi0uaXVHFEu9iEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244392; c=relaxed/simple;
	bh=jMH4qyuGZCHeXZqP0alxGVZxyD4sk2Nn0URvzFyG+Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+aiomJULNbkqvIfLy82upec07yiN/Z9veyTg2Qm8R3ApBWB3/zrIK3aCbt3uJLAZ3w4b6yya9RAiJgrYaiPQXRFBPRzB4Atm86+stlHh8wC/ENkB4Aw0Z84FofHIOehIdklfTrd4DGkB5vtff+rZttZX68xiWernYFHHV2ogxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YT2bttxx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65797928;
	Mon, 30 Jun 2025 02:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751244366;
	bh=jMH4qyuGZCHeXZqP0alxGVZxyD4sk2Nn0URvzFyG+Rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YT2bttxxijaw2xpLkdCaNtEszcjk1NfNqj6f6Fw/VYUzHiAhhVMjKhGz4ZskWxRV7
	 YacMPVLcVBqzhb0ZMjJ5wteM+4F1Q5F6ihYKhvNW6qu27YYQm+gSa0oCvFOI7zoViw
	 UuZghrXdt5R7C+6qby1XT5oe1r/3iqcTNXob2FxY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH 1/2] media: i2c: ds90ub913: Stop accessing streams configs directly
Date: Mon, 30 Jun 2025 03:46:01 +0300
Message-ID: <20250630004602.23075-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
References: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_stream_config structure will be made private. Stop
accessing it directly, iterate over routes instead to initialize
formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index c34ffeae5f50..8c94e91ab1cc 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -333,8 +333,7 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
 		.xfer_func = V4L2_XFER_FUNC_SRGB,
 	};
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
+	struct v4l2_subdev_route *route;
 	int ret;
 
 	/*
@@ -354,13 +353,15 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	stream_configs = &state->stream_configs;
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_framefmt *fmt;
 
-	for (i = 0; i < stream_configs->num_configs; i++) {
-		if (stream_configs->configs[i].pad == UB913_PAD_SINK)
-			stream_configs->configs[i].fmt = in_format;
-		else
-			stream_configs->configs[i].fmt = out_format;
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		*fmt = in_format;
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+						   route->source_stream);
+		*fmt = out_format;
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart


