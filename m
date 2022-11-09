Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FC6223AF
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiKIGGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiKIGGj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:06:39 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5441F2D7
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:06:38 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id c7-20020a170903234700b0018729febd96so12762815plh.19
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjlzPaYhLf4MiOOXqEvzydMZbQIyq6ptVR4ZxU08oOY=;
        b=oBZp3lWz4oxy24NtcVtSZJj4fNhJtjlbG7/qeQUSkLxaM1i/kg/2Qld8hzzbZwHdYo
         2aS7F7sunTbXlvPGeYS5aMBtlgwTTgTsZD6Dm2frAVoogSOfjub5Laxk137oHBqtaQqQ
         WBq0HUTe6GgZSfqIEUw+J2rl5sVtJIO0neWcD0a2qYGlfDu3SiXV3WJDK1PjHEulTziE
         y4Fm8ss7IEDa0H029cGU3DW/AX7wWxPSQeusgbpm5xkkN+DYE4IiJ+uYdE+K+dZVKgYt
         6B8ehlEXppZU0VgsnYxiFOB/Aez0v/If9qajfOIbXaqu68uH1u53SnTr1brfsC3Kh943
         5uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjlzPaYhLf4MiOOXqEvzydMZbQIyq6ptVR4ZxU08oOY=;
        b=Q1mrkdqYcjaJvvSYAWcCHvEbNOHFPCaKZauabZ+xnvsdY41h1WVrPMpiAFSWO8I1DJ
         5lEoCV8isy46GeJoqSv04z5+TSj+7YaSI5jmv3lLv2DcJAceaPt49Y5Zr/cCaP/rK1Ap
         f1e4jFKW+V9hv1kczHnfcH7/D9RQ3lE3MPQn2irLnqq1HdqJZ/Z5HW+edUPuRitmNl2r
         kdpGrUagRshHhGMLIq6hVjnXNi3PcmGZroOs5IMciT5I23O0UnRmq5DnU7wQnYN5keGb
         kcPyg+oM9RnZMEAbingASlzte0PRIm3AfU0uteMmy4U/q8yvewfDkOHE7St+TpgzTxLJ
         Mq7w==
X-Gm-Message-State: ACrzQf3uVOjENwgCrHrliUWKRv030nl1jSR1gY/Cn4R2eR0kq/zI2seh
        xCDuvTuJ+OEmb6YioS/zNudJrri29bM=
X-Google-Smtp-Source: AMsMyM5FEeYB0+LzSvIXUJyQWKwwUkjjlUetBHpCEQNV+TxObtijSrdeyRvMPSIrHBFDXfipRIDISnNsUm4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:aa7:942d:0:b0:56c:6e8c:6ff6 with SMTP id
 y13-20020aa7942d000000b0056c6e8c6ff6mr59604769pfo.67.1667973998161; Tue, 08
 Nov 2022 22:06:38 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:12 +0900
In-Reply-To: <20221109060621.704531-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-3-yunkec@google.com>
Subject: [PATCH v10 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
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
Signed-off-by: Yunke Cao <yunkec@google.com>
---
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

 drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  6 +---
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c95a2229f4fa..dfb9d1daece6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -837,6 +837,12 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
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
@@ -1743,6 +1749,49 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 }
 
+static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
+				       struct uvc_control *ctrl,
+				       struct uvc_control_mapping *mapping,
+				       u32 v4l2_which,
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
index f4d4c33b6dfb..e807e348aa41 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1046,15 +1046,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
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
index df93db259312..b2ee3d59a4c8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -759,6 +759,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
+			  struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.38.1.431.g37b22c650d-goog

