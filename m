Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663FD71480C
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjE2KkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjE2KkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64C4F4
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ja5cKbuWVrgiggIWYegbmQbqLhOHMQseItkLhmp4RYg=;
        b=BBS1H/MGSPjph9AxJIlOolh5Ez2uoy0SrIoMl90htnWVk7pG0OlgslGtF/IA5T+3ueZqJh
        co+aLwgor/Yflo+GTFj/J+6z4eVCeNkTUN102XjLu74UmtQbUttXvZ8N67k1EPGvTSK1x8
        oIq7qxon1/r/N2UEmuEfdLj4TERvvuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-G8wqRsb0Mmm3wCAHBTVc4g-1; Mon, 29 May 2023 06:39:01 -0400
X-MC-Unique: G8wqRsb0Mmm3wCAHBTVc4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 430AD101A531;
        Mon, 29 May 2023 10:39:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AF03E2166B2B;
        Mon, 29 May 2023 10:38:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for sensors to 19.2 MHz
Date:   Mon, 29 May 2023 12:37:41 +0200
Message-Id: <20230529103741.11904-22-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ACPI code takes care of enabling/disabling the PMC clk(s) for
the sensors as necessary based on the runtime-pm state of the sensor.

But the GMIN code this replaces also set the clk-rate of the PMC clk
to 19.2 MHz. At least on BYT devices the PMC clks may come up running
at 25 MHz instead of the expected 19.2 MHz.

Ensure the sensor clk also runs at the expected 19.2 MHz for sensors
using v4l2-async probing by explicitly setting it to 19.2 MHz when
enumerating sensors in atomisp_csi2_bridge.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 68 ++++++++++++++++---
 1 file changed, 60 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index b55a7ff9844e..28d8779bbbc4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/property.h>
@@ -38,6 +39,8 @@
 		.properties = _PROPS,		\
 	})
 
+#define PMC_CLK_RATE_19_2MHZ			19200000
+
 /*
  * 79234640-9e10-4fea-a5c1-b5aa8b19756f
  * This _DSM GUID returns information about the GPIO lines mapped to a sensor.
@@ -250,24 +253,61 @@ static int atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(struct acpi_device *adev)
 	}
 
 	ACPI_FREE(buffer.pointer);
+
+	if (ret < 0)
+		acpi_handle_warn(adev->handle, "Could not find PMC clk in _PR0\n");
+
 	return ret;
 }
 
-static int atomisp_csi2_get_port(struct acpi_device *adev)
+static int atomisp_csi2_set_pmc_clk_freq(struct acpi_device *adev, int clock_num)
 {
-	int clock_num, port;
+	struct clk *clk;
+	char name[14];
+	int ret;
+
+	if (clock_num < 0)
+		return 0;
+
+	snprintf(name, sizeof(name), "pmc_plt_clk_%d", clock_num);
+
+	clk = clk_get(NULL, name);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		acpi_handle_err(adev->handle, "Error getting clk %s:%d\n", name, ret);
+		return ret;
+	}
 
 	/*
-	 * Get PMC-clock number from ACPI _PR0 method and compare this to
-	 * the CsiPort 1 PMC-clock used in the CHT/BYT reference designs.
+	 * The firmware might enable the clock at boot, to change
+	 * the rate we must ensure the clock is disabled.
+	 */
+	ret = clk_prepare_enable(clk);
+	if (!ret)
+		clk_disable_unprepare(clk);
+	if (!ret)
+		ret = clk_set_rate(clk, PMC_CLK_RATE_19_2MHZ);
+	if (ret)
+		acpi_handle_err(adev->handle, "Error setting clk-rate for %s:%d\n", name, ret);
+
+	clk_put(clk);
+	return ret;
+}
+
+static int atomisp_csi2_get_port(struct acpi_device *adev, int clock_num)
+{
+	int port;
+
+	/*
+	 * Compare clock-number to the PMC-clock used for CsiPort 1
+	 * in the CHT/BYT reference designs.
 	 */
-	clock_num = atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
 	if (IS_ISP2401)
 		port = clock_num == 4 ? 1 : 0;
 	else
 		port = clock_num == 0 ? 1 : 0;
 
-	/* Intel DSM or DMI quirk overrides PR0 derived default */
+	/* Intel DSM or DMI quirk overrides _PR0 CLK derived default */
 	return gmin_cfg_get_int(adev, "CsiPort", port);
 }
 
@@ -551,7 +591,7 @@ static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *
 	struct fwnode_handle *fwnode, *primary;
 	struct atomisp_csi2_sensor *sensor;
 	struct acpi_device *adev;
-	int ret;
+	int ret, clock_num;
 
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
 		if (!adev->status.enabled)
@@ -565,7 +605,19 @@ static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *
 
 		sensor = &bridge->sensors[bridge->n_sensors];
 
-		sensor->port = atomisp_csi2_get_port(adev);
+		/*
+		 * ACPI takes care of turning the PMC clock on and off, but on BYT
+		 * the clock defaults to 25 MHz instead of the expected 19.2 MHz.
+		 * Get the PMC-clock number from ACPI _PR0 method and set it to 19.2 MHz.
+		 * The PMC-clock number is also used to determine the default CSI port.
+		 */
+		clock_num = atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
+
+		ret = atomisp_csi2_set_pmc_clk_freq(adev, clock_num);
+		if (ret)
+			goto err_put_adev;
+
+		sensor->port = atomisp_csi2_get_port(adev, clock_num);
 		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
 			acpi_handle_err(adev->handle, "Invalid port: %d\n", sensor->port);
 			ret = -EINVAL;
-- 
2.40.1

