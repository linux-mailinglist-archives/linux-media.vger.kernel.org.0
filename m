Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8B12231DE
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 05:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGQD6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 23:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgGQD6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 23:58:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88FF0C061755;
        Thu, 16 Jul 2020 20:58:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k5so5743130pjg.3;
        Thu, 16 Jul 2020 20:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
        b=FlNGeWoeLNW1CueGjKJP4zKlf75P8yTic2DIyVAy5m4kr113nocQF4ToxNJQYkdJfQ
         dta7VnA8yHBeGnmorbQ1y6OY/Ee9NbWOujMaStD5nRxBBZ9l5AeVggtPN6OamSeO+lOE
         Npc4QbbQFB9uaRrXERaLyiShQYRqZeTCS3o1dBrM1GVn9dcXgq87MLtfI43CHlotWeqi
         cN2xsgqFPw6Yye4LJCc0T+TBPOILOOzSXUfEGLazwO9hbhbc0Rz4LEyzW4Cu5gFwZilS
         T8oTUpTuyzrkd85i4KWlBB01p0FEKRf0bftbZ34DQbFO5Vk9dP6/WOIwy7Otp2cHDvRG
         XeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
        b=qSLPNCsKNuHmAIBZl1aX3n/ISIS/bfNYc8YTnYD/u1j160gW66Tv11QKp+Vj2XBkfu
         yRdVZ2fE49Bn9wd0IYpcKrjoq6+FpAOL7Ix3NLat1m7thAu2u1XkCUtQSDI71zjkJnjT
         Ojb52DG/I8kF/Yp7THlnP0gD89OiE/faB4uGh7m4viGltaShG5pNLlNonTyRnAh0G76z
         ZzJZOXN6ZgxZ+/Xj5k9c9+DTg+f1iOW5DntNSTTCj3sBXvDbNyWseeofcyonZE3umsPC
         kRKQZpsOgJScYE2jl9b3L0MmXJXJVhdEmhOVTgcHWBYjDUe/6xnnRfKVZ845P2Qxxt9Z
         qDpw==
X-Gm-Message-State: AOAM532bVT4qRzc9wlRPlDCBH5wQ4bVc0rKA/2TF6No5EM1Q3GZv37hs
        GJtTwCsj/iGhgGISoDwsheU=
X-Google-Smtp-Source: ABdhPJxkGOQucEZ3eHTJchpKUKUckA6j7S/vsruQEQBvkvTbVutpKPuX/9bYSB965EtwPAHJ694VOQ==
X-Received: by 2002:a17:902:b412:: with SMTP id x18mr5880528plr.116.1594958326050;
        Thu, 16 Jul 2020 20:58:46 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 20:58:45 -0700 (PDT)
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
Subject: [PATCH v2 4/6] cx88: use generic power management
Date:   Fri, 17 Jul 2020 09:26:06 +0530
Message-Id: <20200717035608.97254-5-vaibhavgupta40@gmail.com>
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

The driver was invoking PCI helper functions like pci_save/restore_state(),
pci_enable/disable_device() and pci_set_power_state(), which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx88/cx88-video.c | 52 ++++++++---------------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index ba0e9660a047..a06d5b8f31b9 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1551,10 +1551,9 @@ static void cx8800_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
-#ifdef CONFIG_PM
-static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused cx8800_suspend(struct device *dev_d)
 {
-	struct cx8800_dev *dev = pci_get_drvdata(pci_dev);
+	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
 	unsigned long flags;
 
@@ -1575,40 +1574,17 @@ static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	/* FIXME -- shutdown device */
 	cx88_shutdown(core);
 
-	pci_save_state(pci_dev);
-	if (pci_set_power_state(pci_dev,
-				pci_choose_state(pci_dev, state)) != 0) {
-		pci_disable_device(pci_dev);
-		dev->state.disabled = 1;
-	}
+	dev->state.disabled = 1;
 	return 0;
 }
 
-static int cx8800_resume(struct pci_dev *pci_dev)
+static int __maybe_unused cx8800_resume(struct device *dev_d)
 {
-	struct cx8800_dev *dev = pci_get_drvdata(pci_dev);
+	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
 	struct cx88_core *core = dev->core;
 	unsigned long flags;
-	int err;
-
-	if (dev->state.disabled) {
-		err = pci_enable_device(pci_dev);
-		if (err) {
-			pr_err("can't enable device\n");
-			return err;
-		}
-
-		dev->state.disabled = 0;
-	}
-	err = pci_set_power_state(pci_dev, PCI_D0);
-	if (err) {
-		pr_err("can't set power state\n");
-		pci_disable_device(pci_dev);
-		dev->state.disabled = 1;
 
-		return err;
-	}
-	pci_restore_state(pci_dev);
+	dev->state.disabled = 0;
 
 	/* FIXME: re-initialize hardware */
 	cx88_reset(core);
@@ -1631,7 +1607,6 @@ static int cx8800_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1647,15 +1622,14 @@ static const struct pci_device_id cx8800_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx8800_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(cx8800_pm_ops, cx8800_suspend, cx8800_resume);
+
 static struct pci_driver cx8800_pci_driver = {
-	.name     = "cx8800",
-	.id_table = cx8800_pci_tbl,
-	.probe    = cx8800_initdev,
-	.remove   = cx8800_finidev,
-#ifdef CONFIG_PM
-	.suspend  = cx8800_suspend,
-	.resume   = cx8800_resume,
-#endif
+	.name      = "cx8800",
+	.id_table  = cx8800_pci_tbl,
+	.probe     = cx8800_initdev,
+	.remove    = cx8800_finidev,
+	.driver.pm = &cx8800_pm_ops,
 };
 
 module_pci_driver(cx8800_pci_driver);
-- 
2.27.0

