Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABE65A4EC7
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 16:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiH2OFX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 10:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiH2OFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 10:05:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F6316582
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 07:05:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6AD960ED4
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 14:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2688C433D6;
        Mon, 29 Aug 2022 14:05:16 +0000 (UTC)
Message-ID: <6a8a263a-32ba-98a5-c33c-1db6c828f4c9@xs4all.nl>
Date:   Mon, 29 Aug 2022 16:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ctrls: drop 'elems' argument from control type ops.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The type ops for equal, init and validate have an elems argument,
but this can be taken from struct v4l2_ctrl: ctrl->elems for
equal and init, and ctrl->new_elems for validate (since you are
validating a new control value).

So drop this argument and update all callers.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/nxp/dw100/dw100.c  |  4 ++--
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  8 +++----
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 19 +++++++--------
 include/media/v4l2-ctrls.h                | 28 +++++++++--------------
 4 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 94518f0e486b..87ad036c3dbf 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -373,7 +373,7 @@ static const struct v4l2_ctrl_ops dw100_ctrl_ops = {
  * The coordinates are saved in UQ12.4 fixed point format.
  */
 static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
-					  u32 from_idx, u32 elems,
+					  u32 from_idx,
 					  union v4l2_ctrl_ptr ptr)
 {
 	struct dw100_ctx *ctx =
@@ -398,7 +398,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
 	ctx->map_height = mh;
 	ctx->map_size = mh * mw * sizeof(u32);

-	for (idx = from_idx; idx < elems; idx++) {
+	for (idx = from_idx; idx < ctrl->elems; idx++) {
 		qy = min_t(u32, (idx / mw) * qdy, qsh);
 		qx = min_t(u32, (idx % mw) * qdx, qsw);
 		map[idx] = dw100_map_format_coordinates(qx, qy);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index a8c354ad3d23..d0a3aa3806fb 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -89,7 +89,7 @@ static int req_to_user(struct v4l2_ext_control *c,
 /* Helper function: copy the initial control value back to the caller */
 static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
-	ctrl->type_ops->init(ctrl, 0, ctrl->elems, ctrl->p_new);
+	ctrl->type_ops->init(ctrl, 0, ctrl->p_new);

 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
@@ -126,7 +126,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 		if (ctrl->is_dyn_array)
 			ctrl->new_elems = elems;
 		else if (ctrl->is_array)
-			ctrl->type_ops->init(ctrl, elems, ctrl->elems, ctrl->p_new);
+			ctrl->type_ops->init(ctrl, elems, ctrl->p_new);
 		return 0;
 	}

@@ -494,7 +494,7 @@ EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 /* Validate a new control */
 static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
 {
-	return ctrl->type_ops->validate(ctrl, ctrl->new_elems, p_new);
+	return ctrl->type_ops->validate(ctrl, p_new);
 }

 /* Validate controls. */
@@ -1007,7 +1007,7 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
 	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
 	for (i = 0; i < ctrl->nr_of_dims; i++)
 		ctrl->dims[i] = dims[i];
-	ctrl->type_ops->init(ctrl, 0, elems, ctrl->p_cur);
+	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
 	cur_to_new(ctrl);
 	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE |
 			       V4L2_EVENT_CTRL_CH_DIMENSIONS);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 01f00093f259..0dab1d7b90f0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -65,7 +65,7 @@ void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes)
 			v4l2_event_queue_fh(sev->fh, &ev);
 }

-bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
+bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl,
 			     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2)
 {
 	unsigned int i;
@@ -74,7 +74,7 @@ bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
 	case V4L2_CTRL_TYPE_BUTTON:
 		return false;
 	case V4L2_CTRL_TYPE_STRING:
-		for (i = 0; i < elems; i++) {
+		for (i = 0; i < ctrl->elems; i++) {
 			unsigned int idx = i * ctrl->elem_size;

 			/* strings are always 0-terminated */
@@ -84,7 +84,7 @@ bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
 		return true;
 	default:
 		return !memcmp(ptr1.p_const, ptr2.p_const,
-			       elems * ctrl->elem_size);
+			       ctrl->elems * ctrl->elem_size);
 	}
 }
 EXPORT_SYMBOL(v4l2_ctrl_type_op_equal);
@@ -178,9 +178,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 }

 void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
-			    u32 tot_elems, union v4l2_ctrl_ptr ptr)
+			    union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
+	u32 tot_elems = ctrl->elems;
 	u32 elems = tot_elems - from_idx;

 	if (from_idx >= tot_elems)
@@ -995,7 +996,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }

-int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,
+int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 			       union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
@@ -1017,11 +1018,11 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,

 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
-		memset(ptr.p_s32, 0, elems * sizeof(s32));
+		memset(ptr.p_s32, 0, ctrl->new_elems * sizeof(s32));
 		return 0;
 	}

-	for (i = 0; !ret && i < elems; i++)
+	for (i = 0; !ret && i < ctrl->new_elems; i++)
 		ret = std_validate_elem(ctrl, i, ptr);
 	return ret;
 }
@@ -1724,7 +1725,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}

-	ctrl->type_ops->init(ctrl, 0, elems, ctrl->p_cur);
+	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
 	cur_to_new(ctrl);

 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
@@ -2069,7 +2070,7 @@ static int cluster_changed(struct v4l2_ctrl *master)
 			ctrl_changed = true;
 		if (!ctrl_changed)
 			ctrl_changed = !ctrl->type_ops->equal(ctrl,
-				ctrl->elems, ctrl->p_cur, ctrl->p_new);
+				ctrl->p_cur, ctrl->p_new);
 		ctrl->has_changed = ctrl_changed;
 		changed |= ctrl->has_changed;
 	}
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b76a0714d425..e59d9a234631 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -121,21 +121,19 @@ struct v4l2_ctrl_ops {
  * struct v4l2_ctrl_type_ops - The control type operations that the driver
  *			       has to provide.
  *
- * @equal: return true if both values are equal.
- * @init: initialize the value.
+ * @equal: return true if all ctrl->elems array elements are equal.
+ * @init: initialize the value for array elements from from_idx to ctrl->elems.
  * @log: log the value.
- * @validate: validate the value. Return 0 on success and a negative value
- *	otherwise.
+ * @validate: validate the value for ctrl->new_elems array elements.
+ *	Return 0 on success and a negative value otherwise.
  */
 struct v4l2_ctrl_type_ops {
-	bool (*equal)(const struct v4l2_ctrl *ctrl, u32 elems,
-		      union v4l2_ctrl_ptr ptr1,
-		      union v4l2_ctrl_ptr ptr2);
-	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 tot_elems,
+	bool (*equal)(const struct v4l2_ctrl *ctrl,
+		      union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
+	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		     union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
-	int (*validate)(const struct v4l2_ctrl *ctrl, u32 elems,
-			union v4l2_ctrl_ptr ptr);
+	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };

 /**
@@ -1543,13 +1541,12 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
  * v4l2_ctrl_type_op_equal - Default v4l2_ctrl_type_ops equal callback.
  *
  * @ctrl: The v4l2_ctrl pointer.
- * @elems: The number of elements to compare.
  * @ptr1: A v4l2 control value.
  * @ptr2: A v4l2 control value.
  *
  * Return: true if values are equal, otherwise false.
  */
-bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
+bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl,
 			     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);

 /**
@@ -1557,13 +1554,12 @@ bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
  *
  * @ctrl: The v4l2_ctrl pointer.
  * @from_idx: Starting element index.
- * @elems: The number of elements to initialize.
  * @ptr: The v4l2 control value.
  *
  * Return: void
  */
 void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
-			    u32 elems, union v4l2_ctrl_ptr ptr);
+			    union v4l2_ctrl_ptr ptr);

 /**
  * v4l2_ctrl_type_op_log - Default v4l2_ctrl_type_ops log callback.
@@ -1578,12 +1574,10 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
  * v4l2_ctrl_type_op_validate - Default v4l2_ctrl_type_ops validate callback.
  *
  * @ctrl: The v4l2_ctrl pointer.
- * @elems: The number of elements in the control.
  * @ptr: The v4l2 control value.
  *
  * Return: 0 on success, a negative error code on failure.
  */
-int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,
-			       union v4l2_ctrl_ptr ptr);
+int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);

 #endif
-- 
2.35.1

