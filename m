Return-Path: <linux-media+bounces-12891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976A902A84
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2531E1C20BAB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 21:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3613C558A5;
	Mon, 10 Jun 2024 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBDHy5FM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F319495E5
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 21:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718054601; cv=none; b=k1tLpIqI47HDo9WkhuWT4PZuZh3kAFLteRaivIzOXQxznDEXusGGRFyHMswcottFXLGVVXp8KllTOJvzFoxjcDdFr3FVTET03Aa2z90PdyvQnRZFLtuejWG6DalkV9vC01p5ZYO3x+XPuUt0uMULy5SDN46+6MxuN2UATl/XXQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718054601; c=relaxed/simple;
	bh=+cSGyplobhAeVic7gsyrzQnH+xp/6ylPZeSzS13vy8Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAdmKBit/qtlClQmZDYoV+/kwi9oHg452RSeMtfvbvBDL5vfl9S1HQoIPfj5iHIrc7sjOas94c7spkokJJpK+F0uPVeov9rTgVncvV4DRzyWzob1xsGd+3F3RYLbMjMFWgnAxPd9+ePtSOi371aXt818swGB5uwX3do9PnB+Mgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBDHy5FM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3446217a12.2
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718054599; x=1718659399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmlE3rSXTN3xoriIBN5G2r0tQUuMXL8AF7PIcBXNtzU=;
        b=SBDHy5FMpy4HJ/2yp3HqhW2i3PdpsgmeGOFrOAv9It8oI/C5UaqtIZbMVq7ld6xb7p
         sp2+c9RMAxsAjBG5/RBj2DKlJ2Yg04dHL/tBw77YeaErwxsJ/sYW1Bv4jhf+PwwwYI2C
         Rv0Dgtsr0jQBh6Q/iXPt70kwRSbu1M/PLeG7kmJWkQ22Z0Y2h7SH1aRXPoYaNYf9n2Mr
         cC6at37LwDBLwwmoIW9OZuhNps4Dwtta+PD7zihARBoEqzJYWyxFDdBZ/s54LeytBaQk
         CI34xxpEWaKg2pDlOkNzD10fP/KOKzhDQBhte5wxrF2DmaYbafVynJL4ieLq6zVy8JhN
         xRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718054599; x=1718659399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmlE3rSXTN3xoriIBN5G2r0tQUuMXL8AF7PIcBXNtzU=;
        b=hchMR4azGTDitakYwAsU52n/DFOVL51o+gHclXS6saI/57QgLu2giRbi7QoblEmLk+
         i5G5uc1s+/vLrJ05WXxOemX1YTl17yVtkUveJ+ge9tx+d8zVVVawUR/NZe8Iu+dqU3lI
         Faybpb473Pwz9y9P00YlnVbTwvsjR0zZQevIVMg+dHYjONbixX4HB3x1vWBYtS0qLWzi
         LgvmcEGc4cy2lrR9ia8Ct93jQEJJHEXX3lwpVBexzMNR47htGtmeydJylaYJkfwZmYhR
         ZP8gO+wrQG5/+VqdD0gqGt/nryDzDtzwW9rZU2tXx3Wby09tPykSjQqmGr2fuzF7NkaL
         X1YQ==
X-Gm-Message-State: AOJu0Yy9sTFjDXNtKLgyrRP2S0XDhdbcAnITRy5cQdJBd+YmRbPnmnr2
	SpvxbcJgIvGoeqlaxZYQ8rqMlf/zpGW4ebDX2nOVLC0uPlcFgBs6vWan2g==
X-Google-Smtp-Source: AGHT+IFC9+u0QNqjfXUro9W0aH00K5diq81tCwfQ0zwXTW8aVtRUy76orytYdXyBRgRmVe4YQc4dBQ==
X-Received: by 2002:a17:903:950:b0:1f6:e338:348f with SMTP id d9443c01a7336-1f6e3383556mr97553675ad.3.1718054599149;
        Mon, 10 Jun 2024 14:23:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71ba3bad1sm17173935ad.218.2024.06.10.14.23.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:23:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/2] v4l-utils: fix compilation with 64-bit time_t
Date: Mon, 10 Jun 2024 14:23:09 -0700
Message-ID: <20240610212316.136612-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610212316.136612-1-rosenp@gmail.com>
References: <20240610212316.136612-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl since version 1.2.0 uses 64-bit time_t even on 32-bit. Cast to
64-bit for compatibility.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   |  3 ++-
 utils/cec-compliance/cec-test-adapter.cpp |  5 +++--
 utils/cec-ctl/cec-ctl.cpp                 | 19 ++++++++++---------
 utils/cec-follower/cec-follower.cpp       |  3 ++-
 utils/cec-follower/cec-processing.cpp     |  3 ++-
 utils/keytable/keytable.c                 |  1 +
 utils/libv4l2util/v4l2_driver.c           |  7 ++++---
 utils/v4l2-tracer/retrace.cpp             |  2 +-
 8 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 8075e1d6..df633a33 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -3,6 +3,7 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <cinttypes>
 #include <sstream>
 
 #include <fcntl.h>
@@ -279,7 +280,7 @@ static std::string ts2s(__u64 ts)
 	t = res.tv_sec;
 	s = ctime(&t);
 	s = s.substr(0, s.length() - 6);
-	sprintf(buf, "%03lu", res.tv_usec / 1000);
+	sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
 	return s + "." + buf;
 }
 
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 08c856af..7a80d17b 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -4,6 +4,7 @@
  */
 
 #include <cerrno>
+#include <cinttypes>
 #include <ctime>
 #include <string>
 
@@ -1276,9 +1277,9 @@ static int testLostMsgs(struct node *node)
 			printf("\t\tReceived messages: %d of which %d were CEC_MSG_CEC_VERSION\n",
 			       pending_rx_msgs, pending_rx_cec_version_msgs);
 		if (pending_quick_msgs < pending_msgs)
-			printf("\t\tReceived %d messages immediately, and %d over %ld seconds\n",
+			printf("\t\tReceived %d messages immediately, and %d over %" PRIu64 " seconds\n",
 			       pending_quick_msgs, pending_msgs - pending_quick_msgs,
-			       time(nullptr) - start);
+			       (uint64_t)time(nullptr) - start);
 	}
 	print_sfts(sft[1][1], "SFTs for repeating messages (>= 7)");
 	print_sfts(sft[1][0], "SFTs for repeating remote messages (>= 7)");
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 69aeb8cd..a2ffcb2b 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -6,6 +6,7 @@
 #include <algorithm>
 #include <cctype>
 #include <cerrno>
+#include <cinttypes>
 #include <cstring>
 #include <ctime>
 #include <map>
@@ -416,7 +417,7 @@ std::string ts2s(__u64 ts)
 		strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
 	}
 	secs = last_secs + t - last_t;
-	sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv_usec);
+	sprintf(buf + 14, "%02u:%02u.%06d", secs / 60, secs % 60, (int)res.tv_usec);
 	return buf;
 }
 
@@ -944,10 +945,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 		}
 		fprintf(fstore, "# cec-ctl --store-pin\n");
 		fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
-		fprintf(fstore, "# start_monotonic %lu.%09lu\n",
-			start_monotonic.tv_sec, start_monotonic.tv_nsec);
-		fprintf(fstore, "# start_timeofday %lu.%06lu\n",
-			start_timeofday.tv_sec, start_timeofday.tv_usec);
+		fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRIu64 "\n",
+			(uint64_t)start_monotonic.tv_sec, (uint64_t)start_monotonic.tv_nsec);
+		fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRIu64 "\n",
+			(uint64_t)start_timeofday.tv_sec, (uint64_t)start_timeofday.tv_usec);
 		fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_addr_mask);
 		fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
 			cec_phys_addr_exp(node.phys_addr));
@@ -986,10 +987,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 			 */
 			clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
 			gettimeofday(&start_timeofday, nullptr);
-			fprintf(fstore, "# start_monotonic %lu.%09lu\n",
-				start_monotonic.tv_sec, start_monotonic.tv_nsec);
-			fprintf(fstore, "# start_timeofday %lu.%06lu\n",
-				start_timeofday.tv_sec, start_timeofday.tv_usec);
+			fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRIu64 "\n",
+				(uint64_t)start_monotonic.tv_sec, (uint64_t)start_monotonic.tv_nsec);
+			fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRIu64 "\n",
+				(uint64_t)start_timeofday.tv_sec, (uint64_t)start_timeofday.tv_usec);
 			fflush(fstore);
 			start_minute = now;
 		}
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index a7481aea..9b29e3c6 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -3,6 +3,7 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <cinttypes>
 #include <cstring>
 #include <ctime>
 #include <sstream>
@@ -354,7 +355,7 @@ void print_timers(struct node *node)
 			printf("source: %s, ", source.c_str());
 			if (t.recording_seq)
 				printf("rec-seq: 0x%x, ", t.recording_seq);
-			printf("needs: %ld %s\n", t.duration, "MB."); /* 1MB per second. */
+			printf("needs: %" PRIu64 " %s\n", (uint64_t)t.duration, "MB."); /* 1MB per second. */
 		}
 		printf("Total media space available for recording: ");
 		if (node->state.media_space_available >= 0)
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 3b5c3ce5..cc38f143 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -6,6 +6,7 @@
 #include "linux/compiler.h"
 
 #include <cerrno>
+#include <cinttypes>
 #include <ctime>
 #include <string>
 
@@ -74,7 +75,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
 	t = res.tv_sec;
 	s = ctime(&t);
 	s = s.substr(0, s.length() - 6);
-	sprintf(buf, "%03lu", res.tv_usec / 1000);
+	sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
 	return s + "." + buf;
 }
 
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index a726921a..ba7c7c4d 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -214,6 +214,7 @@ static enum sysfs_protocols parse_sysfs_protocol(const char *name, bool all_allo
 	return SYSFS_INVALID;
 }
 
+__attribute__((format(printf, 3, 0)))
 static void write_sysfs_protocols(enum sysfs_protocols protocols, FILE *fp, const char *fmt)
 {
 	const struct protocol_map_entry *pme;
diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
index 6b6366fa..5cd63fac 100644
--- a/utils/libv4l2util/v4l2_driver.c
+++ b/utils/libv4l2util/v4l2_driver.c
@@ -15,6 +15,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -174,13 +175,13 @@ static void prt_buf_info(char *name,struct v4l2_buffer *p)
 {
 	struct v4l2_timecode *tc=&p->timecode;
 
-	printf ("%s: %02ld:%02d:%02d.%08ld index=%d, type=%s, "
+	printf ("%s: %02" PRIu64 ":%02d:%02d.%08" PRIu64 " index=%d, type=%s, "
 		"bytesused=%d, flags=0x%08x, "
 		"field=%s, sequence=%d, memory=%s, offset=0x%08x, length=%d\n",
-		name, (p->timestamp.tv_sec/3600),
+		name, (uint64_t)(p->timestamp.tv_sec/3600),
 		(int)(p->timestamp.tv_sec/60)%60,
 		(int)(p->timestamp.tv_sec%60),
-		p->timestamp.tv_usec,
+		(uint64_t)p->timestamp.tv_usec,
 		p->index,
 		prt_names(p->type,v4l2_type_names),
 		p->bytesused,p->flags,
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 60d64d8b..010936c0 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -72,7 +72,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 	                           (long) buf_address_retrace_pointer);
 
 	if (is_verbose() || (errno != 0)) {
-		fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, off);
+		fprintf(stderr, "fd: %d, offset: %lld, ", fd_retrace, (long long)off);
 		if (is_mmap64)
 			perror("mmap64");
 		else
-- 
2.45.2


