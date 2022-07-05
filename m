Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15209566585
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 10:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiGEIyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 04:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbiGEIyc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 04:54:32 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1982E0DD;
        Tue,  5 Jul 2022 01:54:30 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:6610:ee84:2ba:7917])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 19FF9660193A;
        Tue,  5 Jul 2022 09:54:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657011269;
        bh=IFpuVtxsupaZW1RdjYWKcB8xD21ZZ/DTAqiND43hFNQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OxAtnBf3SSaMr1gbifpTaEasWvSafYsLQuEXS73cnYHRSqfNzTY2KFOWYeCJiFIn4
         A/wYdkDzV3FIxwVAaIg49zOShb9luFHgCWipy9L1hDrarHT5KgpX906SQ1kYj9XzFN
         CmTfC9HVv+U4xhqFvUuAvgNV7rDVY0MMjCOwQlaQc3BtoCXJ/pSZBlVOgr4+34chv5
         +G8cr8DYTp7c0EepNZE0fbURgLyFlBiYdDCgXEgWUPME9wCx+/gK7KMlkLdfA5hvpp
         6W4ldasD6C9qcHO0+mnHoIrEYskXu0ZJ6QNwFKSJfFXMC3gz5hj0tc5hB0+96TbMen
         k1pOQKMvZOjng==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 02/17] v4l2-ctrls: add support for dynamically allocated arrays.
Date:   Tue,  5 Jul 2022 10:54:05 +0200
Message-Id: <20220705085420.272912-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220705085420.272912-1-benjamin.gaignard@collabora.com>
References: <20220705085420.272912-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Implement support for dynamically allocated arrays.

Most of the changes concern keeping track of the number of elements
of the array and the number of elements allocated for the array and
reallocating memory if needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c     | 103 ++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c    | 182 +++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-priv.h    |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c |  13 +-
 include/media/v4l2-ctrls.h                   |  42 ++++-
 5 files changed, 272 insertions(+), 71 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index db9baa0bd05f..50d012ba3c02 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -97,29 +97,47 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
-/* Helper function: copy the caller-provider value to the given control value */
-static int user_to_ptr(struct v4l2_ext_control *c,
-		       struct v4l2_ctrl *ctrl,
-		       union v4l2_ctrl_ptr ptr)
+/* Helper function: copy the caller-provider value as the new control value */
+static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
 	int ret;
 	u32 size;
 
-	ctrl->is_new = 1;
+	ctrl->is_new = 0;
+	if (ctrl->is_dyn_array &&
+	    c->size > ctrl->p_dyn_alloc_elems * ctrl->elem_size) {
+		void *old = ctrl->p_dyn;
+		void *tmp = kvzalloc(2 * c->size, GFP_KERNEL);
+
+		if (!tmp)
+			return -ENOMEM;
+		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
+		memcpy(tmp + c->size, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
+		ctrl->p_new.p = tmp;
+		ctrl->p_cur.p = tmp + c->size;
+		ctrl->p_dyn = tmp;
+		ctrl->p_dyn_alloc_elems = c->size / ctrl->elem_size;
+		kvfree(old);
+	}
+
 	if (ctrl->is_ptr && !ctrl->is_string) {
+		unsigned int elems = c->size / ctrl->elem_size;
 		unsigned int idx;
 
-		ret = copy_from_user(ptr.p, c->ptr, c->size) ? -EFAULT : 0;
-		if (ret || !ctrl->is_array)
-			return ret;
-		for (idx = c->size / ctrl->elem_size; idx < ctrl->elems; idx++)
-			ctrl->type_ops->init(ctrl, idx, ptr);
+		if (copy_from_user(ctrl->p_new.p, c->ptr, c->size))
+			return -EFAULT;
+		ctrl->is_new = 1;
+		if (ctrl->is_dyn_array)
+			ctrl->new_elems = elems;
+		else if (ctrl->is_array)
+			for (idx = elems; idx < ctrl->elems; idx++)
+				ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
 		return 0;
 	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER64:
-		*ptr.p_s64 = c->value64;
+		*ctrl->p_new.p_s64 = c->value64;
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		size = c->size;
@@ -127,32 +145,27 @@ static int user_to_ptr(struct v4l2_ext_control *c,
 			return -ERANGE;
 		if (size > ctrl->maximum + 1)
 			size = ctrl->maximum + 1;
-		ret = copy_from_user(ptr.p_char, c->string, size) ? -EFAULT : 0;
+		ret = copy_from_user(ctrl->p_new.p_char, c->string, size) ? -EFAULT : 0;
 		if (!ret) {
-			char last = ptr.p_char[size - 1];
+			char last = ctrl->p_new.p_char[size - 1];
 
-			ptr.p_char[size - 1] = 0;
+			ctrl->p_new.p_char[size - 1] = 0;
 			/*
 			 * If the string was longer than ctrl->maximum,
 			 * then return an error.
 			 */
-			if (strlen(ptr.p_char) == ctrl->maximum && last)
+			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
 				return -ERANGE;
 		}
 		return ret;
 	default:
-		*ptr.p_s32 = c->value;
+		*ctrl->p_new.p_s32 = c->value;
 		break;
 	}
+	ctrl->is_new = 1;
 	return 0;
 }
 
-/* Helper function: copy the caller-provider value as the new control value */
-static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
-{
-	return user_to_ptr(c, ctrl, ctrl->p_new);
-}
-
 /*
  * VIDIOC_G/TRY/S_EXT_CTRLS implementation
  */
@@ -254,7 +267,31 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
 			ref = find_ref_lock(hdl, ctrl->cluster[0]->id);
-		if (ctrl->is_ptr && !ctrl->is_string) {
+		if (ctrl->is_dyn_array) {
+			unsigned int max_size = ctrl->dims[0] * ctrl->elem_size;
+			unsigned int tot_size = ctrl->elem_size;
+
+			if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+				tot_size *= ref->p_req_elems;
+			else
+				tot_size *= ctrl->elems;
+
+			c->size = ctrl->elem_size * (c->size / ctrl->elem_size);
+			if (get) {
+				if (c->size < tot_size) {
+					c->size = tot_size;
+					return -ENOSPC;
+				}
+				c->size = tot_size;
+			} else {
+				if (c->size > max_size) {
+					c->size = max_size;
+					return -ENOSPC;
+				}
+				if (!c->size)
+					return -EFAULT;
+			}
+		} else if (ctrl->is_ptr && !ctrl->is_string) {
 			unsigned int tot_size = ctrl->elems * ctrl->elem_size;
 
 			if (c->size < tot_size) {
@@ -346,7 +383,7 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
  *
  * Note that v4l2_g_ext_ctrls_common() with 'which' set to
  * V4L2_CTRL_WHICH_REQUEST_VAL is only called if the request was
- * completed, and in that case valid_p_req is true for all controls.
+ * completed, and in that case p_req_valid is true for all controls.
  */
 int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 			    struct v4l2_ext_controls *cs,
@@ -430,7 +467,9 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 			if (is_default)
 				ret = def_to_user(cs->controls + idx, ref->ctrl);
-			else if (is_request && ref->valid_p_req)
+			else if (is_request && ref->p_req_dyn_enomem)
+				ret = -ENOMEM;
+			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
@@ -457,6 +496,17 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
 }
 EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 
+/* Validate a new control */
+static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
+{
+	unsigned int idx;
+	int err = 0;
+
+	for (idx = 0; !err && idx < ctrl->new_elems; idx++)
+		err = ctrl->type_ops->validate(ctrl, idx, p_new);
+	return err;
+}
+
 /* Validate controls. */
 static int validate_ctrls(struct v4l2_ext_controls *cs,
 			  struct v4l2_ctrl_helper *helpers,
@@ -872,6 +922,9 @@ int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
 	/* It's a driver bug if this happens. */
 	if (WARN_ON(ctrl->type != type))
 		return -EINVAL;
+	/* Setting dynamic arrays is not (yet?) supported. */
+	if (WARN_ON(ctrl->is_dyn_array))
+		return -EINVAL;
 	memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
 	return set_ctrl(NULL, ctrl, 0);
 }
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 949c1884d9c1..ff8a61f24d0a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -991,11 +991,12 @@ EXPORT_SYMBOL(v4l2_ctrl_notify);
 
 /* Copy the one value to another. */
 static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
-		       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
+		       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to,
+		       unsigned int elems)
 {
 	if (ctrl == NULL)
 		return;
-	memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
+	memcpy(to.p, from.p_const, elems * ctrl->elem_size);
 }
 
 /* Copy the new value to the current value. */
@@ -1008,8 +1009,11 @@ void new_to_cur(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags)
 
 	/* has_changed is set by cluster_changed */
 	changed = ctrl->has_changed;
-	if (changed)
-		ptr_to_ptr(ctrl, ctrl->p_new, ctrl->p_cur);
+	if (changed) {
+		if (ctrl->is_dyn_array)
+			ctrl->elems = ctrl->new_elems;
+		ptr_to_ptr(ctrl, ctrl->p_new, ctrl->p_cur, ctrl->elems);
+	}
 
 	if (ch_flags & V4L2_EVENT_CTRL_CH_FLAGS) {
 		/* Note: CH_FLAGS is only set for auto clusters. */
@@ -1039,36 +1043,122 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl == NULL)
 		return;
-	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new);
+	if (ctrl->is_dyn_array)
+		ctrl->new_elems = ctrl->elems;
+	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
+}
+
+static bool req_alloc_dyn_array(struct v4l2_ctrl_ref *ref, u32 elems)
+{
+	void *tmp;
+
+	if (elems < ref->p_req_dyn_alloc_elems)
+		return true;
+
+	tmp = kvmalloc(elems * ref->ctrl->elem_size, GFP_KERNEL);
+
+	if (!tmp) {
+		ref->p_req_dyn_enomem = true;
+		return false;
+	}
+	ref->p_req_dyn_enomem = false;
+	kvfree(ref->p_req.p);
+	ref->p_req.p = tmp;
+	ref->p_req_dyn_alloc_elems = elems;
+	return true;
 }
 
 /* Copy the new value to the request value */
 void new_to_req(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
 		return;
-	ptr_to_ptr(ref->ctrl, ref->ctrl->p_new, ref->p_req);
-	ref->valid_p_req = true;
+
+	ctrl = ref->ctrl;
+	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->new_elems))
+		return;
+
+	ref->p_req_elems = ctrl->new_elems;
+	ptr_to_ptr(ctrl, ctrl->p_new, ref->p_req, ref->p_req_elems);
+	ref->p_req_valid = true;
 }
 
 /* Copy the current value to the request value */
 void cur_to_req(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
 		return;
-	ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->p_req);
-	ref->valid_p_req = true;
+
+	ctrl = ref->ctrl;
+	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->elems))
+		return;
+
+	ref->p_req_elems = ctrl->elems;
+	ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req, ctrl->elems);
+	ref->p_req_valid = true;
 }
 
 /* Copy the request value to the new value */
-void req_to_new(struct v4l2_ctrl_ref *ref)
+int req_to_new(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
-		return;
-	if (ref->valid_p_req)
-		ptr_to_ptr(ref->ctrl, ref->p_req, ref->ctrl->p_new);
-	else
-		ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->ctrl->p_new);
+		return 0;
+
+	ctrl = ref->ctrl;
+
+	/*
+	 * This control was never set in the request, so just use the current
+	 * value.
+	 */
+	if (!ref->p_req_valid) {
+		if (ctrl->is_dyn_array)
+			ctrl->new_elems = ctrl->elems;
+		ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
+		return 0;
+	}
+
+	/* Not a dynamic array, so just copy the request value */
+	if (!ctrl->is_dyn_array) {
+		ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
+		return 0;
+	}
+
+	/* Sanity check, should never happen */
+	if (WARN_ON(!ref->p_req_dyn_alloc_elems))
+		return -ENOMEM;
+
+	/*
+	 * Check if the number of elements in the request is more than the
+	 * elements in ctrl->p_dyn. If so, attempt to realloc ctrl->p_dyn.
+	 * Note that p_dyn is allocated with twice the number of elements
+	 * in the dynamic array since it has to store both the current and
+	 * new value of such a control.
+	 */
+	if (ref->p_req_elems > ctrl->p_dyn_alloc_elems) {
+		unsigned int sz = ref->p_req_elems * ctrl->elem_size;
+		void *old = ctrl->p_dyn;
+		void *tmp = kvzalloc(2 * sz, GFP_KERNEL);
+
+		if (!tmp)
+			return -ENOMEM;
+		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
+		memcpy(tmp + sz, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
+		ctrl->p_new.p = tmp;
+		ctrl->p_cur.p = tmp + sz;
+		ctrl->p_dyn = tmp;
+		ctrl->p_dyn_alloc_elems = ref->p_req_elems;
+		kvfree(old);
+	}
+
+	ctrl->new_elems = ref->p_req_elems;
+	ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
+	return 0;
 }
 
 /* Control range checking */
@@ -1110,17 +1200,6 @@ int check_range(enum v4l2_ctrl_type type,
 	}
 }
 
-/* Validate a new control */
-int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
-{
-	unsigned idx;
-	int err = 0;
-
-	for (idx = 0; !err && idx < ctrl->elems; idx++)
-		err = ctrl->type_ops->validate(ctrl, idx, p_new);
-	return err;
-}
-
 /* Set the handler's error code if it wasn't set earlier already */
 static inline int handler_set_err(struct v4l2_ctrl_handler *hdl, int err)
 {
@@ -1164,6 +1243,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	/* Free all nodes */
 	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
 		list_del(&ref->node);
+		if (ref->p_req_dyn_alloc_elems)
+			kvfree(ref->p_req.p);
 		kfree(ref);
 	}
 	/* Free all controls owned by the handler */
@@ -1171,6 +1252,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 		list_del(&ctrl->node);
 		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
 			list_del(&sev->node);
+		kvfree(ctrl->p_dyn);
 		kvfree(ctrl);
 	}
 	kvfree(hdl->buckets);
@@ -1286,7 +1368,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	if (hdl->error)
 		return hdl->error;
 
-	if (allocate_req)
+	if (allocate_req && !ctrl->is_dyn_array)
 		size_extra_req = ctrl->elems * ctrl->elem_size;
 	new_ref = kzalloc(sizeof(*new_ref) + size_extra_req, GFP_KERNEL);
 	if (!new_ref)
@@ -1460,7 +1542,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			elem_size = sizeof(s32);
 		break;
 	}
-	tot_ctrl_size = elem_size * elems;
 
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
@@ -1481,17 +1562,33 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -EINVAL);
 		return NULL;
 	}
+	if (flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) {
+		/*
+		 * For now only support this for one-dimensional arrays only.
+		 *
+		 * This can be relaxed in the future, but this will
+		 * require more effort.
+		 */
+		if (nr_of_dims != 1) {
+			handler_set_err(hdl, -EINVAL);
+			return NULL;
+		}
+		/* Start with just 1 element */
+		elems = 1;
+	}
 
+	tot_ctrl_size = elem_size * elems;
 	sz_extra = 0;
 	if (type == V4L2_CTRL_TYPE_BUTTON)
 		flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
 			V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	else if (type == V4L2_CTRL_TYPE_CTRL_CLASS)
 		flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	else if (type == V4L2_CTRL_TYPE_INTEGER64 ||
-		 type == V4L2_CTRL_TYPE_STRING ||
-		 type >= V4L2_CTRL_COMPOUND_TYPES ||
-		 is_array)
+	else if (!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) &&
+		 (type == V4L2_CTRL_TYPE_INTEGER64 ||
+		  type == V4L2_CTRL_TYPE_STRING ||
+		  type >= V4L2_CTRL_COMPOUND_TYPES ||
+		  is_array))
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
@@ -1520,7 +1617,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->is_ptr = is_array || type >= V4L2_CTRL_COMPOUND_TYPES || ctrl->is_string;
 	ctrl->is_int = !ctrl->is_ptr && type != V4L2_CTRL_TYPE_INTEGER64;
 	ctrl->is_array = is_array;
+	ctrl->is_dyn_array = !!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY);
 	ctrl->elems = elems;
+	ctrl->new_elems = elems;
 	ctrl->nr_of_dims = nr_of_dims;
 	if (nr_of_dims)
 		memcpy(ctrl->dims, dims, nr_of_dims * sizeof(dims[0]));
@@ -1533,6 +1632,16 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->cur.val = ctrl->val = def;
 	data = &ctrl[1];
 
+	if (ctrl->is_dyn_array) {
+		ctrl->p_dyn_alloc_elems = elems;
+		ctrl->p_dyn = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
+		if (!ctrl->p_dyn) {
+			kvfree(ctrl);
+			return NULL;
+		}
+		data = ctrl->p_dyn;
+	}
+
 	if (!ctrl->is_int) {
 		ctrl->p_new.p = data;
 		ctrl->p_cur.p = data + tot_ctrl_size;
@@ -1542,7 +1651,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const) {
-		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
+		if (ctrl->is_dyn_array)
+			ctrl->p_def.p = &ctrl[1];
+		else
+			ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
@@ -1552,6 +1664,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
+		kvfree(ctrl->p_dyn);
 		kvfree(ctrl);
 		return NULL;
 	}
@@ -1889,6 +2002,9 @@ static int cluster_changed(struct v4l2_ctrl *master)
 			continue;
 		}
 
+		if (ctrl->elems != ctrl->new_elems)
+			ctrl_changed = true;
+
 		for (idx = 0; !ctrl_changed && idx < ctrl->elems; idx++)
 			ctrl_changed = !ctrl->type_ops->equal(ctrl, idx,
 				ctrl->p_cur, ctrl->p_new);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-priv.h b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
index d4bf2c716f97..aba6176fab6c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-priv.h
+++ b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
@@ -57,10 +57,9 @@ void cur_to_new(struct v4l2_ctrl *ctrl);
 void cur_to_req(struct v4l2_ctrl_ref *ref);
 void new_to_cur(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags);
 void new_to_req(struct v4l2_ctrl_ref *ref);
-void req_to_new(struct v4l2_ctrl_ref *ref);
+int req_to_new(struct v4l2_ctrl_ref *ref);
 void send_initial_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl);
 void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes);
-int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new);
 int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 		    struct v4l2_ctrl *ctrl,
 		    struct v4l2_ctrl_ref **ctrl_ref,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-request.c b/drivers/media/v4l2-core/v4l2-ctrls-request.c
index 7d098f287fd9..c637049d7a2b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-request.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-request.c
@@ -143,7 +143,7 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id)
 {
 	struct v4l2_ctrl_ref *ref = find_ref_lock(hdl, id);
 
-	return (ref && ref->valid_p_req) ? ref->ctrl : NULL;
+	return (ref && ref->p_req_valid) ? ref->ctrl : NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_ctrl_find);
 
@@ -373,7 +373,7 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 			v4l2_ctrl_unlock(master);
 			continue;
 		}
-		if (ref->valid_p_req)
+		if (ref->p_req_valid)
 			continue;
 
 		/* Copy the current control value into the request */
@@ -442,7 +442,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 				struct v4l2_ctrl_ref *r =
 					find_ref(hdl, master->cluster[i]->id);
 
-				if (r->valid_p_req) {
+				if (r->p_req_valid) {
 					have_new_data = true;
 					break;
 				}
@@ -458,7 +458,11 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 				struct v4l2_ctrl_ref *r =
 					find_ref(hdl, master->cluster[i]->id);
 
-				req_to_new(r);
+				ret = req_to_new(r);
+				if (ret) {
+					v4l2_ctrl_unlock(master);
+					goto error;
+				}
 				master->cluster[i]->is_new = 1;
 				r->req_done = true;
 			}
@@ -490,6 +494,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 			break;
 	}
 
+error:
 	media_request_object_put(obj);
 	return ret;
 }
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b3ce438f1329..f4105de8a8d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -185,6 +185,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		and/or has type %V4L2_CTRL_TYPE_STRING. In other words, &struct
  *		v4l2_ext_control uses field p to point to the data.
  * @is_array: If set, then this control contains an N-dimensional array.
+ * @is_dyn_array: If set, then this control contains a dynamically sized 1-dimensional array.
+ *		If this is set, then @is_array is also set.
  * @has_volatiles: If set, then one or more members of the cluster are volatile.
  *		Drivers should never touch this flag.
  * @call_notify: If set, then call the handler's notify function whenever the
@@ -205,6 +207,9 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @step:	The control's step value for non-menu controls.
  * @elems:	The number of elements in the N-dimensional array.
  * @elem_size:	The size in bytes of the control.
+ * @new_elems:	The number of elements in p_new. This is the same as @elems,
+ *		except for dynamic arrays. In that case it is in the range of
+ *		1 to @p_dyn_alloc_elems.
  * @dims:	The size of each dimension.
  * @nr_of_dims:The number of dimensions in @dims.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
@@ -223,15 +228,21 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		:math:`ceil(\frac{maximum - minimum}{step}) + 1`.
  *		Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
  * @flags:	The control's flags.
- * @cur:	Structure to store the current value.
- * @cur.val:	The control's current value, if the @type is represented via
- *		a u32 integer (see &enum v4l2_ctrl_type).
- * @val:	The control's new s32 value.
  * @priv:	The control's private pointer. For use by the driver. It is
  *		untouched by the control framework. Note that this pointer is
  *		not freed when the control is deleted. Should this be needed
  *		then a new internal bitfield can be added to tell the framework
  *		to free this pointer.
+ * @p_dyn:	Pointer to the dynamically allocated array. Only valid if
+ *		@is_dyn_array is true.
+ * @p_dyn_alloc_elems: The number of elements in the dynamically allocated
+ *		array for both the cur and new values. So @p_dyn is actually
+ *		sized for 2 * @p_dyn_alloc_elems * @elem_size. Only valid if
+ *		@is_dyn_array is true.
+ * @cur:	Structure to store the current value.
+ * @cur.val:	The control's current value, if the @type is represented via
+ *		a u32 integer (see &enum v4l2_ctrl_type).
+ * @val:	The control's new s32 value.
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
@@ -260,6 +271,7 @@ struct v4l2_ctrl {
 	unsigned int is_string:1;
 	unsigned int is_ptr:1;
 	unsigned int is_array:1;
+	unsigned int is_dyn_array:1;
 	unsigned int has_volatiles:1;
 	unsigned int call_notify:1;
 	unsigned int manual_mode_value:8;
@@ -272,6 +284,7 @@ struct v4l2_ctrl {
 	s64 minimum, maximum, default_value;
 	u32 elems;
 	u32 elem_size;
+	u32 new_elems;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 nr_of_dims;
 	union {
@@ -284,6 +297,8 @@ struct v4l2_ctrl {
 	};
 	unsigned long flags;
 	void *priv;
+	void *p_dyn;
+	u32 p_dyn_alloc_elems;
 	s32 val;
 	struct {
 		s32 val;
@@ -309,12 +324,22 @@ struct v4l2_ctrl {
  *		the control has been applied. This prevents applying controls
  *		from a cluster with multiple controls twice (when the first
  *		control of a cluster is applied, they all are).
- * @valid_p_req: If set, then p_req contains the control value for the request.
+ * @p_req_valid: If set, then p_req contains the control value for the request.
+ * @p_req_dyn_enomem: If set, then p_req is invalid since allocating space for
+ *		a dynamic array failed. Attempting to read this value shall
+ *		result in ENOMEM. Only valid if ctrl->is_dyn_array is true.
+ * @p_req_dyn_alloc_elems: The number of elements allocated for the dynamic
+ *		array. Only valid if @p_req_valid and ctrl->is_dyn_array are
+ *		true.
+ * @p_req_elems: The number of elements in @p_req. This is the same as
+ *		ctrl->elems, except for dynamic arrays. In that case it is in
+ *		the range of 1 to @p_req_dyn_alloc_elems. Only valid if
+ *		@p_req_valid is true.
  * @p_req:	If the control handler containing this control reference
  *		is bound to a media request, then this points to the
  *		value of the control that must be applied when the request
  *		is executed, or to the value of the control at the time
- *		that the request was completed. If @valid_p_req is false,
+ *		that the request was completed. If @p_req_valid is false,
  *		then this control was never set for this request and the
  *		control will not be updated when this request is applied.
  *
@@ -329,7 +354,10 @@ struct v4l2_ctrl_ref {
 	struct v4l2_ctrl_helper *helper;
 	bool from_other_dev;
 	bool req_done;
-	bool valid_p_req;
+	bool p_req_valid;
+	bool p_req_dyn_enomem;
+	u32 p_req_dyn_alloc_elems;
+	u32 p_req_elems;
 	union v4l2_ctrl_ptr p_req;
 };
 
-- 
2.32.0

