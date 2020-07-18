Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569802248DD
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 07:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgGRFGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 01:06:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:44050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbgGRFGB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 01:06:01 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 684672083E;
        Sat, 18 Jul 2020 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595048760;
        bh=e1eezy0qbKZGztYdUiT19QjjP8dhZk+Lch7S4Ef94IU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czWTPA7pjOvsKOFODsS8lNOMVRS/ywdcqC4F1UcLvT2YjOBcA8T+u6nFQkI6VfQEK
         R05P4hhst9jaiJc72TTBcfYU6e8LgWKQ1ChYkyqflt43RUYVq0XbrM1+s7983BixWh
         APzCTxBQLd+Ul1WeKrGkRzFn9FjHIz4uN2W6f9UI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1jwf2r-003EDw-To; Sat, 18 Jul 2020 07:05:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: atomisp: fix the handling of clock number
Date:   Sat, 18 Jul 2020 07:05:55 +0200
Message-Id: <c2942c4363ceb8bbce12c2db8f42d8bbbf5bb0ef.1595048742.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <2630e1bb0948c3134c6f22ad275ae27cc6023532.1595048742.git.mchehab+huawei@kernel.org>
References: <2630e1bb0948c3134c6f22ad275ae27cc6023532.1595048742.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, the driver is not doing the right thing to detect
the clock like used by the sensor, at least on devices
without the gmin's EFI vars.

Add some notes at the code to explain why and skip the wrong
value provided by the _DSM table.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 49 ++++++++++++++++---
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1af9da8acf4c..cb360b8399e5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -26,6 +26,9 @@ enum clock_rate {
 #define CLK_RATE_19_2MHZ	19200000
 #define CLK_RATE_25_0MHZ	25000000
 
+/* Valid clock number range from 0 to 5 */
+#define MAX_CLK_COUNT                   5
+
 /* X-Powers AXP288 register set */
 #define ALDO1_SEL_REG	0x28
 #define ALDO1_CTRL3_REG	0x13
@@ -61,7 +64,6 @@ enum clock_rate {
 
 struct gmin_subdev {
 	struct v4l2_subdev *subdev;
-	int clock_num;
 	enum clock_rate clock_src;
 	bool clock_on;
 	struct clk *pmc_clk;
@@ -447,7 +449,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	struct acpi_device *adev;
 	acpi_handle handle;
 	struct device *dev;
-	int i, ret;
+	int i, ret, clock_num;
 
 	if (!client)
 		return NULL;
@@ -492,17 +494,37 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	}
 
 	gmin_subdevs[i].subdev = subdev;
-	gmin_subdevs[i].clock_num = gmin_get_var_int(dev, false, "CamClk", 0);
+
 	/*WA:CHT requires XTAL clock as PLL is not stable.*/
 	gmin_subdevs[i].clock_src = gmin_get_var_int(dev, false, "ClkSrc",
 				    VLV2_CLK_PLL_19P2MHZ);
 	gmin_subdevs[i].csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
 	gmin_subdevs[i].csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
 
-	/* get PMC clock with clock framework */
-	snprintf(gmin_pmc_clk_name,
-		 sizeof(gmin_pmc_clk_name),
-		 "%s_%d", "pmc_plt_clk", gmin_subdevs[i].clock_num);
+	/*
+	 * FIXME:
+	 *
+	 * According with :
+	 *   https://github.com/projectceladon/hardware-intel-kernelflinger/blob/master/doc/fastboot.md
+	 *
+	 * The "CamClk" EFI var is set via fastboot on some Android devices,
+	 * and seems to contain the number of the clock used to feed the
+	 * sensor.
+	 *
+	 * On systems with a proper ACPI table, this is given via the _PR0
+	 * power resource table. The logic below should first check if there
+	 * is a power resource already, falling back to the EFI vars detection
+	 * otherwise.
+	 */
+	clock_num = gmin_get_var_int(dev, false, "CamClk", -1);
+
+	if (clock_num < 0 || clock_num > MAX_CLK_COUNT) {
+		dev_err(dev, "Invalid clock number\n");
+		return NULL;
+	}
+
+	snprintf(gmin_pmc_clk_name, sizeof(gmin_pmc_clk_name),
+		 "%s_%d", "pmc_plt_clk", clock_num);
 
 	gmin_subdevs[i].pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
 	if (IS_ERR(gmin_subdevs[i].pmc_clk)) {
@@ -515,6 +537,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 
 		return NULL;
 	}
+	dev_info(dev, "Will use CLK%d (%s)\n", clock_num, gmin_pmc_clk_name);
 
 	/*
 	 * The firmware might enable the clock at
@@ -957,6 +980,18 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	union acpi_object *obj, *cur = NULL;
 	int i;
 
+	/*
+	 * The data reported by "CamClk" seems to be either 0 or 1 at the
+	 * _DSM table.
+	 *
+	 * At the ACPI tables we looked so far, this is not related to the
+	 * actual clock source for the sensor, which is given by the
+	 * _PR0 ACPI table. So, ignore it, as otherwise this will be
+	 * set to a wrong value.
+	 */
+	if (!strcmp(var, "CamClk"))
+		return -EINVAL;
+
 	obj = acpi_evaluate_dsm(handle, &atomisp_dsm_guid, 0, 0, NULL);
 	if (!obj) {
 		dev_info_once(dev, "Didn't find ACPI _DSM table.\n");
-- 
2.26.2

