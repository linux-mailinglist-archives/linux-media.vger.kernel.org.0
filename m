Return-Path: <linux-media+bounces-12443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE198D7E8B
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E55531F254D6
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED88E83CB2;
	Mon,  3 Jun 2024 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OKShxnkY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A082892
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406934; cv=none; b=IXSRp70WZHm+VOPVP37GSfPnFvOEspH7xSY1NuIIlIrKit2VJwSRhHWhP2lwwAVxmBuNamH37C+3AGmuInOh9WuQWQSEl2Kdv2KvJ2O7lIRH17I95Pd0cmgbV4h37Xq9MqlL99llMNdiEDXTFewS2w+Yyh5Jqy+/ld2GOrHfvjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406934; c=relaxed/simple;
	bh=OYEtGeODvKcwFc43M2FBJnSYNnGPH7r/JT/azuNX9PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9069OnqiRu58fq37htZ4RHGMPbeSKNUi8LMK9oUH/pZT6dqGoQBlb5IYi6S1C2OAeNhE4kIS0/baHTEKRq2P9SiCAGk9V7TLzErgVuaVWXVvZFw2LgDh4a1YDhvvqIb7h2abV5/02cUnEB/ZLLaZH2DXpbqEl+u7MdG0inpeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OKShxnkY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=QCf4T93K+AST5Yzjmn6q110PbPP55ZAkL6pQUZlJaj4=; b=OKShxn
	kY4bHndg8pVOTPAfVNHBXaM6pwrJl5nqRPTZxmuFdcslkGzcUcMVPNpMPWCHdPeH
	ZRZ/a+TURC8cZQbbDvzkTsGbg23rY5ISCDDQLIPN8Hu9mSDL5sshb/R6SqLOrPtU
	3zVGclh4HcTgAPnqZLaGXmoiWVjh0LNYX3ZjhxT/AKdFUW7b0IAc/ZwhzVBvRJ7d
	u2zNOu3A30Kc9S0jgJ6YLmUZjtybFPohBCNBH0+RX4AL73xEEGZn3TELx2EypJdj
	avjiJfxPJ+1X4tddSBlwnMTveE/lLLD+z3Gzb3SMTquYaTlTeze6DyIuoL9L/lDL
	tB30nYZ+1glTJaAQ==
Received: (qmail 1903179 invoked from network); 3 Jun 2024 11:28:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:49 +0200
X-UD-Smtp-Session: l3s3148p1@xi/u9fgZMJEgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/8] media: bdisp: use 'time_left' variable with wait_event_timeout()
Date: Mon,  3 Jun 2024 11:28:34 +0200
Message-ID: <20240603092841.9500-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_event_timeout() causing patterns like:

	timeout = wait_event_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

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


