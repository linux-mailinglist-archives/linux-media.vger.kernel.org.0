Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78463351B92
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237867AbhDASI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34747 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237774AbhDASEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300265; x=1648836265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZseDIZKjZBAQeshZzxvVySAICjj4gFiPGz57KZF5zJM=;
  b=mdJQJK5s5ZUwNbrbEtdva+vg1UvQD2RMigz2mzUNEaEkXd9zGjj5cHvD
   h1rL0ERk30ND7w6tGp+c9ABmOkEvei0pzNtl+mxAw0gjVKxcDO71ehu+c
   gH8N5r0YlGt6RDsJMBlQNAVt3hEsrfuNsrIX5UkMZ3fVuOwGnBGmgJwX9
   xiRwIy9bfbXdhbxZw9N68+Xj/Zbs3MvSAgnPkhY24Bz1h1FhcF+1gonSA
   1KMV9xAAJzJhMaZJ6A9R49w1RfPF56a9bOAY/YqAMmUO1thTUm0RZw3Qo
   F2OG2c5qICrGZq3ghRCKurGtW8UG9noYYtdtmW2OhkBeWCD8M2s9eFF/f
   A==;
IronPort-SDR: yetGt6lfoPAV/3P9R0qhhBfvn8D444qdARsN0NSw/DCYCYnsjlfw79GXaKsasZODfTRNCRp7XS
 kXTof6W7LpJC+pt6PVQeohO6Xx2xzIdnR0E0LYJgr8wRo2qu0bf1ckLNe++qk574dS9KM9wtBM
 eitAvz/cByZomIpexS/VoG5ex6OvQ143EGA1fxwVOZJmcC/L7zBR1gvKUvvzMxkJHDne6vuz8I
 /PjD8d2ZlCMkj74646S2Obz6EuXfQLsGztmWagR8jo2xW9t8lFjAf3q2aq4G/Jv8Eks4OTxTtp
 e0M=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="112132377"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:28:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:28:52 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:28:24 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 01/30] media: atmel: atmel-isc: specialize gamma table into product specific
Date:   Thu, 1 Apr 2021 14:26:54 +0300
Message-ID: <20210401112723.189107-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separate the gamma table from the isc base file into the specific sama5d2
product file.
Add a pointer to the gamma table and entries count inside the platform
driver specific struct.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 47 ++-----------------
 drivers/media/platform/atmel/atmel-isc.h      | 11 +++--
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 45 ++++++++++++++++++
 3 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index fe3ec8d0eaee..8b6c5e339cb8 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -176,48 +176,6 @@ struct isc_format formats_list[] = {
 
 };
 
-/* Gamma table with gamma 1/2.2 */
-const u32 isc_gamma_table[GAMMA_MAX + 1][GAMMA_ENTRIES] = {
-	/* 0 --> gamma 1/1.8 */
-	{      0x65,  0x66002F,  0x950025,  0xBB0020,  0xDB001D,  0xF8001A,
-	  0x1130018, 0x12B0017, 0x1420016, 0x1580014, 0x16D0013, 0x1810012,
-	  0x1940012, 0x1A60012, 0x1B80011, 0x1C90010, 0x1DA0010, 0x1EA000F,
-	  0x1FA000F, 0x209000F, 0x218000F, 0x227000E, 0x235000E, 0x243000E,
-	  0x251000E, 0x25F000D, 0x26C000D, 0x279000D, 0x286000D, 0x293000C,
-	  0x2A0000C, 0x2AC000C, 0x2B8000C, 0x2C4000C, 0x2D0000B, 0x2DC000B,
-	  0x2E7000B, 0x2F3000B, 0x2FE000B, 0x309000B, 0x314000B, 0x31F000A,
-	  0x32A000A, 0x334000B, 0x33F000A, 0x349000A, 0x354000A, 0x35E000A,
-	  0x368000A, 0x372000A, 0x37C000A, 0x386000A, 0x3900009, 0x399000A,
-	  0x3A30009, 0x3AD0009, 0x3B60009, 0x3BF000A, 0x3C90009, 0x3D20009,
-	  0x3DB0009, 0x3E40009, 0x3ED0009, 0x3F60009 },
-
-	/* 1 --> gamma 1/2 */
-	{      0x7F,  0x800034,  0xB50028,  0xDE0021, 0x100001E, 0x11E001B,
-	  0x1390019, 0x1520017, 0x16A0015, 0x1800014, 0x1940014, 0x1A80013,
-	  0x1BB0012, 0x1CD0011, 0x1DF0010, 0x1EF0010, 0x200000F, 0x20F000F,
-	  0x21F000E, 0x22D000F, 0x23C000E, 0x24A000E, 0x258000D, 0x265000D,
-	  0x273000C, 0x27F000D, 0x28C000C, 0x299000C, 0x2A5000C, 0x2B1000B,
-	  0x2BC000C, 0x2C8000B, 0x2D3000C, 0x2DF000B, 0x2EA000A, 0x2F5000A,
-	  0x2FF000B, 0x30A000A, 0x314000B, 0x31F000A, 0x329000A, 0x333000A,
-	  0x33D0009, 0x3470009, 0x350000A, 0x35A0009, 0x363000A, 0x36D0009,
-	  0x3760009, 0x37F0009, 0x3880009, 0x3910009, 0x39A0009, 0x3A30009,
-	  0x3AC0008, 0x3B40009, 0x3BD0008, 0x3C60008, 0x3CE0008, 0x3D60009,
-	  0x3DF0008, 0x3E70008, 0x3EF0008, 0x3F70008 },
-
-	/* 2 --> gamma 1/2.2 */
-	{      0x99,  0x9B0038,  0xD4002A,  0xFF0023, 0x122001F, 0x141001B,
-	  0x15D0019, 0x1760017, 0x18E0015, 0x1A30015, 0x1B80013, 0x1CC0012,
-	  0x1DE0011, 0x1F00010, 0x2010010, 0x2110010, 0x221000F, 0x230000F,
-	  0x23F000E, 0x24D000E, 0x25B000D, 0x269000C, 0x276000C, 0x283000C,
-	  0x28F000C, 0x29B000C, 0x2A7000C, 0x2B3000B, 0x2BF000B, 0x2CA000B,
-	  0x2D5000B, 0x2E0000A, 0x2EB000A, 0x2F5000A, 0x2FF000A, 0x30A000A,
-	  0x3140009, 0x31E0009, 0x327000A, 0x3310009, 0x33A0009, 0x3440009,
-	  0x34D0009, 0x3560009, 0x35F0009, 0x3680008, 0x3710008, 0x3790009,
-	  0x3820008, 0x38A0008, 0x3930008, 0x39B0008, 0x3A30008, 0x3AB0008,
-	  0x3B30008, 0x3BB0008, 0x3C30008, 0x3CB0007, 0x3D20008, 0x3DA0007,
-	  0x3E20007, 0x3E90007, 0x3F00008, 0x3F80007 },
-};
-
 #define ISC_IS_FORMAT_RAW(mbus_code) \
 	(((mbus_code) & 0xf000) == 0x3000)
 
@@ -683,7 +641,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 
 	regmap_write(regmap, ISC_CFA_CFG, bay_cfg | ISC_CFA_CFG_EITPOL);
 
-	gamma = &isc_gamma_table[ctrls->gamma_index][0];
+	gamma = &isc->gamma_table[ctrls->gamma_index][0];
 	regmap_bulk_write(regmap, ISC_GAM_BENTRY, gamma, GAMMA_ENTRIES);
 	regmap_bulk_write(regmap, ISC_GAM_GENTRY, gamma, GAMMA_ENTRIES);
 	regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
@@ -2070,7 +2028,8 @@ static int isc_ctrl_init(struct isc_device *isc)
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 256);
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, GAMMA_MAX, 1, 2);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
+			  isc->gamma_max);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
 					  0, 1, 1, 1);
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index fab8eca58d93..f1df47a4655b 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -187,6 +187,10 @@ struct isc_ctrls {
  *
  * @current_subdev:	current subdevice: the sensor
  * @subdev_entities:	list of subdevice entitites
+ *
+ * @gamma_table:	pointer to the table with gamma values, has
+ *			gamma_max sets of GAMMA_ENTRIES entries each
+ * @gamma_max:		maximum number of sets of inside the gamma_table
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -245,16 +249,17 @@ struct isc_device {
 		struct v4l2_ctrl	*gr_off_ctrl;
 		struct v4l2_ctrl	*gb_off_ctrl;
 	};
-};
 
-#define GAMMA_MAX	2
 #define GAMMA_ENTRIES	64
+	/* pointer to the defined gamma table */
+	const u32	(*gamma_table)[GAMMA_ENTRIES];
+	u32		gamma_max;
+};
 
 #define ATMEL_ISC_NAME "atmel-isc"
 
 extern struct isc_format formats_list[];
 extern const struct isc_format controller_formats[];
-extern const u32 isc_gamma_table[GAMMA_MAX + 1][GAMMA_ENTRIES];
 extern const struct regmap_config isc_regmap_config;
 extern const struct v4l2_async_notifier_operations isc_async_ops;
 
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 0b78fecfd2a8..c74f36245bd5 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -54,6 +54,48 @@
 
 #define ISC_CLK_MAX_DIV		255
 
+/* Gamma table with gamma 1/2.2 */
+const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
+	/* 0 --> gamma 1/1.8 */
+	{      0x65,  0x66002F,  0x950025,  0xBB0020,  0xDB001D,  0xF8001A,
+	  0x1130018, 0x12B0017, 0x1420016, 0x1580014, 0x16D0013, 0x1810012,
+	  0x1940012, 0x1A60012, 0x1B80011, 0x1C90010, 0x1DA0010, 0x1EA000F,
+	  0x1FA000F, 0x209000F, 0x218000F, 0x227000E, 0x235000E, 0x243000E,
+	  0x251000E, 0x25F000D, 0x26C000D, 0x279000D, 0x286000D, 0x293000C,
+	  0x2A0000C, 0x2AC000C, 0x2B8000C, 0x2C4000C, 0x2D0000B, 0x2DC000B,
+	  0x2E7000B, 0x2F3000B, 0x2FE000B, 0x309000B, 0x314000B, 0x31F000A,
+	  0x32A000A, 0x334000B, 0x33F000A, 0x349000A, 0x354000A, 0x35E000A,
+	  0x368000A, 0x372000A, 0x37C000A, 0x386000A, 0x3900009, 0x399000A,
+	  0x3A30009, 0x3AD0009, 0x3B60009, 0x3BF000A, 0x3C90009, 0x3D20009,
+	  0x3DB0009, 0x3E40009, 0x3ED0009, 0x3F60009 },
+
+	/* 1 --> gamma 1/2 */
+	{      0x7F,  0x800034,  0xB50028,  0xDE0021, 0x100001E, 0x11E001B,
+	  0x1390019, 0x1520017, 0x16A0015, 0x1800014, 0x1940014, 0x1A80013,
+	  0x1BB0012, 0x1CD0011, 0x1DF0010, 0x1EF0010, 0x200000F, 0x20F000F,
+	  0x21F000E, 0x22D000F, 0x23C000E, 0x24A000E, 0x258000D, 0x265000D,
+	  0x273000C, 0x27F000D, 0x28C000C, 0x299000C, 0x2A5000C, 0x2B1000B,
+	  0x2BC000C, 0x2C8000B, 0x2D3000C, 0x2DF000B, 0x2EA000A, 0x2F5000A,
+	  0x2FF000B, 0x30A000A, 0x314000B, 0x31F000A, 0x329000A, 0x333000A,
+	  0x33D0009, 0x3470009, 0x350000A, 0x35A0009, 0x363000A, 0x36D0009,
+	  0x3760009, 0x37F0009, 0x3880009, 0x3910009, 0x39A0009, 0x3A30009,
+	  0x3AC0008, 0x3B40009, 0x3BD0008, 0x3C60008, 0x3CE0008, 0x3D60009,
+	  0x3DF0008, 0x3E70008, 0x3EF0008, 0x3F70008 },
+
+	/* 2 --> gamma 1/2.2 */
+	{      0x99,  0x9B0038,  0xD4002A,  0xFF0023, 0x122001F, 0x141001B,
+	  0x15D0019, 0x1760017, 0x18E0015, 0x1A30015, 0x1B80013, 0x1CC0012,
+	  0x1DE0011, 0x1F00010, 0x2010010, 0x2110010, 0x221000F, 0x230000F,
+	  0x23F000E, 0x24D000E, 0x25B000D, 0x269000C, 0x276000C, 0x283000C,
+	  0x28F000C, 0x29B000C, 0x2A7000C, 0x2B3000B, 0x2BF000B, 0x2CA000B,
+	  0x2D5000B, 0x2E0000A, 0x2EB000A, 0x2F5000A, 0x2FF000A, 0x30A000A,
+	  0x3140009, 0x31E0009, 0x327000A, 0x3310009, 0x33A0009, 0x3440009,
+	  0x34D0009, 0x3560009, 0x35F0009, 0x3680008, 0x3710008, 0x3790009,
+	  0x3820008, 0x38A0008, 0x3930008, 0x39B0008, 0x3A30008, 0x3AB0008,
+	  0x3B30008, 0x3BB0008, 0x3C30008, 0x3CB0007, 0x3D20008, 0x3DA0007,
+	  0x3E20007, 0x3E90007, 0x3F00008, 0x3F80007 },
+};
+
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
@@ -150,6 +192,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	isc->gamma_table = isc_sama5d2_gamma_table;
+	isc->gamma_max = 2;
+
 	ret = isc_pipeline_init(isc);
 	if (ret)
 		return ret;
-- 
2.25.1

