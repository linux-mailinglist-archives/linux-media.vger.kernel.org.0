Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA7320E0BE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730529AbgF2UtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731491AbgF2TNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:41 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3641FC0A8921;
        Mon, 29 Jun 2020 00:37:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u8so7398691pje.4;
        Mon, 29 Jun 2020 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ifGLXHxiOienXo0hWvWd74w+f7qa8wNAzzXfNulzp8=;
        b=poRphb1edoRyTwY5xiBnZ6TuYDI2kCd1dYcamUyrK7RqW97yTWRcfNKEAR/DoiwYVV
         RCbv9CM/NsCtcgeaYU/Ra0HAltx0Yf7xUJIB5mOeNgxHI2+ekW5HBWxYI/UvL4rstJCF
         EPZ3ZeGi21q0M2f5RGqY3qbVbv8oQ14Q30a0OwT0r9cMMOAZCw5bH3KfMoN15H3hIps/
         qjp0EE7KBko4vCKVZpkkaJeg4hd7a7+XIHgd7wT/3CCYL/Az03roic1UTZ7MNJEHUhIw
         lxckGX5xNQ0bZJDiRdVu1Ps4xwj53SXbNwY+X5evbb1wZxz5AxI0qdTSyu4KnKAi5vXO
         X3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ifGLXHxiOienXo0hWvWd74w+f7qa8wNAzzXfNulzp8=;
        b=pZyjRx1BbSFFxp9Swlt771+fGHbp02sW2Y+d+ragKhNYt4YiBwwtJ+CczrGAOXM+XJ
         po/apj8QvjW7K0jvEqUf5MVakvdzd8SMuX2/Hg63GeNPsOY36LjTP191VfOWSg1jjiIW
         tGUPblECuyN8jnxVZXLXsLjtWsJ32lBFeiGHf7Wq3lj9BYIeLRK4l/mH6EQpStZ81Hmm
         pDaTMK3NR6Xfi32GIRoBlr0aGsiGTqKO5yXp6SQd/r48s1tG3YZi4yHRFsrZKCavidBb
         TuBmBcS4mIUDkIDCkh0Vkkzv5d5S2mHYkrITwnI9gmTGlDsftld8kDr6Utk5AECkJ0Zl
         JMsA==
X-Gm-Message-State: AOAM533n4gvJSqWDHzSaz1vWFFRAFnkbBtxRnoG6SXfcMc1KlIBzQ5TL
        vjwovNqa7zMufA9CSAZcc7I=
X-Google-Smtp-Source: ABdhPJyBHGFTB+Ll5eDRdlLwQCmQjPO4kU/xjGppeCt2UlKi5yHFmwSOWQd96Y27L1XY8Snd21oWRw==
X-Received: by 2002:a17:902:8305:: with SMTP id bd5mr12209336plb.113.1593416244715;
        Mon, 29 Jun 2020 00:37:24 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
        by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 00:37:24 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1 1/6] [media] sta2x11: use generic power management
Date:   Mon, 29 Jun 2020 13:05:59 +0530
Message-Id: <20200629073604.205478-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
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
index 798574cfad35..56804ab11c2d 100644
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
+ * @dev : PCI device
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

