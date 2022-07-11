Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7630C56FFC6
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 13:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiGKLMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 07:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiGKLMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 07:12:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B3F32D97
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 03:21:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6CEA4B80D77
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 10:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA06C34115;
        Mon, 11 Jul 2022 10:21:23 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCHv2 6/8] v4l2-ctrls: add v4l2_ctrl_modify_dimensions
Date:   Mon, 11 Jul 2022 12:21:09 +0200
Message-Id: <20220711102111.2688139-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711102111.2688139-1-hverkuil-cisco@xs4all.nl>
References: <20220711102111.2688139-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new function to modify the dimensions of an array control.

This is typically used if the array size depends on e.g. the currently
selected video format.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 36 ++++++++++++++++
 include/media/v4l2-ctrls.h               | 53 ++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 6f1b72c59e8e..878da8592106 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -989,6 +989,42 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(__v4l2_ctrl_modify_range);
 
+int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+				  u32 dims[V4L2_CTRL_MAX_DIMS])
+{
+	unsigned int elems = 1;
+	unsigned int i;
+	void *p_array;
+
+	lockdep_assert_held(ctrl->handler->lock);
+
+	if (!ctrl->is_array || ctrl->is_dyn_array)
+		return -EINVAL;
+
+	for (i = 0; i < ctrl->nr_of_dims; i++)
+		elems *= dims[i];
+	if (elems == 0)
+		return -EINVAL;
+	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);
+	if (!p_array)
+		return -ENOMEM;
+	kvfree(ctrl->p_array);
+	ctrl->p_array_alloc_elems = elems;
+	ctrl->elems = elems;
+	ctrl->new_elems = elems;
+	ctrl->p_array = p_array;
+	ctrl->p_new.p = p_array;
+	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
+	for (i = 0; i < ctrl->nr_of_dims; i++)
+		ctrl->dims[i] = dims[i];
+	for (i = 0; i < elems; i++)
+		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
+	cur_to_new(ctrl);
+	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE);
+	return 0;
+}
+EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
+
 /* Implement VIDIOC_QUERY_EXT_CTRL */
 int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctrl *qc)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index e0f32e8b886a..683e9903a6ea 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -963,6 +963,59 @@ static inline int v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	return rval;
 }
 
+/**
+ *__v4l2_ctrl_modify_dimensions() - Unlocked variant of v4l2_ctrl_modify_dimensions()
+ *
+ * @ctrl:	The control to update.
+ * @dims:	The control's new dimensions.
+ *
+ * Update the dimensions of an array control on the fly. The elements of the
+ * array are reset to their default value, even if the dimensions are
+ * unchanged.
+ *
+ * An error is returned if @dims is invalid for this control.
+ *
+ * The caller is responsible for acquiring the control handler mutex on behalf
+ * of __v4l2_ctrl_modify_dimensions().
+ *
+ * Note: calling this function when the same control is used in pending requests
+ * is untested. It should work (a request with the wrong size of the control
+ * will drop that control silently), but it will be very confusing.
+ */
+int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+				  u32 dims[V4L2_CTRL_MAX_DIMS]);
+
+/**
+ * v4l2_ctrl_modify_dimensions() - Update the dimensions of an array control.
+ *
+ * @ctrl:	The control to update.
+ * @dims:	The control's new dimensions.
+ *
+ * Update the dimensions of an array control on the fly. The elements of the
+ * array are reset to their default value, even if the dimensions are
+ * unchanged.
+ *
+ * An error is returned if @dims is invalid for this control type.
+ *
+ * This function assumes that the control handler is not locked and will
+ * take the lock itself.
+ *
+ * Note: calling this function when the same control is used in pending requests
+ * is untested. It should work (a request with the wrong size of the control
+ * will drop that control silently), but it will be very confusing.
+ */
+static inline int v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+					      u32 dims[V4L2_CTRL_MAX_DIMS])
+{
+	int rval;
+
+	v4l2_ctrl_lock(ctrl);
+	rval = __v4l2_ctrl_modify_dimensions(ctrl, dims);
+	v4l2_ctrl_unlock(ctrl);
+
+	return rval;
+}
+
 /**
  * v4l2_ctrl_notify() - Function to set a notify callback for a control.
  *
-- 
2.35.1

