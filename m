Return-Path: <linux-media+bounces-50741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD4D22235
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 03:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE08303B1A8
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 02:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06AD2673AA;
	Thu, 15 Jan 2026 02:36:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3238221FDE;
	Thu, 15 Jan 2026 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444564; cv=none; b=VoZzthvhopcs/G86KpyLO1qr+Mzvvse33MWgefKtpe/IVdgX91Mfn7oQEcIQCAucAkew0+WGJ0/Dl4sFnXeaUBJzffcyZqY3Rkws91kzCEttQ06xcGb3GdOgpG43Z7zKNNccjORXy83EIWn4r7YceQizgh8P+VYoAObSrn08ZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444564; c=relaxed/simple;
	bh=fjAwJbx6/5I/lY349Xw5qM3nrMRr1HK8IJvTDBxQU48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I3KXdJSJ6HZuFjDc1TfAvubXO6E0CddDIm4qHQ/Q39b96R5N80jL6xBbIHFlIZQ3+LcsK7Gn/Bo/4RznKB6iYhNyCtH8tSxtygSfzCCAYT0tMsWvaMGh7Iwx996/B6cF6wQCeJ2zbHWCt+HQWzqu35C925J3+FgEvkH5RfXfkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAXOuGIUmhpdFcxBQ--.31900S2;
	Thu, 15 Jan 2026 10:35:52 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: mali-c55: core: Remove redundant dev_err()
Date: Thu, 15 Jan 2026 10:35:16 +0800
Message-Id: <20260115023516.4142364-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXOuGIUmhpdFcxBQ--.31900S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1xtry3JF1ktw4kGryUZFb_yoWDAwc_Ca
	1Uu3y7X348AFyktr17tF1S9ryjyrZ5Cr48XanxKFsIq34vy3WUJr92vF1xZ347Xr42yFyU
	ZFW5WrW3u3sIkjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0pRNdbnUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The platform_get_irq_byname() function already prints an error message
internally upon failure using dev_err_probe(). Therefore, the explicit
dev_err() is redundant and results in duplicate error logs.

Remove the redundant dev_err() call to clean up the error path.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 43b834459ccf..ab8f7f6f3be1 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -868,7 +868,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	mali_c55->irqnum = platform_get_irq(pdev, 0);
 	if (mali_c55->irqnum < 0) {
 		ret = mali_c55->irqnum;
-		dev_err(dev, "failed to get interrupt\n");
 		goto err_deinit_media_frameworks;
 	}
 
-- 
2.25.1


