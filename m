Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8807231202A
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 22:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhBFVW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 16:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFVW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Feb 2021 16:22:28 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E0AC06174A;
        Sat,  6 Feb 2021 13:21:47 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id a8so15998876lfi.8;
        Sat, 06 Feb 2021 13:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ANZHZLXQhY84IBPjPl5swjkNUaxy3iGTDmC43M6g6Y=;
        b=jFW8xNhNH95y88lpOXlxaKWGseqrow8q1+F87WILYVTOY0DoJbUxCT+mIEFbfB2AIg
         JFRq4bQ0jFHwq6MpZvqTmyuVgRSbz+DvHQJWVRu1ovaDo2VByBlfvexeNGqMEC5t4uQF
         CM7K/CXjMGpUoYJkpXox2/3rGBUUG1sxmc1nErLM0+Dr5oXGRcrNnbebfl+bQ0itqfG2
         5CkTOt/yZSB2mpIuOAck8kKrJTl3W5QSqcqmygGX0Gb+ZyDT11zRQAbSyaGUdwXxS1+o
         6guBXZBmmDLq2NFRDU0EdznyMpGMvCGlDAqoAZC79ZiZNn8iLw5b7ZtTGNhCqdMV1hu9
         2D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ANZHZLXQhY84IBPjPl5swjkNUaxy3iGTDmC43M6g6Y=;
        b=XbZkxCF37Wsjl9yID4EjSmVJz7z5UOnYTLwAxjYAR4e/CoVdGM6BVFrFjyFUZdqLHy
         o7QIpjZDXneXvqXA9oDarqT2tnZLBBGbnPW681Q1Kx34IFV6c1EfNo1ye08ouhy4E7be
         JB+9lffCJlfo/UZFlSU9hCPkGJ5w2SnzV5JG7DG7Gz1139mEPjh+hJPWczvs+sCHEiLV
         ExlfRMnh2MAuY6w9nWX/AwH0xue/fW32ia/2SV3tVr98mRTUDt2L+URFvMOgmdjdTyN7
         Y+00lwD26nPZoRaMa7/BoTstHbVv9L5n7E3EDMS+RzwpN6qE/GmGbj3VzPIzxUkO7CNM
         VJcA==
X-Gm-Message-State: AOAM531uj9A+1TxfD8uuY8F6GpEJtQ7L+s5cXbqYFWSUtcS9IGEW5f+j
        xOKsPTgBXgoJBmGGl7AGEQM=
X-Google-Smtp-Source: ABdhPJyIM70tojreBlHvQft2bbzYB07X7DVTWDCXIVcoEmiX0o/EBX9Fi251aaUz5XpxIqQQtSvvFA==
X-Received: by 2002:a05:6512:3243:: with SMTP id c3mr6138178lfr.559.1612646506020;
        Sat, 06 Feb 2021 13:21:46 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se. [158.174.22.164])
        by smtp.gmail.com with ESMTPSA id a11sm1406590lfi.197.2021.02.06.13.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 13:21:45 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: usbtv: constify static structs
Date:   Sat,  6 Feb 2021 22:21:39 +0100
Message-Id: <20210206212139.34991-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Constify two static structs which are never modified to allow the
compiler to put them in read-only memory.

The only usage of norm_params is only read from it in
usbtv_configure_for_norm(). Making it const shrinks the resulting
ko-file with 300 bytes (tested with gcc 10).

The only usage of usbtv_ioctl_ops is to put its address to the ioctl_ops
field in the video_device struct. Making it const moves ~1kb to
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 3b4a2e769230..a714ad77ca8e 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -47,7 +47,7 @@
 
 #include "usbtv.h"
 
-static struct usbtv_norm_params norm_params[] = {
+static const struct usbtv_norm_params norm_params[] = {
 	{
 		.norm = V4L2_STD_525_60,
 		.cap_width = 720,
@@ -63,7 +63,7 @@ static struct usbtv_norm_params norm_params[] = {
 static int usbtv_configure_for_norm(struct usbtv *usbtv, v4l2_std_id norm)
 {
 	int i, ret = 0;
-	struct usbtv_norm_params *params = NULL;
+	const struct usbtv_norm_params *params = NULL;
 
 	for (i = 0; i < ARRAY_SIZE(norm_params); i++) {
 		if (norm_params[i].norm & norm) {
@@ -685,7 +685,7 @@ static int usbtv_s_input(struct file *file, void *priv, unsigned int i)
 	return usbtv_select_input(usbtv, i);
 }
 
-static struct v4l2_ioctl_ops usbtv_ioctl_ops = {
+static const struct v4l2_ioctl_ops usbtv_ioctl_ops = {
 	.vidioc_querycap = usbtv_querycap,
 	.vidioc_enum_input = usbtv_enum_input,
 	.vidioc_enum_fmt_vid_cap = usbtv_enum_fmt_vid_cap,
-- 
2.30.0

