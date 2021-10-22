Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CEB437338
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhJVH4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:43 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhJVH4i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889261; x=1666425261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=REZFzzAUOglb7K1RDabqAKzlGAFNSmzLTlTDD6DNu20=;
  b=GASC9XHlsZALlmo2eq4DitIfiiuBBG0KMnc75tTcELmJNVC+6ZOguZuD
   X0kq91/jf2CnXjV4LEDcqDms9OkxZZLFzgOS0Vr4UeX22nnmSLEgf6snV
   7acpISCzLbQ/tG9V+/XRYKLJ5wpy+Pk6A3VJJa3myxo1uioFw3rrDwsde
   46XY5iwItbjUzMfR6N7nYkhXlUKYoaHf+EgE9IwANkOYhCM3YBF8EK0Cp
   Zz+uxEDsp0c7zgWb6ZMs0up5pK4GUmW/6qJsIEUt75u+/ixONlDuLlvnq
   df/e/zQvN2FwN7jfHw7kxBFEL09WnOmlb2Pc1OZmjZO138TSRXAD2gpSM
   w==;
IronPort-SDR: AjDl8UDo1XWgESJKb05p6S4cISZnEXYMUMtDLVbDmrgHAhSxatZEJ/AAUqCdRoxUnK4LRBDyaA
 eoMdA4RN09/5vCcaiS500z7NNdifSAGKq6CxLfJgmUiJg9L6SO1Yuw7w/NUMR1qS0WzO8T8D6r
 xmvaaT1DzhtxQMx7V8hee7qyy34jxaBJ2FCt4x1qdTFplJv8p0ekGuRkth6egKBgR9GfjYEms5
 hMeOQTQvd0DgpMWGhDTOLOMLiDuR0A8MyMCtLwtZ3F7AOVa7dwUmSfRrG+ZvnFjSV6cG0xqgY7
 v4h/tw+ZbjxjIJcPEljdtbVl
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141234"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:17 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 10/21] media: atmel: atmel-isc-base: report frame sizes as full supported range
Date:   Fri, 22 Oct 2021 10:52:36 +0300
Message-ID: <20211022075247.518880-11-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
---
 drivers/media/platform/atmel/atmel-isc-base.c | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 8537ad73d160..2dd2511c7be1 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1077,14 +1077,12 @@ static int isc_enum_framesizes(struct file *file, void *fh,
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
@@ -1096,14 +1094,14 @@ static int isc_enum_framesizes(struct file *file, void *fh,
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

