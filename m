Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC2F20E01E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389196AbgF2Umw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731643AbgF2TOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:14:03 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A812BC0A8938;
        Mon, 29 Jun 2020 00:37:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p3so7917922pgh.3;
        Mon, 29 Jun 2020 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oh8xk0TqxiDTOzgBpulOm8nQjP8syH1MFAg9SRwAtT4=;
        b=MIatfl+V/S3Ufh1oJKUjfSYjWTmUU/I4l8mB4A/EKjCUpWBHDGtAhP83RxBxd1bHvD
         lXMsMA8EOKV6umjuLT/2CYBWWzgQplUr4UznpJFcgv+pcDVuN6EZ5wQrxpKQjprComuT
         nHDJcRnQxbMqG/GFEl0rn6CeYVw/L+y13vvJcDDNTOzb6Q+4N39cwg8hZ6ZTcAngeVsF
         1cSxq625BZofQfgcUsXpYgXMp/vbZR/x/TgmZ8l05avVmFY0MGKJbbZzoBuKQVOiN6Yx
         EGow6axDN5/am1TjjJUN8SySu0kCKAgSufBzhuUxItbrNZXquDIGAdoPAKJ3gB67pf4P
         cbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oh8xk0TqxiDTOzgBpulOm8nQjP8syH1MFAg9SRwAtT4=;
        b=r60NIcJdy2CbCvLraPAEUDAdUXEWydYkcf+/pUDMnfpvC9guf6X3H+/P/jidlXqKRK
         1laeriKMitPebmJfkH5OwZnOHOtd7vFI5ViB8LQXfTN3VaQTHtjtfc7Kx4G1t0RT8tzf
         kLYRTa8L7qVWxQhabOYE6iKKi/TSZGI4srcSOtvEPzN6GcffHLIAaQIusSvaT7QMAnGk
         h0mNnHYKPhgmsmIZe8vLqGMYAcaoSaGPtZE3CjxkgXr9P+UjJF67/5cv+k0sUtI2ZE3A
         bYAnakZrokdI3bMVO5RNbkKGGY6IscCnr8/WfZbdtjWC5xzBJlwWnXpNdutPlVMQjxQv
         ND/A==
X-Gm-Message-State: AOAM532N1+toYwjEvrQJ69YCBm6x9ca/opEohpSM2S4WL3Os6ui3kU0e
        CWw0dUfzhkabpl4sQKtKpC0=
X-Google-Smtp-Source: ABdhPJxu4ilTfacJ81Zt5Q839MN4J+yYfSr9e3LiZl9nj6Qi2F2XwvNT/FoD5dFAEy+ie8AFvMhcRw==
X-Received: by 2002:a62:54c4:: with SMTP id i187mr13504579pfb.263.1593416263218;
        Mon, 29 Jun 2020 00:37:43 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
        by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 00:37:42 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1 5/6] [media] meye: use generic power management
Date:   Mon, 29 Jun 2020 13:06:03 +0530
Message-Id: <20200629073604.205478-6-vaibhavgupta40@gmail.com>
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

The driver was invoking PCI helper functions like pci_save/restore_state()
which is not recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/meye/meye.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 73e064e6f56d..7fb3b1853b87 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1528,19 +1528,16 @@ static const struct v4l2_ctrl_ops meye_ctrl_ops = {
 	.s_ctrl = meye_s_ctrl,
 };
 
-#ifdef CONFIG_PM
-static int meye_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused meye_suspend(struct device *dev)
 {
-	pci_save_state(pdev);
 	meye.pm_mchip_mode = meye.mchip_mode;
 	mchip_hic_stop();
 	mchip_set(MCHIP_MM_INTA, 0x0);
 	return 0;
 }
 
-static int meye_resume(struct pci_dev *pdev)
+static int __maybe_unused meye_resume(struct device *dev)
 {
-	pci_restore_state(pdev);
 	pci_write_config_word(meye.mchip_dev, MCHIP_PCI_SOFTRESET_SET, 1);
 
 	mchip_delay(MCHIP_HIC_CMD, 0);
@@ -1562,7 +1559,6 @@ static int meye_resume(struct pci_dev *pdev)
 	}
 	return 0;
 }
-#endif
 
 static int meye_probe(struct pci_dev *pcidev, const struct pci_device_id *ent)
 {
@@ -1788,15 +1784,14 @@ static const struct pci_device_id meye_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, meye_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(meye_pm_ops, meye_suspend, meye_resume);
+
 static struct pci_driver meye_driver = {
 	.name		= "meye",
 	.id_table	= meye_pci_tbl,
 	.probe		= meye_probe,
 	.remove		= meye_remove,
-#ifdef CONFIG_PM
-	.suspend	= meye_suspend,
-	.resume		= meye_resume,
-#endif
+	.driver.pm	= &meye_pm_ops,
 };
 
 static int __init meye_init(void)
-- 
2.27.0

