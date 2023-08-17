Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE0577F114
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348442AbjHQHS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348434AbjHQHSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:33 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CC4FE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:30 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58daaa2ba65so9682527b3.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256709; x=1692861509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Idt4cvz9LkDdyGdJGOTs7uDLmoRIiVkMODXMwC5of8Y=;
        b=jb/pEU2V0khUi2JG6pKEB+xkM9KBYnQSNvsqmi59ghcKrg9X1YwaKSzeHwy2ASwxNK
         MXD6verpcv7VaoZshicfazoHAV2q2KJ025YuttxvLfrVOm3P3vaKzkPNT//AyJWuCvPF
         tSX1Za2GT+MrVR0bMz+/51vi6b5vT58pT+VwVvNHXh4SoGRxYANkaEvZ74kmp1isoten
         aAckE12MwmllHd94pAXsCh44EFYjCvzAEb0Sn/cf++sAePE0GO4Uij2RdsNTi7/Xp/5f
         1re7tNJz7c+xwNEUC8XWBEAmbtAJAKaIp+7L/ZZ6NCL0+CZ93J7QPEXJQCbu4GrS5URW
         7LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256709; x=1692861509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Idt4cvz9LkDdyGdJGOTs7uDLmoRIiVkMODXMwC5of8Y=;
        b=aWzTT1YToWIUacnUOmNw9a9yiXr8/Sm0ZuGatRTS40g6BCW0HTJDt1em9hMLyeI7XQ
         gNi6vTWATrWSQtb3eExklwebqrMJFj/rK98LNPjCqwqJ46ZdRDjhUd7MVgCxKbvdN8tZ
         6bL42dbur7gC5xX6n6zCMCmHqnD6KX9H2zhKl8VlwZGRFpde3KuYZwY2ZymTyZIDxR82
         GgWMEpjsxKznVvcidZb5SI0JwA8EqnSpPe+iPMqafmMw+w7LUQ18Bqfo0xO/5ftKYBvd
         osU4VNx4Va3cnr/bAx8u/hiWi2GamEpBNgdwMqgouE7n72ArSTeaBgYBdjiT9ClumsD5
         KhGw==
X-Gm-Message-State: AOJu0YzRm54TL3oPwrAsNgkhwwFvITI2h0n3bWZJE+eFOBy7/mHJUZwb
        FhmMIKRilkrsV5gWHk28l+e0VAAN0uw=
X-Google-Smtp-Source: AGHT+IFIrA0RLleSvRS0ctrzJUTylBYL0PR6th+blVe5UzBx1xlOoFZKbFwoiIKjD5Vno54lRk1p1l2jd6M=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a81:ad68:0:b0:586:a6e3:88cd with SMTP id
 l40-20020a81ad68000000b00586a6e388cdmr53787ywk.5.1692256709692; Thu, 17 Aug
 2023 00:18:29 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:34 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-7-yunkec@google.com>
Subject: [PATCH v12 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add the capability of retrieving the min and max values of a
compound control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- Added a flag V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX.
- Modified std_min/max_compound() to be void function. Moved the check of
  whether WHICH_MIN/MAX_VAL into prepare_ext_ctrls(), and return EINVAL.
- Modified documentations to reflect this change.
Changelog since v10:
- No change.
Changelog since v9:
- No change.
Changelog since v8:
- Return ENODATA when min/max is not implemented. Document this behavior.
- Created a shared helper function __v4l2_ctrl_type_op_init that takes "which"
  as a parameter. Call it in def, min and max operations.
Changelog since v7:
- Document that the definition of the min/max are provided by compound controls
  are defined in control documentation.
- Return error, instead of zeroed memory for v4l2_ctrl_ptr_create(NULL).

git am from https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/
- Fixed some merge conflits.
- Fixed the build error in drivers/media/platform/qcom/venus.

 .../media/v4l/vidioc-g-ext-ctrls.rst          |  16 +-
 .../media/v4l/vidioc-queryctrl.rst            |   9 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 160 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  34 +++-
 include/uapi/linux/videodev2.h                |   3 +
 10 files changed, 252 insertions(+), 45 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 7b1001d11f9c..b4bf016411d3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -330,14 +330,26 @@ still cause this situation.
       - Which value of the control to get/set/try.
     * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
 	the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
+	value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
+	value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
 	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
 	these controls have to be retrieved from a request or tried/set for
 	a request. In the latter case the ``request_fd`` field contains the
 	file descriptor of the request that should be used. If the device
 	does not support requests, then ``EACCES`` will be returned.
 
-	When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
-	get the default value of the control, you cannot set or try it.
+	When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
+	or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
+	default/minimum/maximum value of the control, you cannot set or try it.
+
+	Whether a control supports querying the minimum and maximum values using
+	``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` is indicated
+	by the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. Most non-compound
+	control types support this. For controls with compound types, the
+	definition of minimum/maximum values are provided by
+	the control documentation. If a compound control does not document the
+	meaning of minimum/maximum value, then querying the minimum or maximum
+	value will result in the error code -EINVAL.
 
 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 56d5c8b0b88b..b39f7e27bbbe 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -447,7 +447,10 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_rect`, containing a rectangle described by
 	the position of its top-left corner, the width and the height. Units
-	depend on the use case.
+	depend on the use case. Support for ``V4L2_CTRL_WHICH_MIN_VAL`` and
+	``V4L2_CTRL_WHICH_MAX_VAL`` is optional and depends on the
+	``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the documentation of
+	the specific control on how to interpret the minimum and maximum values.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
@@ -664,6 +667,10 @@ See also the examples in :ref:`control`.
 	``dims[0]``. So setting the control with a differently sized
 	array will change the ``elems`` field when the control is
 	queried afterwards.
+    * - ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+      - 0x1000
+      - This control supports getting minimum and maximum values using
+      vidioc_g_ext_ctrls with V4L2_CTRL_WHICH_MIN/MAX_VAL.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index c46082ef0e4d..a417af25e9a4 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -393,6 +393,7 @@ replace define V4L2_CTRL_FLAG_HAS_PAYLOAD control-flags
 replace define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE control-flags
 replace define V4L2_CTRL_FLAG_MODIFY_LAYOUT control-flags
 replace define V4L2_CTRL_FLAG_DYNAMIC_ARRAY control-flags
+replace define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX control-flags
 
 replace define V4L2_CTRL_FLAG_NEXT_CTRL control
 replace define V4L2_CTRL_FLAG_NEXT_COMPOUND control
@@ -567,6 +568,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
 ignore define V4L2_CTRL_MAX_DIMS
 ignore define V4L2_CTRL_WHICH_CUR_VAL
 ignore define V4L2_CTRL_WHICH_DEF_VAL
+ignore define V4L2_CTRL_WHICH_MIN_VAL
+ignore define V4L2_CTRL_WHICH_MAX_VAL
 ignore define V4L2_CTRL_WHICH_REQUEST_VAL
 ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
 ignore define V4L2_CID_MAX_CTRLS
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 2f9c8582f940..8db4a5eb1737 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1037,7 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
 	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
-				v4l2_ctrl_ptr_create((void *)&unit_size));
+				v4l2_ctrl_ptr_create((void *)&unit_size),
+				v4l2_ctrl_ptr_create(NULL),
+				v4l2_ctrl_ptr_create(NULL));
+
 	ret = imx214->ctrls.error;
 	if (ret) {
 		dev_err(&client->dev, "%s control init failed (%d)\n",
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 7468e43800a9..28eca8f9d148 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -607,11 +607,16 @@ int venc_ctrl_init(struct venus_inst *inst)
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
-				   v4l2_ctrl_ptr_create(&p_hdr10_cll));
+				   v4l2_ctrl_ptr_create(&p_hdr10_cll),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
-				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
+				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
+
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
 			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 002ea6588edf..d022e1ed4835 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -94,6 +94,22 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
+/* Helper function: copy the minimum control value back to the caller */
+static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->minimum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
+/* Helper function: copy the maximum control value back to the caller */
+static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->maximum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
 /* Helper function: copy the caller-provider value as the new control value */
 static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
@@ -229,8 +245,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 		cs->error_idx = i;
 
 		if (cs->which &&
-		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
-		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
+		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
+		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
 		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
 			dprintk(vdev,
 				"invalid which 0x%x or control id 0x%x\n",
@@ -259,6 +275,15 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			return -EINVAL;
 		}
 
+		if (!(ctrl->flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) &&
+		    (cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+		     cs->which == V4L2_CTRL_WHICH_MAX_VAL)) {
+			dprintk(vdev,
+				"invalid which 0x%x or control id 0x%x\n",
+				cs->which, id);
+			return -EINVAL;
+		}
+
 		if (ctrl->cluster[0]->ncontrols > 1)
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
@@ -368,8 +393,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
  */
 static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
 {
-	if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
-	    which == V4L2_CTRL_WHICH_REQUEST_VAL)
+	if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
+			   which <= V4L2_CTRL_WHICH_MAX_VAL))
 		return 0;
 	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
 }
@@ -389,10 +414,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 	struct v4l2_ctrl_helper *helpers = helper;
 	int ret;
 	int i, j;
-	bool is_default, is_request;
+	bool is_default, is_request, is_min, is_max;
 
 	is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
 	is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
+	is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
+	is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
 
 	cs->error_idx = cs->count;
 	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
@@ -432,13 +459,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 		/*
 		 * g_volatile_ctrl will update the new control values.
-		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
+		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
+		 * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
 		 * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
 		 * it is v4l2_ctrl_request_complete() that copies the
 		 * volatile controls at the time of request completion
 		 * to the request, so you don't want to do that again.
 		 */
-		if (!is_default && !is_request &&
+		if (!is_default && !is_request && !is_min && !is_max &&
 		    ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
 		    (master->has_volatiles && !is_cur_manual(master)))) {
 			for (j = 0; j < master->ncontrols; j++)
@@ -467,6 +495,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 				ret = -ENOMEM;
 			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
+			else if (is_min)
+				ret = min_to_user(cs->controls + idx, ref->ctrl);
+			else if (is_max)
+				ret = max_to_user(cs->controls + idx, ref->ctrl);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
 			else
@@ -564,9 +596,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 
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
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index f1486ab032cf..f36d54810dbc 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -182,29 +182,69 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
+			    union v4l2_ctrl_ptr ptr)
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
 			    union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_min.p_const)
+		memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static int __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+				    u32 which, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 	u32 tot_elems = ctrl->elems;
 	u32 elems = tot_elems - from_idx;
+	s64 value;
 
 	if (from_idx >= tot_elems)
-		return;
+		return -EINVAL;
+
+	switch (which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		value = ctrl->default_value;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		value = ctrl->maximum;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		value = ctrl->minimum;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
+		if (which == V4L2_CTRL_WHICH_DEF_VAL)
+			value = ctrl->minimum;
+
 		for (i = from_idx; i < tot_elems; i++) {
 			unsigned int offset = i * ctrl->elem_size;
 
-			memset(ptr.p_char + offset, ' ', ctrl->minimum);
-			ptr.p_char[offset + ctrl->minimum] = '\0';
+			memset(ptr.p_char + offset, ' ', value);
+			ptr.p_char[offset + value] = '\0';
 		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s64[i] = ctrl->default_value;
+				ptr.p_s64[i] = value;
 		} else {
 			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
 		}
@@ -214,9 +254,9 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s32[i] = ctrl->default_value;
+				ptr.p_s32[i] = value;
 		} else {
 			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		}
@@ -226,32 +266,63 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
+		memset(ptr.p_u8 + from_idx, value, elems);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u16[i] = ctrl->default_value;
+				ptr.p_u16[i] = value;
 		} else {
 			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
 		}
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u32[i] = ctrl->default_value;
+				ptr.p_u32[i] = value;
 		} else {
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
 	default:
-		for (i = from_idx; i < tot_elems; i++)
-			std_init_compound(ctrl, i, ptr);
+		for (i = from_idx; i < tot_elems; i++) {
+			switch (which) {
+			case V4L2_CTRL_WHICH_DEF_VAL:
+				std_init_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MAX_VAL:
+				std_max_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MIN_VAL:
+				std_min_compound(ctrl, i, ptr);
+				break;
+			}
+		}
 		break;
 	}
+
+	return 0;
+}
+
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_DEF_VAL, ptr);
 }
 EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
+}
+
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
+}
+
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
@@ -1293,6 +1364,8 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = v4l2_ctrl_type_op_equal,
 	.init = v4l2_ctrl_type_op_init,
+	.minimum = v4l2_ctrl_type_op_minimum,
+	.maximum = v4l2_ctrl_type_op_maximum,
 	.log = v4l2_ctrl_type_op_log,
 	.validate = v4l2_ctrl_type_op_validate,
 };
@@ -1764,7 +1837,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
@@ -1888,6 +1964,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		break;
 	}
 
+	if (type < V4L2_CTRL_COMPOUND_TYPES &&
+	    type != V4L2_CTRL_TYPE_BUTTON &&
+	    type != V4L2_CTRL_TYPE_CTRL_CLASS &&
+	    type != V4L2_CTRL_TYPE_STRING)
+		flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
 	    id >= V4L2_CID_PRIVATE_BASE ||
@@ -1896,6 +1978,21 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -ERANGE);
 		return NULL;
 	}
+
+	if ((!p_def.p_const && p_min.p_const) ||
+	    (p_min.p_const && !p_max.p_const) ||
+	    (!p_min.p_const && p_max.p_const)) {
+		handler_set_err(hdl, -EINVAL);
+		return NULL;
+	}
+
+	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX &&
+	    type >= V4L2_CTRL_COMPOUND_TYPES &&
+	    (!p_min.p_const || !p_max.p_const)) {
+		handler_set_err(hdl, -EINVAL);
+		return NULL;
+	}
+
 	err = check_range(type, min, max, step, def);
 	if (err) {
 		handler_set_err(hdl, err);
@@ -1937,6 +2034,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
 		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_min.p_const)
+		sz_extra += elem_size * 2;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
@@ -2002,6 +2101,14 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
+	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX &&
+	    p_min.p_const && p_max.p_const) {
+		ctrl->p_min.p = ctrl->p_def.p + elem_size;
+		memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
+		ctrl->p_max.p = ctrl->p_min.p + elem_size;
+		memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
+	}
+
 	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
 	cur_to_new(ctrl);
 
@@ -2052,7 +2159,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, cfg->p_def, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
+			cfg->p_max, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2077,7 +2185,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, ptr_null, NULL);
+			     flags, NULL, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2110,7 +2219,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, ptr_null, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2142,7 +2252,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, ptr_null, NULL);
+			     flags, qmenu, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
@@ -2150,7 +2261,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
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
@@ -2164,7 +2277,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, p_def, NULL);
+			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
 
@@ -2188,7 +2301,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, ptr_null, NULL);
+			     flags, NULL, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01ba27f2ef87..aaf68bfaa601 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -884,7 +884,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
 			return false;
 		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		/* Default value cannot be changed */
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		/* Default, minimum or maximum value cannot be changed */
 		if (ioctl == VIDIOC_S_EXT_CTRLS ||
 		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
 			c->error_idx = c->count;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b0db167a3ac4..6e12493b30d3 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -133,6 +133,8 @@ struct v4l2_ctrl_ops {
  *
  * @equal: return true if all ctrl->elems array elements are equal.
  * @init: initialize the value for array elements from from_idx to ctrl->elems.
+ * @minimum: set the value to the minimum value of the control.
+ * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
  * @validate: validate the value for ctrl->new_elems array elements.
  *	Return 0 on success and a negative value otherwise.
@@ -142,6 +144,10 @@ struct v4l2_ctrl_type_ops {
 		      union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
 	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		     union v4l2_ctrl_ptr ptr);
+	void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
+	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
 	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };
@@ -247,6 +253,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
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
@@ -306,6 +318,8 @@ struct v4l2_ctrl {
 	} cur;
 
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -425,6 +439,8 @@ struct v4l2_ctrl_handler {
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
  * @p_def:	The control's default value for compound controls.
+ * @p_min:	The control's minimum value for compound controls.
+ * @p_max:	The control's maximum value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -454,6 +470,8 @@ struct v4l2_ctrl_config {
 	u64 step;
 	s64 def;
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
@@ -723,17 +741,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
  * @ops:       The control ops.
  * @id:        The control ID.
  * @p_def:     The control's default value.
+ * @p_min:     The control's minimum value.
+ * @p_max:     The control's maximum value.
  *
- * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
- * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
- * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
- * compound control should be all zeroes.
+ * Same as v4l2_ctrl_new_std(), but with support to compound controls, thanks
+ * to the @p_def/min/max fields. Use v4l2_ctrl_ptr_create() to create
+ * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the
+ * default value of the compound control should be all zeroes. Use
+ * v4l2_ctrl_ptr_create(NULL) if the min/max value of the compound control
+ * is not defined, -ENODATA will be returned in this case.
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
index 089d553cf736..d7670aaf3b5f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1863,6 +1863,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -1970,6 +1972,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.41.0.694.ge786442a9b-goog

