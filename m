Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495511EEC55
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 22:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgFDUrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 16:47:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:40992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729582AbgFDUrK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 16:47:10 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8F7B2075B;
        Thu,  4 Jun 2020 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591303628;
        bh=JbfpxBougyuTtD2mESkC1dTt70lqoBGN25w5IEmpFGU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JH4ZMWhm5cDHbi5KySNdcR8W1wyBZkVuavB1UPSGK3itSDGFxoz9GF5Uzbduhlqqn
         D0Covk5fIrg3nTuw+0z5OldIcXa4xJ8QhFxVnMxRkmotZArh6ki10sTWzYvyagy+gi
         XNTLgTbR6bNwrXLTrP2cL1+0a1m/YqD5BaLlwa7Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgwlW-0004AZ-Nm; Thu, 04 Jun 2020 22:47:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] media: atomisp: improve sensor detection code to use _DSM table
Date:   Thu,  4 Jun 2020 22:47:01 +0200
Message-Id: <b96869eb27f9ec037025b44c46bf9883e4a4f27a.1591303518.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591303518.git.mchehab+huawei@kernel.org>
References: <cover.1591303518.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of keep hardcoding device-specific tables, read them
directly from the ACPI BIOS, if available.

This method is know to work with Asus T101HA device. the
same table is also visible on EzPad devices. So, it seems
that at least some BIOSes use this method to pass data about
ISP2401-connected sensors.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/TODO            |  43 +------
 .../media/atomisp/pci/atomisp_gmin_platform.c | 105 +++++++++++++++++-
 2 files changed, 101 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index 9e46015ebcd5..6cf90ccf3cf8 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -18,48 +18,7 @@ TODO
    This should be converted to the usual way, using V4L2 async subdev
    framework to wait for cameras to be probed;
 
-2. Support for newer board-specific data (like Asus T101HA support) uses a
-   DMI match table to retrieve sensor's data, using hard-coded values.
-   It sounds feasible to retrieve those data directly from ACPI via _DSM
-   tables (like this one, associated with CAM1 at the above mentioned
-   hardware):
-
-            Name (C1CD, Buffer (0x0220){})
-            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
-            {
-                If ((Arg0 == ToUUID ("dc2f6c4f-045b-4f1d-97b9-882a6860a4be")))
-                {
-                    Local0 = Package (0x12)
-                        {
-                            "CamId",
-                            "ov2680",
-                            "CamType",
-                            "1",
-                            "CsiPort",
-                            "0",
-                            "CsiLanes",
-                            "1",
-                            "CsiFmt",
-                            "15",
-                            "CsiBayer",
-                            "0",
-                            "CamClk",
-                            "1",
-                            "Regulator1p8v",
-                            "0",
-                            "Regulator2p8v",
-                            "0"
-                        }
-                    Return (Local0)
-                }
-
-   The code there at atomisp_gmin_platform has an EFI parser, but it
-   assumes that the information would be stored on a different way.
-
-   As the Kernel has support for reading data from _DSM, via
-   acpi_evaluate_dsm(), it sounds doable to use such infra and remove the
-   DMI match, at least for some devices. This will likely allow covering
-   more devices that could also be using the same EFI UUID.
+2. Use ACPI _DSM table - DONE!
 
 3. Switch the driver to use pm_runtime stuff. Right now, it probes the
    existing PMIC code and sensors call it directly.
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 5d2bfe2ea971..5f34b2be5153 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -388,6 +388,10 @@ static const struct dmi_system_id gmin_vars[] = {
 				       0xa9, 0x71, 0xe8, 0x77,	   \
 				       0x75, 0x60, 0x68, 0xf7)
 
+static const guid_t atomisp_dsm_guid = GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
+						 0x97, 0xb9, 0x88, 0x2a,
+						 0x68, 0x60, 0xa4, 0xbe);
+
 #define CFG_VAR_NAME_MAX 64
 
 #define GMIN_PMC_CLK_NAME 14 /* "pmc_plt_clk_[0..5]" */
@@ -455,15 +459,28 @@ static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
 
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
-	int i, ret;
-	struct device *dev;
 	struct i2c_client *power = NULL, *client = v4l2_get_subdevdata(subdev);
+	struct acpi_device *adev;
+	acpi_handle handle;
+	struct device *dev;
+	int i, ret;
 
 	if (!client)
 		return NULL;
 
 	dev = &client->dev;
 
+	handle = ACPI_HANDLE(dev);
+
+	// FIXME: may need to release resources allocated by acpi_bus_get_device()
+	if (!handle || acpi_bus_get_device(handle, &adev)) {
+		dev_err(dev, "Error could not get ACPI device\n");
+		return NULL;
+	}
+
+	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
+		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
+
 	if (!pmic_id) {
 		if (gmin_i2c_dev_exists(dev, PMIC_ACPI_TI, &power))
 			pmic_id = PMIC_TI;
@@ -944,6 +961,75 @@ static int gmin_get_hardcoded_var(struct gmin_cfg_var *varlist,
 	return -EINVAL;
 }
 
+
+static int gmin_get_config_dsm_var(struct device *dev,
+				   const char *var,
+				   char *out, size_t *out_len)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *obj, *cur = NULL;
+	int i;
+
+	obj = acpi_evaluate_dsm(handle, &atomisp_dsm_guid, 0, 0, NULL);
+	if (!obj) {
+		dev_info_once(dev, "Didn't find ACPI _DSM table.\n");
+		return -EINVAL;
+	}
+
+#if 0 /* Just for debugging purposes */
+	for (i = 0; i < obj->package.count; i++) {
+		union acpi_object *cur = &obj->package.elements[i];
+
+		if (cur->type == ACPI_TYPE_INTEGER)
+			dev_info(dev, "object #%d, type %d, value: %lld\n",
+				 i, cur->type, cur->integer.value);
+		else if (cur->type == ACPI_TYPE_STRING)
+			dev_info(dev, "object #%d, type %d, string: %s\n",
+				 i, cur->type, cur->string.pointer);
+		else
+			dev_info(dev, "object #%d, type %d\n",
+				 i, cur->type);
+	}
+#endif
+
+	/* Seek for the desired var */
+	for (i = 0; i < obj->package.count - 1; i += 2) {
+		if (obj->package.elements[i].type == ACPI_TYPE_STRING &&
+		    !strcmp(obj->package.elements[i].string.pointer, var)) {
+			/* Next element should be the required value */
+			cur = &obj->package.elements[i + 1];
+			break;
+		}
+	}
+
+	if (!cur) {
+		dev_info(dev, "didn't found _DSM entry for '%s'\n", var);
+		ACPI_FREE(obj);
+		return -EINVAL;
+	}
+
+	/*
+	 * While it could be possible to have an ACPI_TYPE_INTEGER,
+	 * and read the value from cur->integer.value, the table
+	 * seen so far uses the string type. So, produce a warning
+	 * if it founds something different than string, letting it
+	 * to fall back to the old code.
+	 */
+	if (cur && cur->type != ACPI_TYPE_STRING) {
+		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
+		ACPI_FREE(obj);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "found _DSM entry for '%s': %s\n", var,
+		 cur->string.pointer);
+	strscpy(out, cur->string.pointer, *out_len);
+	*out_len = strlen(cur->string.pointer);
+
+	ACPI_FREE(obj);
+	return 0;
+}
+
 /* Retrieves a device-specific configuration variable.  The dev
  * argument should be a device with an ACPI companion, as all
  * configuration is based on firmware ID.
@@ -953,12 +1039,21 @@ static int gmin_get_config_var(struct device *maindev,
 			       const char *var,
 			       char *out, size_t *out_len)
 {
-	char var8[CFG_VAR_NAME_MAX];
 	efi_char16_t var16[CFG_VAR_NAME_MAX];
-	struct efivar_entry *ev;
 	const struct dmi_system_id *id;
-	int i, ret;
 	struct device *dev = maindev;
+	char var8[CFG_VAR_NAME_MAX];
+	struct efivar_entry *ev;
+	int i, ret;
+
+	/* For sensors, try first to use the _DSM table */
+	if (!is_gmin) {
+		ret = gmin_get_config_dsm_var(maindev, var, out, out_len);
+		if (!ret)
+			return 0;
+	}
+
+	/* Fall-back to other approaches */
 
 	if (!is_gmin && ACPI_COMPANION(dev))
 		dev = &ACPI_COMPANION(dev)->dev;
-- 
2.26.2

