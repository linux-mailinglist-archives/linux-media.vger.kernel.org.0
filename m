Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2731E2483AC
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 13:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgHRLNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 07:13:20 -0400
Received: from mx1.emlix.com ([188.40.240.192]:48084 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgHRLNU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 07:13:20 -0400
X-Greylist: delayed 328 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Aug 2020 07:13:19 EDT
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 08E315F857
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 13:07:50 +0200 (CEST)
To:     linux-media@vger.kernel.org
From:   Sebastian Gross <sebastian.gross@emlix.com>
Subject: [PATCH 1/1] media: i2c: ov5640: Add strobe
Organization: emlix
Message-ID: <b932a85a-4c6e-8ab7-1029-027f0567a278@emlix.com>
Date:   Tue, 18 Aug 2020 13:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the data sheet the ov5640 has means to trigger an external
flash controller. This would be the preferred way to synchronize camera
exposure with the flash led.

Enable rolling strobe when starting the stream given the device has a
registered flash sub device. Leave the rest, ie. timeout, trigger mode to
flash controller.

Signed-off-by: Sebastian Gross <sebastian.gross@emlix.com>
---
  drivers/media/i2c/ov5640.c | 42 ++++++++++++++++++++++++++++++++++++++
  1 file changed, 42 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 18dd2d717088..205c98ec2267 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -36,6 +36,7 @@
  #define OV5640_REG_SYS_CTRL0		0x3008
  #define OV5640_REG_CHIP_ID		0x300a
  #define OV5640_REG_IO_MIPI_CTRL00	0x300e
+#define OV5640_REG_PAD_OUTPUT_ENABLE00	0x3016
  #define OV5640_REG_PAD_OUTPUT_ENABLE01	0x3017
  #define OV5640_REG_PAD_OUTPUT_ENABLE02	0x3018
  #define OV5640_REG_PAD_OUTPUT00		0x3019
@@ -74,6 +75,8 @@
  #define OV5640_REG_AEC_CTRL1B		0x3a1b
  #define OV5640_REG_AEC_CTRL1E		0x3a1e
  #define OV5640_REG_AEC_CTRL1F		0x3a1f
+#define OV5640_REG_STROBE_CTRL		0x3b00
+#define OV5640_REG_FREX_MODE		0x3b07
  #define OV5640_REG_HZ5060_CTRL00	0x3c00
  #define OV5640_REG_HZ5060_CTRL01	0x3c01
  #define OV5640_REG_SIGMADELTA_CTRL0C	0x3c0c
@@ -2840,6 +2843,41 @@ static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
  	return 0;
  }

+static bool ov5640_has_flash_subdev(struct v4l2_subdev *sd)
+{
+	struct v4l2_subdev *flash;
+
+	list_for_each_entry(flash, &sd->subdev_notifier->done, async_list)
+		if (flash->entity.function == MEDIA_ENT_F_FLASH)
+			return true;
+
+	return false;
+}
+
+static int ov5640_setup_strobe(struct ov5640_dev *sensor, bool enable)
+{
+	int ret;
+
+	if (!ov5640_has_flash_subdev(&sensor->sd))
+		return 0;
+
+	ret = ov5640_mod_reg(sensor, OV5640_REG_FREX_MODE, BIT(1), BIT(1));
+	if (ret)
+		return ret;
+
+	ret = ov5640_mod_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE00, BIT(1),
+			     (enable) ? BIT(1) : 0);
+	if (ret)
+		return ret;
+
+	ret = ov5640_mod_reg(sensor, OV5640_REG_STROBE_CTRL, BIT(0) | BIT(1) | BIT(7),
+			     (enable) ? 0xff : 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
  static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
  {
  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2861,6 +2899,10 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
  			sensor->pending_fmt_change = false;
  		}

+		ret = ov5640_setup_strobe(sensor, enable);
+		if (ret)
+			goto out;
+
  		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
  			ret = ov5640_set_stream_mipi(sensor, enable);
  		else
-- 
2.25.1

