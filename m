Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8315C2277BB
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 06:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGUEum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 00:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgGUEul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 00:50:41 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18E2C061794;
        Mon, 20 Jul 2020 21:50:41 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id md7so1043869pjb.1;
        Mon, 20 Jul 2020 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qrwxUxxJqLtX+URI9aE/ZP5XVdbCcJcGjmeWN225pNs=;
        b=ML2ie6HQUDKfOMg0lAmV4QnPIwNzuIYgklfOml7Fz353dtm1tJZkiTbPt6LVllTsgF
         kWH0zny7N1p1iTxUsGmmgtYX703/u5rR0kn2iNiFfrI76rbpQhHHZJDZASW9cDPCjc6/
         3F1R18E3U7J4mzsu5VCcoWrFN9ekFtdNNxzKIlNngbtaeKVTcXH2vb8TSfoSvvHcsI5y
         Z4Yr9UVp2hYj8mLUommLOt7sW6KL1p6A61JwK+f/g6q9nOulG6pAGwfNcBHeL0buN/5k
         6zsjm38BvKdWGPxgS9CPYwBNRt/rKUxsAFrcPJfL0ImbnjI/Lj2mrHLsKjOwWbC7ojcG
         xfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrwxUxxJqLtX+URI9aE/ZP5XVdbCcJcGjmeWN225pNs=;
        b=jcxHL+L+KJdNVftdQ4Dp0gwP7G0O4pQt3OFjWAtdcMqh870dhtBn1mlx6LPXsnLYt4
         EkibLPhD5MMi/SwcAAUn9JYtlzZdQOS2NsvJLaFSLJat11Yz45OxaB6BkNkIgmGgI20o
         lfR6MfbEYrc7DGCx2VLT8NhjBSfgG0shHrciNtGzhEXEAQCNERZQ5cL4eBwJl6B5+NtG
         F2IjQm9/byRpN4NnwZ/KNZvNwWz6dcdvFECetDYh9T3aLH0L752vfnQh+04vAqF0gMYf
         GAZDx09yJiRYdoxKKDSfTtJAoQRFRWFvtbLXKrMayHUvvKhYoI8ojte2XJziaj5TsMiu
         1DnQ==
X-Gm-Message-State: AOAM533xN2CYqdZDeamtEaHsaZIgbW9EB5stmvMCYKmY6r8O/IEbbqP/
        4fKsm+eUgsHy76tKQ/HmToc=
X-Google-Smtp-Source: ABdhPJzTxhL2hp/Zmf+wZmE/56zcRIraZLPgtyR9kGJ71brJl1A2SiOTxC9p0WBJ8m4Z7iBrTnVCuA==
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr2771000pjb.181.1595307040086;
        Mon, 20 Jul 2020 21:50:40 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id h1sm17002840pgn.41.2020.07.20.21.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:50:39 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] media: cafe-driver: use generic power management
Date:   Tue, 21 Jul 2020 10:17:45 +0530
Message-Id: <20200721044744.26690-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202007210444.LkUvoUpL%lkp@intel.com>
References: <202007210444.LkUvoUpL%lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state() and pci_enable/disable_device() to do required
operations. In generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../media/platform/marvell-ccic/cafe-driver.c | 31 +++++--------------
 .../media/platform/marvell-ccic/mcam-core.c   |  3 --
 .../media/platform/marvell-ccic/mcam-core.h   |  2 --
 3 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index 9a09a10a3631..58b9915ac7a4 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -604,44 +604,28 @@ static void cafe_pci_remove(struct pci_dev *pdev)
 }
 
 
-#ifdef CONFIG_PM
 /*
  * Basic power management.
  */
-static int cafe_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused cafe_pci_suspend(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&pdev->dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct cafe_camera *cam = to_cam(v4l2_dev);
-	int ret;
 
-	ret = pci_save_state(pdev);
-	if (ret)
-		return ret;
 	mccic_suspend(&cam->mcam);
-	pci_disable_device(pdev);
 	return 0;
 }
 
 
-static int cafe_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused cafe_pci_resume(struct device *dev)
 {
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(&pdev->dev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct cafe_camera *cam = to_cam(v4l2_dev);
-	int ret = 0;
 
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
-
-	if (ret) {
-		cam_warn(cam, "Unable to re-enable device on resume!\n");
-		return ret;
-	}
 	cafe_ctlr_init(&cam->mcam);
 	return mccic_resume(&cam->mcam);
 }
 
-#endif  /* CONFIG_PM */
-
 static const struct pci_device_id cafe_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL,
 		     PCI_DEVICE_ID_MARVELL_88ALP01_CCIC) },
@@ -650,15 +634,14 @@ static const struct pci_device_id cafe_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, cafe_ids);
 
+static SIMPLE_DEV_PM_OPS(cafe_pci_pm_ops, cafe_pci_suspend, cafe_pci_resume);
+
 static struct pci_driver cafe_pci_driver = {
 	.name = "cafe1000-ccic",
 	.id_table = cafe_ids,
 	.probe = cafe_pci_probe,
 	.remove = cafe_pci_remove,
-#ifdef CONFIG_PM
-	.suspend = cafe_pci_suspend,
-	.resume = cafe_pci_resume,
-#endif
+	.driver.pm = &cafe_pci_pm_ops,
 };
 
 
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 09775b6624c6..d81d0c130e3c 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1967,8 +1967,6 @@ EXPORT_SYMBOL_GPL(mccic_shutdown);
 /*
  * Power management
  */
-#ifdef CONFIG_PM
-
 void mccic_suspend(struct mcam_camera *cam)
 {
 	mutex_lock(&cam->s_mutex);
@@ -2015,7 +2013,6 @@ int mccic_resume(struct mcam_camera *cam)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mccic_resume);
-#endif /* CONFIG_PM */
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Jonathan Corbet <corbet@lwn.net>");
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/media/platform/marvell-ccic/mcam-core.h
index 2e3a7567a76a..b55545822fd2 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.h
+++ b/drivers/media/platform/marvell-ccic/mcam-core.h
@@ -236,10 +236,8 @@ static inline void mcam_reg_set_bit(struct mcam_camera *cam,
 int mccic_register(struct mcam_camera *cam);
 int mccic_irq(struct mcam_camera *cam, unsigned int irqs);
 void mccic_shutdown(struct mcam_camera *cam);
-#ifdef CONFIG_PM
 void mccic_suspend(struct mcam_camera *cam);
 int mccic_resume(struct mcam_camera *cam);
-#endif
 
 /*
  * Register definitions for the m88alp01 camera interface.  Offsets in bytes
-- 
2.27.0

