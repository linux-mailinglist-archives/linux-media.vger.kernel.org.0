Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BBC534A1F
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 07:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345707AbiEZFIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 01:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345684AbiEZFIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 01:08:13 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BFCBA563
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:08:12 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e130-20020a255088000000b006562089bd18so719243ybb.4
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0lA37zMrjvx84o/DLKJaiOZJ8gMAmu+PtsEcloOUVIA=;
        b=EnHYuRMj/7cMb/zxQ11tXcY8iSqDOrGcIsH3brHh6mhuqsgFZFLxJuSy8kMy3zTS7T
         KqyFUSSLdWhKkHOpCOIy9Gg5iKbNPd9cmpB7wK/adYHyskspU6D18DI+yPpoadYXYKS3
         KGBFjXdAIvgI5fMlcJPPqM35Qg6ma0IQic3MYEdkVXfCrFMOV0f/o2r/r16+n50W5jDs
         WSNSg68qgVNIf3xo0FCwr2YlZkOQ433Sk1nTb9fchaAU5F0o6hiyFlEfeutJSaf6KRiz
         /bIgwC5+WPJJ580ooMwUAMBkbRwhzvfc8MQNinK/WBIWHqtxTlAKH7OdTXgccV99BSzB
         IrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0lA37zMrjvx84o/DLKJaiOZJ8gMAmu+PtsEcloOUVIA=;
        b=erKis07k2b0Afn9EpCK8CFiikBZDysxOtzo3u41s20///qOMVlr7niLDQ8NARh88qm
         I0hTG/N1mQtCsSjVBQ5PGddZMtLoztw48Eg1mRZcx5P8JCJjIgWFMTbB9U3LjxWjZzC8
         xlE8Vz6Q3vq9JhSth9blefsgq87HAyRCai/GlrSQlfFyHzz0u6g7EBQGUyBbcmQ02c8+
         U+XTyRzu8l1zarrIeWF9Fm3bfbaqYG8rCvJk2hpypxS04/PzjaVPTsDDwhT9clHEcyd5
         sN9aeB4CkKiGA9tWk5fhZbfcYuQrA5TY0JWynV00c+526AZpgq+2KK5bMBV1rhdXNL5v
         zd2Q==
X-Gm-Message-State: AOAM532l66Q4AVyFsQQwiyei8i+GjTV6XCigNtP1eyTdRt81L4sRIdO6
        QhGiYBXdi33P8PF7T3lX96ugjFeC27s=
X-Google-Smtp-Source: ABdhPJxzsCap1lQa2MieIxCJMW1lPQ4KWjvoXS7F5ZHbL+csW3lPxwSJFPXkQ8sB16N4VTbFCC2kqvGD8AY=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9e5b:ab60:68b2:d628])
 (user=yunkec job=sendgmr) by 2002:a25:324b:0:b0:655:8309:48d0 with SMTP id
 y72-20020a25324b000000b00655830948d0mr8326313yby.79.1653541691353; Wed, 25
 May 2022 22:08:11 -0700 (PDT)
Date:   Thu, 26 May 2022 14:07:42 +0900
In-Reply-To: <20220526050744.2431518-1-yunkec@google.com>
Message-Id: <20220526050744.2431518-4-yunkec@google.com>
Mime-Version: 1.0
References: <20220526050744.2431518-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v5 3/5] media: uvcvideo: implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
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

Implement support for ROI as described in UVC 1.5:
4.2.2.1.20 Digital Region of Interest (ROI) Control

ROI control is implemented using V4L2 control API as
two uvc-specific controls:
V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
References a rejected attempt that uses v4l2 selection API:
https://lore.kernel.org/lkml/20210501082001.100533-2-senozhatsky@chromium.org
Changelog since v4:
-Check boundary condition: width or height == 0.
-Populate xctrl->id and xctrl->size.
-Split code for V4L2_CTRL_WHICH_MIN/MAX_VAL to patch 4/5.

 drivers/media/usb/uvc/uvc_ctrl.c   | 207 ++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   |   8 +-
 drivers/media/usb/uvc/uvcvideo.h   |  10 +-
 include/uapi/linux/usb/video.h     |   1 +
 include/uapi/linux/uvcvideo.h      |  13 ++
 include/uapi/linux/v4l2-controls.h |   8 ++
 6 files changed, 223 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b4f6edf968bc..c470861e408a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -355,6 +355,16 @@ static const struct uvc_control_info uvc_ctrls[] = {
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
+				| UVC_CTRL_FLAG_AUTO_UPDATE,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -728,6 +738,24 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 64,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
+		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
+	},
+	{
+		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 16,
+		.offset		= 64,
+		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
+		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
+	},
 };
 
 /* ------------------------------------------------------------------------
@@ -749,6 +777,34 @@ static inline void uvc_clear_bit(u8 *data, int bit)
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
+	    v4l2_rect->height > U16_MAX || v4l2_rect->height == 0 ||
+	    v4l2_rect->width > U16_MAX || v4l2_rect->width == 0 ||
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
@@ -963,11 +1019,23 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
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
+	struct v4l2_rect v4l2_rect = {};
 
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
 		return -EACCES;
@@ -993,8 +1061,19 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 		ctrl->loaded = 1;
 	}
 
-	*value = __uvc_ctrl_get_value(mapping,
+	xctrl->id = mapping->id;
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_RECT:
+		__uvc_ctrl_get_v4l2_rect(ctrl, mapping, UVC_CTRL_DATA_CURRENT,
+					 &v4l2_rect);
+		xctrl->size = sizeof(v4l2_rect);
+		return copy_to_user(xctrl->p_rect, &v4l2_rect,
+				sizeof(v4l2_rect));
+
+	default:
+		xctrl->value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	}
 
 	return 0;
 }
@@ -1104,13 +1183,14 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
@@ -1344,16 +1424,16 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
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
@@ -1515,13 +1595,13 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
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
@@ -1682,10 +1762,14 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
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
@@ -1694,7 +1778,36 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		flag = UVC_CTRL_FLAG_GET_DEF;
+		id = UVC_CTRL_DATA_DEF;
+		query = UVC_GET_DEF;
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
@@ -1703,6 +1816,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	struct uvc_video_chain *chain = handle->chain;
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
+	struct v4l2_rect v4l2_rect;
+	struct uvc_rect uvc_rect;
 	s32 value;
 	u32 step;
 	s32 min;
@@ -1774,6 +1889,16 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 
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
@@ -1807,8 +1932,16 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2366,6 +2499,40 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
 	}
 }
 
+static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control *ctrl)
+{
+	int ret;
+
+	ret = uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+	if (ret)
+		goto out;
+
+	/*
+	 * Most firmwares have wrong GET_CURRENT configuration. E.g. it's
+	 * below GET_MIN, or have rectangle coordinates mixed up. This
+	 * causes problems sometimes, because we are unable to set
+	 * auto-controls value without first setting ROI rectangle to
+	 * valid configuration.
+	 *
+	 * We expect that default configuration is always correct and
+	 * is within the GET_MIN / GET_MAX boundaries.
+	 *
+	 * Set current ROI configuration to GET_DEF, so that we will
+	 * always have properly configured ROI.
+	 */
+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+out:
+	if (ret)
+		dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", ret);
+	return ret;
+}
+
 /*
  * Add control information and hardcoded stock control mappings to the given
  * device.
@@ -2378,6 +2545,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
 	const struct uvc_control_mapping *mend =
 		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const u8 camera_entity[16] = UVC_GUID_UVC_CAMERA;
 
 	/* XU controls initialization requires querying the device for control
 	 * information. As some buggy UVC devices will crash when queried
@@ -2398,6 +2566,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			 * GET_INFO on standard controls.
 			 */
 			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
+
+			if (ctrl->info.selector ==
+				UVC_CT_REGION_OF_INTEREST_CONTROL &&
+			    uvc_entity_match_guid(ctrl->entity, camera_entity))
+				uvc_ctrl_init_roi(chain->dev, ctrl);
 			break;
 		 }
 	}
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 711556d13d03..040511da1005 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1040,15 +1040,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
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
@@ -1059,7 +1055,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
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
index 8288137387c0..b16e5d373f3f 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -16,6 +16,7 @@
 #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
 #define UVC_CTRL_DATA_TYPE_ENUM		4
 #define UVC_CTRL_DATA_TYPE_BITMASK	5
+#define UVC_CTRL_DATA_TYPE_RECT		6
 
 /* Control flags */
 #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
@@ -36,6 +37,18 @@
 	 UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
 	 UVC_CTRL_FLAG_GET_DEF)
 
+/* V4L2 private controls */
+#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_UVC_BASE+1)
+#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_UVC_BASE+2)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
+
 struct uvc_menu_info {
 	__u32 value;
 	__u8 name[32];
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index bb40129446d4..48d12782e7e4 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1008,6 +1008,14 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
+/* CAMERA-class private control IDs */
+
+/*
+ * The base for the uvc driver controls. See linux/uvcvideo.h for the list
+ * of controls. We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_CAMERA_UVC_BASE		(V4L2_CID_CAMERA_CLASS_BASE + 0x1000)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.36.1.124.g0e6072fb45-goog

