Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4FE455FB4
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 16:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhKRPnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 10:43:24 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:50580 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhKRPnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 10:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637250024; x=1668786024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dwd5YESAleZyXmLDqMWJAf0dEVjLMfvumua/5MKSLjQ=;
  b=QDjLjcGkDudm43DHaETL1mj5cs1jGl3qK1f+msLT0EsmSfPFCdi+Insm
   ke5kI6d0073nn+Q0U9wSz6pzKdqxE2dBTVk6TJCYLKh+fOQLWan+iTa4E
   4klKLCePkvkg8m6wKnlOge4mA9/YuObGlT7+tRdacPuoBwHnO+PonIPfx
   2KdoO0YfOYNAfWsNqxmdRi5xxi19vYTe8dvjCF3QegKyFFkP4wxT+Qo3/
   RM0BqZu3r//wMOMm1sMsMue+7POmIJNkY9SvPUBWFXKuFt+iaMNXym0Yu
   YowvFq/Zvmd7YrdMXILtxSG0AIYd3LH7AxWXpsULj+/V6l5BzFJ/evHQ/
   Q==;
IronPort-SDR: sab5iU5rA+79z375dyOnMrIWePS5ag7YpHiaBPF3ECtjuvFWIdwd4TEZ4PSKeZayKcoJ8uCt/4
 7dt79bI/ANr9T+qtmyAR/p2SWJhw5oC5MpHZv1Xe3MlTUFFxzaiv3hTSovFUjV+hZwPhnj5AqI
 vhoPUhPdJBCOEPJMxs8pphny85Yl9VZ52o/vEgqzmG1vlLXG7u4NTYvsPGdT91+WDjxkpgTzht
 EuHBC1CDKyWYQofcucZWRBnWSnfqxWBF5qw9hK65Cwl9y9F9QIhxC1uZhi2MYPlGcj1qv9zXfT
 dapULgUdHR50n18xmYbjqdou
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="144394485"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 08:40:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 08:40:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 08:40:15 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <luca@lucaceresoli.net>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: i2c: imx274: implement enum_mbus_code
Date:   Thu, 18 Nov 2021 17:40:09 +0200
Message-ID: <20211118154009.307430-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current driver supports only SRGGB 10 bit RAW bayer format.
Add the enum_mbus_code implementation to report this format supported.

 # v4l2-ctl -d /dev/v4l-subdev3 --list-subdev-mbus-codes
ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
        0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
 #

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/imx274.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 2e804e3b70c4..25a4ef8f6187 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1909,7 +1909,21 @@ static int imx274_set_frame_interval(struct stimx274 *priv,
 	return err;
 }
 
+static int imx274_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	/* only supported format in the driver is Raw 10 bits SRGGB */
+	code->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops imx274_pad_ops = {
+	.enum_mbus_code = imx274_enum_mbus_code,
 	.get_fmt = imx274_get_fmt,
 	.set_fmt = imx274_set_fmt,
 	.get_selection = imx274_get_selection,
-- 
2.25.1

