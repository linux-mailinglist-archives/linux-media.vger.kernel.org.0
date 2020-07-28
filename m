Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9940723079C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 12:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgG1KZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 06:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgG1KZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 06:25:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611A5C061794;
        Tue, 28 Jul 2020 03:25:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so11263232pjd.3;
        Tue, 28 Jul 2020 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aAK7NZIIkVIKxbhw+1qDbbbtZdz+xeC5teBUBWJVzQI=;
        b=Wmz69gtAJ/8KHH9ECmxzv3ZOuWv5DZ0Uz6a5vygrxjfsooBYBQfIJDbjnVvs58z7bn
         3PCWAZA17+61JdwYRbakstPRLIOXhKGtTycCBBdfUtWPPbd5QWrjNelnWXZ5CLVzuFcc
         Jw/1pMHBhfLoENQNdnlcXF9lglMgB4VIx83hbl+eQ4Dbsv1npCm1cOosvz9MapH7/FQj
         rG2t/KgZzxQniLMXFlSc/HsGECD8YBRo8YWtLVBiKcDv/Kz/h47GzWF9MPZsQ4nVDNbQ
         USkL5/AZSjI9+c3xQti2wt6zqvSlKmoR7FRmjuEmRAcw5ZkEs73Kif5YKV/03h98WShB
         AmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aAK7NZIIkVIKxbhw+1qDbbbtZdz+xeC5teBUBWJVzQI=;
        b=BxCBrqym8wXy/OyFSLPdFN+pNJ/FpD638hiy/T2mCjLWJwLHNRddMm+J6BWWDcWVlM
         i31x3gpPvaAw5tcf5Jg58+PAvJ0GcVTLti3fdeSZAccaXsq6vtNiJ20JMLKpZ8O4e1/F
         h1oizvBeMt29YUbKzENdu86ZNPyBuNg2eF8xQcQz/FtrL3JGsWqzF9SKpkkiKZbHJtTt
         1bymd7fcHetEaYhIV3LkRKTwuE3Ok+H9V6fbTI5UIldcpB3e5PohctlZjERAMdEMHjjL
         FyMWRiO4BjK1ebX5reRmNTEw+wzvO0HodOrkyB2dSJ/2kItIWc+TE/ry1B/Aas3PeClC
         yExg==
X-Gm-Message-State: AOAM530OF6P/TP7lnNYBXHfu4y8rCXED9TrPg4ZWfpm/nb1Yn/TfuPGY
        RDG4znKq6pIe/gBnc0FCoQI=
X-Google-Smtp-Source: ABdhPJyJFtv0gmRygzPhKe0KCjZFn8qDgVt/D1013y/toOihztfTXZVKr2fL1XiKuK26eTyPzA5ApQ==
X-Received: by 2002:a17:90a:8985:: with SMTP id v5mr3698662pjn.181.1595931949843;
        Tue, 28 Jul 2020 03:25:49 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id q73sm2709295pjc.11.2020.07.28.03.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 03:25:49 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1] [media] bttv: use generic power management
Date:   Tue, 28 Jul 2020 15:54:18 +0530
Message-Id: <20200728102418.1069512-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 56 ++++++++-------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9144f795fb93..cb8d955d1d5d 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -4263,15 +4263,14 @@ static void bttv_remove(struct pci_dev *pci_dev)
 	return;
 }
 
-#ifdef CONFIG_PM
-static int bttv_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused bttv_suspend(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct bttv *btv = to_bttv(v4l2_dev);
 	struct bttv_buffer_set idle;
 	unsigned long flags;
 
-	dprintk("%d: suspend %d\n", btv->c.nr, state.event);
+	dprintk("%d: suspend\n", btv->c.nr);
 
 	/* stop dma + irqs */
 	spin_lock_irqsave(&btv->s_lock,flags);
@@ -4291,42 +4290,19 @@ static int bttv_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	btv->state.gpio_enable = btread(BT848_GPIO_OUT_EN);
 	btv->state.gpio_data   = gpio_read();
 
-	/* save pci state */
-	pci_save_state(pci_dev);
-	if (0 != pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state))) {
-		pci_disable_device(pci_dev);
-		btv->state.disabled = 1;
-	}
+	btv->state.disabled = 1;
 	return 0;
 }
 
-static int bttv_resume(struct pci_dev *pci_dev)
+static int __maybe_unused bttv_resume(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct bttv *btv = to_bttv(v4l2_dev);
 	unsigned long flags;
-	int err;
 
 	dprintk("%d: resume\n", btv->c.nr);
 
-	/* restore pci state */
-	if (btv->state.disabled) {
-		err=pci_enable_device(pci_dev);
-		if (err) {
-			pr_warn("%d: Can't enable device\n", btv->c.nr);
-			return err;
-		}
-		btv->state.disabled = 0;
-	}
-	err=pci_set_power_state(pci_dev, PCI_D0);
-	if (err) {
-		pci_disable_device(pci_dev);
-		pr_warn("%d: Can't enable device\n", btv->c.nr);
-		btv->state.disabled = 1;
-		return err;
-	}
-
-	pci_restore_state(pci_dev);
+	btv->state.disabled = 0;
 
 	/* restore bt878 state */
 	bttv_reinit_bt848(btv);
@@ -4344,7 +4320,6 @@ static int bttv_resume(struct pci_dev *pci_dev)
 	spin_unlock_irqrestore(&btv->s_lock,flags);
 	return 0;
 }
-#endif
 
 static const struct pci_device_id bttv_pci_tbl[] = {
 	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT848), 0},
@@ -4357,15 +4332,16 @@ static const struct pci_device_id bttv_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, bttv_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(bttv_pm_ops,
+			 bttv_suspend,
+			 bttv_resume);
+
 static struct pci_driver bttv_pci_driver = {
-	.name     = "bttv",
-	.id_table = bttv_pci_tbl,
-	.probe    = bttv_probe,
-	.remove   = bttv_remove,
-#ifdef CONFIG_PM
-	.suspend  = bttv_suspend,
-	.resume   = bttv_resume,
-#endif
+	.name      = "bttv",
+	.id_table  = bttv_pci_tbl,
+	.probe     = bttv_probe,
+	.remove    = bttv_remove,
+	.driver.pm = &bttv_pm_ops,
 };
 
 static int __init bttv_init_module(void)
-- 
2.27.0

