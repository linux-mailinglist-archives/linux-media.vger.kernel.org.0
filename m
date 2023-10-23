Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195D47D41D0
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 23:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbjJWVkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 17:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbjJWVkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 17:40:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C880D7C
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 14:40:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DFAA1ABC;
        Mon, 23 Oct 2023 23:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698097203;
        bh=Ciux3kDGpBB3tcyTaVisSwawHx/Bvxdk81oTW8Ezo0E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XNU/6FjiiZIOdIJ3e7Cff3SqBM333a3jRsgMnrc2ZB3TZYGKK2t0Xn+DglnYktJaN
         SZqr6+INYj9XmXfZqjuW5cPI9288WzLwUrQhzL0Fw9Sp87nlXaJoqMvvWU2EHfFck7
         lgBEgVDw9q7un9a3pOOo1t3MD6uJ5wSxGsTTievM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/7] media: v4l2-subdev: Rename pad config 'try_*' fields
Date:   Tue, 24 Oct 2023 00:40:11 +0300
Message-ID: <20231023214011.17730-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The try_fmt, try_crop and try_compose fields of the
v4l2_subdev_pad_config structure are misnamed (for historical reason) as
they also store data for the subdev active configuration. Rename them to
format, crop and compose respectively and update the accessor helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c1f90c1223a7..bb1aad264756 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -688,21 +688,18 @@ struct v4l2_subdev_ir_ops {
 /**
  * struct v4l2_subdev_pad_config - Used for storing subdev pad information.
  *
- * @try_fmt: &struct v4l2_mbus_framefmt
- * @try_crop: &struct v4l2_rect to be used for crop
- * @try_compose: &struct v4l2_rect to be used for compose
+ * @format: &struct v4l2_mbus_framefmt
+ * @crop: &struct v4l2_rect to be used for crop
+ * @compose: &struct v4l2_rect to be used for compose
  *
  * This structure only needs to be passed to the pad op if the 'which' field
  * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
- *
- * Note: This struct is also used in active state, and the 'try' prefix is
- * historical and to be removed.
  */
 struct v4l2_subdev_pad_config {
-	struct v4l2_mbus_framefmt try_fmt;
-	struct v4l2_rect try_crop;
-	struct v4l2_rect try_compose;
+	struct v4l2_mbus_framefmt format;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
 };
 
 /**
@@ -1145,8 +1142,8 @@ struct v4l2_subdev_fh {
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 /**
- * v4l2_subdev_get_pad_format - ancillary routine to call
- *	&struct v4l2_subdev_pad_config->try_fmt
+ * v4l2_subdev_get_pad_format - ancillary routine to get
+ *	&struct v4l2_subdev_pad_config->format
  *
  * @sd: pointer to &struct v4l2_subdev
  * @state: pointer to &struct v4l2_subdev_state
@@ -1161,12 +1158,12 @@ v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
 		return NULL;
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &state->pads[pad].try_fmt;
+	return &state->pads[pad].format;
 }
 
 /**
- * v4l2_subdev_get_pad_crop - ancillary routine to call
- *	&struct v4l2_subdev_pad_config->try_crop
+ * v4l2_subdev_get_pad_crop - ancillary routine to get
+ *	&struct v4l2_subdev_pad_config->crop
  *
  * @sd: pointer to &struct v4l2_subdev
  * @state: pointer to &struct v4l2_subdev_state.
@@ -1181,12 +1178,12 @@ v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
 		return NULL;
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &state->pads[pad].try_crop;
+	return &state->pads[pad].crop;
 }
 
 /**
- * v4l2_subdev_get_pad_compose - ancillary routine to call
- *	&struct v4l2_subdev_pad_config->try_compose
+ * v4l2_subdev_get_pad_compose - ancillary routine to get
+ *	&struct v4l2_subdev_pad_config->compose
  *
  * @sd: pointer to &struct v4l2_subdev
  * @state: pointer to &struct v4l2_subdev_state.
@@ -1201,7 +1198,7 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
 		return NULL;
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &state->pads[pad].try_compose;
+	return &state->pads[pad].compose;
 }
 
 /*
-- 
Regards,

Laurent Pinchart

