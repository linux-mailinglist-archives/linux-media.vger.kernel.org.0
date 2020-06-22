Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E186203666
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 14:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgFVMHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 08:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgFVMHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 08:07:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5630FC061794;
        Mon, 22 Jun 2020 05:07:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so8073954pjb.1;
        Mon, 22 Jun 2020 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ou9Z/Ox/FwTNRKwSYB37fOjhliFS4VQZs0FMTQAQC5I=;
        b=PSqV8oLCQOb7Tmzo31U7GZn+L294sHL3jjZIZwdpZ3FcDVcSyU1+IKfDX63ylkv/U4
         cxSiNOGrbjokKMbcEbqSSmXGoG/DxlJXTUeWnwG8oe2W4NvYHc+QTgMLdeFszPyvZzTr
         Uzy4Yp5J5K3unoJq0TgbjANslW/6rHLf7A6fVqwz3EKHMneyiAj1UNL2HPGKIOgPwSrU
         dI+xlWn2/AiZHK7rJsdSCzFPEXgCvEZggaeyoQn3UPzhHwkiGrKjsyBFZz8xKnMxFEyY
         MQSDu4D1qbSgLRiP83rr6LjNfHhOQGV/FQ7ZDotrV8OUMqgqjDfuDcloOLbC51wQTYX5
         vIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ou9Z/Ox/FwTNRKwSYB37fOjhliFS4VQZs0FMTQAQC5I=;
        b=RerVJP3QxlIe/B1MD7apMDvtCx87SCfZnHe+ONCCweN9R2hUtT6DrmOYOwyckXoiN1
         Vzt1cz3QWkxaRyiIHzjC/yiUltKxY9sFe7NdK1lWoOBPFVFEoMz+mZS1ZkE4sv1UwQzt
         qoKoegBAVGbo06/ycdbse5tcSWxlfzZjNVX7ipQ75SaaHikmb0SyEGF7gmT6KHFzNzIu
         CF17b9QGsJlTj+WQQCdMSkYpB0xZDZA5ufHciPFBtAljJSNgF56dMpJJ0tFIlAY3vE0U
         kph+TuG+0f6jkNZunM++XgPEycJhy+0F0Jb052tvuTjE2rm2U7DiYLdwmzqlv2U4ypZD
         RCXQ==
X-Gm-Message-State: AOAM5327PUOm6wWYJVnYWMPzVqH4EiHJXWJ6LcivZSw78RN9rrI4mXM7
        Nm3p0jxVg11C80xbzLG3wv4=
X-Google-Smtp-Source: ABdhPJxWH1R7RNazyZb+CXYHrdyY/Qo/VwMC9R+HrORsdOghiTJDVI2x/EEpEoO0/7/ggGXeEFOFDg==
X-Received: by 2002:a17:902:7008:: with SMTP id y8mr20024907plk.84.1592827619747;
        Mon, 22 Jun 2020 05:06:59 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
        by smtp.gmail.com with ESMTPSA id j8sm13195391pji.3.2020.06.22.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 05:06:58 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1] [media] saa7134: use generic power management
Date:   Mon, 22 Jun 2020 17:32:30 +0530
Message-Id: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. The required operations are
done by PCI core.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 25 ++++++++----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index e4623ed2f831..eb01109d4f98 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1370,10 +1370,8 @@ static void saa7134_finidev(struct pci_dev *pci_dev)
 	kfree(dev);
 }
 
-#ifdef CONFIG_PM
-
 /* resends a current buffer in queue after resume */
-static int saa7134_buffer_requeue(struct saa7134_dev *dev,
+static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
 				  struct saa7134_dmaqueue *q)
 {
 	struct saa7134_buf *buf, *next;
@@ -1397,8 +1395,9 @@ static int saa7134_buffer_requeue(struct saa7134_dev *dev,
 	return 0;
 }
 
-static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
+static int __maybe_unused saa7134_suspend(struct device *dev_d)
 {
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
 	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
 
@@ -1428,21 +1427,15 @@ static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
 	if (dev->remote && dev->remote->dev->users)
 		saa7134_ir_close(dev->remote->dev);
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
-
 	return 0;
 }
 
-static int saa7134_resume(struct pci_dev *pci_dev)
+static int __maybe_unused saa7134_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
 	unsigned long flags;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	/* Do things that are done in saa7134_initdev ,
 		except of initializing memory structures.*/
 
@@ -1490,7 +1483,6 @@ static int saa7134_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 /* ----------------------------------------------------------- */
 
@@ -1522,15 +1514,14 @@ EXPORT_SYMBOL(saa7134_ts_unregister);
 
 /* ----------------------------------------------------------- */
 
+static SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
+
 static struct pci_driver saa7134_pci_driver = {
 	.name     = "saa7134",
 	.id_table = saa7134_pci_tbl,
 	.probe    = saa7134_initdev,
 	.remove   = saa7134_finidev,
-#ifdef CONFIG_PM
-	.suspend  = saa7134_suspend,
-	.resume   = saa7134_resume
-#endif
+	.driver.pm = &saa7134_pm_ops,
 };
 
 static int __init saa7134_init(void)
-- 
2.27.0

