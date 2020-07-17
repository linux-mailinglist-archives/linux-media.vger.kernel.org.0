Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156EC223604
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgGQHgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgGQHgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:36:32 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0CFC061755;
        Fri, 17 Jul 2020 00:36:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w2so6276887pgg.10;
        Fri, 17 Jul 2020 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oh8xk0TqxiDTOzgBpulOm8nQjP8syH1MFAg9SRwAtT4=;
        b=IEhUtJZ4kPjIXNYFFMi/DOeJ5OnYVAZSCfGcH5mpK+5yfb7FLDMA17fbd5dluzVjME
         Qbf8pWK8jDXoADd9OQ8VFfT45Rz753vpGzy2H4fFQeH8RJyNQJ/DPrpqiFTtl6lpHO6F
         cXs99wQC2YUPOwJo6yhAUGW8Do8bFtNX3voFYRM6aTwfeIHIhd5eiXKda/YHc28w9y6I
         GHXamAPle27anmJZV0gUYlSWhXEBIogkGfSACzWHt+XdIr6j7dTL9Ivx1k7pICRbiUYP
         DV75IUdQ4Ko+u1+I08K0UJK9VIvwGAfIgvxPzjst+RvGomALAFWQj0XkMQrlAU/TiOs9
         BPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oh8xk0TqxiDTOzgBpulOm8nQjP8syH1MFAg9SRwAtT4=;
        b=a80LrDpvBv+yOYDt8ifrkcG9OggiPKNO4mB8VPsoaumqmcvbDLujOJrStKJxquXYWV
         03IUQPdO8/e5OVNtqOGNdNO/B8LgUDqfDcD9vh+tC5gdiOaVf4n+Cy82rEcdBFfko72t
         tdf0QIY3pF35bNF1ZEmrI9VzmQYo9uGeCKNsjnh4689dtUS/ufWdIc+2JSIXMY6uoo7I
         +ezMQKyoh9m8Kpfnr1Zc3HYcMfecigihJdU8g6UEfLPBpdYdWjxlcFE8WF6ip/AJBNR4
         FnxMa8NtuK4xPlgXXKFAbty45ewacesXYLENhf/up6ARX0zUIRJX4hH+KGmKyuPg7pH2
         BZkg==
X-Gm-Message-State: AOAM533gFCDIXyIKaB6jXBNm0fXPKQRWJuQ7JnNd1C/hAsCN6MS/+vbg
        4oHWwh64uTa+HADidn4H4f4=
X-Google-Smtp-Source: ABdhPJw3b8vRUI/220IpsVMXWqmvX2Wq+c3o8TLaST4AWI7DKTlQZyY24CmPdQSkBZugs+2Nav8oTA==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr6545411pfr.41.1594971392162;
        Fri, 17 Jul 2020 00:36:32 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:36:31 -0700 (PDT)
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
Subject: [PATCH v3 5/6] meye: use generic power management
Date:   Fri, 17 Jul 2020 13:04:35 +0530
Message-Id: <20200717073436.249623-6-vaibhavgupta40@gmail.com>
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

