Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A0955C4BA
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243298AbiF1H6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243365AbiF1H6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:58:16 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC5F20BD9
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:49 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id w2-20020a626202000000b00527c208de00so694138pfb.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VvL5gVoIL3eoBNrL2FJqLysW4R1e+12Zx3kRpKutZRA=;
        b=BP1T+hgTHigxfHzvN5OU80imwgOjGvyH+KUyzXkdWVuBV5NZfMBQctMwiiNue4PzDF
         GA1eOzPg+5I1yYF6U4fycPrJia0D6ooF6WheQoRsuEeeK2IntphFLC9Zf0tRAUWrNsPB
         DWpl6K6RO1dMBydYZs/oQMUPW/LrPGD0XzkHlaXbCGAqBEgLzU+y9Yx1xxZKRZMy/Cv7
         tEv9Ol9kSmver4Ln+/Y+jga1JAtT077jbJ5Lih5koWDQC1MjXho7Zcd9C/oWyyS3952o
         ZfAPeJtQ67bybhzUoQvQfWcz4w3BBagoBQFgAqO7Az1BwurJErtwn2kh5b639v+R6RRK
         lcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VvL5gVoIL3eoBNrL2FJqLysW4R1e+12Zx3kRpKutZRA=;
        b=6+pibdEfcRDTc9a3gtVdqpXYcmfnvohAW6oRCl0J+vt3oWZK+Pa5JjCfTGqFs1IPzY
         lcMkkSzC7qZUZ+ONKEP4AckHP5SevWzwlc7cihOneJ2z4ubeDd68SPQjAPVUCIKmsF2E
         30LW+vvD1Zv9GIFpqpxdwIX8p09FAu3/NC/aa1TAgqRC8jk5Bqhw5xd5ly69r9PnFG8r
         n4u22MHbQ/f2TZamN/+i8QmM9aTdL1/yz9iay7st0gu3d+1lzxqr5ob3IooQPrrxOiHa
         h4lsDC5PAzPO+c02oJ9zPauwc0Lm7kx5uNuNgOTyQvo8FAdbceMgxU4+Z1wszet5JyIi
         2BvA==
X-Gm-Message-State: AJIora930qBsY+UGf81PU4rENCcwxCdaWCccJ5gBv0u3/xfmlqEoQnOU
        4i+cO6SE7nznGgq2tqmoITLHClBDQ/o=
X-Google-Smtp-Source: AGRyM1u2H88Z/C6p9tMntILFedMKyFYZSlIDSgSE100IXXFcElCBubMdV4le6UZC0f2v3m2frP5LdWaAcxw=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a17:90b:3147:b0:1ee:d3a3:f24f with SMTP id
 ip7-20020a17090b314700b001eed3a3f24fmr162093pjb.1.1656403068583; Tue, 28 Jun
 2022 00:57:48 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:57:03 +0900
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
Message-Id: <20220628075705.2278044-6-yunkec@google.com>
Mime-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 5/7] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
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

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add the capability of retrieving the min and max values of a
compound control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
git am from https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/
-Fixed some merge conflits.
-Fixed the build error in drivers/media/platform/qcom/venus.

 .../media/v4l/vidioc-g-ext-ctrls.rst          |   7 +-
 .../media/videodev2.h.rst.exceptions          |   2 +
 drivers/media/i2c/imx214.c                    |   5 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   4 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 +++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 135 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  32 ++++-
 include/uapi/linux/videodev2.h                |   2 +
 9 files changed, 214 insertions(+), 28 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 7473baa4e977..65a5f878cc28 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -284,14 +284,17 @@ still cause this situation.
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
 
 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 7b423475281d..e2dde31d76df 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -553,6 +553,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
 ignore define V4L2_CTRL_MAX_DIMS
 ignore define V4L2_CTRL_WHICH_CUR_VAL
 ignore define V4L2_CTRL_WHICH_DEF_VAL
+ignore define V4L2_CTRL_WHICH_MIN_VAL
+ignore define V4L2_CTRL_WHICH_MAX_VAL
 ignore define V4L2_CTRL_WHICH_REQUEST_VAL
 ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
 ignore define V4L2_CID_MAX_CTRLS
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 83c1737abeec..aa0bfd18f7b7 100644
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
index ed44e5800759..4af8f9ca12a6 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -579,10 +579,14 @@ int venc_ctrl_init(struct venus_inst *inst)
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL),
 				   v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL),
 				   v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index db9baa0bd05f..8a9c816b0dab 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -97,6 +97,28 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
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
@@ -220,8 +242,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 		cs->error_idx = i;
 
 		if (cs->which &&
-		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
-		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
+		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
+		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
 		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
 			dprintk(vdev,
 				"invalid which 0x%x or control id 0x%x\n",
@@ -335,8 +357,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
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
@@ -356,10 +378,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
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
@@ -399,13 +423,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
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
@@ -432,6 +457,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 				ret = def_to_user(cs->controls + idx, ref->ctrl);
 			else if (is_request && ref->valid_p_req)
 				ret = req_to_user(cs->controls + idx, ref);
+			else if (is_min)
+				ret = min_to_user(cs->controls + idx, ref->ctrl);
+			else if (is_max)
+				ret = max_to_user(cs->controls + idx, ref->ctrl);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
 			else
@@ -523,9 +552,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 
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
index 35d43ba650db..8c5828c7c6d3 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -186,6 +186,28 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
@@ -224,6 +246,82 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
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
@@ -986,6 +1084,8 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = std_equal,
 	.init = std_init,
+	.minimum = std_minimum,
+	.maximum = std_maximum,
 	.log = std_log,
 	.validate = std_validate,
 };
@@ -1368,7 +1468,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
@@ -1515,7 +1618,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
-		sz_extra += elem_size;
+		sz_extra += elem_size * 3;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
@@ -1565,6 +1668,13 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
@@ -1617,7 +1727,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, cfg->p_def, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
+			cfg->p_max, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -1642,7 +1753,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, ptr_null, NULL);
+			     flags, NULL, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -1675,7 +1787,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, ptr_null, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -1707,7 +1820,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, ptr_null, NULL);
+			     flags, qmenu, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
@@ -1715,7 +1829,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
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
@@ -1729,7 +1845,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, p_def, NULL);
+			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
 
@@ -1753,7 +1869,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, ptr_null, NULL);
+			     flags, NULL, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 21470de62d72..0f713b9a95f9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -893,7 +893,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
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
index 919e104de50b..c8ab8c44d7c6 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -131,6 +131,8 @@ struct v4l2_ctrl_ops {
  *
  * @equal: return true if both values are equal.
  * @init: initialize the value.
+ * @minimum: set the value to the minimum value of the control.
+ * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
  * @validate: validate the value. Return 0 on success and a negative value
  *	otherwise.
@@ -141,6 +143,10 @@ struct v4l2_ctrl_type_ops {
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
@@ -237,6 +243,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
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
@@ -292,6 +304,8 @@ struct v4l2_ctrl {
 	} cur;
 
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -398,6 +412,8 @@ struct v4l2_ctrl_handler {
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
  * @p_def:	The control's default value for compound controls.
+ * @p_min:	The control's minimum value for compound controls.
+ * @p_max:	The control's maximum value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -427,6 +443,8 @@ struct v4l2_ctrl_config {
 	u64 step;
 	s64 def;
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
@@ -696,17 +714,21 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
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
+ * to the @p_def/min/max field. Use v4l2_ctrl_ptr_create() to create
+ * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the
+ * default/min/max value of the compound control should be all zeroes.
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
index 2e36bb610ea6..134f6a65eacc 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1796,6 +1796,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
-- 
2.37.0.rc0.161.g10f37bed90-goog

