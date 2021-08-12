Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649313EA1FA
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 11:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbhHLJZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 05:25:26 -0400
Received: from mail.ispras.ru ([83.149.199.84]:40794 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235886AbhHLJZP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 05:25:15 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 35C1D40755FC;
        Thu, 12 Aug 2021 09:24:40 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Akihiro Tsukada <tskd08@gmail.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kirill Shilimanov <kirill.shilimanov@huawei.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: pt3: Fix IO unmapping on error handling paths in probe
Date:   Thu, 12 Aug 2021 12:24:35 +0300
Message-Id: <20210812092435.8255-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pt3_probe() did not free one of IO mappings in case when one of them was
successful while another one failed. The patch fixed that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
---
 drivers/media/pci/pt3/pt3.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c
index c0bc86793355..f1bd2644435b 100644
--- a/drivers/media/pci/pt3/pt3.c
+++ b/drivers/media/pci/pt3/pt3.c
@@ -736,19 +736,24 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pt3->pdev = pdev;
 	mutex_init(&pt3->lock);
 	pt3->regs[0] = pci_ioremap_bar(pdev, 0);
-	pt3->regs[1] = pci_ioremap_bar(pdev, 2);
-	if (pt3->regs[0] == NULL || pt3->regs[1] == NULL) {
+	if (pt3->regs[0] == NULL) {
 		dev_err(&pdev->dev, "Failed to ioremap\n");
 		ret = -ENOMEM;
 		goto err_kfree;
 	}
+	pt3->regs[1] = pci_ioremap_bar(pdev, 2);
+	if (pt3->regs[1] == NULL) {
+		dev_err(&pdev->dev, "Failed to ioremap\n");
+		ret = -ENOMEM;
+		goto err_iounmap0;
+	}
 
 	ver = ioread32(pt3->regs[0] + REG_VERSION);
 	if ((ver >> 16) != 0x0301) {
 		dev_warn(&pdev->dev, "PT%d, I/F-ver.:%d not supported\n",
 			 ver >> 24, (ver & 0x00ff0000) >> 16);
 		ret = -ENODEV;
-		goto err_iounmap;
+		goto err_iounmap1;
 	}
 
 	pt3->num_bufs = clamp_val(num_bufs, MIN_DATA_BUFS, MAX_DATA_BUFS);
@@ -756,7 +761,7 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pt3->i2c_buf = kmalloc(sizeof(*pt3->i2c_buf), GFP_KERNEL);
 	if (pt3->i2c_buf == NULL) {
 		ret = -ENOMEM;
-		goto err_iounmap;
+		goto err_iounmap1;
 	}
 	i2c = &pt3->i2c_adap;
 	i2c->owner = THIS_MODULE;
@@ -801,11 +806,12 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i2c_del_adapter(i2c);
 err_i2cbuf:
 	kfree(pt3->i2c_buf);
-err_iounmap:
-	if (pt3->regs[0])
-		pci_iounmap(pdev, pt3->regs[0]);
+err_iounmap1:
 	if (pt3->regs[1])
 		pci_iounmap(pdev, pt3->regs[1]);
+err_iounmap0:
+	if (pt3->regs[0])
+		pci_iounmap(pdev, pt3->regs[0]);
 err_kfree:
 	kfree(pt3);
 err_release_regions:
-- 
2.26.2

