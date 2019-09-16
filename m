Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8EBB3FE5
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 20:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389181AbfIPSA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 14:00:58 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:44226 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfIPSA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 14:00:58 -0400
Received: by mail-pf1-f182.google.com with SMTP id q21so355848pfn.11
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=f3YP3NWM7Yc0CMLe47qAfGmPjD+YL+M4pFZbKHLGic8=;
        b=cWB5z+5PAyP3ot/ShG+Zec7FBGJqsfvdKyeGaTdf10Kzx/i3MMbhTPM82kyJMHIEkM
         X2QnwYKEDM/eHHwSOLNF1rLtFwnHIkDuY4U4lM8w0L0648R5FmvVAVfXC3sO9FAfDI7/
         gt29qhW4EzlPGCyozf652NfBDCOub/62AHPVyXMhaBU3Q2q8OY+Nl8hwsOlphVgaJVuj
         6pi91lrUSekVWxST+ZRQSJ4M//41evNrduBkHXozNzc5r3lUH9XO9zXSgFbTaeQ3jauw
         DlLXi4VPaarikL71pa1axGv1LQCCtl/gOiR1g4IiNfk5S7Qh4xYkFAChcTHKvjTq48KN
         aA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=f3YP3NWM7Yc0CMLe47qAfGmPjD+YL+M4pFZbKHLGic8=;
        b=gEBxQ+CdoON+gmz59Ns3G+/uh0tQtHjKE+tBUvsjA4msZJ/QO8BCbrPP7jQkbc1h0E
         80+xd61E/TOUIgetg5vg/i3BOURyJpKdQndEIt1r4KyAWA8NnPdMlf3dToM5oGhvTL09
         x4dG27EiFvqWDJMll2JR9G/RDDm3bRg+/UDV4OlCza47b9w2ckkP4Pnf1z4GJnBzkGeB
         xB1d5EYIHCeiQTo5qPq2Lk4ixMEOygWiY4JDYML+2sF6i4z6NFtLIrZHw6xfo8uOzKCC
         C6DnesVeNJpuFhr8yL1k5VziQwF/TFsCNBf1UcgwRW8Vu2E/jL4zS+Of4OMAwGzKEuhb
         E22w==
X-Gm-Message-State: APjAAAXY/AM4kJ+WOmbHOdwwbiuNK+3NfBAXHA4rg82EbItVHFfjY0OZ
        o3OPWo4fZyNNCbTeWQHMJ379VuPKtkA=
X-Google-Smtp-Source: APXvYqwta4XmbgUokZCY0NJ9bPlaIEg5Uktrunl3Q/XlG3QzQtXuzMYTMxDZqzAqu28Unx2FkyF1GA==
X-Received: by 2002:a63:1045:: with SMTP id 5mr329190pgq.165.1568656856685;
        Mon, 16 Sep 2019 11:00:56 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.193.27])
        by smtp.gmail.com with ESMTPSA id i6sm67812456pfq.20.2019.09.16.11.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 11:00:55 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v3] v4l2-ctl: Print UVC meta info
Date:   Mon, 16 Sep 2019 23:30:43 +0530
Message-Id: <20190916180044.25023-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <9d52d428-dbf6-0968-ab3e-761da02d45ed@xs4all.nl>
References: <9d52d428-dbf6-0968-ab3e-761da02d45ed@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Changes since v2
- Converted if to switch statement.
- Corrected format specifier in print.
---
 utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 25 +++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 ++++++++------
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 75fbd6f4..5d7b28d6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -127,3 +127,28 @@ void meta_list(cv4l_fd &fd)
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
+
+	switch(fmt.g_pixelformat()) {
+		case V4L2_META_FMT_UVC:
+			fprintf(f, "UVC: ");
+			for (unsigned i = 0; i < buf.g_num_planes(); i++) {
+				vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), i);
+				fprintf(f, "%.6fs, sof %u, len %u, flags 0x%x\n",
+						(double)vbuf[i].ns / 1000000000.0, vbuf[i].sof,
+						vbuf[i].length, vbuf[i].flags);
+			}
+			break;
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

