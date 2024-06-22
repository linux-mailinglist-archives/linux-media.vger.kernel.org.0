Return-Path: <linux-media+bounces-13961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D888691326E
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 08:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 355B42851C8
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 06:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DD514A612;
	Sat, 22 Jun 2024 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at/VwOVA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55CF4206C
	for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719039476; cv=none; b=lIiXOVgPqK03HSuXU4dBjOJhiAxUtTsCqyDOtATOXpAphFXa9ozcxSWQFA9ZXlfASUCN5Y9h4//B96QHOIuSRW/9zd6qujM4HmDMs/hVVXXTJPGu9JTfMthWEZzeTLnTcWTBgLKCl7MmQDW9N9mXBtCgyz1PvA/25sudb7hIUDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719039476; c=relaxed/simple;
	bh=iv9Whgng6xZtWmZ4Cjn6uiYjz1QcK83FCJA7e0ptlKw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I9n/S3MerGVqWs6y6Xl0IBkcVOhVVWgvQNXkYYHaTZzG43xLIg64edmjHMl9fpQ9CQ9nzEh/o+Wv94D4LYgqmBJzoXoGA/UKKy2Z5iJ97VO6JFoBfyh8a8gydnyMaKBcFND1TmZt6mCSXF0G4TNBg+Ta+awkJrsnYTAfIA/vpNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at/VwOVA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso66225e87.1
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719039472; x=1719644272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YULDk+WvOG28F1246JMNfADLdkGCMkuo0rg/iNaSIU=;
        b=at/VwOVAnWwDmW43BOyWIC0x5g+w9mGJEQL9tXVYP/TMpOdreCIv//zqPw0sAOzIIE
         Lc7l2MunNSHjU3i2rDQblE5oCtW0v8PUmmicy2RgvFHLgDtagRX/c4npbXkQulpt+e85
         Tiu82hVPlKw5c7SRwFJ1I5P/vyd7Potd/C5wVJlDaPU4IUERQaMvlYr8rHs/+1fHt/+R
         yfDjUtr5apA4cav+NDWidgT61c0D7wm1nwvkVBnA+JiUwQGY2qo59VyuB+pEfyEGWf0O
         Csby3GvkqzPQ3j1WyEKkrgF2SaZv10ksK2aoQJ6tbSOdlrEpPzjWPGMYSENqy1mycC0g
         TE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719039472; x=1719644272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YULDk+WvOG28F1246JMNfADLdkGCMkuo0rg/iNaSIU=;
        b=AIx5aDVcI8g5JseD6Rpt9RB3TkPYDNCNEA7IFRwFCX7XPVHCjs5VEKNnvWA26Y8LvJ
         fXV0r5jCNjt9HzKbxdvOXGAep9aCx04yKEqQVd/SrgfJGfVZwt4ieolHbTV/q9BzvHYC
         NCNCXyCF9hJ7SSzy9r+kc8jqGjEaU/OFenXZZTIVU2tY7iG0IXHKKcZAHKzgtq6lJx0r
         c2S9EZAW9ZMJOJ+kxJdNcAyHWMSbUZU+rQ/1vLm3/15KW+IgdBAqLb/0OU63kbbHd9yG
         hjicButKItolyzt90JZzbc023YOFTJyDndn5vZ28YFt2lkb1Mlgc0xSwYqAGW6MynKmt
         d3IA==
X-Gm-Message-State: AOJu0YyM8lnUKeDGguX5YifnlRo3BeXw/qp/Jc075sewplzxVu+KeymY
	mEvvJ+TdERb8ZWv23HgJjEOZqSgZNXxnB67L0UCLje9IcNQZPxHG+0CMGWqW
X-Google-Smtp-Source: AGHT+IEnwSXhRQH8GH0U4rhbKdQN1qdRpQU/4QvsCFWAXUP4ZifSfn1hPVAPNChspl8ytbtB5MqLBw==
X-Received: by 2002:ac2:4e06:0:b0:52c:99c9:bef6 with SMTP id 2adb3069b0e04-52ccaa56a13mr7706413e87.7.1719039472137;
        Fri, 21 Jun 2024 23:57:52 -0700 (PDT)
Received: from cheofusi.cheofusi ([129.0.174.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d3c5sm56153365e9.8.2024.06.21.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 23:57:51 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 v4l-utils] common: Use posix_memalign for allocating userptr buffers
Date: Sat, 22 Jun 2024 07:57:43 +0100
Message-Id: <20240622065743.385831-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dealing with a userptr pointing to a buffer in userspace,
videobuf2 swaps the corresponding physical pages with other pages
so we have a contiguous area of memory for DMA. This only works if
the userptr is page aligned.

The current way of allocating user buffers using malloc only
guarantees alignment up to `alignof(max_align_t)`, which is usually
16. So replace malloc with posix_memalign to ensure the returned
pointer is on a page boundary.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 utils/common/v4l-helpers.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index cf0e92d..4104b53 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1656,15 +1656,16 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
 		struct v4l_queue *q, unsigned from)
 {
 	unsigned b, p;
+	void *m;
+	int ret;
 
 	if (q->memory != V4L2_MEMORY_USERPTR)
 		return 0;
 	for (b = from; b < v4l_queue_g_buffers(q); b++) {
 		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
-			void *m = malloc(v4l_queue_g_length(q, p));
-
-			if (m == NULL)
-				return errno;
+			ret = posix_memalign(&m, getpagesize(), v4l_queue_g_length(q, p));
+			if (ret)
+				return ret;
 			v4l_queue_s_userptr(q, b, p, m);
 		}
 	}
-- 
2.39.2


