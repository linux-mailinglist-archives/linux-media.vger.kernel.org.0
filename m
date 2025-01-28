Return-Path: <linux-media+bounces-25333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005AA2083F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 11:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D53A3A25D4
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D404A19B5A7;
	Tue, 28 Jan 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI1dEonE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84A156669
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058918; cv=none; b=ZizoKjXx34MpSw39axCkJe0cSSApkZ7CS1XfAET3qXwi/eJ5/6qRbcTc5yKwiXXvbFjtiI7nzQHN28sSumg4G/09oZtvZCRCHIwXjCYYZhpkGMjsnPQsfPXlV44maoDl/7qb9qXm+JRoHBoNKWFQ8vZRstaFY0Ey4TXWQZ5N5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058918; c=relaxed/simple;
	bh=oGlnQPEFD9NOoXL7Ct9mwjv7d3suZf9jFDsFHYYY0jU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mDxetHHz+ihPAjpatcPFB79WV3kpQfVAIFTgkx3T/cvHCwPM9XPIqMOVV0cGMufWMyJWYGfwa/khW3GE58YCIqkeiDQ0vjJhG6rWBIPJV+yk0KwAFoCH48t27UBqlKt1zqWIuHQ2MByAcQ7vvTKlHizjCA5hKwbUWY/EsQmbt1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI1dEonE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2757411f8f.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738058915; x=1738663715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2yOvoDnInS5YyguD1gPdiTImuorPx6Slh8QNA5BfCg=;
        b=bI1dEonEENR2TGAH0eJVLnXWTYY7EkDLFfAGXndkRk2oJjJyyZh1xC653/AMB6ekcs
         /uKC7OMf545sInAqtlBaUfpVlGCubEEdTvIIpPJg+N2JFWp1ngt6FBUrKvJaFyNYoQtk
         Tld4h4ZawoT3jXuXF5uc/aCmwssavPVKcsraALJGdBN7V2J/qT/h1/gpfCjdlp9AALwo
         rh7vsZh6ko3PuEOqOcU5pu4xbDxaLCelS4BbSjKJnjSaYCNnz4LL7g5Gj+m2qwztVT0G
         kLdoelIMUSrSj3PP/HYN+nOFZRsESm+fnhLXYZi3JKQe0e3g0ooYE0k6A0w1/GInSXb3
         DBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058915; x=1738663715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2yOvoDnInS5YyguD1gPdiTImuorPx6Slh8QNA5BfCg=;
        b=uDLNeTa5FU6v5scHF9D8YbGfy6ZopWyjYkN8Lv3NoKT8PJ9MH2ROgJpo0rs32DRK32
         YkHerry/x/CojbBIKTwS1+jqmz/2Vvs1Z2zPjnB8J4S8mLCSiU8c6/6UvlSbd8qlAz1E
         0fMvMy+p7RrKpoJP7WLgsPidJXe4C+qRfvsdrn65DL1Wsyuk3kFRys0bzYbHBuGOnFVx
         t9bAn09OiuaM6f7mFjQKjKyUHs7PRQxH9QLkoVZmx6OBYnS35Aig89XfT/l7oCgj/Wcd
         5llyysSxWQemOxmOTYoGU3+eU37o+4wmZLGtBqKUnOe01EBWIW0C84GuSzh99cXYfF+O
         1a6g==
X-Gm-Message-State: AOJu0YwjNyabbgaFlpELiZIYmcrt34tmfPdwxT9wYs04k9lUn8yb+yh+
	lIyOUvzdeuzQKjIZzUvDoBoZg0KQsGx+QuGSR6V79BeUOLx+LhobFJmvbEnC
X-Gm-Gg: ASbGncumnaEaUHc7jYlm7je4N4QYkiGpHEpUrByla8i3qBWjNqMmxbTmP76Se1nagPm
	ObPT4peJo/RDq/dlFihQ0ivquKIFGUR/eu/PMxJhKz022qioD7v0OrnKnmQ0WJfxWmPDiLNZEBn
	jF3Kmkoa6mbR5ScgpYpoWfv5JFALkTYFYoq0wID4QM7we4hjf62s2+KEQTd3U55YMqeXz/lZW2w
	qovvjdzQZrg1c9gnm7q6kifXYkxMqLS2vclS0o5vjZggbLlLWq6f7RuXYPuiRkm1ZEyaFnxjLzG
	v7dcw/YsOCAQCYHxVO9caqSXbw==
X-Google-Smtp-Source: AGHT+IHEilQrm8VE74CTRIVJXbYI24X5hbrOC34o8rHdp8QOyp8603efRQrzisOdGe1zt5eY0BMEKA==
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38bf5656b93mr39373974f8f.8.1738058914547;
        Tue, 28 Jan 2025 02:08:34 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154d:4600:f97b:2e:9c49:a657])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6b2sm14023800f8f.34.2025.01.28.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:08:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: marek.olsak@amd.com,
	l.stach@pengutronix.de,
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
Date: Tue, 28 Jan 2025 11:08:33 +0100
Message-Id: <20250128100833.8973-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Even the kerneldoc says that with a zero timeout the function should not
wait for anything, but still return 1 to indicate that the fences are
signaled now.

Unfortunately that isn't what was implemented, instead of only returning
1 we also waited for at least one jiffies.

Fix that by adjusting the handling to what the function is actually
documented to do.

Reported-by: Marek Olšák <marek.olsak@amd.com>
Reported-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org>
---
 drivers/dma-buf/dma-resv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..ae92d9d2394d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		if (ret <= 0) {
-			dma_resv_iter_end(&cursor);
-			return ret;
-		}
+		ret = dma_fence_wait_timeout(fence, intr, timeout);
+		if (ret <= 0)
+			break;
+
+		/* Even for zero timeout the return value is 1 */
+		timeout = min(timeout, ret);
 	}
 	dma_resv_iter_end(&cursor);
 
-- 
2.34.1


