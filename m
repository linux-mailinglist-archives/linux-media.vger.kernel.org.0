Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA4135439C
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbhDEPw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:52:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36224 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbhDEPwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617637969; x=1649173969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9RTc4XTqmuga+DzPKp51siwwTSJHh6dtg9LlNk0M14=;
  b=gCpE7MTBzZBjzJlePCpiqRdP1NZq8ZBxbGb+6N8KYj1/a+uScoQTQfvd
   mX+wB7mcfHEGGKVJPPglQ+pPhn8qxErylb+E/XfkyaTHzQcEsccU/lSoK
   6k3qP89ArNa7KzePMbJjTEfPYHTAHE8zEV4rVxxBtg3IhndxfIutw0OJf
   TJ4tMZySYV1P7y2zQezzEvIVCeJ8WlPU1qqejFInOiL+P939GaGGIZTTQ
   QnFDfmIrwxOoZtwiOZ3+5OCkA1K4kL7ivJ9Vy3O3QMFEv0KImFrT57i2B
   ll3uk+U+A3EsCBVKENbs96mTyGPvOfXyM4a/ssfzMHaM2fW037eEPBj3Q
   Q==;
IronPort-SDR: US6DGm0iWxEyeoAwyPGNZAmbVvGtLhLaF8tBGQdxb51J65oG7yjBU/W0R+kP0HI43xoqOnVTbj
 Hck3klKSv5UqIXu0UW6YLMKpLWHWgZaHnxEg/uXLPbgw9Azde1b2eohuEwu8Hp47CVeZnf1/6E
 7r751EgMZkQUn+RTs67ceUE0tYc5mjD5JdWQaf+5IafUw1MOG3INHu0z85W0A2k4q8ZrLITeqZ
 4nvy3jUERHrNqlddH7b6TPi8GnrB8xUeDUczcjUjFLwfK0wM3YVWSMnDvV9aLw0q1LQLI8Q7R7
 Jh4=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112481602"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:52:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:52:49 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:52:23 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 03/30] media: atmel: atmel-isc: add checks for limiting frame sizes
Date:   Mon, 5 Apr 2021 18:50:38 +0300
Message-ID: <20210405155105.162529-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

