Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02E4B912B
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387530AbfITNvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:51:46 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46161 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727339AbfITNvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:45 -0400
Received: by mail-ed1-f67.google.com with SMTP id t3so6446671edw.13;
        Fri, 20 Sep 2019 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RBtYiphQB9xyIdpwt6uO0vAvReKHDuLowdlZ5iymKFY=;
        b=IOOR5spnR3XUcv/YewcXhpe4KkaW89U3LFReORwYLyUAPIWDnWjDSNYQ+N5ggD+paD
         bdctlg+Qeo8IPyBU1fklveGtcR6/R40A1eAwJvoYvp+i1/mE1hc4N6HWljRrHn8EqiYL
         EOskGWZpy+aP4t00+qx15mFjQNJwSK2kgNxRV1+Q8FcD1N5UD3IAU7mIiJw3Nl6GzUFG
         vcTHB3mtxSoimxWQAVDz9z1oST8rIHQYyaQF5uCto6/sfmTp4QYEh2WFD7pojy1sWC2/
         es/9LNf4axKc2OBaDgf5rczdUYSJ9+mBzY5WhUTyBussdcqSpZ4QkjdWXu3d/IqlQTyz
         dj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RBtYiphQB9xyIdpwt6uO0vAvReKHDuLowdlZ5iymKFY=;
        b=WffXrDeVjaC21cyNABCyJp2pCEJhkGtF8NAVeRH4hV397YeBGAdUOUgVKVBiVEb5Sk
         7ANemSeH5woEho+7QtGPg5134WQaIQum+++zzbbih95HadTYnBFEo3D3i35cM6RxbuFI
         0xs/q51yuuBRlqq2fm8Bb334mpVUwM1lsv3zS9sgpc1ifyTutMaRirZsSIdlVsDxL9dj
         lzMNPoTE0Nt1FbF/qaeywHUrL7bwW8H7MKI6UpcHICrkRbHJUsZXx/SBJ+Cj9No+k6Iv
         jd3VLdsuIJRl1Nn3wwSH6f8IAkFluVImXK+6bu7Jd1KsZLKwQmFGlmreef4m8apRH0MS
         oOWw==
X-Gm-Message-State: APjAAAXoo9m87wwd9pEYhNBSGn2ttSY28dKsYs9m1cW0zDI8WmYdJBmO
        mPoCkwH0F25zmefAM9cvE8eU2V0+tCQ=
X-Google-Smtp-Source: APXvYqyuZvQJKFd+14aQ3x7lOGs4qWO9GI+hoJvLwKzEHUGLRTj7kdmSnXi6gW19XhluV3dVC4IiMQ==
X-Received: by 2002:a50:d096:: with SMTP id v22mr22224201edd.81.1568987501702;
        Fri, 20 Sep 2019 06:51:41 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:40 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v6 1/7] media: v4l2-core: Implement v4l2_ctrl_new_std_compound
Date:   Fri, 20 Sep 2019 15:51:31 +0200
Message-Id: <20190920135137.10052-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920135137.10052-1-ricardo@ribalda.com>
References: <20190920135137.10052-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently compound controls do not have a simple way of initializing its
values. This results in ofuscated code with type_ops init.

This patch introduces a new field on the control with the default value
for the compound control that can be set with the brand new
v4l2_ctrl_new_std_compound function

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 50 ++++++++++++++++++++++++----
 include/media/v4l2-ctrls.h           | 22 +++++++++++-
 2 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1d8f38824631..219d8aeefa20 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -29,6 +29,8 @@
 #define call_op(master, op) \
 	(has_op(master, op) ? master->ops->op(master) : 0)
 
+static const union v4l2_ctrl_ptr ptr_null;
+
 /* Internal temporary helper struct, one for each v4l2_ext_control */
 struct v4l2_ctrl_helper {
 	/* Pointer to the control reference of the master control */
@@ -1530,7 +1532,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
-	memset(p, 0, ctrl->elem_size);
+	if (ctrl->p_def.p)
+		memcpy(p, ctrl->p_def.p, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
 
 	/*
 	 * The cast is needed to get rid of a gcc warning complaining that
@@ -2354,7 +2359,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
 			u32 flags, const char * const *qmenu,
-			const s64 *qmenu_int, void *priv)
+			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
+			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
 	unsigned sz_extra;
@@ -2460,6 +2466,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		 is_array)
 		sz_extra += 2 * tot_ctrl_size;
 
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p)
+		sz_extra += elem_size;
+
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
 		handler_set_err(hdl, -ENOMEM);
@@ -2503,6 +2512,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		ctrl->p_new.p = &ctrl->val;
 		ctrl->p_cur.p = &ctrl->cur.val;
 	}
+
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p) {
+		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
+		memcpy(ctrl->p_def.p, p_def.p, elem_size);
+	}
+
 	for (idx = 0; idx < elems; idx++) {
 		ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
 		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
@@ -2554,7 +2569,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, priv);
+			flags, qmenu, qmenu_int, ptr_null, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2579,7 +2594,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, NULL);
+			     flags, NULL, NULL, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2612,7 +2627,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2644,11 +2659,32 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, NULL);
+			     flags, qmenu, NULL, ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 
+/* Helper function for standard compound controls */
+struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+				const struct v4l2_ctrl_ops *ops, u32 id,
+				const union v4l2_ctrl_ptr p_def)
+{
+	const char *name;
+	enum v4l2_ctrl_type type;
+	u32 flags;
+	s64 min, max, step, def;
+
+	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
+	if (type < V4L2_CTRL_COMPOUND_TYPES) {
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
@@ -2669,7 +2705,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, NULL);
+			     flags, NULL, qmenu_int, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 570ff4b0205a..4b356df850a1 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -200,6 +200,9 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		not freed when the control is deleted. Should this be needed
  *		then a new internal bitfield can be added to tell the framework
  *		to free this pointer.
+ * @p_def:	The control's default value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
  * @p_cur:	The control's current value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer.
@@ -254,6 +257,7 @@ struct v4l2_ctrl {
 		s32 val;
 	} cur;
 
+	union v4l2_ctrl_ptr p_def;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -618,7 +622,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 					 const struct v4l2_ctrl_ops *ops,
 					 u32 id, u8 max, u64 mask, u8 def);
-
 /**
  * v4l2_ctrl_new_std_menu_items() - Create a new standard V4L2 menu control
  *	with driver specific menu.
@@ -646,6 +649,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 					       u64 mask, u8 def,
 					       const char * const *qmenu);
 
+/**
+ * v4l2_ctrl_new_std_compound() - Allocate and initialize a new standard V4L2
+ *      compound control.
+ *
+ * @hdl:       The control handler.
+ * @ops:       The control ops.
+ * @id:                The control ID.
+ * @p_def:     The control's p_def value.
+ *
+ * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
+ * to the @p_def field.
+ *
+ */
+struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+				const struct v4l2_ctrl_ops *ops, u32 id,
+				const union v4l2_ctrl_ptr p_def);
+
 /**
  * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
  *
-- 
2.23.0

