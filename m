Return-Path: <linux-media+bounces-19010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F798E425
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 22:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2C028684F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 20:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B146217303;
	Wed,  2 Oct 2024 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="OBWV6+Kz";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="e1MBjdj0"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BFF2141B4;
	Wed,  2 Oct 2024 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727900914; cv=none; b=aRnIyBO3cKu+8BBJVNk52wYXhq+lpdJpihUF5/wfK3g7UzfWc/CqJtnOV90hg7gRhz/4VeyQYLbmZHglPAyNpsw0sjRvqX0SBto/G5skQ2pEaDZxgJXS8RwTx7jVHsnhHdNO2lQEzIGgOsb8+QeriNRMV8/MX9qLfVnq+CMZWdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727900914; c=relaxed/simple;
	bh=jyrfOv3Vo7vZXj87Cxj2cBgDZUbU50nrMvb3fU9+zSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yq3bmjSxpGoDTTCgCv3XQAmU3n4s8Aw3uH+nT9EZHgndn7QFwiAQNhMOiwC+vfkQJCk1w31ZX0OVOlTBpHkiIDUqW3RoST/h4W3IZ10wq6QgF+Ju/3eStOpC/sOaeFZRWsghF55EQEl3AWFjFMKCTjV638A4n7B+ybCMJhNWjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=OBWV6+Kz; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=e1MBjdj0; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1727900579; bh=jyrfOv3Vo7vZXj87Cxj2cBgDZUbU50nrMvb3fU9+zSk=;
	h=From:To:Cc:Subject:Date:From;
	b=OBWV6+Kz0ilgnMxLH0ys26e+hTpMSDK7PLUgBWDs9zuLP4Kd11edZSLNLjlgCEc7s
	 /s36NUgDX7tTp+DoyhfGEZwhJ7curfQFCA6M/XZde7Ni1czVBLqpvclp6XQrHL+UuN
	 TP9JlVNS4yNSmeroeXR802bVmqKV3kmUWBGxNKmesgocTseDTOA+a9X4eUSPSI+rNz
	 7l8czaz8utaTWay48bo4bcAlm0AqIAZWmwPSTET5g0nsW7xIVxvdppyguCirdFcHhZ
	 cyLBdEX7UrTXlZBflLJI5SErD3blZQz9dKiZACrFhu+l7+5vfE8RJJY830DeL5FAtl
	 biZtm53KuEAug==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 2E4341003C0; Wed,  2 Oct 2024 21:22:59 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1727900577; bh=jyrfOv3Vo7vZXj87Cxj2cBgDZUbU50nrMvb3fU9+zSk=;
	h=From:To:Cc:Subject:Date:From;
	b=e1MBjdj0qH4c7FvmvZPFgUJ6yj8i44tPnjGj0nehzmjk1BeNbD0sUoSztP7BZFsOW
	 IOa/KMVRLGt9UlVTff6rbI+Pg4sxPmOTBaXcAq+gKbbRg7hzwvhiiEXyePyo5G88Qh
	 7DsfgebeBRaKrd1nSOXzBWqqt4ef3Y9jxQw6b3ER8jCTzSokHMpEHvWN5UHA1AxbO1
	 TJmV+27UY/AYRXKBxkgOfYqCOnzfag62HxXL9+qh9uqoWuROE1jnioidCqOis0wxa1
	 bbUv6oAbt+5DrvrpV6ygT0P64GXQtlN9XAgvYKMIesTd/WcPVUvyEWTN+wSw9LWyPP
	 qCsC8Bd4L0afQ==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id C27CF1002BF;
	Wed,  2 Oct 2024 21:22:57 +0100 (BST)
From: Sean Young <sean@mess.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: gpio-ir-tx: Remove redundant call to local_irq_disable()
Date: Wed,  2 Oct 2024 21:22:45 +0100
Message-ID: <20241002202246.10555-1-sean@mess.org>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

local_irq_save() already disables interrupts.

Link: https://lore.kernel.org/all/20241002134843.rFHJYxSI@linutronix.de/
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index 1a8fea357f14..e185ead40464 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -78,8 +78,6 @@ static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 	ktime_t edge;
 	int i;
 
-	local_irq_disable();
-
 	edge = ktime_get();
 
 	for (i = 0; i < count; i++) {
@@ -110,8 +108,6 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 	space = DIV_ROUND_CLOSEST((100 - gpio_ir->duty_cycle) *
 				  (NSEC_PER_SEC / 100), gpio_ir->carrier);
 
-	local_irq_disable();
-
 	edge = ktime_get();
 
 	for (i = 0; i < count; i++) {
-- 
2.46.2


