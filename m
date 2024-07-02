Return-Path: <linux-media+bounces-14554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F4924863
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 21:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39A70B23A4E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 19:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481501CE0B3;
	Tue,  2 Jul 2024 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+Q5HPV6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA211CE081
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948830; cv=none; b=tZ8vjD44plftIYNtWDVoqPDMlRi7ExtTORYibvBSisUoIKvnk4n8ZO4MBiPKmhwIdnIX840wvL7JqSlT4n5c2/K3TZYFRF/Vg0F3I+tGh3bz6QRjele9g2YSpl3+ncMRcJtXbJU8lsooxT2IrIPg8oYOynvdR7rZ+8OqURJ55HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948830; c=relaxed/simple;
	bh=p7XPvdD3tU9HWSeYM7FSJ3s5IUoQWIUGBokEvSrzuqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBLQlr/ktMasVV2uvTABny92wahhH61LxlCE8ks/NVZeuCngn3ZOHAphfilr/Ts847TEyjHVOhKIsWafW7nBhltU6ekdCBBiHUtM9nfTgT0K4s1lHoPBn+xUgcNMLFXXF6E1LKkh/F2Ayu6ZzNoiUMlyGZIY889QtblvYGGEP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+Q5HPV6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fa2ea1c443so35334005ad.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948828; x=1720553628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8DON55o4cPvj6aXXqf3IWICHP4RWWJXn1rdii7VIzw=;
        b=W+Q5HPV6AzHHDFvWrFswbhHrAW+wg/DhcCDvU4k/aFbW92nU7xz+bNu/amL4++YgeZ
         HX4+CJHhHh3JwkrJ1N+UokB8T7dOQifUK624VnXHa5X8x2z3Iq+m1LVvuPnqBXJBoRbP
         VOBuQs9m8YGJATYwzCRbVUmzEci5M3ACgbkLmKJlT/JWsnLmNxkVlPOwYaa6vgvUNFJL
         7bdD38iXhOsmfeRZXEstGbOAYIP4dBbQeja+LuQyyiSeFyy5loiBhLbvY5LoTDw0FmwA
         UrrDtjbcQ8Xu07R3wk0nFXfSCx9C5qzTplO3+xOiYUfriwD2jlVE+YepY9Jf2UnlOxwj
         kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948828; x=1720553628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8DON55o4cPvj6aXXqf3IWICHP4RWWJXn1rdii7VIzw=;
        b=fv2tfJ9NVd8kTyV+5phEok8cE82oJAHb6oSiRxkOcOJDHh8RBUmSJMMXxqjZJl6vS+
         uKZrS7jTEJA9Cu++joih0YHGOei51DVuVU4C0cIkMs+/NTyRMc9P8DaNvBHwkSO8DIMc
         8Wngeia0q0upegL+GwlcajNhlaQMjUdA4mYXy05WIVJtxfW+tyrLcAX8nmOGX0ZRjOdH
         KERlm5bxPLKBgV+/efgWd9dCg+IfUhVn3NigvwiYHWkmJwHORV5mC6U+bh4rNdr1EC61
         p2dn1nSWV42BjY2Ucme3IvMVrVkbtWGC6AVhiddKv7iEu0o50rqlIIzTWaz20VGbC13L
         HGcA==
X-Gm-Message-State: AOJu0YyWJDtQnDdwpAX4i8cx/O0U4d7RV9LQxgZptiRPwxeVT/W9oU6A
	2PbvN6LD6+uVqWfXfkCnxI4tbsgNhVlneynZV9u/RsaaMIkkioEiNGH9MA==
X-Google-Smtp-Source: AGHT+IHSXSsiquxTFeSHLfzmNYRYkdP5vlSepejHYswP0ARCNyqI7ow9WY9BEP4pPJILtSpLOYa1/Q==
X-Received: by 2002:a17:903:22d1:b0:1f9:d111:8a19 with SMTP id d9443c01a7336-1fadbd01fbcmr78177025ad.64.1719948828297;
        Tue, 02 Jul 2024 12:33:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538fe7sm88441795ad.172.2024.07.02.12.33.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:33:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 4/4] v4l-utils: use 64-bit formats for time
Date: Tue,  2 Jul 2024 12:33:43 -0700
Message-ID: <20240702193343.5742-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702193343.5742-1-rosenp@gmail.com>
References: <20240702193343.5742-1-rosenp@gmail.com>
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
 utils/cec-compliance/cec-compliance.cpp   |  2 +-
 utils/cec-compliance/cec-test-adapter.cpp |  4 ++--
 utils/cec-ctl/cec-ctl.cpp                 | 18 +++++++++---------
 utils/cec-follower/cec-processing.cpp     |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 8075e1d6..bddd57cb 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -279,7 +279,7 @@ static std::string ts2s(__u64 ts)
 	t = res.tv_sec;
 	s = ctime(&t);
 	s = s.substr(0, s.length() - 6);
-	sprintf(buf, "%03lu", res.tv_usec / 1000);
+	sprintf(buf, "%03llu", (__u64)res.tv_usec / 1000);
 	return s + "." + buf;
 }
 
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 08c856af..f96baaf3 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -1276,9 +1276,9 @@ static int testLostMsgs(struct node *node)
 			printf("\t\tReceived messages: %d of which %d were CEC_MSG_CEC_VERSION\n",
 			       pending_rx_msgs, pending_rx_cec_version_msgs);
 		if (pending_quick_msgs < pending_msgs)
-			printf("\t\tReceived %d messages immediately, and %d over %ld seconds\n",
+			printf("\t\tReceived %d messages immediately, and %d over %llu seconds\n",
 			       pending_quick_msgs, pending_msgs - pending_quick_msgs,
-			       time(nullptr) - start);
+			       (__u64)time(nullptr) - start);
 	}
 	print_sfts(sft[1][1], "SFTs for repeating messages (>= 7)");
 	print_sfts(sft[1][0], "SFTs for repeating remote messages (>= 7)");
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 8848a49d..f7ba7409 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -414,7 +414,7 @@ std::string ts2s(__u64 ts)
 		strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
 	}
 	secs = last_secs + t - last_t;
-	sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv_usec);
+	sprintf(buf + 14, "%02u:%02u.%06llu", secs / 60, secs % 60, (__u64)res.tv_usec);
 	return buf;
 }
 
@@ -942,10 +942,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 		}
 		fprintf(fstore, "# cec-ctl --store-pin\n");
 		fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
-		fprintf(fstore, "# start_monotonic %lu.%09lu\n",
-			start_monotonic.tv_sec, start_monotonic.tv_nsec);
-		fprintf(fstore, "# start_timeofday %lu.%06lu\n",
-			start_timeofday.tv_sec, start_timeofday.tv_usec);
+		fprintf(fstore, "# start_monotonic %llu.%09llu\n",
+			(__u64)start_monotonic.tv_sec, (__u64)start_monotonic.tv_nsec);
+		fprintf(fstore, "# start_timeofday %llu.%06llu\n",
+			(__u64)start_timeofday.tv_sec, (__u64)start_timeofday.tv_usec);
 		fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_addr_mask);
 		fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
 			cec_phys_addr_exp(node.phys_addr));
@@ -984,10 +984,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 			 */
 			clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
 			gettimeofday(&start_timeofday, nullptr);
-			fprintf(fstore, "# start_monotonic %lu.%09lu\n",
-				start_monotonic.tv_sec, start_monotonic.tv_nsec);
-			fprintf(fstore, "# start_timeofday %lu.%06lu\n",
-				start_timeofday.tv_sec, start_timeofday.tv_usec);
+			fprintf(fstore, "# start_monotonic %llu.%09llu\n",
+				(__u64)start_monotonic.tv_sec, (__u64)start_monotonic.tv_nsec);
+			fprintf(fstore, "# start_timeofday %llu.%06llu\n",
+				(__u64)start_timeofday.tv_sec, (__u64)start_timeofday.tv_usec);
 			fflush(fstore);
 			start_minute = now;
 		}
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 14ee211b..cd20df59 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -72,7 +72,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
 	t = res.tv_sec;
 	s = ctime(&t);
 	s = s.substr(0, s.length() - 6);
-	sprintf(buf, "%03lu", res.tv_usec / 1000);
+	sprintf(buf, "%03llu", (__u64)res.tv_usec / 1000);
 	return s + "." + buf;
 }
 
-- 
2.45.2


