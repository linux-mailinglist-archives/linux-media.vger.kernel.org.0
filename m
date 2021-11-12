Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E08744E8F0
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhKLOd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:33:57 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:32116 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbhKLOd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727467; x=1668263467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BVsnVhKos+4un4tF8gl8LYrlTAZbplMjYM+lMJCJPa8=;
  b=aRB6TdT5hFwit6RNjrWpE64Pm5A04pVQPQ+rEDMbwJcszng6tGrbv4YK
   R5UDFVIL2CR8LM/M5gH6QfmTPH1D4kt1pzGt8spb/782bSYkwdMjdCjjq
   mfqqMCcTR3MWt5PvFyilYwu1JraDD1meZUGV6Fc6uDDyJi4FtpIbSTZJ0
   OdHH21ObC4LvuQwyf5OIWKMe3XmaqenYnHcMuMYbS7fRDLyukZI2earvE
   up4J1G6pBLXSbMNE3h+m/18iuy5R/yKN+j21N7xfrWdaf4RRDg48NLLQs
   J9AtnSzqkzossQsYk4KBQ6J+l3cw/e6kcgGMilLxJb1kDdAligC/ia5et
   w==;
IronPort-SDR: 1Q06NVrf4n0kaOzOvckOtkCbtYAvf+aAR921cE3c9WWsJLJM7bGRlW0vCcH/Vl7O3fWCZnvsEq
 SSpoA5WDsMoiKDTZe2PJq0YKFTLFsGQoBNxGyrchLhU+SdEIv1gXL5xTdtwWNz0v4VbTjn92Gy
 oaNYbPkgAPiFMiOIVye2Knw3q9JFmv19/rzGmw1EcaOyCuNGxEnPAp9jETUsg+v4pnaECQZgtC
 h6rvX0QI0suye7i3usHhmJvdIvCfuV++EL/LC8WLaY9cMS1nasa0fUvmK7ep1fGqxY8EoNk8g+
 eCbZTIkPnun4ue1E+6HYY5SI
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="143154332"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:31:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:31:04 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:30:40 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 23/25] media: atmel: atmel-isc: add raw Bayer 8bit 10bit output formats
Date:   Fri, 12 Nov 2021 16:25:07 +0200
Message-ID: <20211112142509.2230884-24-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ISC can dump the 8 bit and 10 bit raw bayer formats directly to
the memory.
Thus, add them to the supported output format list.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 24 +++++++++++++++++++
 .../media/platform/atmel/atmel-sama7g5-isc.c  | 24 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index a8d4ba60d3ac..025c3e8a7e95 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -88,6 +88,30 @@ static const struct isc_format sama5d2_controller_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_Y10,
 	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR10,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG10,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG10,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB10,
+	},
 };
 
 /* This is a list of formats that the ISC can receive as *input* */
diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index 38721bd902e2..9dc75eed0098 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -100,6 +100,30 @@ static const struct isc_format sama7g5_controller_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_Y16,
 	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR10,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG10,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG10,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB10,
+	},
 };
 
 /* This is a list of formats that the ISC can receive as *input* */
-- 
2.25.1

