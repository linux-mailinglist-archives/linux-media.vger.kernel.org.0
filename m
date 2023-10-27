Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA1D7D9356
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345585AbjJ0JRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345577AbjJ0JQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE9D191
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6065B1BAE;
        Fri, 27 Oct 2023 11:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398202;
        bh=tG3coUZ+KBLC2FdA/3YDGfZCWKWiPDFygwazqAv4jCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wArX6NBtM8yltYdXFLaemvkLzUj/a968kTrHcyH268acmlkWcSnqgy6jcpxfRnqmg
         i4wggro11svZMrMVC3YwZDuBLhIYyWnHsrnm3E+21CdI8R+VvAVtwglFg7VWaA/cqx
         TEiOWKy7ERKyVVuV1DGd58tnjfFYlaE1iHc8kmjA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 9/9] media: v4l2-subdev: Rename pad config 'try_*' fields
Date:   Fri, 27 Oct 2023 12:16:49 +0300
Message-ID: <20231027091649.10553-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 drivers/media/v4l2-core/v4l2-subdev.c |  6 +++---
 include/media/v4l2-subdev.h           | 15 ++++++---------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index fa0a5b2933f6..2357d608194c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1694,7 +1694,7 @@ __v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
 			return NULL;
 
-		return &state->pads[pad].try_fmt;
+		return &state->pads[pad].format;
 	}
 
 	lockdep_assert_held(state->lock);
@@ -1728,7 +1728,7 @@ __v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
 			return NULL;
 
-		return &state->pads[pad].try_crop;
+		return &state->pads[pad].crop;
 	}
 
 	lockdep_assert_held(state->lock);
@@ -1762,7 +1762,7 @@ __v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
 			return NULL;
 
-		return &state->pads[pad].try_compose;
+		return &state->pads[pad].compose;
 	}
 
 	lockdep_assert_held(state->lock);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 72131c943e06..b471e68aa5e7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -688,17 +688,14 @@ struct v4l2_subdev_ir_ops {
 /**
  * struct v4l2_subdev_pad_config - Used for storing subdev pad information.
  *
- * @try_fmt: &struct v4l2_mbus_framefmt
- * @try_crop: &struct v4l2_rect to be used for crop
- * @try_compose: &struct v4l2_rect to be used for compose
- *
- * Note: This struct is also used in active state, and the 'try' prefix is
- * historical and to be removed.
+ * @format: &struct v4l2_mbus_framefmt
+ * @crop: &struct v4l2_rect to be used for crop
+ * @compose: &struct v4l2_rect to be used for compose
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
-- 
Regards,

Laurent Pinchart

