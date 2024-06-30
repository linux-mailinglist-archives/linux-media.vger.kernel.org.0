Return-Path: <linux-media+bounces-14420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D51EF91D20F
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5A0BB20CB8
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F96615350B;
	Sun, 30 Jun 2024 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rl7Rm0ny"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A34115219E;
	Sun, 30 Jun 2024 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757127; cv=none; b=AJoiJ6UiIfUwW39fbqZ5q77rav0Y8K81DHqvak3sE/3XSJRQ+1w1vmKOQ4RhWQLwtOFaILGuNYVbxqLZWM9K3OL0WK4nzCLS9YYlqe5Ma4j781NBjTknpa8D26IkeVYUehrX5UIpqHbibvxFhrssjpPluhdfDN6U5rJKak2Ncr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757127; c=relaxed/simple;
	bh=Ys+gPWsAH3SE3mBu6KVfpv3wDtW8vwyBGNa/n78CvvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbhJE6eite0A/RhstTfpiApDuk1o38Jh0xlKa/ClhzLGV6b00DwOF3Mb5M/5BBUZPt/SJLIlNKWmdAHvItD0/OJ3xXUkrgt/TJIvr9Q/yWy+BRy6oEbjm0B1XIJI6NQsqOWQQyFZ8DwQr+U7WTXIL4c6mm60TlPQ+j6OX09uziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rl7Rm0ny; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4BB24B0;
	Sun, 30 Jun 2024 16:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757092;
	bh=Ys+gPWsAH3SE3mBu6KVfpv3wDtW8vwyBGNa/n78CvvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rl7Rm0ny1Pfvo2AcP52GFiVgAJVhCe0Xwj51NvvsoT5Z62YXSDQQPo7PKA4hG+taM
	 tKr3aBllwg64edz82NtLkXRYgqIUocuGcvwxQsPKTbHLpBTsYfHK/dlQicXsmd6evp
	 rq0KoBYcOnZa+vE43OFX0bkQ6w9WHJVy8PMMDDss=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 5/9] media: i2c: ar0144: Add image stream
Date: Sun, 30 Jun 2024 17:17:55 +0300
Message-ID: <20240630141802.15830-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
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
index 2d3ce05f85ac..edf793f2122e 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -340,6 +340,10 @@ enum ar0144_pad_ids {
 	AR0144_NUM_PADS,
 };
 
+enum ar0144_stream_ids {
+	AR0144_STREAM_IMAGE,
+};
+
 struct ar0144_model {
 	bool mono;
 };
@@ -526,7 +530,8 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	int ret = 0;
 	u16 val;
 
-	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					      AR0144_STREAM_IMAGE);
 	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
 	compose = v4l2_subdev_state_get_compose(state, AR0144_PAD_IMAGE);
 	info = ar0144_format_info(sensor, format->code, true);
@@ -873,7 +878,8 @@ static int ar0144_s_ctrl(struct v4l2_ctrl *ctrl)
 	 * configuration.
 	 */
 	state = v4l2_subdev_get_locked_active_state(&sensor->sd);
-	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					      AR0144_STREAM_IMAGE);
 	info = ar0144_format_info(sensor, format->code, true);
 	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
 
@@ -1166,7 +1172,8 @@ static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
 		if (!info)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+						   AR0144_STREAM_IMAGE);
 		break;
 
 	default:
@@ -1193,15 +1200,17 @@ static int ar0144_set_fmt(struct v4l2_subdev *sd,
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
 
@@ -1325,7 +1334,8 @@ static int ar0144_set_selection(struct v4l2_subdev *sd,
 	}
 
 	/* Propagate the compose rectangle to the output format. */
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	fmt->width = compose->width;
 	fmt->height = compose->height;
 
@@ -1345,7 +1355,8 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	code = fmt->code;
 	v4l2_subdev_unlock_state(state);
 
@@ -1355,7 +1366,7 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	fd->num_entries = 1;
 
 	fd->entry[0].pixelcode = code;
-	fd->entry[0].stream = 0;
+	fd->entry[0].stream = AR0144_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
 	fd->entry[0].bus.csi2.dt = info->dt;
 
@@ -1453,7 +1464,8 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 
 	info = ar0144_format_info(sensor, 0, true);
 
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_IMAGE);
 	fmt->width = AR0144_DEF_WIDTH;
 	fmt->height = AR0144_DEF_HEIGHT;
 	fmt->code = ar0144_format_code(sensor, info);
@@ -1530,7 +1542,8 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
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


