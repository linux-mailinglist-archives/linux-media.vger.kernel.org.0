Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C433ACAEB
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbhFRMcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234345AbhFRMbs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:48 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05C2C061767
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:37 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id nb6so15543166ejc.10
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRkVNxSUT31opO2lzmr50jl4O9GzQj2v5zG83PceH74=;
        b=HNvkRtkPaXH0nPX9zTnIDTQ+8D2VoT+8HutUK3qBEhjtpYxuyX/1uPFFQFcqHp9tio
         XPz1ZAOQv8JnmVy7XmeIC1AeXRK/LeEDD64S9T/HhtieY/F7Rcn6VBaWdFICZRDUMK3y
         EbrXp2b5dUBD3Wu89C8m5LyaZzZVj5rn8BtyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRkVNxSUT31opO2lzmr50jl4O9GzQj2v5zG83PceH74=;
        b=CGMD9s9/o9Ot3KGIPCgqPJvRTXQECXuDOM2RljWK2NLFzNpB01kD2Evlg++oGTSpvo
         MADDaMrKEPGMwzgDTSqshbqv0q9gJrnCvGQqzPKdbY0Gi6gniufwiXPQky9jul7cHMwE
         j0uhy9nx+rHqI8XNNKiUlcOdusK7z4auQ2+bIbv2DIY7rBIq7VPm4dJRLhvs+gBFP5Fw
         cD3EDcnYTgBuU9C6aTCDqwhthdEn5A2hIzstiuEUlu3wG6o2kbu0jndmjg4GiaqQtjyu
         sDZwMLyQTR1tN5T5g8wNAZ5gdNEXFIwLV0RcFLy5DJmJsFR+1smGYQGmmwjytclK3Pxc
         el7Q==
X-Gm-Message-State: AOAM530QAiFcO0TxolMRj41671BQD9/BqALKVC2XhDQfGn5W9ECX8pDP
        Mtb9GoGYKdycXekoOkMeDXNR2JuCQYkUBQ==
X-Google-Smtp-Source: ABdhPJxSCL+qECCGeQvsDFz8aANq7F+lxjPaHUbnt8JDkMzTb6nUXSiOAel5vj9kzuZjYL3tl/vthQ==
X-Received: by 2002:a17:906:78c:: with SMTP id l12mr17659ejc.335.1624019376251;
        Fri, 18 Jun 2021 05:29:36 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:36 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v10 17/21] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
Date:   Fri, 18 Jun 2021 14:29:19 +0200
Message-Id: <20210618122923.385938-18-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

Check for inactive controls in uvc_ctrl_is_accessible().
Use the new value for the master_id controls if present,
otherwise use the existing value to determine if it is OK
to set the control. Doing this here avoids attempting to
set an inactive control, which will return an error from the
USB device.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index dd6ebcc7344a..11c25d4b5c20 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1043,10 +1043,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 }
 
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read)
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl)
 {
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
+	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
+	bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
+	s32 val;
+	int ret;
+	int i;
 
 	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
 		return -EACCES;
@@ -1061,6 +1069,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
 		return -EACCES;
 
+	if (read || try || !mapping->master_id)
+		return 0;
+
+	for (i = ctrls->count - 1; i >= 0; i--)
+		if (ctrls->controls[i].id == mapping->master_id)
+			return ctrls->controls[i].value ==
+					mapping->master_manual ? 0 : -EACCES;
+
+	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
+			   &master_ctrl, 0);
+
+	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		return 0;
+
+	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	if (ret >= 0 && val != mapping->master_manual)
+		return -EACCES;
+
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 8d8b12a4db34..0f4d893eff46 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1000,8 +1000,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 	int ret = 0;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_is_accessible(chain, ctrl->id,
-					    ioctl == VIDIOC_G_EXT_CTRLS);
+		ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
+					    ioctl);
 		if (ret)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 2e5366143b81..fd4f5ef47dfb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -900,7 +900,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
-			   bool read);
+			   const struct v4l2_ext_controls *ctrls,
+			   unsigned long ioctl);
 
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
-- 
2.32.0.288.g62a8d224e6-goog

