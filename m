Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E603211C6
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 09:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhBVIIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 03:08:54 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:49331 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230428AbhBVIIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 03:08:50 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPD0MBr_1613981284;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPD0MBr_1613981284)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 22 Feb 2021 16:08:04 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     maintainers@bluecherrydvr.com
Cc:     anton@corp.bluecherry.net, andrey_utkin@fastmail.com,
        ismael@iodev.co.uk, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] media: solo6x10: Switch to using the new API kobj_to_dev()
Date:   Mon, 22 Feb 2021 16:08:01 +0800
Message-Id: <1613981281-52838-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fixed the following coccicheck:
./drivers/media/pci/solo6x10/solo6x10-core.c:371:60-61: WARNING
opportunity for kobj_to_dev()

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/pci/solo6x10/solo6x10-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index d497afc..4a546ee 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -368,7 +368,7 @@ static ssize_t sdram_show(struct file *file, struct kobject *kobj,
 			  struct bin_attribute *a, char *buf,
 			  loff_t off, size_t count)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct solo_dev *solo_dev =
 		container_of(dev, struct solo_dev, dev);
 	const int size = solo_dev->sdram_size;
-- 
1.8.3.1

