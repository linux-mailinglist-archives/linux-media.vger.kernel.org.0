Return-Path: <linux-media+bounces-45214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E9BFB26E
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8C2650730A
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D775C30AAC7;
	Wed, 22 Oct 2025 09:26:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F723128A4;
	Wed, 22 Oct 2025 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125170; cv=none; b=cSPFIAcvOC+c56lowoMhhLw5MCXshMyH5XojLbG/iB63dO1m1FHJkoO6CHlJeKapCYmiSgHPgEOJGSZoUebnl3whFmuSBjIslJrsA3fw8Cc6SUD5huf/ScTzuh9jvSjorSWKmpyLVhzLbcg8Cd7YshpKl9P8ywRqqxaZ/frDAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125170; c=relaxed/simple;
	bh=RdH0Ayi/D+smqlS4+smrWhGM7QS2ivl86vb7BMiXliY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=CyH4R2DmmzVaQLJS1FcflGVlAwV3hJhaZtPvIYChrBK6cYa70vC4qqXBRHiHev7WC7gRucC4HRZs0XxK5PnKVcJulQWkMcaCDeEHppfGe0d8QO7xQi9JAvnmfMgKNtyFPY60isVG/Q8IWLAMUo3Cs3Oli3csY04qFxmGkmz48sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowAC3DqEbo_hoaWrbEw--.34368S2;
	Wed, 22 Oct 2025 17:25:55 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	lixu.zhang@intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH v6 RESEND] media: pci: intel: ivsc: improve device reference counting in mei_ace driver
Date: Wed, 22 Oct 2025 17:25:45 +0800
Message-Id: <20251022092545.4640-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:qwCowAC3DqEbo_hoaWrbEw--.34368S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4kuryDWw47XF1xZrWkZwb_yoW8CrWrpr
	WqgFWv9FWUXrWjgF1UCa18ZF9Yga13ta9xGrW3Ga1xu3W5Z347try0qa47Aa40gFZ7A3W7
	AF1YgryfZr4Fyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU538nUUUUU
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


