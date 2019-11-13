Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A279FAF99
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 12:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfKMLXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 06:23:44 -0500
Received: from mail-pl1-f178.google.com ([209.85.214.178]:39076 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfKMLXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 06:23:43 -0500
Received: by mail-pl1-f178.google.com with SMTP id o9so950153plk.6
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2019 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/5q/tKZi2bs3fkBvlcWHKDLoKKu/+gpoKgj6/JmFfcM=;
        b=o9RGsyzZf5bWUQidpmYVtvr8C3fUUt3F6+Sx2ESnob9oSUFOMpF3UYVxcEKSQywKgp
         8gMDOeM8xXl6uqXMr4JQGioBcLBBtdQG5Ko2Z+IEA5eVm99/XWRwaayTgjnWeICevrpC
         cYUNkQjxC7tr3xXY+bZYFLQ7DA2/BItbmXgi3VkbLNfMyZ5l914waAI8PSrDgjRPfdtl
         AVbJ2mTrSLRXUBQU8FVb74R1jgoPdOxO7h0GJBINLAQuQ4ompV2jvwvcRgYnB+cVLiRa
         VltZcSD6gFoLzmGN7dG+XYIOD+3SFqO+2E13i0jHDWNNdYgV70cq2ETP+t+xq6lTJ6Bs
         6o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/5q/tKZi2bs3fkBvlcWHKDLoKKu/+gpoKgj6/JmFfcM=;
        b=IJ5l0+RGlteWpG7p5d8/PPsZOClQoz+NWGowsWKIRozuIO7ndsuNcDASPKBtxw4PVp
         7lb6G+8o0AmNNsyARMt4Hf6bsZXfpBj+3DO5kM0beB3Vc5oXPYXcRuwyFMc4oInDQzxG
         OB9K3MNXTartsxObQQk+KQzQSxykMKVD23ESiqCGDXkSxDjEJCR1PZB/4hRmmENVT+a9
         Q2KLkDoDoqaHL5MjMwkiQPSs+NZbAZLUWaugq+js146xTLusobh4AMxpj0sBkPB4XRl/
         fOBaEDHkU0R2lhvduoDPslIqfhUzTGiB8kHiN3t6iE8G6ksSVEejK1pQ1a4KnSOUor9U
         wIcw==
X-Gm-Message-State: APjAAAWY9tHZooSWQvEdB9DhfZAbjuKfnOkknHI0AeNm9lJLC3oMGvNE
        9cmGalej3s9udNRyrCMGnO2J8qfRsK4=
X-Google-Smtp-Source: APXvYqx+wsTWqppM5YRE4Wwz5OHPIJt5DshpBmm1VAucT20INGTGDFv1+IwfRhGf3J3dzSNBAsAP5g==
X-Received: by 2002:a17:902:7d90:: with SMTP id a16mr3183317plm.149.1573644222769;
        Wed, 13 Nov 2019 03:23:42 -0800 (PST)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.248.68.227])
        by smtp.gmail.com with ESMTPSA id k20sm3108117pgn.40.2019.11.13.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 03:23:42 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] v4l2-ctl:Add Support for Touch
Date:   Wed, 13 Nov 2019 16:53:36 +0530
Message-Id: <20191113112336.31324-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108071227.10982-1-bnvandana@gmail.com>
References: <20191108071227.10982-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to verify V4L2_TCH_FMT_TU16 format touch inputs.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  4 ++++
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp    | 25 +++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl.cpp           |  6 ++++++
 utils/v4l2-ctl/v4l2-ctl.h             |  2 ++
 4 files changed, 37 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 184bfd64..e85f8833 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -595,6 +595,10 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
 	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
 	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
 		print_meta_buffer(f, buf, fmt, q);
+
+	if (is_vivid && (capabilities & V4L2_CAP_TOUCH) && buf.g_bytesused(0) &&
+	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
+		print_touch_buffer(f, buf, fmt, q);
 }
 
 static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 3a29251a..500cb587 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -358,3 +358,28 @@ void vidcap_list(cv4l_fd &fd)
 		}
 	}
 }
+
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	__u16 *vbuf = NULL;
+	__u32 i=0;
+	bool val = false;
+
+	switch (fmt.g_pixelformat()) {
+	case V4L2_TCH_FMT_TU16:
+		vbuf = (__u16*)q.g_dataptr(buf.g_index(), 0);
+		fprintf(f, "TU16: ");
+		for (i = 0; i < (fmt.g_width() * fmt.g_height()); i++) {
+			if (vbuf[i]) {
+				fprintf(f, "Pressure Value: %d @ %dx%d\n",
+					vbuf[i],
+					i % fmt.g_width(),
+					i / fmt.g_height());
+				val = true;
+			}
+		}
+		if (!val)
+			fprintf(f, "\n");
+		break;
+	}
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index aa4742c5..da8c3c40 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -66,6 +66,7 @@ unsigned out_priv_magic;
 bool is_multiplanar;
 __u32 vidcap_buftype;
 __u32 vidout_buftype;
+bool is_vivid;
 
 static struct option long_options[] = {
 	{"list-audio-inputs", no_argument, 0, OptListAudioInputs},
@@ -1111,6 +1112,7 @@ int main(int argc, char **argv)
 	int media_fd = -1;
 	bool is_subdev = false;
 	std::string media_bus_info;
+	std::string driver;
 
 	/* command args */
 	int ch;
@@ -1334,6 +1336,10 @@ int main(int argc, char **argv)
 		fprintf(stderr, "%s: not a v4l2 node\n", device);
 		exit(1);
 	}
+
+	driver = (const char *)vcap.driver;
+	is_vivid = driver == "vivid";
+
 	capabilities = vcap.capabilities;
 	if (capabilities & V4L2_CAP_DEVICE_CAPS)
 		capabilities = vcap.device_caps;
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b0f65e9b..fca17c97 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -275,6 +275,7 @@ extern bool is_multiplanar;
 extern __u32 vidcap_buftype;
 extern __u32 vidout_buftype;
 extern int verbose;
+extern bool is_vivid;
 
 typedef struct {
 	unsigned flag;
@@ -373,6 +374,7 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt);
 void vidcap_set(cv4l_fd &fd);
 void vidcap_get(cv4l_fd &fd);
 void vidcap_list(cv4l_fd &fd);
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 
 // v4l2-ctl-vidout.cpp
 void vidout_usage(void);
-- 
2.17.1

