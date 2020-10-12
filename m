Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3520228B05C
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgJLIh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:37:28 -0400
Received: from retiisi.eu ([95.216.213.190]:38888 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgJLIh2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:37:28 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C4C7B634C87;
        Mon, 12 Oct 2020 11:36:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] v4l: subdev: Improve link format validation debug messages
Date:   Mon, 12 Oct 2020 11:37:19 +0300
Message-Id: <20201012083719.23767-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The existing link format validation failure debug message in media-entity.c
helped to poinpoint the point of failure but provided no additional
information what's wrong. Tell the user exactly why the validation failed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Print the link if there were mismatches

 drivers/media/v4l2-core/v4l2-subdev.c | 48 +++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a7d508e74d6b..956dafab43d4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -792,21 +792,55 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *source_fmt,
 				      struct v4l2_subdev_format *sink_fmt)
 {
+	bool pass = true;
+
 	/* The width, height and code must match. */
-	if (source_fmt->format.width != sink_fmt->format.width
-	    || source_fmt->format.height != sink_fmt->format.height
-	    || source_fmt->format.code != sink_fmt->format.code)
-		return -EPIPE;
+	if (source_fmt->format.width != sink_fmt->format.width) {
+		dev_dbg(sd->entity.graph_obj.mdev->dev,
+			"%s: width does not match (source %u, sink %u)\n",
+			__func__,
+			source_fmt->format.width, sink_fmt->format.width);
+		pass = false;
+	}
+
+	if (source_fmt->format.height != sink_fmt->format.height) {
+		dev_dbg(sd->entity.graph_obj.mdev->dev,
+			"%s: height does not match (source %u, sink %u)\n",
+			__func__,
+			source_fmt->format.height, sink_fmt->format.height);
+		pass = false;
+	}
+
+	if (source_fmt->format.code != sink_fmt->format.code) {
+		dev_dbg(sd->entity.graph_obj.mdev->dev,
+			"%s: media bus code does not match (source 0x%8.8x, sink 0x%8.8x)\n",
+			__func__,
+			source_fmt->format.code, sink_fmt->format.code);
+		pass = false;
+	}
 
 	/* The field order must match, or the sink field order must be NONE
 	 * to support interlaced hardware connected to bridges that support
 	 * progressive formats only.
 	 */
 	if (source_fmt->format.field != sink_fmt->format.field &&
-	    sink_fmt->format.field != V4L2_FIELD_NONE)
-		return -EPIPE;
+	    sink_fmt->format.field != V4L2_FIELD_NONE) {
+		dev_dbg(sd->entity.graph_obj.mdev->dev,
+			"%s: field does not match (source %u, sink %u)\n",
+			__func__,
+			source_fmt->format.field, sink_fmt->format.field);
+		pass = false;
+	}
 
-	return 0;
+	if (pass)
+		return 0;
+
+	dev_dbg(sd->entity.graph_obj.mdev->dev,
+		"%s: link was \"%s\":%u -> \"%s\":%u\n", __func__,
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	return -EPIPE;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
-- 
2.27.0

