Return-Path: <linux-media+bounces-21087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F391F9C1189
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 23:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812071F23C31
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 22:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D95216A32;
	Thu,  7 Nov 2024 22:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BEofz4Uz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A02185A4
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731017505; cv=none; b=oUxm7By396IGionmciIJnpXYO0o+MsEd8flG7jbVg2uJP5wV4F0HpvwHnt0ZmsLWS8k8aGHeeHQfupyaNHXZZaIDGYO6vo0HtzuA8h51F09dGvsWiWPEuIfjhq0oM43e/oogiZSbneM/48IYgNP6hkfs96xAXMtHC5BS7YzGxDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731017505; c=relaxed/simple;
	bh=amCqaDApkO8623sf8Oi9QQ3UbWF36RzHxJBjdGjdEwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/DHiWBq4+A41sugNnJ/24Zv7K20b0FindIG0JS92ZWZ3biD3I9sJNMBIxhN5Qku3jc+hBbkb4uVr3mKCIJMsIJiQtKXMJcfKdZpfnUOsnrpsLm0Gneow/4BGbJcySNPVzAFa92SmMv2qW/LzRTfnvDunSo3eZ1KrFz2ofNtOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BEofz4Uz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731017502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6XdLsK6dGSUVDL3FIk1GPBWJGXdP9D65IRQ5gVT1UIo=;
	b=BEofz4UzDqKB7uDfl2ST8RF3Q7GM3LHeEmWcWAZWZVUD04Mi9UOiVgdzFTzmwrcyr48jBt
	jkmeN3EWSD0w6F11Bmewg3n8aMZiuYSmumnNcAzcmEHf7CsdK1/WKvLTKs1jvoNtbffLlX
	aHUBen9KiuEgSCMOOQJATK6NlSRst7U=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-16-65stCUCROAWsWgalPv2_xg-1; Thu,
 07 Nov 2024 17:11:39 -0500
X-MC-Unique: 65stCUCROAWsWgalPv2_xg-1
X-Mimecast-MFC-AGG-ID: 65stCUCROAWsWgalPv2_xg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0091B19560AF;
	Thu,  7 Nov 2024 22:11:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9059D1953882;
	Thu,  7 Nov 2024 22:11:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] media: atomisp: gmin: Remove GPIO driven regulator support
Date: Thu,  7 Nov 2024 23:11:34 +0100
Message-ID: <20241107221134.596149-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The GMIN code has support for sensors using external regulators enabled
by GPIOS, rather then using regulators build into the PMIC.

With the exception of the Trekstor ST70408-4 (1) tablet there are no known
devices which actually use external regulators for the sensors and the code
for this is using deprecated old style GPIO numbers support for which is
going away.

Remove the GPIO driven regulator support so that the gmin code no longer
depends on deprecated GPIO APIs.

1) The GMIN support itself is also deprecated and all sensor drivers still
using it are being moved over to use ACPI + runtime-pm and the ST70408-4
shipped with Android as factory OS and thus will have broken ACPI tables
for the sensors, so like other Android factory OS tablets it will need
a bespoke solution anyways.

Reported-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Bart reported this to me by an off list email, so no Closes tag
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 69 -------------------
 1 file changed, 69 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 8ec990293b48..e7923dc38f2e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -85,9 +85,6 @@ struct gmin_subdev {
 	bool v2p8_on;
 	bool v1p2_on;
 
-	int v1p8_gpio;
-	int v2p8_gpio;
-
 	u8 pwm_i2c_addr;
 
 	/* For PMIC AXP */
@@ -242,22 +239,6 @@ static struct gmin_cfg_var mrd7_vars[] = {
 	{},
 };
 
-static struct gmin_cfg_var ecs7_vars[] = {
-	{"INT33BE:00_CsiPort", "1"},
-	{"INT33BE:00_CsiLanes", "2"},
-	{"INT33BE:00_CsiFmt", "13"},
-	{"INT33BE:00_CsiBayer", "2"},
-	{"INT33BE:00_CamClk", "0"},
-
-	{"INT33F0:00_CsiPort", "0"},
-	{"INT33F0:00_CsiLanes", "1"},
-	{"INT33F0:00_CsiFmt", "13"},
-	{"INT33F0:00_CsiBayer", "0"},
-	{"INT33F0:00_CamClk", "1"},
-	{"gmin_V2P8GPIO", "402"},
-	{},
-};
-
 static struct gmin_cfg_var i8880_vars[] = {
 	{"XXOV2680:00_CsiPort", "1"},
 	{"XXOV2680:00_CsiLanes", "1"},
@@ -307,13 +288,6 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = mrd7_vars,
 	},
-	{
-		.ident = "ST70408",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
-		},
-		.driver_data = ecs7_vars,
-	},
 	{
 		.ident = "VTA0803",
 		.matches = {
@@ -531,23 +505,6 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 	else
 		dev_info(dev, "will handle gpio1 via ACPI\n");
 
-	/*
-	 * Those are used only when there is an external regulator apart
-	 * from the PMIC that would be providing power supply, like on the
-	 * two cases below:
-	 *
-	 * The ECS E7 board drives camera 2.8v from an external regulator
-	 * instead of the PMIC.  There's a gmin_CamV2P8 config variable
-	 * that specifies the GPIO to handle this particular case,
-	 * but this needs a broader architecture for handling camera power.
-	 *
-	 * The CHT RVP board drives camera 1.8v from an* external regulator
-	 * instead of the PMIC just like ECS E7 board.
-	 */
-
-	gs->v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
-	gs->v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
-
 	/*
 	 * FIXME:
 	 *
@@ -820,16 +777,6 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 	if (!gs || gs->v1p8_on == on)
 		return 0;
 
-	if (gs->v1p8_gpio >= 0) {
-		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
-			gs->v1p8_gpio);
-		ret = gpio_request(gs->v1p8_gpio, "camera_v1p8_en");
-		if (!ret)
-			ret = gpio_direction_output(gs->v1p8_gpio, 0);
-		if (ret)
-			pr_err("V1P8 GPIO initialization failed\n");
-	}
-
 	gs->v1p8_on = on;
 
 	ret = 0;
@@ -844,9 +791,6 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 			goto out; /* Still needed */
 	}
 
-	if (gs->v1p8_gpio >= 0)
-		gpio_set_value(gs->v1p8_gpio, on);
-
 	if (gs->v1p8_reg) {
 		regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
 		if (on)
@@ -901,16 +845,6 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 	if (WARN_ON(!gs))
 		return -ENODEV;
 
-	if (gs->v2p8_gpio >= 0) {
-		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
-			gs->v2p8_gpio);
-		ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
-		if (!ret)
-			ret = gpio_direction_output(gs->v2p8_gpio, 0);
-		if (ret)
-			pr_err("V2P8 GPIO initialization failed\n");
-	}
-
 	if (gs->v2p8_on == on)
 		return 0;
 	gs->v2p8_on = on;
@@ -927,9 +861,6 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 			goto out; /* Still needed */
 	}
 
-	if (gs->v2p8_gpio >= 0)
-		gpio_set_value(gs->v2p8_gpio, on);
-
 	if (gs->v2p8_reg) {
 		regulator_set_voltage(gs->v2p8_reg, 2900000, 2900000);
 		if (on)
-- 
2.47.0


