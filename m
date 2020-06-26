Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CB720B32F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbgFZOFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:50092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728964AbgFZOFC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:02 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0707E2080C;
        Fri, 26 Jun 2020 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=e7N2SIIa+nFd98qwutbfTR9JvzeEd0QzoGZgPTGy2XI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LBh2l6xOQkHobw2dFEhjLXnONV9J7QTnDllUaUQpQ+LTLTlHCcn8hN1pUtoQ9t9xu
         RHYYwgPp6Ti2BSvb/5FP1i9hm0SvEnGiORI9E1lpOHRPe5rq6quuYk3zTkGkpKcFtn
         ujPuJ48Ymm2JDVKXIXqmo8ub+Pj38n6ULwRSi/KI=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyS-00HKwD-3g; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] media: atomisp: properly parse CLK PMIC on newer devices
Date:   Fri, 26 Jun 2020 16:04:55 +0200
Message-Id: <a5d8185e00c6248e4076095101b6a1add8954f11.1593180146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593180146.git.mchehab+huawei@kernel.org>
References: <cover.1593180146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Newer devices don't place the PMIC CLK line inside an EFI
var. Instead, those are found at the _PR0 table.

Add a parser for it, using info stored via the DSDT table.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 66 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 2903aa52115b..e476cf1f3294 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -444,6 +444,61 @@ static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
 	return ret;
 }
 
+static int atomisp_get_acpi_power(struct device *dev, acpi_handle handle)
+{
+	char name[5];
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer b_name = { sizeof(name), name };
+	union acpi_object *package, *element;
+	acpi_handle rhandle;
+	acpi_status status;
+	int clock_num = -1;
+	int i;
+
+	status = acpi_evaluate_object(handle, "_PR0", NULL, &buffer);
+	if (!ACPI_SUCCESS(status))
+		return -1;
+
+	package = buffer.pointer;
+
+	if (!buffer.length || !package
+	    || package->type != ACPI_TYPE_PACKAGE
+	    || !package->package.count)
+		goto fail;
+
+	for (i = 0; i < package->package.count; i++) {
+		element = &package->package.elements[i];
+
+		if (element->type != ACPI_TYPE_LOCAL_REFERENCE)
+			continue;
+
+		rhandle = element->reference.handle;
+		if (!rhandle)
+			goto fail;
+
+		acpi_get_name(rhandle, ACPI_SINGLE_NAME, &b_name);
+
+		dev_dbg(dev, "Found PM resource '%s'\n", name);
+		if (strlen(name) == 4 && !strncmp(name, "CLK", 3)) {
+		        if (name[3] >= '0' && name[3] <= '4')
+				clock_num = name[3] - '0';
+#if 0
+			/*
+			 * We could abort here, but let's parse all resources,
+			 * as this is helpful for debugging purposes
+			 */
+			if (clock_num >= 0)
+			    break;
+#endif
+		}
+	}
+
+fail:
+	ACPI_FREE(buffer.pointer);
+
+	return clock_num;
+}
+
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
 	struct i2c_client *power = NULL, *client = v4l2_get_subdevdata(subdev);
@@ -451,7 +506,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	struct gmin_subdev *gs;
 	acpi_handle handle;
 	struct device *dev;
-	int i, ret, clock_num;
+	int i, ret, clock_num = -1;
 
 	if (!client)
 		return NULL;
@@ -570,7 +625,14 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	 * is a power resource already, falling back to the EFI vars detection
 	 * otherwise.
 	 */
-	clock_num = gmin_get_var_int(dev, false, "CamClk", -1);
+
+	/* Try first to use ACPI to get the clock resource */
+	if (acpi_device_power_manageable(adev))
+		clock_num = atomisp_get_acpi_power(dev, handle);
+
+	/* Fall-back use EFI and/or DMI match */
+	if (clock_num < 0)
+		clock_num = gmin_get_var_int(dev, false, "CamClk", 0);
 
 	if (clock_num < 0 || clock_num > MAX_CLK_COUNT) {
 		dev_err(dev, "Invalid clock number\n");
-- 
2.26.2

