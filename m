Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE7A369E8A
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 04:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbhDXCsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 22:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhDXCsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 22:48:21 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB51C06174A
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 19:47:44 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e9so9152505plj.2
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VpRtBwZDB1sA5d0qw3p8WQa8r6TJ3VixLSZm0++Q/jw=;
        b=Pmv0Uew/5V5Du/11J8a8j3EWwO2fHQSkjpdyaeJO9yS9A7cCSdcOeKDwiqBoAtp7RI
         4edpdw8HeDrwo3gCp27FMmg7rxuV9igovsMZsTqAB80T9UAMzYyn+YrRuPQX7KN22ZPK
         cJzkR6938FHbhxpEASooVBuH/sX5FxP9/SFqQ+zIujY1LhZbb1LbZ82RJKSVOtpVh5Oo
         6Om6j7Xmaw6SZ7HGJcfDeasI8eari3k4ZZUvXsu5koq90o5qzzl+ojLLi3hjBElpJ6HD
         8HnwMjjQ4lvyuaBtiv8fi26NtI4fRuE/PfTuVaetyza8kHP+KSo+S+De1dQU2jtd2SKi
         SDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VpRtBwZDB1sA5d0qw3p8WQa8r6TJ3VixLSZm0++Q/jw=;
        b=AgtzsCtyB+miasF2nJG5ZOsUAoiSLKvr+lkylzpGQtplhUzLNk1cqbMp5cvWmAanTG
         KO9E8I7aO8kgKGsij7TYM77Cy0a+oNH38Cw79ybiC6eyy+Co/GPYO0hV1Zj6t0ZNY/BB
         1p1LlFG3nVq0rMiGuKmiIPaH329TcD7dJJymS+JTeTLxsM/uLScMbF6kwJBcH4X3XEFq
         Z8leR/RS5EIEaU66Vg9TVsy2t5ZzONvxAYtNLnjTKmgopG0xF7A212CN+PQdeW6m2JxN
         SwVCESq3OpZdKw+CkNq18D4puqzKjGILQLdfxLhHcvLokyGj7M9hvRX4ecbnlSrKnMJd
         jIww==
X-Gm-Message-State: AOAM533ndOf5QDgdC1h94KVP2+tWZhQtjH0eEd3wFCI8DGYOhewSANVg
        OV3QKDa5WXV8nAWGB5Mds/FcsJVafpzL0g==
X-Google-Smtp-Source: ABdhPJx3f9xFXSBmE7ZxngvyoRnyDUL6gYxyaJjJMqV79ZYfbITcFJbRDl4fr7CsrzrJI6e/qzo8Iw==
X-Received: by 2002:a17:90a:fa84:: with SMTP id cu4mr7912888pjb.178.1619232462416;
        Fri, 23 Apr 2021 19:47:42 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id h2sm5534447pfv.196.2021.04.23.19.47.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 19:47:42 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] manual conversions to std::array
Date:   Fri, 23 Apr 2021 19:47:39 -0700
Message-Id: <20210424024739.83762-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210424024739.83762-1-rosenp@gmail.com>
References: <20210424024739.83762-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

std::array avoids having to decay the array into a pointer. Also allows
using the at() member function for debugging.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-follower/cec-follower.h           |  9 ++---
 utils/cec-follower/cec-processing.cpp       | 24 ++++++------
 utils/libcecutil/cec-parse.cpp              | 43 +++++++++++----------
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 19 ++++-----
 utils/v4l2-compliance/v4l2-test-formats.cpp |  4 +-
 5 files changed, 49 insertions(+), 50 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 391b9ab40..b0c9e980d 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -8,6 +8,8 @@
 #ifndef _CEC_FOLLOWER_H_
 #define _CEC_FOLLOWER_H_
 
+#include <array>
+
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
@@ -78,14 +80,11 @@ struct node {
 
 struct la_info {
 	__u64 ts;
-	struct {
-		unsigned count;
-		__u64 ts;
-	} feature_aborted[256];
+	std::array<std::pair<unsigned, __u64>, 256> feature_aborted;
 	__u16 phys_addr;
 };
 
-extern struct la_info la_info[15];
+extern std::array<struct la_info, 15> la_info;
 
 struct short_audio_desc {
 	/* Byte 1 */
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 9acaf7ec9..51eab1ae8 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -3,6 +3,7 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <array>
 #include <cerrno>
 #include <ctime>
 #include <string>
@@ -37,7 +38,7 @@ struct cec_enum_values {
 	__u8 value;
 };
 
-struct la_info la_info[15];
+std::array<struct la_info, 15> la_info;
 
 static struct timespec start_monotonic;
 static struct timeval start_timeofday;
@@ -120,8 +121,8 @@ void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
 	if (cec_msg_is_broadcast(msg) || cec_msg_initiator(msg) == CEC_LOG_ADDR_UNREGISTERED)
 		return;
 	if (reason == CEC_OP_ABORT_UNRECOGNIZED_OP) {
-		la_info[la].feature_aborted[opcode].count++;
-		if (la_info[la].feature_aborted[opcode].count == 2) {
+		la_info[la].feature_aborted[opcode].first++;
+		if (la_info[la].feature_aborted[opcode].first == 2) {
 			/* If the Abort Reason was "Unrecognized opcode", the Initiator should not send
 			   the same message to the same Follower again at that time to avoid saturating
 			   the bus. */
@@ -129,13 +130,11 @@ void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
 			     opcode2s(msg).c_str(), la, cec_la2s(la));
 			warn("replying Feature Abort [Unrecognized Opcode] to the same message.\n");
 		}
-	}
-	else if (la_info[la].feature_aborted[opcode].count) {
+	} else if (la_info[la].feature_aborted[opcode].first) {
 		warn("Replying Feature Abort with abort reason different than [Unrecognized Opcode]\n");
 		warn("to message that has previously been replied Feature Abort to with [Unrecognized Opcode].\n");
-	}
-	else
-		la_info[la].feature_aborted[opcode].ts = ts_now;
+	} else
+		la_info[la].feature_aborted[opcode].second = ts_now;
 
 	cec_msg_reply_feature_abort(msg, reason);
 	transmit(node, msg);
@@ -939,7 +938,7 @@ void testProcessing(struct node *node, bool wallclock)
 					node->state.active_source_pa = CEC_PHYS_ADDR_INVALID;
 					me = CEC_LOG_ADDR_INVALID;
 				}
-				memset(la_info, 0, sizeof(la_info));
+				la_info = {};
 			}
 		}
 		if (FD_ISSET(fd, &rd_fds)) {
@@ -962,9 +961,8 @@ void testProcessing(struct node *node, bool wallclock)
 			if (node->ignore_opcode[msg.msg[1]] & (1 << from))
 				continue;
 
-			if (from != CEC_LOG_ADDR_UNREGISTERED &&
-			    la_info[from].feature_aborted[opcode].ts &&
-			    ts_to_ms(get_ts() - la_info[from].feature_aborted[opcode].ts) < 200) {
+			if (from != CEC_LOG_ADDR_UNREGISTERED && la_info[from].feature_aborted[opcode].second &&
+			    ts_to_ms(get_ts() - la_info[from].feature_aborted[opcode].second) < 200) {
 				warn("Received message %s from LA %d (%s) less than 200 ms after\n",
 				     opcode2s(&msg).c_str(), from, cec_la2s(from));
 				warn("replying Feature Abort (not [Unrecognized Opcode]) to the same message.\n");
@@ -1016,7 +1014,7 @@ void testProcessing(struct node *node, bool wallclock)
 			transmit(node, &msg);
 			if (msg.tx_status & CEC_TX_STATUS_NACK) {
 				dev_info("Logical address %d stopped responding to polling message.\n", poll_la);
-				memset(&la_info[poll_la], 0, sizeof(la_info[poll_la]));
+				la_info[poll_la] = {};
 				node->remote_la_mask &= ~(1 << poll_la);
 				node->remote_phys_addr[poll_la] = CEC_PHYS_ADDR_INVALID;
 			}
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index fd37f5b83..f48170500 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -3,6 +3,7 @@
  * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <array>
 #include <cctype>
 #include <cstring>
 #include <string>
@@ -108,13 +109,13 @@ static __u32 *args2short_descrs(__u32 descriptor1,
 				__u32 descriptor3,
 				__u32 descriptor4)
 {
-	static __u32 descriptors[4];
-
-	descriptors[0] = descriptor1;
-	descriptors[1] = descriptor2;
-	descriptors[2] = descriptor3;
-	descriptors[3] = descriptor4;
-	return descriptors;
+	static std::array<__u32, 4> descriptors{
+		descriptor1,
+		descriptor2,
+		descriptor3,
+		descriptor4,
+	};
+	return descriptors.data();
 }
 
 static __u8 *args2short_aud_fmt_ids(__u8 audio_format_id1,
@@ -122,13 +123,13 @@ static __u8 *args2short_aud_fmt_ids(__u8 audio_format_id1,
 				    __u8 audio_format_id3,
 				    __u8 audio_format_id4)
 {
-	static __u8 audio_format_ids[4];
-
-	audio_format_ids[0] = audio_format_id1;
-	audio_format_ids[1] = audio_format_id2;
-	audio_format_ids[2] = audio_format_id3;
-	audio_format_ids[3] = audio_format_id4;
-	return audio_format_ids;
+	static std::array<__u8, 4> audio_format_ids{
+		audio_format_id1,
+		audio_format_id2,
+		audio_format_id3,
+		audio_format_id4,
+	};
+	return audio_format_ids.data();
 }
 
 static __u8 *args2short_aud_fmt_codes(__u8 audio_format_code1,
@@ -136,13 +137,13 @@ static __u8 *args2short_aud_fmt_codes(__u8 audio_format_code1,
 				      __u8 audio_format_code3,
 				      __u8 audio_format_code4)
 {
-	static __u8 audio_format_codes[4];
-
-	audio_format_codes[0] = audio_format_code1;
-	audio_format_codes[1] = audio_format_code2;
-	audio_format_codes[2] = audio_format_code3;
-	audio_format_codes[3] = audio_format_code4;
-	return audio_format_codes;
+	static std::array<__u8, 4> audio_format_codes{
+		audio_format_code1,
+		audio_format_code2,
+		audio_format_code3,
+		audio_format_code4,
+	};
+	return audio_format_codes.data();
 }
 
 int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index e515fea48..5b0c5452b 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -36,8 +36,8 @@ static cv4l_fmt cur_fmt;
 static cv4l_fmt cur_m2m_fmt;
 static int stream_from_fd = -1;
 static bool stream_use_hdr;
-static unsigned max_bytesused[VIDEO_MAX_PLANES];
-static unsigned min_data_offset[VIDEO_MAX_PLANES];
+static std::array<unsigned int, VIDEO_MAX_PLANES> max_bytesused;
+static std::array<unsigned int, VIDEO_MAX_PLANES> min_data_offset;
 
 bool operator<(struct timeval const& n1, struct timeval const& n2)
 {
@@ -60,7 +60,7 @@ struct buf_seq {
 
 static struct buf_seq last_seq, last_m2m_seq;
 
-static int buf_req_fds[VIDEO_MAX_FRAME * 2];
+static std::array<int, VIDEO_MAX_FRAME * 2> buf_req_fds;
 
 static inline int named_ioctl_fd(int fd, bool trace, const char *cmd_name, unsigned long cmd, void *arg)
 {
@@ -845,7 +845,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 		cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
 		unsigned &capture_count)
 {
-	static constexpr const char *pollmode_str[] = {
+	static constexpr std::array<const char *, 3> pollmode_str{
 		"",
 		" (select)",
 		" (epoll)",
@@ -1677,8 +1677,8 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 			}
 		}
 		// captureBufs() will update these values
-		memset(max_bytesused, 0, sizeof(max_bytesused));
-		memset(min_data_offset, 0xff, sizeof(min_data_offset));
+		max_bytesused = {};
+		min_data_offset.fill(0xff);
 
 		fail_on_test(setupUserPtr(node, q));
 
@@ -2900,9 +2900,10 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
 		return;
 	}
 
-	v4l2_selection *selections[2][4] = {
-		{ &min_crop, &max_crop, &min_compose, &max_compose },
-		{ &min_compose, &max_compose, &min_crop, &max_crop }
+	using sel = std::array<v4l2_selection *, 4>;
+	std::array<sel, 2> selections{
+		sel{ &min_crop, &max_crop, &min_compose, &max_compose },
+		sel{ &min_compose, &max_compose, &min_crop, &max_crop },
 	};
 
 	selTest test = createSelTest(node);
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 3761b1fa9..0ef89544c 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -27,7 +27,7 @@
 #include "compiler.h"
 #include "v4l2-compliance.h"
 
-static constexpr __u32 buftype2cap[] = {
+static constexpr std::array<__u32, 15> buftype2cap{
 	0,
 	V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_M2M,
 	V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_M2M,
@@ -1095,7 +1095,7 @@ int testSetFormats(struct node *node)
 {
 	struct v4l2_clip clip, clip_set;
 	struct v4l2_format fmt, fmt_set;
-	struct v4l2_format initial_fmts[V4L2_BUF_TYPE_LAST + 1];
+	std::array<v4l2_format, V4L2_BUF_TYPE_LAST + 1> initial_fmts;
 	int type;
 	int ret;
 
-- 
2.30.2

