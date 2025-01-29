Return-Path: <linux-media+bounces-25400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60BA21B77
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 11:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7CB8163327
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 10:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146491C68A6;
	Wed, 29 Jan 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjyrCdSM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCA1B85E4
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148326; cv=none; b=K5xyTnfxenAOzUkHa4d+kBoTf84VZDLAS/yw//2LtBn7CpwV5SlENJqii+uml8gJBMrbeJLgmEXXkj3QaiG98wXEhT5mey5SAj53nV4bil+DeGBlXARU1Y3xlVDgbxKJB08N1r8Ei5DfF4IWoPGxOXeE6OuAl6IwEZROcStoeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148326; c=relaxed/simple;
	bh=ctnIPlnolGiYKN7ZFs+jzSbQHdby+p9LuXPWm/WlufQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=COTS+bI1zPw2c59828IfdicUHBp2Exu61yTKDrbrOV2fJVacpAyyFtH0zSMxDfUsCscvdgJYWddatN7Kg/D9RnGKVxqu7dwCOX8txM4FAUyaJqg+ep6B51r4yb2hnHmBC4QL6VjuPCBSoG0XT3xu94x0ICP+NHk3Sre6/iF0Eds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjyrCdSM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so76222075e9.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 02:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148323; x=1738753123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCZc8xDP9pPSNxttm70iMigfL5th12FqcCo7IOA6V+Q=;
        b=OjyrCdSM43YCF5vqGbpv9CS/g93sSADNbusttleuZZXb1RF2Z3SoZZwpcjBguuJ+uN
         QXEZdFSozeMcs+6ZVWz657kxfGx1xIqg0lkRpuNGFxIGL6NTGnBKcQQ7aQiV9gh8ExEn
         li6m79weu1bV+5eQ9vXcx40bhBCLNKOVqeG4cjxxXgg3LpP/fspUkTdV4uzKK/kR+hzd
         E2rdjpJz+TDOgVFJ7sasQdbN5J2psz7Vqkpm4h5JvsDxECxQlootq2kMrBJBb7QBHapu
         QDxYF5r3Tu3mHOlzeWSsyYob4ihPR3WzaP3GHQNKmxoj9PHljeoNsbeMgq1VayjURCCQ
         9fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148323; x=1738753123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCZc8xDP9pPSNxttm70iMigfL5th12FqcCo7IOA6V+Q=;
        b=UATvJ0u//dyG9XsxYZDcYv2b6T6O3i+tsb0K/rqvvDd9ra29X+vPZrgVOLV34OFiJS
         c7Y0pb4Ys7IekrGCiWjd5NzpFSGkhFxKrkm6U69/kuhz+v2wg+SX9Hb1q3v6B5yIAt29
         v1Oe4LxUBEhP7yF5qxRZuerUv4QXworsgahxIRG2GqFl9Oz+uBqUYVPY5URTAdjGVHmo
         AMc2ogpvka8XNdC7MEnYKMa/UGCdu65cmfhoZnWGJHooth/2nv0SxfqG9h7PfhmPJe7N
         aPtcwJSH7aoZoSuFEOyAsEXSwpAuLWOPeVqBWlYlcM7QFjOL4F5GxHERSYK+ZRhdxMqT
         sC/w==
X-Gm-Message-State: AOJu0YwU3HkuhFQC4UdL1yRYknGEctIVHkqMrQKnGbpM+MecEAdEuW5b
	Vgz1BllYmwQrCJY9rXUlLtRq0AtTHDAdTk5nu+vA9EB2dtTJBNGS
X-Gm-Gg: ASbGncs/EBpLo7QD7QYzPK9K0+oexNrVZMQpiC8ZN4XE+zdcLU6cqQ5cKjcgA3+F54H
	MNH1MDSuM3NAh8TPpJ+vTPoWuqi8AsNJsucz/3UvS+VNyUAKx8hA78enTlj9VNAb2ssfdJTPrqz
	1G+E7bmW5pxBEEFuDtRaATRrxR4s5zt9zGfI0Xn3DiaHb/7J2BTO+DL8xjUucd7Mv/+8C4tsyvm
	4yWC1Y6y2jTRO+Fs1t9t9Q9Vpo7SLJ9mpW7TELz8X6oTCqficrC9PmO8xi0SK4jXKud0pvnWjW2
	wjuLu3hxXs4Yao+xN0vzlj8cWOWg
X-Google-Smtp-Source: AGHT+IGgtaEqtH/cW/86/vQfGKpvANAEytRLXGcfmwRSAwJkb80m0MYMQgXmvACFtIwUpFret10jlQ==
X-Received: by 2002:a05:600c:1987:b0:434:fa61:fdfb with SMTP id 5b1f17b1804b1-438dc3ccaf8mr20504355e9.18.1738148322573;
        Wed, 29 Jan 2025 02:58:42 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:155e:6600:95fb:4b3a:6bf6:e1ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc27125sm18370265e9.15.2025.01.29.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:58:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: l.stach@pengutronix.de,
	marek.olsak@amd.com,
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout v2
Date: Wed, 29 Jan 2025 11:58:41 +0100
Message-Id: <20250129105841.1806-1-christian.koenig@amd.com>
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

v2: improve code readability

Reported-by: Marek Olšák <marek.olsak@amd.com>
Reported-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org>
---
 drivers/dma-buf/dma-resv.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..c78cdae3deaf 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -684,11 +684,13 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
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
+		if (timeout)
+			timeout = ret;
 	}
 	dma_resv_iter_end(&cursor);
 
-- 
2.34.1


