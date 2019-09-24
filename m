Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0EEBC495
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbfIXJOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 05:14:35 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:35742 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfIXJOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 05:14:35 -0400
Received: by mail-pl1-f182.google.com with SMTP id y10so733840plp.2
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c9rNOLDZHMaU7jeteSqn2iCD1v2CTjOm6evPHpx18jU=;
        b=NUEl8Cm+jsCoALoY65vNxvgCn64KQaaR6ejXkrOuiF1UtF3Gz5BE8wf48wDTKZvleS
         vAJxcRoPM2NMTYpsKUE0g5lrDas2YhzIIc0iJzehiLHtmSgFCXSkcFLF/1hPhzM3Ej6V
         gFWgiH+KVxurFAvYRtMsMpN8PVhxKyme/y9DW7/D/TFykx9kXYRkqvBYG72SfV8N28IA
         hNowAX+PUKMtp8GrdbOd1b4ziQrVBrfO1fDil+rBxBMyrmGRF+pDhQgacZjtd+E4bK0q
         RIAvq3oIGmEWsHX9tnPu0j09kqaVT8qK/e0wKwFHboyHZDFibilECnKwXn7greNRP/li
         8XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c9rNOLDZHMaU7jeteSqn2iCD1v2CTjOm6evPHpx18jU=;
        b=Sivk6N4ESZqbvV0ILkV27UAnI2253o6FlYrvhTB0zhx/G558CT1BQTch8fynsytO+G
         Ru94FeStXKF8lxQaD1IksbLgY+xIZdjROxjnoeLiU1iYYp9jd9ojsGzGZxJanVEEMa/n
         jiIpLnNM9Jk9MvJ/RtmJ758xDPRfc+BqywMvKR2pwD+BsgWdIfHW3L0zK3r8lYQUgd9D
         JSJ82Sd3FHYOAzIa/74fJVXVhWSc55LwzK47TKb6JaZU7FWTDds4FZhFt98OxiWzPQuh
         Tk5tKWYJyAeAScP5CN3Ku86iL8nYO7KpabOr5O9hZYmWlPMUpXsUBTX3aybJ7LPcWwkI
         Puug==
X-Gm-Message-State: APjAAAVQlEDnVaXinvE7yOW5YT7+pBL1gzWw2Yxm40jR1PO9etEBfZjo
        E1xk4iOdC1B+Fpbxbm4id2MIAMDB
X-Google-Smtp-Source: APXvYqwlh38yIl5WThsXfjbr+r3N9Jcm6V5QfnRR83evSdrZv+sTiJbyk8EcVC7Npetayi7nlAhx6w==
X-Received: by 2002:a17:902:8b83:: with SMTP id ay3mr1752011plb.143.1569316472406;
        Tue, 24 Sep 2019 02:14:32 -0700 (PDT)
Received: from localhost.localdomain ([49.206.12.173])
        by smtp.gmail.com with ESMTPSA id 197sm1480128pge.39.2019.09.24.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 02:14:31 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v7] v4l2-ctl: Print UVC meta info
Date:   Tue, 24 Sep 2019 14:44:26 +0530
Message-Id: <20190924091426.17530-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <215f6e47-84ec-8c63-713b-b30b81f90c18@xs4all.nl>
References: <215f6e47-84ec-8c63-713b-b30b81f90c18@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
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
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 +++++-----
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 48 insertions(+), 6 deletions(-)

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

