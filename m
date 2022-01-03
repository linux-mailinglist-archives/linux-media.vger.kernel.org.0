Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5ED4834B2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbiACQYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56394 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbiACQYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:30 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C36D5F49;
        Mon,  3 Jan 2022 17:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227067;
        bh=88pRPBllNLVT3RbIszHyusMBqJQPf61i0Nd9HfKA2B0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jHjyIdSWU0yZpXe1IRJzwd6TzcN0M9iby5NUk/mn2knOxKZV8XE6oUkxWKCgbW603
         EIS7cAXbnFL9PrHJULi1htQdV0Wn73NqAcf6eB0BF59VP3CC10+NHJ9qEKEK/UyMz3
         5zFNzj/WX/HaSruuG3YTvJIVTIuv6xN9g78zqw2w=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 3/8] media: v4l2-subdev: Drop .set_mbus_config() operation
Date:   Mon,  3 Jan 2022 18:24:09 +0200
Message-Id: <20220103162414.27723-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .set_mbus_config() operation is deprecated, and nothing in the
kernel uses it. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  8 --------
 include/media/v4l2-mediabus.h         | 15 +++++++--------
 include/media/v4l2-subdev.h           | 13 -------------
 3 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5d27a27cc2f2..30eb50407db5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -318,13 +318,6 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
 
-static int call_set_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_config *config)
-{
-	return check_pad(sd, pad) ? :
-	       sd->ops->pad->get_mbus_config(sd, pad, config);
-}
-
 static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.get_fmt		= call_get_fmt,
 	.set_fmt		= call_set_fmt,
@@ -338,7 +331,6 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.dv_timings_cap		= call_dv_timings_cap,
 	.enum_dv_timings	= call_enum_dv_timings,
 	.get_mbus_config	= call_get_mbus_config,
-	.set_mbus_config	= call_set_mbus_config,
 };
 
 static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 841e190aedd9..96af9cedacde 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -15,15 +15,14 @@
  * How to use the V4L2_MBUS_* flags:
  * Flags are defined for each of the possible states and values of a media
  * bus configuration parameter. One and only one bit of each group of flags
- * shall be set by the users of the v4l2_subdev_pad_ops.get_mbus_config and
- * v4l2_subdev_pad_ops.set_mbus_config operations to ensure that no
- * conflicting settings are specified when reporting and setting the media bus
- * configuration with the two operations respectively. For example, it is
- * invalid to set or clear both the V4L2_MBUS_HSYNC_ACTIVE_HIGH and the
+ * shall be set by the users of the v4l2_subdev_pad_ops.get_mbus_config
+ * operation to ensure that no conflicting settings are specified when
+ * reporting the media bus configuration. For example, it is invalid to set or
+ * clear both the V4L2_MBUS_HSYNC_ACTIVE_HIGH and the
  * V4L2_MBUS_HSYNC_ACTIVE_LOW flag at the same time. Instead either flag
- * V4L2_MBUS_HSYNC_ACTIVE_HIGH or flag V4L2_MBUS_HSYNC_ACTIVE_LOW shall be
- * set. The same is true for the V4L2_MBUS_CSI2_1/2/3/4_LANE flags group: only
- * one of these four bits shall be set.
+ * V4L2_MBUS_HSYNC_ACTIVE_HIGH or flag V4L2_MBUS_HSYNC_ACTIVE_LOW shall be set.
+ * The same is true for the V4L2_MBUS_CSI2_1/2/3/4_LANE flags group: only one
+ * of these four bits shall be set.
  *
  * TODO: replace the existing V4L2_MBUS_* flags with structures of fields
  * to avoid conflicting settings.
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 95ec18c2f49c..6c153b33bb04 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -715,17 +715,6 @@ struct v4l2_subdev_state {
  *		     this operation as close as possible to stream on time. The
  *		     operation shall fail if the pad index it has been called on
  *		     is not valid or in case of unrecoverable failures.
- *
- * @set_mbus_config: set the media bus configuration of a remote sub-device.
- *		     This operations is intended to allow, in combination with
- *		     the get_mbus_config operation, the negotiation of media bus
- *		     configuration parameters between media sub-devices. The
- *		     operation shall not fail if the requested configuration is
- *		     not supported, but the driver shall update the content of
- *		     the %config argument to reflect what has been actually
- *		     applied to the hardware. The operation shall fail if the
- *		     pad index it has been called on is not valid or in case of
- *		     unrecoverable failures.
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -768,8 +757,6 @@ struct v4l2_subdev_pad_ops {
 			      struct v4l2_mbus_frame_desc *fd);
 	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_config *config);
-	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
-			       struct v4l2_mbus_config *config);
 };
 
 /**
-- 
Regards,

Laurent Pinchart

