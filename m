Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D0F77F115
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348444AbjHQHTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348436AbjHQHSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:43 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69896FE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:42 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-589cc9f7506so72261667b3.2
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256721; x=1692861521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ8mscSkEPyWJxIlqYWQM8ErTgK/t9Vt2RcnbcoV9Fg=;
        b=Qb1SrQawmBF4xTZGGB9gCluanqQcXjXY7e0ONKjJh9mCIHf/iDvJ9+boR9Ey9KDUKl
         BLOsLlb00lTtUsyypZac7EoFaABMZzO1yiHre0yq5xeUQx2Sag9dzYs7X9LExD4J5cbR
         IKqKjnCj/pOHkCEMaKuytIVVP5TOGUcarAmzAbCg+Ay3QBIA4Q7CZWI83Xc5aiAPLckx
         IDYT5LxmrkpfWZEEGjxoB+pCWTsS6sAKQI/Ni+wOEAeqazSnCj9gPaJaJ2yIyGS31IWu
         XeqE7ys55J/SkzwSVEBKfZetqeDdtwbuHkDr1MNBG7bXbk0lBgVMw6tiwGyz1gbAV9zR
         EuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256721; x=1692861521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ8mscSkEPyWJxIlqYWQM8ErTgK/t9Vt2RcnbcoV9Fg=;
        b=PYoLNHUrbIMxEF1VNYXFN8wxrdsBSKeAFWrCdMOSAKioBv5idQAhEwD5LSyN+Uwkn1
         y6CH/M/3VEV3G4NzTOS6TX1563jh8d7n1RM9QuYzAhfdBofhMGUEUw5iVP1n7K2VLTln
         3c+1G6CGFdg4mhlQ2no/fMwNfkINSC5qWvpWh6Kab+4bgrPy1cnIAejcxWHshHaUIwr9
         HGtRwo+z3eAgIS+EzY+fn1FfeIz2hkYfBXPgFJ16CL1QggsyWUcHRTl7eugPkdJxtvxg
         xq4UrfV9a5GW/tL7uqIv31ixwd7EPunMFWG5Pl3tWhEsoMO80FFIbq4Us+8nAt9CPf9/
         eWIA==
X-Gm-Message-State: AOJu0YwC0MDFHlEAauSoGfgXOuxS1ykm/nGVzkFhzAR2tHFO9+U9OkL2
        u+lum84DBp7gMXWy1cs7zJW7AF07vzI=
X-Google-Smtp-Source: AGHT+IFCUveyW0x+P3v8JMTuJgkNwix2Gv7kvXjLs9aK9woRPnrIRRe6kSPT5lJCl5T8rKFZMc5rTMS2diE=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a25:e682:0:b0:d62:60e3:2381 with SMTP id
 d124-20020a25e682000000b00d6260e32381mr47997ybh.1.1692256721696; Thu, 17 Aug
 2023 00:18:41 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:36 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-9-yunkec@google.com>
Subject: [PATCH v12 08/11] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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
index 197e00e146b4..1d8df8551acd 100644
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
+			return -EINVAL;
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
@@ -1978,6 +1988,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 				       struct uvc_control *ctrl,
 				       struct uvc_control_mapping *mapping,
+				       u32 v4l2_which,
 				       struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
@@ -1987,28 +1998,59 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
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
@@ -2025,9 +2067,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
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
index dee3151ff6c4..06aa819a6f75 100644
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
2.41.0.694.ge786442a9b-goog

