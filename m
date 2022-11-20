Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0076316F4
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiKTWoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKTWoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9A0252BE
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DB9miXpr2VFjqH+7S3jh8qfF1qOjTwhPxcuhr7UfzZE=;
        b=NNTj0mlEUOsJnkdAOy5hKor6T7EMDOOpa5E4jmMbL3pQcyz7nGfBZ6sjDpdYsQONHAvQ/X
        qKtrPia+3ngj+I/BZElTxmJoDuu2Ui/fucvOAFUNNEQxOXSYAi1P5RGYVS24p+woJZs+0e
        dq7o1tzOdkgxTlkF6OPggMO6dFcHJZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-_ULw9Zi_NMCeow4QqYSoEQ-1; Sun, 20 Nov 2022 17:41:44 -0500
X-MC-Unique: _ULw9Zi_NMCeow4QqYSoEQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88283185A78B;
        Sun, 20 Nov 2022 22:41:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1734D47505E;
        Sun, 20 Nov 2022 22:41:41 +0000 (UTC)
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
Subject: [PATCH 19/20] media: atomisp: Remove atomisp_ospm_dphy_up()/_down() functions
Date:   Sun, 20 Nov 2022 23:41:00 +0100
Message-Id: <20221120224101.746199-20-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_ospm_dphy_up() is an empty function now and
atomisp_ospm_dphy_down() contains a couple of checks + goto done
statements which don't matter since the function always ends up at
the done label regardless and then it does 1 pci-config write.

Move the single pci-config write directly to atomisp_power_off()
and remove the atomisp_ospm_dphy_up()/_down() functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 34 -------------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 24 ++++++-------
 3 files changed, 12 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7821bbd1e8da..e9ce3b9b527c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5492,40 +5492,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-/*Turn off ISP dphy */
-int atomisp_ospm_dphy_down(struct atomisp_device *isp)
-{
-	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	u32 reg;
-
-	dev_dbg(isp->dev, "%s\n", __func__);
-
-	/* if ISP timeout, we can force powerdown */
-	if (isp->isp_timeout)
-		goto done;
-
-	if (!atomisp_dev_users(isp))
-		goto done;
-
-done:
-	/*
-	 * MRFLD IUNIT DPHY is located in an always-power-on island
-	 * MRFLD HW design need all CSI ports are disabled before
-	 * powering down the IUNIT.
-	 */
-	pci_read_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, &reg);
-	reg |= MRFLD_ALL_CSI_PORTS_OFF_MASK;
-	pci_write_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, reg);
-	return 0;
-}
-
-/*Turn on ISP dphy */
-int atomisp_ospm_dphy_up(struct atomisp_device *isp)
-{
-	dev_dbg(isp->dev, "%s\n", __func__);
-	return 0;
-}
-
 int atomisp_exif_makernote(struct atomisp_sub_device *asd,
 			   struct atomisp_makernote_info *config)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index f7647edb25fb..b8911491581a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -273,8 +273,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 				      struct atomisp_cont_capture_conf *cvf_config);
 
-int atomisp_ospm_dphy_down(struct atomisp_device *isp);
-int atomisp_ospm_dphy_up(struct atomisp_device *isp);
 int atomisp_exif_makernote(struct atomisp_sub_device *asd,
 			   struct atomisp_makernote_info *config);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 9cb1363abe72..e786b81921da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -722,9 +722,10 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 
 int atomisp_power_off(struct device *dev)
 {
-	struct atomisp_device *isp = (struct atomisp_device *)
-				     dev_get_drvdata(dev);
+	struct atomisp_device *isp = dev_get_drvdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
 	int ret;
+	u32 reg;
 
 	atomisp_css_uninit(isp);
 
@@ -732,10 +733,15 @@ int atomisp_power_off(struct device *dev)
 	if (ret)
 		return ret;
 
-	/*Turn off the ISP d-phy*/
-	ret = atomisp_ospm_dphy_down(isp);
-	if (ret)
-		return ret;
+	/*
+	 * MRFLD IUNIT DPHY is located in an always-power-on island
+	 * MRFLD HW design need all CSI ports are disabled before
+	 * powering down the IUNIT.
+	 */
+	pci_read_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, &reg);
+	reg |= MRFLD_ALL_CSI_PORTS_OFF_MASK;
+	pci_write_config_dword(pdev, MRFLD_PCI_CSI_CONTROL, reg);
+
 	cpu_latency_qos_update_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
 	return atomisp_mrfld_power(isp, false);
 }
@@ -751,12 +757,6 @@ int atomisp_power_on(struct device *dev)
 		return ret;
 
 	cpu_latency_qos_update_request(&isp->pm_qos, isp->max_isr_latency);
-	/*Turn on ISP d-phy */
-	ret = atomisp_ospm_dphy_up(isp);
-	if (ret) {
-		dev_err(isp->dev, "Failed to power up ISP!.\n");
-		return -EINVAL;
-	}
 
 	/*restore register values for iUnit and iUnitPHY registers*/
 	if (isp->saved_regs.pcicmdsts)
-- 
2.38.1

