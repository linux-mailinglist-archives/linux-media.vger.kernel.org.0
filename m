Return-Path: <linux-media+bounces-42971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87571B941DE
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 05:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58AA57AB5EB
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 03:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AFF2641E7;
	Tue, 23 Sep 2025 03:37:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B3154BF5;
	Tue, 23 Sep 2025 03:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758598636; cv=none; b=D9mf0GeL/xDoGaTJZZGCSVYmWmIkdGwn6J0gcKcwR3ppem5sRBt/FjIY266ulvwP2y2b+BjWdBt5UKCCmR0WNlBz3tNlRGSZU9Fgfxt6TVRy9f6XBMFyoSwEW28WaoeOQ7ZwM8L2Lj6g7ftJE1JUpxBTdf3j41a25n3w9Fzuyis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758598636; c=relaxed/simple;
	bh=bcJEabfV0YlHLCZPhsnZKRvf+73Hlm6DDVRVu8u4h/4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=hEtgz4l4QfPUodJtb0zwaxDzZvNGYZJyQZK61ZnzjilkCuc1krM+LA1Z7GSCkBHP/yrC9/jDPIUByafdhTdZWZHuF6AGUtqe6rlMpcTHhLXGj6o4xUgb/GU7MqA2Irbl2Mnoc/J9tnPjzgsNcRtPL4tS+t8uOw7Pxqv/3qB7Tto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-05 (Coremail) with SMTP id zQCowADnhxHUFdJoI+xsBA--.55543S2;
	Tue, 23 Sep 2025 11:37:00 +0800 (CST)
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
Subject: [PATCH v4] media: pci: intel: ivsc: improve device reference counting in mei_ace driver
Date: Tue, 23 Sep 2025 11:36:50 +0800
Message-Id: <20250923033650.4408-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:zQCowADnhxHUFdJoI+xsBA--.55543S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWfWrWDAr1kCryDtF1fWFg_yoW8Ww47pr
	W0gFZYkFWUXr4jgr1DAa48uFyrW3Zava9xJFW3Jw4xW3Z5Z347tryjqa48Ca40qFZ7CFyU
	JF1agry3AF40yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3kucUUUUU=
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The device reference counting in mei_ace_setup_dev_link() was
incomplete, as the reference acquired by device_find_child_by_name()
was not released immediately on the success path. Add put_device() to
properly balance the reference count. Additionally, the redundant
put_device() in mei_ace_remove() is removed.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v4:
- updated the subject as suggestions;
Changes in v3:
- deleted the tag of Fixes and CC, and moved put_device() to immediately after device_link_add() as suggestions;
Changes in v2:
- modified the put_device() operations and the patch title as suggestions.
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 98310b8511b1..9969c02da671 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -414,6 +414,7 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
 	/* setup link between mei_ace and mei_csi */
 	ace->csi_link = device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
 					DL_FLAG_RPM_ACTIVE | DL_FLAG_STATELESS);
+	put_device(csi_dev);
 	if (!ace->csi_link) {
 		ret = -EINVAL;
 		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
@@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
 	cancel_work_sync(&ace->work);
 
 	device_link_del(ace->csi_link);
-	put_device(ace->csi_dev);
 
 	pm_runtime_disable(&cldev->dev);
 	pm_runtime_set_suspended(&cldev->dev);
-- 
2.17.1


