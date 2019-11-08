Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE04F410F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 08:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbfKHHMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 02:12:36 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34638 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKHHMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 02:12:35 -0500
Received: by mail-pl1-f194.google.com with SMTP id k7so3494250pll.1
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 23:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7pnccXbop4M/TCVxdmdegnw4UV0QugzjizOP7//XPiY=;
        b=NByuecrCmCrFgGs6mIkgnq4iarpP5qncB87GnL7I3GcovS3v1IBVoqA2Yy7ORwzkhs
         ta8cEg7fSW4JL5IFbyu5rk718GXlIx6dtsYWoBYxERRPm/kMJTAaXgyPFanJKrpwTokn
         ZAx2FEZHpeVxEhIp4l7JvvyKMbRNruQ2Q2fJ09Q7EQyiIEtijbNduqKqAPoepbOFlwNk
         3VuZ2UqQI7rOp4tScP0f8DJT2ed3UJARl/pwT4f3Rz5VbtiPAAUMAzKJNm2y6LDYtJ50
         gScF2Dt6l0/jYnGGWY71rSaaM3AWDLXn1c1ab1RffG9Btwcm/bd2ctoNvMg/mFQoD6Cd
         ZR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7pnccXbop4M/TCVxdmdegnw4UV0QugzjizOP7//XPiY=;
        b=LKmFMJrLTqrJ+ItW35GrkypPw+xI3a2RVZeAq5evmSp83ijIMDKAHaEriFdQkHci3C
         Kdl57IRwT6Ocp7Qyrkb/Wj+TXeKL4N3KOvkKU2sxI+1lzK11JH0XxaQ3YtL+5GkRlooN
         xjF/tD8AACZy+1bZ2cTqxpdDo8xszLzaAPV/5V0T3gcxQEUJDaw/CeNNKejCZTMNhha+
         Ova9W0CfogWrK3ZALemB6k+4rbx0Y9GW14IReSQfDAybvBgmZVdQxzYUMeYOe7tb3QuF
         GYveMLJgD9ju773T0avxux+6hKSy7vDtsKilw7O2Uv57OMX9sjc/oegq9xAvK7Wx2y7w
         N5EQ==
X-Gm-Message-State: APjAAAWXlwE7llTKRj5xdTYE9Ar5eY5bgAHYxUeSm52YwYcR4LbbIFXb
        vDIgMTMoHVEycJnYLGBFha/ZHI4wdKk=
X-Google-Smtp-Source: APXvYqz9Gz799muI0Y7f8lnCgC6/XB/wMCBNiSMH8YAppsXF+ZasEk3ky+tVx+W0+3iswWV+vcGD1w==
X-Received: by 2002:a17:90a:1089:: with SMTP id c9mr11587095pja.8.1573197154850;
        Thu, 07 Nov 2019 23:12:34 -0800 (PST)
Received: from localhost.localdomain ([106.216.170.180])
        by smtp.gmail.com with ESMTPSA id b128sm645578pfg.58.2019.11.07.23.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 23:12:34 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] v4l2-ctl:Add Support for Touch
Date:   Fri,  8 Nov 2019 12:42:27 +0530
Message-Id: <20191108071227.10982-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to verify V4L2_TCH_FMT_TU16 format touch inputs.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  4 ++++
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp    | 29 +++++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 34 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 184bfd64..191a18c5 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -595,6 +595,10 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
 	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
 	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
 		print_meta_buffer(f, buf, fmt, q);
+
+	if ((capabilities & V4L2_CAP_TOUCH) && buf.g_bytesused(0) &&
+	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
+		print_touch_buffer(f, buf, fmt, q);
 }
 
 static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 3a29251a..99945248 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -358,3 +358,32 @@ void vidcap_list(cv4l_fd &fd)
 		}
 	}
 }
+
+#define VIVID_TCH_HEIGHT        24
+#define VIVID_TCH_WIDTH         14
+
+struct vivid_touch_buf {
+        __u16     buf[VIVID_TCH_WIDTH * VIVID_TCH_HEIGHT];
+	int test_pattern;
+};
+
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+        struct vivid_touch_buf *vbuf;
+        int i=0;
+
+        switch (fmt.g_pixelformat()) {
+        case V4L2_TCH_FMT_TU16:
+                vbuf = (vivid_touch_buf *)q.g_dataptr(buf.g_index(), 0);
+		fprintf(f, "Test Pattern: %d\n",vbuf->test_pattern);
+                fprintf(f, "TU16: ");
+		for (i = 0; i < (VIVID_TCH_HEIGHT*VIVID_TCH_WIDTH); i++) {
+			if (vbuf->buf[i])
+			fprintf(f, "x: %d y: %d Pressure Value: %d\n",
+				i % VIVID_TCH_WIDTH,
+				i / VIVID_TCH_WIDTH,
+				vbuf->buf[i]);
+		}
+                break;
+	}
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b0f65e9b..b31be7f5 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -373,6 +373,7 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt);
 void vidcap_set(cv4l_fd &fd);
 void vidcap_get(cv4l_fd &fd);
 void vidcap_list(cv4l_fd &fd);
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 
 // v4l2-ctl-vidout.cpp
 void vidout_usage(void);
-- 
2.17.1

