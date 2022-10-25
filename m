Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF3460C38D
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 07:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiJYF43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 01:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiJYF42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 01:56:28 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28349B6033
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:56:26 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id p18-20020a63e652000000b0046b27534651so5792576pgj.17
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5iOvP3Gdr4MKRN77xIkxqpXJxhJX3EY4/F/SDqLgNw=;
        b=QGL225yysyjEb4q/sPfZJh4kZwmaQ0MiBvQ3i7hORvveajZXZaEl61gU7b/KxxqYmQ
         XsmC/IL/LQWouIIkxrB6yzI7JiSxWBgVINL3UQxnq8livLFq3mP38EdmJgAn2Vg7Rr5q
         KsHu41nZdJwQweKxr7m3NYAiy+R15PLRWUItUM3k/crMwhQxLXTxa1tGcSlAZ0clOoml
         RwIDNoNGk1M78s/vdBrzUizCMf4AVpDpWJsumAPZtUiGy77fQrsZoXhOBN4SfsRFD1qd
         ny/ldDZCNt4S7lyaFiIA4poy2Oq1uWSo73/YemFMqXYcLdPkbuTSAx370OgfPFVK+vP0
         w7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5iOvP3Gdr4MKRN77xIkxqpXJxhJX3EY4/F/SDqLgNw=;
        b=02J0ZA7RDn7aKAOP+N32DXw42KZum60f5O3urGJqFUF7EV+g0eMugkbGShP8Zc8ua/
         Df+si2eqDmujNLGRD0dx1fsZwE/bGFV4osy9UIsnyLPRKe7l2k5n+KOKTgwdVM3hhHax
         hzV1qzuvNrqI3OaM35SJ0aNl0UkXC9dd7ebwd6WSf0eIWLLJokBNtkoPYMQJbMokUMMM
         GALVm/jYrE+YjZbJflPD/BTR7gU3iUxkGUjHUu+q6iKpnbUlvUYSYh8379iuf0kX5WCu
         EA2DZYMqEQRbhpHwmapCxhbls6x1JxVBP+bYnx2/BavxYawh68TgxyFB9yNi9tvbDGOT
         848A==
X-Gm-Message-State: ACrzQf0zsKDLhzsaI1xAnetnKQGor19DhrZpUQ3V8zEiSr0KVMj/glc6
        exPZunccs5NEDI/dtOzcw+T4iK2O9QE=
X-Google-Smtp-Source: AMsMyM6U7X94WgoVfyI7AHm50K3nGsLTpvo/vSLHrYwo4SiWvU6LX6XQ+izoFSy4ha6Zfao/fh4+HtlI4Ko=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7ee8:fa64:12b0:14f3])
 (user=yunkec job=sendgmr) by 2002:a17:90b:1c8c:b0:203:89fb:ba79 with SMTP id
 oo12-20020a17090b1c8c00b0020389fbba79mr78451125pjb.92.1666677385731; Mon, 24
 Oct 2022 22:56:25 -0700 (PDT)
Date:   Tue, 25 Oct 2022 14:55:27 +0900
In-Reply-To: <20221025055528.1117251-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221025055528.1117251-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025055528.1117251-11-yunkec@google.com>
Subject: [PATCH v9 10/11] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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
Changelog since v8:
- No change.
Changelog since v7:
- Address some comments.

 drivers/media/usb/uvc/uvc_ctrl.c | 45 +++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c | 11 ++++++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 33199de7f1be..0713685f8005 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1975,6 +1975,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
 				struct uvc_control *ctrl,
 				struct uvc_control_mapping *mapping,
+				u32 v4l2_which,
 				struct v4l2_ext_control *xctrl)
 {
 	struct v4l2_queryctrl qc = { .id = xctrl->id };
@@ -1984,19 +1985,47 @@ int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
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
@@ -2004,11 +2033,11 @@ static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
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
@@ -2025,9 +2054,11 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
 
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
index 52a7dc9ad4b9..08060145700a 100644
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
index c7d20333ca8a..5c3b4ce85615 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -778,7 +778,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
-			  struct v4l2_ext_control *xctrl);
+			  struct v4l2_ext_control *xctrl,
+			  u32 v4l2_which);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.38.0.135.g90850a2211-goog

