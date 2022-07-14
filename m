Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545CE5746DE
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 10:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbiGNIfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 04:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235720AbiGNIfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 04:35:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17F73DBEA
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:35:08 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d16so1542284wrv.10
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NfmOXsFOTm21TT2TnalW79ipm8crGCNAJR6ezLq0BP8=;
        b=Y3Y0jzir7eWwy6Ly9fsoo3vo9kx+UUDXOWx6RweGAnly/6mk+c6sMoItdhXFVSINKk
         IpqXL8EqFMOkqKxKEilsZ4XwAZhYPUVEU59FIelkumVS0ZXNJkcOEsklFgp3gKAXst06
         NX1xeuFB1TMG+ZFMEaOWBj5+QECdC0XXlb8dJHEVLT0WW8U8ATQGzDxQJZSO3RxgqtLA
         PUeHrHE/cBvtqmalRJO5JuEH1AU/QPIfNDWMcg+oTkh6XO9uhW+4oWF5vZkja7tefJrr
         wL5LwArF1Pb/rV4WXeLpGztP9DKX46AwUa8HE9+F/6rchHL+eg7f4pb5OmtWJ97diHtk
         nZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NfmOXsFOTm21TT2TnalW79ipm8crGCNAJR6ezLq0BP8=;
        b=VVFxWZP+dOkMCd8MXpAeyQwlY60RURTnnGfXLQ7J7bu0HRAxNsdeQfUGc4GENkOP0y
         Ik4lFLZx22EVy6yquKM9l3mWTKNnvEyD0XI0Kkw39hes6XhkzX2uu7HD6zJjdXvFyRaH
         ykAOpB2fP0v8gZVbCwSK/GnW7e5iMNvRdL6Yt/kF8ff8uc8NmG1NrVappXE71py05PnX
         HHrkP/+3QwZOp2M3Xt6EZyFqjkv0sdsZppmB97BIe01ItWO1GaqITPuLmXmlIC6r/es/
         Bb3milFsYt6btaJUHQuHZvLgCHegTfYYi5dV8FF5FWYQx3VHIfdw+uTos2IV3q/n5wK9
         /b9g==
X-Gm-Message-State: AJIora8NLUgo8i+nxxc7MvbdaHVSZG0IOzp2xDzwxFxADVZyAG+AG4qi
        GhzWeT5gdUwLDundBD4S2pEQEyvpbivCaGQjNkszLZNrNJbtBBzoDAqZsfYvJtnHBlmuGLctCu9
        bJCfHYGOJ06+Kct2uc0fdpQ0jxkkbmxnGfTJeBNhH1OjbTQ3CywaoN0MAWywf2LquqtfvhGVm
X-Google-Smtp-Source: AGRyM1sfK9VHaDGbyGxfgVoJU17GDBAMRB/tzk1k3jx1UD/Ycb61jkedi1lVv8xJojaaVeWp//AKeQ==
X-Received: by 2002:adf:fb49:0:b0:21a:3ccc:fb77 with SMTP id c9-20020adffb49000000b0021a3cccfb77mr6962434wrs.280.1657787706700;
        Thu, 14 Jul 2022 01:35:06 -0700 (PDT)
Received: from melexis ([194.44.50.167])
        by smtp.gmail.com with ESMTPSA id d14-20020adffd8e000000b0021d6a23fdf3sm856953wrr.15.2022.07.14.01.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 01:35:06 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org
Cc:     Volodymyr Kharuk <vkh@melexis.com>,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] media: i2c: Add driver for mlx7502x ToF sensor
Date:   Thu, 14 Jul 2022 11:34:48 +0300
Message-Id: <6f9b20bb1946d8a50170963b84e32abfdee14ba7.1657786765.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657786765.git.vkh@melexis.com>
References: <cover.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
and mipi speeds are 300, 600, 704, 800, 904, 960Mbs.
Supported format is RAW12.
Sensor 75026 is QVGA, while 75027 is VGA sensor.

The driver supports:
- Digital binning and cropping
- Horizontal and vertical flip
- phase shifts(up to 8)
- frequency modulation
- time integration
- internal temperature
- different trigger sources

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Signed-off-by: Andrii Kyselov <ays@melexis.com>
---
 MAINTAINERS                  |    1 +
 drivers/media/i2c/Kconfig    |   13 +
 drivers/media/i2c/Makefile   |    1 +
 drivers/media/i2c/mlx7502x.c | 2020 ++++++++++++++++++++++++++++++++++
 4 files changed, 2035 insertions(+)
 create mode 100644 drivers/media/i2c/mlx7502x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b00a726bb3db..6dc74dab45aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12679,6 +12679,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://www.melexis.com
 F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
+F:	drivers/media/i2c/mlx7502x.c
 F:	include/uapi/linux/mlx7502x.h
 
 MELFAS MIP4 TOUCHSCREEN DRIVER
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2b20aa6c37b1..126f6bd458b7 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -216,6 +216,19 @@ config VIDEO_IMX412
 config VIDEO_MAX9271_LIB
 	tristate
 
+config VIDEO_MLX7502X
+	tristate "Melexis ToF 75026 and 75027 sensors support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a V4L2 sensor driver for the Melexis 75026 and 75027
+	  ToF sensors.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mlx7502x.
+
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 3e1696963e7f..57c30859e537 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_VIDEO_M5MOLS) += m5mols/
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
+obj-$(CONFIG_VIDEO_MLX7502X) += mlx7502x.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
 obj-$(CONFIG_VIDEO_MT9M032) += mt9m032.o
diff --git a/drivers/media/i2c/mlx7502x.c b/drivers/media/i2c/mlx7502x.c
new file mode 100644
index 000000000000..93fb6b555a4e
--- /dev/null
+++ b/drivers/media/i2c/mlx7502x.c
@@ -0,0 +1,2020 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A V4L2 driver for Melexis 7502x ToF cameras.
+ *
+ * Copyright (C) 2022 Melexis N.V.
+ *
+ */
+
+#include <asm/unaligned.h>
+#include <linux/bitfield.h>
+#include <linux/bsearch.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/mlx7502x.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
+#include <linux/units.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-image-sizes.h>
+
+#define MLX7502X_SENSOR_ID_REG        0x0002
+#define MLX7502X_PARAM_HOLD_REG       0x0102
+#define MLX7502X_HMAX_REG             0x0800
+#define MLX7502X_COLUMN_START_REG     0x0804
+#define MLX7502X_COLUMN_LEN_REG       0x0806
+#define MLX7502X_ROW_START_REG        0x0808
+#define MLX7502X_ROW_END_REG          0x080a
+#define MLX7502X_VFLIP_REG            0x080c
+#define MLX7502X_HFLIP_REG            0x080d
+#define MLX7502X_OUTPUT_MODE_REG      0x0828
+#define MLX7502X_STREAM_EN_REG        0x1001
+#define MLX7502X_DATA_LANE_CONFIG_REG 0x1010
+#define MLX7502X_FMOD_REG             0x1048
+#define MLX7502X_PLL_RES_REG          0x104b
+#define MLX7502X_TEMPERATURE_REG      0x1403
+#define MLX7502X_BINNING_REG          0x14a5
+#define MLX7502X_CONTINUOUS_REG       0x1c40
+#define MLX7502X_SW_TRIGGER_REG       0x2100
+#define MLX7502X_FRAME_TIME_REG       0x2108
+#define MLX7502X_TINT0_REG            0x2120
+#define MLX7502X_PX_PHASE_SHIFT_REG   0x21b4
+#define MLX7502X_DIVSELPRE_REG        0x21be
+#define MLX7502X_DIVSEL_REG           0x21bf
+#define MLX7502X_PHASE_COUNT_REG      0x21e8
+#define MLX7502X_PLLSETUP_REG         0x4010
+#define MLX7502X_PRETIME_REG          0x4015
+#define MLX7502X_RANDNM0_REG          0x5265
+
+#define MLX7502X_NIBLE_LOW_MASK		GENMASK(3, 0)
+#define MLX7502X_NIBLE_HIGH_MASK	GENMASK(7, 4)
+
+#define MLX7502X_PHASE_MAX_NUM 8
+
+#define MLX7502X_CLK_RATE_MHZ 120
+#define MLX7502X_XCLK_RATE (8 * HZ_PER_MHZ)
+
+#define MLX7502X_RESET_DELAY_MS 100
+#define MLX7502X_TRIGGER_DELAY_US 100
+#define MLX7502X_STREAMING_DELAY_US 1500
+
+#define MLX7502X_SW_TRIGGER_DEFAULT 0x0000
+#define MLX7502X_SW_TRIGGER_TRIG 0x0001
+#define MLX7502X_SW_TRIGGER_CONT 0x0008
+
+#define MLX7502X_LINK_FREQ_REG_N 11
+#define MLX7502X_LINK_FREQ_N 6
+#define MLX7502X_LANE_N 2
+#define MLX7502X_OUTPUT_MODE_N 2
+
+#define MLX7502X_PLLSETUP_US 503
+#define MLX7502X_PLLSETUP_TICKS 8
+#define MLX7502X_PRETIME_US 50
+#define MLX7502X_FRAME_ADD_TICKS 13
+
+#define MLX7502X_DEFAULT_FRAME_RATE 25
+
+#define MLX7502X_ROW_START(top) ((top) / 2)
+#define MLX7502X_ROW_END(top, height) ((((top) + (height)) / 2) + 1)
+
+#define MLX7502X_LEFT_STEP 1
+#define MLX7502X_LEFT_MIN 0
+
+#define MLX7502X_TOP_STEP 2
+#define MLX7502X_TOP_MIN 0
+
+#define MLX7502X_PLL_RES_THR 113
+
+#define MLX7502X_75026_ID 0x10
+
+static const char * const mlx7502x_supply_names[] = {
+	"vdda",		/* Analog (2.7V) supply */
+	"vddif",	/* I/O (1.8V) supply */
+	"vddd",		/* Digital core (1.2V) supply */
+	"vdmix",	/* MIX driver (1.2V) supply */
+};
+
+#define MLX7502X_NUM_SUPPLIES ARRAY_SIZE(mlx7502x_supply_names)
+
+/* the source to generate next frame */
+enum mlx7502x_trigger_mode {
+	MLX7502X_SOFTWARE = 0, /* internal sw trigger */
+	MLX7502X_HARDWARE, /* external gpio trigger */
+	MLX7502X_CONTINUOUS, /* self triggering */
+};
+
+/* output data of the sensor */
+enum mlx7502x_output_mode {
+	MLX7502X_AMB = 0, /* rawA minus rawB mode */
+	MLX7502X_APB, /* rawA plus rawB mode */
+	MLX7502X_RAW_A, /* only rawA mode */
+	MLX7502X_RAW_B, /* only rawB mode */
+	MLX7502X_RAW_ANB, /* both rawA and rawB, output frame size doubles */
+};
+
+struct mlx7502x_regval_list {
+	u16 addr;
+	u8 data;
+};
+
+struct mlx7502x_link_freq_list {
+	s64 link_freq[MLX7502X_LINK_FREQ_N];
+	u16 addr[MLX7502X_LINK_FREQ_REG_N];
+	u8 data[MLX7502X_LANE_N][MLX7502X_LINK_FREQ_N][MLX7502X_LINK_FREQ_REG_N];
+	u16 hmax[MLX7502X_LANE_N][MLX7502X_LINK_FREQ_N][MLX7502X_OUTPUT_MODE_N];
+};
+
+struct mlx7502x_binning_mode {
+	u8 reg_value;
+	u8 ratio;
+	u8 width_step;
+	u8 height_step;
+	u8 width_min;
+	u8 height_min;
+};
+
+/* configuration of divider for specific fmod */
+struct mlx7502x_fmod_list {
+	u8 fmod;
+	u8 divselpre;
+	u8 divsel;
+};
+
+struct mlx7502x_sensor_desc {
+	const struct mlx7502x_regval_list *init_cfg;
+	u32 init_cfg_size;
+	const struct mlx7502x_link_freq_list *link_freq_cfg;
+	u32 width;
+	u32 height;
+};
+
+struct mlx7502x {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_fwnode_endpoint ep;
+	struct device *dev;
+
+	/* controls */
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *tint;
+	struct v4l2_ctrl *trigger_mode;
+	struct v4l2_ctrl *phase_number;
+	struct v4l2_ctrl *output_mode;
+
+	struct clk *xclk;
+	struct regulator_bulk_data supplies[MLX7502X_NUM_SUPPLIES];
+
+	/* pins */
+	struct gpio_desc *reset;
+	struct gpio_desc *leden;
+	struct gpio_desc *trig;
+
+	const struct mlx7502x_sensor_desc *cur_desc;
+	const struct mlx7502x_binning_mode *binning_mode;
+	int (*trigger)(struct mlx7502x *sensor);
+	int streaming;
+	u16 hmax; /* internal sensor frame size in ticks */
+	struct v4l2_fract frame_interval;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+	struct mutex lock; /* mutex lock for serialized operations */
+};
+
+static const struct mlx7502x_regval_list mlx7502x_common_init_cfg[] = {
+	{ 0x1006, 0x08 }, { 0x1007, 0x00 }, { 0x1040, 0x00 }, { 0x1041, 0x96 },
+	{ 0x1042, 0x01 }, { 0x1043, 0x00 }, { 0x1044, 0x00 }, { 0x1046, 0x01 },
+	{ 0x104a, 0x01 }, { 0x1000, 0x00 }, { 0x10d3, 0x10 }, { 0x1448, 0x06 },
+	{ 0x1449, 0x40 }, { 0x144a, 0x06 }, { 0x144b, 0x40 }, { 0x144c, 0x06 },
+	{ 0x144d, 0x40 }, { 0x144e, 0x06 }, { 0x144f, 0x40 }, { 0x1450, 0x06 },
+	{ 0x1451, 0x40 }, { 0x1452, 0x06 }, { 0x1453, 0x40 }, { 0x1454, 0x06 },
+	{ 0x1455, 0x40 }, { 0x1456, 0x06 }, { 0x1457, 0x40 }, { 0x2203, 0x1e },
+	{ 0x2c08, 0x01 }, { 0x3c2b, 0x1b }, { 0x400e, 0x01 }, { 0x400f, 0x81 },
+	{ 0x40d1, 0x00 }, { 0x40d2, 0x00 }, { 0x40d3, 0x00 }, { 0x40db, 0x3f },
+	{ 0x40de, 0x40 }, { 0x40df, 0x01 }, { 0x4134, 0x04 }, { 0x4135, 0x04 },
+	{ 0x4136, 0x04 }, { 0x4137, 0x04 }, { 0x4138, 0x04 }, { 0x4139, 0x04 },
+	{ 0x413a, 0x04 }, { 0x413b, 0x04 }, { 0x413c, 0x04 }, { 0x4146, 0x01 },
+	{ 0x4147, 0x01 }, { 0x4148, 0x01 }, { 0x4149, 0x01 }, { 0x414a, 0x01 },
+	{ 0x414b, 0x01 }, { 0x414c, 0x01 }, { 0x414d, 0x01 }, { 0x4158, 0x01 },
+	{ 0x4159, 0x01 }, { 0x415a, 0x01 }, { 0x415b, 0x01 }, { 0x415c, 0x01 },
+	{ 0x415d, 0x01 }, { 0x415e, 0x01 }, { 0x415f, 0x01 }, { 0x4590, 0x00 },
+	{ 0x4591, 0x2e }, { 0x4684, 0x00 }, { 0x4685, 0xa0 }, { 0x4687, 0xa1 },
+	{ 0x471e, 0x07 }, { 0x471f, 0xc9 }, { 0x473a, 0x07 }, { 0x473b, 0xc9 },
+	{ 0x4770, 0x00 }, { 0x4771, 0x00 }, { 0x4772, 0x1f }, { 0x4773, 0xff },
+	{ 0x4778, 0x06 }, { 0x4779, 0xa4 }, { 0x477a, 0x07 }, { 0x477b, 0xae },
+	{ 0x4788, 0x06 }, { 0x4789, 0xa4 }, { 0x478c, 0x1f }, { 0x478d, 0xff },
+	{ 0x478e, 0x00 }, { 0x478f, 0x00 }, { 0x4792, 0x00 }, { 0x4793, 0x00 },
+	{ 0x4796, 0x00 }, { 0x4797, 0x00 }, { 0x479a, 0x00 }, { 0x479b, 0x00 },
+	{ 0x479c, 0x1f }, { 0x479d, 0xff }, { 0x479e, 0x00 }, { 0x479f, 0x00 },
+	{ 0x47a2, 0x00 }, { 0x47a3, 0x00 }, { 0x47a6, 0x00 }, { 0x47a7, 0x00 },
+	{ 0x47aa, 0x00 }, { 0x47ab, 0x00 }, { 0x47ac, 0x1f }, { 0x47ad, 0xff },
+	{ 0x47ae, 0x00 }, { 0x47af, 0x00 }, { 0x47b2, 0x00 }, { 0x47b3, 0x00 },
+	{ 0x47b6, 0x00 }, { 0x47b7, 0x00 }, { 0x47ba, 0x00 }, { 0x47bb, 0x00 },
+	{ 0x47bc, 0x1f }, { 0x47bd, 0xff }, { 0x47be, 0x00 }, { 0x47bf, 0x00 },
+	{ 0x47c2, 0x00 }, { 0x47c3, 0x00 }, { 0x47c6, 0x00 }, { 0x47c7, 0x00 },
+	{ 0x47ca, 0x00 }, { 0x47cb, 0x00 }, { 0x4834, 0x00 }, { 0x4835, 0xa0 },
+	{ 0x4837, 0xa1 }, { 0x4878, 0x00 }, { 0x4879, 0xa0 }, { 0x487b, 0xa1 },
+	{ 0x48bc, 0x00 }, { 0x48bd, 0xa0 }, { 0x48bf, 0xa1 }, { 0x49ff, 0x78 },
+	{ 0x4baf, 0x1a }, { 0x4bc7, 0x1a }, { 0x4d2a, 0x07 }, { 0x4d80, 0x06 },
+	{ 0x4d81, 0xa4 }, { 0x4d82, 0x07 }, { 0x4e39, 0x07 }, { 0x4e7b, 0x64 },
+	{ 0x4e8e, 0x0e }, { 0x4e9c, 0x01 }, { 0x4ea0, 0x01 }, { 0x4ea1, 0x03 },
+	{ 0x4ea5, 0x00 }, { 0x4ea7, 0x00 }, { 0x4f05, 0x04 }, { 0x4f0d, 0x04 },
+	{ 0x4f15, 0x04 }, { 0x4f19, 0x01 }, { 0x4f20, 0x01 }, { 0x4f66, 0x0f },
+	{ 0x500f, 0x01 }, { 0x5225, 0x2f }, { 0x5227, 0x1e }, { 0x5231, 0x19 },
+	{ 0x5245, 0x07 }, { 0x5252, 0x07 }, { 0x5253, 0x08 }, { 0x5254, 0x07 },
+	{ 0x5255, 0xb4 }, { 0x5272, 0x04 }, { 0x5273, 0x2e }, { 0x5282, 0x04 },
+	{ 0x5283, 0x2e }, { 0x5286, 0x00 }, { 0x5287, 0x5d }, { 0x1433, 0x00 },
+	{ 0x3c18, 0x00 }, { 0x100e, 0x00 }, { 0x100f, 0x00 }, { 0x10c2, 0x00 },
+	{ 0x10d0, 0x0a }, { 0x10d4, 0x00 }, { 0x10d5, 0xc5 },
+};
+
+static const struct mlx7502x_regval_list mlx7502x_75027_init_cfg[] = {
+	{ 0x477d, 0xd6 }, { 0x4954, 0x00 }, { 0x4955, 0xa0 }, { 0x4957, 0xa1 },
+	{ 0x4984, 0x00 }, { 0x4985, 0xa0 }, { 0x4987, 0xa1 }, { 0x49b9, 0x78 },
+	{ 0x49c3, 0x3c }, { 0x49c9, 0x76 }, { 0x49d3, 0x3f }, { 0x49dc, 0x00 },
+	{ 0x49dd, 0xa0 }, { 0x49df, 0xa1 }, { 0x49ef, 0x78 }, { 0x49f9, 0x3c },
+	{ 0x4a05, 0x3c }, { 0x4a0b, 0x76 }, { 0x4a11, 0x3f }, { 0x4a1a, 0x00 },
+	{ 0x4a1b, 0xa0 }, { 0x4a1d, 0xa1 }, { 0x4a1f, 0x78 }, { 0x4a29, 0x3c },
+	{ 0x4a4a, 0x00 }, { 0x4a4b, 0xa0 }, { 0x4a4d, 0xa1 }, { 0x4a7a, 0x00 },
+	{ 0x4a7b, 0xa0 }, { 0x4a7d, 0xa1 }, { 0x4aee, 0x00 }, { 0x4aef, 0xa0 },
+	{ 0x4af1, 0xa1 }, { 0x4b2e, 0x00 }, { 0x4b2f, 0xa0 }, { 0x4b31, 0xa1 },
+	{ 0x4b5a, 0x00 }, { 0x4b5b, 0xa0 }, { 0x4b5d, 0xa1 }, { 0x4b86, 0x00 },
+	{ 0x4b87, 0xa0 }, { 0x4b89, 0xa1 }, { 0x4b9f, 0x1a }, { 0x4bb7, 0x1a },
+	{ 0x4bcf, 0x1a }, { 0x4bee, 0x00 }, { 0x4bef, 0xa0 }, { 0x4bf1, 0xa1 },
+	{ 0x4bf7, 0x1a }, { 0x4c01, 0x1a }, { 0x4c58, 0x00 }, { 0x4c59, 0xa0 },
+	{ 0x4c5b, 0xa1 }, { 0x4c6e, 0x00 }, { 0x4c6f, 0xa0 }, { 0x4c71, 0xa1 },
+	{ 0x4c7a, 0x01 }, { 0x4c7b, 0x35 }, { 0x4cf2, 0x07 }, { 0x4cf3, 0xc9 },
+	{ 0x4cf8, 0x06 }, { 0x4cf9, 0x9b }, { 0x4cfa, 0x07 }, { 0x4cfb, 0xae },
+	{ 0x4cfe, 0x07 }, { 0x4cff, 0xc9 }, { 0x4d04, 0x06 }, { 0x4d05, 0x98 },
+	{ 0x4d06, 0x07 }, { 0x4d07, 0xb1 }, { 0x4d18, 0x06 }, { 0x4d19, 0xa4 },
+	{ 0x4d1a, 0x07 }, { 0x4d1b, 0x49 }, { 0x4d1e, 0x07 }, { 0x4d1f, 0xc9 },
+	{ 0x4d2b, 0xc9 }, { 0x4d4a, 0x07 }, { 0x4d4b, 0xc9 }, { 0x4d50, 0x06 },
+	{ 0x4d51, 0x9b }, { 0x4d52, 0x07 }, { 0x4d53, 0xae }, { 0x4d56, 0x07 },
+	{ 0x4d57, 0xc9 }, { 0x4d5c, 0x06 }, { 0x4d5d, 0x98 }, { 0x4d5e, 0x07 },
+	{ 0x4d5f, 0xb1 }, { 0x4d70, 0x06 }, { 0x4d71, 0xa4 }, { 0x4d72, 0x07 },
+	{ 0x4d73, 0x49 }, { 0x4d78, 0x06 }, { 0x4d79, 0xa4 }, { 0x4d7a, 0x07 },
+	{ 0x4d7b, 0xae }, { 0x4d7c, 0x1f }, { 0x4d7d, 0xff }, { 0x4d7e, 0x1f },
+	{ 0x4d7f, 0xff }, { 0x4d83, 0xae }, { 0x4d84, 0x1f }, { 0x4d85, 0xff },
+	{ 0x4d86, 0x1f }, { 0x4d87, 0xff },
+};
+
+static const struct mlx7502x_link_freq_list mlx75027_link_freq_cfg = {
+	.link_freq = { 300000000, 600000000, 704000000, 800000000, 904000000, 960000000 },
+	.addr = {
+		0x100c, 0x100d, 0x1016, 0x1017, 0x1045, 0x1047,
+		0x1060, 0x1071, 0x10c3, 0x10c4, 0x10c5
+	},
+	.data = {
+		{ /* lane 2 */
+			{ 0x02, 0x58, 0x09, 0x99, 0x4b, 0x02,
+				0x01, 0x0c, 0x1c, 0x01, 0x3a }, /* 300MBps */
+			{ 0x04, 0xb0, 0x04, 0xcc, 0x4b, 0x02,
+				0x00, 0x06, 0x0f, 0x00, 0x9d }, /* 600MBps */
+			{ 0x05, 0x80, 0x04, 0x17, 0x58, 0x02,
+				0x00, 0x06, 0x0d, 0x00, 0x86 }, /* 704MBps */
+			{ 0x06, 0x40, 0x03, 0x99, 0x64, 0x02,
+				0x00, 0x06, 0x0b, 0x00, 0x75 }, /* 800MBps */
+			{ 0x07, 0x10, 0x03, 0x2f, 0x71, 0x00,
+				0x00, 0x06, 0x0a, 0x00, 0x68 }, /* 904MBps */
+			{ 0x07, 0x80, 0x03, 0x00, 0x78, 0x02,
+				0x00, 0x06, 0x0a, 0x00, 0x62 }, /* 960MBps */
+		}, { /* lane 4 */
+			{ 0x04, 0xb0, 0x09, 0x99, 0x4b, 0x02,
+				0x01, 0x0c, 0x1c, 0x01, 0x3a }, /* 300MBps */
+			{ 0x09, 0x60, 0x04, 0xcc, 0x4b, 0x02,
+				0x00, 0x06, 0x0f, 0x00, 0x9d }, /* 600MBps */
+			{ 0x0b, 0x00, 0x04, 0x17, 0x58, 0x02,
+				0x00, 0x06, 0x0d, 0x00, 0x86 }, /* 704MBps */
+			{ 0x0c, 0x80, 0x03, 0x99, 0x64, 0x02,
+				0x00, 0x06, 0x0b, 0x00, 0x75 }, /* 800MBps */
+			{ 0x0e, 0x20, 0x03, 0x2f, 0x71, 0x00,
+				0x00, 0x06, 0x0a, 0x00, 0x68 }, /* 904MBps */
+			{ 0x0f, 0x00, 0x03, 0x00, 0x78, 0x00,
+				0x00, 0x06, 0x0a, 0x00, 0x62 }, /* 960MBps */
+		},
+	},
+	.hmax = {
+		{ /* lane 2 */
+			{ 0x0e78, 0x1a80 }, /* 300MBps */
+			{ 0x0750, 0x0d54 }, /* 600MBps */
+			{ 0x0640, 0x0b60 }, /* 704MBps */
+			{ 0x0584, 0x0a06 }, /* 800MBps */
+			{ 0x04e8, 0x08e6 }, /* 904MBps */
+			{ 0x049e, 0x0860 }, /* 960MBps */
+		},
+		{ /* lane 4 */
+			{ 0x0860, 0x0e60 }, /* 300MBps */
+			{ 0x0444, 0x0744 }, /* 600MBps */
+			{ 0x03a8, 0x0636 }, /* 704MBps */
+			{ 0x033a, 0x057a }, /* 800MBps */
+			{ 0x02e2, 0x0514 }, /* 904MBps */
+			{ 0x02b6, 0x0514 }, /* 960MBps */
+		},
+	}
+};
+
+/* VGA sensor */
+static const struct mlx7502x_sensor_desc mlx75027 = {
+	.init_cfg = mlx7502x_75027_init_cfg,
+	.init_cfg_size = ARRAY_SIZE(mlx7502x_75027_init_cfg),
+	.link_freq_cfg = &mlx75027_link_freq_cfg,
+	.width = VGA_WIDTH,
+	.height = VGA_HEIGHT,
+};
+
+static const struct mlx7502x_regval_list mlx7502x_75026_init_cfg[] = {
+	{ 0x477c, 0x0a }, { 0x477d, 0xd4 }, { 0x4964, 0x00 }, { 0x4965, 0xa0 },
+	{ 0x4967, 0xa1 }, { 0x4994, 0x00 }, { 0x4995, 0xa0 }, { 0x4997, 0xa1 },
+	{ 0x49c9, 0x78 }, { 0x49d3, 0x3c }, { 0x49d9, 0x76 }, { 0x49e3, 0x3f },
+	{ 0x49ec, 0x00 }, { 0x49ed, 0xa0 }, { 0x49ef, 0xa1 }, { 0x4a09, 0x3c },
+	{ 0x4a0f, 0x78 }, { 0x4a15, 0x3c }, { 0x4a1b, 0x76 }, { 0x4a21, 0x3f },
+	{ 0x4a2a, 0x00 }, { 0x4a2b, 0xa0 }, { 0x4a2d, 0xa1 }, { 0x4a2f, 0x78 },
+	{ 0x4a39, 0x3c }, { 0x4a5a, 0x00 }, { 0x4a5b, 0xa0 }, { 0x4a5d, 0xa1 },
+	{ 0x4a8a, 0x00 }, { 0x4a8b, 0xa0 }, { 0x4a8d, 0xa1 }, { 0x4afe, 0x00 },
+	{ 0x4aff, 0xa0 }, { 0x4b01, 0xa1 }, { 0x4b3e, 0x00 }, { 0x4b3f, 0xa0 },
+	{ 0x4b41, 0xa1 }, { 0x4b6a, 0x00 }, { 0x4b6b, 0xa0 }, { 0x4b6d, 0xa1 },
+	{ 0x4b96, 0x00 }, { 0x4b97, 0xa0 }, { 0x4b99, 0xa1 }, { 0x4bbf, 0x1a },
+	{ 0x4bd7, 0x1a }, { 0x4bdf, 0x1a }, { 0x4bfe, 0x00 }, { 0x4bff, 0xa0 },
+	{ 0x4c01, 0xa1 }, { 0x4c07, 0x1a }, { 0x4c11, 0x1a }, { 0x4c68, 0x00 },
+	{ 0x4c69, 0xa0 }, { 0x4c6b, 0xa1 }, { 0x4c7e, 0x00 }, { 0x4c7f, 0xa0 },
+	{ 0x4c81, 0xa1 }, { 0x4c8a, 0x01 }, { 0x4c8b, 0x35 }, { 0x4d02, 0x07 },
+	{ 0x4d03, 0xc9 }, { 0x4d08, 0x06 }, { 0x4d09, 0x9b }, { 0x4d0a, 0x07 },
+	{ 0x4d0b, 0xae }, { 0x4d0e, 0x07 }, { 0x4d0f, 0xc9 }, { 0x4d14, 0x06 },
+	{ 0x4d15, 0x98 }, { 0x4d16, 0x07 }, { 0x4d17, 0xb1 }, { 0x4d28, 0x06 },
+	{ 0x4d29, 0xa4 }, { 0x4d2b, 0xa9 }, { 0x4d2e, 0x07 }, { 0x4d2f, 0xc9 },
+	{ 0x4d3a, 0x07 }, { 0x4d3b, 0xc9 }, { 0x4d5a, 0x07 }, { 0x4d5b, 0xc9 },
+	{ 0x4d60, 0x06 }, { 0x4d61, 0x9b }, { 0x4d62, 0x07 }, { 0x4d63, 0xae },
+	{ 0x4d66, 0x07 }, { 0x4d67, 0xc9 }, { 0x4d6c, 0x06 }, { 0x4d6d, 0x98 },
+	{ 0x4d6e, 0x07 }, { 0x4d6f, 0xb1 }, { 0x4d83, 0xa9 }, { 0x4d88, 0x06 },
+	{ 0x4d89, 0xa4 }, { 0x4d8a, 0x07 }, { 0x4d8b, 0xae }, { 0x4d8c, 0x1f },
+	{ 0x4d8d, 0xff }, { 0x4d8e, 0x1f }, { 0x4d8f, 0xff }, { 0x4d90, 0x06 },
+	{ 0x4d91, 0xa4 }, { 0x4d92, 0x07 }, { 0x4d93, 0xae }, { 0x4d94, 0x1f },
+	{ 0x4d95, 0xff }, { 0x4d96, 0x1f }, { 0x4d97, 0xff },
+};
+
+static const struct mlx7502x_link_freq_list mlx75026_link_freq_cfg = {
+	.link_freq = { 300000000, 600000000, 704000000, 800000000, 904000000, 960000000 },
+	.addr = {
+		0x100c, 0x100d, 0x1016, 0x1017, 0x1045, 0x1047,
+		0x1060, 0x1071, 0x10c3, 0x10c4, 0x10c5
+	},
+	.data = {
+		{ /* lane 2 */
+			{ 0x02, 0x58, 0x09, 0x99, 0x4b, 0x02,
+				0x01, 0x0c, 0x1c, 0x01, 0x3a }, /* 300MBps */
+			{ 0x04, 0xb0, 0x04, 0xcc, 0x4b, 0x02,
+				0x00, 0x06, 0x0f, 0x00, 0x9d }, /* 600MBps */
+			{ 0x05, 0x80, 0x04, 0x17, 0x58, 0x02,
+				0x00, 0x06, 0x0d, 0x00, 0x86 }, /* 704MBps */
+			{ 0x06, 0x40, 0x03, 0x99, 0x64, 0x02,
+				0x00, 0x06, 0x0b, 0x00, 0x75 }, /* 800MBps */
+			{ 0x07, 0x10, 0x03, 0x2f, 0x71, 0x00,
+				0x00, 0x06, 0x0a, 0x00, 0x68 }, /* 904MBps */
+			{ 0x07, 0x80, 0x03, 0x00, 0x78, 0x02,
+				0x00, 0x06, 0x0a, 0x00, 0x62 }, /* 960MBps */
+		}, { /* lane 4 */
+			{ 0x04, 0xb0, 0x09, 0x99, 0x4b, 0x02,
+				0x01, 0x0c, 0x1c, 0x01, 0x3a }, /* 300MBps */
+			{ 0x09, 0x60, 0x04, 0xcc, 0x4b, 0x02,
+				0x00, 0x06, 0x0f, 0x00, 0x9d }, /* 600MBps */
+			{ 0x0b, 0x00, 0x04, 0x17, 0x58, 0x02,
+				0x00, 0x06, 0x0d, 0x00, 0x86 }, /* 704MBps */
+			{ 0x0c, 0x80, 0x03, 0x99, 0x64, 0x02,
+				0x00, 0x06, 0x0b, 0x00, 0x75 }, /* 800MBps */
+			{ 0x0e, 0x20, 0x03, 0x2f, 0x71, 0x00,
+				0x00, 0x06, 0x0a, 0x00, 0x68 }, /* 904MBps */
+			{ 0x0f, 0x00, 0x03, 0x00, 0x78, 0x00,
+				0x00, 0x06, 0x0a, 0x00, 0x62 }, /* 960MBps */
+		},
+	},
+	.hmax = {
+		{ /* lane 2 */
+			{ 0x0878, 0x0e80 }, /* 300MBps */
+			{ 0x0450, 0x0754 }, /* 600MBps */
+			{ 0x03b2, 0x0644 }, /* 704MBps */
+			{ 0x0344, 0x0586 }, /* 800MBps */
+			{ 0x02ea, 0x0514 }, /* 904MBps */
+			{ 0x02be, 0x0514 }, /* 960MBps */
+		}, { /* lane 4 */
+			{ 0x0560, 0x0860 }, /* 300MBps */
+			{ 0x02c4, 0x0444 }, /* 600MBps */
+			{ 0x02b6, 0x03a8 }, /* 704MBps */
+			{ 0x02b6, 0x033a }, /* 800MBps */
+			{ 0x02b6, 0x02e2 }, /* 904MBps */
+			{ 0x02b6, 0x02b6 }, /* 960MBps */
+		},
+	}
+};
+
+/* QVGA sensor */
+static const struct mlx7502x_sensor_desc mlx75026 = {
+	.init_cfg = mlx7502x_75026_init_cfg,
+	.init_cfg_size = ARRAY_SIZE(mlx7502x_75026_init_cfg),
+	.link_freq_cfg = &mlx75026_link_freq_cfg,
+	.width = QVGA_WIDTH,
+	.height = QVGA_HEIGHT,
+};
+
+static const struct mlx7502x_binning_mode binning_mode[] = {
+	{ .reg_value = 0, .ratio = 1, .width_step = 4, .height_step = 2,
+	  .width_min = 8, .height_min = 2 },
+	{ .reg_value = 1, .ratio = 2, .width_step = 8, .height_step = 2,
+	  .width_min = 16, .height_min = 2 },
+	{ .reg_value = 2, .ratio = 4, .width_step = 16, .height_step = 4,
+	  .width_min = 32, .height_min = 4 },
+	{ .reg_value = 3, .ratio = 8, .width_step = 32, .height_step = 8,
+	  .width_min = 64, .height_min = 8 },
+};
+
+static const struct mlx7502x_fmod_list mlx7502x_fmod_cfg[] = {
+	{ .fmod = 100, .divselpre = 0, .divsel = 0, },
+	{ .fmod = 75,  .divselpre = 0, .divsel = 0, },
+	{ .fmod = 74,  .divselpre = 1, .divsel = 0, },
+	{ .fmod = 51,  .divselpre = 1, .divsel = 0, },
+	{ .fmod = 50,  .divselpre = 0, .divsel = 1, },
+	{ .fmod = 38,  .divselpre = 0, .divsel = 1, },
+	{ .fmod = 37,  .divselpre = 1, .divsel = 1, },
+	{ .fmod = 21,  .divselpre = 1, .divsel = 1, },
+	{ .fmod = 20,  .divselpre = 0, .divsel = 2, },
+	{ .fmod = 19,  .divselpre = 0, .divsel = 2, },
+	{ .fmod = 18,  .divselpre = 1, .divsel = 2, },
+	{ .fmod = 10,  .divselpre = 1, .divsel = 2, },
+	{ .fmod = 9,   .divselpre = 2, .divsel = 2, },
+	{ .fmod = 5,   .divselpre = 2, .divsel = 2, },
+	{ .fmod = 4,   .divselpre = 3, .divsel = 2, },
+};
+
+static const struct mlx7502x_regval_list mlx7502x_hw_trigger_cfg[] = {
+	{ 0x2020, 0x00 }, { 0x2100, 0x00 }, { 0x2f05, 0x07 },
+	{ 0x2f06, 0x00 }, { 0x2f07, 0x00 }, { 0x3071, 0x03 },
+};
+
+static const struct mlx7502x_regval_list mlx7502x_sw_trigger_cfg[] = {
+	{ 0x2020, 0x01 }, { 0x2f05, 0x01 }, { 0x2f06, 0x09 },
+	{ 0x2f07, 0x7a }, { 0x3071, 0x00 },
+};
+
+static const char * const mlx7502x_ctrl_trigger_mode[] = {
+	[MLX7502X_SOFTWARE]	= "Software",
+	[MLX7502X_HARDWARE]	= "Hardware",
+	[MLX7502X_CONTINUOUS]	= "Continuous",
+};
+
+static const char * const mlx7502x_ctrl_output[] = {
+	[MLX7502X_AMB] = "A minus B",
+	[MLX7502X_APB] = "A plus B",
+	[MLX7502X_RAW_A] = "Raw A",
+	[MLX7502X_RAW_B] = "Raw B",
+	[MLX7502X_RAW_ANB] = "Raw A and Raw B",
+};
+
+static const u16 mlx7502x_ctrl_phase_sequence[] = {
+	0, 180, 90, 270, 0, 0, 0, 0
+};
+
+static const struct mlx7502x_regval_list mlx7502x_detect_cfg[] = {
+	{ 0x1006, 0x08 }, { 0x1045, 0x78 }, { 0x1049, 0x50 }, { 0x1071, 0x06 }
+};
+
+static inline struct mlx7502x *to_mlx7502x(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mlx7502x, sd);
+}
+
+static int mlx7502x_read(struct v4l2_subdev *sd, u16 reg, u8 *val, int val_size)
+{
+	int ret;
+	unsigned char data_w[2];
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+
+	struct i2c_msg msg[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = 2,
+			.buf = data_w,
+		}, {
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = val_size,
+			.buf = val,
+		}
+	};
+
+	/* write reg address into first msg */
+	put_unaligned_be16(reg, data_w);
+
+	/* Using transfer allows skip STOP between messages
+	 * so we have repeated Start here
+	 */
+	ret = i2c_transfer(client->adapter, msg, 2);
+
+	return ret != 2 ? -EIO : 0;
+}
+
+static int mlx7502x_write(struct v4l2_subdev *sd, u8 *data, u32 data_size)
+{
+	int ret;
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+
+	dev_dbg(&client->dev, "%*ph\n", data_size, data);
+
+	ret = i2c_master_send(client, data, data_size);
+	if (ret < 0) {
+		dev_dbg(&client->dev, "%s: i2c write error, reg: 0x%x%x\n",
+			__func__, data[0], data[1]);
+
+		return ret;
+	}
+
+	return ret != data_size ? -EIO : 0;
+}
+
+static int mlx7502x_write8(struct v4l2_subdev *sd, u16 reg, u8 val)
+{
+	unsigned char data[3];
+
+	put_unaligned_be16(reg, data);
+	data[2] = val;
+
+	return mlx7502x_write(sd, data, 3);
+}
+
+static int mlx7502x_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
+{
+	unsigned char data[4];
+
+	put_unaligned_be16(reg, data);
+	put_unaligned_be16(val, data + 2);
+
+	return mlx7502x_write(sd, data, 4);
+}
+
+static int mlx7502x_write24(struct v4l2_subdev *sd, u16 reg, u32 val)
+{
+	unsigned char data[5];
+
+	put_unaligned_be16(reg, data);
+	put_unaligned_be24(val, data + 2);
+
+	return mlx7502x_write(sd, data, 5);
+}
+
+static int mlx7502x_write32(struct v4l2_subdev *sd, u16 reg, u32 val)
+{
+	unsigned char data[6];
+
+	put_unaligned_be16(reg, data);
+	put_unaligned_be32(val, data + 2);
+
+	return mlx7502x_write(sd, data, 6);
+}
+
+static int mlx7502x_write_regval(struct v4l2_subdev *sd,
+				 const struct mlx7502x_regval_list *regs, int array_size)
+{
+	int i, ret;
+
+	for (i = 0; i < array_size; i++) {
+		ret = mlx7502x_write8(sd, regs[i].addr, regs[i].data);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mlx7502x_write_array(struct v4l2_subdev *sd, const u16 *reg, const u8 *data, int size)
+{
+	int i, ret;
+
+	for (i = 0; i < size; i++) {
+		ret = mlx7502x_write8(sd, reg[i], data[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * *********************************************************************************
+ *  PM
+ * *********************************************************************************
+ */
+static int mlx7502x_init(struct v4l2_subdev *sd)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	int ret;
+
+	ret = mlx7502x_write_regval(sd, mlx7502x_common_init_cfg,
+				    ARRAY_SIZE(mlx7502x_common_init_cfg));
+	if (ret < 0) {
+		dev_err(sensor->dev, "failed to write init_cfg\n");
+		return ret;
+	}
+
+	ret = mlx7502x_write_regval(sd, sensor->cur_desc->init_cfg,
+				    sensor->cur_desc->init_cfg_size);
+	if (ret < 0) {
+		dev_err(sensor->dev, "failed to write sensor specific init_cfg\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int mlx7502x_power_on(struct mlx7502x *sensor)
+{
+	int ret;
+
+	gpiod_set_value_cansleep(sensor->reset, 0);
+
+	ret = regulator_bulk_enable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
+	if (ret) {
+		dev_err(sensor->dev, "Failed to enable supply: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(sensor->xclk);
+	if (ret) {
+		dev_err(sensor->dev, "Failed to enable external clock: %d\n", ret);
+		goto fail_clk;
+	}
+
+	gpiod_set_value_cansleep(sensor->reset, 1);
+	msleep(MLX7502X_RESET_DELAY_MS);
+
+	dev_dbg(sensor->dev, "power on\n");
+
+	return 0;
+
+fail_clk:
+	regulator_bulk_disable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
+	return ret;
+}
+
+static int mlx7502x_power_off(struct mlx7502x *sensor)
+{
+	gpiod_set_value_cansleep(sensor->reset, 0);
+
+	clk_disable_unprepare(sensor->xclk);
+
+	regulator_bulk_disable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
+
+	dev_dbg(sensor->dev, "power off\n");
+
+	return 0;
+}
+
+static int __maybe_unused mlx7502x_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	int ret;
+
+	ret = mlx7502x_power_on(sensor);
+	if (ret)
+		return ret;
+
+	return mlx7502x_init(sd);
+}
+
+static int __maybe_unused mlx7502x_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+
+	mlx7502x_power_off(sensor);
+
+	return 0;
+}
+
+/*
+ * *********************************************************************************
+ *  Subdev operations
+ * *********************************************************************************
+ */
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int mlx7502x_get_register(struct v4l2_subdev *sd,
+				 struct v4l2_dbg_register *reg)
+{
+	u8 val[4];
+	int ret;
+
+	/* v4l2-dbg set it to 0 */
+	if (reg->size == 0)
+		reg->size = 1;
+
+	ret = mlx7502x_read(sd, reg->reg & 0xffff, val, reg->size);
+	if (ret < 0)
+		return ret;
+
+	if (reg->size == 1)
+		reg->val = val[0];
+	else if (reg->size == 2)
+		reg->val = get_unaligned_be16(val);
+	else if (reg->size == 3)
+		reg->val = get_unaligned_be24(val);
+	else if (reg->size == 4)
+		reg->val = get_unaligned_be32(val);
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mlx7502x_set_register(struct v4l2_subdev *sd,
+				 const struct v4l2_dbg_register *reg)
+{
+	if (reg->size <= 1)
+		return mlx7502x_write8(sd, reg->reg & 0xffff, reg->val);
+	else if (reg->size == 2)
+		return mlx7502x_write16(sd, reg->reg & 0xffff, reg->val);
+	else if (reg->size == 3)
+		return mlx7502x_write24(sd, reg->reg & 0xffff, reg->val);
+	else if (reg->size == 4)
+		return mlx7502x_write32(sd, reg->reg & 0xffff, reg->val);
+
+	return -EINVAL;
+}
+#endif
+
+/* from us into sensor ticks */
+static unsigned int mlx7502x_from_us(struct mlx7502x *sensor, u32 us)
+{
+	return DIV_ROUND_CLOSEST(us * MLX7502X_CLK_RATE_MHZ, sensor->hmax);
+}
+
+static unsigned int mlx7502x_to_us(struct mlx7502x *sensor, u32 reg)
+{
+	return DIV_ROUND_CLOSEST(reg * sensor->hmax, MLX7502X_CLK_RATE_MHZ);
+}
+
+static int mlx7502x_set_link_freq(struct mlx7502x *sensor)
+{
+	struct v4l2_subdev *sd = &sensor->sd;
+	const struct mlx7502x_link_freq_list *lfc = sensor->cur_desc->link_freq_cfg;
+	struct v4l2_mbus_config_mipi_csi2 *bus = &sensor->ep.bus.mipi_csi2;
+	u8 lane_n = bus->num_data_lanes;
+	u32 pretime;
+	int ret;
+
+	/* lane */
+	ret = mlx7502x_write8(sd, MLX7502X_DATA_LANE_CONFIG_REG, lane_n - 1);
+	if (ret < 0)
+		return ret;
+
+	/* link freq */
+	ret = mlx7502x_write_array(sd, lfc->addr,
+				   lfc->data[lane_n >> 2][sensor->link_freq->val],
+				   MLX7502X_LINK_FREQ_REG_N);
+	if (ret < 0)
+		return ret;
+
+	/* clock continuous mode if MIPI receiver requires it */
+	ret = mlx7502x_write8(sd, MLX7502X_CONTINUOUS_REG,
+			      bus->flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ? 1u : 0u);
+	if (ret < 0)
+		return ret;
+
+	ret = mlx7502x_write16(sd, MLX7502X_HMAX_REG, sensor->hmax);
+	if (ret < 0)
+		return ret;
+
+	/* timings which depends on hmax and mipi config */
+	ret = mlx7502x_write8(sd, MLX7502X_PLLSETUP_REG,
+			      mlx7502x_from_us(sensor, MLX7502X_PLLSETUP_US)
+			      + MLX7502X_PLLSETUP_TICKS);
+	if (ret < 0)
+		return ret;
+
+	pretime = mlx7502x_from_us(sensor, MLX7502X_PRETIME_US);
+	ret = mlx7502x_write16(sd, MLX7502X_PRETIME_REG, pretime);
+	if (ret < 0)
+		return ret;
+
+	return mlx7502x_write24(sd, MLX7502X_RANDNM0_REG,
+				pretime * sensor->hmax - 1070 - 2098);
+}
+
+static int mlx7502x_update_output_format(struct mlx7502x *sensor)
+{
+	struct v4l2_rect *crop = &sensor->crop;
+	struct v4l2_subdev *sd = &sensor->sd;
+	int ret;
+
+	ret = mlx7502x_write16(sd, MLX7502X_COLUMN_START_REG, crop->left + 1u);
+	if (ret < 0)
+		return ret;
+	ret = mlx7502x_write16(sd, MLX7502X_COLUMN_LEN_REG, crop->width);
+	if (ret < 0)
+		return ret;
+	ret = mlx7502x_write16(sd, MLX7502X_ROW_START_REG, MLX7502X_ROW_START(crop->top));
+	if (ret < 0)
+		return ret;
+	ret = mlx7502x_write16(sd, MLX7502X_ROW_END_REG,
+			       MLX7502X_ROW_END(crop->top, crop->height));
+	if (ret < 0)
+		return ret;
+	ret = mlx7502x_write8(sd, MLX7502X_BINNING_REG,
+			      sensor->binning_mode->reg_value);
+	if (ret < 0)
+		return ret;
+	ret = mlx7502x_write8(sd, MLX7502X_OUTPUT_MODE_REG, sensor->output_mode->val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int mlx7502x_sw_trigger(struct mlx7502x *sensor)
+{
+	return mlx7502x_write8(&sensor->sd, MLX7502X_SW_TRIGGER_REG, MLX7502X_SW_TRIGGER_TRIG);
+}
+
+static int mlx7502x_sw_trigger_start(struct mlx7502x *sensor)
+{
+	/* this func is called once after streaming was enabled
+	 * we need to skip first trigger as the frame is already generated,
+	 * when streaming was enabled
+	 */
+	sensor->trigger = mlx7502x_sw_trigger;
+	return 0;
+}
+
+static int mlx7502x_hw_trigger(struct mlx7502x *sensor)
+{
+	gpiod_set_value_cansleep(sensor->trig, 0);
+	usleep_range(MLX7502X_TRIGGER_DELAY_US, MLX7502X_TRIGGER_DELAY_US + 10);
+	gpiod_set_value_cansleep(sensor->trig, 1);
+
+	return 0;
+}
+
+static int mlx7502x_cont_trigger(struct mlx7502x *sensor)
+{
+	return -1; /* in continuous mode, we can't use trigger */
+}
+
+static int mlx7502x_check_frame_interval(struct mlx7502x *sensor, struct v4l2_fract fi)
+{
+	u32 req_fi_us, min_fi_us, readout_ticks;
+	int fi_register = 0;
+
+	if (fi.denominator != 0) {
+		readout_ticks = MLX7502X_ROW_END(sensor->crop.top, sensor->crop.height)
+				- MLX7502X_ROW_START(sensor->crop.top) + 1;
+		min_fi_us = MLX7502X_PLLSETUP_US
+			    + mlx7502x_to_us(sensor, MLX7502X_PLLSETUP_TICKS)
+			    + (mlx7502x_to_us(sensor, readout_ticks + MLX7502X_FRAME_ADD_TICKS)
+			       + MLX7502X_PRETIME_US + sensor->tint->val)
+			      * sensor->phase_number->val;
+
+		req_fi_us = MICRO * fi.numerator / fi.denominator;
+
+		if (req_fi_us < min_fi_us) {
+			dev_err(sensor->dev, "Too small frame interval: min = %dus, requested = %dus\n",
+				min_fi_us, req_fi_us);
+			return -EINVAL;
+		}
+
+		fi_register = mlx7502x_from_us(sensor, req_fi_us);
+	}
+
+	return fi_register;
+}
+
+static int mlx7502x_set_trigger_mode(struct mlx7502x *sensor)
+{
+	int ret;
+	struct v4l2_subdev *sd = &sensor->sd;
+	int frame_interval = 0;
+	enum mlx7502x_trigger_mode mode = sensor->trigger_mode->val;
+
+	switch (mode) {
+	case MLX7502X_SOFTWARE:
+		ret = mlx7502x_write_regval(sd, mlx7502x_sw_trigger_cfg,
+					    ARRAY_SIZE(mlx7502x_sw_trigger_cfg));
+		if (ret < 0)
+			break;
+
+		ret = mlx7502x_write8(sd, MLX7502X_SW_TRIGGER_REG, MLX7502X_SW_TRIGGER_DEFAULT);
+		sensor->trigger = mlx7502x_sw_trigger_start;
+
+		break;
+	case MLX7502X_HARDWARE:
+		ret = mlx7502x_write_regval(sd, mlx7502x_hw_trigger_cfg,
+					    ARRAY_SIZE(mlx7502x_hw_trigger_cfg));
+		sensor->trigger = mlx7502x_hw_trigger;
+		break;
+	case MLX7502X_CONTINUOUS:
+		ret = mlx7502x_check_frame_interval(sensor, sensor->frame_interval);
+		if (ret < 0)
+			break;
+
+		frame_interval = ret;
+		ret = mlx7502x_write_regval(sd, mlx7502x_sw_trigger_cfg,
+					    ARRAY_SIZE(mlx7502x_sw_trigger_cfg));
+		if (ret < 0)
+			break;
+
+		ret = mlx7502x_write8(sd, MLX7502X_SW_TRIGGER_REG, MLX7502X_SW_TRIGGER_CONT);
+		sensor->trigger = mlx7502x_cont_trigger;
+		break;
+	default:
+		/* should not be there */
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return mlx7502x_write32(sd, MLX7502X_FRAME_TIME_REG, frame_interval);
+}
+
+static int mlx7502x_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	int ret;
+
+	mutex_lock(&sensor->lock);
+
+	if (on && !sensor->streaming) {
+		ret = pm_runtime_resume_and_get(sensor->dev);
+		if (ret < 0) {
+			mutex_unlock(&sensor->lock);
+			return ret;
+		}
+
+		ret = __v4l2_ctrl_handler_setup(sd->ctrl_handler);
+		if (ret < 0)
+			goto error_stream;
+		/* the registers below depends on hmax, which is configured in controls */
+		ret = mlx7502x_set_link_freq(sensor);
+		if (ret < 0)
+			goto error_stream;
+		ret = mlx7502x_update_output_format(sensor);
+		if (ret < 0)
+			goto error_stream;
+		ret = mlx7502x_set_trigger_mode(sensor);
+		if (ret < 0)
+			goto error_stream;
+
+		ret = mlx7502x_write8(sd, MLX7502X_STREAM_EN_REG, 1u);
+		if (ret < 0)
+			goto error_stream;
+
+		sensor->streaming = 1u;
+		dev_dbg(sensor->dev, "stream enabled\n");
+
+		/* we need to wait to stabilize the system after streaming on */
+		usleep_range(MLX7502X_STREAMING_DELAY_US, MLX7502X_STREAMING_DELAY_US + 10);
+
+		gpiod_set_value_cansleep(sensor->leden, 1);
+	} else if (!on && sensor->streaming) {
+		gpiod_set_value_cansleep(sensor->leden, 0);
+
+		sensor->streaming = 0u;
+		ret = mlx7502x_write8(sd, MLX7502X_STREAM_EN_REG, 0u);
+		dev_dbg(sensor->dev, "stream disabled\n");
+
+		pm_runtime_mark_last_busy(sensor->dev);
+		pm_runtime_put_autosuspend(sensor->dev);
+	}
+
+	mutex_unlock(&sensor->lock);
+	return ret;
+
+error_stream:
+	pm_runtime_put(sensor->dev);
+	mutex_unlock(&sensor->lock);
+	return ret;
+}
+
+static int mlx7502x_get_frame_interval(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_frame_interval *fi)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+
+	fi->interval = sensor->frame_interval;
+
+	return 0;
+}
+
+static int mlx7502x_set_frame_interval(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_frame_interval *frame_interval)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	int fi_register;
+	int ret = 0;
+
+	mutex_lock(&sensor->lock);
+
+	if (sensor->trigger_mode->val != MLX7502X_CONTINUOUS) {
+		dev_err(sensor->dev, "Can't change frame interval in non countinuous mode\n");
+		ret = -EINVAL;
+		goto unlock_mut;
+	}
+
+	fi_register = mlx7502x_check_frame_interval(sensor, frame_interval->interval);
+	if (fi_register < 0) {
+		ret = fi_register;
+		goto unlock_mut;
+	}
+
+	sensor->frame_interval = frame_interval->interval;
+	if (!pm_runtime_get_if_in_use(sensor->dev))
+		goto unlock_mut;
+
+	ret = mlx7502x_write32(sd, MLX7502X_FRAME_TIME_REG, fi_register);
+	pm_runtime_put_autosuspend(sensor->dev);
+
+unlock_mut:
+	mutex_unlock(&sensor->lock);
+	return ret;
+}
+
+static int mlx7502x_fill_format(struct mlx7502x *sensor,
+				struct v4l2_mbus_framefmt *format,
+				struct v4l2_rect *src_compose)
+{
+	int width_double;
+
+	mutex_lock(&sensor->lock);
+
+	width_double = sensor->output_mode->val == MLX7502X_RAW_ANB ? 2 : 1;
+
+	memset(format, 0, sizeof(*format));
+	format->code = MEDIA_BUS_FMT_Y12_1X12;
+	format->width = width_double * src_compose->width;
+	format->height = src_compose->height;
+	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_RAW;
+	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	mutex_unlock(&sensor->lock);
+
+	return 0;
+}
+
+static int mlx7502x_init_cfg(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+
+	/* copying active into try */
+	sd_state->pads->try_crop = sensor->crop;
+	sd_state->pads->try_compose = sensor->compose;
+	return mlx7502x_fill_format(sensor, &sd_state->pads->try_fmt, &sensor->compose);
+}
+
+static int mlx7502x_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_Y12_1X12;
+
+	return 0;
+}
+
+static int mlx7502x_set_get_format(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *format)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	struct v4l2_rect *src_compose;
+
+	if (format->pad != 0)
+		return -EINVAL;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		src_compose = &sd_state->pads->try_compose;
+	else
+		src_compose = &sensor->compose;
+
+	return mlx7502x_fill_format(sensor, &format->format, src_compose);
+}
+
+static int mlx7502x_round(u32 flags, u32 val, u32 max, u32 min, u32 step)
+{
+	u32 rounded;
+
+	/* using round_* as step is always power of 2 */
+	if (flags & V4L2_SEL_FLAG_LE)
+		rounded = round_down(val, step);
+	else
+		rounded = round_up(val, step);
+
+	return clamp(rounded, min, max);
+}
+
+static const struct mlx7502x_binning_mode *mlx7502x_find_binning_mode(struct v4l2_rect *dst_crop,
+								      struct v4l2_rect *dst_compose)
+{
+	int i;
+	const struct mlx7502x_binning_mode *bin_mode;
+	u8 ratio = dst_crop->width / dst_compose->width;
+
+	for (i = 0; i < ARRAY_SIZE(binning_mode); i++) {
+		bin_mode = &binning_mode[i];
+
+		if (bin_mode->ratio == ratio)
+			break;
+	}
+
+	return bin_mode;
+}
+
+static void mlx7502x_set_crop(struct mlx7502x *sensor,
+			      struct v4l2_subdev_selection *sel,
+			      struct v4l2_rect *dst_crop,
+			      struct v4l2_rect *dst_compose,
+			      const struct mlx7502x_binning_mode *bin_mode)
+{
+	u32 w, h;
+
+	/* cropping will always be in native size, even if binning was applied */
+	w = sensor->cur_desc->width;
+	h = sensor->cur_desc->height;
+
+	sel->r.width = mlx7502x_round(sel->flags, sel->r.width, w,
+				      bin_mode->width_min, bin_mode->width_step);
+	sel->r.left = mlx7502x_round(sel->flags, sel->r.left, w - sel->r.width,
+				     MLX7502X_LEFT_MIN, MLX7502X_LEFT_STEP);
+
+	sel->r.height = mlx7502x_round(sel->flags, sel->r.height, h,
+				       bin_mode->height_min, bin_mode->height_step);
+	sel->r.top = mlx7502x_round(sel->flags, sel->r.top, h - sel->r.height,
+				    MLX7502X_TOP_MIN, MLX7502X_TOP_STEP);
+	/* fill active or try */
+	*dst_crop = sel->r;
+	/* update binning w/h, as actual crop size could changed */
+	dst_compose->top = 0;
+	dst_compose->left = 0;
+	dst_compose->width = dst_crop->width / bin_mode->ratio;
+	dst_compose->height = dst_crop->height / bin_mode->ratio;
+}
+
+/*
+ * Binning is applied after cropping inside the sensor
+ */
+static void mlx7502x_set_compose(struct mlx7502x *sensor,
+				 struct v4l2_subdev_selection *sel,
+				 struct v4l2_rect *dst_crop,
+				 struct v4l2_rect *dst_compose)
+{
+	const struct mlx7502x_binning_mode *bin_mode;
+	u32 w, h, i, bin_w, bin_h;
+
+	w = dst_crop->width;
+	h = dst_crop->height;
+
+	/* select the best binning */
+	for (i = 0; i < ARRAY_SIZE(binning_mode); i++) {
+		bin_mode = &binning_mode[i];
+
+		if (sel->flags & V4L2_SEL_FLAG_LE) {
+			bin_w = w / bin_mode->ratio;
+			bin_h = h / bin_mode->ratio;
+		} else {/* for GE and KEEP choose lower bin_w/h */
+			bin_w = w / bin_mode[1].ratio + 1;
+			bin_h = h / bin_mode[1].ratio + 1;
+		}
+
+		if (sel->r.width >= bin_w && sel->r.height >= bin_h)
+			break;
+	}
+
+	/* save new binning config */
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		sensor->binning_mode = bin_mode;
+
+	/* update crop step and min, based on new binning */
+	sel->r = *dst_crop;
+	mlx7502x_set_crop(sensor, sel, dst_crop, dst_compose, bin_mode);
+
+	/* resulted format after applying new binning */
+	sel->r = *dst_compose;
+}
+
+static int mlx7502x_set_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	struct v4l2_rect *dst_crop, *dst_compose;
+	const struct mlx7502x_binning_mode *bin_mode;
+	int ret = 0;
+
+	if (sel->pad != 0)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
+		dst_crop = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+		dst_compose = v4l2_subdev_get_try_compose(sd, sd_state, 0);
+		bin_mode = mlx7502x_find_binning_mode(dst_crop, dst_compose);
+	} else {
+		dst_crop = &sensor->crop;
+		dst_compose = &sensor->compose;
+		bin_mode = sensor->binning_mode;
+	}
+
+	mutex_lock(&sensor->lock);
+
+	if (sel->target == V4L2_SEL_TGT_CROP)
+		mlx7502x_set_crop(sensor, sel, dst_crop, dst_compose, bin_mode);
+	else if (sel->target == V4L2_SEL_TGT_COMPOSE) /* actually this is  binning */
+		mlx7502x_set_compose(sensor, sel, dst_crop, dst_compose);
+	else
+		ret = -EINVAL;
+
+	mutex_unlock(&sensor->lock);
+
+	return ret;
+}
+
+static int mlx7502x_get_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	struct v4l2_rect *src_crop, *src_compose;
+	int ret = 0;
+
+	if (sel->pad != 0)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
+		src_crop = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+		src_compose = v4l2_subdev_get_try_compose(sd, sd_state, 0);
+	} else {
+		src_crop = &sensor->crop;
+		src_compose = &sensor->compose;
+	}
+
+	mutex_lock(&sensor->lock);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *src_crop;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = sensor->cur_desc->width;
+		sel->r.height = sensor->cur_desc->height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *src_compose;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = src_crop->width;
+		sel->r.height = src_crop->height;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&sensor->lock);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_core_ops mlx7502x_subdev_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = mlx7502x_get_register,
+	.s_register = mlx7502x_set_register,
+#endif
+};
+
+static const struct v4l2_subdev_video_ops mlx7502x_subdev_video_ops = {
+	.s_stream = mlx7502x_s_stream,
+	.g_frame_interval = mlx7502x_get_frame_interval,
+	.s_frame_interval = mlx7502x_set_frame_interval,
+};
+
+static const struct v4l2_subdev_pad_ops mlx7502x_subdev_pad_ops = {
+	.init_cfg = mlx7502x_init_cfg,
+	.enum_mbus_code = mlx7502x_enum_mbus_code,
+	.set_fmt = mlx7502x_set_get_format,
+	.get_fmt = mlx7502x_set_get_format,
+	.set_selection = mlx7502x_set_selection,
+	.get_selection = mlx7502x_get_selection,
+};
+
+static const struct v4l2_subdev_ops mlx7502x_subdev_ops = {
+	.core = &mlx7502x_subdev_core_ops,
+	.video = &mlx7502x_subdev_video_ops,
+	.pad = &mlx7502x_subdev_pad_ops,
+};
+
+/*
+ * *********************************************************************************
+ *  Controls
+ * *********************************************************************************
+ */
+static __always_inline u8 mlx7502x_phase_to_reg(u16 phase)
+{
+	/* Note:
+	 *  Sensor is working in mode when: MIX is a referance, and illumination is shifted
+	 *  To compensate it, we need to add 180 degrees
+	 */
+	if (phase != 0 && phase != 180)
+		phase = (phase + 180) % 360;
+
+	return phase / 45;
+}
+
+static int mlx7502x_set_phase_seq(struct mlx7502x *sensor, struct v4l2_ctrl *ctrl)
+{
+	int i, offset;
+	u16 *p_v;
+	u8 val;
+	u8 data[2 + (MLX7502X_PHASE_MAX_NUM >> 1)]; /* address + 4 bytes(2 phases per byte) */
+
+	/* the address */
+	put_unaligned_be16(MLX7502X_PX_PHASE_SHIFT_REG, data);
+
+	/* data itself */
+	offset = 2;
+	p_v = ctrl->p_new.p_u16;
+	for (i = 0; i < MLX7502X_PHASE_MAX_NUM; i += 2) {
+		val = FIELD_PREP(MLX7502X_NIBLE_LOW_MASK, mlx7502x_phase_to_reg(p_v[i]));
+		val |= FIELD_PREP(MLX7502X_NIBLE_HIGH_MASK, mlx7502x_phase_to_reg(p_v[i + 1]));
+
+		data[offset++] = val;
+	}
+
+	return mlx7502x_write(&sensor->sd, data, ARRAY_SIZE(data));
+}
+
+/* comparator for bsearch func */
+static int mlx7502x_fmod_cmp(const void *key, const void *elt)
+{
+	int ret = 1; /* lower then lowest */
+	u8 val = *((u8 *)key);
+	/* need prev elt for range checking, so key requires to be >= 4 */
+	struct mlx7502x_fmod_list *el = (struct mlx7502x_fmod_list *)elt - 1;
+	u8 high = el[0].fmod;
+	u8 low = el[1].fmod;
+
+	if (val > high) /* more then the highest, move to lower index */
+		ret = -1;
+	else if (val >= low) /* we are in a range */
+		ret = 0;
+
+	return ret;
+}
+
+static int mlx7502x_set_fmod(struct mlx7502x *sensor, u8 fmod)
+{
+	int ret;
+	u16 fmod_reg;
+	u8 pll_res_reg;
+	struct v4l2_subdev *sd = &sensor->sd;
+	struct mlx7502x_fmod_list *fc = bsearch(&fmod,
+						mlx7502x_fmod_cfg,
+						ARRAY_SIZE(mlx7502x_fmod_cfg),
+						sizeof(struct mlx7502x_fmod_list),
+						mlx7502x_fmod_cmp);
+
+	ret = mlx7502x_write8(sd, MLX7502X_DIVSELPRE_REG, fc->divselpre);
+	if (ret < 0)
+		return ret;
+
+	ret = mlx7502x_write8(sd, MLX7502X_DIVSEL_REG, fc->divsel);
+	if (ret < 0)
+		return ret;
+
+	fmod_reg = fmod << (fc->divselpre + fc->divsel);
+	ret = mlx7502x_write16(sd, MLX7502X_FMOD_REG, fmod_reg);
+	if (ret < 0)
+		return ret;
+
+	pll_res_reg = fmod_reg < MLX7502X_PLL_RES_THR ? 2 : 0;
+	return mlx7502x_write8(sd, MLX7502X_PLL_RES_REG, pll_res_reg);
+}
+
+static int mlx7502x_set_tint(struct mlx7502x *sensor, u16 tint)
+{
+	int i, offset;
+	u32 tint_reg = mlx7502x_from_us(sensor, tint) * sensor->hmax;
+	u8 data[2 + MLX7502X_PHASE_MAX_NUM * 4]; /* address + 32bytes(4 bytes per phase) */
+
+	/* the address */
+	put_unaligned_be16(MLX7502X_TINT0_REG, data);
+
+	/* data itself */
+	for (i = 0; i < MLX7502X_PHASE_MAX_NUM; i++) {
+		offset = 2 + i * 4;
+		put_unaligned_be32(tint_reg, data + offset);
+	}
+
+	return mlx7502x_write(&sensor->sd, data, ARRAY_SIZE(data));
+}
+
+static int mlx7502x_update_hmax(struct mlx7502x *sensor, int mipi_speed_ind, int output_mode)
+{
+	const struct mlx7502x_link_freq_list *lfc = sensor->cur_desc->link_freq_cfg;
+	int width_double = output_mode == MLX7502X_RAW_ANB ? 1 : 0;
+	u8 lane_n = sensor->ep.bus.mipi_csi2.num_data_lanes;
+	u32 tint_step;
+
+	sensor->hmax = lfc->hmax[lane_n >> 2][mipi_speed_ind][width_double];
+
+	tint_step = mlx7502x_to_us(sensor, 1);
+	return __v4l2_ctrl_modify_range(sensor->tint,
+					tint_step,
+					sensor->tint->maximum,
+					tint_step,
+					sensor->tint->default_value);
+}
+
+static int mlx7502x_hold(struct mlx7502x *sensor, u32 id, u8 hold)
+{
+	int ret = 0;
+
+	if (!sensor->streaming) /* only during streaming */
+		return 0;
+
+	switch (id) {
+	case V4L2_CID_MLX7502X_PHASE_NUMBER:
+	case V4L2_CID_MLX7502X_PHASE_SEQ:
+	case V4L2_CID_MLX7502X_FMOD:
+	case V4L2_CID_MLX7502X_TINT:
+		ret = mlx7502x_write8(&sensor->sd, MLX7502X_PARAM_HOLD_REG, hold);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int mlx7502x_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	int ret;
+	u8 val;
+	struct mlx7502x *sensor = container_of(ctrl->handler,
+					struct mlx7502x, ctrl_handler);
+	struct v4l2_subdev *sd = &sensor->sd;
+
+	if (ctrl->id != V4L2_CID_MLX7502X_TEMPERATURE)
+		return -EINVAL;
+
+	if (!pm_runtime_get_if_in_use(sensor->dev))
+		return 0;
+
+	ret = mlx7502x_read(sd, MLX7502X_TEMPERATURE_REG, &val, 1);
+	ctrl->val = val - 40;
+
+	pm_runtime_put_autosuspend(sensor->dev);
+
+	return ret;
+}
+
+static int mlx7502x_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mlx7502x *sensor = container_of(ctrl->handler,
+					struct mlx7502x, ctrl_handler);
+	struct v4l2_subdev *sd = &sensor->sd;
+	int ret = 0;
+
+	if (!pm_runtime_get_if_in_use(sensor->dev))
+		return 0;
+
+	ret = mlx7502x_hold(sensor, ctrl->id, 1);
+	if (ret < 0)
+		return ret;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MLX7502X_PHASE_NUMBER:
+		ret = mlx7502x_write8(sd, MLX7502X_PHASE_COUNT_REG, ctrl->val);
+		break;
+	case V4L2_CID_MLX7502X_PHASE_SEQ:
+		ret = mlx7502x_set_phase_seq(sensor, ctrl);
+		break;
+	case V4L2_CID_MLX7502X_FMOD:
+		ret = mlx7502x_set_fmod(sensor, ctrl->val);
+		break;
+	case V4L2_CID_MLX7502X_TINT:
+		ret = mlx7502x_set_tint(sensor, ctrl->val);
+		break;
+	case V4L2_CID_MLX7502X_TRIGGER_MODE:
+		if (ctrl->val == MLX7502X_CONTINUOUS)
+			ret = mlx7502x_check_frame_interval(sensor, sensor->frame_interval);
+		break;
+	case V4L2_CID_MLX7502X_TRIGGER:
+		ret = sensor->trigger(sensor);
+		break;
+	case V4L2_CID_MLX7502X_OUTPUT_MODE:
+		ret = mlx7502x_update_hmax(sensor,
+					   sensor->link_freq->val,
+					   ctrl->val);
+		break;
+	case V4L2_CID_LINK_FREQ:
+		ret = mlx7502x_update_hmax(sensor,
+					   ctrl->val,
+					   sensor->output_mode->val);
+		break;
+	case V4L2_CID_VFLIP:
+		ret = mlx7502x_write8(sd, MLX7502X_VFLIP_REG, ctrl->val);
+		break;
+	case V4L2_CID_HFLIP:
+		ret = mlx7502x_write8(sd, MLX7502X_HFLIP_REG, ctrl->val);
+		break;
+	default:
+		dev_err(sensor->dev, "Unknown id: %x\n", ctrl->id);
+		break;
+	}
+
+	mlx7502x_hold(sensor, ctrl->id, 0);
+	pm_runtime_put_autosuspend(sensor->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops mlx7502x_ctrl_ops = {
+	.s_ctrl = mlx7502x_s_ctrl,
+	.g_volatile_ctrl = mlx7502x_g_volatile_ctrl,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_phase_number = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_PHASE_NUMBER,
+	.name = "Number of phases",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 1,
+	.max = MLX7502X_PHASE_MAX_NUM,
+	.step = 1,
+	.def = 4,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_phase_sequence = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_PHASE_SEQ,
+	.name = "Sequence of phases",
+	.type = V4L2_CTRL_TYPE_U16,
+	.min = 0,
+	.max = 315,
+	.step = 45,
+	.def = 0,
+	.elem_size = sizeof(u16),
+	.dims = { 8 },
+};
+
+static const struct v4l2_ctrl_config mlx7502x_fmod = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_FMOD,
+	.name = "Modulation fraquency",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 4,
+	.max = 100,
+	.step = 1, /* in MHz */
+	.def = 40,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_tint = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_TINT,
+	.name = "Time integration",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 5,
+	.max = 1000,
+	.step = 1, /* in us */
+	.def = 198,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_trigger_mode = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_TRIGGER_MODE,
+	.name = "Trigger mode",
+	.type = V4L2_CTRL_TYPE_MENU,
+	.max = ARRAY_SIZE(mlx7502x_ctrl_trigger_mode) - 1,
+	.def = 2,
+	.qmenu = mlx7502x_ctrl_trigger_mode,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_trigger = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_TRIGGER,
+	.name = "Send trigger",
+	.type = V4L2_CTRL_TYPE_BUTTON,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_output_mode = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_OUTPUT_MODE,
+	.name = "Output mode",
+	.type = V4L2_CTRL_TYPE_MENU,
+	.max = ARRAY_SIZE(mlx7502x_ctrl_output) - 1,
+	.def = 0,
+	.qmenu = mlx7502x_ctrl_output,
+};
+
+static const struct v4l2_ctrl_config mlx7502x_temperature = {
+	.ops = &mlx7502x_ctrl_ops,
+	.id = V4L2_CID_MLX7502X_TEMPERATURE,
+	.name = "Temperature",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
+	.min = -40,
+	.max = 125,
+	.step = 1,
+};
+
+static int mlx7502x_link_freq_init(struct mlx7502x *sensor)
+{
+	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
+	const s64 *link_freq = sensor->cur_desc->link_freq_cfg->link_freq;
+	int i, j, link_freq_mask;
+
+	link_freq_mask = 0;
+	for (i = 0; i < sensor->ep.nr_of_link_frequencies; i++) {
+		for (j = 0; j < MLX7502X_LINK_FREQ_N; j++) {
+			if (link_freq[j] == sensor->ep.link_frequencies[i])
+				break;
+		}
+
+		if (j == MLX7502X_LINK_FREQ_N) {
+			dev_err(sensor->dev, "no link frequency %lld supported\n", link_freq[j]);
+			return -EINVAL;
+		}
+
+		link_freq_mask |= (1 << j);
+	}
+
+	sensor->link_freq = v4l2_ctrl_new_int_menu(hdl, &mlx7502x_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   MLX7502X_LINK_FREQ_N - 1,
+						   __fls(link_freq_mask),
+						   link_freq);
+
+	sensor->link_freq->menu_skip_mask = ~link_freq_mask;
+
+	return 0;
+}
+
+static int mlx7502x_ctrls_init(struct mlx7502x *sensor)
+{
+	struct v4l2_ctrl_handler *hdl;
+	struct v4l2_ctrl *ctrl;
+	int ret = 0;
+
+	hdl = &sensor->ctrl_handler;
+
+	ret = v4l2_ctrl_handler_init(hdl, 9);
+	if (ret) {
+		dev_err(sensor->dev, "Failed to init handler - %d\n", ret);
+		return ret;
+	}
+
+	ret = mlx7502x_link_freq_init(sensor);
+	if (ret)
+		goto error_ctrls;
+
+	v4l2_ctrl_new_std(hdl, &mlx7502x_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(hdl, &mlx7502x_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_custom(hdl, &mlx7502x_fmod, NULL);
+	v4l2_ctrl_new_custom(hdl, &mlx7502x_trigger, NULL);
+	v4l2_ctrl_new_custom(hdl, &mlx7502x_temperature, NULL);
+	ctrl = v4l2_ctrl_new_custom(hdl, &mlx7502x_phase_sequence, NULL);
+	/* init custom control(which has custom payload) */
+	memcpy(ctrl->p_cur.p_u16, mlx7502x_ctrl_phase_sequence,
+	       2 * ARRAY_SIZE(mlx7502x_ctrl_phase_sequence));
+
+	sensor->tint = v4l2_ctrl_new_custom(hdl, &mlx7502x_tint, NULL);
+	sensor->output_mode = v4l2_ctrl_new_custom(hdl, &mlx7502x_output_mode, NULL);
+	sensor->phase_number = v4l2_ctrl_new_custom(hdl, &mlx7502x_phase_number, NULL);
+	sensor->trigger_mode = v4l2_ctrl_new_custom(hdl, &mlx7502x_trigger_mode, NULL);
+	/* if hardware gpio is absent, then skip this config in ctrl */
+	if (!sensor->trig)
+		sensor->trigger_mode->menu_skip_mask = BIT(MLX7502X_HARDWARE);
+
+	if (hdl->error)	{
+		dev_err(sensor->dev, "Error %d while adding controls\n", hdl->error);
+		ret = hdl->error;
+		goto error_ctrls;
+	}
+
+	sensor->sd.ctrl_handler = hdl;
+	return 0;
+
+error_ctrls:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+/*
+ * *********************************************************************************
+ *  Probing
+ * *********************************************************************************
+ */
+static int mlx7502x_detect(struct v4l2_subdev *sd)
+{
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+	const struct mlx7502x_regval_list *reg;
+	int ret, i;
+	u8 val;
+
+	for (i = 0; i < ARRAY_SIZE(mlx7502x_detect_cfg); i++) {
+		reg = &mlx7502x_detect_cfg[i];
+
+		ret = mlx7502x_read(sd, reg->addr, &val, 1);
+		if (ret < 0) {
+			dev_err(sensor->dev, "Coudn't read any data\n");
+			return ret;
+		}
+
+		if (val != reg->data) {
+			dev_err(sensor->dev, "Coudn't find the sensor\n");
+			return -EIO;
+		}
+	}
+
+	ret = mlx7502x_read(sd, MLX7502X_SENSOR_ID_REG, &val, 1);
+	if (ret < 0) {
+		dev_err(sensor->dev, "Coudn't read any data\n");
+		return ret;
+	}
+
+	/* autodetect sensor type */
+	if ((val & MLX7502X_75026_ID) != 0)
+		sensor->cur_desc = &mlx75026;
+	else
+		sensor->cur_desc = &mlx75027;
+
+	return 0;
+}
+
+static int mlx7502x_parse_dt(struct mlx7502x *sensor, struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	int ret, num_data_lanes, i;
+	u32 xclk_rate;
+
+	for (i = 0; i < MLX7502X_NUM_SUPPLIES; i++)
+		sensor->supplies[i].supply = mlx7502x_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, MLX7502X_NUM_SUPPLIES,
+				      sensor->supplies);
+	if (ret)
+		return ret;
+
+	sensor->xclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(sensor->xclk)) {
+		dev_err(dev, "failed to get xclk\n");
+		return PTR_ERR(sensor->xclk);
+	}
+
+	xclk_rate = clk_get_rate(sensor->xclk);
+	if (xclk_rate != MLX7502X_XCLK_RATE) {
+		dev_err(dev, "only 8MHz clock is supported\n");
+		return -EINVAL;
+	}
+
+	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(sensor->reset)) {
+		dev_err(dev, "failed to get reset\n");
+		return PTR_ERR(sensor->reset);
+	}
+
+	sensor->leden = devm_gpiod_get_optional(dev, "melexis,leden", GPIOD_OUT_LOW);
+	if (IS_ERR(sensor->leden)) {
+		dev_err(dev, "failed to get leden\n");
+		return PTR_ERR(sensor->leden);
+	}
+
+	sensor->trig = devm_gpiod_get_optional(dev, "melexis,trig", GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->trig)) {
+		dev_err(dev, "failed to get trig\n");
+		return PTR_ERR(sensor->trig);
+	}
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &sensor->ep);
+	fwnode_handle_put(endpoint);
+	if (ret < 0) {
+		dev_err(dev, "parsing endpoint node failed\n");
+		return ret;
+	}
+
+	if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
+		ret = -EINVAL;
+		goto dt_ep_error;
+	}
+
+	num_data_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
+	if (num_data_lanes != 2 && num_data_lanes != 4) {
+		dev_err(dev, "invalid num_data_lanes, must be 2 or 4. But it was %d\n",
+			num_data_lanes);
+		ret = -EINVAL;
+		goto dt_ep_error;
+	}
+
+	if (!sensor->ep.nr_of_link_frequencies) {
+		dev_err(dev, "missing link frequencies property\n");
+		ret = -EINVAL;
+		goto dt_ep_error;
+	}
+
+	return 0;
+
+dt_ep_error:
+	v4l2_fwnode_endpoint_free(&sensor->ep);
+	return ret;
+}
+
+static int mlx7502x_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct mlx7502x *sensor;
+	struct v4l2_subdev *sd;
+	int ret;
+	bool power_en;
+
+	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->dev = dev;
+	sd = &sensor->sd;
+
+	ret = mlx7502x_parse_dt(sensor, dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_i2c_subdev_init(sd, client, &mlx7502x_subdev_ops);
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
+	if (ret < 0)
+		goto error_ep;
+
+	mutex_init(&sensor->lock);
+
+	if (id->driver_data) {	/* Chip type is already known */
+		sensor->cur_desc = (void *)id->driver_data;
+		/*
+		 * the sensor will not be powered on in this case
+		 * CONFIG_PM is required to be able to use the driver then
+		 */
+		power_en = false;
+	} else {
+		power_en = true;
+		ret = mlx7502x_power_on(sensor);
+		if (ret < 0)
+			goto error_init;
+
+		ret = mlx7502x_detect(sd);
+		if (ret < 0)
+			goto error_init;
+
+		/* we need to write map into sensor, as we power on manually */
+		ret = mlx7502x_init(sd);
+		if (ret < 0)
+			goto error_init;
+
+		/* mark that device was power on */
+		pm_runtime_set_active(dev);
+	}
+
+	/* initial configurations and controls depends on sensor type */
+	sensor->frame_interval.numerator = 1;
+	sensor->frame_interval.denominator = MLX7502X_DEFAULT_FRAME_RATE;
+	sensor->crop.top = 0;
+	sensor->crop.left = 0;
+	sensor->crop.width = sensor->cur_desc->width;
+	sensor->crop.height = sensor->cur_desc->height;
+	sensor->compose = sensor->crop;
+	sensor->binning_mode = &binning_mode[0];
+
+	ret = mlx7502x_ctrls_init(sensor);
+	if (ret < 0)
+		goto error_init;
+
+	sensor->ctrl_handler.lock = &sensor->lock;
+
+	pm_runtime_enable(dev);
+	/* increase counter wo calling power on */
+	if (power_en)
+		pm_runtime_get_noresume(dev);
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0)
+		goto error_pm;
+
+	/* configure to use autosuspend, delay 1s */
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
+	if (power_en) {
+		/* autosuspend starting from now */
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+	}
+
+	dev_dbg(dev, "Melexis ToF camera driver probed\n");
+
+	return 0;
+
+error_pm:
+	if (power_en)
+		pm_runtime_put_noidle(dev);
+
+	pm_runtime_disable(dev);
+error_init:
+	if (power_en)
+		mlx7502x_power_off(sensor);
+
+	media_entity_cleanup(&sd->entity);
+	mutex_destroy(&sensor->lock);
+error_ep:
+	v4l2_fwnode_endpoint_free(&sensor->ep);
+	return ret;
+}
+
+static int mlx7502x_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct mlx7502x *sensor = to_mlx7502x(sd);
+
+	gpiod_set_value_cansleep(sensor->leden, 0);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		mlx7502x_power_off(sensor);
+	pm_runtime_set_suspended(&client->dev);
+
+	v4l2_fwnode_endpoint_free(&sensor->ep);
+	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_ctrl_handler_free(&sensor->ctrl_handler);
+
+	media_entity_cleanup(&sensor->sd.entity);
+	mutex_destroy(&sensor->lock);
+	return 0;
+}
+
+static const struct dev_pm_ops mlx7502x_pm_ops = {
+	SET_RUNTIME_PM_OPS(mlx7502x_runtime_suspend, mlx7502x_runtime_resume, NULL)
+};
+
+static const struct of_device_id mlx7502x_of_match[] = {
+	{ .compatible = "melexis,mlx7502x", .data = 0 }, /* auto-detection */
+	{ .compatible = "melexis,mlx75026", .data = &mlx75026 },
+	{ .compatible = "melexis,mlx75027", .data = &mlx75027 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mlx7502x_of_match);
+
+static const struct i2c_device_id mlx7502x_id[] = {
+	{ "mlx7502x", (kernel_ulong_t)0 }, /* auto-detection */
+	{ "mlx75026", (kernel_ulong_t)&mlx75026 },
+	{ "mlx75027", (kernel_ulong_t)&mlx75027 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mlx7502x_id);
+
+static struct i2c_driver mlx7502x_driver = {
+	.driver = {
+		.of_match_table = of_match_ptr(mlx7502x_of_match),
+		.name = "mlx7502x",
+		.pm = &mlx7502x_pm_ops,
+	},
+	.probe = mlx7502x_probe,
+	.remove = mlx7502x_remove,
+	.id_table = mlx7502x_id,
+};
+
+module_i2c_driver(mlx7502x_driver);
+
+MODULE_AUTHOR("Andrii Kyselov <ays@melexis.com>");
+MODULE_AUTHOR("Volodymyr Kharuk <vkh@melexis.com>");
+MODULE_DESCRIPTION("A low-level driver for Melexis TOF sensors");
+MODULE_LICENSE("GPL");
-- 
BR,
Volodymyr Kharuk

