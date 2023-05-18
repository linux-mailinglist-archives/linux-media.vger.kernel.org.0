Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8717084F2
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbjERPdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjERPdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33CF134
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZPdn0hfbvgOxq19L+a5Iq1lGdL+OV8GRH0BKeV8VWsE=;
        b=QYMkvvJK4sbBULLp4Cpz9rkFTx0SEZ4j8KhANB1WhnFLvEm6GVZIGhSA6hoNjyk8otjjIK
        s0CNlyyYOqa9T9Uzr8G5jp1LnFKmfJ9CLdScHZIQGjwjTamnBjdDCKB41mlcuyKn/OlFpX
        sN27LKMxnDFOt9G74vpXtyzm2EKjMe0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-poUSGgFgNJeFs25mrEJffw-1; Thu, 18 May 2023 11:32:46 -0400
X-MC-Unique: poUSGgFgNJeFs25mrEJffw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA430282CCB2;
        Thu, 18 May 2023 15:32:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 222EC40C6EC4;
        Thu, 18 May 2023 15:32:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 8/9] media: atomisp: gc0310: Remove gc0310.h
Date:   Thu, 18 May 2023 17:32:13 +0200
Message-Id: <20230518153214.194976-9-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the gc0310.h header file, moving most of its content
into atomisp-gc0310.c and dropping some unused parts.

This brings the gc0310 sensor driver inline with other sensor
regular / non atomisp sensor drivers which usually only are
one single .c file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 240 +++++++++++++-
 drivers/staging/media/atomisp/i2c/gc0310.h    | 307 ------------------
 2 files changed, 239 insertions(+), 308 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/gc0310.h

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 486ea7979c57..0109c0d9388e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -27,9 +27,247 @@
 #include <linux/types.h>
 
 #include <media/v4l2-acpi.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 
-#include "gc0310.h"
+#define GC0310_NATIVE_WIDTH			656
+#define GC0310_NATIVE_HEIGHT			496
+
+#define GC0310_FPS				30
+#define GC0310_SKIP_FRAMES			3
+
+#define GC0310_FOCAL_LENGTH_NUM			278 /* 2.78mm */
+
+#define GC0310_ID				0xa310
+
+#define GC0310_RESET_RELATED			0xFE
+#define GC0310_REGISTER_PAGE_0			0x0
+#define GC0310_REGISTER_PAGE_3			0x3
+
+/*
+ * GC0310 System control registers
+ */
+#define GC0310_SW_STREAM			0x10
+
+#define GC0310_SC_CMMN_CHIP_ID_H		0xf0
+#define GC0310_SC_CMMN_CHIP_ID_L		0xf1
+
+#define GC0310_AEC_PK_EXPO_H			0x03
+#define GC0310_AEC_PK_EXPO_L			0x04
+#define GC0310_AGC_ADJ				0x48
+#define GC0310_DGC_ADJ				0x71
+#define GC0310_GROUP_ACCESS			0x3208
+
+#define GC0310_H_CROP_START_H			0x09
+#define GC0310_H_CROP_START_L			0x0A
+#define GC0310_V_CROP_START_H			0x0B
+#define GC0310_V_CROP_START_L			0x0C
+#define GC0310_H_OUTSIZE_H			0x0F
+#define GC0310_H_OUTSIZE_L			0x10
+#define GC0310_V_OUTSIZE_H			0x0D
+#define GC0310_V_OUTSIZE_L			0x0E
+#define GC0310_H_BLANKING_H			0x05
+#define GC0310_H_BLANKING_L			0x06
+#define GC0310_V_BLANKING_H			0x07
+#define GC0310_V_BLANKING_L			0x08
+#define GC0310_SH_DELAY				0x11
+
+#define GC0310_START_STREAMING			0x94 /* 8-bit enable */
+#define GC0310_STOP_STREAMING			0x0 /* 8-bit disable */
+
+#define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
+
+struct gc0310_device {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct mutex input_lock;
+	bool is_streaming;
+
+	struct gpio_desc *reset;
+	struct gpio_desc *powerdown;
+
+	struct gc0310_mode {
+		struct v4l2_mbus_framefmt fmt;
+	} mode;
+
+	struct gc0310_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *exposure;
+		struct v4l2_ctrl *gain;
+	} ctrls;
+};
+
+struct gc0310_reg {
+	u8 reg;
+	u8 val;
+};
+
+static const struct gc0310_reg gc0310_reset_register[] = {
+	/* System registers */
+	{ 0xfe, 0xf0 },
+	{ 0xfe, 0xf0 },
+	{ 0xfe, 0x00 },
+
+	{ 0xfc, 0x0e }, /* 4e */
+	{ 0xfc, 0x0e }, /* 16//4e // [0]apwd [6]regf_clk_gate */
+	{ 0xf2, 0x80 }, /* sync output */
+	{ 0xf3, 0x00 }, /* 1f//01 data output */
+	{ 0xf7, 0x33 }, /* f9 */
+	{ 0xf8, 0x05 }, /* 00 */
+	{ 0xf9, 0x0e }, /* 0x8e //0f */
+	{ 0xfa, 0x11 },
+
+	/* MIPI */
+	{ 0xfe, 0x03 },
+	{ 0x01, 0x03 }, /* mipi 1lane */
+	{ 0x02, 0x22 }, /* 0x33 */
+	{ 0x03, 0x94 },
+	{ 0x04, 0x01 }, /* fifo_prog */
+	{ 0x05, 0x00 }, /* fifo_prog */
+	{ 0x06, 0x80 }, /* b0  //YUV ISP data */
+	{ 0x11, 0x2a }, /* 1e //LDI set YUV422 */
+	{ 0x12, 0x90 }, /* 00 //04 //00 //04//00 //LWC[7:0] */
+	{ 0x13, 0x02 }, /* 05 //05 //LWC[15:8] */
+	{ 0x15, 0x12 }, /* 0x10 //DPHYY_MODE read_ready */
+	{ 0x17, 0x01 },
+	{ 0x40, 0x08 },
+	{ 0x41, 0x00 },
+	{ 0x42, 0x00 },
+	{ 0x43, 0x00 },
+	{ 0x21, 0x02 }, /* 0x01 */
+	{ 0x22, 0x02 }, /* 0x01 */
+	{ 0x23, 0x01 }, /* 0x05 //Nor:0x05 DOU:0x06 */
+	{ 0x29, 0x00 },
+	{ 0x2A, 0x25 }, /* 0x05 //data zero 0x7a de */
+	{ 0x2B, 0x02 },
+
+	{ 0xfe, 0x00 },
+
+	/* CISCTL */
+	{ 0x00, 0x2f }, /* 2f//0f//02//01 */
+	{ 0x01, 0x0f }, /* 06 */
+	{ 0x02, 0x04 },
+	{ 0x4f, 0x00 }, /* AEC 0FF */
+	{ 0x03, 0x01 }, /* 0x03 //04 */
+	{ 0x04, 0xc0 }, /* 0xe8 //58 */
+	{ 0x05, 0x00 },
+	{ 0x06, 0xb2 }, /* 0x0a //HB */
+	{ 0x07, 0x00 },
+	{ 0x08, 0x0c }, /* 0x89 //VB */
+	{ 0x09, 0x00 }, /* row start */
+	{ 0x0a, 0x00 },
+	{ 0x0b, 0x00 }, /* col start */
+	{ 0x0c, 0x00 },
+	{ 0x0d, 0x01 }, /* height */
+	{ 0x0e, 0xf2 }, /* 0xf7 //height */
+	{ 0x0f, 0x02 }, /* width */
+	{ 0x10, 0x94 }, /* 0xa0 //height */
+	{ 0x17, 0x14 },
+	{ 0x18, 0x1a }, /* 0a//[4]double reset */
+	{ 0x19, 0x14 }, /* AD pipeline */
+	{ 0x1b, 0x48 },
+	{ 0x1e, 0x6b }, /* 3b//col bias */
+	{ 0x1f, 0x28 }, /* 20//00//08//txlow */
+	{ 0x20, 0x89 }, /* 88//0c//[3:2]DA15 */
+	{ 0x21, 0x49 }, /* 48//[3] txhigh */
+	{ 0x22, 0xb0 },
+	{ 0x23, 0x04 }, /* [1:0]vcm_r */
+	{ 0x24, 0x16 }, /* 15 */
+	{ 0x34, 0x20 }, /* [6:4] rsg high//range */
+
+	/* BLK */
+	{ 0x26, 0x23 }, /* [1]dark_current_en [0]offset_en */
+	{ 0x28, 0xff }, /* BLK_limie_value */
+	{ 0x29, 0x00 }, /* global offset */
+	{ 0x33, 0x18 }, /* offset_ratio */
+	{ 0x37, 0x20 }, /* dark_current_ratio */
+	{ 0x2a, 0x00 },
+	{ 0x2b, 0x00 },
+	{ 0x2c, 0x00 },
+	{ 0x2d, 0x00 },
+	{ 0x2e, 0x00 },
+	{ 0x2f, 0x00 },
+	{ 0x30, 0x00 },
+	{ 0x31, 0x00 },
+	{ 0x47, 0x80 }, /* a7 */
+	{ 0x4e, 0x66 }, /* select_row */
+	{ 0xa8, 0x02 }, /* win_width_dark, same with crop_win_width */
+	{ 0xa9, 0x80 },
+
+	/* ISP */
+	{ 0x40, 0x06 }, /* 0xff //ff //48 */
+	{ 0x41, 0x00 }, /* 0x21 //00//[0]curve_en */
+	{ 0x42, 0x04 }, /* 0xcf //0a//[1]awn_en */
+	{ 0x44, 0x18 }, /* 0x18 //02 */
+	{ 0x46, 0x02 }, /* 0x03 //sync */
+	{ 0x49, 0x03 },
+	{ 0x4c, 0x20 }, /* 00[5]pretect exp */
+	{ 0x50, 0x01 }, /* crop enable */
+	{ 0x51, 0x00 },
+	{ 0x52, 0x00 },
+	{ 0x53, 0x00 },
+	{ 0x54, 0x01 },
+	{ 0x55, 0x01 }, /* crop window height */
+	{ 0x56, 0xf0 },
+	{ 0x57, 0x02 }, /* crop window width */
+	{ 0x58, 0x90 },
+
+	/* Gain */
+	{ 0x70, 0x70 }, /* 70 //80//global gain */
+	{ 0x71, 0x20 }, /* pregain gain */
+	{ 0x72, 0x40 }, /* post gain */
+	{ 0x5a, 0x84 }, /* 84//analog gain 0  */
+	{ 0x5b, 0xc9 }, /* c9 */
+	{ 0x5c, 0xed }, /* ed//not use pga gain highest level */
+	{ 0x77, 0x40 }, /* R gain 0x74 //awb gain */
+	{ 0x78, 0x40 }, /* G gain */
+	{ 0x79, 0x40 }, /* B gain 0x5f */
+
+	{ 0x48, 0x00 },
+	{ 0xfe, 0x01 },
+	{ 0x0a, 0x45 }, /* [7]col gain mode */
+
+	{ 0x3e, 0x40 },
+	{ 0x3f, 0x5c },
+	{ 0x40, 0x7b },
+	{ 0x41, 0xbd },
+	{ 0x42, 0xf6 },
+	{ 0x43, 0x63 },
+	{ 0x03, 0x60 },
+	{ 0x44, 0x03 },
+
+	/* Dark / Sun mode related */
+	{ 0xfe, 0x01 },
+	{ 0x45, 0xa4 }, /* 0xf7 */
+	{ 0x46, 0xf0 }, /* 0xff //f0//sun value th */
+	{ 0x48, 0x03 }, /* sun mode */
+	{ 0x4f, 0x60 }, /* sun_clamp */
+	{ 0xfe, 0x00 },
+};
+
+static const struct gc0310_reg gc0310_VGA_30fps[] = {
+	{ 0xfe, 0x00 },
+	{ 0x0d, 0x01 }, /* height */
+	{ 0x0e, 0xf2 }, /* 0xf7 //height */
+	{ 0x0f, 0x02 }, /* width */
+	{ 0x10, 0x94 }, /* 0xa0 //height */
+
+	{ 0x50, 0x01 }, /* crop enable */
+	{ 0x51, 0x00 },
+	{ 0x52, 0x00 },
+	{ 0x53, 0x00 },
+	{ 0x54, 0x01 },
+	{ 0x55, 0x01 }, /* crop window height */
+	{ 0x56, 0xf0 },
+	{ 0x57, 0x02 }, /* crop window width */
+	{ 0x58, 0x90 },
+
+	{ 0xfe, 0x03 },
+	{ 0x12, 0x90 }, /* 00 //04 //00 //04//00 //LWC[7:0]  */
+	{ 0x13, 0x02 }, /* 05 //05 //LWC[15:8] */
+
+	{ 0xfe, 0x00 },
+};
 
 /*
  * gc0310_write_reg_array - Initializes a list of GC0310 registers
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
deleted file mode 100644
index b5200a9c08a2..000000000000
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ /dev/null
@@ -1,307 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for GalaxyCore GC0310 VGA camera sensor.
- *
- * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-
-#ifndef __GC0310_H__
-#define __GC0310_H__
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/i2c.h>
-#include <linux/acpi.h>
-#include <linux/delay.h>
-#include <linux/videodev2.h>
-#include <linux/spinlock.h>
-#include <media/v4l2-subdev.h>
-#include <media/v4l2-device.h>
-#include <media/v4l2-ctrls.h>
-#include <linux/v4l2-mediabus.h>
-#include <media/media-entity.h>
-
-#define GC0310_NATIVE_WIDTH			656
-#define GC0310_NATIVE_HEIGHT			496
-
-#define GC0310_FPS				30
-#define GC0310_SKIP_FRAMES			3
-
-#define GC0310_FOCAL_LENGTH_NUM			278 /* 2.78mm */
-
-#define GC0310_ID	0xa310
-
-#define GC0310_RESET_RELATED		0xFE
-#define GC0310_REGISTER_PAGE_0		0x0
-#define GC0310_REGISTER_PAGE_3		0x3
-
-#define GC0310_FINE_INTG_TIME_MIN 0
-#define GC0310_FINE_INTG_TIME_MAX_MARGIN 0
-#define GC0310_COARSE_INTG_TIME_MIN 1
-#define GC0310_COARSE_INTG_TIME_MAX_MARGIN 6
-
-/*
- * GC0310 System control registers
- */
-#define GC0310_SW_STREAM			0x10
-
-#define GC0310_SC_CMMN_CHIP_ID_H		0xf0
-#define GC0310_SC_CMMN_CHIP_ID_L		0xf1
-
-#define GC0310_AEC_PK_EXPO_H			0x03
-#define GC0310_AEC_PK_EXPO_L			0x04
-#define GC0310_AGC_ADJ			0x48
-#define GC0310_DGC_ADJ			0x71
-#if 0
-#define GC0310_GROUP_ACCESS			0x3208
-#endif
-
-#define GC0310_H_CROP_START_H			0x09
-#define GC0310_H_CROP_START_L			0x0A
-#define GC0310_V_CROP_START_H			0x0B
-#define GC0310_V_CROP_START_L			0x0C
-#define GC0310_H_OUTSIZE_H			0x0F
-#define GC0310_H_OUTSIZE_L			0x10
-#define GC0310_V_OUTSIZE_H			0x0D
-#define GC0310_V_OUTSIZE_L			0x0E
-#define GC0310_H_BLANKING_H			0x05
-#define GC0310_H_BLANKING_L			0x06
-#define GC0310_V_BLANKING_H			0x07
-#define GC0310_V_BLANKING_L			0x08
-#define GC0310_SH_DELAY			0x11
-
-#define GC0310_START_STREAMING			0x94 /* 8-bit enable */
-#define GC0310_STOP_STREAMING			0x0 /* 8-bit disable */
-
-/*
- * gc0310 device structure.
- */
-struct gc0310_device {
-	struct v4l2_subdev sd;
-	struct media_pad pad;
-	struct mutex input_lock;
-	bool is_streaming;
-
-	struct gpio_desc *reset;
-	struct gpio_desc *powerdown;
-
-	struct gc0310_mode {
-		struct v4l2_mbus_framefmt fmt;
-	} mode;
-
-	struct gc0310_ctrls {
-		struct v4l2_ctrl_handler handler;
-		struct v4l2_ctrl *exposure;
-		struct v4l2_ctrl *gain;
-	} ctrls;
-};
-
-/**
- * struct gc0310_reg - MI sensor  register format
- * @reg: 16-bit offset to register
- * @val: 8/16/32-bit register value
- *
- * Define a structure for sensor register initialization values
- */
-struct gc0310_reg {
-	u8 reg;
-	u8 val;	/* @set value for read/mod/write, @mask */
-};
-
-#define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
-
-/*
- * Register settings for various resolution
- */
-static const struct gc0310_reg gc0310_reset_register[] = {
-/////////////////////////////////////////////////
-/////////////////	system reg	/////////////////
-/////////////////////////////////////////////////
-	{ 0xfe, 0xf0 },
-	{ 0xfe, 0xf0 },
-	{ 0xfe, 0x00 },
-
-	{ 0xfc, 0x0e }, /* 4e */
-	{ 0xfc, 0x0e }, /* 16//4e // [0]apwd [6]regf_clk_gate */
-	{ 0xf2, 0x80 }, /* sync output */
-	{ 0xf3, 0x00 }, /* 1f//01 data output */
-	{ 0xf7, 0x33 }, /* f9 */
-	{ 0xf8, 0x05 }, /* 00 */
-	{ 0xf9, 0x0e }, /* 0x8e //0f */
-	{ 0xfa, 0x11 },
-
-/////////////////////////////////////////////////
-///////////////////   MIPI	 ////////////////////
-/////////////////////////////////////////////////
-	{ 0xfe, 0x03 },
-	{ 0x01, 0x03 }, /* mipi 1lane */
-	{ 0x02, 0x22 }, /* 0x33 */
-	{ 0x03, 0x94 },
-	{ 0x04, 0x01 }, /* fifo_prog */
-	{ 0x05, 0x00 }, /* fifo_prog */
-	{ 0x06, 0x80 }, /* b0  //YUV ISP data */
-	{ 0x11, 0x2a }, /* 1e //LDI set YUV422 */
-	{ 0x12, 0x90 }, /* 00 //04 //00 //04//00 //LWC[7:0] */
-	{ 0x13, 0x02 }, /* 05 //05 //LWC[15:8] */
-	{ 0x15, 0x12 }, /* 0x10 //DPHYY_MODE read_ready */
-	{ 0x17, 0x01 },
-	{ 0x40, 0x08 },
-	{ 0x41, 0x00 },
-	{ 0x42, 0x00 },
-	{ 0x43, 0x00 },
-	{ 0x21, 0x02 }, /* 0x01 */
-	{ 0x22, 0x02 }, /* 0x01 */
-	{ 0x23, 0x01 }, /* 0x05 //Nor:0x05 DOU:0x06 */
-	{ 0x29, 0x00 },
-	{ 0x2A, 0x25 }, /* 0x05 //data zero 0x7a de */
-	{ 0x2B, 0x02 },
-
-	{ 0xfe, 0x00 },
-
-/////////////////////////////////////////////////
-/////////////////	CISCTL reg	/////////////////
-/////////////////////////////////////////////////
-	{ 0x00, 0x2f }, /* 2f//0f//02//01 */
-	{ 0x01, 0x0f }, /* 06 */
-	{ 0x02, 0x04 },
-	{ 0x4f, 0x00 }, /* AEC 0FF */
-	{ 0x03, 0x01 }, /* 0x03 //04 */
-	{ 0x04, 0xc0 }, /* 0xe8 //58 */
-	{ 0x05, 0x00 },
-	{ 0x06, 0xb2 }, /* 0x0a //HB */
-	{ 0x07, 0x00 },
-	{ 0x08, 0x0c }, /* 0x89 //VB */
-	{ 0x09, 0x00 }, /* row start */
-	{ 0x0a, 0x00 },
-	{ 0x0b, 0x00 }, /* col start */
-	{ 0x0c, 0x00 },
-	{ 0x0d, 0x01 }, /* height */
-	{ 0x0e, 0xf2 }, /* 0xf7 //height */
-	{ 0x0f, 0x02 }, /* width */
-	{ 0x10, 0x94 }, /* 0xa0 //height */
-	{ 0x17, 0x14 },
-	{ 0x18, 0x1a }, /* 0a//[4]double reset */
-	{ 0x19, 0x14 }, /* AD pipeline */
-	{ 0x1b, 0x48 },
-	{ 0x1e, 0x6b }, /* 3b//col bias */
-	{ 0x1f, 0x28 }, /* 20//00//08//txlow */
-	{ 0x20, 0x89 }, /* 88//0c//[3:2]DA15 */
-	{ 0x21, 0x49 }, /* 48//[3] txhigh */
-	{ 0x22, 0xb0 },
-	{ 0x23, 0x04 }, /* [1:0]vcm_r */
-	{ 0x24, 0x16 }, /* 15 */
-	{ 0x34, 0x20 }, /* [6:4] rsg high//range */
-
-/////////////////////////////////////////////////
-////////////////////   BLK	 ////////////////////
-/////////////////////////////////////////////////
-	{ 0x26, 0x23 }, /* [1]dark_current_en [0]offset_en */
-	{ 0x28, 0xff }, /* BLK_limie_value */
-	{ 0x29, 0x00 }, /* global offset */
-	{ 0x33, 0x18 }, /* offset_ratio */
-	{ 0x37, 0x20 }, /* dark_current_ratio */
-	{ 0x2a, 0x00 },
-	{ 0x2b, 0x00 },
-	{ 0x2c, 0x00 },
-	{ 0x2d, 0x00 },
-	{ 0x2e, 0x00 },
-	{ 0x2f, 0x00 },
-	{ 0x30, 0x00 },
-	{ 0x31, 0x00 },
-	{ 0x47, 0x80 }, /* a7 */
-	{ 0x4e, 0x66 }, /* select_row */
-	{ 0xa8, 0x02 }, /* win_width_dark, same with crop_win_width */
-	{ 0xa9, 0x80 },
-
-/////////////////////////////////////////////////
-//////////////////	 ISP reg  ///////////////////
-/////////////////////////////////////////////////
-	{ 0x40, 0x06 }, /* 0xff //ff //48 */
-	{ 0x41, 0x00 }, /* 0x21 //00//[0]curve_en */
-	{ 0x42, 0x04 }, /* 0xcf //0a//[1]awn_en */
-	{ 0x44, 0x18 }, /* 0x18 //02 */
-	{ 0x46, 0x02 }, /* 0x03 //sync */
-	{ 0x49, 0x03 },
-	{ 0x4c, 0x20 }, /* 00[5]pretect exp */
-	{ 0x50, 0x01 }, /* crop enable */
-	{ 0x51, 0x00 },
-	{ 0x52, 0x00 },
-	{ 0x53, 0x00 },
-	{ 0x54, 0x01 },
-	{ 0x55, 0x01 }, /* crop window height */
-	{ 0x56, 0xf0 },
-	{ 0x57, 0x02 }, /* crop window width */
-	{ 0x58, 0x90 },
-
-/////////////////////////////////////////////////
-///////////////////   GAIN	 ////////////////////
-/////////////////////////////////////////////////
-	{ 0x70, 0x70 }, /* 70 //80//global gain */
-	{ 0x71, 0x20 }, /* pregain gain */
-	{ 0x72, 0x40 }, /* post gain */
-	{ 0x5a, 0x84 }, /* 84//analog gain 0  */
-	{ 0x5b, 0xc9 }, /* c9 */
-	{ 0x5c, 0xed }, /* ed//not use pga gain highest level */
-	{ 0x77, 0x40 }, /* R gain 0x74 //awb gain */
-	{ 0x78, 0x40 }, /* G gain */
-	{ 0x79, 0x40 }, /* B gain 0x5f */
-
-	{ 0x48, 0x00 },
-	{ 0xfe, 0x01 },
-	{ 0x0a, 0x45 }, /* [7]col gain mode */
-
-	{ 0x3e, 0x40 },
-	{ 0x3f, 0x5c },
-	{ 0x40, 0x7b },
-	{ 0x41, 0xbd },
-	{ 0x42, 0xf6 },
-	{ 0x43, 0x63 },
-	{ 0x03, 0x60 },
-	{ 0x44, 0x03 },
-
-/////////////////////////////////////////////////
-/////////////////	dark sun   //////////////////
-/////////////////////////////////////////////////
-	{ 0xfe, 0x01 },
-	{ 0x45, 0xa4 }, /* 0xf7 */
-	{ 0x46, 0xf0 }, /* 0xff //f0//sun value th */
-	{ 0x48, 0x03 }, /* sun mode */
-	{ 0x4f, 0x60 }, /* sun_clamp */
-	{ 0xfe, 0x00 },
-};
-
-static struct gc0310_reg const gc0310_VGA_30fps[] = {
-	{ 0xfe, 0x00 },
-	{ 0x0d, 0x01 }, /* height */
-	{ 0x0e, 0xf2 }, /* 0xf7 //height */
-	{ 0x0f, 0x02 }, /* width */
-	{ 0x10, 0x94 }, /* 0xa0 //height */
-
-	{ 0x50, 0x01 }, /* crop enable */
-	{ 0x51, 0x00 },
-	{ 0x52, 0x00 },
-	{ 0x53, 0x00 },
-	{ 0x54, 0x01 },
-	{ 0x55, 0x01 }, /* crop window height */
-	{ 0x56, 0xf0 },
-	{ 0x57, 0x02 }, /* crop window width */
-	{ 0x58, 0x90 },
-
-	{ 0xfe, 0x03 },
-	{ 0x12, 0x90 }, /* 00 //04 //00 //04//00 //LWC[7:0]  */
-	{ 0x13, 0x02 }, /* 05 //05 //LWC[15:8] */
-
-	{ 0xfe, 0x00 },
-};
-
-#endif
-- 
2.40.1

