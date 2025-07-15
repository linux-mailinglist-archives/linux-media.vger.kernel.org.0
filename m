Return-Path: <linux-media+bounces-37779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B9B059DB
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 14:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFFAF741EED
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC73C2DE712;
	Tue, 15 Jul 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjjeBRXm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ECC2DE70E;
	Tue, 15 Jul 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752581950; cv=none; b=JzpDSt7QmcmeZTlgOJ3IC9PKdY6OjchaaUly4fpjRV5gwrtoYuGxFdt9ryc12aiEeXqftrMgBw/os9zHOPyx9HfCT/tXzFTaRIAqvS7tn8RpqkNPo9DnIXcNw34j43MENLJBKwpVJBZJhHM6cJKzMPHXYA0ITGLSzvMyvVRjXAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752581950; c=relaxed/simple;
	bh=qvgiBgPI/1MvYYwFH/XMV/9+QdkZpnesuL1H6Zud1mI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u7KgC8dJ8OqfxUZghKIaVLtFOGv0YOnCPr8FJynRWffxvsWSz3w1yiMIlQIU02FtcT2a5014ILB9h38p42ba+DbmsakWmz4w0CztikP+6IK8zQ7lU5mHVkX/bkzlX8f3l2F8ge6u3nrcJWMyg3qgjDj2SojRhmNGQBYK7j7Ki0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjjeBRXm; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8bbaedb460so343044276.3;
        Tue, 15 Jul 2025 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752581947; x=1753186747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIfmy0/3xkga8hiuCxq1ZZdtAivDaHAR4qHd1TqxdHU=;
        b=IjjeBRXmHQTEJADJbgPt4qb0NowUCsEWLDEiiQyazIsKYdEBQar5xmtzCivVOawYWO
         1JSNVu1HYethsZcsvCK+u+ejg343pWrrDjuWc4lxsEji2GdKpo9aVfL3ndjouJ221P89
         iq45iRAV/Xetwe+xiYbrxJ8cfsiS0mru8tYIYDJqwIi20jag5wOlX5e9l5tLWMUs5CN9
         jYOxZeHx8L2xE/voZsQDdlLHVnyo87c00UTYExJD01NjC8CrKDDqJmfclOLynsMw/yCD
         LTXpkpjlIfW/xM8997OPnyd/3eXcSdNgmt2uqaLMevBfSeKYKQYoRf++E35YhZ/wzZh7
         Sxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581947; x=1753186747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIfmy0/3xkga8hiuCxq1ZZdtAivDaHAR4qHd1TqxdHU=;
        b=J4lix52z71NIeQ+rbrmGbQw6E7pSLpz+ff255qx4z04E6g71MhL/ubwOeJCaJG9OoL
         ZcwdOuCCd5npX39WJe96Nn8CCjMEd+xvJmYkzhE071UgC8B/yxJcM0pEvMltKohiBemP
         tP1KRU/FvGoENcIik7oW0OtY1kenUxW7ZutqlL5hcln6mFU7ZlwxbkU1FIezSFvfvkzO
         Hj4cVD8xKXvkr9qKV5qYIHgZ5FsUrVlKCCBkRYryNrygoTczdbE6qmNQ5ESrCtU0j3ov
         nZQHWPYts4cRgfroxYRPzW1FygJPYGCaufs1sPrk5UuMVkLiKJMMi2yaTFMeWD6TLcsk
         xLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhH7MpnI9kagn2bAO8TWn72sw/XXOYXuHuAqt7DGUHN5ryh+eeDMSyx49NeampqU7byJMrUyrjzZoL8sc=@vger.kernel.org, AJvYcCXZaYKdz2VChGyn5g4Rf9+kt4hOreG/nsXON6Eld56BW6OYzYJDK2e7yc1HQ5uzwDQ5/6CRjtgzphdA8is=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbJfdvw1yJ9jnEI1R96OJmC3bPxHjWcsWE6KgloM7MeXzAVT+
	P9EDupit7bKbqddPiEVIT5F1uDJnMHOZaxOB07kQwKqgYdcrKRsT32jx
X-Gm-Gg: ASbGncuR+QqrRToV1vizyFWv0oOw5YQHAf0DGiebsxHrT42FeTPi1yWaON2nn8kSZib
	PwGh0SZhACkQofIdoqy5xVnYxIA/KiX3DlegtV7MDENCZfoJqZ2EGb0k5G0jYmFqJev71hx7gBM
	g0YlJnNe+EFbIvQwUtthfoqqOkVKAKCRKHNiuVsC6MN5fXeru//cX6JmqICYOnFnHrToeyLet59
	8C1iNheAa6LqEfDX4f50u234IUQIJLlYE6NmmYKhqew8gipV+px23cfzspacfiZzfq3io3oiXCA
	2CZ9fxxeyV1QFzG+hMi8RE6WHBA08rQ9/S5LMlxCsMZgj99HjUdc8QaSv6Bzz+oh4bFt786MptS
	lEt4dNULQ9skhxKzRC6UGRh5D8umELjaR5g==
X-Google-Smtp-Source: AGHT+IGfSxm300vEgPQlNRYqtUBzpiflKmyfITdm3khjnCbUjiMfC5i1vY9+2xSVU+3qZKC6YuCnvw==
X-Received: by 2002:a05:6902:260f:b0:e8b:444c:a1b0 with SMTP id 3f1490d57ef6-e8b85aa6ba2mr18358309276.16.1752581947558;
        Tue, 15 Jul 2025 05:19:07 -0700 (PDT)
Received: from debian.test ([89.234.162.240])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8bbaec0d01sm230378276.6.2025.07.15.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:19:07 -0700 (PDT)
From: Michelle Jin <shjy180909@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Michelle Jin <shjy180909@gmail.com>
Subject: [PATCH] media: atomisp: fix trailing block comment style
Date: Tue, 15 Jul 2025 08:18:39 -0400
Message-Id: <20250715121839.12987-1-shjy180909@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a checkpatch.pl warning regarding block comment formatting.

The trailing '*/' on line 78 was moved to a separate line to conform to
Linux kernel coding style guidelines.

Signed-off-by: Michelle Jin <shjy180909@gmail.com>
---
 .../media/atomisp/include/linux/atomisp_platform.h   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 6146555fe9cf..95e18c7ddc13 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -73,9 +73,11 @@ enum atomisp_input_format {
 	/* CSI2-MIPI specific format: YUV data.
 	 */
 	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,  /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+					       * Pixel Sampling)
+					       */
 	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+					       * Pixel Sampling)
+					       */
 
 	/* CSI2-MIPI specific format: Generic long packet data
 	 */
@@ -119,10 +121,12 @@ struct atomisp_input_stream_info {
 	enum atomisp_input_stream_id stream;
 	u8 enable;
 	/* Sensor driver fills ch_id with the id
-	   of the virtual channel. */
+	 * of the virtual channel.
+	 */
 	u8 ch_id;
 	/* Tells how many streams in this virtual channel. If 0 ignore rest
-	 * and the input format will be from mipi_info */
+	 * and the input format will be from mipi_info
+	 */
 	u8 isys_configs;
 	/*
 	 * if more isys_configs is more than 0, sensor needs to configure the
-- 
2.39.5


