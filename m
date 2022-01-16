Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBBA48FF4C
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236288AbiAPVwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38751 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbiAPVwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VErd/7wGyW/ygvfSf6FWyylvOBgyJgZoVFRzih2Btow=;
        b=UUqJoqm+uGdEqiAgl1xCJssmp2DWj2JPFiaTd30HGUMwmVGN+slF7urQ9qvEjlsoJqoAb0
        /G3ITfh++PPXbKxu7G8VN07BDVse66R5MSVPsHp9pbxkmOmYcFLDOj38UdI9MdHPEepwf6
        /f3tZTYY0obSbuZvkWODum/5u7LMeO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-BLtioM7-Oe2woZnRUs3BKA-1; Sun, 16 Jan 2022 16:52:27 -0500
X-MC-Unique: BLtioM7-Oe2woZnRUs3BKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED95802924;
        Sun, 16 Jan 2022 21:52:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8226D12E37;
        Sun, 16 Jan 2022 21:52:22 +0000 (UTC)
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
Subject: [PATCH 6/9] media: atomisp_gmin_platform: Set ELDO1 to 1.6V on devices with an AXP288 PMIC
Date:   Sun, 16 Jan 2022 22:52:01 +0100
Message-Id: <20220116215204.307649-7-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Testing on multiple tablet models has shown that Android always uses
1.6V for ELDO1, adjust our code to match.

This also matches with how ELDO1 is used in the DSDTs on these devices,
where for Cherry Trail (ISP2401) based devices ELDO1 is used for an
ACPI power-resource which is named "P16P".

Note on Bay Trail (ISP2400) based devices the power-resource is called
"P15P", which suggests that 1.5V might be a better value there.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c      | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 960c64ecdfe4..1c3fd72895ec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -38,7 +38,7 @@ enum clock_rate {
 #define ELDO_CTRL_REG   0x12
 
 #define ELDO1_SEL_REG	0x19
-#define ELDO1_1P8V	0x16
+#define ELDO1_1P6V	0x12
 #define ELDO1_CTRL_SHIFT 0x00
 
 #define ELDO2_SEL_REG	0x1a
@@ -89,7 +89,7 @@ struct gmin_subdev {
 	u8 pwm_i2c_addr;
 
 	/* For PMIC AXP */
-	int eldo1_sel_reg, eldo1_1p8v, eldo1_ctrl_shift;
+	int eldo1_sel_reg, eldo1_1p6v, eldo1_ctrl_shift;
 	int eldo2_sel_reg, eldo2_1p8v, eldo2_ctrl_shift;
 };
 
@@ -685,9 +685,9 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 		break;
 
 	case PMIC_AXP:
-		gs->eldo1_1p8v = gmin_get_var_int(dev, false,
+		gs->eldo1_1p6v = gmin_get_var_int(dev, false,
 						  "eldo1_1p8v",
-						  ELDO1_1P8V);
+						  ELDO1_1P6V);
 		gs->eldo1_sel_reg = gmin_get_var_int(dev, false,
 						     "eldo1_sel_reg",
 						     ELDO1_SEL_REG);
@@ -767,8 +767,8 @@ static int axp_v1p8_on(struct device *dev, struct gmin_subdev *gs)
 	 */
 	usleep_range(110, 150);
 
-	ret = axp_regulator_set(dev, gs, gs->eldo1_sel_reg, gs->eldo1_1p8v,
-		ELDO_CTRL_REG, gs->eldo1_ctrl_shift, true);
+	ret = axp_regulator_set(dev, gs, gs->eldo1_sel_reg, gs->eldo1_1p6v,
+				ELDO_CTRL_REG, gs->eldo1_ctrl_shift, true);
 	if (ret)
 		return ret;
 
@@ -781,7 +781,7 @@ static int axp_v1p8_off(struct device *dev, struct gmin_subdev *gs)
 {
 	int ret;
 
-	ret = axp_regulator_set(dev, gs, gs->eldo1_sel_reg, gs->eldo1_1p8v,
+	ret = axp_regulator_set(dev, gs, gs->eldo1_sel_reg, gs->eldo1_1p6v,
 				ELDO_CTRL_REG, gs->eldo1_ctrl_shift, false);
 	if (ret)
 		return ret;
-- 
2.33.1

