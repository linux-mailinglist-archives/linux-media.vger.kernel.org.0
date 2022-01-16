Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DDD48FF4E
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbiAPVwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26306 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236291AbiAPVwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o5VWUts0cwvuR1rVTDe6M//qtsGHWNBoNqzmU7SeN0k=;
        b=ZEnO0ZL3q9WxH6y42Oq0RCKiahe+f1FmWjFgW6EeBF+UJEIeajJeKAu+7etlSu4DDRk6UD
        F6cHoxOtfqM2IPY89Jpv59yVIIfy4At9Rv7ETZNxPylVRyLNHsz5ED36KYkeKFxj4ol096
        vxvl3QYqnSV2l6O3bRdNQCylVhzp9R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-wtknSVZgMj2JNkeNV-tqwg-1; Sun, 16 Jan 2022 16:52:32 -0500
X-MC-Unique: wtknSVZgMj2JNkeNV-tqwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD332F24;
        Sun, 16 Jan 2022 21:52:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A13512E37;
        Sun, 16 Jan 2022 21:52:28 +0000 (UTC)
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
Subject: [PATCH 8/9] media: atomisp_gmin_platform: Base CsiPort default on detected CLK
Date:   Sun, 16 Jan 2022 22:52:03 +0100
Message-Id: <20220116215204.307649-9-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On devices with 2 cameras and no _DSM / EFI-vars providing CsiPort
clock info, defaulting to CsiPort 0 obviously is wrong for 1 of the
2 cameras.

The Intel Cherry Trail (ISP2401) reference design combines:
 pmc_plt_clk_2 with CsiPort 0
 pmc_plt_clk_4 with CsiPort 1

The Intel Bay Trail (ISP2400) reference design combines:
 pmc_plt_clk_1 with CsiPort 0
 pmc_plt_clk_0 with CsiPort 1

Use this knowledge to set the default CsiPort value based on
the detected CLK for the sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 84a453118bd9..544e3e7b3aaf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -540,7 +540,7 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
 	struct device *dev = &client->dev;
 	struct acpi_device *adev = ACPI_COMPANION(dev);
-	int ret, clock_num = -1;
+	int ret, default_val, clock_num = -1;
 
 	dev_info(dev, "%s: ACPI path is %pfw\n", __func__, dev_fwnode(dev));
 
@@ -548,7 +548,20 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 	gs->clock_src = gmin_get_var_int(dev, false, "ClkSrc",
 				         VLV2_CLK_PLL_19P2MHZ);
 
-	gs->csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
+	/*
+	 * Get ACPI _PR0 derived clock here already because it is used
+	 * to determine the csi_port default.
+	 */
+	if (acpi_device_power_manageable(adev))
+		clock_num = atomisp_get_acpi_power(dev);
+
+	/* Compare clock to CsiPort 1 pmc-clock used in the CHT/BYT reference designs */
+	if (IS_ISP2401)
+		default_val = clock_num == 4 ? 1 : 0;
+	else
+		default_val = clock_num == 0 ? 1 : 0;
+
+	gs->csi_port = gmin_get_var_int(dev, false, "CsiPort", default_val);
 	gs->csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
 
 	gs->gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
@@ -629,11 +642,7 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 	 * otherwise.
 	 */
 
-	/* Try first to use ACPI to get the clock resource */
-	if (acpi_device_power_manageable(adev))
-		clock_num = atomisp_get_acpi_power(dev);
-
-	/* Fall-back use EFI and/or DMI match */
+	/* If getting the clock from _PR0 above failed, fall-back to EFI and/or DMI match */
 	if (clock_num < 0)
 		clock_num = gmin_get_var_int(dev, false, "CamClk", 0);
 
-- 
2.33.1

