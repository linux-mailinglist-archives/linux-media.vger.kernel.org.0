Return-Path: <linux-media+bounces-43307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D5BA7C26
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 03:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68FC31898875
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 01:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8971F3B8A;
	Mon, 29 Sep 2025 01:30:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5248013777E;
	Mon, 29 Sep 2025 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759109439; cv=none; b=pKVRPPPFtnNGrmdBCtDtdRw3fw9yJtu1DGTXKE+Ow7l6q94+R3kITLcpqUmwgIO1/l1KjQia6V11DoKPS/2Y54RbauwYhdcFurSau1KP5D5TJwLK4wzXIkzVDja3VLx7zWNMPmQCt58ljd5cOz7RWRq5dj2/OCu6Kq8RszMFId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759109439; c=relaxed/simple;
	bh=jgYfnGlpJUsBLnIp0dgG9Um0H/BiAyG/N/ufXTWeP7g=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Tuna/Fz8wTFMWXE+KpZzKYNy4oxjDBs2Arf3sY0LEDNLBVtNhe56oLXt56peyDNuWr1snK6r+FCJPJIwa2qduV0obBKlRsFvbFeb0kqmW3UADxvIIKyKu79kdBnl//qfO/xL1LHF8IjtqVG8e3+zG9eqg8ubfX3GDd/3K/oPftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-05 (Coremail) with SMTP id zQCowADHaRMg4dloIUR_CA--.42010S2;
	Mon, 29 Sep 2025 09:30:19 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com,
	mchehab@kernel.org,
	wentong.wu@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH v5] media: pci: intel: ivsc: improve device reference counting in mei_ace driver
Date: Mon, 29 Sep 2025 09:30:07 +0800
Message-Id: <20250929013007.1920-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:zQCowADHaRMg4dloIUR_CA--.42010S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWfWrWDAr1kCryDtF1fWFg_yoW8CF1kpr
	Wq9FWkKFWUXr4jgr1UAa18ZFyrWa1Sya9xGr43Aa1xu3W5Z347try0qa47Ca4YqFZrCFy7
	AF13KryfAF40yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb9mitUU
	UUU==
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


