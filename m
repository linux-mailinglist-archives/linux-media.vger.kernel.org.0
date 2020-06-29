Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0363020E119
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389778AbgF2UwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731372AbgF2TN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:27 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE899C0A8939;
        Mon, 29 Jun 2020 00:37:48 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id o1so195020plk.1;
        Mon, 29 Jun 2020 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
        b=soWLyATDxsP3lSKBdnbKGoDIiCBQaXGh9rWTzN54ndzKrsUNd0G0F2H/4XSCMotvjR
         YSPGri8ucPhLiObQp+xsTU6lkzmVJymhJF9wc0Ue711DLzMZWvpfsVh7IQOz85b936Qn
         Mdnl7wrMDLGJFMOOmIoqg0TXIGB74cL/i6YwdqkKPbiKx2++8a9enxWsKUq7Pxt5/yup
         udl+xB/D51qwssbd3BQlZqN82j0YURu669zYz2nNRCWYDpEA0NbfiwL13/FaR8pL1SUv
         Udijy41l1GPzKMzS8sM4HfGclXHANrqlirJxzN+N+piO83H3P9+vKgOLNipO85hXgl0H
         EPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
        b=cgs0pkVkOZZkrVjG8ywlr+IwyFb5zrha10gwz8h3Dg43SOxkoy32CpJkQ1EUXWZrFD
         SCWeQtP32dNRAwgV68AiOSyX2H5CvgzmFM6DItqXq/rYLZla0CctQKIyPqp6Wi6hAEFI
         2J0XO7z/D19CJ52DI1cbkCY/5DpycIIfN6gkz14EjsW0OT2/9/0xLtJXXnn0g6W48fIZ
         PqY4m8LQOaHEWAsDEoMPqKv5iad9NNC5QSGgyZuzYoLstdVayQBU6vxNq7XwYF0JInlV
         Mcjqil2zxKL7NqAm53QpZSgvO+vnswz+6sP5JEPXgFofErdVx2G4e1/eJola0PX3Bt4P
         0/+g==
X-Gm-Message-State: AOAM530lN1x4xD/kypI53Ca/scRYVqNMBlBE5Nyr1AF7XuTzadWKCdfn
        1BKU/g9rIXRrLkZXjtlFOSQ=
X-Google-Smtp-Source: ABdhPJz3FvoamkU1GXqNQu9Zc7XjkNo/hUIxVOEgR9mxBWcqDHqy9UnEwm4JEcoy46VmRIDPIGi8vw==
X-Received: by 2002:a17:90a:df11:: with SMTP id gp17mr15071981pjb.188.1593416268444;
        Mon, 29 Jun 2020 00:37:48 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
        by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 00:37:48 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1 6/6] [media] tw68: use generic power management
Date:   Mon, 29 Jun 2020 13:06:04 +0530
Message-Id: <20200629073604.205478-7-vaibhavgupta40@gmail.com>
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

Compile-Tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/tw68/tw68-core.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index b45f3ffa3de5..065420b09250 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -359,10 +359,9 @@ static void tw68_finidev(struct pci_dev *pci_dev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 }
 
-#ifdef CONFIG_PM
-
-static int tw68_suspend(struct pci_dev *pci_dev , pm_message_t state)
+static int __maybe_unused tw68_suspend(struct device *dev_d)
 {
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
 	struct tw68_dev *dev = container_of(v4l2_dev,
 				struct tw68_dev, v4l2_dev);
@@ -373,24 +372,19 @@ static int tw68_suspend(struct pci_dev *pci_dev , pm_message_t state)
 
 	synchronize_irq(pci_dev->irq);
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
 	vb2_discard_done(&dev->vidq);
 
 	return 0;
 }
 
-static int tw68_resume(struct pci_dev *pci_dev)
+static int __maybe_unused tw68_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct tw68_dev *dev = container_of(v4l2_dev,
 					    struct tw68_dev, v4l2_dev);
 	struct tw68_buf *buf;
 	unsigned long flags;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	/* Do things that are done in tw68_initdev ,
 		except of initializing memory structures.*/
 
@@ -408,19 +402,17 @@ static int tw68_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
+static SIMPLE_DEV_PM_OPS(tw68_pm_ops, tw68_suspend, tw68_resume);
+
 static struct pci_driver tw68_pci_driver = {
-	.name	  = "tw68",
-	.id_table = tw68_pci_tbl,
-	.probe	  = tw68_initdev,
-	.remove	  = tw68_finidev,
-#ifdef CONFIG_PM
-	.suspend  = tw68_suspend,
-	.resume   = tw68_resume
-#endif
+	.name	   = "tw68",
+	.id_table  = tw68_pci_tbl,
+	.probe	   = tw68_initdev,
+	.remove	   = tw68_finidev,
+	.driver.pm = &tw68_pm_ops,
 };
 
 module_pci_driver(tw68_pci_driver);
-- 
2.27.0

