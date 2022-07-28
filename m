Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF32583F82
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbiG1NCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238857AbiG1NCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6CE120AD;
        Thu, 28 Jul 2022 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013372; x=1690549372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NHRBrcQiwCmbc51NNix9lvaPQkQhf1coVWgrxlz9mFg=;
  b=d46QorvCaDjixQw1SpQ9gKVU+OtcKQkwW5byG87EwmcJLPIrlJtEgMCp
   9KJFbQMtMWqgKytKX+VYsSLIz3QvHAQMzN7kbFMdD6mUm2i27C2KWYZyT
   gBpniuWKG5VgoCvnRSKyAYYlvR90g8I3vJgIml2RNCdo8rHemto2TvkCK
   AmOQoWNuPqdW9WQC6PEIW/PRM30hzNa49/ttT+RCFB3u9yYThlCAtTm9C
   GsuVNiY6TBONxBA2X1m4j9K/UtUMThdjeGpHAF2qitnAcdQBsAKP9poPC
   u3X72jOjOWa4FkV9y5qwuA9SF1hObPgFPIx8cILCgStqQbOZ9tD6CvJSw
   A==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321377"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013364; x=1690549364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NHRBrcQiwCmbc51NNix9lvaPQkQhf1coVWgrxlz9mFg=;
  b=IDko2Xa5etYpWovoMgHydnHY77roCRTfJiG+mKo+p6cFadFDF0McFCz9
   aiOsLwbRPAcTIzEAzWQLRob8Q3hbWBelx30vqH3VO9XfgHQgCY7BuFqCf
   CS8KDVPMoaXP9hfMkd9pR8oAQe8YSaUg7S9O7yQl8HMbOiFAV+YXTvBjs
   ZHSxNWGsFilrF8VgH6BAbCs+UvlgPVu1MmlOn2jSBKZ1uQIl8bALxdOWC
   WSGJIwSpCKfOf6zrOrCyWWdd8g+D1XViwNGDTBK4ZizJWmoJfg2sx2eJ0
   gkmm4dBWNlmcegwOkgUUyGLV0AXYhi6twayRXcZMUg2rNwDK7O5bqjQl4
   g==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321376"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 63F9E280056;
        Thu, 28 Jul 2022 15:02:44 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 7/7] media: i2c: ov9282: Add regmap support
Date:   Thu, 28 Jul 2022 15:02:37 +0200
Message-Id: <20220728130237.3396663-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register values apparently are stored in MSB format, hence the manual
swap when reading/writing.
regmap's endianness swapping is not applied when reading with val_bits = 8.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* Removed superfluous line break
* Shortened variable initialization

 drivers/media/i2c/ov9282.c | 57 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f79bdfa821e8..e9e595df187b 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -113,6 +114,7 @@ struct ov9282_mode {
 /**
  * struct ov9282 - ov9282 sensor device structure
  * @dev: Pointer to generic device
+ * @regmap: sensor's regmap
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
@@ -131,6 +133,7 @@ struct ov9282_mode {
  */
 struct ov9282 {
 	struct device *dev;
+	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
@@ -151,6 +154,11 @@ struct ov9282 {
 	bool streaming;
 };
 
+static const struct regmap_config ov9282_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+};
+
 static const s64 link_freq[] = {
 	OV9282_LINK_FREQ,
 };
@@ -297,35 +305,20 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
  */
 static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
+	u8 data[4] = {0};
 	int ret;
 
 	if (WARN_ON(len > 4))
 		return -EINVAL;
 
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
+	ret = regmap_raw_read(ov9282->regmap, reg, &data[4 - len], len);
+	if (ret < 0) {
+		dev_err(ov9282->dev, "read from 0x%04x failed: %d\n",
+			reg, ret);
+		return ret;
+	}
 
+	*val = get_unaligned_be32(data);
 	return 0;
 }
 
@@ -340,16 +333,17 @@ static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
  */
 static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	u8 buf[6] = {0};
+	u8 data[4] = {0};
+	int ret;
 
 	if (WARN_ON(len > 4))
 		return -EINVAL;
 
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
+	put_unaligned_be32(val << (8 * (4 - len)), data);
+
+	ret = regmap_raw_write(ov9282->regmap, reg, data, len);
+	if (ret < 0)
+		dev_err(ov9282->dev, "write to 0x%04x failed: %d\n", reg, ret);
 
 	return 0;
 }
@@ -1045,6 +1039,11 @@ static int ov9282_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ov9282->dev = &client->dev;
+	ov9282->regmap = devm_regmap_init_i2c(client, &ov9282_regmap_config);
+	if (IS_ERR(ov9282->regmap)) {
+		dev_err(ov9282->dev, "Unable to initialize I2C\n");
+		return -ENODEV;
+	}
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
-- 
2.25.1

