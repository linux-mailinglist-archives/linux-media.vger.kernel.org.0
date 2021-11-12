Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CC744E8C1
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhKLObL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:11 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:64856 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbhKLObG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727296; x=1668263296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QFcZqhwV54wl82Sk8IHg25ljnl0Hvg//Cvz5aknbgrg=;
  b=flj6QCya8AGH8qUQjU6RUHuMB8OQGBlysjsYwJG6HK0pxXGy3wrbr9YM
   pjm7YNr1sRUWhgeQ+JIp7w/7cgA2atQ8DRdyWRb15Q/oX9rp70ryTW+qZ
   nsn9qIQ45gi/59uuZGDdv9v+NXvpJl8QhTohR44T+mJ79nmrJqQ83LiSz
   A7OG5hz1LV8R/7myns/1HVJyIzoy6nSL5diM2lGSGrW7KgVUpzX8ZxsDt
   ydONgIcsEPJI3JVCTvnLPcBt49N2J3NhM5Ph22utxwe9BQuw8wto204Uh
   Kr64dBYx6PDeMRRTSaHhBuu9LgzPhHt2pS0BRfkKcxDwdICQWh520QCg8
   Q==;
IronPort-SDR: SbLC9AkFtt5nbB5N7OjdUtJexotXivMFCklhBOeZQGd0PuNqv83Z53tEdBQvTO72LOzSmLtpt9
 8+yQYcsy9+EmNXe3/T3RbWdNhEwlozLGac0XMBgajL0SA80hooUSQNs3grroEn63N21kYzauwd
 AOegV8h3zIwClHdBFQKM4fxqPVF1p8iRD8DaShtHaCxM+bw7yTNk+xkc3uOVRoJpJqKO+evoaV
 TJYd/YWzzdneygPBDut6rQmDoH14GuEPWFOc1ezJOILn9yBLULbXO3J4j1ZQumn7hd2daPgO3q
 Equ5KjGiakGbhYFZLRneyGAp
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="143154062"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:28:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:28:15 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:28:10 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 10/25] media: atmel: atmel-isc-base: report frame sizes as full supported range
Date:   Fri, 12 Nov 2021 16:24:54 +0200
Message-ID: <20211112142509.2230884-11-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ISC supports a full broad range of frame sizes.
Until now, the subdevice was queried for possible frame sizes and these
were reported to the user space.
However, the ISC should not care about which frame sizes the subdev supports,
as long as this frame size is supported.
Thus, report a continuous range from smallest frame size up to the max
resolution.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 3389671fbfb9..bf638d201b29 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1076,14 +1076,12 @@ static int isc_enum_framesizes(struct file *file, void *fh,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct isc_device *isc = video_drvdata(file);
-	struct v4l2_subdev_frame_size_enum fse = {
-		.code = isc->config.sd_format->mbus_code,
-		.index = fsize->index,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
 	int ret = -EINVAL;
 	int i;
 
+	if (fsize->index)
+		return -EINVAL;
+
 	for (i = 0; i < isc->num_user_formats; i++)
 		if (isc->user_formats[i]->fourcc == fsize->pixel_format)
 			ret = 0;
@@ -1095,14 +1093,14 @@ static int isc_enum_framesizes(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
-			       NULL, &fse);
-	if (ret)
-		return ret;
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
 
-	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width;
-	fsize->discrete.height = fse.max_height;
+	fsize->stepwise.min_width = 16;
+	fsize->stepwise.max_width = isc->max_width;
+	fsize->stepwise.min_height = 16;
+	fsize->stepwise.max_height = isc->max_height;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
 
 	return 0;
 }
-- 
2.25.1

