Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B94148FF4F
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbiAPVwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51765 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236291AbiAPVwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xpUv2jXHv8dIaAEODjQNp9LH37nzXHyaaDslGDnwyR0=;
        b=FmkqHNAK95D8TWrmrGY77Hsk5XweDH0qPenYSKTH0BCnN58Y3nlZEBnwY9z0EYzmb1pRmd
        7MnZD6N23uK+KaFYHhT9EYCqF2Skv+vo4/GUShR83G5lYkpJS0WLkVEQ7xfKMJhBy1MTwf
        xREmf1UFY6rQ44DAKPMDJ9vXXuUR5S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-0r_aBLE6MiCBmTgW-DyvCQ-1; Sun, 16 Jan 2022 16:52:35 -0500
X-MC-Unique: 0r_aBLE6MiCBmTgW-DyvCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B522A1006AA3;
        Sun, 16 Jan 2022 21:52:33 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5104C61F20;
        Sun, 16 Jan 2022 21:52:31 +0000 (UTC)
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
Subject: [PATCH 9/9] media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2 regulator off on some boards
Date:   Sun, 16 Jan 2022 22:52:04 +0100
Message-Id: <20220116215204.307649-10-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The TrekStor SurfTab duo W1 10.1 has a hw bug where turning eldo2 back on
after having turned it off causes the CPLM3218 ambient-light-sensor on
the front camera sensor's I2C bus to crash, hanging the bus.

Add a DMI quirk table for systems on which to leave eldo2 on.

Note an alternative fix is to turn off the CPLM3218 ambient-light-sensor
as long as the camera sensor is being used, this is what Windows seems
to do as a workaround (based on analyzing the DSDT). But that is not
easy to do cleanly under Linux.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 544e3e7b3aaf..7e47db82de07 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -761,6 +761,21 @@ static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
 	return 0;
 }
 
+/*
+ * Some boards contain a hw-bug where turning eldo2 back on after having turned
+ * it off causes the CPLM3218 ambient-light-sensor on the image-sensor's I2C bus
+ * to crash, hanging the bus. Do not turn eldo2 off on these systems.
+ */
+static const struct dmi_system_id axp_leave_eldo2_on_ids[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab duo W1 10.1 (VT4)"),
+		},
+	},
+	{ }
+};
+
 static int axp_v1p8_on(struct device *dev, struct gmin_subdev *gs)
 {
 	int ret;
@@ -790,6 +805,9 @@ static int axp_v1p8_off(struct device *dev, struct gmin_subdev *gs)
 	if (ret)
 		return ret;
 
+	if (dmi_check_system(axp_leave_eldo2_on_ids))
+		return 0;
+
 	ret = axp_regulator_set(dev, gs, gs->eldo2_sel_reg, gs->eldo2_1p8v,
 				ELDO_CTRL_REG, gs->eldo2_ctrl_shift, false);
 	return ret;
-- 
2.33.1

