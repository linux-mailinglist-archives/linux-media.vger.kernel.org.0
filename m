Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F224F7940
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 10:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242737AbiDGIRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 04:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240339AbiDGIRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 04:17:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E893C1DAFB3
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:15:08 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CA938AF;
        Thu,  7 Apr 2022 10:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649319306;
        bh=yzJbJeQ7FhQNL7DOLzm34FshCtPWUHTLx5FJ6sPSe+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j22EwppGRJxEuO+s+E4SQx3klmClhfJ2sy0ppNqxnYXY6C8x6hJ3WJBG70PIb/Rt4
         uR8iEQ3pw7pWXwa97WDULzPSBdhhnCK2P6B5dSGx4h/TKa76rt7p8MW1aLBilSdUYy
         40RHRzlKhYa7O+dkbWwDu/jm/fzsx632V3kRGa3k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 3/8] media: subdev: rename v4l2_subdev_get_pad_* helpers
Date:   Thu,  7 Apr 2022 11:14:19 +0300
Message-Id: <20220407081424.295870-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
References: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev state is now used for both try and active cases. Rename
rename v4l2_subdev_get_try_* helpers to v4l2_subdev_get_pad_*.

Temporary wapper helper macros are added to keep the drivers using
v4l2_subdev_get_try_* compiling. The next step is to change the uses
in th drivers, and then drop the helpers.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/v4l2-subdev.h | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1bbe4383966c..027ec2dec55d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -989,7 +989,7 @@ struct v4l2_subdev_fh {
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 /**
- * v4l2_subdev_get_try_format - ancillary routine to call
+ * v4l2_subdev_get_pad_format - ancillary routine to call
  *	&struct v4l2_subdev_pad_config->try_fmt
  *
  * @sd: pointer to &struct v4l2_subdev
@@ -997,7 +997,7 @@ struct v4l2_subdev_fh {
  * @pad: index of the pad in the &struct v4l2_subdev_state->pads array
  */
 static inline struct v4l2_mbus_framefmt *
-v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
+v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state,
 			   unsigned int pad)
 {
@@ -1007,7 +1007,7 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
 }
 
 /**
- * v4l2_subdev_get_try_crop - ancillary routine to call
+ * v4l2_subdev_get_pad_crop - ancillary routine to call
  *	&struct v4l2_subdev_pad_config->try_crop
  *
  * @sd: pointer to &struct v4l2_subdev
@@ -1015,7 +1015,7 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
  * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
  */
 static inline struct v4l2_rect *
-v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
+v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
 			 unsigned int pad)
 {
@@ -1025,7 +1025,7 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
 }
 
 /**
- * v4l2_subdev_get_try_compose - ancillary routine to call
+ * v4l2_subdev_get_pad_compose - ancillary routine to call
  *	&struct v4l2_subdev_pad_config->try_compose
  *
  * @sd: pointer to &struct v4l2_subdev
@@ -1033,7 +1033,7 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
  * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
  */
 static inline struct v4l2_rect *
-v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
+v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    unsigned int pad)
 {
@@ -1042,6 +1042,19 @@ v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
 	return &state->pads[pad].try_compose;
 }
 
+/*
+ * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
+ * renamed
+ */
+#define v4l2_subdev_get_try_format(sd, state, pad) \
+	v4l2_subdev_get_pad_format(sd, state, pad)
+
+#define v4l2_subdev_get_try_crop(sd, state, pad) \
+	v4l2_subdev_get_pad_crop(sd, state, pad)
+
+#define v4l2_subdev_get_try_compose(sd, state, pad) \
+	v4l2_subdev_get_pad_compose(sd, state, pad)
+
 #endif
 
 extern const struct v4l2_file_operations v4l2_subdev_fops;
-- 
2.25.1

