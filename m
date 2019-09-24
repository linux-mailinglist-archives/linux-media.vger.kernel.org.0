Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B019BC24E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 09:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409177AbfIXHIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 03:08:46 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37380 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409175AbfIXHIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 03:08:46 -0400
Received: by mail-pg1-f193.google.com with SMTP id c17so768524pgg.4
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AoSMyuXJHbawgVsRm51Cz3xI9yxj0L1JcVNLVzpu4qY=;
        b=Dm4zjy7GAsS7ZiCLmKtv7BIS9N3EZ73sK9Ve6/YntReyghKWZIIwHzTcqTcqHNOcBf
         7N6VzLPbG0OJf12SlgRVh6L741dUBu+k/nbSGTdTtsRflAecAMx41mPTJbb+Kxl7SxQ6
         G+8SWh5s9SysHYvVXJDs941Et7X74eYEXSp6P9qbDRGjDYByuQOgxxmLwnUsPaHaI5b1
         umQzWMDnGy/i5tC0H/pVFzom5gYB0nfcQpHzKf4D6vL6QDzWpBQR3CiJVtDRP/WtwXjy
         dOgVTjUMKSR2NoXv/uCO68Sltj4CltzJJcDYpQbfwETRxBqpJfFxEXwg/eWwO/SPHp1V
         bZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AoSMyuXJHbawgVsRm51Cz3xI9yxj0L1JcVNLVzpu4qY=;
        b=hzPZm/jCU3lf+ULitlbPVSGNLI2LN2WcY8pM4KRjxPpzJfnRABeuTpoM+jJOQB3Y9n
         P331WLUYlZrsWozV/uBhiFFCqLavfg+jS7i1FaHnGUYgozv5vR0nOvWlsVituqqBvZax
         SEtE+Z/yDe/8JcuO6mX5PWtu63gXutoNxuvKznx9ilb52eWmr/R/x2C/rBOl/Pg6Uman
         1HLulfpPnQv15R18q2Z6bZyYYosa8RZ+FibwjJJ9roLsqAc/+wQeI/ALwZgLQM9b4pR+
         Q3CYS/+2iZC/S3TN1+ATAHITo5cs2iB7LMMhXNK7PAXR2fzqLZNl0h57u8N7bszYSbi2
         rAPQ==
X-Gm-Message-State: APjAAAXU4rjUQcTiC3Sr9nWloCsrhZLoBHk2PjHUl+s8E0J6owE6KlGl
        Mpg7gjGAlSY9iSx+fYqnYEpGmsXI
X-Google-Smtp-Source: APXvYqx/yornDlckY0XqiVJMWTAWZoZFCiJHV2+09O3NnroWupA5Wpvafq93YvUY2q5FLecVHMJh1Q==
X-Received: by 2002:a17:90a:fb83:: with SMTP id cp3mr1383954pjb.41.1569308924955;
        Tue, 24 Sep 2019 00:08:44 -0700 (PDT)
Received: from localhost.localdomain ([49.206.12.173])
        by smtp.gmail.com with ESMTPSA id v68sm966727pfv.47.2019.09.24.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 00:08:44 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v5] v4l2-ctl: Print UVC meta info
Date:   Tue, 24 Sep 2019 12:38:22 +0530
Message-Id: <20190924070822.13757-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ac306dbd-fc10-013c-4c12-ef63d6971631@xs4all.nl>
References: <ac306dbd-fc10-013c-4c12-ef63d6971631@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Changes since v4:
	Print PTS and SCR info.
---
 utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 42 +++++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 +++++----
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 75fbd6f4..cd249406 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -127,3 +127,45 @@ void meta_list(cv4l_fd &fd)
 		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
 	}
 }
+
+struct vivid_uvc_meta_buf {
+	__u64 ns;
+	__u16 sof;
+	__u8 length;
+	__u8 flags;
+	__u8 buf[10];
+};
+
+#define UVC_STREAM_SCR	(1 << 3)
+#define UVC_STREAM_PTS	(1 << 2)
+
+void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	struct vivid_uvc_meta_buf *vbuf;
+
+	switch (fmt.g_pixelformat()) {
+	case V4L2_META_FMT_UVC:
+		fprintf(f, "UVC: ");
+		for (unsigned i = 0; i < buf.g_num_planes(); i++) {
+			int buf_off = 0;
+
+			vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), i);
+
+			if (vbuf[i].flags & UVC_STREAM_PTS)
+				buf_off = 4;
+
+			fprintf(f, "%.6fs, sof %u, len %u, flags 0x%x PTS %u, STC %u frame SOF %u\n",
+				(double)vbuf[i].ns / 1000000000.0,
+				vbuf[i].sof,
+				vbuf[i].length,
+				vbuf[i].flags,
+				(vbuf[i].flags & UVC_STREAM_PTS) ?
+					le32toh(*(__u32*)(vbuf[i].buf)) : 0,
+				(vbuf[i].flags & UVC_STREAM_SCR) ?
+					le32toh(*(__u32*)(vbuf[i].buf + buf_off)) : 0,
+				(vbuf[i].flags & UVC_STREAM_SCR) ?
+					le16toh(*(__u16*)(vbuf[i].buf + buf_off + 4)) : 0);
+		}
+		break;
+	}
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 11157434..46d53f23 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -540,9 +540,9 @@ static void print_buffer(FILE *f, struct v4l2_buffer &buf)
 	fprintf(f, "\n");
 }
 
-static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
-				 fps_timestamps &fps_ts, int comp_perc,
-				 bool skip_ts = false)
+static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
+				 cv4l_queue &q, fps_timestamps &fps_ts,
+				 int comp_perc, bool skip_ts = false)
 {
 	static double last_ts;
 
@@ -592,6 +592,8 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
 	if (fl)
 		fprintf(f, " (%s)", bufferflags2s(fl).c_str());
 	fprintf(f, "\n");
+	if (v4l_type_is_meta(buf.g_type()))
+		print_meta_buffer(f, buf, fmt, q);
 }
 
 static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
@@ -1390,7 +1392,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 		if (!(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
 			break;
 		if (verbose)
-			print_concise_buffer(stderr, buf, fps_ts, -1);
+			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
 		if (fd.qbuf(buf))
 			return QUEUE_ERROR;
 	}
@@ -1412,7 +1414,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 	else if (buf.g_flags() & V4L2_BUF_FLAG_BFRAME)
 		ch = 'B';
 	if (verbose) {
-		print_concise_buffer(stderr, buf, fps_ts,
+		print_concise_buffer(stderr, buf, fmt, q, fps_ts,
 				     host_fd_to >= 0 ? 100 - comp_perc / comp_perc_count : -1);
 		comp_perc_count = comp_perc = 0;
 	}
@@ -1502,7 +1504,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 		double ts_secs = buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec / 1000000.0;
 		fps_ts.add_ts(ts_secs, buf.g_sequence(), buf.g_field());
 		if (verbose)
-			print_concise_buffer(stderr, buf, fps_ts, -1);
+			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
 
 		for (unsigned j = 0; j < buf.g_num_planes(); j++)
 			buf.s_bytesused(buf.g_length(j), j);
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 5797d784..36051566 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -406,6 +406,7 @@ void meta_cmd(int ch, char *optarg);
 void meta_set(cv4l_fd &fd);
 void meta_get(cv4l_fd &fd);
 void meta_list(cv4l_fd &fd);
+void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 
 // v4l2-ctl-subdev.cpp
 void subdev_usage(void);
-- 
2.17.1

