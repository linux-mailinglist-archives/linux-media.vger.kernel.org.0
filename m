Return-Path: <linux-media+bounces-17715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B796E5F0
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B0981F24BA2
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEC91B4C2E;
	Thu,  5 Sep 2024 22:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L5FHN/nE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E01B1425;
	Thu,  5 Sep 2024 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576817; cv=none; b=DinpOCbDcQIogq2t/7qraCeBcpZsbD+YJuhzOOu9BTsxADAA6zTlYccZd6VFl6VW3fpX4y4U+pK58/zSZgxTnlzZAGC8EaGmLKpUQEuxGRI32kV4dQ6N1qgcGi04b84aLLcXYwB05Og2uIQyXCwlPUan8bdkLgZYyLQk+tA9nPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576817; c=relaxed/simple;
	bh=nEdyS6y7cAZfLXda/uyC5EEe/rOzj2G8C6Rro+ttGn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqYWxZUH5XM9PAJqBqlw/plX/mZZKPMDlRB3R0WtR7KvqkJ/NVCU4fgGYP+euXTpYGTr6f/CR6ttRb4CLnEWGxAuQN1eCdB4jc8pzZC09PHN96k9/UA7pCP+NHcktgWjr8FBd/UKGdzZkG5f0xNXAqb7v12ofv0ZVD4AdUse6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L5FHN/nE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2331718B9;
	Fri,  6 Sep 2024 00:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576730;
	bh=nEdyS6y7cAZfLXda/uyC5EEe/rOzj2G8C6Rro+ttGn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L5FHN/nEAHcmljSKJC0Ptz6rWlker/4HDwSorw/pEFK1mXNyqoFcvYXIh/7A86PZo
	 /K6EZD3e8rOMyCr9+MXe7ac6moIEN8qUbtsHqjchjvLlnzubBYEqOa6tUsqAGZufL4
	 SSaHQWfewzw5tWM8NKqwVcw8dybZGYDMxawuDeWE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 5/9] media: i2c: ar0144: Add image stream
Date: Fri,  6 Sep 2024 01:53:03 +0300
Message-ID: <20240905225308.11267-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for embedded data stream support, introduce a new
ar0144_stream_ids enumeration for stream IDs, with a single value,
AR0144_STREAM_IMAGE for the image data stream. Use it when accessing the
formats, crop and compose rectangles on the source pad. This is meant to
reduce the size of further commits, and doesn't introduce any functional
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index ea76d484e6d1..432f2dba58d2 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -342,6 +342,10 @@ enum ar0144_pad_ids {
 	AR0144_NUM_PADS,
 };
 
+enum ar0144_stream_ids {
+	AR0144_STREAM_IMAGE,
+};
+
 struct ar0144_model {
 	bool mono;
 };
@@ -534,7 +538,8 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	 */
 	__v4l2_ctrl_grab(sensor->link_freq, true);
 
-	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					      AR0144_STREAM_IMAGE);
 	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
 	compose = v4l2_subdev_state_get_compose(state, AR0144_PAD_IMAGE);
 	info = ar0144_format_info(sensor, format->code, true);
@@ -890,7 +895,8 @@ static int ar0144_s_ctrl(struct v4l2_ctrl *ctrl)
 	 * configuration.
 	 */
 	state = v4l2_subdev_get_locked_active_state(&sensor->sd);
-	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					      AR0144_STREAM_IMAGE);
 	info = ar0144_format_info(sensor, format->code, true);
 	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
 
@@ -1180,7 +1186,8 @@ static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
 		if (!info)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+						   AR0144_STREAM_IMAGE);
 		break;
 
 	default:
@@ -1207,15 +1214,17 @@ static int ar0144_set_fmt(struct v4l2_subdev *sd,
 	    format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EBUSY;
 
-	/* The format can only be set on the source pad. */
-	if (format->pad != AR0144_PAD_SOURCE)
+	/* The format can only be set for the image stream on the source pad. */
+	if (format->pad != AR0144_PAD_SOURCE ||
+	    format->stream != AR0144_STREAM_IMAGE)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
 	/*
 	 * Only the media bus code can be updated on the source pad, dimensions
 	 * are set by the compose on the image pad rectangle.
 	 */
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	info = ar0144_format_info(sensor, format->format.code, true);
 	fmt->code = ar0144_format_code(sensor, info);
 
@@ -1339,7 +1348,8 @@ static int ar0144_set_selection(struct v4l2_subdev *sd,
 	}
 
 	/* Propagate the compose rectangle to the output format. */
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	fmt->width = compose->width;
 	fmt->height = compose->height;
 
@@ -1359,7 +1369,8 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	code = fmt->code;
 	v4l2_subdev_unlock_state(state);
 
@@ -1369,7 +1380,7 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	fd->num_entries = 1;
 
 	fd->entry[0].pixelcode = code;
-	fd->entry[0].stream = 0;
+	fd->entry[0].stream = AR0144_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
 	fd->entry[0].bus.csi2.dt = info->dt;
 
@@ -1467,7 +1478,8 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 
 	info = ar0144_format_info(sensor, 0, true);
 
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	fmt->width = AR0144_DEF_WIDTH;
 	fmt->height = AR0144_DEF_HEIGHT;
 	fmt->code = ar0144_format_code(sensor, info);
@@ -1544,7 +1556,8 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
 	 * rate) and blanking controls.
 	 */
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					      AR0144_STREAM_IMAGE);
 	info = ar0144_format_info(sensor, format->code, true);
 
 	ar0144_update_link_freqs(sensor, info);
-- 
Regards,

Laurent Pinchart


