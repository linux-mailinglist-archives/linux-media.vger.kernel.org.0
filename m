Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB2BD55C332
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244304AbiF1MGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245127AbiF1MGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:06:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872E82EA24
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:05:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34038B81D2D
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E5FC3411D;
        Tue, 28 Jun 2022 12:05:30 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/8] v4l2-ctrls: allocate space for arrays
Date:   Tue, 28 Jun 2022 14:05:19 +0200
Message-Id: <20220628120523.2915913-5-hverkuil-cisco@xs4all.nl>
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

Just like dynamic arrays, also allocate space for regular arrays.

This is in preparation for allowing to change the array size from
a driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  8 +++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 33 +++++++++++------------
 include/media/v4l2-ctrls.h                | 17 ++++++------
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 50d012ba3c02..1b90bd7c4010 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -105,8 +105,8 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 
 	ctrl->is_new = 0;
 	if (ctrl->is_dyn_array &&
-	    c->size > ctrl->p_dyn_alloc_elems * ctrl->elem_size) {
-		void *old = ctrl->p_dyn;
+	    c->size > ctrl->p_array_alloc_elems * ctrl->elem_size) {
+		void *old = ctrl->p_array;
 		void *tmp = kvzalloc(2 * c->size, GFP_KERNEL);
 
 		if (!tmp)
@@ -115,8 +115,8 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 		memcpy(tmp + c->size, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
 		ctrl->p_new.p = tmp;
 		ctrl->p_cur.p = tmp + c->size;
-		ctrl->p_dyn = tmp;
-		ctrl->p_dyn_alloc_elems = c->size / ctrl->elem_size;
+		ctrl->p_array = tmp;
+		ctrl->p_array_alloc_elems = c->size / ctrl->elem_size;
 		kvfree(old);
 	}
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ff8a61f24d0a..1372b7b45681 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1135,14 +1135,14 @@ int req_to_new(struct v4l2_ctrl_ref *ref)
 
 	/*
 	 * Check if the number of elements in the request is more than the
-	 * elements in ctrl->p_dyn. If so, attempt to realloc ctrl->p_dyn.
-	 * Note that p_dyn is allocated with twice the number of elements
+	 * elements in ctrl->p_array. If so, attempt to realloc ctrl->p_array.
+	 * Note that p_array is allocated with twice the number of elements
 	 * in the dynamic array since it has to store both the current and
 	 * new value of such a control.
 	 */
-	if (ref->p_req_elems > ctrl->p_dyn_alloc_elems) {
+	if (ref->p_req_elems > ctrl->p_array_alloc_elems) {
 		unsigned int sz = ref->p_req_elems * ctrl->elem_size;
-		void *old = ctrl->p_dyn;
+		void *old = ctrl->p_array;
 		void *tmp = kvzalloc(2 * sz, GFP_KERNEL);
 
 		if (!tmp)
@@ -1151,8 +1151,8 @@ int req_to_new(struct v4l2_ctrl_ref *ref)
 		memcpy(tmp + sz, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
 		ctrl->p_new.p = tmp;
 		ctrl->p_cur.p = tmp + sz;
-		ctrl->p_dyn = tmp;
-		ctrl->p_dyn_alloc_elems = ref->p_req_elems;
+		ctrl->p_array = tmp;
+		ctrl->p_array_alloc_elems = ref->p_req_elems;
 		kvfree(old);
 	}
 
@@ -1252,7 +1252,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 		list_del(&ctrl->node);
 		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
 			list_del(&sev->node);
-		kvfree(ctrl->p_dyn);
+		kvfree(ctrl->p_array);
 		kvfree(ctrl);
 	}
 	kvfree(hdl->buckets);
@@ -1584,11 +1584,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	else if (type == V4L2_CTRL_TYPE_CTRL_CLASS)
 		flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	else if (!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) &&
+	else if (!is_array &&
 		 (type == V4L2_CTRL_TYPE_INTEGER64 ||
 		  type == V4L2_CTRL_TYPE_STRING ||
-		  type >= V4L2_CTRL_COMPOUND_TYPES ||
-		  is_array))
+		  type >= V4L2_CTRL_COMPOUND_TYPES))
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
@@ -1632,14 +1631,14 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->cur.val = ctrl->val = def;
 	data = &ctrl[1];
 
-	if (ctrl->is_dyn_array) {
-		ctrl->p_dyn_alloc_elems = elems;
-		ctrl->p_dyn = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
-		if (!ctrl->p_dyn) {
+	if (ctrl->is_array) {
+		ctrl->p_array_alloc_elems = elems;
+		ctrl->p_array = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
+		if (!ctrl->p_array) {
 			kvfree(ctrl);
 			return NULL;
 		}
-		data = ctrl->p_dyn;
+		data = ctrl->p_array;
 	}
 
 	if (!ctrl->is_int) {
@@ -1651,7 +1650,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const) {
-		if (ctrl->is_dyn_array)
+		if (ctrl->is_array)
 			ctrl->p_def.p = &ctrl[1];
 		else
 			ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
@@ -1664,7 +1663,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
-		kvfree(ctrl->p_dyn);
+		kvfree(ctrl->p_array);
 		kvfree(ctrl);
 		return NULL;
 	}
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f4105de8a8d2..a2f147873265 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -209,7 +209,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @elem_size:	The size in bytes of the control.
  * @new_elems:	The number of elements in p_new. This is the same as @elems,
  *		except for dynamic arrays. In that case it is in the range of
- *		1 to @p_dyn_alloc_elems.
+ *		1 to @p_array_alloc_elems.
  * @dims:	The size of each dimension.
  * @nr_of_dims:The number of dimensions in @dims.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
@@ -233,12 +233,11 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		not freed when the control is deleted. Should this be needed
  *		then a new internal bitfield can be added to tell the framework
  *		to free this pointer.
- * @p_dyn:	Pointer to the dynamically allocated array. Only valid if
- *		@is_dyn_array is true.
- * @p_dyn_alloc_elems: The number of elements in the dynamically allocated
- *		array for both the cur and new values. So @p_dyn is actually
- *		sized for 2 * @p_dyn_alloc_elems * @elem_size. Only valid if
- *		@is_dyn_array is true.
+ * @p_array:	Pointer to the allocated array. Only valid if @is_array is true.
+ * @p_array_alloc_elems: The number of elements in the allocated
+ *		array for both the cur and new values. So @p_array is actually
+ *		sized for 2 * @p_array_alloc_elems * @elem_size. Only valid if
+ *		@is_array is true.
  * @cur:	Structure to store the current value.
  * @cur.val:	The control's current value, if the @type is represented via
  *		a u32 integer (see &enum v4l2_ctrl_type).
@@ -297,8 +296,8 @@ struct v4l2_ctrl {
 	};
 	unsigned long flags;
 	void *priv;
-	void *p_dyn;
-	u32 p_dyn_alloc_elems;
+	void *p_array;
+	u32 p_array_alloc_elems;
 	s32 val;
 	struct {
 		s32 val;
-- 
2.35.1

