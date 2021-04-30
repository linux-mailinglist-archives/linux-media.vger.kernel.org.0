Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DED936FE02
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhD3PsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhD3PsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:48:14 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282A3C06174A;
        Fri, 30 Apr 2021 08:47:25 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i190so9171588pfc.12;
        Fri, 30 Apr 2021 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ucgE+czT5EQRnmO8Ub3qt2TGoecY6Ett8CW6iqiBxvw=;
        b=GJ+54iosi1tuvBIhK0J2PdWVyEDw2ebwtQ3Spp93736fAN5ZKmMPHPWXTbHFQ2oVCy
         xR4WGb/r2bYcqtbQJZHAWE2sGw8Dq5gvd53+c8vtQOOu1yp1kJvTbCxU0Zv2Ki2gEurG
         aQ0GWCykf7Ci8vnPhz+JWMI9pJOVjJSJSr9ddR0gRdGSBPiIie/XT1PXA1nz5zDx4/Xt
         j5VAsgA19j1u1hOwUuX4o3TJULBCfmhSw3yOAYDw3RFmXbobAddFm5nHBRBQStUAqE3X
         7ePYxd1ZpidbH9CE8hmF6m7lZkr4QfafdBUcF1Wmdn06nl8gZW0kNDnn3lkYJJjty+Vg
         audQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ucgE+czT5EQRnmO8Ub3qt2TGoecY6Ett8CW6iqiBxvw=;
        b=PmRaZbUTwWSARu4BGCvs081ZJBPJmoKLWHQE6szJ71+ln+m1mlsTu2v0ibV3Z9qG/t
         F1E7LlneV4oJqI1PP1985B8z6qi70r2YWoCszb6N4HgYqQ8RxuuS885AGs579UFMRS9z
         dbI/fMHOV+L1cN5qbEpP5HBoaGDqDYC8OND/KTZFDQDOa3VCoco8ollDVKAzxqbayUV8
         dqNbcWwBZAVrJ30kADhjZX+nLZ9PDKXkpSmLByPtfPze/8yz/C7gVmhpRsFyKN4YIh8J
         JvMbEsuMC035Bb9ht341MKe00bom1oHZGrbQ9SV2iWFzdpq29K2yrNdnJyFFELkUqbm9
         Ck9g==
X-Gm-Message-State: AOAM530mg5otbxvo7KjpQKikdwAi9FrjZ6Y8otBF8dw17AVf71EBo9cw
        8ZDiv30WTbnPcHCykultMPU=
X-Google-Smtp-Source: ABdhPJyiUz48FpuykOKblheE3UpZr66tXFVIMaYXCEoaderADxdAD6vHF+WG+CwDHTxJBQS5khbrpw==
X-Received: by 2002:a62:75c3:0:b029:27c:d30f:66a6 with SMTP id q186-20020a6275c30000b029027cd30f66a6mr5655728pfc.0.1619797644631;
        Fri, 30 Apr 2021 08:47:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:8100:30a6:a362:7862:2436:1c0a:c59d])
        by smtp.gmail.com with ESMTPSA id o187sm2530591pfb.190.2021.04.30.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:47:24 -0700 (PDT)
From:   Piyush Thange <pthange19@gmail.com>
To:     mchehab@kernel.org, leon@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Piyush Thange <pthange19@gmail.com>
Subject: [PATCH 2/4] media: usb: cpia2: Fixed coding style issues
Date:   Fri, 30 Apr 2021 21:13:12 +0530
Message-Id: <20210430154314.3152-2-pthange19@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430154314.3152-1-pthange19@gmail.com>
References: <20210430154314.3152-1-pthange19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding more fixes on coding style issues.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 drivers/media/usb/cpia2/cpia2_v4l.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 4b58b1e7847e..2d9156ea7652 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -677,7 +677,7 @@ static int cpia2_g_jpegcomp(struct file *file, void *fh, struct v4l2_jpegcompres
 	}
 
 	parms->COM_len = cam->COM_len;
-	if(cam->COM_len > 0) {
+	if (cam->COM_len > 0) {
 		memcpy(parms->COM_data, cam->COM_data, cam->COM_len);
 		parms->jpeg_markers |= JPEG_MARKER_COM;
 	}
@@ -708,8 +708,8 @@ static int cpia2_s_jpegcomp(struct file *file, void *fh,
 	cam->params.compression.inhibit_htables =
 		!(parms->jpeg_markers & V4L2_JPEG_MARKER_DHT);
 
-	if(parms->APP_len != 0) {
-		if(parms->APP_len > 0 &&
+	if (parms->APP_len != 0) {
+		if (parms->APP_len > 0 &&
 		   parms->APP_len <= sizeof(cam->APP_data) &&
 		   parms->APPn >= 0 && parms->APPn <= 15) {
 			cam->APPn = parms->APPn;
@@ -724,8 +724,8 @@ static int cpia2_s_jpegcomp(struct file *file, void *fh,
 		cam->APP_len = 0;
 	}
 
-	if(parms->COM_len != 0) {
-		if(parms->COM_len > 0 &&
+	if (parms->COM_len != 0) {
+		if (parms->COM_len > 0 &&
 		   parms->COM_len <= sizeof(cam->COM_data)) {
 			cam->COM_len = parms->COM_len;
 			memcpy(cam->COM_data, parms->COM_data, parms->COM_len);
@@ -751,7 +751,7 @@ static int cpia2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers
 {
 	struct camera_data *cam = video_drvdata(file);
 
-	if(req->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	if (req->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	   req->memory != V4L2_MEMORY_MMAP)
 		return -EINVAL;
 
@@ -774,7 +774,7 @@ static int cpia2_querybuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 {
 	struct camera_data *cam = video_drvdata(file);
 
-	if(buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	   buf->index >= cam->num_frames)
 		return -EINVAL;
 
-- 
2.25.1

