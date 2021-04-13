Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA1135DCFD
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344731AbhDMK7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:59:41 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:8220 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344702AbhDMK7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311557; x=1649847557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9RTc4XTqmuga+DzPKp51siwwTSJHh6dtg9LlNk0M14=;
  b=ROD1UY4CbO7Yghp4MfdDoGxoXPg4h3A3CGWjz3K/NS8Y/e4z5jHXTzO7
   rUDxwmVa+6m/X/RBXJbfOvzOVqh9scxke5/lpqDrhXamkZrsNTfCCaYTL
   RctHR4QxzvSJxB5G6z7p7Vvbx2QbxlBTEwufQYIBvBIFqRFp9DxAKHflB
   VKQGvcAC5unLolZCJjMb2YDSgIKd+eue3e/i/YKk2flg14+ctVAEqbOrb
   TFpZd1x31/gCADQ0JtJJYVl1hR9RvnVHUP11wzqmpIBXbWv1BPnLEZD0K
   UFqODl2qcOxiOMKyaLjhGVpRfUio9XxvEmvtiItyp1brMV1qQMAGwwkL0
   A==;
IronPort-SDR: ms86BeAsj5FYlLUxZxx8OPmHcOsTy/M4PUSAdNxytlgr3slxtn1n449DKYwWl2L7bZ8AMWEZtW
 IUUS0/JiYfw0eLaFJ+iEBxOBOtktw5D0N0sWuXb3VOGj5qA4Upmcw//KiEewfHzJfXWedObR4d
 JLiBdlNm1ze4wIdNUNlu7ncZ4G/udbVr4jEbL9sS1XIpPjmHWwpLV7qA78cnvUpU3Qyk4dd8c9
 b8r1pXs01ti1WHzPvBfsYkoEBi2Is3bGLBWAYi1/UK22Rc+2iiC80nBlV2aCbTcyrv/ymRep3G
 j8U=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110611688"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 03:59:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 03:59:17 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 03:59:04 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 03/33] media: atmel: atmel-isc: add checks for limiting frame sizes
Date:   Tue, 13 Apr 2021 13:57:01 +0300
Message-ID: <20210413105731.610028-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling the subdev, certain subdev drivers will overwrite the
frame size and adding sizes which are beyond the ISC's capabilities.
Thus we need to ensure the frame size is cropped to the maximum caps.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 277a8fd8b83d..45fc8dbb7943 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1326,6 +1326,12 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 
 	v4l2_fill_pix_format(pixfmt, &format.format);
 
+	/* Limit to Atmel ISC hardware capabilities */
+	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
+		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
+	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
+		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
+
 	pixfmt->field = V4L2_FIELD_NONE;
 	pixfmt->bytesperline = (pixfmt->width * isc->try_config.bpp) >> 3;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
@@ -1361,6 +1367,12 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 	if (ret < 0)
 		return ret;
 
+	/* Limit to Atmel ISC hardware capabilities */
+	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
+		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
+	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
+		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
+
 	isc->fmt = *f;
 
 	if (isc->try_config.sd_format && isc->config.sd_format &&
-- 
2.25.1

