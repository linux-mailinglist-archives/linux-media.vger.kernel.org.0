Return-Path: <linux-media+bounces-14558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC3924D19
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 03:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44912B211D1
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 01:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8391854;
	Wed,  3 Jul 2024 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+halOqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CB621
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719969225; cv=none; b=kAmvFCZfwtCRpw0+CCLUq0Qqnv8VWy2ZgOJQo5kGIGCLcE2b8r9gOQFAM8KkJgLc+Q7Hr6MhhusKs04UMMWRocGRUhLDTHY1Rpq8rhBKII44zuor0PAs2o4kms6+etoukr/37Q6UKu5mHbC+0JBAdOR2KYRntC5Pxed5i9VeOms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719969225; c=relaxed/simple;
	bh=b0OsHdg3j9kADPdDeoyqZ9HPmvdvbETwP/fzmthP72k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGhXxP1vosuzVLP/dPtV109nPlI5a2Glk/CAqGTj+01BSP5wg0cdzZBpk9jmZ0EpgbdSPqQvrVEW1Gi2FzsK7TewXVuqF3k7TcfvGnM1F4JcLNwxgteGUqFUp8wP3ZvmnKQ9k0tUg6OIBjs7U+USxKWdbpW5qHbKFRPU/FOFoNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+halOqZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70ad2488fb1so1746844b3a.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 18:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719969223; x=1720574023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQuVI+nyWxh0tvPzTLMXLWU/aRrPafxLqMDiTKCNpuM=;
        b=M+halOqZqV7McKsBvZaB/2BdqACsCPwfCd3y1+RDeLZUF/9YVw8B/v62G40uyLi50T
         nwXbTsKrvJXY0B1GmdsuAh2eX8HEBsuKo1L1AHkY26S/WMRfud+LSJ4SZOPZ6o9LqT8j
         H272Q+lkotOZPfn8f6fOnd58en3l7mvJ54QSzwOiPCp3L2SG+iLo8Rd15Q0WDKpyGUgL
         seUiL5V1q/oAxL5kFFEA3NE2/m4Lbg0eEwvVS87dvJqmB7IjBC47Tn0aiIGegGR1XxHw
         txJoypuV6PdRSA41BjbTfHdEktcB3bGtURxdKqpyzEWHT+uA0SCafxwzwHG438zMUhFl
         F4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719969223; x=1720574023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQuVI+nyWxh0tvPzTLMXLWU/aRrPafxLqMDiTKCNpuM=;
        b=wFEAvMITQP/U3JDdtfgzsAdPNM5klgPIMY9dp42bH55AHbzA1MNLcrYgZjXP4SKkIo
         sRZmtOhrDooJRnSW5E4ujuzNoNa2pM36EdcVN3xOmKe6/JBpsFjE4qzvVTmabUEm0a1o
         4l/gQm5PZInWlc5MMr7hlNKz4diRazErA31x9e+0UwsZlywVIjWAPuV0t3VoUjJ9myNJ
         PGQ2fYYvwA7eKt+Pvvr9hEtkiQtdODs28PplQQcSVlFoGzVg1umZDprBLAWwJWH9kcH+
         KZCqm2n1B2IF1CtKHZQMPsfY39Bwt862p9mbdqs86qO9X2B6svSn1EG76CnIq2WeBaWv
         wrZQ==
X-Gm-Message-State: AOJu0YzBM4kLSQp9Uy9VLIRNRK82HiYjl1wD7GP33e3gVF2NwHuW7tsq
	/g679PrP1teViRHwS2GlIaD30oOYnQ0PsL/XVwnZRwrj074HuJFLIzCbpQ==
X-Google-Smtp-Source: AGHT+IE/u+tOn08pkWFPwa9raZjrKgfKTuqTZs1PGVOoqyeLt9CgqZTZH7LP4PedteW87HmN2T7zHQ==
X-Received: by 2002:a05:6a20:488a:b0:1be:c58a:7433 with SMTP id adf61e73a8af0-1bef6265d1amr10241492637.59.1719969222694;
        Tue, 02 Jul 2024 18:13:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb167dd71esm1979265ad.238.2024.07.02.18.13.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 18:13:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/2] v4l-utils: clang-tidy: use auto with iterators
Date: Tue,  2 Jul 2024 18:13:40 -0700
Message-ID: <20240703011340.10094-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703011340.10094-1-rosenp@gmail.com>
References: <20240703011340.10094-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found with: modernize-use-auto

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-follower/cec-processing.cpp        | 2 +-
 utils/v4l2-compliance/v4l2-test-controls.cpp | 1 -
 utils/v4l2-tracer/retrace-helper.cpp         | 3 +--
 utils/v4l2-tracer/trace-helper.cpp           | 6 ++----
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 14ee211b..9d68fa06 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -1013,7 +1013,7 @@ static void poll_remote_devs(struct node *node, unsigned me)
 
 static void update_programmed_timers(struct node *node)
 {
-	std::set<struct Timer>::iterator it = programmed_timers.begin();
+	auto it = programmed_timers.begin();
 	/* Use the current minute because timers do not have second precision. */
 	time_t current_minute = time(nullptr) / 60;
 	time_t timer_start_minute = it->start_time / 60;
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e29174ec..e87a1af9 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -845,7 +845,6 @@ static int checkVividControls(struct node *node,
 
 int testExtendedControls(struct node *node)
 {
-	qctrl_map::iterator iter;
 	struct v4l2_ext_controls ctrls;
 	std::vector<struct v4l2_ext_control> total_vec;
 	std::vector<struct v4l2_ext_control> class_vec;
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
index 8efc00f8..ea96f8ff 100644
--- a/utils/v4l2-tracer/retrace-helper.cpp
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -92,8 +92,7 @@ void add_fd(int fd_trace, int fd_retrace)
 int get_fd_retrace_from_fd_trace(int fd_trace)
 {
 	int fd_retrace = -1;
-	std::unordered_map<int, int>::const_iterator it;
-	it = ctx_retrace.retrace_fds.find(fd_trace);
+	auto it = ctx_retrace.retrace_fds.find(fd_trace);
 	if (it != ctx_retrace.retrace_fds.end())
 		fd_retrace = it->second;
 	return fd_retrace;
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 3eee20c2..9e5747a2 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -27,8 +27,7 @@ void add_device(int fd, std::string path)
 std::string get_device(int fd)
 {
 	std::string path;
-	std::unordered_map<int, std::string>::const_iterator it;
-	it = ctx_trace.devices.find(fd);
+	auto it = ctx_trace.devices.find(fd);
 	if (it != ctx_trace.devices.end())
 		path = it->second;
 	return path;
@@ -58,8 +57,7 @@ void set_decode_order(long decode_order)
 {
 	debug_line_info("\n\t%ld", decode_order);
 
-	std::list<long>::iterator it;
-	it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
+	auto it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
 	if (it == ctx_trace.decode_order.end())
 		ctx_trace.decode_order.push_front(decode_order);
 
-- 
2.45.2


