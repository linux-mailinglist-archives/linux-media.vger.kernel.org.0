Return-Path: <linux-media+bounces-14427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6291D4A3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 00:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D2C1B20B21
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 22:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953B46FE16;
	Sun, 30 Jun 2024 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3iUIxZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB62AF12
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719787485; cv=none; b=rb+5HqaPl7eUyiLCdY7jyzfdJEkthLKh4cdODWo0SbVPzUVa0kagMW9oMNFvGK8clxVDo3HFHrGcCZAitaKXxWANAB8NzWurW3kf3xmV7Sjkx58TEnBdYUKoqDvD8UnT/JFFHLfQ7juFcYWb3Vq+XYcXrCFx9bdtqaxGfEv49p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719787485; c=relaxed/simple;
	bh=lfHT8mkeHCthULH79wu7AxRl2cOWwcrSwoMoN+g9azw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=n63kjpXFdBIy01cJGyxYjfh8ucrNZb0uho3EuZtczDwS8G2GKtiBrNaLqlHs8IzGexwvywy7Q7CJO5uWd2Z+1+O1YbeEq+RRNOBty4wGtlkYNikhvhEDN8L+IzOexqNGM7BtGb2j8w+YQgXscE4aiWCuhi41hCkSz/5x621N+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3iUIxZS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70675977d0eso1332280b3a.0
        for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719787483; x=1720392283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwgqgGKvF6BwBfoGeYc9Bu8MKd3Q+XbcN6EtYPz+/6o=;
        b=g3iUIxZSWB/88N0X1BQGPSsbCTdIYmqMYlyHtDlUvfOvmjLZ28aW3W3gusSxAUn8yZ
         EI3L3RP6V70Qot3qor++r+CIC62Oihms4XB86F/yGBoh4imtIdgqdn+EJwgJHiILKvqm
         rZfrMSOqU4AmHu3cV7ZtG4cowBX6zYVnerWQ1F0pFYy7YcM1BEAcNkWzGS69hufHmKl6
         V+2+7jrKh3Gwm0no0gZhWlJbbARsyZellPkW8/b0YeXqpIJwjwGQlhml3k9m02Daa2WQ
         cJqYuLqgJrSVIFciCZR3dy/RykKAlEjKFejatJ7nNp3dIBaABvzo26E/5A6sj6DghZD0
         b40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719787483; x=1720392283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwgqgGKvF6BwBfoGeYc9Bu8MKd3Q+XbcN6EtYPz+/6o=;
        b=c2O8kid3ftmxhfmgJsgjGN34PsgyVxf3oxeKgsjVNhQp6HG95kkfKqvy168VxhP5yF
         cuUxFPB4HwYUQrVDoJmptMj+N1YFkHOLkewqbcdy74hX9hCeUxiP4sQofZawnhjX/SEL
         vsm2I2VXz4UkvUEYHO+SoIA9rmw6zTUxYnuVJDJCjttb+s+wNXF45bgRhXGVh7tKWODB
         r25QeeAw+Lt3dFBGycEnSlIJzOW6AbZEKCnkMemOEmANQxpSHEOdq4BF1n5E4ULC2cXA
         Hm4GOCri+ittvSA/260UGNomGihgrzxRKOMBJgcVfHLXKrepFjHC2pjqhrcd+WqRePwk
         iKcw==
X-Gm-Message-State: AOJu0Yyx8hYsDKSVnwMx+pyYrG1IQlxO3RlnE/8dZE/sf6SQcVRHLORE
	hkN/Vtl6tRs6gqFhejLH4jV82E+lkl8tO09GPOrIoyTS6Kwm1C5actAtiQ==
X-Google-Smtp-Source: AGHT+IHJK1zJUq1J16aoeo0YuAmm0tppK5KuM9R3yEynCqGMxYRYpVaE36Tq0394nb2NV3fB5tv+VQ==
X-Received: by 2002:a05:6a21:32a0:b0:1be:c4b9:c222 with SMTP id adf61e73a8af0-1bef611dc8fmr3070028637.11.1719787482666;
        Sun, 30 Jun 2024 15:44:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15396casm51018995ad.175.2024.06.30.15.44.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:44:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/4] v4l-utils: fix potential crashing with 32-bit musl
Date: Sun, 30 Jun 2024 15:44:37 -0700
Message-ID: <20240630224440.5912-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under musl, if a format string has an integer followed by %s, a mismatch
between types can cause the second half of the integer to be interpreted
by %s.

Eg: printf("%d %s", 64bittype, string);

will crash, especially on 32-bit big endian.

The reason these are cast to uint64_t is because time_t and suseconds_t
are 64-bit under musl, even on 32-bit platforms. uint64_t helps avoid
any truncation issues that may or may not arise.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-follower/cec-follower.cpp | 3 ++-
 utils/libv4l2util/v4l2_driver.c     | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

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
-- 
2.45.2


