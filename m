Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD05C7BF0C6
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441849AbjJJCV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441843AbjJJCVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:21:55 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2349693
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:21:54 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7b9e83b70so3860627b3.0
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904513; x=1697509313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgMooTmfsY7D1tW8ueH79VZeEdXrtsvNQwGx0XkGMo4=;
        b=NetkawKuTv9Y+gz7L4XzagfchWa6w4BDINO2/5el60F6KnKBP4BlxrV00z/NUFzyjp
         reStAnKBEYmfIMD+EjM0eSFbLkaaYHRVrZgsiIEYyD3seLdkB4jDuENgI15PBkn/4bFy
         DTSvW1hbH/h+mWIyTF2m+RBYLhvy+4LPp+1hc3Hx9/sOwcjTW5elMvJ7Wl1Y0OZ2gShR
         pkq1j+RULDUn3BeR+FzaaolofoVlyamvpEQCxcG1ArEWiz/YNVZCfrrnCkTS6rtgbMid
         nqAD4B8iMn7mtN38xS9vM53Jf+F3nt/vVulJVmiW3Cr5tDg5I0JaTq9TR0bHtBLylnf7
         d+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904513; x=1697509313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgMooTmfsY7D1tW8ueH79VZeEdXrtsvNQwGx0XkGMo4=;
        b=bDqpKFHwn6mAcLEpc1iVQnqpY3tX3e7WURlvewnd+tdX5YdTia5DWm7KysTl6nkRqF
         jNxgEEW6LLA4HlUhn7Ho4x2s8aQYWFIVVrhUmWDYATqeS6k8SSL6crYtmxHRsQHm/D36
         HMYTx8YFw7rmE5YtjprTBFSjIBlPDj/PckL16dB+ZTP0MALdl9F+d0fZuyH7ldcUm4Vk
         KKjFGyI9E9OnVGr8Vauf6mV5fyhOu8g5e1n6ekGARxn7Btn/NhmhQIwN71WHI/jVBozo
         R0x915e5wS2pbcnMxvsBHY1MPLZlOaNX3iY67rBxWBybSREd6B95FgUkulM4pVyBi4ze
         AOGQ==
X-Gm-Message-State: AOJu0YyR3iylVhzEN901D3cM58AU8ScD5Z2BX4H6IZPfvxmz0ZAh0GVr
        TVZaVxeVQrVQDMKsj7Xv+JX8v3MEHlg=
X-Google-Smtp-Source: AGHT+IGJ/RVDPs0xhnZXNBwivyf6Kb9eudA18h0uLUbA2TTB3OnXxEBmid9crBdPQhEJ64RwJjrAP9Tu7X0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a05:690c:2f0e:b0:5a7:7f50:b8a2 with SMTP id
 ev14-20020a05690c2f0e00b005a77f50b8a2mr150439ywb.0.1696904513350; Mon, 09 Oct
 2023 19:21:53 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:25 +0900
In-Reply-To: <20231010022136.1504015-1-yunkec@google.com>
Mime-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-3-yunkec@google.com>
Subject: [PATCH v13 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
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

Introduce uvc_ctrl_get_boundary(), making it easier to extend to
support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
following patches.

For now, it simply returns EINVAL for compound controls and calls
__query_v4l2_ctrl() for non-compound controls.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
An alternative name is uvc_ctrl_get_statc(). Let me know if that's better.

Changelog since v11:
- No change.
Changelog since v10:
- Fix __uvc_ctrl_get_boundary_std() typo causing build error.
- Added Reviewed-by from Sergey.
Changelog since v9:
- Make __uvc_ctrl_get_boundary_std() static.
Changelog since v8:
- No Change.
Changelog since v7:
- Rename uvc_ctrl_get_fixed() to uvc_ctrl_get_boundary().
- Move refactor (introduce  __uvc_ctrl_get_boundary_std()) in this patch
  instead of in the patch where we implement compound control.
- Fix locking. uvc_ctrl_get_boundary() now acquires ctrl_mutex.
  __uvc_ctrl_get_boundary_std() calls __uvc_query_v4l2_ctrl() while
  holding the mutex.
- Define a uvc_ctrl_mapping_is_compound() for readability.

 drivers/media/usb/uvc/uvc_ctrl.c | 48 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..8d8333786333 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -884,6 +884,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	}
 }
 
+static bool
+uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
+{
+	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
+}
+
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
@@ -1880,6 +1886,48 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 }
 
+static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
+				       struct uvc_control *ctrl,
+				       struct uvc_control_mapping *mapping,
+				       struct v4l2_ext_control *xctrl)
+{
+	struct v4l2_queryctrl qc = { .id = xctrl->id };
+
+	int ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &qc);
+
+	if (ret < 0)
+		return ret;
+
+	xctrl->value = qc.default_value;
+	return 0;
+}
+
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl)
+{
+	struct uvc_control *ctrl;
+	struct uvc_control_mapping *mapping;
+	int ret;
+
+	if (mutex_lock_interruptible(&chain->ctrl_mutex))
+		return -ERESTARTSYS;
+
+	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
+	if (!ctrl) {
+		ret = -EINVAL;
+		goto done;
+	}
+
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		ret = -EINVAL;
+	else
+		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
+
+done:
+	mutex_unlock(&chain->ctrl_mutex);
+	return ret;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle,
 	struct v4l2_ext_control *xctrl)
 {
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4988f03640a..5a88847bfbfe 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1096,15 +1096,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
+			ret = uvc_ctrl_get_boundary(chain, ctrl);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
 			}
-
-			ctrl->value = qc.default_value;
 		}
 
 		return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..5091085fcfb0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -781,6 +781,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,
-- 
2.42.0.609.gbb76f46606-goog

