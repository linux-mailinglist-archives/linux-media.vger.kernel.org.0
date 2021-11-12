Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ED944E8C4
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbhKLObS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:18 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:42697 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbhKLObP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727304; x=1668263304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wAej8zbZ2Z8QMflPY6dkTpKKqPVWmjJ48/bava7RNWY=;
  b=gKnQeV9aRFywHeWzsB81h54V8Ye0ogGMbWVb3VHTy9i3Yd+DlkXdN33J
   gebeAUFEMhtCyumkLpXb2OvMYyAQseR2fazH1d4gRYexlZ4qbFf9EEBFh
   cyLTDqjcPStHREmybJPqSuSEHKttalOg36IdFLAN6wxZV1UXaWtzk85sW
   PQL9v1QEkvE/PWdaoMj+TuNEdawTpQZFmtl+GQVFN+L3/xy93v3MjJ8IN
   kOwHlpTkTu22BtubboPANtNEwI9PzVq+lMokg/B8QYqxA4b4g7iKp1AmA
   wkiZX1VQUyfCL3jk6FE6GYFkUD6hUcYEMGhWBDxtpAuh+aVPKcEWNjtko
   g==;
IronPort-SDR: kKR1jIkMUswy5LjR428C11vw/budr0yksTSgvPdBPk4NQ/P3ZGKzeSVMhEcPhOsu7zu2qEF/XL
 9uDLFxyE+g7zm+Pig2QWyR98GS10m7W3QtvuTu5Hi+N1XcqufjnpCnRTaEtfJaTpk4N9IdGZHJ
 LfehFGgnBgruRy5fBMOvH7owTXOh7Uq2LHdN2jmU5T+Qomasrys2oTJUoA3xhEN6wCsgh0HB9U
 BMUHJ3+nriyqnueJ6dti7nZM2LwGP/P2iRV8res0ie8Rg7D95IFDPtzVcyXU4ZWcMUn4MKvSkR
 UBZrk3sKlSFoMHw62I4AEUc6
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="138947645"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:28:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:28:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:28:17 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 11/25] media: atmel: atmel-isc-base: implement mbus_code support in enumfmt
Date:   Fri, 12 Nov 2021 16:24:55 +0200
Message-ID: <20211112142509.2230884-12-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If enumfmt is called with an mbus_code, the enumfmt handler should only
return the formats that are supported for this mbus_code.
To make it more easy to understand the formats, changed the report order
to report first the native formats, and after that the formats that the ISC
can convert to.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 51 ++++++++++++++++---
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index bf638d201b29..2cb8446ff90c 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -498,21 +498,56 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
 	u32 index = f->index;
 	u32 i, supported_index;
 
-	if (index < isc->controller_formats_size) {
-		f->pixelformat = isc->controller_formats[index].fourcc;
-		return 0;
+	supported_index = 0;
+
+	for (i = 0; i < isc->formats_list_size; i++) {
+		if (!isc->formats_list[i].sd_support)
+			continue;
+		/*
+		 * If specific mbus_code is requested, provide only
+		 * supported formats with this mbus code
+		 */
+		if (f->mbus_code && f->mbus_code !=
+		    isc->formats_list[i].mbus_code)
+			continue;
+		if (supported_index == index) {
+			f->pixelformat = isc->formats_list[i].fourcc;
+			return 0;
+		}
+		supported_index++;
 	}
 
-	index -= isc->controller_formats_size;
+	/*
+	 * If the sensor does not support this mbus_code whatsoever,
+	 * there is no reason to advertise any of our output formats
+	 */
+	if (supported_index == 0)
+		return -EINVAL;
+
+	/*
+	 * If the sensor uses a format that is not raw, then we cannot
+	 * convert it to any of the formats that we usually can with a
+	 * RAW sensor. Thus, do not advertise them.
+	 */
+	if (!isc->config.sd_format ||
+	    !ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
+		return -EINVAL;
 
+	/*
+	 * Iterate again through the formats that we can convert to.
+	 * However, to avoid duplicates, skip the formats that
+	 * the sensor already supports directly
+	 */
+	index -= supported_index;
 	supported_index = 0;
 
-	for (i = 0; i < isc->formats_list_size; i++) {
-		if (!ISC_IS_FORMAT_RAW(isc->formats_list[i].mbus_code) ||
-		    !isc->formats_list[i].sd_support)
+	for (i = 0; i < isc->controller_formats_size; i++) {
+		/* if this format is already supported by sensor, skip it */
+		if (find_format_by_fourcc(isc, isc->controller_formats[i].fourcc))
 			continue;
 		if (supported_index == index) {
-			f->pixelformat = isc->formats_list[i].fourcc;
+			f->pixelformat =
+				isc->controller_formats[i].fourcc;
 			return 0;
 		}
 		supported_index++;
-- 
2.25.1

