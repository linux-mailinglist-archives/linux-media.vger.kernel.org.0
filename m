Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E569655DC9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345363AbiF1MGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239822AbiF1MGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:06:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D1625291
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:06:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA9DE60F1D
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A97C3411D;
        Tue, 28 Jun 2022 12:05:32 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/8] v4l2-ctrls: add v4l2_ctrl_modify_dimensions
Date:   Tue, 28 Jun 2022 14:05:21 +0200
Message-Id: <20220628120523.2915913-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
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
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 34 ++++++++++++++++
 include/media/v4l2-ctrls.h               | 49 ++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 6f1b72c59e8e..16be31966cb1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -989,6 +989,40 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(__v4l2_ctrl_modify_range);
 
+int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
+				  u32 dims[V4L2_CTRL_MAX_DIMS])
+{
+	unsigned int elems = dims[0];
+	unsigned int i;
+	void *p_array;
+
+	if (!ctrl->is_array || ctrl->is_dyn_array)
+		return -EINVAL;
+
+	for (i = 1; i < ctrl->nr_of_dims; i++)
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
+	for (i = 0; i < elems; i++) {
+		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
+		ctrl->type_ops->init(ctrl, i, ctrl->p_new);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
+
 /* Implement VIDIOC_QUERY_EXT_CTRL */
 int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctrl *qc)
 {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index e0f32e8b886a..3d039142f870 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -963,6 +963,55 @@ static inline int v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	return rval;
 }
 
+/**
+ *__v4l2_ctrl_modify_dimensions() - Unlocked variant of v4l2_ctrl_modify_dimensions()
+ *
+ * @ctrl:	The control to update.
+ * @dims:	The control's new dimensions.
+ *
+ * Update the dimensions of an array control on the fly.
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
+ * Update the dimensions of a control on the fly.
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

