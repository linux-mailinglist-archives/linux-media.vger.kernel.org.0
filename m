Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3C9B52D0
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 18:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfIQQTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 12:19:53 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33658 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfIQQTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 12:19:53 -0400
Received: by mail-ed1-f65.google.com with SMTP id c4so3920075edl.0
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 09:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oo/6sxu5qPGPv2Jj/oeOHfemb0WIfBBM44C5GwjpNM0=;
        b=iryZD05gj0wuWliWLDaUSJhQ/AdjvEx7xduzFQ0CqGygOc4QFXlnf2xYczj7XAHxc9
         ey0cX/OmndcNIz9Vy6LFhGuzADGkC3LA8K4Eb3r0q7ImEcge6YWg2df4lZTgw4YUtxJo
         DpTaM80jSrS7f91PFn/B5c7ibb1goEGwwmrirAYCXA9AQmb4pdE8PhuDBXGGyXvAzcXV
         TgwAv8aXv8B4uSnXgVsEyD4YvnVngcx2Ei8O4reyCQWteWh6UOIuN9Z+XoKiq9Djwi0R
         VWh2M2731WQlVm86T07Ug0Fs9zCocgRvWhh81ATFA7X/BFMaAa0P43XQ0+67jH56RhEn
         blwA==
X-Gm-Message-State: APjAAAXj5OpdYRR6vKJbnj/XcIja2NyFvsiNTesXqBSUPyLnZP9V4lc/
        OPDLQXfE/ZUd5ZwGrKWsaTYf1pSmL/w=
X-Google-Smtp-Source: APXvYqxUY6FALe89hlOJvi2R3wkLHmWZCyOAFA6ZWCvSbF+bpe4pTbieGwpbhgQBY3eLKjKFu2wlXA==
X-Received: by 2002:aa7:c616:: with SMTP id h22mr5495472edq.96.1568737190710;
        Tue, 17 Sep 2019 09:19:50 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id s21sm512217edi.85.2019.09.17.09.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:19:49 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] RFC: v4l2-ctrls: Inmplement v4l2_ctrl_new_std_compound()
Date:   Tue, 17 Sep 2019 18:19:43 +0200
Message-Id: <20190917161943.15619-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <d07dc56c-1b70-3147-1ee8-abf486a291a2@xs4all.nl>
References: <d07dc56c-1b70-3147-1ee8-abf486a291a2@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement v4l2_ctrl_new_std_compound. This is just a discussion patch,
do not merge as is, and be gentle with the author ;P.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/i2c/imx214.c           | 13 +++--
 drivers/media/v4l2-core/v4l2-ctrls.c | 79 +++++++++++++++++-----------
 include/media/v4l2-ctrls.h           | 25 +++++++++
 3 files changed, 81 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 625617d4c81a..e18fed9f31f1 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -953,6 +953,9 @@ static int imx214_probe(struct i2c_client *client)
 		.width = 1120,
 		.height = 1120,
 	};
+	union v4l2_ctrl_ptr p_def = {
+		.p_area = &unit_size,
+	};
 	int ret;
 
 	ret = imx214_parse_fwnode(dev);
@@ -1034,11 +1037,11 @@ static int imx214_probe(struct i2c_client *client)
 					     V4L2_CID_EXPOSURE,
 					     0, 3184, 1, 0x0c70);
 
-	imx214->unit_size = v4l2_ctrl_new_area(&imx214->ctrls,
-					       &imx214_ctrl_ops,
-					       V4L2_CID_UNIT_CELL_SIZE,
-					       &unit_size);
-
+	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
+						       NULL,
+						       V4L2_CID_UNIT_CELL_SIZE,
+						       0, 0x7ffffff, 1, 0,
+						       p_def);
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3d2fa1868982..04813ba2262b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1555,6 +1555,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		p_mpeg2_slice_params->picture.picture_coding_type =
 					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
 		break;
+	default:
+		if (ctrl->has_p_def)
+			memcpy(p, ctrl->p_def.p, ctrl->elem_size);
+		break;
 	}
 }
 
@@ -2369,7 +2373,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
 			u32 flags, const char * const *qmenu,
-			const s64 *qmenu_int, void *priv)
+			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
+			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
 	unsigned sz_extra;
@@ -2478,6 +2483,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		 is_array)
 		sz_extra += 2 * tot_ctrl_size;
 
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p)
+		sz_extra += elem_size;
+
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
 		handler_set_err(hdl, -ENOMEM);
@@ -2521,6 +2529,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		ctrl->p_new.p = &ctrl->val;
 		ctrl->p_cur.p = &ctrl->cur.val;
 	}
+
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p) {
+		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
+		memcpy(ctrl->p_def.p, p_def.p, elem_size);
+		ctrl->has_p_def = true;
+	}
+
 	for (idx = 0; idx < elems; idx++) {
 		ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
 		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
@@ -2550,6 +2565,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 	s64 max = cfg->max;
 	u64 step = cfg->step;
 	s64 def = cfg->def;
+	const union v4l2_ctrl_ptr p_def = {};
 
 	if (name == NULL)
 		v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
@@ -2572,7 +2588,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, priv);
+			flags, qmenu, qmenu_int, p_def, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2587,6 +2603,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	const char *name;
 	enum v4l2_ctrl_type type;
 	u32 flags;
+	const union v4l2_ctrl_ptr p_def = {};
 
 	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
 	if (type == V4L2_CTRL_TYPE_MENU ||
@@ -2597,7 +2614,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, NULL);
+			     flags, NULL, NULL, p_def, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2616,6 +2633,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	s64 def = _def;
 	u64 step;
 	u32 flags;
+	const union v4l2_ctrl_ptr p_def = {};
 
 	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
 
@@ -2630,7 +2648,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, NULL);
+			     flags, qmenu, qmenu_int, p_def, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2646,6 +2664,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	s64 min;
 	s64 max = _max;
 	s64 def = _def;
+	const union v4l2_ctrl_ptr p_def = {};
 
 	/* v4l2_ctrl_new_std_menu_items() should only be called for
 	 * standard controls without a standard menu.
@@ -2662,11 +2681,33 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, NULL);
+			     flags, qmenu, NULL, p_def, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 
+/* Helper function for standard compound controls */
+struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+			const struct v4l2_ctrl_ops *ops,
+			u32 id, s64 min, s64 max, u64 step, s64 def,
+			const union v4l2_ctrl_ptr p_def)
+{
+	const char *name;
+	enum v4l2_ctrl_type type;
+	u32 flags;
+
+	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
+	if (type == V4L2_CTRL_TYPE_MENU ||
+	    type == V4L2_CTRL_TYPE_INTEGER_MENU) {
+		handler_set_err(hdl, -EINVAL);
+		return NULL;
+	}
+	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
+			     min, max, step, def, NULL, 0,
+			     flags, NULL, NULL, p_def, NULL);
+}
+EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
+
 /* Helper function for standard integer menu controls */
 struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 			const struct v4l2_ctrl_ops *ops,
@@ -2679,6 +2720,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	s64 max = _max;
 	s64 def = _def;
 	u32 flags;
+	const union v4l2_ctrl_ptr p_def = {};
 
 	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
 	if (type != V4L2_CTRL_TYPE_INTEGER_MENU) {
@@ -2687,7 +2729,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, NULL);
+			     flags, NULL, qmenu_int, p_def, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
@@ -4030,31 +4072,6 @@ static int set_ctrl(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags)
 	return try_or_set_cluster(fh, master, true, ch_flags);
 }
 
-/* Helper function for area controls */
-struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
-				     const struct v4l2_ctrl_ops *ops,
-				     u32 id, const struct v4l2_area *area)
-{
-	static struct v4l2_ctrl_config ctrl = {};
-	struct v4l2_ctrl *c;
-	int ret;
-
-	ctrl.id = id;
-	c = v4l2_ctrl_new_custom(hdl, &ctrl, (void *)area);
-	if (!c)
-		return NULL;
-
-	memcpy(c->p_new.p_area, area, sizeof(*area));
-	ret = set_ctrl(NULL, c, 0);
-	if (ret){
-		hdl->error = ret;
-		return NULL;
-	}
-
-	return c;
-}
-EXPORT_SYMBOL(v4l2_ctrl_new_area);
-
 /* Helper function for VIDIOC_S_CTRL compatibility */
 static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
 			 struct v4l2_ext_control *c)
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b5b42777a756..8dc7e9827056 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -164,6 +164,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		manual mode. So if the value of the auto control equals this
  *		value, then the whole cluster is in manual mode. Drivers should
  *		never set this flag directly.
+ * @has_p_def:  If set, the p_def field points to the default value of the control.
  * @ops:	The control ops.
  * @type_ops:	The control type ops.
  * @id:	The control ID.
@@ -230,6 +231,7 @@ struct v4l2_ctrl {
 	unsigned int has_volatiles:1;
 	unsigned int call_notify:1;
 	unsigned int manual_mode_value:8;
+	unsigned int has_p_def:1;
 
 	const struct v4l2_ctrl_ops *ops;
 	const struct v4l2_ctrl_type_ops *type_ops;
@@ -256,6 +258,7 @@ struct v4l2_ctrl {
 		s32 val;
 	} cur;
 
+	union v4l2_ctrl_ptr p_def;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -647,6 +650,28 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 					       u32 id, u8 max,
 					       u64 mask, u8 def,
 					       const char * const *qmenu);
+/**
+ * v4l2_ctrl_new_std_compound() - Allocate and initialize a new standard V4L2
+ *      compound control.
+ *
+ * @hdl:	The control handler.
+ * @ops:	The control ops.
+ * @id:		The control ID.
+ * @min:	The control's minimum value.
+ * @max:	The control's maximum value.
+ * @step:	The control's step value
+ * @def:	The control's default value.
+ * @p_def:	The control's p_def value.
+ *
+ * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks to
+ * the @p_def field.
+ *
+ */
+struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+				    const struct v4l2_ctrl_ops *ops,
+				    u32 id, s64 min, s64 max, u64 step,
+				    s64 def, const union v4l2_ctrl_ptr p_def);
+
 
 /**
  * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
-- 
2.23.0

