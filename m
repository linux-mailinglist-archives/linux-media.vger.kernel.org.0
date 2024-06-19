Return-Path: <linux-media+bounces-13647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625890E145
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDBA62841C6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E9310A03;
	Wed, 19 Jun 2024 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GoTfb3CK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939EA6FB8;
	Wed, 19 Jun 2024 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760270; cv=none; b=Fz6aLC22w1flkoha8FBcRKbqK2Za6vZ9fONKUwKxJo7jCUL/babNPYb7OHSAyaKiZVOWkw6oZeu6S7dCtLx+mUEr+wrlhumHv3OZLmieg1DxIiBkNjhBFAk1RVl7gaVXnw9IMZPwdzZmNVQ+1YLuYTOaK68pmX8foOGRf7FgBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760270; c=relaxed/simple;
	bh=YTxAEnF666VLTPV6Ru8lkNDk/zUjMbICv0YvCoEr+Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+0wkF3Q8tsyTWJB8ZsnVruq5w3OnVlcKr4KFhPVcwYaz13odvGaBuTrK5mz5xSlZsRQr5CRa9d/MqPZc3U9yjoF/6+I7kcgdyp62fLlJnWn3mP0dKEMXwEwfnMPTle9hFL/G+Y9YraZo35eEKu4JWwt5GS3Wdbvh4z77LQncxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GoTfb3CK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0A271207;
	Wed, 19 Jun 2024 03:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760248;
	bh=YTxAEnF666VLTPV6Ru8lkNDk/zUjMbICv0YvCoEr+Z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoTfb3CKX3t+vFVKb2qRjkFRKmBxuV/LIDAFsYpXKacRWNAjna5rAYo6sZZxY5rXH
	 uMLQaE3Yy5vGcOkS4IehVnGN5IrbhPLX5T6Mvi6783RUBTD8V+4Xe/XJVSortEOvjp
	 HW5OAQThlFdSJmhNu9kCRNGz75a0hcG7i2xz1Z/8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/8] media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate()
Date: Wed, 19 Jun 2024 04:23:53 +0300
Message-ID: <20240619012356.22685-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() helper function is meant to be used as a
drop-in implementation of a V4L2 subdev entity .link_validate() handler.
It supports subdev-to-subdev links only, and complains if one end of the
link is not a subdev. This forces drivers that have video output devices
connected to subdevs to implement a custom .link_validate() handler,
calling v4l2_subdev_link_validate() for the subdev-to-subdev links, and
performing manual link validation for the video-to-subdev links.

Video devices embed a media entity, and therefore also have a
.link_validate() operation. For video capture devices, the operation
should be manually implemented by drivers for validate the
subdev-to-video links. For video output devices, on the other hand, that
operation is never called, as link validation is performed in the
context of the sink entity.

As a result, we end up forcing drivers to implement a custom
.link_validate() handler for subdevs connected to video output devices,
when the video devices provide an operation that could be used for that
purpose.

To improve that situation, make v4l2_subdev_link_validate() delegate
link validation to the source's .link_validate() operation when the link
source is a video device and the link sink is a subdev. This allows
broader usage of v4l2_subdev_link_validate(), and simplifies drivers by
making video device link validation easy to implement in the video
device .link_validate(), regardless of whether the video device is an
output device or a capture device.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++----
 include/media/v4l2-subdev.h           |  6 ++++
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2d5e39c79620..e1e1333cfb0a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1458,13 +1458,43 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	if (WARN_ON(!is_media_entity_v4l2_subdev(link->sink->entity)))
 		return -EINVAL;
 
-	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
-		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
-			     link->source->entity->name, link->source->index,
-			     link->sink->entity->name, link->sink->index);
-		return 0;
+	/*
+	 * If the source is a video device, delegate link validation to it. This
+	 * allows usage of this helper for subdev connected to a video output
+	 * device, provided that the driver implement the video output device's
+	 * .link_validate() operation.
+	 */
+	if (is_media_entity_v4l2_video_device(link->source->entity)) {
+		struct media_entity *source = link->source->entity;
+
+		if (!source->ops || !source->ops->link_validate) {
+			/*
+			 * Many existing drivers do not implement the required
+			 * .link_validate() operation for their video devices.
+			 * Print a warning to get the drivers fixed, and return
+			 * 0 to avoid breaking userspace. This should
+			 * eventually be turned into a WARN_ON() when all
+			 * drivers will have been fixed.
+			 */
+			pr_warn_once("video device '%s' does not implement .link_validate(), driver bug!\n",
+				     source->name);
+			return 0;
+		}
+
+		/* Avoid infinite loops. */
+		if (WARN_ON(source->ops->link_validate == v4l2_subdev_link_validate))
+			return -EINVAL;
+
+		return source->ops->link_validate(link);
 	}
 
+	/*
+	 * If the source is still not a subdev, usage of this helper is a clear
+	 * driver bug.
+	 */
+	if (WARN_ON(!is_media_entity_v4l2_subdev(link->source->entity)))
+		return -EINVAL;
+
 	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
 	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1b74e037e440..731be85a7af1 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1250,6 +1250,12 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  * calls v4l2_subdev_link_validate_default() to ensure that
  * width, height and the media bus pixel code are equal on both
  * source and sink of the link.
+ *
+ * The function can be used as a drop-in &media_entity_ops.link_validate
+ * implementation for v4l2_subdev instances. It supports all links between
+ * subdevs, as well as links between subdevs and video devices, provided that
+ * the video devices also implement their &media_entity_ops.link_validate
+ * operation.
  */
 int v4l2_subdev_link_validate(struct media_link *link);
 
-- 
Regards,

Laurent Pinchart


