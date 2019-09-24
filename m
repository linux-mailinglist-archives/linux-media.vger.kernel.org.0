Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7947BC627
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504524AbfIXLEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:04:36 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:33778 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504522AbfIXLEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:04:35 -0400
Received: by mail-pg1-f170.google.com with SMTP id i30so1148135pgl.0
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8E8uihZoIaYnztA6doxs5Sqq/rVlgRGnQHpm5Fr/tHc=;
        b=q1ti/U7i/mXiS8gNeW25gpGpEo2SdP3NOODGcfzZ0ny/S6GDgheLJDmigR0Eev+dm9
         rWtCnmO6wstS6uJyJhBbozHiQl27aKHJT5yWSEHplMX5GtmMpl88qX9D0v3MUrzLjDtz
         tC28iV2fgIy39/tQKmV1Dap8PG2YnbjwEryeBD0nGpUn59Jy3TSLJDOXy3Ot23Anqyyu
         +SkUOWdaweqByXVUzg29KnLYOS8MktMKZv0CNHEWS4jNDaEPDTs1qjuYbYnqCD1Q0UZA
         QTu2dxajJKyGv7YbSl6eyAR+a1lhmxqNIil5QhOTCJuXt0DFr5SFZQhkeGFAuM0jWHfG
         c4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8E8uihZoIaYnztA6doxs5Sqq/rVlgRGnQHpm5Fr/tHc=;
        b=cSumfrTnby8ZdKj6q2CiVYjoR/7HHHyzOzWiBdbS4VTda6wdBH+jZamy1MsmkYkLbo
         SVbn6gDY1qkBs4iVAMnwRNTTXUuB49YizjsAQQYXe8TSS+S62875rHl5iuxq8MUtcfjy
         IU69/YFyrvTJVEbj9lHfzyeBISp2et1MG6NVJxjENbFqwbYYIvpkky6GNi6bmB3KFvYK
         r4KGiy+yWDfNyKnkFhZ908EbmKFVDP/e6ACvd9/4kGeLaNuTmRUYDRfH4AiFcnqbYT64
         BfT9bu0cWbh/+dP/lob0Qj42+gWe3CDhxmnF8PFWdD9Hw9AyjtaeT+Q9ksZFATQZ0MjE
         cruw==
X-Gm-Message-State: APjAAAX/nNIWWtpulOcgMlmvxrY2xQfkrFIW7DEZe9hC/YOGmfSky1vF
        IH1smzOtFdxEe4c5MDOnSYWRl9af
X-Google-Smtp-Source: APXvYqzbq8vsnt/ZxVug6L2aKGKy13B2+E8cOjWRyzqB4DcuvCT6C5rfYdOccD/fYQ+FijUMpbWihQ==
X-Received: by 2002:a17:90a:e38b:: with SMTP id b11mr2267659pjz.138.1569323074225;
        Tue, 24 Sep 2019 04:04:34 -0700 (PDT)
Received: from localhost.localdomain ([49.206.12.173])
        by smtp.gmail.com with ESMTPSA id z2sm2138109pfq.58.2019.09.24.04.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 04:04:33 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v8] v4l2-ctl: Print UVC meta info
Date:   Tue, 24 Sep 2019 16:34:26 +0530
Message-Id: <20190924110426.25398-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4a30b7ef-4e1e-3cef-5f7d-c75920edae7e@xs4all.nl>
References: <4a30b7ef-4e1e-3cef-5f7d-c75920edae7e@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Changes since v7:
	Not to call print_meta_buffer, if V4L2_BUF_FLAG_ERROR is set or
bytesused is 0.
Changes since v6:
	Not to print PTS/SCR if not present.
	Remove loop in print_meta_buffer()
Changes since v5:
	Use proper print format.
	split fprintf.
Changes since v4:
	Print PTS and SCR info.
---
 utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 39 +++++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 15 ++++++-----
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 75fbd6f4..eae7438f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -127,3 +127,42 @@ void meta_list(cv4l_fd &fd)
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
+	int buf_off = 0;
+
+	switch (fmt.g_pixelformat()) {
+	case V4L2_META_FMT_UVC:
+		fprintf(f, "UVC: ");
+		vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), 0);
+
+		fprintf(f, "%.6fs sof: %4d len: %u flags: 0x%02x",
+			(double)vbuf->ns / 1000000000.0,
+			vbuf->sof,
+			vbuf->length,
+			vbuf->flags);
+		if (vbuf->flags & UVC_STREAM_PTS) {
+			fprintf(f, " PTS: %u", le32toh(*(__u32*)(vbuf->buf)));
+			buf_off = 4;
+		}
+		if (vbuf->flags & UVC_STREAM_SCR)
+			fprintf(f, " STC: %u SOF counter: %u",
+				le32toh(*(__u32*)(vbuf->buf + buf_off)),
+				le16toh(*(__u16*)(vbuf->buf + buf_off + 4)));
+		fprintf(f, "\n");
+		break;
+	}
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 11157434..47b7d3f8 100644
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
 
@@ -592,6 +592,9 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
 	if (fl)
 		fprintf(f, " (%s)", bufferflags2s(fl).c_str());
 	fprintf(f, "\n");
+	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
+	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
+		print_meta_buffer(f, buf, fmt, q);
 }
 
 static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
@@ -1390,7 +1393,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 		if (!(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
 			break;
 		if (verbose)
-			print_concise_buffer(stderr, buf, fps_ts, -1);
+			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
 		if (fd.qbuf(buf))
 			return QUEUE_ERROR;
 	}
@@ -1412,7 +1415,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 	else if (buf.g_flags() & V4L2_BUF_FLAG_BFRAME)
 		ch = 'B';
 	if (verbose) {
-		print_concise_buffer(stderr, buf, fps_ts,
+		print_concise_buffer(stderr, buf, fmt, q, fps_ts,
 				     host_fd_to >= 0 ? 100 - comp_perc / comp_perc_count : -1);
 		comp_perc_count = comp_perc = 0;
 	}
@@ -1502,7 +1505,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
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

