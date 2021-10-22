Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F007F437332
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhJVH4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:38 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55701 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbhJVH4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889257; x=1666425257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DbOQBIZ8qsZGKgcWsohY/wLUvD2T4nyMI7qgesmvHIQ=;
  b=eq8Z9gmeAwK+zP0Vs33xVAVfsHGcxZzKQw879r9vDQdqrm6flQGj23O9
   yadkh4/+2m6I/rhRRPAIF8mayjLf5ada8oFOQRWEUQN8aPCuTuentS6jp
   xklqSBmSBUF51fYn6ReL4Oz7zQryR1E5gNE7M5mNQGn5D1IGRtowqc/T5
   rRhiuh588oHkMXpAiqpe8StRmbvBV5ls25g+SaxFOt0QH2T2qTMdmxf5m
   yuKS/nnlJtJw2BwwiYM0lOZZH+4mHZ3TC9AlOg+rDNQSb5WRBQDgN44HM
   6DRExB0lfO8HZ3i3Ggo+ISwX4xYLQ31BlOUIjV7QyGzs7HBP6sCOdu3j8
   A==;
IronPort-SDR: o7hltVifFjqISO99iUYKb5mEi5BOqiirlMBNhcr15YZhId2kUAOIA03nbPwuxvA3HME4eE29vA
 82/yV3nXi6K626/ecxGfNauKXWptkaQ5FsxwVjZAtg9wsrp1TCwuDyn4s85cJWFuVRpuyx3rbY
 SGTWZL9Euk/++aH/laJDmgJLKd4JVvCU6e4GKDo+M35cdNatcTQQePXfDoOZaqphDrV7ZhTE7/
 6i1BfDa1NZRm7+4fgds0Dl3w+/eJ0mocweLC3Z2oM0LFc7GvdzTFsxa0bP9O1TV98UhkaAVDb/
 8QqCjFgqHFnn896+5eu1ZjSi
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="149141228"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:16 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:13 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 09/21] media: atmel: atmel-isc-base: remove frameintervals VIDIOC
Date:   Fri, 22 Oct 2021 10:52:35 +0300
Message-ID: <20211022075247.518880-10-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
---
 drivers/media/platform/atmel/atmel-isc-base.c | 37 -------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 6f14cc549543..8537ad73d160 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1108,42 +1108,6 @@ static int isc_enum_framesizes(struct file *file, void *fh,
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
@@ -1168,7 +1132,6 @@ static const struct v4l2_ioctl_ops isc_ioctl_ops = {
 	.vidioc_g_parm			= isc_g_parm,
 	.vidioc_s_parm			= isc_s_parm,
 	.vidioc_enum_framesizes		= isc_enum_framesizes,
-	.vidioc_enum_frameintervals	= isc_enum_frameintervals,
 
 	.vidioc_log_status		= v4l2_ctrl_log_status,
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
-- 
2.25.1

