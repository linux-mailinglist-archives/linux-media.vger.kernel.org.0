Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462E834A527
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhCZJ7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCZJ64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:56 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92C2C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:55 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id bx7so5586024edb.12
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbGSHzgBOA+TWrNxbZ+DwhlrbLAE2vitiIte0uj+CJo=;
        b=SxtI6JYCIQaFo9YPDAkl6+qkbcRx2kNasDiqaZ0nUsMGRI9nT3ROfD5BgEkh99Gj0g
         oQAKhRFo7ZwXTF6H5EqtTeHtj+velcQz7tbDECPUG+y6izO9nwYUMGu7Op6Mt1iLx/3V
         pwpG5TNfBmFszRCSVn1CHthk6bBQvaLa5PCJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbGSHzgBOA+TWrNxbZ+DwhlrbLAE2vitiIte0uj+CJo=;
        b=jMdtPW9e4JeleRdVqXgqQuzyWs/sp1RticDJ1lakHPVOFPWORIII6pG2OO5rdiYOCs
         xW0PMDx0D6T/yQR5YArBBHu8inYEedxG6j+yYzxFbHLWdKtPx2m0/vhxtGzOa2koXLrg
         2RCyFzVycI4gC+fdRFB4p8kjsDnL/Nn5tD6F5vW8PLnM2GN7nURS759lQFRoEaNoQ7Ka
         PLc8gfkXLYOqXBJv3OQH3Kvc/iM/fQZrIokLeDx6y8L3qnsNyvZCdhwnSaxNYRwAXfo9
         KpwsmAsTh7QVy3McEZQXWmMOTjAYGETbxDWmSyB2dOhKxEFrQ+45EenHkaZ8mG5xZmlW
         ljSw==
X-Gm-Message-State: AOAM530t/3Lt9lRZC0fxky4IxicRD8A4hx/YVEJhBhpZsUIWAecVv6w6
        PKjD+3TL9+on0AKMKRZ6AMz2HA==
X-Google-Smtp-Source: ABdhPJyb9exjob5Y9wOqzFcbMRGw4RFJ3kQ/JP1VdqHDyZHHi1+bsv+iqT3rTykHR4GwzDckzJ87wQ==
X-Received: by 2002:a05:6402:4241:: with SMTP id g1mr14137500edb.331.1616752734606;
        Fri, 26 Mar 2021 02:58:54 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.53
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
Subject: [PATCH v9 15/22] media: uvcvideo: Set error_idx during ctrl_commit errors
Date:   Fri, 26 Mar 2021 10:58:33 +0100
Message-Id: <20210326095840.364424-16-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we have an error setting a control, return the affected control in
the error_idx field.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 42 ++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvc_v4l2.c |  2 +-
 drivers/media/usb/uvc/uvcvideo.h | 10 +++-----
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 24fd5afc4e4f..bcebf9d1a46f 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1586,7 +1586,7 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
 }
 
 static int uvc_ctrl_commit_entity(struct uvc_device *dev,
-	struct uvc_entity *entity, int rollback)
+	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
 {
 	struct uvc_control *ctrl;
 	unsigned int i;
@@ -1628,31 +1628,59 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		ctrl->dirty = 0;
 
-		if (ret < 0)
+		if (ret < 0) {
+			if (err_ctrl)
+				*err_ctrl = ctrl;
 			return ret;
+		}
 	}
 
 	return 0;
 }
 
+static int uvc_ctrl_find_ctrlidx(struct uvc_entity *entity,
+				 struct v4l2_ext_controls *ctrls,
+				 struct uvc_control *uvc_control)
+{
+	struct uvc_control_mapping *mapping;
+	struct uvc_control *ctrl_found;
+	unsigned int i;
+
+	if (!entity)
+		return ctrls->count;
+
+	for (i = 0; i < ctrls->count; i++) {
+		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
+				   &ctrl_found, 0);
+		if (uvc_control == ctrl_found)
+			return i;
+	}
+
+	return ctrls->count;
+}
+
 int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
-		      const struct v4l2_ext_control *xctrls,
-		      unsigned int xctrls_count)
+		      struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_video_chain *chain = handle->chain;
+	struct uvc_control *err_ctrl;
 	struct uvc_entity *entity;
 	int ret = 0;
 
 	/* Find the control. */
 	list_for_each_entry(entity, &chain->entities, chain) {
-		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback);
+		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
+					     &err_ctrl);
 		if (ret < 0)
 			goto done;
 	}
 
 	if (!rollback)
-		uvc_ctrl_send_events(handle, xctrls, xctrls_count);
+		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
+	if (ret < 0 && ctrls)
+		ctrls->error_idx = uvc_ctrl_find_ctrlidx(entity, ctrls,
+							 err_ctrl);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
@@ -2110,7 +2138,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			ctrl->dirty = 1;
 		}
 
-		ret = uvc_ctrl_commit_entity(dev, entity, 0);
+		ret = uvc_ctrl_commit_entity(dev, entity, 0, NULL);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index a3ee1dc003fc..8d8b12a4db34 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1088,7 +1088,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	ctrls->error_idx = 0;
 
 	if (ioctl == VIDIOC_S_EXT_CTRLS)
-		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
+		return uvc_ctrl_commit(handle, ctrls);
 	else
 		return uvc_ctrl_rollback(handle);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9471c342a310..0313b30f0cea 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -887,17 +887,15 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 
 int uvc_ctrl_begin(struct uvc_video_chain *chain);
 int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
-		      const struct v4l2_ext_control *xctrls,
-		      unsigned int xctrls_count);
+		      struct v4l2_ext_controls *ctrls);
 static inline int uvc_ctrl_commit(struct uvc_fh *handle,
-				  const struct v4l2_ext_control *xctrls,
-				  unsigned int xctrls_count)
+				  struct v4l2_ext_controls *ctrls)
 {
-	return __uvc_ctrl_commit(handle, 0, xctrls, xctrls_count);
+	return __uvc_ctrl_commit(handle, 0, ctrls);
 }
 static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 {
-	return __uvc_ctrl_commit(handle, 1, NULL, 0);
+	return __uvc_ctrl_commit(handle, 1, NULL);
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
-- 
2.31.0.291.g576ba9dcdaf-goog

