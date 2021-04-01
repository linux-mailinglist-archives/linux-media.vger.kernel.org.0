Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9893351E36
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237751AbhDASg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:36:26 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46406 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240056AbhDAS1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617301621; x=1648837621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mXosE0rlxsGKKT+7A7IfIECrJXlAhHskFLtgByoJ1l4=;
  b=efSakvHrksLWq5HjQh3+76q+fvVawYgV/cp3lknUGloQ/9mZNzRqiyDs
   y1kTi0UbE3XaiaPbADAF7gC01Y2INrtrLDMrDOmbhPrRw//Xuwt1Oikme
   GlPBCUYx60eNmYZR6fNgCne1CkVgXikEKvRVMFd78t6EL9IBAZqYHkFQk
   kJr2ip9EpxeyKLEWcWhmvHv40LmqksRBPkA6kZxG6MnyAsDqXzK2Jsa36
   uizj1CDBh3umCGZuMhJi0xzEmViTw0L2SQ+2Ehrf8i8GDnW7c1RJRMZPt
   b70GAAoPzF/5XVuYp8XsuXWeLUBmCbFK8GOAG6VU5m8p+5BTW8RADl2iY
   A==;
IronPort-SDR: yc3eAjuUufO/JSmkuIYIEuH6lv9BRw3KwhLpup6/ano0uzGSAwPTYfEbkZi35x366TEy0csPIa
 UjywuYxBBUnycNxv3uSUjWAi+S/SvS6cjW39UG5kdFHqclK/KiyTMnACOrEen2HHi0COBWcS45
 QsWnahfX4C/9nVqtTige9BCgLbvMHLpZn6oqZtP2YIyzuiuTyXm34mvnB6V6r0NrtO0kmaDxOR
 ibI6fJ56+/SNXvQCD2Lq1feCcMSnsto76Hpa81l4Ea8ZIiZwItOU76RcEeIs4Up4dcxPm94yqn
 GEs=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="121401837"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:29:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:29:08 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:29:04 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 04/30] media: atmel: atmel-isc: specialize max width and max height
Date:   Thu, 1 Apr 2021 14:26:57 +0300
Message-ID: <20210401112723.189107-5-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the max width and max height constants to the product specific driver
and have them in the device struct.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 28 +++++++++----------
 drivers/media/platform/atmel/atmel-isc.h      |  9 ++++--
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  7 +++--
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 45fc8dbb7943..350076dd029a 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1204,8 +1204,8 @@ static void isc_try_fse(struct isc_device *isc,
 	 * just use the maximum ISC can receive.
 	 */
 	if (ret) {
-		pad_cfg->try_crop.width = ISC_MAX_SUPPORT_WIDTH;
-		pad_cfg->try_crop.height = ISC_MAX_SUPPORT_HEIGHT;
+		pad_cfg->try_crop.width = isc->max_width;
+		pad_cfg->try_crop.height = isc->max_height;
 	} else {
 		pad_cfg->try_crop.width = fse.max_width;
 		pad_cfg->try_crop.height = fse.max_height;
@@ -1282,10 +1282,10 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 	isc->try_config.sd_format = sd_fmt;
 
 	/* Limit to Atmel ISC hardware capabilities */
-	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
-		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
-	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
-		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
+	if (pixfmt->width > isc->max_width)
+		pixfmt->width = isc->max_width;
+	if (pixfmt->height > isc->max_height)
+		pixfmt->height = isc->max_height;
 
 	/*
 	 * The mbus format is the one the subdev outputs.
@@ -1327,10 +1327,10 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 	v4l2_fill_pix_format(pixfmt, &format.format);
 
 	/* Limit to Atmel ISC hardware capabilities */
-	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
-		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
-	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
-		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
+	if (pixfmt->width > isc->max_width)
+		pixfmt->width = isc->max_width;
+	if (pixfmt->height > isc->max_height)
+		pixfmt->height = isc->max_height;
 
 	pixfmt->field = V4L2_FIELD_NONE;
 	pixfmt->bytesperline = (pixfmt->width * isc->try_config.bpp) >> 3;
@@ -1368,10 +1368,10 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 		return ret;
 
 	/* Limit to Atmel ISC hardware capabilities */
-	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
-		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
-	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
-		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
+	if (f->fmt.pix.width > isc->max_width)
+		f->fmt.pix.width = isc->max_width;
+	if (f->fmt.pix.height > isc->max_height)
+		f->fmt.pix.height = isc->max_height;
 
 	isc->fmt = *f;
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 8d81d9967ad2..6becc6c3aaf0 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -10,9 +10,6 @@
  */
 #ifndef _ATMEL_ISC_H_
 
-#define ISC_MAX_SUPPORT_WIDTH   2592
-#define ISC_MAX_SUPPORT_HEIGHT  1944
-
 #define ISC_CLK_MAX_DIV		255
 
 enum isc_clk_id {
@@ -191,6 +188,9 @@ struct isc_ctrls {
  * @gamma_table:	pointer to the table with gamma values, has
  *			gamma_max sets of GAMMA_ENTRIES entries each
  * @gamma_max:		maximum number of sets of inside the gamma_table
+ *
+ * @max_width:		maximum frame width, dependent on the internal RAM
+ * @max_height:		maximum frame height, dependent on the internal RAM
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -254,6 +254,9 @@ struct isc_device {
 	/* pointer to the defined gamma table */
 	const u32	(*gamma_table)[GAMMA_ENTRIES];
 	u32		gamma_max;
+
+	u32		max_width;
+	u32		max_height;
 };
 
 extern struct isc_format formats_list[];
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index f45d8b96bfb8..f8d1c8ba99b3 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -49,8 +49,8 @@
 #include "atmel-isc-regs.h"
 #include "atmel-isc.h"
 
-#define ISC_MAX_SUPPORT_WIDTH   2592
-#define ISC_MAX_SUPPORT_HEIGHT  1944
+#define ISC_SAMA5D2_MAX_SUPPORT_WIDTH   2592
+#define ISC_SAMA5D2_MAX_SUPPORT_HEIGHT  1944
 
 #define ISC_CLK_MAX_DIV		255
 
@@ -195,6 +195,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->gamma_table = isc_sama5d2_gamma_table;
 	isc->gamma_max = 2;
 
+	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
+	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
+
 	ret = isc_pipeline_init(isc);
 	if (ret)
 		return ret;
-- 
2.25.1

