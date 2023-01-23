Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94275677BD8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjAWMyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjAWMyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05CE12050
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jQGUSRc1TGI/z45uJFQGi4RPaEtOjO/rF6Lql3jYyhs=;
        b=Ao6rnRcHERTBidvyLSbM/QAXLtn8uTTNg6A1Mr7SzEir2Hz2D79J95KTkPQM5O+/XtQfhx
        Ztv1J29otNqP9/tuv0vwGX7gbpw/Er/mYkNSRB5QHak0OjPM6YH+zA0tngSatsBP0erWw0
        MiIDhXj6RXA4YVnGUQTE0SfgS+EI9zQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-Wm6gSNiPPOazvUHGzpKe7g-1; Mon, 23 Jan 2023 07:53:38 -0500
X-MC-Unique: Wm6gSNiPPOazvUHGzpKe7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0084518E0045;
        Mon, 23 Jan 2023 12:53:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7926C15BA0;
        Mon, 23 Jan 2023 12:53:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 29/57] media: atomisp: ov2680: Use the new ovxxxx_16bit_addr_reg_helpers.h
Date:   Mon, 23 Jan 2023 13:51:37 +0100
Message-Id: <20230123125205.622152-30-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new ovxxxx_16bit_addr_reg_helpers.h instead of duplicating
the ovxxxx sensor I2C register access helpers found in many different
sensor drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 122 ++++--------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |   4 -
 2 files changed, 25 insertions(+), 101 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 88fdeb828c6c..85b9410f655e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/moduleparam.h>
+#include <media/ovxxxx_16bit_addr_reg_helpers.h>
 #include <media/v4l2-device.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
@@ -46,64 +47,6 @@ static enum atomisp_bayer_order ov2680_bayer_order_mapping[] = {
 	atomisp_bayer_order_rggb,
 };
 
-/* i2c read/write stuff */
-static int ov2680_read_reg(struct i2c_client *client,
-			   int len, u16 reg, u32 *val)
-{
-	struct i2c_msg msgs[2];
-	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
-	u8 data_buf[4] = { 0, };
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs)) {
-		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
-		return -EIO;
-	}
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-static int ov2680_write_reg(struct i2c_client *client, unsigned int len,
-			    u16 reg, u16 val)
-{
-	u8 buf[6];
-	int ret;
-
-	if (len == 2)
-		put_unaligned_be16(val, buf + 2);
-	else if (len == 1)
-		buf[2] = val;
-	else
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-
-	ret = i2c_master_send(client, buf, len + 2);
-	if (ret != len + 2) {
-		dev_err(&client->dev, "write error %d reg 0x%04x, val 0x%02x: buf sent: %*ph\n",
-			ret, reg, val, len + 2, &buf);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int ov2680_write_reg_array(struct i2c_client *client,
 				  const struct ov2680_reg *reglist)
 {
@@ -111,7 +54,7 @@ static int ov2680_write_reg_array(struct i2c_client *client,
 	int ret;
 
 	for (; next->reg != 0; next++) {
-		ret = ov2680_write_reg(client, 1, next->reg, next->val);
+		ret = ovxxxx_write_reg8(client, next->reg, next->val);
 		if (ret)
 			return ret;
 	}
@@ -135,8 +78,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	vts = dev->res->lines_per_frame;
 
 	/* group hold */
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_GROUP_ACCESS, 0x00);
+	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x00);
 	if (ret) {
 		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
 			__func__, OV2680_GROUP_ACCESS);
@@ -147,7 +89,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	if (coarse_itg > vts - OV2680_INTEGRATION_TIME_MARGIN)
 		vts = (u16)coarse_itg + OV2680_INTEGRATION_TIME_MARGIN;
 
-	ret = ov2680_write_reg(client, 2, OV2680_TIMING_VTS_H, vts);
+	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, vts);
 	if (ret) {
 		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
 			__func__, OV2680_TIMING_VTS_H);
@@ -158,24 +100,21 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 
 	/* Lower four bit should be 0*/
 	exp_val = coarse_itg << 4;
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_EXPOSURE_L, exp_val & 0xFF);
+	ret = ovxxxx_write_reg8(client, OV2680_EXPOSURE_L, exp_val & 0xFF);
 	if (ret) {
 		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
 			__func__, OV2680_EXPOSURE_L);
 		return ret;
 	}
 
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_EXPOSURE_M, (exp_val >> 8) & 0xFF);
+	ret = ovxxxx_write_reg8(client, OV2680_EXPOSURE_M, (exp_val >> 8) & 0xFF);
 	if (ret) {
 		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
 			__func__, OV2680_EXPOSURE_M);
 		return ret;
 	}
 
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_EXPOSURE_H, (exp_val >> 16) & 0x0F);
+	ret = ovxxxx_write_reg8(client, OV2680_EXPOSURE_H, (exp_val >> 16) & 0x0F);
 	if (ret) {
 		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
 			__func__, OV2680_EXPOSURE_H);
@@ -183,7 +122,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	}
 
 	/* Analog gain */
-	ret = ov2680_write_reg(client, 2, OV2680_AGC_H, gain);
+	ret = ovxxxx_write_reg16(client, OV2680_AGC_H, gain);
 	if (ret) {
 		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
 			__func__, OV2680_AGC_H);
@@ -191,8 +130,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	}
 	/* Digital gain */
 	if (digitgain) {
-		ret = ov2680_write_reg(client, 2,
-				       OV2680_MWB_RED_GAIN_H, digitgain);
+		ret = ovxxxx_write_reg16(client, OV2680_MWB_RED_GAIN_H, digitgain);
 		if (ret) {
 			dev_err(&client->dev,
 				"%s: write 0x%02x: error, aborted\n",
@@ -200,8 +138,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 			return ret;
 		}
 
-		ret = ov2680_write_reg(client, 2,
-				       OV2680_MWB_GREEN_GAIN_H, digitgain);
+		ret = ovxxxx_write_reg16(client, OV2680_MWB_GREEN_GAIN_H, digitgain);
 		if (ret) {
 			dev_err(&client->dev,
 				"%s: write 0x%02x: error, aborted\n",
@@ -209,8 +146,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 			return ret;
 		}
 
-		ret = ov2680_write_reg(client, 2,
-				       OV2680_MWB_BLUE_GAIN_H, digitgain);
+		ret = ovxxxx_write_reg16(client, OV2680_MWB_BLUE_GAIN_H, digitgain);
 		if (ret) {
 			dev_err(&client->dev,
 				"%s: write 0x%02x: error, aborted\n",
@@ -220,14 +156,12 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	}
 
 	/* End group */
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_GROUP_ACCESS, 0x10);
+	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x10);
 	if (ret)
 		return ret;
 
 	/* Delay launch group */
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_GROUP_ACCESS, 0xa0);
+	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0xa0);
 	if (ret)
 		return ret;
 	return ret;
@@ -294,7 +228,7 @@ static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
 	int ret;
 
 	/* get exposure */
-	ret = ov2680_read_reg(client, 3, OV2680_EXPOSURE_H, &reg_val);
+	ret = ovxxxx_read_reg24(client, OV2680_EXPOSURE_H, &reg_val);
 	if (ret)
 		return ret;
 
@@ -312,7 +246,7 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	u8 index;
 
 	dev_dbg(&client->dev, "@%s: value:%d\n", __func__, value);
-	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
+	ret = ovxxxx_read_reg8(client, OV2680_FLIP_REG, &val);
 	if (ret)
 		return ret;
 	if (value)
@@ -320,8 +254,7 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	else
 		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
 
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_FLIP_REG, val);
+	ret = ovxxxx_write_reg8(client, OV2680_FLIP_REG, val);
 	if (ret)
 		return ret;
 	index = (v_flag > 0 ? OV2680_FLIP_BIT : 0) | (h_flag > 0 ? OV2680_MIRROR_BIT :
@@ -343,7 +276,7 @@ static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
 
 	dev_dbg(&client->dev, "@%s: value:%d\n", __func__, value);
 
-	ret = ov2680_read_reg(client, 1, OV2680_MIRROR_REG, &val);
+	ret = ovxxxx_read_reg8(client, OV2680_MIRROR_REG, &val);
 	if (ret)
 		return ret;
 	if (value)
@@ -351,8 +284,7 @@ static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
 	else
 		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
 
-	ret = ov2680_write_reg(client, 1,
-			       OV2680_MIRROR_REG, val);
+	ret = ovxxxx_write_reg8(client, OV2680_MIRROR_REG, val);
 	if (ret)
 		return ret;
 	index = (v_flag > 0 ? OV2680_FLIP_BIT : 0) | (h_flag > 0 ? OV2680_MIRROR_BIT :
@@ -449,7 +381,7 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	ret = ov2680_write_reg(client, 1, OV2680_SW_RESET, 0x01);
+	ret = ovxxxx_write_reg8(client, OV2680_SW_RESET, 0x01);
 	ret |= ov2680_write_reg_array(client, ov2680_global_setting);
 
 	return ret;
@@ -687,7 +619,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	if (dev->exposure > vts - OV2680_INTEGRATION_TIME_MARGIN)
 		vts = dev->exposure + OV2680_INTEGRATION_TIME_MARGIN;
 
-	ret = ov2680_write_reg(client, 2, OV2680_TIMING_VTS_H, vts);
+	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, vts);
 	if (ret) {
 		dev_err(&client->dev, "ov2680 write vts err: %d\n", ret);
 		goto err;
@@ -739,14 +671,12 @@ static int ov2680_detect(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = ov2680_read_reg(client, 1,
-			      OV2680_SC_CMMN_CHIP_ID_H, &high);
+	ret = ovxxxx_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_H, &high);
 	if (ret) {
 		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
 		return -ENODEV;
 	}
-	ret = ov2680_read_reg(client, 1,
-			      OV2680_SC_CMMN_CHIP_ID_L, &low);
+	ret = ovxxxx_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_L, &low);
 	id = ((((u16)high) << 8) | (u16)low);
 
 	if (id != OV2680_ID) {
@@ -754,8 +684,7 @@ static int ov2680_detect(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = ov2680_read_reg(client, 1,
-			      OV2680_SC_CMMN_SUB_ID, &high);
+	ret = ovxxxx_read_reg8(client, OV2680_SC_CMMN_SUB_ID, &high);
 	revision = (u8)high & 0x0f;
 
 	dev_info(&client->dev, "sensor_revision id = 0x%x, rev= %d\n",
@@ -776,9 +705,8 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	else
 		dev_dbg(&client->dev, "ov2680_s_stream off\n");
 
-	ret = ov2680_write_reg(client, 1, OV2680_SW_STREAM,
-			       enable ? OV2680_START_STREAMING :
-			       OV2680_STOP_STREAMING);
+	ret = ovxxxx_write_reg8(client, OV2680_SW_STREAM,
+				enable ? OV2680_START_STREAMING : OV2680_STOP_STREAMING);
 
 	//otp valid at stream on state
 	//if(!dev->otp_data)
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 596e14453fb3..f4760a70055d 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -32,10 +32,6 @@
 
 #include "../include/linux/atomisp_platform.h"
 
-/* Defines for register writes and register array processing */
-#define I2C_MSG_LENGTH		0x2
-#define I2C_RETRY_COUNT		5
-
 #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
 
 #define OV2680_BIN_FACTOR_MAX 4
-- 
2.39.0

