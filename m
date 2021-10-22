Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028DD43733B
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhJVH4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbhJVH4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889265; x=1666425265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7uj+t4rQfdpIRquvDPiGpVBIISkD5ZZAW2R+pnACNe8=;
  b=x3Kpx3GdN7ZnyaE+cH6jj5x+B0tjoOJCtD1IRw+qZzlpWwdiHa6diX8l
   k2A1uHmRxw/XyMwADc6X6kjxv0W49wLhmWvB+YNz4W3UykfIkl/8U4iKi
   td345p7xteVciRFJ7vM+fNo+tYY+4pxn7HEaZ8koHLTBebMd07J6dIOZg
   p8PrhwAU6UKz/7VLb1Zw4gKfKOO3i6I2mTudcks1stbxPL6pY9fJLPsCp
   mAHeUx0O+N7XWSl0po5eEGGlD6gGJWIzCfIzvH5SNGVYdX4iPpfE9sMbL
   VJ/8tXkv4ZdLe6KRA3s6rnA2e2oHfTdkBYIwGTcLlwjZHRH3/Ke+A0PSg
   w==;
IronPort-SDR: CETVNPj6N1MOxLiGeHvXinNHvxsJWWfqZEjFkysTBKXDN3szl3JHaLZkM/tbtEepa0mDWVjAsc
 SdoBUDtpPKRomly2WyKL7+PMjV+HRFRihfpTqonzO8UGW7CqgBTQckMDzPaVyMXK0nhAV2Rx5Z
 tmS5r/A7K4NQfq0iwCwiSpkFGKuxbGabyt2yiGjBKG6c0UFc5twbXF7HoGEpGi0xDQVCKKOFNX
 0TnpHHI1UeWQ/boMgCJloqyG1iENjQ7a33kUCP4lgqWD5itCbKJMSJJgV8eITXsz7jZy7NDrAX
 e4DQ86/7OgfayC0LkUTUp0Fz
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141246"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:24 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:21 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code support in enumfmt
Date:   Fri, 22 Oct 2021 10:52:37 +0300
Message-ID: <20211022075247.518880-12-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
index 2dd2511c7be1..1f7fbe5e4d79 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -499,21 +499,56 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
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

