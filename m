Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7098248FF4A
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbiAPVw2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44333 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236282AbiAPVw1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tdlz402qiFuS6gEvp9z+mWyjyKqkZaVDzlGuYidzGVo=;
        b=RtJK38KA4NrNkWtgvzkK7oTkNhRwtN3OMBx9J5jj6yE0nRkCD2q5E7LgjhIXXRHu8LN1/m
        wtccG7XuHBRvAq2xkUaBtfilonr0+xYwsH48ODaJQ7qVbf/yNHSWZfu7ymY1YE3BVFtKkQ
        5R4/yqba7K00kTafdtd9q8VktkBL82M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-azjLsH5iMQG44VRtAQFCBQ-1; Sun, 16 Jan 2022 16:52:23 -0500
X-MC-Unique: azjLsH5iMQG44VRtAQFCBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C0BA1006AA3;
        Sun, 16 Jan 2022 21:52:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B6B4312E37;
        Sun, 16 Jan 2022 21:52:19 +0000 (UTC)
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
Subject: [PATCH 5/9] media: atomisp_gmin_platform: Add enable-count to gmin_[v1p8|v2p8]_ctrl()
Date:   Sun, 16 Jan 2022 22:52:00 +0100
Message-Id: <20220116215204.307649-6-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On devices with 2 sensors the 2 sensors may get probed simultaneously
and the v1p8 and v2p8 regulators are ususally shared between the
2 sensors.

This means that the probe() function of sensor 1 may end up calling
gmin_v1p8_ctrl(..., false) turning the regulator off while sensor 2's
probe() function still needs it to be on, causing the probe() of
sensor 2 to sometimes fail.

Fix this by adding an enable-count for both regulators and only
disabling them again when that goes to 0.

Note all this really should be converted to use the standard kernel
regulator framework, I have doing this on my long term TODO list,
this fix is only meant as a temporary workaround for the issue.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 86 ++++++++++++++-----
 1 file changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a29e5086ffe1..960c64ecdfe4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -118,6 +118,10 @@ static const char *pmic_name[] = {
 	[PMIC_CRYSTALCOVE]	= "Crystal Cove PMIC",
 };
 
+static DEFINE_MUTEX(gmin_regulator_mutex);
+static int gmin_v1p8_enable_count;
+static int gmin_v2p8_enable_count;
+
 /* The atomisp uses type==0 for the end-of-list marker, so leave space. */
 static struct intel_v4l2_subdev_table pdata_subdevs[MAX_SUBDEVS + 1];
 
@@ -851,38 +855,58 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 
 	gs->v1p8_on = on;
 
+	ret = 0;
+	mutex_lock(&gmin_regulator_mutex);
+	if (on) {
+		gmin_v1p8_enable_count++;
+		if (gmin_v1p8_enable_count > 1)
+			goto out; /* Already on */
+	} else {
+		gmin_v1p8_enable_count--;
+		if (gmin_v1p8_enable_count > 0)
+			goto out; /* Still needed */
+	}
+
 	if (gs->v1p8_gpio >= 0)
 		gpio_set_value(gs->v1p8_gpio, on);
 
 	if (gs->v1p8_reg) {
 		regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
 		if (on)
-			return regulator_enable(gs->v1p8_reg);
+			ret = regulator_enable(gs->v1p8_reg);
 		else
-			return regulator_disable(gs->v1p8_reg);
+			ret = regulator_disable(gs->v1p8_reg);
+
+		goto out;
 	}
 
 	switch (pmic_id) {
 	case PMIC_AXP:
 		if (on)
-			return axp_v1p8_on(subdev->dev, gs);
+			ret = axp_v1p8_on(subdev->dev, gs);
 		else
-			return axp_v1p8_off(subdev->dev, gs);
+			ret = axp_v1p8_off(subdev->dev, gs);
+		break;
 	case PMIC_TI:
 		value = on ? LDO_1P8V_ON : LDO_1P8V_OFF;
 
-		return gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
-				      LDO10_REG, value, 0xff);
+		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
+				     LDO10_REG, value, 0xff);
+		break;
 	case PMIC_CRYSTALCOVE:
 		value = on ? CRYSTAL_ON : CRYSTAL_OFF;
 
-		return gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
-				      CRYSTAL_1P8V_REG, value, 0xff);
+		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
+				     CRYSTAL_1P8V_REG, value, 0xff);
+		break;
 	default:
-		dev_err(subdev->dev, "Couldn't set power mode for v1p2\n");
+		dev_err(subdev->dev, "Couldn't set power mode for v1p8\n");
+		ret = -EINVAL;
 	}
 
-	return -EINVAL;
+out:
+	mutex_unlock(&gmin_regulator_mutex);
+	return ret;
 }
 
 static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
@@ -908,37 +932,57 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 	gs->v2p8_on = on;
 
+	ret = 0;
+	mutex_lock(&gmin_regulator_mutex);
+	if (on) {
+		gmin_v2p8_enable_count++;
+		if (gmin_v2p8_enable_count > 1)
+			goto out; /* Already on */
+	} else {
+		gmin_v2p8_enable_count--;
+		if (gmin_v2p8_enable_count > 0)
+			goto out; /* Still needed */
+	}
+
 	if (gs->v2p8_gpio >= 0)
 		gpio_set_value(gs->v2p8_gpio, on);
 
 	if (gs->v2p8_reg) {
 		regulator_set_voltage(gs->v2p8_reg, 2900000, 2900000);
 		if (on)
-			return regulator_enable(gs->v2p8_reg);
+			ret = regulator_enable(gs->v2p8_reg);
 		else
-			return regulator_disable(gs->v2p8_reg);
+			ret = regulator_disable(gs->v2p8_reg);
+
+		goto out;
 	}
 
 	switch (pmic_id) {
 	case PMIC_AXP:
-		return axp_regulator_set(subdev->dev, gs, ALDO1_SEL_REG,
-					 ALDO1_2P8V, ALDO1_CTRL3_REG,
-					 ALDO1_CTRL3_SHIFT, on);
+		ret = axp_regulator_set(subdev->dev, gs, ALDO1_SEL_REG,
+					ALDO1_2P8V, ALDO1_CTRL3_REG,
+					ALDO1_CTRL3_SHIFT, on);
+		break;
 	case PMIC_TI:
 		value = on ? LDO_2P8V_ON : LDO_2P8V_OFF;
 
-		return gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
-				      LDO9_REG, value, 0xff);
+		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
+				     LDO9_REG, value, 0xff);
+		break;
 	case PMIC_CRYSTALCOVE:
 		value = on ? CRYSTAL_ON : CRYSTAL_OFF;
 
-		return gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
-				      CRYSTAL_2P8V_REG, value, 0xff);
+		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
+				     CRYSTAL_2P8V_REG, value, 0xff);
+		break;
 	default:
-		dev_err(subdev->dev, "Couldn't set power mode for v1p2\n");
+		dev_err(subdev->dev, "Couldn't set power mode for v2p8\n");
+		ret = -EINVAL;
 	}
 
-	return -EINVAL;
+out:
+	mutex_unlock(&gmin_regulator_mutex);
+	return ret;
 }
 
 static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
-- 
2.33.1

