Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB9C3422F4
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCSRJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhCSRJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:22 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1716C06175F
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w18so11679670edc.0
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OM70Sjufw9liS/WZuFn+FLp3ilPmUVIY/XUIceYCgdU=;
        b=CBpA/lDGZ3VzTelGK7YlkXFJLs+F8HRMCbYAYlWGeC6PAI74vtSwTPVHNhyxJ3KS6w
         Kvq6M5oJ8XgGMaKAPh+oEBfTiEiWT1OjCCjPPWuyJcEr9XtMk3c8hyEgGccV32bZ6Vho
         /7LQOU1I7X4N2tm/Thy4MS0HaZAQ/UDBTLUJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OM70Sjufw9liS/WZuFn+FLp3ilPmUVIY/XUIceYCgdU=;
        b=L8ziuSzbNVxpzwBZB9jufcK3XMvq3gNLGE5JTrcOLtgtgePGAeg/PogaPa1TP1tJbQ
         t7hMGcmN/Mnup7p1UVCcUgG6ySvtnj/NWbIcB9yoP0TWyz+bvlpfCYOsoJcb5iFwNeh7
         GOvbstUjI5px32GwnBTsViFxJ81rs9t4y27R7Ju7nMhb0ey9m4j2ZFS2MeurfPOJYvON
         IOvTsBbe0e0XA17Lk9b6e7U0PYvb6JXsHVxtU4O2QDidNIsATBYEoActWVYdck690xCC
         2tRCwWVcqDO3E/iMuyuzQSzpd7grs5VaQNqGolSc0B0oHkikUxncM0BNaVJJckYa0wLV
         7Cig==
X-Gm-Message-State: AOAM532QJ00m3IiP6YiXu/uMMl6/EjL7HOjGhyEluOwPKQSPZbga+prA
        HyAtpG60fgv13dbdPd+cgV/vYQ==
X-Google-Smtp-Source: ABdhPJwRVMxgrrCcm8GLRDNxovDHO4U4hn0Y3Jp6+6plwIZwnmnSYRyP3qtxqoV+AHXKnnbUlPoefw==
X-Received: by 2002:aa7:d917:: with SMTP id a23mr10799328edr.122.1616173760494;
        Fri, 19 Mar 2021 10:09:20 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:09:20 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 15/19] media: uvcvideo: Set error_idx during ctrl_commit errors
Date:   Fri, 19 Mar 2021 18:09:02 +0100
Message-Id: <20210319170906.278238-16-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we have an error setting a control, return the affected control in
the error_idx field.

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
2.31.0.rc2.261.g7f71774620-goog

