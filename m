Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1A72231D8
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 05:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGQD6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 23:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgGQD6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 23:58:14 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FB9C061755;
        Thu, 16 Jul 2020 20:58:14 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gc9so5884705pjb.2;
        Thu, 16 Jul 2020 20:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJ7LqmkVpe8juQEUNoZbK+XacPFkJbeP8L2D00NIEeM=;
        b=elvRhBLc3cO2/46yLcPsc5wiNk9tJN3USV7eB0BopvIWh8osQlD098OFCjMpz7fgQw
         2RzfdcJg5x0vI8Rj+yd3ZGlxR40SHP78X69PIMt+dSiFBF7LaJpRR4dmViZGNGyGdKTu
         cAaAyGmeF662Mk9aXH6G0vWnzrSDFghijyHuD+q80tIUazfNDC4vZFQFtCfmlclPAUW8
         9F6zpVIcNfngCuL9WoRdH3oKXlcIvk297AjrbsKUwXrhgvRTH3B/UFdz5xhSXWZ29Hcc
         Cv8wGopf5PmmpeSS0cL6/gF/N9nMRlGYpBWIgiOFbv9pVEtfuspIhwfkQ7dd0+bjnUEV
         zvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJ7LqmkVpe8juQEUNoZbK+XacPFkJbeP8L2D00NIEeM=;
        b=lTbmNSpaCa5nCtjBdEIeIMQRErTz3+92YhljBr3BGyc6tnsboGOLVXnWCfPGKkeIay
         EokpPBRt3b+KEeOm2Og5ykGnVdOtXqQ3vITCKyuuhdtQn+4uJQ5K8Z6eV5DNXp6Oc3Ch
         g6cq/6oJOy5vS8teXYUVjggtlUu92ukAqFmDlgeOVfKbjZyx7UvyLDxOjBDNWQE+EAhl
         KqnXKARUBoAviH81J85FX4G2suRLWbEfDMkdGrGkVgTVrft/Cjq1Ng8Oq7MFtFSviX9e
         FPx9XbQbgxUR8kLkV5EcxeY85ZqRlBGYZ4Zss4uf7yR/WNUMUJC6119k0Nmt0QYA/mW6
         yC1w==
X-Gm-Message-State: AOAM5329zxN6z2w2KDxKXAIcClNYu0YVdC35hySN+BwF3R9OYUt0QhjO
        aM2Qwo+lXU66Su5p7PcDvUaWtN9JKqQ=
X-Google-Smtp-Source: ABdhPJzb7MmcS7XKmwV9HF96N8BsKkz/Z1Ch0PQWrCzKtu9xsLnzc1aIrEK6KlaxZCfU6/xmudLKlg==
X-Received: by 2002:a17:902:9689:: with SMTP id n9mr5960969plp.160.1594958293961;
        Thu, 16 Jul 2020 20:58:13 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 20:58:13 -0700 (PDT)
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
Subject: [PATCH v2 1/6] sta2x11: use generic power management
Date:   Fri, 17 Jul 2020 09:26:03 +0530
Message-Id: <20200717035608.97254-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
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

