Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF42D2235FB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgGQHgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgGQHgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:36:02 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF642C061755;
        Fri, 17 Jul 2020 00:36:02 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p1so5105782pls.4;
        Fri, 17 Jul 2020 00:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJ7LqmkVpe8juQEUNoZbK+XacPFkJbeP8L2D00NIEeM=;
        b=G67rLs/TLZkC5UuER52F4YTtiZjFUdJpCtfnKWxNG21TfzHY2qo1AcnWVRQK8Rvlg3
         jyHoToedxoFSpbKWh15DQeBtjstwIY5r5Am6q2YDSQMOYMj9WJc+rBDwwWL4yzyrQqo0
         sC7LRifswOze9VPLv0zr/ElZTU6MwJWu1C9AQnMBFuoCBd4ktvKlW9HcdAz44frNDdOy
         nRbv3bpFq1MYlWF61lkDR4hgmZd9YlX9V+BZW5MIByiSKc4eGpL06e8WxFxxowbXc4KJ
         Lyg8yIP27E+NLChb90ypi0IHFTLlYmYeaRkHEZNIPVd4Ib//CNGoeHXFJi5qU23149D/
         c1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJ7LqmkVpe8juQEUNoZbK+XacPFkJbeP8L2D00NIEeM=;
        b=SB3chJI01wQPQR3gUu81Xcl7gw5ssf/4STh9f+5ULJF0mM/RnUrUK5SzYmGxpypkVh
         u/IdpWK+T1Iqa/CmabNhO8xR70oBQ/HV0qw6Q9TFQMvs90GQVditK9Uvt94wvicGPXcA
         u3GbqIoNfj3kMIw7kTXmS408H7gR2Bma4v6qvXirkbqTgRSSyi9BmlWs+hc0bybiSjFP
         x2HyvKCSeWAZ1Oal9D6/n4hLPlrSfh8OysU47Tg84BMKZqHH9u0fDS5lR0+JZ3tphy0M
         hilyhXWLBbxXIK1vsyUXVGVdx4E35cdTZ9GMWy1rM82wXWq2kx3D9TDdZ66t+nlBKYcW
         VKww==
X-Gm-Message-State: AOAM533xBieGaDLC4jOM2AnM/8fIbBa5xDBgaJg+IAs9CGYQaUYAInLR
        R1Qp5HzaHwLdVvLksGtNn1U=
X-Google-Smtp-Source: ABdhPJxCZJP03Lsn6pv+wb3Hucu6s+XuXSpBwHtLrHKchXnK+uWwU/XYJqeOSxAwIYnlVY4R1SLUIA==
X-Received: by 2002:a17:90a:5d15:: with SMTP id s21mr9011726pji.154.1594971362315;
        Fri, 17 Jul 2020 00:36:02 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:36:01 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 1/6] sta2x11: use generic power management
Date:   Fri, 17 Jul 2020 13:04:31 +0530
Message-Id: <20200717073436.249623-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
References: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

Thus, there is no need to call the PCI helper functions like
pci_enable_device(), pci_save/restore_sate(), etc.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 63 ++++++-------------------
 1 file changed, 15 insertions(+), 48 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 798574cfad35..0fdb0fd6e764 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -1167,21 +1167,18 @@ static void sta2x11_vip_remove_one(struct pci_dev *pdev)
 	 */
 }
 
-#ifdef CONFIG_PM
-
 /**
  * sta2x11_vip_suspend - set device into power save mode
- * @pdev: PCI device
- * @state: new state of device
+ * @dev_d: PCI device
  *
  * all relevant registers are saved and an attempt to set a new state is made.
  *
  * return value: 0 always indicate success,
  * even if device could not be disabled. (workaround for hardware problem)
  */
-static int sta2x11_vip_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused sta2x11_vip_suspend(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct sta2x11_vip *vip =
 	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
 	unsigned long flags;
@@ -1198,15 +1195,8 @@ static int sta2x11_vip_suspend(struct pci_dev *pdev, pm_message_t state)
 		vip->register_save_area[SAVE_COUNT + IRQ_COUNT + i] =
 		    reg_read(vip, registers_to_save[i]);
 	spin_unlock_irqrestore(&vip->slock, flags);
-	/* save pci state */
-	pci_save_state(pdev);
-	if (pci_set_power_state(pdev, pci_choose_state(pdev, state))) {
-		/*
-		 * do not call pci_disable_device on sta2x11 because it
-		 * break all other Bus masters on this EP
-		 */
-		vip->disabled = 1;
-	}
+
+	vip->disabled = 1;
 
 	pr_info("VIP: suspend\n");
 	return 0;
@@ -1214,45 +1204,23 @@ static int sta2x11_vip_suspend(struct pci_dev *pdev, pm_message_t state)
 
 /**
  * sta2x11_vip_resume - resume device operation
- * @pdev : PCI device
- *
- * re-enable device, set PCI state to powered and restore registers.
- * resume normal device operation afterwards.
+ * @dev_d : PCI device
  *
  * return value: 0, no error.
  *
  * other, could not set device to power on state.
  */
-static int sta2x11_vip_resume(struct pci_dev *pdev)
+static int __maybe_unused sta2x11_vip_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct sta2x11_vip *vip =
 	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
 	unsigned long flags;
-	int ret, i;
+	int i;
 
 	pr_info("VIP: resume\n");
-	/* restore pci state */
-	if (vip->disabled) {
-		ret = pci_enable_device(pdev);
-		if (ret) {
-			pr_warn("VIP: Can't enable device.\n");
-			return ret;
-		}
-		vip->disabled = 0;
-	}
-	ret = pci_set_power_state(pdev, PCI_D0);
-	if (ret) {
-		/*
-		 * do not call pci_disable_device on sta2x11 because it
-		 * break all other Bus masters on this EP
-		 */
-		pr_warn("VIP: Can't enable device.\n");
-		vip->disabled = 1;
-		return ret;
-	}
 
-	pci_restore_state(pdev);
+	vip->disabled = 0;
 
 	spin_lock_irqsave(&vip->slock, flags);
 	for (i = 1; i < SAVE_COUNT; i++)
@@ -1266,22 +1234,21 @@ static int sta2x11_vip_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif
-
 static const struct pci_device_id sta2x11_vip_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_STMICRO, PCI_DEVICE_ID_STMICRO_VIP)},
 	{0,}
 };
 
+static SIMPLE_DEV_PM_OPS(sta2x11_vip_pm_ops,
+			 sta2x11_vip_suspend,
+			 sta2x11_vip_resume);
+
 static struct pci_driver sta2x11_vip_driver = {
 	.name = KBUILD_MODNAME,
 	.probe = sta2x11_vip_init_one,
 	.remove = sta2x11_vip_remove_one,
 	.id_table = sta2x11_vip_pci_tbl,
-#ifdef CONFIG_PM
-	.suspend = sta2x11_vip_suspend,
-	.resume = sta2x11_vip_resume,
-#endif
+	.driver.pm = &sta2x11_vip_pm_ops,
 };
 
 static int __init sta2x11_vip_init_module(void)
-- 
2.27.0

