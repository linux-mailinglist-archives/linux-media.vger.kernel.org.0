Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF1A226D86
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 19:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbgGTRtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 13:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgGTRtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 13:49:13 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023AAC0619D4;
        Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k71so188795pje.0;
        Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96y7EAtauwpST2sJvN1xqRaaYTBW7xFiifRwkpVmX4I=;
        b=jg/iEt+0wHY/FV3Q81wX9QAl/uJk+XggykUcXKKHxIkxhXQ0AXB7HJA1n+VKyzthkI
         8hDC3mxxB86xuU1/zjVG17x2pWdnLQaexcu/kE5SYCLbJnNv7QyCO/RocBC4IeE3Dnk0
         xp/Q7wTP6ClTeePLDl1t4OkFpMCXWMCKPrc/6DqTxBF4PXQHHdQyPjQpJLlkFEffPB/w
         TStkgpuAiE0YkT/QEqdMS/wxmHQMVQNSg/Os+aDFc0ZvUo4Hyjn8j6VP15VVQN1Hf83S
         x1X9YrqeLocpYpqr7t4cjHsyYliRRciPUN+e/QX/p/1Op9g4bjSFRz/wdv21jNcjKgI0
         EKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96y7EAtauwpST2sJvN1xqRaaYTBW7xFiifRwkpVmX4I=;
        b=kjxEUdM/vHh/4+kxlZ9HEReD6vhk/OebZwOwXSI1QRrJ+/5ecqN2paUAhRAOG4FMG1
         xux6J6oKc7hFh5IzbzlHEPSDNom6hqlXnITcdYUAFa2pPBQ/dO6JTz98beRWyPgsdLy0
         Q3HytJLc7SydfU655hr6DB+DeHJ873GH/oQNeGomAWe3cEtiVoeZaPBWqiSHsS6uvMlD
         dPB7/UfJD5czKDY8ktnwBDhHXhAj+oDdb+8QmB/0bsGyEObMZmbwAqAksMDh84trg6Q1
         p5K816kwj5ol+4AX9/mwmJ/MZyWBLum/KLMvSuFMXQeB1IE4IzMp/6wwUhQ5lydhiatG
         iuwQ==
X-Gm-Message-State: AOAM531iWiQpSIxdgpaskvI3C+okkXRXJntK2Tj1vz77ZD5OhUje0r0h
        8Xw8QwEMKhKN53KH9Vs7adY=
X-Google-Smtp-Source: ABdhPJy/P1ezLwGpEG0knayswF4R/ww4dDpu6dy1QBZUaQEiSB0wwVhOtmGxkQyhBFmAypl7LGgj1g==
X-Received: by 2002:a17:90a:c295:: with SMTP id f21mr562409pjt.208.1595267352276;
        Mon, 20 Jul 2020 10:49:12 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id i196sm15538658pgc.55.2020.07.20.10.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 10:49:11 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1] media: cafe-driver: use generic power management
Date:   Mon, 20 Jul 2020 23:15:46 +0530
Message-Id: <20200720174545.827778-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
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
 2 files changed, 7 insertions(+), 27 deletions(-)

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
-- 
2.27.0

