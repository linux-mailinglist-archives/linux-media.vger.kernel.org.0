Return-Path: <linux-media+bounces-43526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B8BB2929
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 08:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BB724A4F2A
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 06:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2628A2820D5;
	Thu,  2 Oct 2025 06:01:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A342134CB;
	Thu,  2 Oct 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759384898; cv=none; b=EDwpuEwdsqqHMrH8/hh7fDXn3M0vE8j1ra7AGnu0SZ2ApP9qfWtpKiDEV4bEoo1w1o9A1ezyB6v7vXk65iLWiRRQavlKygQZpoi63SWBxrMCTndinmeUFlyZqk/QC9KXELiclSr7A1NE8LGQsaaby8eBfrgDQVCMm7UpDVtmUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759384898; c=relaxed/simple;
	bh=RdH0Ayi/D+smqlS4+smrWhGM7QS2ivl86vb7BMiXliY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=rKbLmwPO4m+XDvQGfQXogfbEMDEWv+21MydQ6SMLBvuj//OpBJz+itmGCxb2NvCVGtmnSvPqtmRFaB5ocnU95q1NVST9SA9U0Q/iOkbDUBZlmoapiIYSuifjVefMZc629l5wNjvvvE1zSSkY4XByLdzznUrhWeITMQs697C8jDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-05 (Coremail) with SMTP id zQCowACnRhAcFd5oXDZ8Cg--.24552S2;
	Thu, 02 Oct 2025 14:01:09 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH v6] media: pci: intel: ivsc: improve device reference counting in mei_ace driver
Date: Thu,  2 Oct 2025 14:00:58 +0800
Message-Id: <20251002060058.25087-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:zQCowACnRhAcFd5oXDZ8Cg--.24552S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4kuryDWw47XF1xZrWkZwb_yoW8CrWrpr
	WqgFWv9FWUXrWjgF1UCa18ZF9Yga13ta9xGrW3Ga1xu3W5Z347try0qa47Aa40gFZ7A3W7
	AF1YgryfZr4Fyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Put the reference to csi_dev acquired during driver probe in
mei_ace_setup_dev_link() inside the same function, instead of during
driver unbind in mei_ace_remove(). This can be done as
device_link_add() already takes a reference to csi_dev.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v6:
- modified the commit message as suggestions;
Changes in v5:
- jumped to err instead of err_put to avoid calling put_device() again in err_put as reviewer's instructions;
Changes in v4:
- updated the subject as suggestions;
Changes in v3:
- deleted the tag of Fixes and CC, and moved put_device() to immediately after device_link_add() as suggestions;
Changes in v2:
- modified the put_device() operations and the patch title as suggestions.
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 98310b8511b1..b306a320b70f 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -414,10 +414,11 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
 	/* setup link between mei_ace and mei_csi */
 	ace->csi_link = device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
 					DL_FLAG_RPM_ACTIVE | DL_FLAG_STATELESS);
+	put_device(csi_dev);
 	if (!ace->csi_link) {
 		ret = -EINVAL;
 		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
-		goto err_put;
+		goto err;
 	}
 
 	ace->csi_dev = csi_dev;
@@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
 	cancel_work_sync(&ace->work);
 
 	device_link_del(ace->csi_link);
-	put_device(ace->csi_dev);
 
 	pm_runtime_disable(&cldev->dev);
 	pm_runtime_set_suspended(&cldev->dev);
-- 
2.17.1


