Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EE7223603
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgGQHg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgGQHg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:36:26 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6788AC061755;
        Fri, 17 Jul 2020 00:36:26 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q17so5088013pls.9;
        Fri, 17 Jul 2020 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o38J/PFTSSSoTyJxL5VzCWpb+LzDe42nMqQ+a4HznfI=;
        b=suHcx/3aWCsbtLu9RFhYgVejfZI9ZwB0MgXm6F4LAgcnpr/Dgaf0rslVOFMwmE0vB9
         fTsrkjCTYH28hyTRRKhpnf+PhXJebgnkTyDk5ic+2vrmzQI/sVmt04Mg3/RFX1Jh3xS3
         edBUr9QH97UOD8FxGbwNnuDP4nY54HxxbHnhgYkp/NoRIZ1lHb+NeFl4chSkhEGEPNO7
         Pi6GYIfWb3TH2baRSVnf0AEV/EgwoBPWgpOoq0i2riJ2/FIoqvRkKh6saBMRfRcHHZII
         ExvbqIcE+dSZpPePM9gaWYzBUMWyimu2mmsH8oGyyhx6RZBKHBs7hebFi+IOumTEiY4K
         wQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o38J/PFTSSSoTyJxL5VzCWpb+LzDe42nMqQ+a4HznfI=;
        b=CHb6Iu8unGZCmUxUb89CbLzTOju+0aD+sjNaX4Msh96Le8FErm5X8tJk101jW6d4AS
         g7X7ZFwcpOBn0TvKwnM5lA1dH2PHp57BEErFHeYJDh4kX1fXBEi3SPFv7nxLzNvYnzl5
         I0PjFUK5s4VdtsRVrAg0s0r/Vy8jQTMWBdW1yULnqb4ZN5IiF3qZEm1TGbgDUMTSVWpF
         2b8+XfD6zf0PN1rPx4+ANfSgNo37DQYpEeb7KmkAmUhjj4uM9kCJPFoRV5TbdXig1vjw
         RoB5XqiuBQXYepYJQ4v7zd+b92uYx17vGd+DZC5v4cd347kmXRBH6iXthONYhMT7Wc7g
         06vw==
X-Gm-Message-State: AOAM5332X4uHa+txhanXatvRVYMaghM31Wudgflq3KxGe8gstrTeHIS3
        jqqXHgKl68IPAiGQsBGOCGE=
X-Google-Smtp-Source: ABdhPJzFRBgouTCA7hhoRaiFdSsMlYPkyejIuYqDKAFtC6stuskQIYYkfZ+80ovw+KGW6XsqY/2CZw==
X-Received: by 2002:a17:90a:3689:: with SMTP id t9mr8609619pjb.28.1594971385928;
        Fri, 17 Jul 2020 00:36:25 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:36:25 -0700 (PDT)
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
Subject: [PATCH v3 4/6] cx88: use generic power management
Date:   Fri, 17 Jul 2020 13:04:34 +0530
Message-Id: <20200717073436.249623-5-vaibhavgupta40@gmail.com>
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

The driver was invoking PCI helper functions like pci_save/restore_state(),
pci_enable/disable_device() and pci_set_power_state(), which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx88/cx88-video.c | 58 ++++++++---------------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index ba0e9660a047..ab55e3fafe00 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -385,8 +385,7 @@ static int start_video_dma(struct cx8800_dev    *dev,
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int stop_video_dma(struct cx8800_dev    *dev)
+static int __maybe_unused stop_video_dma(struct cx8800_dev    *dev)
 {
 	struct cx88_core *core = dev->core;
 
@@ -402,7 +401,7 @@ static int stop_video_dma(struct cx8800_dev    *dev)
 	return 0;
 }
 
-static int restart_video_queue(struct cx8800_dev    *dev,
+static int __maybe_unused restart_video_queue(struct cx8800_dev    *dev,
 			       struct cx88_dmaqueue *q)
 {
 	struct cx88_buffer *buf;
@@ -415,7 +414,6 @@ static int restart_video_queue(struct cx8800_dev    *dev,
 	}
 	return 0;
 }
-#endif
 
 /* ------------------------------------------------------------------ */
 
@@ -1551,10 +1549,9 @@ static void cx8800_finidev(struct pci_dev *pci_dev)
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
 
@@ -1575,40 +1572,17 @@ static int cx8800_suspend(struct pci_dev *pci_dev, pm_message_t state)
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
-
-		return err;
-	}
-	pci_restore_state(pci_dev);
+	dev->state.disabled = 0;
 
 	/* FIXME: re-initialize hardware */
 	cx88_reset(core);
@@ -1631,7 +1605,6 @@ static int cx8800_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1647,15 +1620,14 @@ static const struct pci_device_id cx8800_pci_tbl[] = {
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

