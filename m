Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB47472427
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 04:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfGXCCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 22:02:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39700 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbfGXCCP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 22:02:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so20337918pgi.6;
        Tue, 23 Jul 2019 19:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MHXWLNkBi4IYlJRSCQ7XL9Ay+J09vpF8KwLPUC4SKIU=;
        b=IESMVaT8yvh5w1FIxv4hRPats+B4/ECJQn4da/rPuLLeeTvwXzcp7WupjkHeGFjVvV
         zRC1QulnMvcrutEg6lvLQBQwwuFeib0Fkg0t2GQb6QrqyFeQ8d36iJyMFXzo8BoQFRiI
         0/zYR5iXQ4G9TvZ/pUbbDl0OFZASDij6hig3+YGw5ueZlMdSL/jEF8DzkgkU47dmcEJf
         57jjFmQie9JXwdMi7BTqla4dNRDdypp9jAKUgddRoGfzbj13X6Hep+X5rj3ClCgjQTnY
         GMX4/qJHpBFucfV6XDbR9g9QZpEYDdQO8NWzBJXCPWmb1pdmr5d/tvemxr/zTVgoGPza
         Dnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MHXWLNkBi4IYlJRSCQ7XL9Ay+J09vpF8KwLPUC4SKIU=;
        b=VF8xsUFirMq09CFGwORbQ9LSt063yQFcgkQE0zXwBrL4qIUSTbLzovPnoVlc6tuOR+
         kKIfmcWu2LPaacxJ/9jB4/uF+fRnxG1bapzlOk1Jd0IFp+Ex34wO21irs/wLr4T8a5RV
         lQyvwuI9sSrJMnk6Pq0s6/0mz+3U+T+OndIQiPjvjSE1ZcIFWsC7To+cVOTDcFbuf2mw
         MuzGDSsyJ538Qm/4cNjbY8LRP8t55UKyH/WzmIyznFkwTYUDYY+iGd77ibDvDC9WhaUj
         GQVrxCB4OMSGw3riydge0OfApI1hwy2JnllF74FCauuiE9D1fEiG/mSIYHFyHuNGRQOV
         fTOQ==
X-Gm-Message-State: APjAAAUBvWaphJXC33lpUaLJa6DES/JrVOBZI2dLzLW8Ucrb9/9qJGlS
        /GVbdGYpPakftbTpnN33yaEVtL25xmk=
X-Google-Smtp-Source: APXvYqwQuaHFKLxA6edw86vkdlDAr++oHybNiK7Mu0IJOTN3gfJ8ZFjCYhs0K/0w8fTrJfDFXIF3tw==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr10206526pgq.55.1563933734972;
        Tue, 23 Jul 2019 19:02:14 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id b19sm41008521pgh.57.2019.07.23.19.02.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 19:02:14 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: pci: Use dev_get_drvdata where possible
Date:   Wed, 24 Jul 2019 10:02:06 +0800
Message-Id: <20190724020206.11044-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Change pci_set_drvdata to dev_set_drvdata
    to keep consistency.

 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 5 ++---
 drivers/media/pci/pt1/pt1.c              | 8 +++-----
 drivers/media/pci/pt3/pt3.c              | 8 +++-----
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index c1d133e17e4b..2b2c77c2fc7e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1765,7 +1765,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	cio2->base = iomap[CIO2_PCI_BAR];
 
-	pci_set_drvdata(pci_dev, cio2);
+	dev_set_drvdata(&pci_dev->dev, cio2);
 
 	pci_set_master(pci_dev);
 
@@ -2000,8 +2000,7 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 
 static int __maybe_unused cio2_resume(struct device *dev)
 {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
+	struct cio2_device *cio2 = dev_get_drvdata(dev);
 	int r = 0;
 	struct cio2_queue *q = cio2->cur_queue;
 
diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
index e51c80bc4646..06f25b658a76 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -1217,8 +1217,7 @@ static void pt1_i2c_init(struct pt1 *pt1)
 
 static int pt1_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt1 *pt1 = pci_get_drvdata(pdev);
+	struct pt1 *pt1 = dev_get_drvdata(dev);
 
 	pt1_init_streams(pt1);
 	pt1_disable_ram(pt1);
@@ -1230,8 +1229,7 @@ static int pt1_suspend(struct device *dev)
 
 static int pt1_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt1 *pt1 = pci_get_drvdata(pdev);
+	struct pt1 *pt1 = dev_get_drvdata(dev);
 	int ret;
 	int i;
 
@@ -1371,7 +1369,7 @@ static int pt1_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pt1->regs = regs;
 	pt1->fe_clk = (pdev->device == 0x211a) ?
 				PT1_FE_CLK_20MHZ : PT1_FE_CLK_25MHZ;
-	pci_set_drvdata(pdev, pt1);
+	dev_set_drvdata(&pdev->dev, pt1);
 
 	ret = pt1_init_adapters(pt1);
 	if (ret < 0)
diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c
index 7a7afae4c84c..ab09e0f2ed99 100644
--- a/drivers/media/pci/pt3/pt3.c
+++ b/drivers/media/pci/pt3/pt3.c
@@ -626,8 +626,7 @@ static void pt3_cleanup_adapter(struct pt3_board *pt3, int index)
 
 static int pt3_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt3_board *pt3 = pci_get_drvdata(pdev);
+	struct pt3_board *pt3 = dev_get_drvdata(dev);
 	int i;
 	struct pt3_adapter *adap;
 
@@ -646,8 +645,7 @@ static int pt3_suspend(struct device *dev)
 
 static int pt3_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt3_board *pt3 = pci_get_drvdata(pdev);
+	struct pt3_board *pt3 = dev_get_drvdata(dev);
 	int i, ret;
 	struct pt3_adapter *adap;
 
@@ -734,7 +732,7 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		ret = -ENOMEM;
 		goto err_release_regions;
 	}
-	pci_set_drvdata(pdev, pt3);
+	dev_set_drvdata(&pdev->dev, pt3);
 	pt3->pdev = pdev;
 	mutex_init(&pt3->lock);
 	pt3->regs[0] = pci_ioremap_bar(pdev, 0);
-- 
2.20.1

