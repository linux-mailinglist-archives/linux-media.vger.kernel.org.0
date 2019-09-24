Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4212BBC414
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 10:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438553AbfIXIZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 04:25:23 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:41832 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404719AbfIXIZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 04:25:23 -0400
Received: by mail-pf1-f172.google.com with SMTP id q7so864141pfh.8
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QPprM5XRE21W/q9fNEzjr43X5b5MJ6+Cb7aMnW2g7t0=;
        b=Z5LpGtGAqS5drR97t7qgsATBuIPzq42byDiWaBm3SI8B/V638sysqI8qnZCCbwAnLl
         UHe9jK7GLSIAjBi8EdS+KRtCJOb6mtx/b7kmxcxtp5ZOGUbz5ASEQh4YbhOBYPVhwrT7
         +pVe76RK3Mqsn70i+rXEMZK18X8PhGqTO+liCOltZCrmpnk2EEy8/1HAOkZi50iibiIl
         vyGhn1Fuv0QinXFxx7naw+CL2SDtPSPopuzakoKzMXQBL6PPZa+4ERGwxdLyX5A6lufb
         PSg0mXGepHepK0PuHQ7zQCYlDDhCD0wWC7765IixDfQnMfsRGMAnh6CVhqedP6wSYe/Y
         5hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QPprM5XRE21W/q9fNEzjr43X5b5MJ6+Cb7aMnW2g7t0=;
        b=BeFgiDjmfx6Mje9k4fDlAmK/8ELbBoKWF3WXCMR9jgg4K4fT7X21MNfXbnT+6Z9iaa
         94vOs6ELXqRk6bou3ACUdy1TkaOovblxq1HZ5pD8tNYbLgwxz1lcgR/mB7idR8dFmGsD
         sKXvloY4jveinZ1AsXzCt32hnTbdWsFfSYhi0xFfRmApSY+jWwu2pCtda9zKd1scqOs1
         aZ+jo/zkW7E2rtikj4ckIwFWdfVmlyOL2ftW27X4TvpS1HJ4x/FLFXji83bi12YEfcSB
         DzaUq9e0lEP63sdcPyg1AdMWwPRTRahhPHhifp8r74MZlEt8lvCCht/prPP3q0fYa5NV
         UN5A==
X-Gm-Message-State: APjAAAXFCwgqbYHT7/+ryDVddo7i4aSeN8AkKjEtsqyJWmNNgBD9IQ9P
        5w8bVSmeKz1ShYdue5QXRz/6wFlH
X-Google-Smtp-Source: APXvYqxzkO2SZBdEHQ/vVD/CyVneYGysyyxNzRpI2GZxwGMVZ1CzyD8zSYh7QUQZUxKPt7ohcoIKOw==
X-Received: by 2002:a17:90a:154f:: with SMTP id y15mr1676064pja.73.1569313520507;
        Tue, 24 Sep 2019 01:25:20 -0700 (PDT)
Received: from localhost.localdomain ([49.206.12.173])
        by smtp.gmail.com with ESMTPSA id e14sm3550131pjt.8.2019.09.24.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 01:25:20 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v6] v4l2-ctl: Print UVC meta info
Date:   Tue, 24 Sep 2019 13:55:10 +0530
Message-Id: <20190924082510.16101-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f1feb1c1-8b2c-6751-c879-fdd4d4c8adf5@xs4all.nl>
References: <f1feb1c1-8b2c-6751-c879-fdd4d4c8adf5@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Changes since v5:
	Use proper print format.
	split fprintf.
Changes since v4:
	Print PTS and SCR info.
---
 utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 45 +++++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 +++++----
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 75fbd6f4..a353a2be 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -127,3 +127,48 @@ void meta_list(cv4l_fd &fd)
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
+			fprintf(f, "%.6fs sof: %4d len: %u flags: 0x%02x ",
+				(double)vbuf[i].ns / 1000000000.0,
+				vbuf[i].sof,
+				vbuf[i].length,
+				vbuf[i].flags);
+			fprintf(f, "PTS: %u ",
+				(vbuf[i].flags & UVC_STREAM_PTS) ?
+				le32toh(*(__u32*)(vbuf[i].buf)) : 0);
+			fprintf(f, "STC: %u SOF counter: %u",
+				(vbuf[i].flags & UVC_STREAM_SCR) ?
+				le32toh(*(__u32*)(vbuf[i].buf + buf_off)) : 0,
+				(vbuf[i].flags & UVC_STREAM_SCR) ?
+				le16toh(*(__u16*)(vbuf[i].buf + buf_off + 4)) : 0);
+			fprintf(f, "\n");
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

