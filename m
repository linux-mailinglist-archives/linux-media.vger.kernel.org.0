Return-Path: <linux-media+bounces-38600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623BEB14504
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 01:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 877F516ED57
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 23:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B4A2264BE;
	Mon, 28 Jul 2025 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YhfQ8gP6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3651DD0D4
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 23:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753746631; cv=none; b=Nn3mC9rXEj2exjSAMjb6T/gy6N0glHhrvbXbUpxLcdg7OfyZ/epm4l8Ad9mtWJue802KTsa9DOUdpsrl7VIy+Fz3cwJLODMhqo+PqYYNnY53UeJzVXA6MzKb7iFq8HU3Lq2agxhVymsWGUz06TySedmlRXa7xuvhdFtbo/ylBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753746631; c=relaxed/simple;
	bh=AlqOWeaslUmBRhcmbj1sIR5ViV++ldXE2ba5XfRY1Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWp1FNUJql/ho9VOyPgevDO1UGQXtfwkh33ezJZr8GL8xax/AoC2wRFgOb3jzTvHu0ulqeiU+2lGlQEDzDz6vX8/lzy5ur7wm7+LulXroPgw6JfVr/TqJ+ihRCVj1eXF1TuSsy+wpF/XWhL2VUg9H3gwE9NMZV6ghCylEO9VlM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YhfQ8gP6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 70E0C1249;
	Tue, 29 Jul 2025 01:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753746577;
	bh=AlqOWeaslUmBRhcmbj1sIR5ViV++ldXE2ba5XfRY1Ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhfQ8gP6hFv4yRAoZH3bf87uINTCH0/MUuG4VR6X8upmPMFRoNQN/KdMKXFEDMSk4
	 HmWCFY8joch2HycITw/J8h/lE19deacguptXkpXwKrOszNdpIE4wB5c8kC+abTfMC9
	 NDS+TGyAShmv/CNEnSsoC6epV6EakaFg7gbY8JVw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 1/3] media: i2c: ds90ub913: Stop accessing streams configs directly
Date: Tue, 29 Jul 2025 02:50:08 +0300
Message-ID: <20250728235010.2926-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
References: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index bc74499b0a96..29c486c114c4 100644
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
 
 	ret = v4l2_subdev_routing_validate(sd, routing,
@@ -346,13 +345,15 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
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


