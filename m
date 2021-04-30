Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C1B36FE06
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhD3PsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhD3PsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:48:16 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B043C06138C;
        Fri, 30 Apr 2021 08:47:28 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id d10so11302104pgf.12;
        Fri, 30 Apr 2021 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IDmD6UL5zzFu8Hty4nIsR290r6jC597Ze/W65NxX2v0=;
        b=T0L7Iqq4nM7ma40iDk+H+cSXnrC/Q0RorLQFIzQEiUGmtT3yrJXLuh39GKquLOtMkB
         oCEUHLhxvSDjqffG9St/BlEH6oOWWK0s23M4dU3nlw1UlFZNPO3jXV/0FgW1v3mUJvja
         rh18i9DuKRGSL1P2VYmWp1wlfYAGLK0jIed03eTxvnm2wNU9BvmqrwnsUKiY/06D7xD4
         9d6flT5XbZ/b1JGBSz523JFnd+P3xWXu41spjyXjfgH+UQLtv3twZpv3F10gFPYnSFGm
         szmy3zW1OHqIf4vumwKCDsGEn4HARVrkRCX8151CK3DCAvyn0WOKslBK00aL+RD4NU6x
         Jw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IDmD6UL5zzFu8Hty4nIsR290r6jC597Ze/W65NxX2v0=;
        b=Dlr81SIeBGSV6p1wm88v14Hud171X1klTl+GGxSzj+XMZHhm8argwqAy3omz2XfvdP
         2ZQ62Jxb+1vzhcpbvD0H7hZPUxDfU3fU5aQwmMUHymcoQQ1wQ6xhw7vRtx6Dyp7tpzRl
         YwJET7O8qxPio190+zkh+KqLFqJQqahwJnHS3xZgtgjVvJE3noKDVf8pm6DS/QJgCoqc
         YZkTZ0tLfyyng8PrmSw/ahaJlxB79GfC4++Sez0jMqs0XyUSu7Jxr2kzAYCcUwKUi0sa
         ZHYllSoLy5pJlnJD7H9tccf3lVEpijs4pzocIpRYykNdgWhJ9yVvCgYUFNerpK32gadi
         f2Hg==
X-Gm-Message-State: AOAM530bVIhVX0conk+v07P4wUOHLuSdj4xDya002c4P4Kh9kYf5oINv
        h9A/Ouxu6G5bD1zWz8Kw+rxN0MdTPweqeBLA
X-Google-Smtp-Source: ABdhPJzeVXvdpkMHrZu0Mk4N0GSGHJqvzfr9ZjLW7G/dhGMjxY8ZuMi7Wkl+OmUvm7FAIR+A1Kz9fA==
X-Received: by 2002:a05:6a00:845:b029:28d:e03:6d7e with SMTP id q5-20020a056a000845b029028d0e036d7emr2486493pfk.37.1619797647450;
        Fri, 30 Apr 2021 08:47:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:8100:30a6:a362:7862:2436:1c0a:c59d])
        by smtp.gmail.com with ESMTPSA id o187sm2530591pfb.190.2021.04.30.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:47:27 -0700 (PDT)
From:   Piyush Thange <pthange19@gmail.com>
To:     mchehab@kernel.org, leon@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Piyush Thange <pthange19@gmail.com>
Subject: [PATCH 3/4] media: usb: cpia2: Fixed coding style issues
Date:   Fri, 30 Apr 2021 21:13:13 +0530
Message-Id: <20210430154314.3152-3-pthange19@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430154314.3152-1-pthange19@gmail.com>
References: <20210430154314.3152-1-pthange19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Additional fixes about coding style.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 drivers/media/usb/cpia2/cpia2_v4l.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 2d9156ea7652..261ced144793 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -783,7 +783,7 @@ static int cpia2_querybuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 
 	buf->memory = V4L2_MEMORY_MMAP;
 
-	if(cam->mmapped)
+	if (cam->mmapped)
 		buf->flags = V4L2_BUF_FLAG_MAPPED;
 	else
 		buf->flags = 0;
@@ -824,14 +824,14 @@ static int cpia2_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 {
 	struct camera_data *cam = video_drvdata(file);
 
-	if(buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	   buf->memory != V4L2_MEMORY_MMAP ||
 	   buf->index >= cam->num_frames)
 		return -EINVAL;
 
 	DBG("QBUF #%d\n", buf->index);
 
-	if(cam->buffers[buf->index].status == FRAME_READY)
+	if (cam->buffers[buf->index].status == FRAME_READY)
 		cam->buffers[buf->index].status = FRAME_EMPTY;
 
 	return 0;
@@ -849,9 +849,10 @@ static int find_earliest_filled_buffer(struct camera_data *cam)
 {
 	int i;
 	int found = -1;
-	for (i=0; i<cam->num_frames; i++) {
-		if(cam->buffers[i].status == FRAME_READY) {
-			if(found < 0) {
+
+	for (i = 0; i < cam->num_frames; i++) {
+		if (cam->buffers[i].status == FRAME_READY) {
+			if (found < 0) {
 				found = i;
 			} else {
 				/* find which buffer is earlier */
@@ -876,7 +877,7 @@ static int cpia2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	struct camera_data *cam = video_drvdata(file);
 	int frame;
 
-	if(buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	   buf->memory != V4L2_MEMORY_MMAP)
 		return -EINVAL;
 
-- 
2.25.1

