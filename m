Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0939C5F04FD
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiI3Glw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiI3Glu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:50 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA991449D8
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:49 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-34d3fbc7cfcso34175017b3.7
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=YJBJlFLuymf/h3g4PV9rAfEBJIoig2LLkac8fqZaDbo=;
        b=kt4P+uF+P14y7DyxqmJpVtMF2vLzOKIlv/qqWPfzne7VC6vdtNyBc7gY87deSyTq3v
         K6YpvQNjM1rxCuWQZAl+sRVzk/QH5kziKbme1YdcdGJJk0qT0a1uJ9UNyOje8Rm3UKpz
         8kqfTtOqIjiuYbS7q8dBcFAknZ3O4B9SHji9lRVeQzsYnsl1Tq6duLy2ldUhGkaXuJs4
         DfLfqe+LLWWPQLtpD4bNgZuoV/nIQy6xvPBxfWCaVzxuuuv+U7KuctKd5s/1WKuGPB2S
         L3rW31QPwBgb4P2y83QYY+hr9wjKY2Uo15kdUpDWKSW7CuAbG3NunsJAsfLl1nwLVefJ
         Irxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=YJBJlFLuymf/h3g4PV9rAfEBJIoig2LLkac8fqZaDbo=;
        b=4nu6bUsxZ/rWEIkGeI0fogxVYttOg8higMqC02OK7MJciOYGkEnVXyNk6j0QTw35n+
         yzIOroEPpn0U86bfSNPGPDedLbM+Lqq1rdCcYA7VlpjaoVMJvwYZ7POHgL9SIeJvAsCg
         UmjWJozfOz/UNITTMZvkSIDHMGpI56xrJ3VCmFxB7pq3GQEGxeou98idqcSjoHCpXMJy
         9eGUw9axQm5qzrom4BTihoDqhfRbW7T+u1H3S9Qg384inrDy/Zj0NrXrW/2BEm1nbYIM
         jj826OzC/ShmpxcAnzSs6f9+lNrE2A5+viw6wM7qjV1q2aq0Yk6qbOWiXOURGMy/6lik
         lKZg==
X-Gm-Message-State: ACrzQf1Y3Nj0xZLsK2J+7mmIWyOdU955HeLuo5xRCHWYnj6bEyI9OGvy
        3m/mYDSRnx71oks2iyAxDkUqpviaFTg=
X-Google-Smtp-Source: AMsMyM4yMEcNZMc8xZf7puxQ1wceN3ZcAOfJ8r82q1Di4Z6ixbJswJqKvD4rFLX8TEtrw/wNYj9HLSvEC7Y=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a81:79d5:0:b0:353:42aa:8d70 with SMTP id
 u204-20020a8179d5000000b0035342aa8d70mr7203863ywc.406.1664520109204; Thu, 29
 Sep 2022 23:41:49 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:58 +0900
In-Reply-To: <20220930064059.3633710-1-yunkec@google.com>
Mime-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-10-yunkec@google.com>
Subject: [PATCH v8 09/10] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changelog since v7:
- Address some comments.

 drivers/media/usb/uvc/uvc_ctrl.c | 45 +++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c | 11 ++++++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5644ce97f03a..9475fcc8ecd9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1974,6 +1974,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 				struct uvc_control *ctrl,
 				struct uvc_control_mapping *mapping,
+				u32 v4l2_which,
 				struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
@@ -1983,19 +1984,47 @@ int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
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
 
-	if (!uvc_ctrl_mapping_is_compound(mapping))
-		return -EINVAL;
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
 
 	if (!ctrl->cached) {
 		ret = uvc_ctrl_populate_cache(chain, ctrl);
@@ -2003,11 +2032,11 @@ static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
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
@@ -2024,9 +2053,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
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
index c2e2c765bad1..fca6aebc6d28 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1047,9 +1047,12 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
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
@@ -1057,6 +1060,10 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 		}
 
 		return 0;
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	ret = uvc_ctrl_begin(chain);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6e9d79e9e1ad..77693694bde3 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -922,7 +922,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl);
+			  struct v4l2_ext_control *xctrl,
+			  u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.38.0.rc1.362.ged0d419d3c-goog

