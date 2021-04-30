Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A9636FE01
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhD3PsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhD3PsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:48:10 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A674C06174A;
        Fri, 30 Apr 2021 08:47:22 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id i13so1773289pfu.2;
        Fri, 30 Apr 2021 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lffHW6+bJT/jZDB8NYsrRLnITHeQydH7o4/HNDXB/bE=;
        b=F9b+y7ve5qhrZlKuh1/yt7HQb9WBRvr0iHAHK5ZB1iM1Wb07+SpOX3ly02CaQqMPYw
         ZvwIKs1KUQRxND3PRLKNVeUOjr6J6sQRpZ0iJ1Sq+aHS6g07NAh2gSkLuMZM0cY+KVij
         ribE4iNgGTDvpQS8orQFimPuuLd8jdtP7Yx5X68nb/PcuckwhvwyvRGImXOSHX2qm4su
         ba6h4bU45Lw5FhyTz1NfERNZEkfM6SdygGyNT/uyYrxKWFtJTJX9aGTCWhHJHZMP+5n6
         lFViF/YE+eOGH8tFh2Ew4YQI/EAA4SvzAZQx6WwVqWuHXh4J+WQ3Cuji1MWNM2YXlm5c
         InDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lffHW6+bJT/jZDB8NYsrRLnITHeQydH7o4/HNDXB/bE=;
        b=HmMb9yg2xgjZsnb0fr2HP9gi9e8YLldFkXSgEHt38/rqb7YQXwOzgSyg0relaqAu/W
         VadiKFjJ/qI1q/c10ky1QsHn8ri/aLCTB1+nRoJKjwnpssfE7rODAMC2ZT41t2dlzn0r
         S9O+hUyCGJsu7A5t/tk3XlwWLHTDbHQ1akyDBVKnapPhzQYiXcqhpnkRTA6HmZ6fxL9K
         Ps8bRssYu7o1lP1sEmMyJOgaZ1Tmx0fGkbOjfE+Ceh+Y13VL8B/ciSrqq1T13SwkJ0gv
         ZeTaLa+cVMfgqYEE/qGaaJX6/afq7j3pD2Y4rLFsUi4KS3VggPpgGu7DWZv+CemuFJO0
         SkRg==
X-Gm-Message-State: AOAM530GG2wpalc8hnYtyM1djqfRFC2yZNW+QS99PicJucmVZkBlzpCn
        LBxOzc1jcslj2aUtvQalLno=
X-Google-Smtp-Source: ABdhPJwfUcD6npZ/WFw2T4e3EQ/gIVuHDruqdpSurSMdWProQoCVwcrieIBymf3rsBRQ+O/iFJihdA==
X-Received: by 2002:aa7:97a1:0:b029:27f:aa90:c7a6 with SMTP id d1-20020aa797a10000b029027faa90c7a6mr5672426pfq.10.1619797641772;
        Fri, 30 Apr 2021 08:47:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:8100:30a6:a362:7862:2436:1c0a:c59d])
        by smtp.gmail.com with ESMTPSA id o187sm2530591pfb.190.2021.04.30.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:47:21 -0700 (PDT)
From:   Piyush Thange <pthange19@gmail.com>
To:     mchehab@kernel.org, leon@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Piyush Thange <pthange19@gmail.com>
Subject: [PATCH 1/4] media: usb: cpia2: Fixed coding style issues
Date:   Fri, 30 Apr 2021 21:13:11 +0530
Message-Id: <20210430154314.3152-1-pthange19@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed coding style issues with spaces for if condition &
others statements.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 drivers/media/usb/cpia2/cpia2_v4l.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 69d5c628a797..4b58b1e7847e 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -143,7 +143,7 @@ static ssize_t cpia2_v4l_read(struct file *file, char __user *buf, size_t count,
 	int noblock = file->f_flags&O_NONBLOCK;
 	ssize_t ret;
 
-	if(!cam)
+	if (!cam)
 		return -EINVAL;
 
 	if (mutex_lock_interruptible(&cam->v4l2_lock))
@@ -247,8 +247,8 @@ static int cpia2_querycap(struct file *file, void *fh, struct v4l2_capability *v
 		break;
 	}
 
-	if (usb_make_path(cam->dev, vc->bus_info, sizeof(vc->bus_info)) <0)
-		memset(vc->bus_info,0, sizeof(vc->bus_info));
+	if (usb_make_path(cam->dev, vc->bus_info, sizeof(vc->bus_info)) < 0)
+		memset(vc->bus_info, 0, sizeof(vc->bus_info));
 	return 0;
 }
 
@@ -377,7 +377,7 @@ static int cpia2_s_fmt_vid_cap(struct file *file, void *_fh,
 	int err, frame;
 
 	err = cpia2_try_fmt_vid_cap(file, _fh, f);
-	if(err != 0)
+	if (err != 0)
 		return err;
 
 	cam->pixelformat = f->fmt.pix.pixelformat;
@@ -665,13 +665,13 @@ static int cpia2_g_jpegcomp(struct file *file, void *fh, struct v4l2_jpegcompres
 	parms->quality = 80; // TODO: Can this be made meaningful?
 
 	parms->jpeg_markers = V4L2_JPEG_MARKER_DQT | V4L2_JPEG_MARKER_DRI;
-	if(!cam->params.compression.inhibit_htables) {
+	if (!cam->params.compression.inhibit_htables)
 		parms->jpeg_markers |= V4L2_JPEG_MARKER_DHT;
-	}
+
 
 	parms->APPn = cam->APPn;
 	parms->APP_len = cam->APP_len;
-	if(cam->APP_len > 0) {
+	if (cam->APP_len > 0) {
 		memcpy(parms->APP_data, cam->APP_data, cam->APP_len);
 		parms->jpeg_markers |= V4L2_JPEG_MARKER_APP;
 	}
-- 
2.25.1

