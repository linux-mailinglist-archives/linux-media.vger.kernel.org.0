Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C171340F32
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbhCRUaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233142AbhCRU3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:41 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A9AC06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:40 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id dm8so8315136edb.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8CKdrth8mRDC9pDxpXA+hLpF4yULvT31xqYAexdXjvs=;
        b=AjjUA+hfuM0uGGWKl2mTPlMogYfToFJzStRurvlHE+K5a8Gveqm1UxhgLOXEn1Pe7W
         bpKbTZoBk03ApjXoOkb1RGQTmRpDrv22A1PhEm6MZpIeJ8oGINQGtdkbkXSrtpWG/Tml
         9l18oyITxAW5WzdrEhnOKw8+0HSEUyQ3sG5NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8CKdrth8mRDC9pDxpXA+hLpF4yULvT31xqYAexdXjvs=;
        b=rb5z+eos871KqfN6xLXzVxtTXXq+PGL2tUoBEkmKAoxoVykhiKhyZTP4UNN9Fhq+Yb
         wLRP2bUAUvZKrh5MEwlUSY2pk7+MZDZ/Lm/sa0NdlGSp+m9nA46Lwttm4I/wi/1IhV1M
         ySrME/IZYgu8PLgB92P/bzV08cHdY786hXNDTStWk+hy3WGI9YxB1pDPdZUSkl1vXAgl
         sN2spTQNLwRHU6YsdrJx4/E6RqjTZW8YuFSZleS3eoqYAsXi4y4enhDOzJY84lf0i0l5
         pbljjHbT4k7J4IYo8bB/ibJ0/BNpDAwfqKe2SDOH38LtAoQ7kUzVtKKFaaQufX2z+obN
         6D8A==
X-Gm-Message-State: AOAM530A+nrNlYG47t5aKKRRCmw2hAFeYsKoukLkD6QSejK//nLG7Fa6
        WFg1+GcIg5UXbb+S/JdXCWOfUQ==
X-Google-Smtp-Source: ABdhPJyJuJ10ex3GPTj+6IzHYS+8JMcTSsVcYm1zbm7bYmvTCvUb4H1tLyVpnSC7d4zPJ2PiuUs+2g==
X-Received: by 2002:a50:eb97:: with SMTP id y23mr5922998edr.170.1616099379689;
        Thu, 18 Mar 2021 13:29:39 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:39 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 15/17] media: uvcvideo: Refactor __uvc_ctrl_commit
Date:   Thu, 18 Mar 2021 21:29:26 +0100
Message-Id: <20210318202928.166955-16-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Take a v4l2_ext_controls instead of an array of controls, this way we
can access the error_idx in future changes.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c |  5 ++---
 drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++++--
 drivers/media/usb/uvc/uvcvideo.h | 10 ++++------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 1ec8333811bc..fb8155ca0c0d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1664,8 +1664,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 }
 
 int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
-		      const struct v4l2_ext_control *xctrls,
-		      unsigned int xctrls_count)
+		      struct v4l2_ext_controls *ctrls)
 {
 	struct uvc_video_chain *chain = handle->chain;
 	struct uvc_entity *entity;
@@ -1679,7 +1678,7 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	}
 
 	if (!rollback)
-		uvc_ctrl_send_events(handle, xctrls, xctrls_count);
+		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index ddebdeb5a81b..ea2c41b04664 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1025,6 +1025,10 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
 	struct uvc_fh *handle = fh;
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control xctrl;
+	struct v4l2_ext_controls ctrls = {
+		.count = 1,
+		.controls = &xctrl,
+	};
 	int ret;
 
 	ret = uvc_ctrl_is_accessible(chain, ctrl->id, VIDIOC_S_CTRL);
@@ -1045,7 +1049,7 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
 		return ret;
 	}
 
-	ret = uvc_ctrl_commit(handle, &xctrl, 1);
+	ret = uvc_ctrl_commit(handle, &ctrls);
 	if (ret < 0)
 		return ret;
 
@@ -1149,7 +1153,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	ctrls->error_idx = 0;
 
 	if (ioctl == VIDIOC_S_EXT_CTRLS)
-		return uvc_ctrl_commit(handle, ctrls->controls, ctrls->count);
+		return uvc_ctrl_commit(handle, ctrls);
 	else
 		return uvc_ctrl_rollback(handle);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a93aeedb5499..4e7b6da3c6d2 100644
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

