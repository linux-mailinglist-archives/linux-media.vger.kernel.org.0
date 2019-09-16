Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D877EB3C62
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 16:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388606AbfIPOTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 10:19:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45740 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbfIPOTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 10:19:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id 4so68589pgm.12
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HhowQUhv2MiXlBN/MKF1q05xJB4aSnd2c5oQ0zNX654=;
        b=BgPV+UUdv+1lRGVGeZviivRdujCKh5VbB9nsFCIZNfsdba5dqjcRO4RAoGX1ZVwo1W
         t8MgWbpqVSTyQXI5glTvDj+P0dxXv7NoIMDbto8MTuhDEIiqwm4qULYvRmVkmAcqf9n9
         8409HJadWd1FvHYl1IYkgFJsZN+83jvIY+w3tPjjTy0hKO6nGmoBPHSWLTzCoRLx6SQ/
         IOk1Vb2J0LtSuvygs74Kq7yCjhkEnoF1gxWGzGYi1V9oOReN0PHwvE1BNzyTdsrhe7gR
         308AmtV/go46UJcnapZcqUQd/K4n6ROHEzGttW1xFoFRS7kzCVQjsoftJ3CLlkCh2q0K
         tSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HhowQUhv2MiXlBN/MKF1q05xJB4aSnd2c5oQ0zNX654=;
        b=rCdDkPMSaRtlKhiZSCwQJjeX4AX4E/PsSyJBgQlDJSzjQzUXd3o4AdJdMqjpYvhwss
         hX37myI1y4NL/2hRw1JPUnTJ2eaJXVWuE3EhbZGPLXhT6AJsNRXlN13vrKZIDDPxzckg
         1SqiaBZl/o8CSLsh4OB2Hak1lqTTioS5Nq7+JEln3rewCy0RH9f1Pkynjty/gEQte5YO
         2WM7Kw8VPsnIRqeOH9f3dag/zRi0Nm9OQYE9k/1ZPiNyx+Q6vKdUnGNp9LJVFYJMt3Lg
         VtmcnPpzFpp/UoAi7ly+A12LKxfJrVXk8KZ+LSg+IcFRaqvjtT9TFedrrVhaKolg15Us
         l0zg==
X-Gm-Message-State: APjAAAUxfS9CRTx6RSHy+W1w2Eroe6sO3w2k5LVfCX5VgtQqF4LvepV7
        I6aRy3pT3n7FoxiLRruWDa3npamK350=
X-Google-Smtp-Source: APXvYqwgTqsp2X43IHpETEzMkHoM5IZ4RyrHy9ZdwVEdsfNS2N+07g/v4EA2ND0WKIzSM7wlqF+WGQ==
X-Received: by 2002:a65:614a:: with SMTP id o10mr55433865pgv.407.1568643547704;
        Mon, 16 Sep 2019 07:19:07 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.193.27])
        by smtp.gmail.com with ESMTPSA id v32sm369559pga.38.2019.09.16.07.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:19:07 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] v4l2-ctl: Print UVC meta info
Date:   Mon, 16 Sep 2019 19:49:00 +0530
Message-Id: <20190916141900.22491-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c1351836-c3a3-e8ac-ff2a-871a57788de1@xs4all.nl>
References: <c1351836-c3a3-e8ac-ff2a-871a57788de1@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Changes since v1
- Removed static form type declaration of structure vivid_uvc_meta_buf.
- to print time in seconds.
- extract vivid_uvc_meta_buf properly from buf.
---
 utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 22 ++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 ++++++++------
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 75fbd6f4..bee0eed0 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -127,3 +127,25 @@ void meta_list(cv4l_fd &fd)
 		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
 	}
 }
+
+struct vivid_uvc_meta_buf {
+	__u64 ns;
+	__u16 sof;
+	__u8 length;
+	__u8 flags;
+	__u8 buf[];
+};
+
+void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	struct vivid_uvc_meta_buf *vbuf;
+	if (fmt.g_pixelformat() == V4L2_META_FMT_UVC) {
+		fprintf(f, "UVC: ");
+		for (unsigned i = 0; i< buf.g_num_planes(); i++) {
+			vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), i);
+			fprintf(f, "ns %6fs sof %u, len %u, flags 0x%x\n",
+				(double)vbuf[i].ns / 1000000000.0, vbuf[i].sof,
+				vbuf[i].length, vbuf[i].flags);
+		}
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

