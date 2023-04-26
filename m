Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A506EF03E
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 10:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239817AbjDZIa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 04:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjDZIa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 04:30:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5DF3A94
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-b9968fb4a8cso6854611276.0
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682497825; x=1685089825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3VvY5qMZLce/da5NSM2FURd5mXhraxzBD6mRNX76xh0=;
        b=enpIaLYGUVGM198WkXSzhzOiWXugnuRPVI5tVWhUg6MOrfKm2pCz3rIbgHEOhEtdK6
         aIgjMBKUwaewkaoNYecLSDEs8dUtMhn1m5iDyfBZFp+p8QvFF9AQc0QxLzx46a8VDB9I
         qAU+BV+5Ike2wIoCPWvHEhHfmyBCey4L0pZLibQJqO7JqOe8QtmXsNlM8U/3y6Pb2JSR
         7IX3xa24oRXayNIWo1etc4a8JDePFiYjt5nrC8+qf1dXdG2YOfztqor8onEBqfLme9AK
         FiMrAEGONkDJkCoMITFPo7j1ai0Ch5W92mk9tEC6UbJmpyxofYpiWw4XoKJMsVBvbnDi
         3dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497825; x=1685089825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VvY5qMZLce/da5NSM2FURd5mXhraxzBD6mRNX76xh0=;
        b=LABXCeZRiKcznxnutXLu4wtQzhgLKYPNWmu2Jxd0n8eNeqDUTLKWBlTlQCJzJFzwaS
         Ju3B7qN/w+GIRIihx2UsKfSqe5DxAqTDmbB5K6BUVu4PKl6VovJYSMJZCMq6blrDeJC0
         w2fqNp4ZkHwN94/M7OTMOfIHpSTow+8kv8n+sjdaS/K/NVHBhT2peGQ+l5ToMh3krkb0
         xUNjpaFdS45xMQo4DnfLHS2rqWd3bx6c16BVE8VoXLEHEA9AZ4sCE+bb8lCk2XHqtGlO
         Uxhtdk246nbANrhQmCH1cWJvbr/rsiV+e8bRMX5c2PTogBICO17AmY1P1Nd4m2ftWwPJ
         Yqyg==
X-Gm-Message-State: AAQBX9fIY20PSFBKpoQ8hydWHYeUBHq/OddOSaUCdIdztd5StB8OSUJY
        SRzKjDwNV1nEPUTvkPBhg5Hsro5LmHQ=
X-Google-Smtp-Source: AKy350a9bJfq6YugdrRNYS1bx4C+G62/9SnypRjBlqge/XzOTDxeLbcyZym1dux738BkY2A6HgNF6plp0L4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:1f4e:598b:ed:99bd])
 (user=yunkec job=sendgmr) by 2002:a25:d144:0:b0:b95:bdfb:df09 with SMTP id
 i65-20020a25d144000000b00b95bdfbdf09mr7727252ybg.7.1682497825496; Wed, 26 Apr
 2023 01:30:25 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:29:14 +0900
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230426082923.132909-3-yunkec@google.com>
Subject: [PATCH v11 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce uvc_ctrl_get_boundary(), making it easier to extend to
support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
following patches.

For now, it simply returns EINVAL for compound controls and calls
__query_v4l2_ctrl() for non-compound controls.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v10:
- Fix __uvc_ctrl_get_boundary_std() typo causing build error.
- Added Reviewed-by from Sergey.
Changelog since v9:
- Make __uvc_ctrl_get_boundary_std() static.
Changelog since v8:
- No Change.
Changelog since v7:
- Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
- Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
  instead of in the patch where we implement compound control.
- Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
  __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
  holding the mutex.
- Define a uvc_ctrl_mapping_is_compound() for readability.

 drivers/media/usb/uvc/uvc_ctrl.c | 48 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5e9d3da862dd..4a4ceb6289f5 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -884,6 +884,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	}
 }
 
+static bool
+uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
+{
+	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
+}
+
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
@@ -1877,6 +1883,48 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 }
 
+static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
+				       struct uvc_control *ctrl,
+				       struct uvc_control_mapping *mapping,
+				       struct v4l2_ext_control *xctrl)
+{
+	struct v4l2_queryctrl qc = { .id = xctrl->id };
+
+	int ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &qc);
+
+	if (ret < 0)
+		return ret;
+
+	xctrl->value = qc.default_value;
+	return 0;
+}
+
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl)
+{
+	struct uvc_control *ctrl;
+	struct uvc_control_mapping *mapping;
+	int ret;
+
+	if (mutex_lock_interruptible(&chain->ctrl_mutex))
+		return -ERESTARTSYS;
+
+	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
+	if (!ctrl) {
+		ret = -EINVAL;
+		goto done;
+	}
+
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		ret = -EINVAL;
+	else
+		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
+
+done:
+	mutex_unlock(&chain->ctrl_mutex);
+	return ret;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle,
 	struct v4l2_ext_control *xctrl)
 {
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 35453f81c1d9..0ee3932ec33a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1095,15 +1095,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
+			ret = uvc_ctrl_get_boundary(chain, ctrl);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
 			}
-
-			ctrl->value = qc.default_value;
 		}
 
 		return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a596c8d894a..87222dd8920e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -781,6 +781,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,
-- 
2.40.1.495.gc816e09b53d-goog

