Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C554DA66F5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 12:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbfICK6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 06:58:50 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:39467 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbfICK6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 06:58:49 -0400
Received: by mail-pf1-f181.google.com with SMTP id s12so3553552pfe.6
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xvdnoIXIl2P7LgvY+i9qT9JkYAAePkukI+m7FCO8q1E=;
        b=EwuBj4O2xS0jClWxWySyRRVEMCmx6Zgm/bVQVglWuC8R/e2RE8akXDqtyBM+Z6ZjWq
         y1p4YZ22ktO4C7hoklYRY2CtwmezNWBUNjp8vzvIYqZpMwfKjo7YV07cREHvSe53EkCF
         N3O5oHJEkkDmAJ5aJFEG+Og2e4nicPabxOT/OQLKLMFM4Ioni1TDbbYjkrshHUqg/f8D
         8znLl0zs60kAXChDCfujajzSzzWJ3pgOqPO64pHgh8D0sGW7Ze4B3PWvJvAqV5rP1lzV
         k6676PoK7EwOZ2rLa5yiccfiYmvtYkgqThIzkqw39SEqXwWw2joU9K5ukaCKyNLJCQEq
         c6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xvdnoIXIl2P7LgvY+i9qT9JkYAAePkukI+m7FCO8q1E=;
        b=kwlSktXT0zta1pOlnD2jqqrFeD+w4gXzePc32x9YIB9DDQR5khhTTJecLg3R0YpTP2
         PbMKDOHMo9bDF1HyRYjX+tl2cZs78KwBArI+KJ94Tvovicr7KEdLHcxMZEK7lp93d92t
         tjAszglD6XdThjs85vsOmlcBiDAd7O4OhA69IBofoLdseqZKLoh5jFapFpikqJDkw2hn
         sWdrbnTvk2nJ7f+EvaiTGP+De3usjqBmSJwqLakK0ObODiDv6fPtNCwc5GFgShwpkxbf
         HyEXxJ07aayfKyfX0TGow2K9IM28RAU+pZJVrsmt60h7Gf+GV98iAqdkTUtkvDFyYSHD
         wM3g==
X-Gm-Message-State: APjAAAXaT1QperYKuSbOimK5G2NwFeKzWlw6nl0ppBZqfy0izHC6uq/I
        TflN6PZNYnCl2A7wZpbHvA76SjqeNQs=
X-Google-Smtp-Source: APXvYqyqElJTx8EFKHAPyRi8wmWBQesjWbV4JJScgYVl1qi3AO2fDJraoomatrs+8vqfHtQqYPScjA==
X-Received: by 2002:a62:e802:: with SMTP id c2mr3798783pfi.212.1567508328618;
        Tue, 03 Sep 2019 03:58:48 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([61.1.208.92])
        by smtp.gmail.com with ESMTPSA id 2sm13168025pfa.43.2019.09.03.03.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 03:58:47 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] v4l2-ctl: Print UVC meta info
Date:   Tue,  3 Sep 2019 16:28:39 +0530
Message-Id: <20190903105839.4182-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print UVC Metadata information in verbose mode.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 20 ++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 ++++++++------
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index 75fbd6f4..f1003604 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -127,3 +127,23 @@ void meta_list(cv4l_fd &fd)
 		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
 	}
 }
+
+static struct vivid_uvc_meta_buf {
+	__u64 ns;
+	__u16 sof;
+	__u8 length;
+	__u8 flags;
+	__u8 buf[];
+} __packed;
+
+void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	struct vivid_uvc_meta_buf *vbuf;
+	if (fmt.g_pixelformat() == V4L2_META_FMT_UVC) {
+		fprintf(f, "META format V4L2_META_FMT_UVC:");
+		for (unsigned i = 0; i< buf.g_num_planes(); i++) {
+			vbuf = (vivid_uvc_meta_buf *)(q.g_dataptr(buf.g_index(), i) + buf.g_mem_offset(i));
+			fprintf(f, "ns %llu sof %u, len %u, flags 0x%x\n",vbuf[i].ns, vbuf[i].sof, vbuf[i].length, vbuf[i].flags);
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

