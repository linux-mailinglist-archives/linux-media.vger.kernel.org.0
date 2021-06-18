Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4ABF3ACAE6
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhFRMb7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbhFRMbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:47 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC482C0611C6
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id hv20so9652278ejc.12
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xDgq8nEFZavSr40ZFmbfaZmrCQlQUnKjjplzQ5QoV9A=;
        b=VycKk0Mw7L0RujaAE8nApzCufHYWdQ0zEEvugRd91eKsmD3ddE8UoxKVnnVyr3DL0Z
         OYGGnCRcAJQc9DOEYcZmvi9prnnNQ3/YYVeNV0REWLyalNQ8Mzgejje8oNkKJtX8bwmv
         D/YpIoZ808v9JQRdpHdPL7FtCcSbLcIhBeevI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xDgq8nEFZavSr40ZFmbfaZmrCQlQUnKjjplzQ5QoV9A=;
        b=FKb57qAYsOLX8GMPpixCcb4LMqtk6LlHeiNX5jmuSlyqb1K65/Mx1rgDT5giJWOpch
         L2Aaxs48NlPDXrgqKnoiJz00f5Oh+yuEoPpc2nph/LZjmRCjSHnow7qURb76W1AFbQ6w
         0I0+oZDJsb3F1M2/ANOJjPk/XqT+JY1+f67cmuYqhlH+4CyqPHOwZqYBnW9KUJP+WTr7
         9QZL49gqCINh5xYfYeV91hDfznZgpuCMnOQgLqPnVesBpwaoqNAuT5AfMdDkQyvNjccP
         2Tsg9Vgq02nNwAEOebQuTcNUM2QzFFr3jBoX6jhVpgZRCU5wCucoQgMj/6uFcDnTTCtr
         FxYg==
X-Gm-Message-State: AOAM530kDtims53ORShlrh9G7BkKPLEXL7Gcp5izcPERSuMqTMyjuBtA
        LChW49EldAvLDbJ2tvbP+MfYGw==
X-Google-Smtp-Source: ABdhPJxzpS09SLAqQWAQLx6CTYXXpxgclhmaWTBLgBqf7Prd35DVF41l0sP4l/dBz2pOQIhTDJS6UA==
X-Received: by 2002:a17:906:5d14:: with SMTP id g20mr10548832ejt.243.1624019375614;
        Fri, 18 Jun 2021 05:29:35 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:35 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 15/21] media: uvcvideo: Set error_idx during ctrl_commit errors
Date:   Fri, 18 Jun 2021 14:29:17 +0200
Message-Id: <20210618122923.385938-16-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we have an error setting a control, return the affected control in
the error_idx field.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 42 ++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvc_v4l2.c |  2 +-
 drivers/media/usb/uvc/uvcvideo.h | 10 +++-----
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 18c315b52ef5..dd6ebcc7344a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1582,7 +1582,7 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
 }
 
 static int uvc_ctrl_commit_entity(struct uvc_device *dev,
-	struct uvc_entity *entity, int rollback)
+	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
 {
 	struct uvc_control *ctrl;
 	unsigned int i;
@@ -1624,31 +1624,59 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
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
 
+static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
+				  struct v4l2_ext_controls *ctrls,
+				  struct uvc_control *uvc_control)
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
+		ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
+							  err_ctrl);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
@@ -2106,7 +2134,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
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
index 4aa78591d9b0..2e5366143b81 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -886,17 +886,15 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 
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
2.32.0.288.g62a8d224e6-goog

