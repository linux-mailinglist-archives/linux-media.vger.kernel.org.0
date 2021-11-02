Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446F54431B9
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 16:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhKBPcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 11:32:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:21552 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbhKBPcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 11:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635867017; x=1667403017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eat5Jq07Y0nWc7VV8wA3WgcyeTmNDzho3szmjBms1JM=;
  b=ILDV6n4FooURePZFm6DG5Bq/H9iTv9m+xWSKXneJr9Md2mdt631+JGqw
   RwMUH/h7EUNBe+vWKapT/+YIYxUzJBH+fcl4scdHRFPSHg0pkbzauQV44
   iTS0T7wWWMEXG9X47vtVCwEBaAJBpw67YIlY1Q3GR3xyvfvcVqF8pytHu
   o+bvFi5odFlS+mre8Gb+iyG3V3BcdTbZPVqZA3rZeUA+YprplhuQSxxj9
   nPPPau0EmiFUW/QkiCSDkYwRZbxJGsvPmASWC6bnX0JLOnp1EujLk9ae2
   mkLDjqmABJN66A/ed377e8/PC1crt9EHgBl2rzZnqC2F6hvVVbmZZv3vI
   A==;
IronPort-SDR: VX6gYTm0qf3yNyJvGihvIMIvercp6Hi+KUcac0pq3avQ81JenBCDQlHiBIo3ZhjtSOBjKH2Xzm
 DXR8khJcmA3IFJUP0z/gxUFkA25oKPIhwo0tU+uh3vfY7zyQrJRG8Al3qFkq/lkYx1cufstH26
 JNzHi9jFIyByxJbXvxf5QthX7JLsf2jPf02sIL9Y+7xDHDC42l0nOAMZixdEhkgHcdH5341dYA
 4XqeTiA2aAeUR3Dm2bUDxxveqnYi1zoo6KkONEsQgSCDYDT0/FCR2ozp9kGE3ww3+kkWoT2FhP
 USZPTxhgEFKGHnl0QXXucuKA
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="142533695"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Nov 2021 08:30:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 2 Nov 2021 08:30:16 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 2 Nov 2021 08:30:12 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <akinobu.mita@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <sakari.ailus@linux.intel.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: i2c: ov7740: implement get_mbus_config
Date:   Tue, 2 Nov 2021 17:30:08 +0200
Message-ID: <20211102153008.1349895-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_mbus_config callback.
ov7740 is a parallel sensor, and according to datasheet, the register
REG12 controls the CCIR656 mode. This register is written to 0 in yuyv mode.
According to REG12[5] , CCIR656 mode, the behavior is:
CCIR656: disabled
REG28 controls the polarity of the signals. This register is unused.
The default behavior is then:
HSYNC polarity : positive
VSYNC polarity : positive
HREF polarity: positive

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/ov7740.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 2539cfee85c8..f8a717aecb6f 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -873,12 +873,26 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov7740_get_mbus_config(struct v4l2_subdev *sd,
+				  unsigned int pad,
+				  struct v4l2_mbus_config *cfg)
+{
+	cfg->type = V4L2_MBUS_PARALLEL;
+	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_HSYNC_ACTIVE_HIGH |
+		     V4L2_MBUS_VSYNC_ACTIVE_HIGH |
+		     V4L2_MBUS_PCLK_SAMPLE_RISING |
+		     V4L2_MBUS_FIELD_EVEN_LOW | V4L2_MBUS_DATA_ACTIVE_HIGH;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops ov7740_subdev_pad_ops = {
 	.enum_frame_interval = ov7740_enum_frame_interval,
 	.enum_frame_size = ov7740_enum_frame_size,
 	.enum_mbus_code = ov7740_enum_mbus_code,
 	.get_fmt = ov7740_get_fmt,
 	.set_fmt = ov7740_set_fmt,
+	.get_mbus_config = ov7740_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops ov7740_subdev_ops = {
-- 
2.25.1

