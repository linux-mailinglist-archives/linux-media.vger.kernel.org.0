Return-Path: <linux-media+bounces-14102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B56FA91661E
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 13:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EFB11F22498
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 11:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0EC14A619;
	Tue, 25 Jun 2024 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjrhFmQk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9B6CDBA
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719314680; cv=none; b=bC/mh52eO01pCZh4/fTLz38Tb9kS2Ka9b0Khz3mpkAdr6ukgoLUn0Sz2Vy+ZjS3d8kTYwehFjtXxWtbJWnJNLgKPLDJpJaq/MDO89H/L9yQ8kLoFA8s7oM1DbFhBDOHV+uJTExXlP8mqhse4nz90bJgcP2OZZmoXpN5BfgTRH/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719314680; c=relaxed/simple;
	bh=RoO0dtqfcALrv0HqdqKkT2wvESGCqtbwjuYC2bg2ZnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bp2TKQyamtKxz42F7nBIS9kdHCJPlzsEon3zhSEDRl+ciBT9Sg/VMLnV8RKtnJ22fpcLaocHp5SkBPykLsaM7DIzLcy9y620j1T+2/U4enVdw6CHvYuLMjekyq/zIXvQrqjN77EcPY3nmkXUpIAH6cG6gSFe/vEwWzFZsUrEwuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjrhFmQk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a724598cfe3so345559266b.1
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 04:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719314677; x=1719919477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAHXZZrbhYF4+ybsXis9KA+GuIHv0xXLXsCQ0PKwvxY=;
        b=ZjrhFmQk6YwZmppB4XYglWQ/JfH/44aijznA9frwjz4yho7JZoscd+0rO7tHMtgA+E
         VmwHghm2bU/A75YKDp625/VhW2hBCES7Zi+Ep4TbS9DRM+SbbK5GGnjWlhcsyXs28Aos
         TQMOW8APXtSz9rlx9BsYaxeVPi6becktTsVoIF26ccR21F+ExVPJJetKrnU5ZobQnFmi
         aSd+hkC0uamMjGRH6TRDY94Xc8KdTq01OlA10fDEbhfD4+vbeLCgLbN9qS0DP8dcIGIN
         45bHhYdX/1FYnvUWu16RI1gY8/kBpBPPlosclndI0B6Z+sTV39SnFk865YNpiq7TjfHD
         Q9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719314677; x=1719919477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAHXZZrbhYF4+ybsXis9KA+GuIHv0xXLXsCQ0PKwvxY=;
        b=lrHpZWHfnVLGmdPuOG6j/GQf4CD2Ef0McgvocFBWSxt1haVxpfFz2rgYokd9Fbbw+x
         mcGP8ymSyrE4jTpqpSzShHoIprgrinrG+ErpQrGovcuHZWiDn2db5FWzrO9WA5tJyYV5
         aPB87ADOhFSjcaLY1KKIgJKKTXhYUq4oRrYa7fjXTZaSmS5OYFpfwfhFhlracIsyp5p2
         BqXSJ+QesCNZoMolW3NLc3k8M1sc6CO6vN55b8b1cZ8pb0k5wbv/QrprcN3W2J8cqB1p
         5gmfaiE+mKD6WcJq2tJ+1ikZew9ahByFjztt49+WGMpeSVZMdqn6aHdAMs7DOVL0i6n9
         3I0A==
X-Gm-Message-State: AOJu0Yzs24NHpJBylH2C59GPF+1R8e0OLXC3K2I59KZK6eJZhcNUlFua
	0Mzn6VE6MP9lU7R/00NaHZHNqv6OX1TkpXWd8q2wHpNjMyKclA0WeX55lNkt
X-Google-Smtp-Source: AGHT+IGb8cScOl/LI5kmEoZYT0aIpRLfbvbK9Qv0z6wPUqs8/g3/ZRF4gsXxWPsei/4RLVYYkwsN1g==
X-Received: by 2002:a17:907:a803:b0:a6f:b885:2042 with SMTP id a640c23a62f3a-a727f688a5bmr6577666b.18.1719314676530;
        Tue, 25 Jun 2024 04:24:36 -0700 (PDT)
Received: from cheofusi.cheofusi ([129.0.205.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72569d169esm183751766b.188.2024.06.25.04.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:24:35 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v3 v4l-utils] common: Use posix_memalign for allocating userptr buffers
Date: Tue, 25 Jun 2024 12:24:25 +0100
Message-Id: <20240625112425.37172-1-fusibrandon13@gmail.com>
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
index cf0e92d..aa9ee26 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1661,10 +1661,11 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
 		return 0;
 	for (b = from; b < v4l_queue_g_buffers(q); b++) {
 		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
-			void *m = malloc(v4l_queue_g_length(q, p));
-
-			if (m == NULL)
-				return errno;
+			void *m;
+			int ret = posix_memalign(&m, getpagesize(),
+						v4l_queue_g_length(q, p));
+			if (ret)
+				return ret;
 			v4l_queue_s_userptr(q, b, p, m);
 		}
 	}
-- 
2.39.2


