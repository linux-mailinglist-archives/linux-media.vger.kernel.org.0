Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923ED34A528
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCZJ7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbhCZJ65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC67DC0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id dm8so5646103edb.2
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zSZ2EkdJHOx24SFCkJIOCXa07CbkvnRSZh4lLvRcYLY=;
        b=ScXucLqVwqH9fks5pCW0qnVCPzgyW9j7Sxpq/MCIMyOChDgp6rPMgSRrkA1gS18YRn
         cPbUG+JpHx4kZ8TXxEAu+ASBdqHr0nfWvaYL5iar88FoSCVJv2xLwkhGxVVUS84rCwKl
         mt08Xbtxvrzt7IWFSV+SYIw3462pnBxnFHg2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSZ2EkdJHOx24SFCkJIOCXa07CbkvnRSZh4lLvRcYLY=;
        b=IeAg1OQYCgvAU1bepPiKMns+Nyzzhc8gxg2+bFvP9sK/vuqtKc5qJLw/Ie1h1Q3RRA
         3PBtDUTWPToeOVKG0YbkXTJyP88iYpRk2XDItYzlc1XW7u12c+Ep1SiNgXqx7fYKppcc
         Rhl7O+FP4z3nYHXJqri/p3NwldeUyJtG4BUvWrUeWoApkAXEH9nwSQM2olmWavbtYYUK
         mvI7ebWZpytpZ31dQphNUYx1ri2MeaqQhvvyZMf4XCMtZiU71GBGvUr+dICz8SkIQTQF
         mooS3nDSftwBrkEsxrq7ry+KN0ZpR2kks8o6qIBit34WGh8MogbaQZNMjtfIZP0D+aPA
         /AMQ==
X-Gm-Message-State: AOAM530Pc95LlLN9z+HqWz/ElszBdoyOkEou7YoWKEOxNOOSoGKJqrvx
        ghcZZDdBrLqQ7P99lfteYQk4Pw==
X-Google-Smtp-Source: ABdhPJzvwlhCTnCgWYNFzaiwu6HLMPX8onZCZwvZapgxXLffLK9dzMdv5yLYAE1SF5kZJoHA3PW2GA==
X-Received: by 2002:aa7:d642:: with SMTP id v2mr14089314edr.257.1616752735626;
        Fri, 26 Mar 2021 02:58:55 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:54 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 16/22] media: uvcvideo: Return -EACCES to inactive controls
Date:   Fri, 26 Mar 2021 10:58:34 +0100
Message-Id: <20210326095840.364424-17-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a control is inactive return -EACCES to let the userspace know that
the value will not be applied automatically when the control is active
again.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 71 +++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index bcebf9d1a46f..d9d4add1e813 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1082,13 +1082,36 @@ static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
 	return "Unknown Control";
 }
 
+static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
+				 struct uvc_control *ctrl,
+				 struct uvc_control_mapping *mapping)
+{
+	struct uvc_control_mapping *master_map = NULL;
+	struct uvc_control *master_ctrl = NULL;
+	s32 val;
+	int ret;
+
+	if (!mapping->master_id)
+		return false;
+
+	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
+			   &master_ctrl, 0);
+
+	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+		return false;
+
+	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+	if (ret < 0 || val == mapping->master_manual)
+		return false;
+
+	return true;
+}
+
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl,
 	struct uvc_control_mapping *mapping,
 	struct v4l2_queryctrl *v4l2_ctrl)
 {
-	struct uvc_control_mapping *master_map = NULL;
-	struct uvc_control *master_ctrl = NULL;
 	const struct uvc_menu_info *menu;
 	unsigned int i;
 
@@ -1104,18 +1127,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	if (mapping->master_id)
-		__uvc_find_control(ctrl->entity, mapping->master_id,
-				   &master_map, &master_ctrl, 0);
-	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
-
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
-	}
+	if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
@@ -1638,25 +1651,37 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 	return 0;
 }
 
-static int uvc_ctrl_find_ctrlidx(struct uvc_entity *entity,
+static int uvc_ctrl_commit_error(struct uvc_video_chain *chain,
+				 struct uvc_entity *entity,
 				 struct v4l2_ext_controls *ctrls,
-				 struct uvc_control *uvc_control)
+				 struct uvc_control *err_control,
+				 int ret)
 {
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl_found;
 	unsigned int i;
 
-	if (!entity)
-		return ctrls->count;
+	if (!entity) {
+		ctrls->error_idx = ctrls->count;
+		return ret;
+	}
 
 	for (i = 0; i < ctrls->count; i++) {
 		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
 				   &ctrl_found, 0);
-		if (uvc_control == ctrl_found)
-			return i;
+		if (err_control == ctrl_found)
+			break;
 	}
+	ctrls->error_idx = i;
+
+	/* We could not find the control that failed. */
+	if (i == ctrls->count)
+		return ret;
 
-	return ctrls->count;
+	if (uvc_ctrl_is_inactive(chain, err_control, mapping))
+		return -EACCES;
+
+	return ret;
 }
 
 int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
@@ -1679,8 +1704,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
 	if (ret < 0 && ctrls)
-		ctrls->error_idx = uvc_ctrl_find_ctrlidx(entity, ctrls,
-							 err_ctrl);
+		ret = uvc_ctrl_commit_error(chain, entity, ctrls, err_ctrl,
+					    ret);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
-- 
2.31.0.291.g576ba9dcdaf-goog

