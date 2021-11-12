Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0604444E8B4
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbhKLObC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:02 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:54759 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbhKLObC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727291; x=1668263291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5pCcil2Lhx+bCuXSs5PAUAjwV2486l6SIQeWMh7Zqkw=;
  b=rNQZyyaiQoask/EUYuSQ9eP06XvZkO54EMY/amd6G6fy72qOOuIUKgOC
   0pTHEjLuM5P/bnvQtDuqIFcJJGj8adDiQEGGU/mP8FupSl8QjgWHUGtGC
   pm65KfVujpNyPnJg+u+S1m+/QMBQ1Z6ZddLoJQZt+GjLb/corNaI9JvMR
   AF38uXMMLLTY+a851iLRw6iCxy3vM7jvK5svoAApRpu6p92nRM4gRgIBK
   pcE/2HykY1L0ilJ9I5TNmCROWDv9NAEXtn1WrCXfJhuEpDWST23o0Ym/S
   TIChMTIgc7zdfpUxoOzrXddv9JzvkjDGN8wq97RatNa6zle5Ph/t1n5vD
   A==;
IronPort-SDR: 1Ihb4RgIq7BeQ/BQAdRmrFne7+82eBq9lnG3L5a3xqsIeOOU7vPwL74tTHgR5j196cA7ifM7tq
 jwPUM2jr2PnZUGSyvE9UrqIPUv6KND3cTOz6O8cTD0gvOAo2wETCFFXeSKTho/25BE9KMBVZAc
 LVjY6/SIiTuxMUDnzZxoVxzyXfnapqyg+A4zKQnnMUopv7grIXz5xdCY+SAZoPLSfothXNz4AK
 teR+v9VMF9oCwnHAtlE22RoNENuFovHWnkwuD3FZzoEs0pzbKMQtMvd50qVPEjCj+y8ccYZKsx
 oWT8nZN/0ZfLZjeq9kdPNVgy
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="138947620"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:28:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:28:09 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:27:59 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 09/25] media: atmel: atmel-isc-base: remove frameintervals VIDIOC
Date:   Fri, 12 Nov 2021 16:24:53 +0200
Message-ID: <20211112142509.2230884-10-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VIDIOC_ENUM_FRAMEINTERVALS is not recommended for a top video driver.
The frame rate is defined by the sensor subdevice, thus it can be queried
directly by anyone interested in the frame intervals.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 37 -------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index e6c9071c04f0..3389671fbfb9 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1107,42 +1107,6 @@ static int isc_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int isc_enum_frameintervals(struct file *file, void *fh,
-				    struct v4l2_frmivalenum *fival)
-{
-	struct isc_device *isc = video_drvdata(file);
-	struct v4l2_subdev_frame_interval_enum fie = {
-		.code = isc->config.sd_format->mbus_code,
-		.index = fival->index,
-		.width = fival->width,
-		.height = fival->height,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	int ret = -EINVAL;
-	unsigned int i;
-
-	for (i = 0; i < isc->num_user_formats; i++)
-		if (isc->user_formats[i]->fourcc == fival->pixel_format)
-			ret = 0;
-
-	for (i = 0; i < isc->controller_formats_size; i++)
-		if (isc->controller_formats[i].fourcc == fival->pixel_format)
-			ret = 0;
-
-	if (ret)
-		return ret;
-
-	ret = v4l2_subdev_call(isc->current_subdev->sd, pad,
-			       enum_frame_interval, NULL, &fie);
-	if (ret)
-		return ret;
-
-	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
-	fival->discrete = fie.interval;
-
-	return 0;
-}
-
 static const struct v4l2_ioctl_ops isc_ioctl_ops = {
 	.vidioc_querycap		= isc_querycap,
 	.vidioc_enum_fmt_vid_cap	= isc_enum_fmt_vid_cap,
@@ -1167,7 +1131,6 @@ static const struct v4l2_ioctl_ops isc_ioctl_ops = {
 	.vidioc_g_parm			= isc_g_parm,
 	.vidioc_s_parm			= isc_s_parm,
 	.vidioc_enum_framesizes		= isc_enum_framesizes,
-	.vidioc_enum_frameintervals	= isc_enum_frameintervals,
 
 	.vidioc_log_status		= v4l2_ctrl_log_status,
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
-- 
2.25.1

