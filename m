Return-Path: <linux-media+bounces-14552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9D5924860
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 21:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 533011C230BE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 19:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB6E1CE088;
	Tue,  2 Jul 2024 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/rokyG0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D21BB687
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948828; cv=none; b=p2HNpVm1MxAMsjdGEiwgKRBbZDyKxPTeKtgWIm7igC9Ker4BXVWPJ5QHHyNtelodkd/BZuW8TUbjoczR5SX2UOEB1yWY991U+lvLTN4yoITacuVsOD9SjE3Q8+h4fQxqRLZInXmVqRMBEfbLFeJpdnuI91EDbk/TuVSMjnKZq9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948828; c=relaxed/simple;
	bh=NfffHtNEHZDNcyTRkNfyL1+hleQtBsh1ViMfls57PYw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD7bKRy0Ie4zkxa4wPn1lStoyZYzypbdDrOxk8X8rcON3oBdiIBV6rqBwCSqoWpcRgGWLAE+Oh8rUzlTzEJu119MV/MbbVxyWH5XgLMAfOQ/ZtzvkA9bFyBNJatVbmrpHl8GnQeug+uoJf12tEY1aWZ5iZvg9Pu/UlohnpaxEJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/rokyG0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fafb9a33b3so6407355ad.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 12:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948827; x=1720553627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXoetJmK4vT3sSD+N7bEiQjNsv5uxd1VKnOIwzzaiNM=;
        b=J/rokyG0IyX56wXkY2+A70YXTNftYrwdrmst1gEfZcTzyBm9rKHbLIb4NxX1ZBkjjv
         vpY+Zh93x4KJ/Pr1Ci4vvWknZSx566uXrMUfS6R3SjMlrL96epQfbLDGXuy646VP6pgg
         9pwyNf4mGMw1Gy2LCj8xRBj9EAwp7OJ5RA1gjJoDnv4mIntoG1ImLURQrDnXwRAxSDd/
         cvLvukT9Lq3jnPT4n/l94P4mrgeCuvpSBiSDVAICr2+bNxROYO0TH/FtlnOud0V1E+Bv
         1PRPCM6vTTeVWLlX+++m5RUFJZ5RA0BFxcMk5CaH5u4fY03MDdbZ0499dYaGGK0q5grI
         eyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948827; x=1720553627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXoetJmK4vT3sSD+N7bEiQjNsv5uxd1VKnOIwzzaiNM=;
        b=D4Y/12QPggKAEbxYgzDFDtAWtcTo4gMkZUf2QU4fBTfGK7Mv0l/1OjE1dzi2qbL2V6
         h0omonAGYNDYYxs6wT8+uMacNg/uBNUv9ImPArTR3bVeYN3DPx+oKlzUg2bQIFTfp4OK
         YkAwj2XLVCJYVTtb+IT14PV+whiZ/5SCD1HDVDzg7XCErzMuBSwI34qYTdTo4843sRZv
         qkU65hWAL8vPkP5ZW9N6Pt4iY+RJ5Sgz1GRgUP7mIHU4+qft2eaHY4JFrFXSjOsd5gtf
         xIyg+PL+2keGh03TX1vIpH4WLnVevVJVtSKh/tErEHqgIjlot/iba2ly6ml8T4eUPmxe
         JTSA==
X-Gm-Message-State: AOJu0YxOroDURXjsW1c3KqwmdFfXQoVHYvg1Iqyq53CZJMu89CnXzT4m
	1aAXGW2N9FMMpDcf+xPfcqHH+JL+XyQ7jzBOzfUGRDV4HBR5Yqo44K+5BA==
X-Google-Smtp-Source: AGHT+IHGcI4yvGjj9HeYbrrVwzmI3q9LsBDpoh9eMKGZg5gX/3vLe8o8aQvXal6/MBlyB03Q6IJjqA==
X-Received: by 2002:a17:903:18d:b0:1e0:bae4:48f9 with SMTP id d9443c01a7336-1fadbcb50e7mr66264865ad.32.1719948826404;
        Tue, 02 Jul 2024 12:33:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538fe7sm88441795ad.172.2024.07.02.12.33.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:33:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/4] v4l-utils: fix potential crashing with 32-bit musl
Date: Tue,  2 Jul 2024 12:33:41 -0700
Message-ID: <20240702193343.5742-2-rosenp@gmail.com>
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

Under musl, if a format string has an integer followed by %s, a mismatch
between types can cause the second half of the integer to be interpreted
by %s.

Eg: printf("%d %s", 64bittype, string);

will crash, especially on 32-bit big endian.

The reason these are cast to __u64 is because time_t and suseconds_t
are 64-bit under musl, even on 32-bit platforms. __u64 helps avoid
any truncation issues that may or may not arise.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-follower/cec-follower.cpp | 2 +-
 utils/libv4l2util/v4l2_driver.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index a7481aea..67e0d92b 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -354,7 +354,7 @@ void print_timers(struct node *node)
 			printf("source: %s, ", source.c_str());
 			if (t.recording_seq)
 				printf("rec-seq: 0x%x, ", t.recording_seq);
-			printf("needs: %ld %s\n", t.duration, "MB."); /* 1MB per second. */
+			printf("needs: %llu %s\n", (__u64)t.duration, "MB."); /* 1MB per second. */
 		}
 		printf("Total media space available for recording: ");
 		if (node->state.media_space_available >= 0)
diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
index 6b6366fa..51e97b61 100644
--- a/utils/libv4l2util/v4l2_driver.c
+++ b/utils/libv4l2util/v4l2_driver.c
@@ -174,13 +174,13 @@ static void prt_buf_info(char *name,struct v4l2_buffer *p)
 {
 	struct v4l2_timecode *tc=&p->timecode;
 
-	printf ("%s: %02ld:%02d:%02d.%08ld index=%d, type=%s, "
+	printf ("%s: %02llu:%02d:%02d.%08llu index=%d, type=%s, "
 		"bytesused=%d, flags=0x%08x, "
 		"field=%s, sequence=%d, memory=%s, offset=0x%08x, length=%d\n",
-		name, (p->timestamp.tv_sec/3600),
+		name, (__u64)(p->timestamp.tv_sec/3600),
 		(int)(p->timestamp.tv_sec/60)%60,
 		(int)(p->timestamp.tv_sec%60),
-		p->timestamp.tv_usec,
+		(__u64)p->timestamp.tv_usec,
 		p->index,
 		prt_names(p->type,v4l2_type_names),
 		p->bytesused,p->flags,
-- 
2.45.2


