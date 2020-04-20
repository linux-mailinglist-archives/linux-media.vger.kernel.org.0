Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F4F1B1515
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbgDTSrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgDTSq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:57 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF736C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:57 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q18so1975593pgm.11
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dbc6bBjmOjn91LFI3iLqIf4tlnB59fgQ2kz1YMzz1Iw=;
        b=jm1pOrUqECvH7wTzwvS6uJZwmzoYl8oAtZnWNCgRJ3WqTPu22R5L9kzFqv0SFuQ1Fw
         AkdrmOmOpNvWzYm2v/cI5Pxq5/jTB+px7U6TGiXDZF6eq1wt1lijHp9Q+EjZ6SWUvjI5
         5NMiZcNXNw7xdv5hEdF8mIYcXgShT7Omm9GZ+P3aesxBE15MnfMTPFtbl6UTklBvisxm
         3Ia1UCheSIN1Am90h8V1agXmGOCNk/WXlEcpX+U9SzDAUDZMrfKq84BP0BUHnUJvEFX9
         uR1uxMRdUKYfl4jgQiw6kMVMJ17dpKkTJcTMfphOpqE/sp/jmxeSZi/+e2c95zapr8t/
         C/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dbc6bBjmOjn91LFI3iLqIf4tlnB59fgQ2kz1YMzz1Iw=;
        b=p7U5gXVY6fAOZbk0YlNnI0Jsrn5WQaGJlAAMkATwKmoqtg725UNDZv5u+R9Q2a6mLD
         6KnWKjm/kjYNIanmNmSdyNzUR2+cnH42Vi/t7F7KM+RQYQaPVpuYZgPSxSb009sv9EUn
         J3svwKL3YIAmxRM+ehnfGXJiBxmGOwjGbuRAZhm6cc2lAmRhKk/1AcqghJq4vKaHqc+M
         c3+ofbHthv1lXYENAKc5dA/FjOadDKYJ/3fsoYAip02DqszC5zc0Zb+/8RTBF1547ya4
         MgRTI9I4U3rqZgnYOPjh2TfkNaR9qpc733ziBAvczLdld4syHVSBhpwPZFvs22uC1tLQ
         ReMw==
X-Gm-Message-State: AGi0PuaCZol9uR1PD+0ZD0IUH4XtWzHU5kfoABLLVv5ENyf7LVMKnad+
        KIAe0eC2m1uWKUwtIVdc2ygGE8Wj
X-Google-Smtp-Source: APiQypKGSrtAwaGUNy5rXKy0JIuANfVfYYWAuLKRjDXxGWNfmCUWlyJPPebK5WGDzVpeV/Q+QEnKUg==
X-Received: by 2002:a62:144c:: with SMTP id 73mr18482789pfu.37.1587408417012;
        Mon, 20 Apr 2020 11:46:57 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id n8sm182443pfq.213.2020.04.20.11.46.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:56 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 6/7] utils: use bool literals
Date:   Mon, 20 Apr 2020 11:46:48 -0700
Message-Id: <20200420184649.4202-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420184649.4202-1-rosenp@gmail.com>
References: <20200420184649.4202-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's modernize-use-bool-literals

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   | 2 +-
 utils/cec-compliance/cec-test.cpp         | 2 +-
 utils/cec-ctl/cec-ctl.cpp                 | 2 +-
 utils/cec-follower/cec-follower.cpp       | 2 +-
 utils/cec-follower/cec-processing.cpp     | 2 +-
 utils/rds-ctl/rds-ctl.cpp                 | 2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp | 4 ++--
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     | 2 +-
 utils/v4l2-ctl/v4l2-ctl.cpp               | 6 +++---
 utils/v4l2-dbg/v4l2-dbg.cpp               | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index b665303e..6d07bfc9 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -1166,7 +1166,7 @@ int main(int argc, char **argv)
 			short_options[idx++] = ':';
 		}
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 
 		short_options[idx] = 0;
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 4aa54afc..a82069ad 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -889,7 +889,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	if (ret)
 		return ret;
 
-	while (1) {
+	while (true) {
 		cec_msg_init(&msg, me, la);
 		cec_msg_tuner_step_increment(&msg);
 		fail_on_test(!transmit(node, &msg));
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index be37ae3c..46cfcd80 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1863,7 +1863,7 @@ int main(int argc, char **argv)
 		if (long_options[i].has_arg == required_argument)
 			short_options[idx++] = ':';
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 		struct cec_msg msg;
 
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 12bb5f15..ab3113b6 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -331,7 +331,7 @@ int main(int argc, char **argv)
 			short_options[idx++] = ':';
 		}
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 
 		short_options[idx] = 0;
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 34b54fa3..8e3a33a2 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -885,7 +885,7 @@ void testProcessing(struct node *node, bool wallclock)
 
 	poll_remote_devs(node, me);
 
-	while (1) {
+	while (true) {
 		int res;
 		struct timeval timeval = {};
 
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 2d561481..fef2a3f1 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -757,7 +757,7 @@ static int parse_cl(int argc, char **argv)
 		if (long_options[i].has_arg == required_argument)
 			short_options[idx++] = ':';
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 
 		short_options[idx] = 0;
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index bb32bae6..39dd1aec 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -834,7 +834,7 @@ static int open_media_bus_info(const std::string &bus_info, std::string &media_d
 	while ((ep = readdir(dp))) {
 		const char *name = ep->d_name;
 
-		if ((!memcmp(name, "media", 5) != 0) && isdigit(name[5])) {
+		if ((!(memcmp(name, "media", 5) != 0)) && isdigit(name[5])) {
 			struct media_device_info mdi;
 			media_devname = std::string("/dev/") + name;
 
@@ -1519,7 +1519,7 @@ int main(int argc, char **argv)
 			short_options[idx++] = ':';
 		}
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 
 		short_options[idx] = 0;
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index de40c5ad..833263b6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2742,7 +2742,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 	if (use_poll)
 		fcntl(fd.g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
 
-	while (1) {
+	while (true) {
 		struct timeval tv = { use_poll ? 2 : 0, 0 };
 		int r = 0;
 
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 42889ef8..c0097203 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1145,7 +1145,7 @@ int main(int argc, char **argv)
 			short_options[idx++] = ':';
 		}
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 
 		short_options[idx] = 0;
@@ -1531,7 +1531,7 @@ int main(int argc, char **argv)
 			__u32 seq = 0;
 
 			fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
-			while (1) {
+			while (true) {
 				int res;
 
 				FD_ZERO(&fds);
@@ -1572,7 +1572,7 @@ int main(int argc, char **argv)
 
 			fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
 			epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &epoll_ev);
-			while (1) {
+			while (true) {
 				int res;
 
 				res = epoll_wait(epollfd, &epoll_ev, 1, -1);
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 17ab0210..dcf8200a 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -442,7 +442,7 @@ int main(int argc, char **argv)
 			short_options[idx++] = ':';
 		}
 	}
-	while (1) {
+	while (true) {
 		int option_index = 0;
 
 		short_options[idx] = 0;
-- 
2.25.2

