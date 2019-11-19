Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAAA6102335
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbfKSLfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:35:02 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49751 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728275AbfKSLfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:35:01 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X1mbiD68Hcs92X1mdiz4Su; Tue, 19 Nov 2019 12:34:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574163299; bh=56jGPmdjDNyAvK5Km3E2f9o8tt2iH9i97LqDuPyaDqo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=iVa7k6PGsKhDAzVIWD4S47tdHukplNy7v2lxJ20rIzqxCjQ2Dl82hbGxaPkJbEyg5
         TS5hZGUKrDYoA+0NLYTnbNxel0fdZEyrPtGVWEvVqkZr7diPrgz7+omIr/9S9JOirM
         A03TFZEO1vHjLDQ99nTR5QeA6AUM0JdJ+oyC8SyThxgV6t2qYqNEioS84oqmOnFYsY
         QKq7QKCOyORV06JM78auamPIWxAZucVyr5Kn0BuIat2gTH8dnjnVn/Ze0wTui3aQbv
         I+wIvvhyE/FvEbcYY80k/bArqfLC6rCbUWD5hU2AoZtpD8Kq1GmUor12DWuaWYh6wD
         CAD7LXbbRezaA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/5] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
Date:   Tue, 19 Nov 2019 12:34:54 +0100
Message-Id: <20191119113457.57833-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI3Y7RpXC/Wtf53twy38gnVrmrCf/NxR/mfk5WuOJGz6yvR4rJaOru7QsBt0gc21ygyDJ44w6zvd7OpHENeWMom0uyt5K8y3Vs0NwCrvfM0oB02g0VYV
 lLoX1MSSe/JZ+jXSUHM+DPkUXVtXG9IXkgelmJVvZ1rQrfwMTjkPJfDvHGug6W+diFRvHrFkX2KGnW3jdDRdlbHDIwPFG3YFfKyU/zWDiXliri8tsyFV2T/b
 EvYh774a3AWXTOZpI2S452Uo8/RiYj0KTaKKpHhZVRHsyAWaJDLNaCr1U0F226NFPScRVlvYjtJxZUI6VQCP0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the capability of retrieving the min and max values of a
compound control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/uapi/v4l/vidioc-g-ext-ctrls.rst     |  10 +-
 .../media/videodev2.h.rst.exceptions          |   2 +
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 196 ++++++++++++++++--
 include/media/v4l2-ctrls.h                    |  28 ++-
 include/uapi/linux/videodev2.h                |   2 +
 6 files changed, 213 insertions(+), 29 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
index fbb42e73b821..cdee57c8d3dc 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
@@ -246,7 +246,9 @@ still cause this situation.
       - Which value of the control to get/set/try.
 	``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of the
 	control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
-	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
+	value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
+        value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
+        value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
 	these controls have to be retrieved from a request or tried/set for
 	a request. In the latter case the ``request_fd`` field contains the
 	file descriptor of the request that should be used. If the device
@@ -254,8 +256,10 @@ still cause this situation.
 
 	.. note::
 
-	   When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
-	   get the default value of the control, you cannot set or try it.
+	   When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
+	   or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only
+	   get the default/minimum/maximum value of the control, you cannot set
+	   or try it.
 
 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 49df65d162a0..e6a8ae41773d 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -536,6 +536,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
 ignore define V4L2_CTRL_MAX_DIMS
 ignore define V4L2_CTRL_WHICH_CUR_VAL
 ignore define V4L2_CTRL_WHICH_DEF_VAL
+ignore define V4L2_CTRL_WHICH_MIN_VAL
+ignore define V4L2_CTRL_WHICH_MAX_VAL
 ignore define V4L2_CTRL_WHICH_REQUEST_VAL
 ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
 ignore define V4L2_CID_MAX_CTRLS
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index adcaaa8c86d1..72938197d745 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1037,7 +1037,9 @@ static int imx214_probe(struct i2c_client *client)
 	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
-				v4l2_ctrl_ptr_create((void *)&unit_size));
+				v4l2_ctrl_ptr_create((void *)&unit_size),
+				v4l2_ctrl_ptr_create(NULL),
+				v4l2_ctrl_ptr_create(NULL));
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 28a5d153d18c..af74609dce0a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1590,6 +1590,28 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
+static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
+			     union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_min.p_const)
+		memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
+			     union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_max.p_const)
+		memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
 static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 		     union v4l2_ctrl_ptr ptr)
 {
@@ -1628,6 +1650,82 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
+static void std_minimum(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr)
+{
+	switch (ctrl->type) {
+	case V4L2_CTRL_TYPE_STRING:
+		idx *= ctrl->elem_size;
+		memset(ptr.p_char + idx, ' ', ctrl->minimum);
+		ptr.p_char[idx + ctrl->minimum] = '\0';
+		break;
+	case V4L2_CTRL_TYPE_INTEGER64:
+		ptr.p_s64[idx] = ctrl->minimum;
+		break;
+	case V4L2_CTRL_TYPE_INTEGER:
+	case V4L2_CTRL_TYPE_INTEGER_MENU:
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_BITMASK:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+		ptr.p_s32[idx] = ctrl->minimum;
+		break;
+	case V4L2_CTRL_TYPE_BUTTON:
+	case V4L2_CTRL_TYPE_CTRL_CLASS:
+		ptr.p_s32[idx] = 0;
+		break;
+	case V4L2_CTRL_TYPE_U8:
+		ptr.p_u8[idx] = ctrl->minimum;
+		break;
+	case V4L2_CTRL_TYPE_U16:
+		ptr.p_u16[idx] = ctrl->minimum;
+		break;
+	case V4L2_CTRL_TYPE_U32:
+		ptr.p_u32[idx] = ctrl->minimum;
+		break;
+	default:
+		std_min_compound(ctrl, idx, ptr);
+		break;
+	}
+}
+
+static void std_maximum(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr)
+{
+	switch (ctrl->type) {
+	case V4L2_CTRL_TYPE_STRING:
+		idx *= ctrl->elem_size;
+		memset(ptr.p_char + idx, ' ', ctrl->maximum);
+		ptr.p_char[idx + ctrl->maximum] = '\0';
+		break;
+	case V4L2_CTRL_TYPE_INTEGER64:
+		ptr.p_s64[idx] = ctrl->maximum;
+		break;
+	case V4L2_CTRL_TYPE_INTEGER:
+	case V4L2_CTRL_TYPE_INTEGER_MENU:
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_BITMASK:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+		ptr.p_s32[idx] = ctrl->maximum;
+		break;
+	case V4L2_CTRL_TYPE_BUTTON:
+	case V4L2_CTRL_TYPE_CTRL_CLASS:
+		ptr.p_s32[idx] = 0;
+		break;
+	case V4L2_CTRL_TYPE_U8:
+		ptr.p_u8[idx] = ctrl->maximum;
+		break;
+	case V4L2_CTRL_TYPE_U16:
+		ptr.p_u16[idx] = ctrl->maximum;
+		break;
+	case V4L2_CTRL_TYPE_U32:
+		ptr.p_u32[idx] = ctrl->maximum;
+		break;
+	default:
+		std_max_compound(ctrl, idx, ptr);
+		break;
+	}
+}
+
 static void std_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
@@ -1950,6 +2048,8 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = std_equal,
 	.init = std_init,
+	.minimum = std_minimum,
+	.maximum = std_maximum,
 	.log = std_log,
 	.validate = std_validate,
 };
@@ -2016,6 +2116,28 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
+/* Helper function: copy the minimum control value back to the caller */
+static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	int idx;
+
+	for (idx = 0; idx < ctrl->elems; idx++)
+		ctrl->type_ops->minimum(ctrl, idx, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
+/* Helper function: copy the maximum control value back to the caller */
+static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	int idx;
+
+	for (idx = 0; idx < ctrl->elems; idx++)
+		ctrl->type_ops->maximum(ctrl, idx, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
 /* Helper function: copy the caller-provider value to the given control value */
 static int user_to_ptr(struct v4l2_ext_control *c,
 		       struct v4l2_ctrl *ctrl,
@@ -2476,7 +2598,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
 			u32 flags, const char * const *qmenu,
-			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
+			const s64 *qmenu_int,
+			const union v4l2_ctrl_ptr p_def,
+			const union v4l2_ctrl_ptr p_min,
+			const union v4l2_ctrl_ptr p_max,
 			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
@@ -2599,7 +2724,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
-		sz_extra += elem_size;
+		sz_extra += elem_size * 3;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
@@ -2649,6 +2774,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
+	if (type >= V4L2_CTRL_COMPOUND_TYPES &&
+	    p_min.p_const && p_max.p_const) {
+		ctrl->p_min.p = ctrl->p_cur.p + 2 * tot_ctrl_size;
+		memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
+		ctrl->p_max.p = ctrl->p_cur.p + 3 * tot_ctrl_size;
+		memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
+	}
 
 	for (idx = 0; idx < elems; idx++) {
 		ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
@@ -2701,7 +2833,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, cfg->p_def, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
+			cfg->p_max, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2726,7 +2859,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, ptr_null, NULL);
+			     flags, NULL, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2759,7 +2893,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, ptr_null, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2791,7 +2926,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, ptr_null, NULL);
+			     flags, qmenu, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
@@ -2799,7 +2935,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 /* Helper function for standard compound controls */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 				const struct v4l2_ctrl_ops *ops, u32 id,
-				const union v4l2_ctrl_ptr p_def)
+				const union v4l2_ctrl_ptr p_def,
+				const union v4l2_ctrl_ptr p_min,
+				const union v4l2_ctrl_ptr p_max)
 {
 	const char *name;
 	enum v4l2_ctrl_type type;
@@ -2813,7 +2951,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, p_def, NULL);
+			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
 
@@ -2837,7 +2975,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, ptr_null, NULL);
+			     flags, NULL, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
@@ -3479,8 +3618,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 		cs->error_idx = i;
 
 		if (cs->which &&
-		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
-		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
+		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
+		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
 		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
 			dprintk(vdev,
 				"invalid which 0x%x or control id 0x%x\n",
@@ -3578,8 +3717,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
    whether there are any controls at all. */
 static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
 {
-	if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
-	    which == V4L2_CTRL_WHICH_REQUEST_VAL)
+	if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
+			   which <= V4L2_CTRL_WHICH_MAX_VAL))
 		return 0;
 	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
 }
@@ -3593,9 +3732,7 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 	struct v4l2_ctrl_helper *helpers = helper;
 	int ret;
 	int i, j;
-	bool def_value;
-
-	def_value = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
+	__u32 which = cs->which;
 
 	cs->error_idx = cs->count;
 	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
@@ -3625,18 +3762,31 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 				    struct v4l2_ctrl *ctrl);
 		struct v4l2_ctrl *master;
 
-		ctrl_to_user = def_value ? def_to_user : cur_to_user;
-
 		if (helpers[i].mref == NULL)
 			continue;
 
 		master = helpers[i].mref->ctrl;
 		cs->error_idx = i;
 
+		switch (which) {
+		case V4L2_CTRL_WHICH_DEF_VAL:
+			ctrl_to_user = def_to_user;
+			break;
+		case V4L2_CTRL_WHICH_MIN_VAL:
+			ctrl_to_user = min_to_user;
+			break;
+		case V4L2_CTRL_WHICH_MAX_VAL:
+			ctrl_to_user = max_to_user;
+			break;
+		default:
+			ctrl_to_user = cur_to_user;
+			break;
+		}
+
 		v4l2_ctrl_lock(master);
 
 		/* g_volatile_ctrl will update the new control values */
-		if (!def_value &&
+		if (ctrl_to_user == cur_to_user &&
 		    ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
 		    (master->has_volatiles && !is_cur_manual(master)))) {
 			for (j = 0; j < master->ncontrols; j++)
@@ -3962,9 +4112,11 @@ static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 
 	cs->error_idx = cs->count;
 
-	/* Default value cannot be changed */
-	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		dprintk(vdev, "%s: cannot change default value\n",
+	/* Default/minimum/maximum values cannot be changed */
+	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
+		dprintk(vdev, "%s: cannot change default/min/max value\n",
 			video_device_node_name(vdev));
 		return -EINVAL;
 	}
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index aefd62831bc8..6372c75ddc1b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -122,6 +122,8 @@ struct v4l2_ctrl_ops {
  *
  * @equal: return true if both values are equal.
  * @init: initialize the value.
+ * @minimum: set the value to the minimum value of the control.
+ * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
  * @validate: validate the value. Return 0 on success and a negative value
  *	otherwise.
@@ -132,6 +134,10 @@ struct v4l2_ctrl_type_ops {
 		      union v4l2_ctrl_ptr ptr2);
 	void (*init)(const struct v4l2_ctrl *ctrl, u32 idx,
 		     union v4l2_ctrl_ptr ptr);
+	void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
+	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
 	int (*validate)(const struct v4l2_ctrl *ctrl, u32 idx,
 			union v4l2_ctrl_ptr ptr);
@@ -228,6 +234,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
+ * @p_min:	The control's minimum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
+ * @p_max:	The control's maximum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
  * @p_cur:	The control's current value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer.
@@ -283,6 +295,8 @@ struct v4l2_ctrl {
 	} cur;
 
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -387,6 +401,8 @@ struct v4l2_ctrl_handler {
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
  * @p_def:	The control's default value for compound controls.
+ * @p_min:	The control's minimum value for compound controls.
+ * @p_max:	The control's maximum value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -416,6 +432,8 @@ struct v4l2_ctrl_config {
 	u64 step;
 	s64 def;
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
@@ -685,15 +703,19 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
  * @ops:       The control ops.
  * @id:        The control ID.
  * @p_def:     The control's default value.
+ * @p_min:     The control's minimum value.
+ * @p_max:     The control's maximum value.
  *
- * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
- * to the @p_def field.
+ * Same as v4l2_ctrl_new_std(), but with support to compound controls, thanks
+ * to the @p_def/min/max fields.
  *
  */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 					     const struct v4l2_ctrl_ops *ops,
 					     u32 id,
-					     const union v4l2_ctrl_ptr p_def);
+					     const union v4l2_ctrl_ptr p_def,
+					     const union v4l2_ctrl_ptr p_min,
+					     const union v4l2_ctrl_ptr p_max);
 
 /**
  * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2b584c69e619..7aa1293ac7bc 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1714,6 +1714,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
-- 
2.23.0

