Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31FBBFDEDF
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 14:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfKONXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 08:23:39 -0500
Received: from mail-pl1-f178.google.com ([209.85.214.178]:41645 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbfKONXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 08:23:38 -0500
Received: by mail-pl1-f178.google.com with SMTP id d29so4656122plj.8
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2019 05:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pgVwOKXdBxpVIsWtFUNaeMooBpQ0Czz3JGiOc0p3syQ=;
        b=f3JyzqWIWISfVM2kIl2q60olep6gMOZ8/Xjj0L4k96zY+5Slv26VMdQ9wD/whlUCsE
         061xSz9RZ/2WgA5r69GZth2ZkxrpDtyhaMQaMKr1/zvpcecR/PhJSP6uW9cj26yESRHn
         XnXu/jKMIf1ISZ1mIoO8r8opxf6Qr/8YzJwYZzDjSfp0BZT1Y9zMaPJNp1IkwGmpnKTD
         OfiH32LXw70GerMpBxhcm/6BORkaCqmVugGiE/X2dUoBQZcuLZ4o6hPapf+LdBRuTC6+
         brcTWhxkFM8kocCI9+iqQ+JJRKO1OA019fRAfYsf+RqcYiHL09o6ZGSm7Lf8Qsu/BFvc
         IVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pgVwOKXdBxpVIsWtFUNaeMooBpQ0Czz3JGiOc0p3syQ=;
        b=IkFrY31ihJ63KJmt3T3aDxmh2khcTnN41/pwujCBa3wC//Qn+yF7fupbJER29H/MIW
         oKB7Nhihp5vc5rhAX19kIAl1f8vGqdbR/DCo2iftXJ4ND85Bmasb5sjYHJHa7I3ZYMFQ
         zgSCrldXIqsSa02SLVePst/Tdqr0i0HR4/+zvyoYqTk80+12hy7oL0tGgyeuxRdxSCIS
         ND1LZU1PyVRpn0NnvZyMFT1NC6y9LEuJ9YxY1fMMp4cxtjqgNT/M6J4thYSXq8yxOQnq
         4LLjJOo+10V5Iy9PZU9tQsO3EXrZrzd/ZDm9TcDgIQqKpFnS3tXcc3j8Ab5yJbniLaEI
         05Jw==
X-Gm-Message-State: APjAAAWp1N5FjFlnp64g8Q252aAgvll9fPpzDcDlD6XefKEcfgb8cxGR
        NUqYrk7Q3uXI7v2NoLZZgWcWUeDHCKc=
X-Google-Smtp-Source: APXvYqz7a1gH9pYbWwJ/Rp7eo099nSP3XzqJpGbcxOpbqyF57nyZFCG8AyqQihllziMtm0zaRRpm+w==
X-Received: by 2002:a17:902:aa42:: with SMTP id c2mr14812186plr.311.1573824217658;
        Fri, 15 Nov 2019 05:23:37 -0800 (PST)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.201.122])
        by smtp.gmail.com with ESMTPSA id x192sm12727910pfd.96.2019.11.15.05.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 05:23:37 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v3] v4l2-ctl:Add Support for Touch
Date:   Fri, 15 Nov 2019 18:51:48 +0530
Message-Id: <20191115132148.18729-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191113112336.31324-1-bnvandana@gmail.com>
References: <20191113112336.31324-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to verify V4L2_TCH_FMT_TU16 format touch inputs.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  4 ++++
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp    | 22 ++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 27 insertions(+)

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
index 3a29251a..af96afdc 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -358,3 +358,25 @@ void vidcap_list(cv4l_fd &fd)
 		}
 	}
 }
+
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	__s16 *vbuf = NULL;
+	__u32 x, y, index;
+
+	switch (fmt.g_pixelformat()) {
+	case V4L2_TCH_FMT_DELTA_TD16:
+		vbuf = (__s16*)q.g_dataptr(buf.g_index(), 0);
+		fprintf(f, "TD16:\n");
+		if (fmt.g_width() < 64 ||  fmt.g_height() < 64) {
+			for (y = 0; y < fmt.g_height(); y++) {
+				for (x = 0; x < fmt.g_width() ; x++) {
+					index = x + fmt.g_width() * y;
+					fprintf(f, "%-3d ", vbuf[index]);
+				}
+				fprintf(f, "\n");
+			}
+		}
+		break;
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

