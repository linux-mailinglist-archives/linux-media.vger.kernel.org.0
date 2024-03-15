Return-Path: <linux-media+bounces-7111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CB87CA44
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5AA81C221D2
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1C5179AE;
	Fri, 15 Mar 2024 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n2Og9Qtb"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842D175A5
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710492748; cv=none; b=S2wRTBWrnYUtkyiQlh+6LCBVcush+kqBwFnVeK/sraxZD91P6wXdWLQbdS4E0tdQfVQNxH+f/jxXfUhMbKnr3/jXZ2Uz8tQDjU5gMQB3HncPsLosvA8ams8bVfROlwBzO3a3YqHCk7ffXR21D9oQ/3ZOHLp48CbtmmB/64Z9vN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710492748; c=relaxed/simple;
	bh=WBjcfuW+oYe6hv1ira32Mb7zDoaAk09BrvuRN8CLtrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDymE9nv9/2CqmKb2cthYcMk88LGZ68UfRADsg/QvyNBiF5egGt/3/pJwFboFXLctuHQbNRLz/MyPDqKzzce4CxbYSSzhdCJ55VzJ9s33u0IB5LQjwx4SJPpFf6N84sxrZRn0G3u+d5vELg3BuD6Cl7FkhoaE9SZP83SAcNeNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n2Og9Qtb; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710492745;
	bh=WBjcfuW+oYe6hv1ira32Mb7zDoaAk09BrvuRN8CLtrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2Og9QtbZe8RTTvMEDcWU5zU56oK0g5/D68KQjW7makKxwjfJWnpWwk0KH6y+Nf1Z
	 IkdmWT+pOcLkz3PLW57aWDo6mmd9H6W7CeaQxx8kxooJ3KDeKpLY6yAvpQinP8F1Pj
	 yFWyD/YwKSgYT0nZ4uADKCXV6eaoAKFaH3s6M2PF4bQHOUhNPiYDeqtv/YA+juch1g
	 qihY/C58/zhzBPsixBFrD2tIsVpMAkal8SnfG0c/X9YqyaGlnEyBZZhAQVeHh869LD
	 Z15Enqze5uzKU8NHFYJS8y5hHP57W6bkKIi6B6V/wxPZxaFmQNvEkewO6FIG/sZMbu
	 VVvfItnUDGjXA==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1C7A0378210E;
	Fri, 15 Mar 2024 08:52:25 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 4/4] media: i2c: st-vgxy61: Implement set_routing callback
Date: Fri, 15 Mar 2024 09:51:58 +0100
Message-ID: <20240315085158.1213159-5-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315085158.1213159-1-julien.massot@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's possible to bypass the Intelligent Status Line, through the
bypass register. Allows to remove the internal route from the meta
pad to the source pad.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/st-vgxy61.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 754853378ee6..f931c51fddbb 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1221,6 +1221,46 @@ static int vgxy61_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int vgxy61_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
+	struct device *dev = &sensor->i2c_client->dev;
+	unsigned int isl_bypass = VGXY61_ISL_BYPASS;
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	if (sensor->streaming)
+		return -EBUSY;
+
+	if (routing->num_routes != 1 && routing->num_routes != 2)
+		return -EINVAL;
+
+	route = &routing->routes[0];
+	if (route->sink_pad != VGXY61_PAD_PIXEL ||
+	    route->source_stream != VGXY61_STREAM_PIXEL) {
+		dev_warn(dev, "Can't disable pixel route\n");
+		return -EINVAL;
+	}
+
+	if (routing->num_routes == 2) {
+		route = &routing->routes[1];
+		if (route->sink_pad != VGXY61_PAD_META  ||
+		    route->source_stream != VGXY61_STREAM_META)
+			return -EINVAL;
+		isl_bypass = 0;
+	}
+
+	ret = cci_update_bits(sensor->regmap, VGXY61_REG_BYPASS_CTRL,
+			      VGXY61_ISL_BYPASS, isl_bypass, NULL);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
 static int __vgxy61_set_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_mbus_framefmt *format,
@@ -1518,6 +1558,7 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
 	.enum_mbus_code = vgxy61_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = vgxy61_set_fmt,
+	.set_routing = vgxy61_set_routing,
 	.get_frame_desc = vgxy61_get_frame_desc,
 	.get_selection = vgxy61_get_selection,
 	.enum_frame_size = vgxy61_enum_frame_size,
-- 
2.44.0


