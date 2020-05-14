Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49811D2C0B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 12:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENKBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 06:01:17 -0400
Received: from ni.piap.pl ([195.187.100.5]:41300 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbgENKBQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 06:01:16 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id E4ECB443363;
        Thu, 14 May 2020 11:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl E4ECB443363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1589450092; bh=TIuQoRV5xgwuHAUQNe1ARevGG+rdM/qCmY8+UGIEiKY=;
        h=From:To:Cc:Subject:Date:From;
        b=LHghvVuCb/os1uikEqoTFb6JMTIj69Xx/QqWpTAL/DWmMhC4VSaaWCBHmbIGyqnRb
         er6EKX1/0F0psoLIC4BPaecaQ67M8AENn4ycVEMk9QP/0SNhTBrsrZ6HJdYVNu8g9S
         reZEDn43wIA+hCysLViuuXVgT4ztib6VB1KzSIj0=
From:   khalasa@piap.pl (Krzysztof =?utf-8?Q?Ha=C5=82asa?=)
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Subject: MEDIA: Add support for RAW14 and RAW16 to IPUv3 CSI
Date:   Thu, 14 May 2020 11:54:50 +0200
Message-ID: <m35zcyx2mt.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security 8.0 for Linux Mail Server, version 8.0.1.721, not scanned, whitelist
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It appears the i.MX camera interface is missing support for 14- and 16-bit
Bayer and B&W-only formats. Add it.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
index 8ae301eef643..658c173bebdf 100644
--- a/drivers/gpu/ipu-v3/ipu-csi.c
+++ b/drivers/gpu/ipu-v3/ipu-csi.c
@@ -128,6 +128,7 @@ struct ipu_csi {
 #define MIPI_DT_RAW10		0x2b
 #define MIPI_DT_RAW12		0x2c
 #define MIPI_DT_RAW14		0x2d
+#define MIPI_DT_RAW16		0x2e
=20
 /*
  * Bitfield of CSI bus signal polarities and modes.
@@ -157,6 +158,7 @@ enum ipu_csi_data_width {
 	IPU_CSI_DATA_WIDTH_8   =3D 1,
 	IPU_CSI_DATA_WIDTH_10  =3D 3,
 	IPU_CSI_DATA_WIDTH_12  =3D 5,
+	IPU_CSI_DATA_WIDTH_14  =3D 7,
 	IPU_CSI_DATA_WIDTH_16  =3D 9,
 };
=20
@@ -303,6 +305,24 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_con=
fig *cfg, u32 mbus_code,
 		cfg->mipi_dt =3D MIPI_DT_RAW12;
 		cfg->data_width =3D IPU_CSI_DATA_WIDTH_12;
 		break;
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+	case MEDIA_BUS_FMT_Y14_1X14:
+		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_BAYER;
+		cfg->mipi_dt =3D MIPI_DT_RAW14;
+		cfg->data_width =3D IPU_CSI_DATA_WIDTH_14;
+		break;
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+	case MEDIA_BUS_FMT_Y16_1X16:
+		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_BAYER;
+		cfg->mipi_dt =3D MIPI_DT_RAW16;
+		cfg->data_width =3D IPU_CSI_DATA_WIDTH_16;
+		break;
 	case MEDIA_BUS_FMT_JPEG_1X8:
 		/* TODO */
 		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_JPEG;
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/med=
ia-bus-format.h
index 84fa53ffb13f..60a374374d16 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -64,7 +64,7 @@
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
=20
-/* YUV (including grey) - next is	0x202e */
+/* YUV (including grey) - next is	0x202f */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
 #define MEDIA_BUS_FMT_UV8_1X8			0x2015
 #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@ -87,6 +87,7 @@
 #define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
 #define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
 #define MEDIA_BUS_FMT_Y14_1X14			0x202d
+#define MEDIA_BUS_FMT_Y16_1X16			0x202e
 #define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
 #define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
 #define MEDIA_BUS_FMT_YUYV8_1X16		0x2011

--=20
Krzysztof Halasa

=C5=81UKASIEWICZ Research Network
Industrial Research Institute for Automation and Measurements PIAP
Al. Jerozolimskie 202, 02-486 Warsaw, Poland
