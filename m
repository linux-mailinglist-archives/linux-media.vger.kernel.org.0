Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E06EF044
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 10:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239998AbjDZIbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 04:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240149AbjDZIa7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 04:30:59 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54ACC3A94
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:56 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-b8f6bef3d4aso12970624276.0
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682497855; x=1685089855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnZcxqHSuUyKZf7x8wUyjkC3dplKZZ6UnGtX7jcH56Y=;
        b=e1MUkYmlCCxr1zCApJDYBgTJzZWHGUSRlXQolg0lOUWfpcrZti7PrigONUuQGBNTFM
         R82mK9iSVWRodBoqHqHeYM0otbQhctR9jKq2N457Ri/rahcETXfctyestmOP520iww0R
         1VWsPuOgvj8CVbiXN1VS8nL6zrJ+/YqLyOIc1Hp2yZkJ5XQ+4z/ssItwmwod43bHHW8m
         HuM8ckCTOQPoZrI5yJv28/h2MZb1A50uHUOWUM46XLLkCVSto0jYOcWFCzh7ejZkeNv/
         Lugy/Q+iU8yabV8uKiEb+jWeFU4xaVGuItPvI4Ti26WMdU/5dTivEuboPq1kftrY4o8N
         mVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497855; x=1685089855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnZcxqHSuUyKZf7x8wUyjkC3dplKZZ6UnGtX7jcH56Y=;
        b=YA6zfzBpag91mnYlXjtTu8icFUV34ndL3F906hs5DVyREFKbLSrVbyQPQxtw0HQn31
         YrNa5qk8qgGwVgdEPhwcsgkRbxkw0cQSJPD6jXcXPA5Spm65+PpVOatUiarzbc/dGEWh
         fKWv+gKDC51OdYpuX4xNNbXG7pgVE98MU8wsjrg9c5OSdBdPxzSVV4ZfqVshBj3C4dMG
         PKWKZNId6eBNweYSBFT4yP/fxLM+LXExdhW0WORSHaDzB8Hx8T4Jvg4ZjRCEErSlBLCJ
         eHEI4ZMiPoGtqS6aqy21pSypOULEbq3EkDtZKCVnUiKkB9JWkwfxcWz7lZh7tbo+eyL0
         /MIg==
X-Gm-Message-State: AAQBX9cUlVfGAxn+V0kqfvG9tQtJ+z+9ehrd4sDJnan0jXIUs/SJsq63
        K1o8CE/nQqeVGoA6NB8us5RgQngsIGA=
X-Google-Smtp-Source: AKy350ZKSfwhFx9faNOqgdLUxtjPK4H0lK95GnLpSlugCfEZJEzGhNgkm1b9XyWgT5aPUzflOhPGwwDtnVU=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:1f4e:598b:ed:99bd])
 (user=yunkec job=sendgmr) by 2002:a25:778d:0:b0:b99:4132:b5bc with SMTP id
 s135-20020a25778d000000b00b994132b5bcmr9996967ybc.8.1682497855579; Wed, 26
 Apr 2023 01:30:55 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:29:20 +0900
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230426082923.132909-9-yunkec@google.com>
Subject: [PATCH v11 08/11] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
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

 drivers/media/usb/uvc/uvc_ctrl.c | 44 ++++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c |  7 +++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 8f0401230649..109369ec2c42 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1978,6 +1978,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 				       struct uvc_control *ctrl,
 				       struct uvc_control_mapping *mapping,
+				       u32 v4l2_which,
 				       struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
@@ -1987,28 +1988,59 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
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
+		return -EACCES;
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
@@ -2025,9 +2057,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
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
index 77704bd21e5c..2aeb92e8621f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1093,9 +1093,12 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
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
index 8d36a3f8c52e..69aba8873f65 100644
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
2.40.1.495.gc816e09b53d-goog

