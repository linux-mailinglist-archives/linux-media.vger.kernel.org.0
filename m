Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DF035439F
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238149AbhDEPxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:53:14 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36243 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbhDEPxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617637987; x=1649173987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mXosE0rlxsGKKT+7A7IfIECrJXlAhHskFLtgByoJ1l4=;
  b=MtVoluMgmQmcoMmoeoF5nmcXqcszpsv4gqrfgt0/dN5SIdUWr8rZ5nlo
   urWSUY/T4XoKXomjJVzZ5LlI58dJKSgSSOIi9jkvIFk9zT7OC9N3Fsb76
   G+/4X6/ZOxzUviV6Fdu6ZJDV7DBzHqexYIE4oIHwKSUCETQk/dNN1a8F+
   Vtetw31ohsO9V6sB6YfZwCvG7QbQY0v1+pXEFSFgdqNjbInGQFr9ybupc
   yZpWs72MZwobbvT2P4WTgU88disLrYy2Aep4L1CtlXxeASXGRmLUqcIdW
   oaFUNnYf3U3JkfH7Sj1CV10oAFODAsBtuRU1QsHtxXG1d4r9i6qh/f+FL
   A==;
IronPort-SDR: fo7eoP+ZYdwkNYc409MzRlq1V3dmJ6ZN/QvneTINWxx8wS8kVfRSSTXO0WdH/3g7wrYNVTh0Sa
 a9LHrd6HJLR1LjPQCjO8fMNQyqIl8/1hTtXYuUqQEWuIjNzFIKCE5spSzTeRd3hSBH5yo/N6Xz
 urJ7cZ4Mck//CsX87bkyxktBsySC3YX29hFBeeIKIHc4CxOjzMT2cW7z8ubm1BpIhUTTh+50qB
 wN74Nl5+XLj+PL3B6czr/alCao57qXqWZ66aUKp/G4F34+oGCVcqVE/0n2G/jOLw5f2Ys4Mf/7
 938=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112481623"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:06 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:52:49 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 04/30] media: atmel: atmel-isc: specialize max width and max height
Date:   Mon, 5 Apr 2021 18:50:39 +0300
Message-ID: <20210405155105.162529-5-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

