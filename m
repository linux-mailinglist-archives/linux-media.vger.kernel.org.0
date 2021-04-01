Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C710351A7F
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbhDASBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:01:44 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64963 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236125AbhDAR6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299890; x=1648835890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9RTc4XTqmuga+DzPKp51siwwTSJHh6dtg9LlNk0M14=;
  b=JdISQQV71oRTMSbVyiDce3mAtp+DbF2qLFN+8Tx7iwjUeEMb4OfDAE76
   44Y1WxYlLPl3lEOkFonxqoE5XJxFglqHSkXpzIZKxdFU7ljKDUmIvsdkN
   FTB8KLAnUeG4QG4ATb0QZ9qLZ3PmAuWswcO/n8OwWQv9ZBXcJklKjZBFk
   vTd1GkmnLHw6FsbvFtYxUSuJFWbILDFXNnlDhOnK4m+3rts8DglWhUa1i
   EfdIRyRAJqCbACizzXffyBJ1ZXgLaWVyTziYJm2oKGH56x7LCoxWQSZ4W
   HYWYz9qL7Ai9fjd2rjUTx46Yfcmy7tywFHzY33a1LQUet2YFwY6X+mf9v
   g==;
IronPort-SDR: K+0CHeN8sXO2Clckg6iw7tDsPSThzOwwt247IYudrwp2ws8cRp42hOdW7SP6Q6MpJ/+4cANq0p
 92VHzAhq0XZ2yCzUJD8z+D4g86MQQRseco5iUctWGUcfXml7tCvqwzDffzMfAgvC/tHw8BPV5v
 Cy+mdavvgdXvkn1Ojk5j3PdZhXHF03dWRLu1SVjtyVtf0ExBzypqZrodhdOF9D9Xy4kq+gTZDH
 E++Ezx5fAaHP0C0hL9ba+Yv87H4XY8Fyjg7UfWzHeESJSPBqC6FCglMSTlAs5Dto5NRn6abbfe
 JQg=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49670689"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:29:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:29:04 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:29:02 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 03/30] media: atmel: atmel-isc: add checks for limiting frame sizes
Date:   Thu, 1 Apr 2021 14:26:56 +0300
Message-ID: <20210401112723.189107-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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

