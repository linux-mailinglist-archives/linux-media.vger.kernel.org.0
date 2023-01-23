Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C58677BC5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjAWMxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbjAWMxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5586610242
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rGCS+K6zqHpgeB9hHHezw2+r4hjhsEXXusi0+AjRFw0=;
        b=YKLQpuNxBgpaQrtiO5gosDkT30RYur5cEt7v0HKjQBkrkVkJd+tI22LRnc1OuUvg92o9UP
        bDc0nUv7Z8gGrgeSToEsRBj3iXx1mRyIZMeevvugUSxB4Wc/Y/7iynfFuyRKBj/ppQADrC
        mT52yYCdNHutWAAgmQzIXkZt5crP7us=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-wm9qY1mSOAGcz0YugzEbrg-1; Mon, 23 Jan 2023 07:52:48 -0500
X-MC-Unique: wm9qY1mSOAGcz0YugzEbrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95F89811E6E;
        Mon, 23 Jan 2023 12:52:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB5EFC15BA0;
        Mon, 23 Jan 2023 12:52:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 13/57] media: atomisp: Remove deferred firmware loading support
Date:   Mon, 23 Jan 2023 13:51:21 +0100
Message-Id: <20230123125205.622152-14-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make atomisp behave like any othet drivers and have it load the firmware
at probe time (as it was already doing by default).

The deferred firmware loading support needlessly complicates the
v4l2_file_operations.open callback (atomisp_open()), getting in
the way of allowing multiple opens like a normal v4l2 device would.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 25 -----------
 .../staging/media/atomisp/pci/atomisp_fops.h  |  2 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 42 +++++++------------
 3 files changed, 14 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 682239ea042f..036ad339b344 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -757,25 +757,6 @@ static int atomisp_open(struct file *file)
 	mutex_lock(&isp->mutex);
 
 	asd->subdev.devnode = vdev;
-	/* Deferred firmware loading case. */
-	if (isp->css_env.isp_css_fw.bytes == 0) {
-		dev_err(isp->dev, "Deferred firmware load.\n");
-		isp->firmware = atomisp_load_firmware(isp);
-		if (!isp->firmware) {
-			dev_err(isp->dev, "Failed to load ISP firmware.\n");
-			ret = -ENOENT;
-			goto error;
-		}
-		ret = atomisp_css_load_firmware(isp);
-		if (ret) {
-			dev_err(isp->dev, "Failed to init css.\n");
-			goto error;
-		}
-		/* No need to keep FW in memory anymore. */
-		release_firmware(isp->firmware);
-		isp->firmware = NULL;
-		isp->css_env.isp_css_fw.data = NULL;
-	}
 
 	if (!isp->input_cnt) {
 		dev_err(isp->dev, "no camera attached\n");
@@ -901,12 +882,6 @@ static int atomisp_release(struct file *file)
 
 	atomisp_destroy_pipes_stream_force(asd);
 
-	if (defer_fw_load) {
-		ia_css_unload_firmware();
-		isp->css_env.isp_css_fw.data = NULL;
-		isp->css_env.isp_css_fw.bytes = 0;
-	}
-
 	ret = v4l2_subdev_call(isp->flash, core, s_power, 0);
 	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD)
 		dev_warn(isp->dev, "Failed to power-off flash\n");
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 10e43126b693..2efc5245e571 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -33,6 +33,4 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd);
 
 extern const struct v4l2_file_operations atomisp_fops;
 
-extern bool defer_fw_load;
-
 #endif /* __ATOMISP_FOPS_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index aa05c69a5c6b..2a949d3dc5d1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -58,12 +58,6 @@ static uint skip_fwload;
 module_param(skip_fwload, uint, 0644);
 MODULE_PARM_DESC(skip_fwload, "Skip atomisp firmware load");
 
-/* memory optimization: deferred firmware loading */
-bool defer_fw_load;
-module_param(defer_fw_load, bool, 0644);
-MODULE_PARM_DESC(defer_fw_load,
-		 "Defer FW loading until device is opened (default:disable)");
-
 /* cross componnet debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
@@ -1514,21 +1508,17 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	isp->max_isr_latency = ATOMISP_MAX_ISR_LATENCY;
 
 	/* Load isp firmware from user space */
-	if (!defer_fw_load) {
-		isp->firmware = atomisp_load_firmware(isp);
-		if (!isp->firmware) {
-			err = -ENOENT;
-			dev_dbg(&pdev->dev, "Firmware load failed\n");
-			goto load_fw_fail;
-		}
+	isp->firmware = atomisp_load_firmware(isp);
+	if (!isp->firmware) {
+		err = -ENOENT;
+		dev_dbg(&pdev->dev, "Firmware load failed\n");
+		goto load_fw_fail;
+	}
 
-		err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
-		if (err) {
-			dev_dbg(&pdev->dev, "Firmware version check failed\n");
-			goto fw_validation_fail;
-		}
-	} else {
-		dev_info(&pdev->dev, "Firmware load will be deferred\n");
+	err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
+	if (err) {
+		dev_dbg(&pdev->dev, "Firmware version check failed\n");
+		goto fw_validation_fail;
 	}
 
 	pci_set_master(pdev);
@@ -1628,14 +1618,10 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	}
 
 	/* Load firmware into ISP memory */
-	if (!defer_fw_load) {
-		err = atomisp_css_load_firmware(isp);
-		if (err) {
-			dev_err(&pdev->dev, "Failed to init css.\n");
-			goto css_init_fail;
-		}
-	} else {
-		dev_dbg(&pdev->dev, "Skip css init.\n");
+	err = atomisp_css_load_firmware(isp);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to init css.\n");
+		goto css_init_fail;
 	}
 	/* Clear FW image from memory */
 	release_firmware(isp->firmware);
-- 
2.39.0

