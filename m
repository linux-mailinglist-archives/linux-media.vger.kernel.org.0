Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20357BF0CE
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441858AbjJJCW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379400AbjJJCW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:22:27 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980F193
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:22:24 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59e8ebc0376so77947047b3.2
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904544; x=1697509344; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLVJyaShYc4mhrVGEEDVRC+Cy+W+RbPWzjD5QGsX8ts=;
        b=ySOuwMNa55xZAsRFIC9mfAoc/XaWvE2zIgdYQekAeExIYwoUk9zhrn3qYJzw+Z7HFL
         +pxmrhn5ab+0L9hVSuA/VOYzCHLVvHKcoS94JOqz0OIuwl9f8sGsAjgZ7j/DxSSjicee
         xxqptmlNghGwpWr7VFVLtq+cK9l569SKZ/X28yqrC1EkcZHy3Kpit3jHM0WmhsqOXUjM
         3nr6CzZA4L2XxBaZj+rINZvhVFcED+BAjuSlMgZ3g0kAU/hrFYYT/bQMr2aNLEUXFxI/
         TFn3JODKAGSR9K+A+L+cE/mxTJtQEHpQn9yKikvb1WFAoGVJtyKE7EAHy0ULwVDKjwWN
         FeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904544; x=1697509344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLVJyaShYc4mhrVGEEDVRC+Cy+W+RbPWzjD5QGsX8ts=;
        b=vUrw2RZxPpnoUgtcLq02fFm/zaJd5ldZVRbuqq8+H5Y0HobpBoQhS00++qFuksoQ2r
         72cMvZcMWSyIMds6Q78KQD2IISpiR1vGhZfmu0zwyz0J6OrUBTA/gsxW7YOLxrKJw8Us
         JYBjwFLnpEB+8br0EDSTFxcpLQOg8csPfjPXVpNQVtENw5/4tmRYQlIqcmljpQ7GH2ET
         4LjCTuT7zcntoeUmpuItkdYCC+I5/S4aCpa0jzh5piuyArLR6cViHQTKv6+zGvBn/PK9
         wvM2PQI11H3bQt3SIQqq5DR/nKNm4WkLWfV+usPCks39mp27dxRh2rbGq4fegh0xw3Pn
         0HKA==
X-Gm-Message-State: AOJu0YxaT07qfiMskHF8hnV1A5e9SqhbFz+F+Ptbo6hDbCAuKS8Bqk60
        tSWGbiM2VW3Xm9SXmnSAfOcJTYWiLj8=
X-Google-Smtp-Source: AGHT+IECdkPZeNrdOF3ZymUxz2d5ytWvfxzxHV0Aj8OJ9IOt4yZovMznu9qKIcsL68m23UD7XdJdP8VJvcE=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a05:690c:c15:b0:5a7:a98a:4af0 with SMTP id
 cl21-20020a05690c0c1500b005a7a98a4af0mr44389ywb.3.1696904543862; Mon, 09 Oct
 2023 19:22:23 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:31 +0900
In-Reply-To: <20231010022136.1504015-1-yunkec@google.com>
Mime-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-9-yunkec@google.com>
Subject: [PATCH v13 08/11] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- No change.
Changelog since v10:
- Added Reviewed-by from Sergey.
Changelog since v9:
- Revert a change in v7 that causes v4l2-compliance failure:
- In uvc_ioctl_g_ext_ctrls(), when v4l2_which is not V4L2_CTRL_WHICH_*_VAL,
- treat it the same as cur instead of returning EINVAL. This is the existing
- behavior.
- The change in v7 of returning EINVAL fails the check in
- v4l2-compliance/v4l2-test-controls.cpp#L834.
Changelog since v8:
- No change.
Changelog since v7:
- Address some comments.

 drivers/media/usb/uvc/uvc_ctrl.c | 64 +++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c |  7 +++-
 drivers/media/usb/uvc/uvcvideo.h |  3 +-
 3 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aae2480496b7..c073c2a02102 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1247,11 +1247,18 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!ctrl)
 		return -EINVAL;
 
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
-		return -EACCES;
-
-	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
-		return -EACCES;
+	if (read) {
+		if (ctrls->which == V4L2_CTRL_WHICH_MIN_VAL ||
+		    ctrls->which == V4L2_CTRL_WHICH_MAX_VAL) {
+			if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) ||
+			    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX))
+				return -EINVAL;
+		} else if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+			return -EACCES;
+	} else {
+		if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
+			return -EACCES;
+	}
 
 	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
 		return 0;
@@ -1332,6 +1339,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
+	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
 
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
@@ -1981,6 +1991,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 				       struct uvc_control *ctrl,
 				       struct uvc_control_mapping *mapping,
+				       u32 v4l2_which,
 				       struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
@@ -1990,28 +2001,59 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	xctrl->value = qc.default_value;
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		xctrl->value = qc.default_value;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		xctrl->value = qc.minimum;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		xctrl->value = qc.maximum;
+		break;
+	}
+
 	return 0;
 }
 
 static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
 					    struct uvc_control *ctrl,
 					    struct uvc_control_mapping *mapping,
+					    u32 v4l2_which,
 					    struct v4l2_ext_control *xctrl)
 {
+	u32 flag, id;
 	int ret;
 
+	switch (v4l2_which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		flag = UVC_CTRL_FLAG_GET_DEF;
+		id = UVC_CTRL_DATA_DEF;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		flag = UVC_CTRL_FLAG_GET_MIN;
+		id = UVC_CTRL_DATA_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		flag = UVC_CTRL_FLAG_GET_MAX;
+		id = UVC_CTRL_DATA_MAX;
+		break;
+	}
+
+	if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
+		return -EINVAL;
+
 	if (!ctrl->cached) {
 		ret = uvc_ctrl_populate_cache(chain, ctrl);
 		if (ret < 0)
 			return ret;
 	}
 
-	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, xctrl);
+	return __uvc_ctrl_get_compound(mapping, ctrl, id, xctrl);
 }
 
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl)
+			  struct v4l2_ext_control *xctrl, u32 v4l2_which)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -2028,9 +2070,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
 	if (uvc_ctrl_mapping_is_compound(mapping))
 		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
-						       xctrl);
+						       v4l2_which, xctrl);
 	else
-		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
+		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping,
+						  v4l2_which, xctrl);
+
 
 done:
 	mutex_unlock(&chain->ctrl_mutex);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index ff72caf7bc9e..352f62ef02f2 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1094,9 +1094,12 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			ret = uvc_ctrl_get_boundary(chain, ctrl);
+			ret = uvc_ctrl_get_boundary(chain, ctrl, ctrls->which);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11805b729c22..6fda40919e7f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -790,7 +790,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl);
+			  struct v4l2_ext_control *xctrl,
+			  u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,
-- 
2.42.0.609.gbb76f46606-goog

