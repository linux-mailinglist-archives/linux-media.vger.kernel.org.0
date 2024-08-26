Return-Path: <linux-media+bounces-16803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56095F1B0
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E711F200E7
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B3118BC09;
	Mon, 26 Aug 2024 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RlRqrv7n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AD188584;
	Mon, 26 Aug 2024 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676082; cv=none; b=iwMKDjFQf808W29Jr8l95ypH68d9uJ9XGTFLG/5L7ATQ1Kphe0fMWcsYyPQ19jRzCHcK4Tgk06925qY90gpspSO71oGtxL90FtoHSOEdGP7KzviHa2HTNc2W3yuus46UOvikbqtgzkjzcL4X51/zgc6kyTu7+pr+SRLLS6ljW2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676082; c=relaxed/simple;
	bh=SxMIqFS6SWymda0VHG0xFKm6S+RPDfcEs0E4NjlsKD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5Y4y7pFTYF1PljR/NHZUxIuZpdSlu0jzACgnxt+Q0Evy/mXLUhTp2uZsLF4Zm1NRAD+9oycGr69ffZXpzgOlM7No4fTnsOnfCmM+t7e+0o0OT8Vnyb7fXj8zzjfUWVePCpjHn7NKwc2zBz5QoClURAN9RcINSm/AIDZvh0hMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RlRqrv7n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BC2F6CA;
	Mon, 26 Aug 2024 14:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676012;
	bh=SxMIqFS6SWymda0VHG0xFKm6S+RPDfcEs0E4NjlsKD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RlRqrv7nlQaxNIJUjtfhEXyYX30OsyqP8/MHyN0aBwMymy/7hJqki2+NrZ/LPKOfv
	 eWVd+DcOb6w+ie+qhyOuJ5xblIohyVNj+8HngHv+Lrz0xUA/J8Sbbz18cl5OcZaPXj
	 bzyZ5r8uBpLCT5eNJLxQN8NN18F4kwtuWOkTJK+E=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 5/7] media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate()
Date: Mon, 26 Aug 2024 15:41:04 +0300
Message-ID: <20240826124106.3823-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
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
Changes since v2:

- Expand comment about infinite loops
---
 drivers/media/v4l2-core/v4l2-subdev.c | 43 +++++++++++++++++++++++----
 include/media/v4l2-subdev.h           |  6 ++++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d3196042d5c5..3a4ba08810d2 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1450,13 +1450,46 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
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
+		/*
+		 * Avoid infinite loops in case a video device incorrectly uses
+		 * this helper function as its .link_validate() handler.
+		 */
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
index bd235d325ff9..8daa0929865c 100644
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


