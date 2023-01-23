Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08ED677BCC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjAWMyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjAWMyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1E31204D
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=43Fa3UvzcPSjiwaG5BSJaChxoPCQ2FSikKkvVqgltC0=;
        b=D2W/+wARhznD+N1yxT1NWJ8TUZNJEITZC6FneCm0y7wHBSTuKV3Npn0ai6+BV4fdfBma3m
        4TMQqVfAGwVcBR3k8MlILxX1rNEVq78OYbHNTnWjW3BUzt3wDzZP4GojkiDAYJvoe3LEey
        RyHhAGsUYZ9qHF0caYOYgrquHvUFIqo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-O-o02bgKO0GEQrgx_cAAew-1; Mon, 23 Jan 2023 07:53:06 -0500
X-MC-Unique: O-o02bgKO0GEQrgx_cAAew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5BC72817223;
        Mon, 23 Jan 2023 12:53:05 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 14029C15BA0;
        Mon, 23 Jan 2023 12:53:03 +0000 (UTC)
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
Subject: [PATCH 20/57] media: atomisp: Fix regulator registers on BYT devices with CRC PMIC
Date:   Mon, 23 Jan 2023 13:51:28 +0100
Message-Id: <20230123125205.622152-21-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Crystal Cove PMIC used on some BYT/CHT devices has different revisions
when paired with Bay Trail (BYT) vs Cherry Trail (CHT) SoCs.

The current hardcoded values are only valid for CHT devices, change
the code so that it uses the correct register values on both BYT and CHT.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 3d41fab661cf..6116d3c62315 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -57,8 +57,10 @@ enum clock_rate {
 #define LDO_1P8V_OFF	0x58 /* ... bottom bit is "enabled" */
 
 /* CRYSTAL COVE PMIC register set */
-#define CRYSTAL_1P8V_REG	0x57
-#define CRYSTAL_2P8V_REG	0x5d
+#define CRYSTAL_BYT_1P8V_REG	0x5d
+#define CRYSTAL_BYT_2P8V_REG	0x66
+#define CRYSTAL_CHT_1P8V_REG	0x57
+#define CRYSTAL_CHT_2P8V_REG	0x5d
 #define CRYSTAL_ON		0x63
 #define CRYSTAL_OFF		0x62
 
@@ -843,6 +845,7 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
 	int ret;
 	int value;
+	int reg;
 
 	if (!gs || gs->v1p8_on == on)
 		return 0;
@@ -898,10 +901,15 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 				     LDO10_REG, value, 0xff);
 		break;
 	case PMIC_CRYSTALCOVE:
+		if (IS_ISP2401)
+			reg = CRYSTAL_CHT_1P8V_REG;
+		else
+			reg = CRYSTAL_BYT_1P8V_REG;
+
 		value = on ? CRYSTAL_ON : CRYSTAL_OFF;
 
 		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
-				     CRYSTAL_1P8V_REG, value, 0xff);
+				     reg, value, 0xff);
 		break;
 	default:
 		dev_err(subdev->dev, "Couldn't set power mode for v1p8\n");
@@ -918,6 +926,7 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
 	int ret;
 	int value;
+	int reg;
 
 	if (WARN_ON(!gs))
 		return -ENODEV;
@@ -974,10 +983,15 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 				     LDO9_REG, value, 0xff);
 		break;
 	case PMIC_CRYSTALCOVE:
+		if (IS_ISP2401)
+			reg = CRYSTAL_CHT_2P8V_REG;
+		else
+			reg = CRYSTAL_BYT_2P8V_REG;
+
 		value = on ? CRYSTAL_ON : CRYSTAL_OFF;
 
 		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
-				     CRYSTAL_2P8V_REG, value, 0xff);
+				     reg, value, 0xff);
 		break;
 	default:
 		dev_err(subdev->dev, "Couldn't set power mode for v2p8\n");
-- 
2.39.0

