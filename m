Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F40677BDC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjAWMzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjAWMyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D31E7EE8
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=thyWYI6CV1uxLzrviZaxN1saksmEmiUnR22G1vLJ+Xo=;
        b=RD22CBK8AXtX+h0AqDiLB3vGNxsOpPA1a4oM+HDBMnHqHNHBHRcnJbT5d3GeuXsU2OJN0F
        JxSvTl1cdpGgbNT611wQ6LeS/n9I23QfkHtIwbAMtvm9JGj54mv2AEwr+wr2x3Q97QH6wo
        qZRvVBGujxugVwsIZ/afjYkpmGWur+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-0zdCZwNtMVq4tMJJpmlW2g-1; Mon, 23 Jan 2023 07:53:56 -0500
X-MC-Unique: 0zdCZwNtMVq4tMJJpmlW2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35BF4101AA63;
        Mon, 23 Jan 2023 12:53:56 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A4D4CC15BAD;
        Mon, 23 Jan 2023 12:53:53 +0000 (UTC)
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
Subject: [PATCH 35/57] media: atomisp: ov2680: Make setting the modes algorithm based
Date:   Mon, 23 Jan 2023 13:51:43 +0100
Message-Id: <20230123125205.622152-36-hdegoede@redhat.com>
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

Instead of using a long fixed register settings list for each resolution,
calculate the register settings based on the requested width + height.

This will allow future enhancements like adding hblank and vblank controls
and adding selection support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 137 ++++++++++++++++--
 drivers/staging/media/atomisp/i2c/ov2680.h    |  41 +++++-
 2 files changed, 164 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 6ca2a5bb0700..6693f042f4f2 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -380,6 +380,131 @@ static void ov2680_fill_format(struct ov2680_device *sensor,
 	ov2680_set_bayer_order(sensor, fmt);
 }
 
+static void ov2680_calc_mode(struct ov2680_device *sensor, int width, int height)
+{
+	int orig_width = width;
+	int orig_height = height;
+
+	if (width  <= (OV2680_NATIVE_WIDTH / 2) &&
+	    height <= (OV2680_NATIVE_HEIGHT / 2)) {
+		sensor->mode.binning = true;
+		width *= 2;
+		height *= 2;
+	} else {
+		sensor->mode.binning = false;
+	}
+
+	sensor->mode.h_start = ((OV2680_NATIVE_WIDTH - width) / 2) & ~1;
+	sensor->mode.v_start = ((OV2680_NATIVE_HEIGHT - height) / 2) & ~1;
+	sensor->mode.h_end = min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
+				 OV2680_NATIVE_WIDTH - 1);
+	sensor->mode.v_end = min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
+				 OV2680_NATIVE_HEIGHT - 1);
+	sensor->mode.h_output_size = orig_width;
+	sensor->mode.v_output_size = orig_height;
+	sensor->mode.hts = OV2680_PIXELS_PER_LINE;
+	sensor->mode.vts = OV2680_LINES_PER_FRAME;
+}
+
+static int ov2680_set_mode(struct ov2680_device *sensor, int width, int height)
+{
+	struct i2c_client *client = sensor->client;
+	u8 pll_div, unknown, inc, fmt1, fmt2;
+	int ret;
+
+	ov2680_calc_mode(sensor, width, height);
+
+	if (sensor->mode.binning) {
+		pll_div = 1;
+		unknown = 0x23;
+		inc = 0x31;
+		fmt1 = 0xc2;
+		fmt2 = 0x01;
+	} else {
+		pll_div = 0;
+		unknown = 0x21;
+		inc = 0x11;
+		fmt1 = 0xc0;
+		fmt2 = 0x00;
+	}
+
+	ret = ovxxxx_write_reg8(client, 0x3086, pll_div);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg8(client, 0x370a, unknown);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_HORIZONTAL_START_H, sensor->mode.h_start);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_VERTICAL_START_H, sensor->mode.v_start);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_HORIZONTAL_END_H, sensor->mode.h_end);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_VERTICAL_END_H, sensor->mode.v_end);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_HORIZONTAL_OUTPUT_SIZE_H,
+				 sensor->mode.h_output_size);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_VERTICAL_OUTPUT_SIZE_H,
+				 sensor->mode.v_output_size);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_HTS_H, sensor->mode.hts);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_VTS_H, sensor->mode.vts);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_ISP_X_WIN_H, 0);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_ISP_Y_WIN_H, 0);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg8(client, OV2680_X_INC, inc);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg8(client, OV2680_Y_INC, inc);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_X_WIN_H, sensor->mode.h_output_size);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg16(client, OV2680_Y_WIN_H, sensor->mode.v_output_size);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg8(client, OV2680_REG_FORMAT1, fmt1);
+	if (ret)
+		return ret;
+
+	ret = ovxxxx_write_reg8(client, OV2680_REG_FORMAT2, fmt2);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
@@ -416,18 +541,10 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 
 	/* s_power has not been called yet for std v4l2 clients (camorama) */
 	power_up(sd);
-	ret = ov2680_write_reg_array(client, dev->res->regs);
-	if (ret) {
-		dev_err(&client->dev,
-			"ov2680 write resolution register err: %d\n", ret);
-		goto err;
-	}
 
-	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, dev->res->lines_per_frame);
-	if (ret) {
-		dev_err(&client->dev, "ov2680 write vts err: %d\n", ret);
+	ret = ov2680_set_mode(dev, fmt->width, fmt->height);
+	if (ret < 0)
 		goto err;
-	}
 
 	/* Restore value of all ctrls */
 	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 54978ff9348c..9bbb34dd95a5 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -35,6 +35,13 @@
 #define OV2680_NATIVE_WIDTH			1616
 #define OV2680_NATIVE_HEIGHT			1216
 
+/* 1704 * 1294 * 30fps = 66MHz pixel clock */
+#define OV2680_PIXELS_PER_LINE			1704
+#define OV2680_LINES_PER_FRAME			1294
+
+/* If possible send 16 extra rows / lines to the ISP as padding */
+#define OV2680_END_MARGIN			16
+
 #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
 
 #define OV2680_BIN_FACTOR_MAX 4
@@ -105,10 +112,17 @@
 #define OV2680_HORIZONTAL_OUTPUT_SIZE_L				0x3809 /*Bit[7:0]*/
 #define OV2680_VERTICAL_OUTPUT_SIZE_H				0x380a /*Bit[3:0]*/
 #define OV2680_VERTICAL_OUTPUT_SIZE_L				0x380b /*Bit[7:0]*/
-#define OV2680_TIMING_HTS_H							0x380C  /*High 8-bit, and low 8-bit HTS address is 0x380d*/
-#define OV2680_TIMING_HTS_L							0x380D  /*High 8-bit, and low 8-bit HTS address is 0x380d*/
-#define OV2680_TIMING_VTS_H							0x380e  /*High 8-bit, and low 8-bit HTS address is 0x380f*/
-#define OV2680_TIMING_VTS_L							0x380f  /*High 8-bit, and low 8-bit HTS address is 0x380f*/
+#define OV2680_HTS_H				0x380c
+#define OV2680_HTS_L				0x380d
+#define OV2680_VTS_H				0x380e
+#define OV2680_VTS_L				0x380f
+#define OV2680_ISP_X_WIN_H			0x3810
+#define OV2680_ISP_X_WIN_L			0x3811
+#define OV2680_ISP_Y_WIN_H			0x3812
+#define OV2680_ISP_Y_WIN_L			0x3813
+#define OV2680_X_INC				0x3814
+#define OV2680_Y_INC				0x3815
+
 #define OV2680_FRAME_OFF_NUM						0x4202
 
 /*Flip/Mirror*/
@@ -122,6 +136,12 @@
 
 #define OV2680_REG_ISP_CTRL00			0x5080
 
+#define OV2680_X_WIN_H				0x5704
+#define OV2680_X_WIN_L				0x5705
+#define OV2680_Y_WIN_H				0x5706
+#define OV2680_Y_WIN_L				0x5707
+#define OV2680_WIN_CONTROL			0x5708
+
 #define OV2680_START_STREAMING			0x01
 #define OV2680_STOP_STREAMING			0x00
 
@@ -165,6 +185,15 @@ struct ov2680_device {
 
 	struct ov2680_mode {
 		struct v4l2_mbus_framefmt fmt;
+		bool binning;
+		u16 h_start;
+		u16 v_start;
+		u16 h_end;
+		u16 v_end;
+		u16 h_output_size;
+		u16 v_output_size;
+		u16 hts;
+		u16 vts;
 	} mode;
 
 	struct ov2680_ctrls {
@@ -246,6 +275,8 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 	{0x3819, 0x04},
 	{0x4000, 0x81},
 	{0x4001, 0x40},
+	{0x4008, 0x00},
+	{0x4009, 0x03},
 	{0x4602, 0x02},
 	{0x481f, 0x36},
 	{0x4825, 0x36},
@@ -258,6 +289,8 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 	{0x5008, 0x04},
 	{0x5009, 0x00},
 	{0x5080, 0x00},
+	{0x5081, 0x41},
+	{0x5708, 0x01},  //add for full size flip off and mirror off 2014/09/11
 	{0x3701, 0x64},  //add on 14/05/13
 	{0x3784, 0x0c},  //based OV2680_R1A_AM10.ovt add on 14/06/13
 	{0x5780, 0x3e},  //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
-- 
2.39.0

