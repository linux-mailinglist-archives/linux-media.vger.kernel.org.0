Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0316D31B9
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjDAPAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjDAPAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582BC1CB8E
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6ylEeyfC08i2/PJAiEisT3yiVpoB6N1xOgUl3mSfYH0=;
        b=Sg8uCvFCIQCFzO1ca2Pys6mcDfUuBhfQ60myHlqczsN/sQEvQevGQoqHl4KfXv79b1n1CT
        6p5o1nbKbP8AoaD0YkhACsBdDXD60oGaDiOvAZNBvQhkQlysztfMRnD/WkDhbTBxlygwWD
        jGy4UYOeNVusjr/ROUkNkK4ARe7mZYE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-DImI9LH9MtiCzRP14KW1Bw-1; Sat, 01 Apr 2023 10:59:51 -0400
X-MC-Unique: DImI9LH9MtiCzRP14KW1Bw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A31EC1C04181;
        Sat,  1 Apr 2023 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 22843483EC1;
        Sat,  1 Apr 2023 14:59:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 08/28] media: atomisp: gc0310: Replace custom reg access functions with smbus helpers
Date:   Sat,  1 Apr 2023 16:59:06 +0200
Message-Id: <20230401145926.596216-9-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The gc0310 uses 8 bit register addresses which makes it compatible
with the standard smbus access functions.

Drop the custom reg access helpers, replacing them with the smbus
access functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 145 ++++--------------
 drivers/staging/media/atomisp/i2c/gc0310.h    |   4 -
 2 files changed, 26 insertions(+), 123 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 4e92268da32a..8f7eea39858b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -34,83 +34,6 @@
 
 #include "gc0310.h"
 
-/* i2c read/write stuff */
-static int gc0310_read_reg(struct i2c_client *client, u8 reg, u8 *val)
-{
-	int err;
-	struct i2c_msg msg[2];
-	unsigned char data[1];
-
-	if (!client->adapter) {
-		dev_err(&client->dev, "%s error, no client->adapter\n",
-			__func__);
-		return -ENODEV;
-	}
-
-	memset(msg, 0, sizeof(msg));
-
-	msg[0].addr = client->addr;
-	msg[0].flags = 0;
-	msg[0].len = I2C_MSG_LENGTH;
-	msg[0].buf = data;
-
-	/* high byte goes out first */
-	data[0] = (u8)(reg & 0xff);
-
-	msg[1].addr = client->addr;
-	msg[1].len = 1;
-	msg[1].flags = I2C_M_RD;
-	msg[1].buf = data;
-
-	err = i2c_transfer(client->adapter, msg, 2);
-	if (err != 2) {
-		if (err >= 0)
-			err = -EIO;
-		dev_err(&client->dev,
-			"read from offset 0x%x error %d", reg, err);
-		return err;
-	}
-
-	*val = (u8)data[0];
-	return 0;
-}
-
-static int gc0310_i2c_write(struct i2c_client *client, u16 len, u8 *data)
-{
-	struct i2c_msg msg;
-	const int num_msg = 1;
-	int ret;
-
-	msg.addr = client->addr;
-	msg.flags = 0;
-	msg.len = len;
-	msg.buf = data;
-	ret = i2c_transfer(client->adapter, &msg, 1);
-
-	return ret == num_msg ? 0 : -EIO;
-}
-
-static int gc0310_write_reg(struct i2c_client *client, u8 reg, u8 val)
-{
-	int ret;
-	unsigned char data[2] = {0};
-	u8 *wreg = (u8 *)data;
-	const u16 len = 1 + sizeof(u8); /* 8-bit address + data */
-
-	/* high byte goes out first */
-	*wreg = (u8)(reg & 0xff);
-
-	data[1] = (u8)(val);
-
-	ret = gc0310_i2c_write(client, len, data);
-	if (ret)
-		dev_err(&client->dev,
-			"write error: wrote 0x%x to offset 0x%x error %d",
-			val, reg, ret);
-
-	return ret;
-}
-
 /*
  * gc0310_write_reg_array - Initializes a list of GC0310 registers
  * @client: i2c driver client structure
@@ -123,9 +46,12 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	int i, err;
 
 	for (i = 0; i < count; i++) {
-		err = gc0310_write_reg(client, reglist[i].reg, reglist[i].val);
-		if (err)
+		err = i2c_smbus_write_byte_data(client, reglist[i].reg, reglist[i].val);
+		if (err) {
+			dev_err(&client->dev, "write error: wrote 0x%x to offset 0x%x error %d",
+				reglist[i].val, reglist[i].reg, err);
 			return err;
+		}
 	}
 
 	return 0;
@@ -154,12 +80,12 @@ static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
 	dev_dbg(&client->dev, "gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
 
 	/* set analog gain */
-	ret = gc0310_write_reg(client, GC0310_AGC_ADJ, again);
+	ret = i2c_smbus_write_byte_data(client, GC0310_AGC_ADJ, again);
 	if (ret)
 		return ret;
 
 	/* set digital gain */
-	ret = gc0310_write_reg(client, GC0310_DGC_ADJ, dgain);
+	ret = i2c_smbus_write_byte_data(client, GC0310_DGC_ADJ, dgain);
 	if (ret)
 		return ret;
 
@@ -176,11 +102,7 @@ static int __gc0310_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	dev_dbg(&client->dev, "coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
 
 	/* set exposure */
-	ret = gc0310_write_reg(client, GC0310_AEC_PK_EXPO_L, coarse_itg & 0xff);
-	if (ret)
-		return ret;
-
-	ret = gc0310_write_reg(client, GC0310_AEC_PK_EXPO_H, (coarse_itg >> 8) & 0x0f);
+	ret = i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H, coarse_itg);
 	if (ret)
 		return ret;
 
@@ -251,22 +173,15 @@ static long gc0310_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 static int gc0310_q_exposure(struct v4l2_subdev *sd, s32 *value)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 reg_v;
 	int ret;
 
 	/* get exposure */
-	ret = gc0310_read_reg(client, GC0310_AEC_PK_EXPO_L, &reg_v);
-	if (ret)
-		goto err;
-
-	*value = reg_v;
-	ret = gc0310_read_reg(client, GC0310_AEC_PK_EXPO_H, &reg_v);
-	if (ret)
-		goto err;
+	ret = i2c_smbus_read_word_swapped(client, GC0310_AEC_PK_EXPO_H);
+	if (ret < 0)
+		return ret;
 
-	*value = *value + (reg_v << 8);
-err:
-	return ret;
+	*value = ret;
+	return 0;
 }
 
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -618,29 +533,22 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
 static int gc0310_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u8 high, low;
 	int ret;
-	u16 id;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = gc0310_read_reg(client, GC0310_SC_CMMN_CHIP_ID_H, &high);
-	if (ret) {
-		dev_err(&client->dev, "read sensor_id_high failed\n");
-		return -ENODEV;
-	}
-	ret = gc0310_read_reg(client, GC0310_SC_CMMN_CHIP_ID_L, &low);
-	if (ret) {
-		dev_err(&client->dev, "read sensor_id_low failed\n");
+	ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
+	if (ret < 0) {
+		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
 		return -ENODEV;
 	}
-	id = ((((u16)high) << 8) | (u16)low);
-	dev_dbg(&client->dev, "sensor ID = 0x%x\n", id);
 
-	if (id != GC0310_ID) {
-		dev_err(&client->dev, "sensor ID error, read id = 0x%x, target id = 0x%x\n", id,
-			GC0310_ID);
+	dev_dbg(&client->dev, "sensor ID = 0x%x\n", ret);
+
+	if (ret != GC0310_ID) {
+		dev_err(&client->dev, "sensor ID error, read id = 0x%x, target id = 0x%x\n",
+			ret, GC0310_ID);
 		return -ENODEV;
 	}
 
@@ -660,28 +568,27 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (enable) {
 		/* enable per frame MIPI and sensor ctrl reset  */
-		ret = gc0310_write_reg(client, 0xFE, 0x30);
+		ret = i2c_smbus_write_byte_data(client, 0xFE, 0x30);
 		if (ret) {
 			mutex_unlock(&dev->input_lock);
 			return ret;
 		}
 	}
 
-	ret = gc0310_write_reg(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_3);
+	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_3);
 	if (ret) {
 		mutex_unlock(&dev->input_lock);
 		return ret;
 	}
 
-	ret = gc0310_write_reg(client, GC0310_SW_STREAM,
-			       enable ? GC0310_START_STREAMING :
-			       GC0310_STOP_STREAMING);
+	ret = i2c_smbus_write_byte_data(client, GC0310_SW_STREAM,
+					enable ? GC0310_START_STREAMING : GC0310_STOP_STREAMING);
 	if (ret) {
 		mutex_unlock(&dev->input_lock);
 		return ret;
 	}
 
-	ret = gc0310_write_reg(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_0);
+	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_0);
 	if (ret) {
 		mutex_unlock(&dev->input_lock);
 		return ret;
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 0ff2d93cbcbf..540334bc7b0e 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -33,10 +33,6 @@
 
 #include "../include/linux/atomisp_platform.h"
 
-/* Defines for register writes and register array processing */
-#define I2C_MSG_LENGTH		1
-#define I2C_RETRY_COUNT		5
-
 #define GC0310_FOCAL_LENGTH_NUM	278	/*2.78mm*/
 
 #define MAX_FMTS		1
-- 
2.39.1

