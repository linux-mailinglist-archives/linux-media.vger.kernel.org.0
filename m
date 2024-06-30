Return-Path: <linux-media+bounces-14429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3091D4A5
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 00:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9FD1C20B9C
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 22:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC03B79B7E;
	Sun, 30 Jun 2024 22:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsEtZdVs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357B6F31E
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719787487; cv=none; b=CIxVdh0THXwYywotfvZwOekxi9hu7sgLFg4p1JwhbYDz37GOUbup+AE8bJUAgnxsQrmDnPlnmLh5lExds6Qjj7cj9Q1XHcuAR3JCcQkFqT3Mno6uOTnoKejBde6GzEGCXS0TIF+rHB+QCWdALhoCcs2hCO2/neX1I3qdA5eQmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719787487; c=relaxed/simple;
	bh=vfBWnrW6H7ZSKS4wodTVH3QflgQUnL6FMfsZ4JmuubU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGQlby17IUqka/wixMQn/GLrDg/Iyn/rhZHBnvH8SG53MLCWWmYxK8TZTjL05ILuxoupjUCGmnWgXu36iWJOvuNHdJOJCBCU/90BvNjSixPMIyZ6zaTYzQ9X1Wt9EQEaKHjMjxSvnlCtiD0U9YYUbAZpx+3g/qmvYXJb9GVtpbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsEtZdVs; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-376208fbe7bso11158895ab.3
        for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 15:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719787484; x=1720392284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7/7nS13zJ9L6aYUdFSlRFp1hp8QZJWcCCalIj9iJiE=;
        b=SsEtZdVsLJgBZY4CfaxxXiPM6CGWwm8FHF0RCQ7wZkS9p7hIdoj16AWTm1HX4YJdhH
         rWsWO6MTIiah5ONai9FxSOFWO+XWeJfWJx6sAhpeBR/CK4biLjoKUxcet8XSP4V+qV/a
         S8JWrWxBeVLuhDxSYj+SU4FFHWRxcIDP5aclrJYifubN6Q60qyvChyDPJiNfSHzjV/KU
         JBoIH5g+WujHqsksKvgzwDQJKFAgr0jsmPkf8lDcatCVXeclMzj8n9SmbfVFJRz4iz57
         nbxydNUvPumlcE+ZcDHWcVIA+k2a/bnj+TaVFtkmugjLgtfQMEvt/BabdFo5nNVCWODh
         i/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719787484; x=1720392284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7/7nS13zJ9L6aYUdFSlRFp1hp8QZJWcCCalIj9iJiE=;
        b=IffvfhKlkVNo8vykKEMFVmlT8W49Gg/x09qg3w9sLKMi9RzuhPY69r6LAix/2c7048
         JmwULlXOGOmUE2O3rvtjcYruFTa5cKPl/HJYsq7Z3r4i6jUxvkGQuCIFoo+SBUKXs7mx
         MC68J75VS7b6OjsWp3FNQyALwtbsT+/iqE2uzYZDwyPExVT0HBIc7/EWw7rtEYpCqCMv
         nvKV946UKm3KC70LmsLQrP1fnONd9czMdNjuMJd1a5XVYDhXU5s+PdWaGPQ+H+iFnfrI
         z/YXi6T2DjEOvp2mHUsb2o1xvT+g37ZT+ViAosfMrJsR8w8sWeVBRHEsaltSu/9cKEBe
         TTZw==
X-Gm-Message-State: AOJu0YwxzT/qcwVwvqPxDBCSsrEB2/AZVsp8HDopYV+ri1Igzy6xNa+e
	yNVR7IRaSUv2/7y4sufypJDvZp5oqHHIxcsErHFgh2iE/HoXhQbW4KsMfw==
X-Google-Smtp-Source: AGHT+IGzBwK42+87pPBylKqQIAUVRn/s1F5lKlHemvzS1nPkzGvLqIMvlHQqJ6TjPekxAXkoz3M4SA==
X-Received: by 2002:a05:6e02:1fe5:b0:375:a15e:d28b with SMTP id e9e14a558f8ab-37cd1793c0fmr51734055ab.16.1719787484552;
        Sun, 30 Jun 2024 15:44:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15396casm51018995ad.175.2024.06.30.15.44.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:44:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 3/4] v4l-utils: use 64-bit formats for time
Date: Sun, 30 Jun 2024 15:44:39 -0700
Message-ID: <20240630224440.5912-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630224440.5912-1-rosenp@gmail.com>
References: <20240630224440.5912-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl since version 1.2.0 uses 64-bit time_t and suseconds_t on all
platforms, even 32-bit. Cast to avoid warnings and potentially future
proof for when glibc and others gain support.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   |  3 ++-
 utils/cec-compliance/cec-test-adapter.cpp |  5 +++--
 utils/cec-ctl/cec-ctl.cpp                 | 19 ++++++++++---------
 utils/cec-follower/cec-processing.cpp     |  3 ++-
 utils/keytable/keytable.c                 |  1 +
 5 files changed, 18 insertions(+), 13 deletions(-)

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
index 8848a49d..fb38320d 100644
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
@@ -414,7 +415,7 @@ std::string ts2s(__u64 ts)
 		strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
 	}
 	secs = last_secs + t - last_t;
-	sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv_usec);
+	sprintf(buf + 14, "%02u:%02u.%06d", secs / 60, secs % 60, (int)res.tv_usec);
 	return buf;
 }
 
@@ -942,10 +943,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
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
@@ -984,10 +985,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
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
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 14ee211b..20c6165c 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -4,6 +4,7 @@
  */
 
 #include <cerrno>
+#include <cinttypes>
 #include <ctime>
 #include <string>
 
@@ -72,7 +73,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
 	t = res.tv_sec;
 	s = ctime(&t);
 	s = s.substr(0, s.length() - 6);
-	sprintf(buf, "%03lu", res.tv_usec / 1000);
+	sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
 	return s + "." + buf;
 }
 
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index b6474d5c..538f4ef3 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -212,6 +212,7 @@ static enum sysfs_protocols parse_sysfs_protocol(const char *name, bool all_allo
 	return SYSFS_INVALID;
 }
 
+__attribute__((format(printf, 3, 0)))
 static void write_sysfs_protocols(enum sysfs_protocols protocols, FILE *fp, const char *fmt)
 {
 	const struct protocol_map_entry *pme;
-- 
2.45.2


