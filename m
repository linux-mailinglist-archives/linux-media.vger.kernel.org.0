Return-Path: <linux-media+bounces-28430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEEA677BF
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 16:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2CC17762C
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 15:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEA620F061;
	Tue, 18 Mar 2025 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AutyH700"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2234A23;
	Tue, 18 Mar 2025 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311740; cv=none; b=NYzwbLqmQh89BFDWC1xGI658Tr/Yqn5C+VUkfI9EYIC9FT/vKXCQM+qLJZi+D9bHlaf4wn4STE8k7rCR/6nZwLlHl2fBCv4RmZsoId9Y3CyzSFBzB+H3ABKT1mcEVpPgAM1eaLasTKXl4f98VGeBAYJfLhIFqKIAAHI2fpQyN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311740; c=relaxed/simple;
	bh=r7fk/DriJ2/2c/bZZQW+F0HjmnZv3rTWKgs7GKDvBTI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pzsvTm6P/IOxj+/Kvs5M4Y2juMStzj9kNMnd03yQi8Nf922gVOMMDpfF47K+w32FncR4GIy61IWK1Hm0oJ8ZambpDRWUh1nalkb3qbIHQ/2XjnQFIT2ui7RXsv/KjdqgsxvEK6V1zchiTGDnJ1OIgk5OHMSfQnisWK/XPSs+RHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AutyH700; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22409077c06so146527245ad.1;
        Tue, 18 Mar 2025 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311739; x=1742916539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GIoY6hZd8z2MO+gbh2+3E+yi4866iekF90s7ppxoV8=;
        b=AutyH700oZcQKGvdk6wlvGr2DCh80TRGrnoud42OKGFCZmI/vGsQzulztgJ6peSXz7
         5fggi3nonMywKXaQ4BC46oI25cde41hfw0udO7/UrrRYLSJE1nQzCUfskUWKc/W/k4jl
         HOcxQhh5kLqo9/tF8dhJAwPgi/Mkvrbn8wG/wQU3M5Hn7Ab654HesRrMh+rRCk5Bp0R9
         VhlZxzsssVNqiAn2infgZwDCPsajB8cUbfKLZd1h7VUTYUP8K4nz7VnuSFzAl0yqVIgU
         FeO2iS3SPDACGObVWJUQ53eu1ks0fxvgLH26mlG0KfMK+Ikq88wzcu++NZ5hlyYwqDwP
         2blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311739; x=1742916539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GIoY6hZd8z2MO+gbh2+3E+yi4866iekF90s7ppxoV8=;
        b=tJ5ZG0EU+sea1qxczLxFtLKW+/5YPwKZlusWtBvS0Wg1zLrb2tT80LuHtGLjBigCH5
         t5RgfZx4ECP3b1gch3iL6v79a4BxiIvOap0IBQ6TvYTr5KxvDLMZU982aS4t2QbGEbxN
         IFrnPIEEJYJcVKtEG1htOWjiRjYZA4ooHGhgF2D2hqv2PQ5ll1QYzQAhF4goeCo2MNU3
         q1KHocAROLpx9cdv1DJu8QXPEzrasC2TuooFgqNTDKbBg4Js1hTDfHcf3fuT5yBF2sPN
         NP1aG8az076CmGniP4zC5dYvt+ekQ+C0oEYB4/E7oqo6/lnMNgGMA1N3HELqlfaQ+6+K
         y4vw==
X-Forwarded-Encrypted: i=1; AJvYcCVI5J+eACxiaIxLS4fsF0MvW/4TJp3p3uk+5g9EAEUMumyN1Uj3lPrBeVdxQ1bTeu0E9StSsyD9lCVLA/w=@vger.kernel.org, AJvYcCWTdj3ko+jC7QHO5cgjTE9jZsZtZ7MvLRHqt0uZQULEjeZKUOnf/yxDYJLiHs5c1ol2Cqxt+7HuBpSIZAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMbSpOKigFRL6dlOcCwIFuoGwz50j3dHZO3Irg11n64c+mi/d
	DIfgg9aa0RNd33AWUwXKUljXxgJ5o6g8khqs+LSUbS0jRcYhmBVM
X-Gm-Gg: ASbGncutpDGh1lE2Wh7XJPCDGbDge0FCKk/KHgHpP/mcS4rzfrlMB4papanyJwfQ7nE
	kAhtIXyMSCZOeeEm2bFxY18E1frZ8A15LtOsTjwo1ysBLuGJTunPff8X9616PU1e4xu8ciMNIk7
	QLwkHK1fapkma+L8vvBPu+WdENmTCNwgR4bE3/z/6PkeY4EwlZIaNjcUA3WiKKlswjRnlEAE841
	FPGbntsxwlQpvpr0bDXkKoeNgQw4eQSXBXhw79h9+/1gX5kmIJJj4MAFMtXQeQMR63p3tbKjCQK
	6PbTm0FlDVfEXc5yD/bpgk5VERULFPIqPugU1YFfnDVnjik9CrEBntoxR7/ikxU/b9I6
X-Google-Smtp-Source: AGHT+IGm8xA0NnVzynAsWM0O5Q7/Bnh0NImG4nypFjz6JgDaGn4zEGVo6frikkIaETlzSTvVl0nHzQ==
X-Received: by 2002:a17:903:19ed:b0:223:2aab:4626 with SMTP id d9443c01a7336-225e0a15b42mr242532475ad.11.1742311738697;
        Tue, 18 Mar 2025 08:28:58 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-225c6bbfdb2sm95680465ad.168.2025.03.18.08.28.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 08:28:58 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] dma-buf/sw_sync: Fix refcount leak in sw_sync_ioctl_get_deadline
Date: Tue, 18 Mar 2025 23:28:47 +0800
Message-Id: <20250318152847.30380-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix reference count leak in by adding dma_fence_put() when
dma_fence_to_sync_pt() fails after the call to sync_file_get_fence().

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/dma-buf/sw_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..b7615c5c6cac 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
+	if (!pt) {
+		dma_fence_put(fence);
 		return -EINVAL;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-- 
2.39.5 (Apple Git-154)


