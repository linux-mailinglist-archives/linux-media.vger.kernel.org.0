Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723CE52866E
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 16:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244163AbiEPOFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 10:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243947AbiEPOFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 10:05:07 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF893A1B5
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:05:06 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e202-20020a25e7d3000000b0064dc69dfa9cso1545411ybh.16
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dggB1sTSjPpcxUIiJu72svtYy7RvemyC223O/9ug7mo=;
        b=Pf5bhy3m/r4lsOXjYBIIgRZDBhMvCOw2Hb67hmC7Tq268r6K69nVU54HzXgONtu0dy
         nzZ0x2cZHTIeOfqVdO3yEIEa6YJyqjI4pnZUc43JdI/GYo8Wyi8OuwUpom7tUTgLhwly
         dNIqfI4p1kGPCg4b9VQQ6oNvA7jX+vZKKLAAmspezFTE2TpK2OnkG3nnrRBa+FECh3DV
         QLbeHt3WwO81lC2UpO4ptLfQN/RWOWk92O+x07EFI3fyHFautPHb6JUfYjzEqGSc3t5f
         hrvuaD+AkLMSPgQlyeauOKEq8pXeSyakIMxkO7ho7OVeMt+UVBlBLFtegXjQZUCv92n2
         jc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dggB1sTSjPpcxUIiJu72svtYy7RvemyC223O/9ug7mo=;
        b=J0Zx1xM2sOGMlvIESdjoPxO9PMYzl4UkEQwDYUwXrCXW6bnTksOOjqie6UnR8Zn8C/
         orqkaE04Q6cTBLW0oiIrsSa1+KTR6A8hBYGW69kEhPKc32xDFqlL+xltw2BR5cADbhkt
         hyyxJ9JQkBYiZLoxyVhlcAVOp/NGMty1KqCK+1yuR45aoGQ05zCEOgch1K4m4K2mLp2+
         gINIfig73QaWUXyOLIS9sb0WkZrEXu1BwA5bA1L5KaKUCsZ8XKW2SYdXsMfh1eUcSXi3
         qFaauOW55YpBTWr/5Q21KcYWGCZBDFgxsIx0ew/oOCyDBWsvBOXFVtOMMudSp4DrcP0J
         jEJg==
X-Gm-Message-State: AOAM530KbtDYww9N4hijybHLe7Dhc3tdclJVapOzDPnlL5Yw3JVN7lSl
        RQH9gkmIiXVgWViexGPKumH9hZeXuxU=
X-Google-Smtp-Source: ABdhPJxKmOhHYtgQwJNDNpfpmqXq37pmQjlKKNynIlh/ZMOvFGgu2wgH1EidY4SWtaKlsuW4brfmaxb5+P4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a25:3f45:0:b0:64a:e92d:cb3d with SMTP id
 m66-20020a253f45000000b0064ae92dcb3dmr18301648yba.60.1652709905413; Mon, 16
 May 2022 07:05:05 -0700 (PDT)
Date:   Mon, 16 May 2022 23:04:32 +0900
In-Reply-To: <20220516140434.1871022-1-yunkec@google.com>
Message-Id: <20220516140434.1871022-5-yunkec@google.com>
Mime-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v2 4/6] media: uvcvideo: implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Supports GET_CUR, GET_DEF, GET_MIN and GET_MAX requests for UVC v1.5
using V4L2 control API.

References a rejected attempt that uses v4l2 selection API:
https://lore.kernel.org/lkml/20210501082001.100533-2-senozhatsky@chromium.org

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 .../userspace-api/media/drivers/uvcvideo.rst  |   1 +
 drivers/media/usb/uvc/uvc_ctrl.c              | 173 ++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
 drivers/media/usb/uvc/uvcvideo.h              |  10 +-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/uvcvideo.h                 |   1 +
 6 files changed, 173 insertions(+), 25 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index e5fd8fad333c..43b8431b0d9f 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
 	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
 	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
 	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
+	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
 
 
 UVCIOC_CTRL_QUERY - Query a UVC XU control
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b4f6edf968bc..c3d816985f13 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -355,6 +355,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
 		.flags		= UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.index		= 21,
+		.size		= 10,
+		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_DEF
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -728,6 +737,24 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_REGION_OF_INTEREST_RECT,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 64,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
+		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
+	},
+	{
+		.id		= V4L2_CID_REGION_OF_INTEREST_AUTO,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 16,
+		.offset		= 64,
+		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
+		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
+	},
 };
 
 /* ------------------------------------------------------------------------
@@ -749,6 +776,33 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 	data[bit >> 3] &= ~(1 << (bit & 7));
 }
 
+static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
+	const struct uvc_rect *uvc_rect)
+{
+	v4l2_rect->top = uvc_rect->top;
+	v4l2_rect->left = uvc_rect->left;
+	v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
+	v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
+}
+
+static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
+	const struct v4l2_rect *v4l2_rect)
+{
+	// Safely converts s32 and u32 to u16.
+	if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
+	    v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
+	    v4l2_rect->height > U16_MAX || v4l2_rect->width > U16_MAX ||
+	    v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
+	    v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
+		return -ERANGE;
+
+	uvc_rect->top = v4l2_rect->top;
+	uvc_rect->left = v4l2_rect->left;
+	uvc_rect->bottom = v4l2_rect->height + v4l2_rect->top - 1;
+	uvc_rect->right = v4l2_rect->width + v4l2_rect->left - 1;
+	return 0;
+}
+
 /* Extract the bit string specified by mapping->offset and mapping->size
  * from the little-endian data stored at 'data' and return the result as
  * a signed 32bit integer. Sign extension will be performed if the mapping
@@ -963,11 +1017,23 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
 	return value;
 }
 
+static void __uvc_ctrl_get_v4l2_rect(struct uvc_control *ctrl,
+				     struct uvc_control_mapping *mapping,
+				     u32 id,
+				     struct v4l2_rect *rect)
+{
+	struct uvc_rect *uvc_rect =
+		(struct uvc_rect *)(uvc_ctrl_data(ctrl, id)
+					+ mapping->offset / 8);
+	uvc_to_v4l2_rect(rect, uvc_rect);
+}
+
 static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
-	s32 *value)
+	struct v4l2_ext_control *xctrl)
 {
 	int ret;
+	struct v4l2_rect v4l2_rect;
 
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
 		return -EACCES;
@@ -993,8 +1059,17 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 		ctrl->loaded = 1;
 	}
 
-	*value = __uvc_ctrl_get_value(mapping,
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_RECT:
+		__uvc_ctrl_get_v4l2_rect(ctrl, mapping, UVC_CTRL_DATA_CURRENT,
+					 &v4l2_rect);
+		return copy_to_user(xctrl->p_rect, &v4l2_rect,
+				sizeof(v4l2_rect));
+
+	default:
+		xctrl->value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	}
 
 	return 0;
 }
@@ -1104,13 +1179,14 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		struct v4l2_ext_control xctrl;
+		int ret =
+			__uvc_ctrl_get(chain, master_ctrl, master_map, &xctrl);
 		if (ret < 0)
 			return ret;
 
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		if (xctrl.value != mapping->master_manual)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 	}
 
 	if (!ctrl->cached) {
@@ -1344,16 +1420,16 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *mapping = NULL;
 	struct uvc_control *ctrl = NULL;
 	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
-	s32 val = 0;
+	struct v4l2_ext_control xctrl;
 
 	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (__uvc_ctrl_get(chain, ctrl, mapping, &xctrl) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
-	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
+	uvc_ctrl_send_event(chain, handle, ctrl, mapping, xctrl.value, changes);
 }
 
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
@@ -1515,13 +1591,13 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 	if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
 		struct v4l2_event ev;
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
-		s32 val = 0;
+		struct v4l2_ext_control xctrl;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &xctrl) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
-		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
-				    changes);
+		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping,
+				xctrl.value, changes);
 		/* Mark the queue as active, allowing this initial
 		   event to be accepted. */
 		sev->elems = elems;
@@ -1682,10 +1758,14 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct v4l2_ext_control *xctrl)
+	struct v4l2_ext_control *xctrl, u32 v4l2_which)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
+	int ret;
+	u32 flag;
+	u32 id;
+	u8 query;
 
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
@@ -1694,7 +1774,46 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		flag = UVC_CTRL_FLAG_GET_DEF;
+		id = UVC_CTRL_DATA_DEF;
+		query = UVC_GET_DEF;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		flag = UVC_CTRL_FLAG_GET_MIN;
+		id = UVC_CTRL_DATA_MIN;
+		query = UVC_GET_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		flag = UVC_CTRL_FLAG_GET_MAX;
+		id = UVC_CTRL_DATA_MAX;
+		query = UVC_GET_MAX;
+		break;
+	case V4L2_CTRL_WHICH_CUR_VAL:
+	default:
+		return __uvc_ctrl_get(chain, ctrl, mapping, xctrl);
+	}
+
+	if (!ctrl->cached) {
+		ret = uvc_ctrl_populate_cache(chain, ctrl);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (!(ctrl->info.flags & flag))
+		return -EACCES;
+
+	if (mapping->v4l2_type == V4L2_CTRL_TYPE_RECT) {
+		struct v4l2_rect rect;
+
+		__uvc_ctrl_get_v4l2_rect(ctrl, mapping, id, &rect);
+		return copy_to_user(xctrl->p_rect, &rect, sizeof(rect));
+	}
+
+	xctrl->value = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id));
+
+	return 0;
 }
 
 int uvc_ctrl_set(struct uvc_fh *handle,
@@ -1703,6 +1822,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	struct uvc_video_chain *chain = handle->chain;
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
+	struct v4l2_rect v4l2_rect;
+	struct uvc_rect uvc_rect;
 	s32 value;
 	u32 step;
 	s32 min;
@@ -1774,6 +1895,16 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		ret = copy_from_user(&v4l2_rect, xctrl->p_rect,
+				sizeof(v4l2_rect));
+		if (ret < 0)
+			return ret;
+		ret = v4l2_to_uvc_rect(&uvc_rect, &v4l2_rect);
+		if (ret < 0)
+			return ret;
+		break;
+
 	default:
 		value = xctrl->value;
 		break;
@@ -1807,8 +1938,16 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	switch (mapping->data_type) {
+	case UVC_CTRL_DATA_TYPE_RECT:
+		memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT)
+			+ mapping->offset / 8,
+			&uvc_rect, sizeof(uvc_rect));
+		break;
+	default:
+		mapping->set(mapping, value,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 711556d13d03..a88d3fe6de93 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1038,17 +1038,15 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
+	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL ||
+	    ctrls->which == V4L2_CTRL_WHICH_MIN_VAL ||
+	    ctrls->which == V4L2_CTRL_WHICH_MAX_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
+			ret = uvc_ctrl_get(chain, ctrl, ctrls->which);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
 			}
-
-			ctrl->value = qc.default_value;
 		}
 
 		return 0;
@@ -1059,7 +1057,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 		return ret;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_get(chain, ctrl);
+		ret = uvc_ctrl_get(chain, ctrl, ctrls->which);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
 			ctrls->error_idx = i;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 143230b3275b..f414ad7d57b2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -424,6 +424,13 @@ struct uvc_streaming_header {
 	u8 bTriggerUsage;
 };
 
+struct uvc_rect {
+	u16 top;
+	u16 left;
+	u16 bottom;
+	u16 right;
+} __packed;
+
 enum uvc_buffer_state {
 	UVC_BUF_STATE_IDLE	= 0,
 	UVC_BUF_STATE_QUEUED	= 1,
@@ -897,7 +904,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 	return __uvc_ctrl_commit(handle, 1, NULL);
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl,
+		 u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index bfdae12cdacf..9076a444758a 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -104,6 +104,7 @@
 #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
 #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
 #define UVC_CT_PRIVACY_CONTROL				0x11
+#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
 
 /* A.9.5. Processing Unit Control Selectors */
 #define UVC_PU_CONTROL_UNDEFINED			0x00
diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
index 8288137387c0..d7d77602a5e7 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -16,6 +16,7 @@
 #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
 #define UVC_CTRL_DATA_TYPE_ENUM		4
 #define UVC_CTRL_DATA_TYPE_BITMASK	5
+#define UVC_CTRL_DATA_TYPE_RECT		6
 
 /* Control flags */
 #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
-- 
2.36.0.550.gb090851708-goog

