Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72230223607
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgGQHgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbgGQHgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:36:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FFDC061755;
        Fri, 17 Jul 2020 00:36:38 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so5100484plx.6;
        Fri, 17 Jul 2020 00:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
        b=bVorRNjURfPpm/ZSKqoTOVMR2C7tuSII04c0fZPgoqxiw+TqPgU/zea0VfdX0tY28p
         ePSlmNOrYHl/3msFvHYRzacBAnn11tqA5lVhGLjVv6mol7+1E/4VpY5rXHIQ0ZOx0WE4
         2Q2RkzYpgg1DzaK/lHWk3cGOH5KI68m8hHaLc/YMx4LQH6CvEIgNLXsfjXmBp1s8nUaT
         ape+r6gbYCgo+UK5Yb9FxiRzfdE1G83JPO91er6wTnZvhrv0WEUN9OYyz8i+fv8HJTXz
         KJjifQgJYzpqLB6OJBPCOKcApR2jhUIyHZZqHs+NqMMXceyWaCV/youL4Yf0MTxXCx8S
         /wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DRaWMxjlA+y9G9x8PTReSZmOggDcJdYbq3Dmt0Z1Wlg=;
        b=ejTz3E56hLgxQD8eVfLy5bQlu9taij3N8akI6gslafIDdCUSRDFhTY+HEy/E18xZ6v
         D9svgVH0g+pG3hEpvE0CDpzthY/gA5NJrBhIqueqTwLKhAfycunnAXzPMu/f2DSXOOx6
         nVW9C6JGwn40Zyw6el9oYbPNf9s6oAZJyDmKVq6Yt4jFOQ6JJ8t7AryQV+yRQ4ed/BnH
         MRz+NzMRdwbLe+mEdjJoEeG4SrijBWG4Ae3Ukvq4GLsF2IQmYRmsl1b9j6K+z2vclv8o
         hdhzNN6lFtXhLupSV6hpV1AINhSbLMJBu5r09DH9XxTvEXC9TXuhKH02BcNopIu0E2+B
         bVvA==
X-Gm-Message-State: AOAM530zNnoAYdP88UjtUF67ANvTr5kwsImNLRRJgIWYE80nyoFUv4n4
        MgnuWMmKp5UJ+5AgSnd8Y9I=
X-Google-Smtp-Source: ABdhPJxW65z1lWnxDX/TTJuegvDEfRlYsjEWa8/jsuGw1+KM8ruoBqM7qzWrTX0AYxVD0xQRndRLqQ==
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr6569011plo.262.1594971397589;
        Fri, 17 Jul 2020 00:36:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:36:37 -0700 (PDT)
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
Subject: [PATCH v3 6/6] tw68: use generic power management
Date:   Fri, 17 Jul 2020 13:04:36 +0530
Message-Id: <20200717073436.249623-7-vaibhavgupta40@gmail.com>
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

