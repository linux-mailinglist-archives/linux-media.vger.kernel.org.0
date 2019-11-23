Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC27108007
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 19:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfKWSgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 13:36:20 -0500
Received: from mail-pg1-f172.google.com ([209.85.215.172]:36194 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKWSgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 13:36:19 -0500
Received: by mail-pg1-f172.google.com with SMTP id k13so5066952pgh.3
        for <linux-media@vger.kernel.org>; Sat, 23 Nov 2019 10:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OfIDh+EvmIwR2u9sw52JxYk9mV/z+oYaTYxXDP8ivR0=;
        b=l9uPI6NN0HCJCbgyalcT76BQxadSiF0NpKmy7MTrPt2ZW8ugY0X4hh9BedgP6Eu3dw
         ahRiiWcRrvp9qJuSbP5oFiOBkUsVh0TwCZ9sBjADH+p0HRov5m1zBBRLjKZ2aWWZmDEM
         Yw5kfJO8ZPxhL+zlD+Pc10QS5fHq6u3Y5tKznP9h5NjF5GittQk3LutSrcFbBNRm43EB
         mSz4FDWH6sbcf6/fTNxLxQci6jq4Autvms/SApV5BcHQ0Tsx3/Hi9oKaa621caBE4UBB
         MFLR1LN8E8wB4RZhPskDYh/3FX60E1T6vLIS33QODSPPPiQm5+T8aP81ZZyNUu9nxAGZ
         2qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OfIDh+EvmIwR2u9sw52JxYk9mV/z+oYaTYxXDP8ivR0=;
        b=qapgCbOwBafuudi9y3nRdvWVwUbIOtE0l448QC7I4/4u/zkOhdtuVcfTK9EQTYPKdW
         aUb5xAgKlcPPVb0pmRuaXivWVWlsxa8RJOR2qAaEzAgnM4dI3MdsaB1C9i6h0JQNUdgI
         9WTy65+ISRuUu7SsdWjJh4KDd5AWjdQ/Er0YGX/r6uWzCQ6/Cym2JhXl8O4aU1JpX+TQ
         EidSUM5sJUDH6Q7f0ZJf/Ok4+tCRklwesofWgxNBgE6HlfDOsDkobwiXsZeFSU6kO/ic
         iyTQIn77H2Skldp+QQvnfC01iVX/rDDxavG3Ix3dZhTAYcMkf/ZW7PaFH2O+xSfpxkLe
         +a1Q==
X-Gm-Message-State: APjAAAW6DFfSCOxBC0zWHXjgEjFWygBigh1N1tAmCcX10obU3IpW2z9i
        7w3oUMFr+bF17F2Fn+0vtLU=
X-Google-Smtp-Source: APXvYqwZG6fdbr68B3MWWmUZydNLjycetEHp7JSADDc5a7+V1YVP8G8KdHFDkXZeXXZqs87loj1rSA==
X-Received: by 2002:a63:5611:: with SMTP id k17mr23446551pgb.210.1574534178744;
        Sat, 23 Nov 2019 10:36:18 -0800 (PST)
Received: from localhost.localdomain ([223.186.246.249])
        by smtp.gmail.com with ESMTPSA id h9sm2725751pgk.84.2019.11.23.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 10:36:18 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v4] v4l2-ctl:Add Support for Touch
Date:   Sun, 24 Nov 2019 00:06:11 +0530
Message-Id: <20191123183611.8655-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <31f4c184-8890-cd93-8c37-36a66a71f5a3@xs4all.nl>
References: <31f4c184-8890-cd93-8c37-36a66a71f5a3@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to verify V4L2_TCH_FMT_DELTA_TD16 format touch inputs.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  5 +++++
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp    | 19 +++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl.h             |  1 +
 3 files changed, 25 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 184bfd64..47addc41 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -595,6 +595,11 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
 	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
 	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
 		print_meta_buffer(f, buf, fmt, q);
+
+	if ((capabilities & V4L2_CAP_TOUCH) && buf.g_bytesused(0) &&
+	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR) &&
+	    (fmt.g_width() < 64 ||  fmt.g_height() < 64))
+		print_touch_buffer(f, buf, fmt, q);
 }
 
 static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 3a29251a..538ece3e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -358,3 +358,22 @@ void vidcap_list(cv4l_fd &fd)
 		}
 	}
 }
+
+void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
+{
+	__s16 *vbuf = NULL;
+	__u32 x, y;
+
+	switch (fmt.g_pixelformat()) {
+	case V4L2_TCH_FMT_DELTA_TD16:
+		vbuf = (__s16*)q.g_dataptr(buf.g_index(), 0);
+		for (y = 0; y < fmt.g_height(); y++) {
+			fprintf(f, "TD16:");
+			for (x = 0; x < fmt.g_width(); x++, vbuf++) {
+				fprintf(f, "%-3d ", (__s16)le16toh(*vbuf));
+			}
+			fprintf(f, "\n");
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

