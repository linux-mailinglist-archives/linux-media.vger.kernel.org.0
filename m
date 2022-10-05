Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8385F5A66
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiJETHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbiJETGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:06:45 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB5678BE6
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:06:43 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D50F4FF808;
        Wed,  5 Oct 2022 19:06:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Date:   Wed,  5 Oct 2022 21:06:05 +0200
Message-Id: <20221005190613.394277-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005190613.394277-1-jacopo@jmondi.org>
References: <20221005190613.394277-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
gain register which applies to all color channels.

As both the global digital and analog gains are controlled through a
single register, in order not to overwrite the configured digital gain
we need to read the current register value before modifying it.

Implement a function to read register values and use it before applying
the new analog gain.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 89f3c01f18ce..581f5e42994d 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -5,6 +5,8 @@
  * Written by Krzysztof Hałasa
  */
 
+#include <asm/unaligned.h>
+
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
@@ -35,6 +37,11 @@
 #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
 #define AR0521_TOTAL_WIDTH_MIN	     2968u
 
+#define AR0521_ANA_GAIN_MIN		0x00
+#define AR0521_ANA_GAIN_MAX		0x3f
+#define AR0521_ANA_GAIN_STEP		0x01
+#define AR0521_ANA_GAIN_DEFAULT		0x00
+
 /* AR0521 registers */
 #define AR0521_REG_VT_PIX_CLK_DIV		0x0300
 #define AR0521_REG_FRAME_LENGTH_LINES		0x0340
@@ -55,6 +62,7 @@
 #define AR0521_REG_RED_GAIN			0x305A
 #define AR0521_REG_GREEN2_GAIN			0x305C
 #define AR0521_REG_GLOBAL_GAIN			0x305E
+#define AR0521_REG_GLOBAL_GAIN_ANA_MASK		0x3f
 
 #define AR0521_REG_HISPI_TEST_MODE		0x3066
 #define AR0521_REG_HISPI_TEST_MODE_LP11		  0x0004
@@ -77,6 +85,7 @@ static const char * const ar0521_supply_names[] = {
 
 struct ar0521_ctrls {
 	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *ana_gain;
 	struct {
 		struct v4l2_ctrl *gain;
 		struct v4l2_ctrl *red_balance;
@@ -167,6 +176,36 @@ static int ar0521_write_reg(struct ar0521_dev *sensor, u16 reg, u16 val)
 	return ar0521_write_regs(sensor, buf, 2);
 }
 
+static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	unsigned char buf[2];
+	struct i2c_msg msg;
+	int ret;
+
+	msg.addr = client->addr;
+	msg.flags = client->flags;
+	msg.len = sizeof(u16);
+	msg.buf = buf;
+	put_unaligned_be16(reg, buf);
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 0)
+		return ret;
+
+	msg.len = sizeof(u16);
+	msg.flags = client->flags | I2C_M_RD;
+	msg.buf = buf;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 0)
+		return ret;
+
+	*val = get_unaligned_be16(buf);
+
+	return 0;
+}
+
 static int ar0521_set_geometry(struct ar0521_dev *sensor)
 {
 	/* All dimensions are unsigned 12-bit integers */
@@ -187,6 +226,21 @@ static int ar0521_set_geometry(struct ar0521_dev *sensor)
 	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
 }
 
+static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
+{
+	u16 global_gain;
+	int ret;
+
+	ret = ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_gain);
+	if (ret)
+		return ret;
+
+	global_gain &= ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
+	global_gain |= sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_GAIN_ANA_MASK;
+
+	return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_gain);
+}
+
 static int ar0521_set_gains(struct ar0521_dev *sensor)
 {
 	int green = sensor->ctrls.gain->val;
@@ -456,6 +510,9 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		ret = ar0521_set_geometry(sensor);
 		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ar0521_set_analog_gain(sensor);
+		break;
 	case V4L2_CID_GAIN:
 	case V4L2_CID_RED_BALANCE:
 	case V4L2_CID_BLUE_BALANCE:
@@ -499,6 +556,13 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	/* We can use our own mutex for the ctrl lock */
 	hdl->lock = &sensor->lock;
 
+	/* Analog gain */
+	ctrls->ana_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+					    AR0521_ANA_GAIN_MIN,
+					    AR0521_ANA_GAIN_MAX,
+					    AR0521_ANA_GAIN_STEP,
+					    AR0521_ANA_GAIN_DEFAULT);
+
 	/* Manual gain */
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
 	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,
-- 
2.37.3

