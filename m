Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E196020E1C9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731246AbgF2U7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731245AbgF2TNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B02EC0A8937;
        Mon, 29 Jun 2020 00:37:39 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d4so7914246pgk.4;
        Mon, 29 Jun 2020 00:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
        b=AytPDfT240W61C3o6D7il9CG8AFES77CMBtW6PtMpoZtIZ4KUdiQDw1kr6rk7xC86+
         7k6MyyuKeQFCdf1UOQ8mUKDDAEUHUNO27DZOIbiAxYZ92HjCHrCO74ymPfH6IzHoI4F2
         dg/oTA9EYIkdFwhDeIXc3zqe8+xOI1iWbid8trljq5ton6TrgnctIjozgEpiblxiGEwC
         hB5J8pu+waxM5vczpiCP7zzWsnjrbzgTFgqL01m6SKvIXxvRCaB39XawcGdxvVGRk5kq
         IOW1PNZ/V4LFOqXaa6mcn1Q6YjKrvBoeP3eM5vYfL5ln0FxnNM4orwSLWc5M5GsZchPE
         hoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EssEWRuUlyUMovXvf1Owqev660e7KUxdmLM0BPnhB2U=;
        b=KSqaLSIjL6UARS+qVM6MvlmWz0Q/UFwpT3ChskgThk4Me9oS8aDgybQQ4I2VMe9syu
         +L6XS25kHGT2nd7jOeDVTEnF92yuU35kg5c4hrIaxn23q2LDpf0Uv2B1G1K5KcSiCxlr
         4qBXUpZ3KDGQx/Wgte4L1LQMo/oEVBwt3tWQk1L5OOZgI4kWqQYzUkz3ZuHc3j3vwXr2
         wtryzHYA1y5p4unsupBH2L6N0KfGjLUyBis91GzavYdLyny+LwTS8ejBTN5kXfT2ozzN
         60saj1pxiFB5P/Z6FUzPPzxTRAGLvAXkTLvgCy8saJ9o4nd9+t+CLyCY9bRLslVZmkfX
         w2MQ==
X-Gm-Message-State: AOAM533nkItOXbI1v9AE7B7WAKv2CXJUzXhAairEfq6K5eKX45TboSsC
        qwslvlRVrw38ed0lMmEqbtc=
X-Google-Smtp-Source: ABdhPJwzhiGQLxmqe1ZN2rfVRGk+dNFXyDLy1Krsxxp130ZsiGww/UHMfamqU+y8FseQr5GY8llZdg==
X-Received: by 2002:a63:3603:: with SMTP id d3mr8298304pga.200.1593416258709;
        Mon, 29 Jun 2020 00:37:38 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
        by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 00:37:38 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1 4/6] [media] cx88: use generic power management
Date:   Mon, 29 Jun 2020 13:06:02 +0530
Message-Id: <20200629073604.205478-5-vaibhavgupta40@gmail.com>
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

