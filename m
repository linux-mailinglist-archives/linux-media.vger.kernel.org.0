Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA9B36FE07
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhD3PsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhD3PsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:48:19 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D3EC06174A;
        Fri, 30 Apr 2021 08:47:30 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y1so21168779plg.11;
        Fri, 30 Apr 2021 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+G+f+RqY1tQqQC+A6Uop1YINz7gAicX1/Ug6Ztkf9rA=;
        b=SW4SMbcBTk22iqiR5nvJwSWwuBxN/4ylhbg5TmV2uePMe721u0dht7zRBFGOvj1WIA
         8Qv8UyW3fWS94aF3nlMqigks0J7EO2jgeUeV8scG7XR7PLJ99YT1kMuNJd5Lq4Q7XNmV
         gc5b23dJHoGZJ2fz9frKJGaeOQypFC9mCtRVecG1pJyRv3RlgGBTyNi3DHOcHYB9eMW3
         wotgVBeNnZaCRBpYvhhtf3ApzXLZk+8fr98u2H7rkAKKeplPaYfKKJG1mC+0cuCnKNR1
         NB8C4rwQ1gPH1kym7spQi4S50Phce1FRqi0JreFJoMcOKR8i5jLmbkaSKtqD1i1aA3bB
         JwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+G+f+RqY1tQqQC+A6Uop1YINz7gAicX1/Ug6Ztkf9rA=;
        b=kuQqSj+rDyiXwyYuhs9x5iNtkeLDovcVNJIqbf5uaTAQhAYn9/gOb/wvFHZVArjatw
         JMl3usQY6tFcDKlFzFyuOeupjPhzwIf65snsn+JOcuZzxEwWMTwj+RqcNO6mPPIlzNmj
         pBW+/w7F3M5pqXErY2pQFP4+jOXRgpFTyHlbAxvvfzwuNhEogjammJDRHVvVf6jAHCV2
         PcOYxlFoTjzwJ/NLOT8f7LeytchZOl0MR1VNgyqhS5n0KiKZwKvHPqhvH+WhqTp7xMa4
         rmTfOrMzaB+Ufu+TO1OvTydRquQOnIBoiqXjZDotiG25lWBOzs8ow5+lkIT6gr1J3Onr
         5/pA==
X-Gm-Message-State: AOAM533jNhfzdLRC+3Cr5hIssuDM94Weq1OfVgp2nhmXQ0jcYGkjaTZy
        WP8GFx+VkB6/XnNKZp3kXFIrJQB2+kpkuJj8
X-Google-Smtp-Source: ABdhPJxx9yMGJq2pfikQDu2Sz7XYL/7OzCKxW0PckBReOUzlhKVd6ekMHjw8k2FPfUzwIhddbR9iTw==
X-Received: by 2002:a17:902:c106:b029:ee:a12b:c097 with SMTP id 6-20020a170902c106b02900eea12bc097mr2839979pli.27.1619797650285;
        Fri, 30 Apr 2021 08:47:30 -0700 (PDT)
Received: from localhost.localdomain ([2402:8100:30a6:a362:7862:2436:1c0a:c59d])
        by smtp.gmail.com with ESMTPSA id o187sm2530591pfb.190.2021.04.30.08.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:47:29 -0700 (PDT)
From:   Piyush Thange <pthange19@gmail.com>
To:     mchehab@kernel.org, leon@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Piyush Thange <pthange19@gmail.com>
Subject: [PATCH 4/4] media: usb: cpia2: Fixed coding style issues
Date:   Fri, 30 Apr 2021 21:13:14 +0530
Message-Id: <20210430154314.3152-4-pthange19@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430154314.3152-1-pthange19@gmail.com>
References: <20210430154314.3152-1-pthange19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Addition of more fixes on coding style.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 drivers/media/usb/cpia2/cpia2_v4l.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 261ced144793..d950f9171208 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -883,12 +883,12 @@ static int cpia2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 
 	frame = find_earliest_filled_buffer(cam);
 
-	if(frame < 0 && file->f_flags&O_NONBLOCK)
+	if (frame < 0 && file->f_flags&O_NONBLOCK)
 		return -EAGAIN;
 
-	if(frame < 0) {
+	if (frame < 0) {
 		/* Wait for a frame to become available */
-		struct framebuf *cb=cam->curbuff;
+		struct framebuf *cb = cam->curbuff;
 		mutex_unlock(&cam->v4l2_lock);
 		wait_event_interruptible(cam->wq_stream,
 					 !video_is_registered(&cam->vdev) ||
@@ -970,7 +970,7 @@ static int cpia2_mmap(struct file *file, struct vm_area_struct *area)
 		return -ERESTARTSYS;
 	retval = cpia2_remap_buffer(cam, area);
 
-	if(!retval)
+	if (!retval)
 		cam->stream_fh = file->private_data;
 	mutex_unlock(&cam->v4l2_lock);
 	return retval;
@@ -1160,10 +1160,10 @@ void cpia2_unregister_camera(struct camera_data *cam)
  *****************************************************************************/
 static void __init check_parameters(void)
 {
-	if(buffer_size < PAGE_SIZE) {
+	if (buffer_size < PAGE_SIZE) {
 		buffer_size = PAGE_SIZE;
 		LOG("buffer_size too small, setting to %d\n", buffer_size);
-	} else if(buffer_size > 1024*1024) {
+	} else if (buffer_size > 1024*1024) {
 		/* arbitrary upper limiit */
 		buffer_size = 1024*1024;
 		LOG("buffer_size ridiculously large, setting to %d\n",
@@ -1173,15 +1173,15 @@ static void __init check_parameters(void)
 		buffer_size &= ~(PAGE_SIZE-1);
 	}
 
-	if(num_buffers < 1) {
+	if (num_buffers < 1) {
 		num_buffers = 1;
 		LOG("num_buffers too small, setting to %d\n", num_buffers);
-	} else if(num_buffers > VIDEO_MAX_FRAME) {
+	} else if (num_buffers > VIDEO_MAX_FRAME) {
 		num_buffers = VIDEO_MAX_FRAME;
 		LOG("num_buffers too large, setting to %d\n", num_buffers);
 	}
 
-	if(alternate < USBIF_ISO_1 || alternate > USBIF_ISO_6) {
+	if (alternate < USBIF_ISO_1 || alternate > USBIF_ISO_6) {
 		alternate = DEFAULT_ALT;
 		LOG("alternate specified is invalid, using %d\n", alternate);
 	}
-- 
2.25.1

