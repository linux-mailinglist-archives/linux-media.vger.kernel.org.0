Return-Path: <linux-media+bounces-42827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71619B8C999
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 15:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C36A00417
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECB02F745F;
	Sat, 20 Sep 2025 13:43:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB325DD1E;
	Sat, 20 Sep 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758375801; cv=none; b=RVKC/ImObPLSf2kI43JfMnzaK4KlScn4TXjgjrXvHFj26HLDpCnGqSIeJyXyrnYwjKQR6Kc8wapcOyRhHMN/8bvUl3kKC5HQXT4iwtFe1Un8EpiM9Kv7M1PLeDKTt1d0OS8NzRziwfEzzAFaI7Lh07czn0gGRa6JIDHSUncezeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758375801; c=relaxed/simple;
	bh=zbQJHCGgM5Kr8QW7UWc85ZebxI239jbRy3/bx4Z++aI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=s27/OGtYkXc9IwVCKhzeMeo0lRD5GIwPbHb1qshuiyQSm/90VnNKDPH+srkkTfNvRNxwm5ITDlYiYnrhyxstI0tcd30on6R8WqFWIEwcyrlnqLop+zUfdwr1HRErrU/hnUR4xf0xDpzpXQ5QyMA8ZrRjlk6QR2MhBwgYLCmK/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-03 (Coremail) with SMTP id rQCowADHEXxer85o_qPvAw--.9226S2;
	Sat, 20 Sep 2025 21:43:06 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com,
	mchehab@kernel.org,
	wentong.wu@intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: pci: intel: ivsc: fix error handling in scan_one_device()
Date: Sat, 20 Sep 2025 21:42:52 +0800
Message-Id: <20250920134252.8612-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:rQCowADHEXxer85o_qPvAw--.9226S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW5CF48Ar15Wry5Kw1fCrg_yoW8GFWfpr
	W2gFWvkFW5Xr12gryDu3WUuFy5GwnIva9xGFy7Ka1xWan5Zry7tryjqa42kFWjvF92yFyj
	yr13GrW3Ar4kJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnFApUUUU
	U
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

Cc: stable@vger.kernel.org
Fixes: 78876f71b3e9 ("media: pci: intel: ivsc: Add ACE submodule")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 98310b8511b1..261b30788118 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -421,6 +421,7 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
 	}
 
 	ace->csi_dev = csi_dev;
+	put_device(csi_dev);
 
 	return 0;
 
@@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
 	cancel_work_sync(&ace->work);
 
 	device_link_del(ace->csi_link);
-	put_device(ace->csi_dev);
 
 	pm_runtime_disable(&cldev->dev);
 	pm_runtime_set_suspended(&cldev->dev);
-- 
2.17.1


