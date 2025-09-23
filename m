Return-Path: <linux-media+bounces-42969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BFB93F87
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 04:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0962E2173
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 02:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A1A26FA5A;
	Tue, 23 Sep 2025 02:10:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381E31CAA4;
	Tue, 23 Sep 2025 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758593411; cv=none; b=OxI8Yj423ynC1oLfUQNyn0pG/lTM/SNcyIef3XZnT8Cye0q261K4wIO4ZbzS7X9lQQLDTa4R+WUdJGmH9mYanBMldCbDuzcAumOFBXnOJMPPaA/kv0hew8F9RdNag1LJeqTr4leq1c1Z+Gdmh6AkawBGcserqfbj2I5g2FQerE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758593411; c=relaxed/simple;
	bh=4gp7K4PMFRtKRK3AuhCH2oalVI07VCVsQmCrdNp06rU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=izQXQGdC5l0Xk3LMGRxwIJgISzOfZrdPV5KYO5+adN2f7K6OOUuvRLmliqKYool3dtzVw3QWJanClCuHM2cosUOFQXVRPvp1ZhAk4dMulveWHiBet3RkZKuiiqepAgei38r1YEmQWlZsc+v5K0cHcF2PfUB8+XYxa5mOIOtFcgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowABHnJ5pAdJoLRdiBA--.5900S2;
	Tue, 23 Sep 2025 10:09:53 +0800 (CST)
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
Subject: [PATCH v3] media: pci: intel: ivsc: fix error handling in mei_ace driver
Date: Tue, 23 Sep 2025 10:09:44 +0800
Message-Id: <20250923020944.33565-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:qwCowABHnJ5pAdJoLRdiBA--.5900S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW5CF48Ar15WryrWr1fCrg_yoW8AFWUpr
	WIgFWv9FWUWr1jgr1DZay8uFy5W3Zaya9xGr13Ga1xWan5Zry7try0qa47Aa40yFZ7CFyj
	yr1fWrWfAF4vyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOTmhUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The mei_ace driver contains a device reference count leak in
mei_ace_setup_dev_link() where device_find_child_by_name() increases
the reference count of the found device but this reference is not
properly decreased in the success path. Add put_device() in
mei_ace_setup_dev_link() and delete put_device() in mei_ace_remove(),
which ensures that the reference count of the device is correctly
managed regardless of whether the probe is successful or fails.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
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


