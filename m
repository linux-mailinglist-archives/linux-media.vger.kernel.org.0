Return-Path: <linux-media+bounces-47236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E848FC66F91
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 03:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02C664F1BF3
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 02:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D39731C597;
	Tue, 18 Nov 2025 02:05:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6A26B2B0;
	Tue, 18 Nov 2025 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763431514; cv=none; b=seP/kzC+UMICYwLIImI9GnzyhZ1q6ck7qBydZM6VePPzLZ22MdrjZsi3NIVkPOZJ1NneXG4pxK+oDh48XFUbCdLG5v7h+Vqb5IsotO6LUkvQ7adEy42LbteRoeqhl3/7ST9JdQY4trbpUtj/6VOIU5C7/cGXeJ2oh6BejIS36fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763431514; c=relaxed/simple;
	bh=aF11tAyu/7W0FnhZAoee5QirTJ2xp7E3bsTzAWM2QkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CZLgbhAjS8F6EYw0yboKc+zAG+gQm4un0wNzM505gi8wtlvnt8cc9yZP3Bl6Q6XTI5mgzTRskhb9JmIEgVgp5t5J+TFPU/J9Rt6RkCHOzNtDeyDWHuPETWBNEntEFR2lJ8U4yAmM3HeJ1kyVhJmfANhP05LnqhIzGvtD5akY1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAHncxT1BtpcHwcAQ--.19560S2;
	Tue, 18 Nov 2025 10:05:07 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: mali-c55: Remove unneeded semicolon
Date: Tue, 18 Nov 2025 10:04:30 +0800
Message-Id: <20251118020430.492921-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHncxT1BtpcHwcAQ--.19560S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DXFWkZw4xWFg_yoWDGrX_u3
	W09w43ZrykAr95Kr17tF4furyjqrWkCr4fXa1IgFs8Xa4vv3WUXr92vFy7Aw47Jr12vFy7
	uFWUWrWFk3srKjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUbT5l5UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 43b834459ccf..e4118e8e0faa 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -458,7 +458,7 @@ static int mali_c55_media_frameworks_init(struct mali_c55 *mali_c55)
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to register V4L2 device\n");
 		goto err_unregister_media_device;
-	};
+	}
 
 	mali_c55->notifier.ops = &mali_c55_notifier_ops;
 	v4l2_async_nf_init(&mali_c55->notifier, &mali_c55->v4l2_dev);
-- 
2.25.1


