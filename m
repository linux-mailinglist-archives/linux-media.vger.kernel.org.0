Return-Path: <linux-media+bounces-15807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D994850C
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B0A3283B41
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDB316F0D2;
	Mon,  5 Aug 2024 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bZ1TayCK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D916C426
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894698; cv=none; b=SIw6Qt09UnmEFeERiBARhsGv9xg73KUCOlMWx2J99nDkTVDw34AfB/wx8/zrK8y3+McOBQq6Yhv7PgzwaVMwnIG1w1FbiQheF9FwtRQ587+n6HQ0CVDmkEEdQEy+bk09yq3pJ3uCSM9ItRFTSCsMU0Zy2cn54iL7p0y9ecN8aJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894698; c=relaxed/simple;
	bh=/A2DVhDVexGPPrWxZFYZsP7zHQG3D+JUkumdN+zLqIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWV8HheIcurLu/6dHsGHROp+pLIwqUEr45cjpjbLvf8CPeSZuVYKwxMX3hOZ5YmvFX+jkhurABIExsl9XdUMq9R6x1kE9BjliaXdmOeuE8YBd4XUB3NTW/w/Gy+jm9A2/zeuUtX7axg/fUtaZZs/lrOctATBG3Qj8q6laYjZaQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bZ1TayCK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=w538hv4tbbmuuhA3G35elCTLRVa2Gr7H7WrZttJZ8y0=; b=bZ1Tay
	CKs+7TMW57bLc7CdZA7KJULkP7PfD0oWgooRkub2KO6mmT/lrXO6RkYB8FKiygxt
	3K76NrGidMFdT2Kq03vnnll6zNJrTXPIkq+pnVd2ljYShFqhl+0xJAkGDpmOd/Qh
	rYWxOeFSJX9DIrl5iaSNKs2uxnvSyFPo3y0HAnLbFSUUvOmCUbai4B4za+iAV2fS
	vlD/8mu7OFXzJWZih5q/oyQptx3E0JN9sZ/sFNYj5aznJ6b5fP695ynjtv80bxYi
	b0pdojsWT55rKegWz9Ei7TXbe0iSGKgBVZkZ7nuVBICZES3bVovsa0N8g4Tc/oZa
	S+wrWIgqOZ/5P8Jw==
Received: (qmail 18160 invoked from network); 5 Aug 2024 23:51:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:28 +0200
X-UD-Smtp-Session: l3s3148p1@ndHZrfYe2JpehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 3/8] media: bdisp: use 'time_left' variable with wait_event_timeout()
Date: Mon,  5 Aug 2024 23:51:16 +0200
Message-ID: <20240805215123.3528-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named
'timeout' to store the result of wait_event_timeout() causing
patterns like:

        timeout = wait_event_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the
code self explaining.

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 1328b4eb6b9f..c7ee6e1a4451 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -1160,7 +1160,7 @@ static void bdisp_irq_timeout(struct work_struct *ptr)
 static int bdisp_m2m_suspend(struct bdisp_dev *bdisp)
 {
 	unsigned long flags;
-	int timeout;
+	long time_left;
 
 	spin_lock_irqsave(&bdisp->slock, flags);
 	if (!test_bit(ST_M2M_RUNNING, &bdisp->state)) {
@@ -1171,13 +1171,13 @@ static int bdisp_m2m_suspend(struct bdisp_dev *bdisp)
 	set_bit(ST_M2M_SUSPENDING, &bdisp->state);
 	spin_unlock_irqrestore(&bdisp->slock, flags);
 
-	timeout = wait_event_timeout(bdisp->irq_queue,
-				     test_bit(ST_M2M_SUSPENDED, &bdisp->state),
-				     BDISP_WORK_TIMEOUT);
+	time_left = wait_event_timeout(bdisp->irq_queue,
+				       test_bit(ST_M2M_SUSPENDED, &bdisp->state),
+				       BDISP_WORK_TIMEOUT);
 
 	clear_bit(ST_M2M_SUSPENDING, &bdisp->state);
 
-	if (!timeout) {
+	if (!time_left) {
 		dev_err(bdisp->dev, "%s IRQ timeout\n", __func__);
 		return -EAGAIN;
 	}
-- 
2.43.0


