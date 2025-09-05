Return-Path: <linux-media+bounces-41844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840EB4584D
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3B991CC0260
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F1134F492;
	Fri,  5 Sep 2025 12:55:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1329538DDB
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076914; cv=none; b=lT3K6UFZfC/fyPaYjKdrqDPI6m4g35O6xMFInRGxfvfiqQEQJEPzwX3oBvXHDN6ntPEMllZNcSgKHNQm5pC7nxECIGHMhtV8Nrk+aGLWoW+CyHHPrF1a9bIRa3ZzOa7k4+epWu3WNo/uzTupdVlgqQoAbK0S6RshG1ITlQ8bj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076914; c=relaxed/simple;
	bh=zbZCiwnA9/n9//sJLVv/4Th1878EKKBrR6WmlWPoU3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=lvPj/G1L3yQ1YacRARvInRLklFQOXCv01KBM0/3jwydOu2jxy1yOMLyZOyx9WM1fJNaTOVOaMcdQ97uXeOp179PvoubYHQEIU/IaBGffwMyNO2gYwQCqjFKkAKxoPRIwbjHaFD591jzt4Y8ogBjGQDx8NF84Tam9TXrJ+13nmbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJFld6XblzYBS;
	Fri,  5 Sep 2025 14:19:41 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJFld3g50zQBM;
	Fri,  5 Sep 2025 14:19:41 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:19:32 +0200
Subject: [PATCH 1/3] v4l2-ctl/rds-ctl: do not set app_result if an ioctl is
 optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-opt-ioctl-v1-1-4b3ae770fc4b@cherry.de>
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
In-Reply-To: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
To: linux-media@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Some ioctls are optional and the logic around it handle it nicely,
except that doioctl (via doioctl_name) sets app_result static variable
to -1 if the ioctl fails.

However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
is possible to have those tools perform the expected task (albeit
failing to use an optional ioctl) and still report to the user that it
failed to do so.

Instead, let's add doioctl_opt which allows to NOT set the app_result
variable when the ioctl fails.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/rds-ctl/rds-ctl.cpp   | 7 ++++---
 utils/v4l2-ctl/v4l2-ctl.cpp | 4 ++--
 utils/v4l2-ctl/v4l2-ctl.h   | 5 +++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 813b4f282ff06af82845a93249d5b41bb20f361c..bcd68ed7c7c360906bd30f0df60a983e54fa8344 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -169,11 +169,11 @@ static void signal_handler_interrupt(int signum)
 	params.terminate_decoding = true;
 }
 
-static int doioctl_name(int fd, unsigned long int request, void *parm, const char *name)
+static int doioctl_name(int fd, unsigned long int request, void *parm, const char *name, const bool optional)
 {
 	int retval = ioctl(fd, request, parm);
 
-	if (retval < 0) {
+	if (retval < 0 && !optional) {
 		app_result = -1;
 	}
 	if (params.options[OptSilent]) return retval;
@@ -185,7 +185,8 @@ static int doioctl_name(int fd, unsigned long int request, void *parm, const cha
 	return retval;
 }
 
-#define doioctl(n, r, p) doioctl_name(n, r, p, #r)
+#define doioctl(n, r, p) doioctl_name(n, r, p, #r, false)
+#define doioctl_opt(n, r, p) doioctl_name(n, r, p, #r, true)
 
 static bool is_radio_dev(const char *name)
 {
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 9b5b878951495f66082f1b5b13e7a744e45ae4ce..b71b24dab9aafd3538bd2ebc5999a32a5c3c3dfa 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -312,11 +312,11 @@ int test_ioctl(int fd, unsigned long cmd, void *arg)
 	return options[OptUseWrapper] ? v4l2_ioctl(fd, cmd, arg) : ioctl(fd, cmd, arg);
 }
 
-int doioctl_name(int fd, unsigned long int request, void *parm, const char *name)
+int doioctl_name(int fd, unsigned long int request, void *parm, const char *name, const bool optional)
 {
 	int retval = test_ioctl(fd, request, parm);
 
-	if (retval < 0)
+	if (retval < 0 && !optional)
 		app_result = -1;
 	if (options[OptSilent]) return retval;
 	if (retval < 0)
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b0d42110ca0fbbf05dc3957a6fe08f426947b871..209a882fc1c8adf1dc08295fbbbe23964ce67649 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -296,7 +296,7 @@ extern int verbose;
 #define FmtSizeImage		(1L<<14)
 
 // v4l2-ctl.cpp
-int doioctl_name(int fd, unsigned long int request, void *parm, const char *name);
+int doioctl_name(int fd, unsigned long int request, void *parm, const char *name, const bool optional);
 int test_ioctl(int fd, unsigned long cmd, void *arg);
 int parse_subopt(char **subs, const char * const *subopts, char **value);
 __u32 parse_field(const char *s);
@@ -331,7 +331,8 @@ static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
 	return !fd.subscribe_event(sub);
 }
 
-#define doioctl(n, r, p) doioctl_name(n, r, p, #r)
+#define doioctl(n, r, p) doioctl_name(n, r, p, #r, false)
+#define doioctl_opt(n, r, p) doioctl_name(n, r, p, #r, true)
 
 #define info(fmt, args...) 			\
 	do {					\

-- 
2.51.0


