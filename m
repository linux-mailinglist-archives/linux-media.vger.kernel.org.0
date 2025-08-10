Return-Path: <linux-media+bounces-39353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB996B1FBE7
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF70D1896C98
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 19:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4061721323C;
	Sun, 10 Aug 2025 19:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="MQ8fQZLl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C420298D
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754854042; cv=none; b=DXhl8kH17xhj30Gjp1mwL1BykZY4rmWcNbnBIsw5cgserhSVxfSybL9k4yWIT5+k/lKF0RS/rABlg2+l44FR4w3z9iStafpQvEG9PCfTDTM+JcOyTIJ50ZlcIh9UDuTVnWDMJjlLEK43ypVLB3U30iTLx0GJQTnGF1O+oe6SYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754854042; c=relaxed/simple;
	bh=RNlxnd0seuykO/Mwh1Z29AtWDZbIX0t6eyel7UT27A0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mdhlNpPw/YQS46N4cOKAATl63Ym8iH4/W1TIaLcnK7KSd3IY2cr3sxmd8vSFf/jvMVZyaqQg8DF2pMQZHsGkUGGBUaXY0+TEIJXdNpOYjMkvjKbMPHKXbfeTr+wN0BGi/aYvcrn5BgpvKQAuPB1xNQR8mBjMc5a4aTtsP+u/owU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=MQ8fQZLl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7848df30cso2593079f8f.0
        for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1754854037; x=1755458837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmHyKAw9s22IMcp1HjKStD47xzX81lPnEKDcb2YFUXk=;
        b=MQ8fQZLlvx8Qokgd+7Rx1MgCPVNjpkkz90w2sq7u/0MVhfc44CtrfI6S7Rc76Q7LMy
         +tAClft+Fo0s/RLWc1HJy6eygnAYEgSJOItOQdXpc1+XPu4Rs/F0nopaz0pXl63zlqyT
         eMFtTQAKNOW3dc7S5JxI7xYjx/KWXi8SJIrGU658Upqya5M+Cl6PUd0yz6Ay/ZbW6E8q
         Gd+GYy15gjjjx0F3WQH9bE4pbgOGjNntsJEWEo1VbTemPpp3Zwu/CCjLkjOrPnv2bL2J
         XT3FXgyL2WGdzkbQ2iPcMgB4YKtZWXWsmB0eHf1a2fuI4bKhZAMsmY7HtByQYBK6g0YI
         mtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754854037; x=1755458837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmHyKAw9s22IMcp1HjKStD47xzX81lPnEKDcb2YFUXk=;
        b=gilLC1vse9V3BWNnJl01Ua32PPC6fSZ9140u7Q4XMCHMZgmx3lBXEnVqFC3RzBAAjL
         tuXRYBLEoR31fPh6tMJgYBXP3KtQAImwA4La5XZilmTorpG+yDGarusRAOT4hGbcnTtK
         Oj2Mh9ItNwz5gI0cLOKTEwfH4v6s6YZS4BxjzWVUNuS9N9uII4j8v4ea1Bu94o1VTu/Y
         Tc/k1ufqrLLLDBkD9mY8b3a5BSMlqECSoAMlAbVs3NPypUA5n0RKHByvMYXMWIyFVcjL
         cvyMs4P5WuAvnmhdM1JYl1c7h+nw4dTsuYk3qfvakqAUNnippMPKJddMTdwqcRO5GdiY
         eGTA==
X-Gm-Message-State: AOJu0Yy6kLLhKgxaoJQ7Ro574blt7h+PZjZmcDLzuDokMA43xeGkalGS
	aTByJ1hj0j+STiLtgIWRmEO5NdbHTX4UN+MIAj8Yb3i5zCJeBsNC85kWQ4iusYnwI84=
X-Gm-Gg: ASbGncsQf2She+Tn20+IwfQYoFIo6SQ9D9Gyarx5U2bQ9rrMQ4ZJsQqbRhRLxJM0hUY
	FClW2+xvxlU7IHrrs1lcxz46kbrAJHftDySYJ80hwYOUu2fm0qCJE6QaGx7vK18L/opYMpqtzYT
	QnxMjsLF+HHDJ6yKOJKHRIhaWk+utifUHf4w4wF0ZVQC8lqzzpBxTFBY2bGFSQHP6Ga2jOBI3eM
	czpNeguj+voKhNetRe5GnHMfPTsA/fKH+s3MLjqAYiqls4hqh4zki3INhmZy5qjZYV66PZ5UAFF
	iOWBsoFhBt1oyCHltwDDDalbwUVf7hSjo/Opli44+9JjaDK/+RSGv0pkxJxdMYmqPynzVjlNV/m
	Zx3aScKmLrrzkMkJg0NTaMccFcZb6qbhuuDbm9Q==
X-Google-Smtp-Source: AGHT+IGviAE/zglesLftRmgEtB3rOBkpbyAFqNVV7PODYDf05wkcIYfWi6/97o3+5TfJR6vfTCL/0g==
X-Received: by 2002:a05:6000:250e:b0:3b7:8ca6:bc15 with SMTP id ffacd0b85a97d-3b8f97f5ccfmr11730254f8f.29.1754854037313;
        Sun, 10 Aug 2025 12:27:17 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:d8d1:2f6:48b:1545])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4530a8sm37890947f8f.38.2025.08.10.12.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 12:27:17 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: [PATCH 2/2] media/i2c: Pinefeat cef168 lens control board driver
Date: Sun, 10 Aug 2025 20:26:09 +0100
Message-Id: <20250810192609.11966-3-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250810192609.11966-1-support@pinefeat.co.uk>
References: <20250810192609.11966-1-support@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Pinefeat cef168 lens control board that provides
electronic focus and aperture control for Canon EF & EF-S lenses on
non-Canon camera bodies.

Signed-off-by: Aliaksandr Smirnou <support@pinefeat.co.uk>
---
 MAINTAINERS                |   2 +
 drivers/media/i2c/Kconfig  |   8 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/cef168.c | 342 +++++++++++++++++++++++++++++++++++++
 drivers/media/i2c/cef168.h |  51 ++++++
 5 files changed, 404 insertions(+)
 create mode 100644 drivers/media/i2c/cef168.c
 create mode 100644 drivers/media/i2c/cef168.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 50dbe343ffc2..43c694461399 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19991,6 +19991,8 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
+F:	drivers/media/i2c/cef168.c
+F:	drivers/media/i2c/cef168.h
 
 PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6237fe804a5c..c4c3b03a0b98 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -791,6 +791,14 @@ config VIDEO_AK7375
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_CEF168
+	tristate "CEF168 lens control support"
+	help
+	  This is a driver for the CEF168 lens control board.
+	  The board provides an I2C interface for electronic focus
+	  and aperture control of EF and EF-S lenses. The driver
+	  integrates with the V4L2 sub-device API.
+
 config VIDEO_DW9714
 	tristate "DW9714 lens voice coil support"
 	depends on GPIOLIB
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..75a95f850f18 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_VIDEO_BT856) += bt856.o
 obj-$(CONFIG_VIDEO_BT866) += bt866.o
 obj-$(CONFIG_VIDEO_CCS) += ccs/
 obj-$(CONFIG_VIDEO_CCS_PLL) += ccs-pll.o
+obj-$(CONFIG_VIDEO_CEF168) += cef168.o
 obj-$(CONFIG_VIDEO_CS3308) += cs3308.o
 obj-$(CONFIG_VIDEO_CS5345) += cs5345.o
 obj-$(CONFIG_VIDEO_CS53L32A) += cs53l32a.o
diff --git a/drivers/media/i2c/cef168.c b/drivers/media/i2c/cef168.c
new file mode 100644
index 000000000000..eda5ad507c91
--- /dev/null
+++ b/drivers/media/i2c/cef168.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Pinefeat LLP
+
+#include <linux/crc8.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include "cef168.h"
+
+/*
+ * cef168 device structure
+ */
+struct cef168_device {
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_subdev sd;
+};
+
+static inline struct cef168_device *to_cef168(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct cef168_device, ctrls);
+}
+
+static inline struct cef168_device *sd_to_cef168(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct cef168_device, sd);
+}
+
+static int cef168_i2c_write(struct cef168_device *cef168_dev, u8 cmd, u16 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&cef168_dev->sd);
+	int retry, ret;
+
+	val = cpu_to_le16(val);
+	char tx_data[4] = { cmd, (val & 0xff), (val >> 8) };
+
+	tx_data[3] = crc8(cef168_crc8_table, tx_data, 3, CRC8_INIT_VALUE);
+
+	for (retry = 0; retry < 3; retry++) {
+		ret = i2c_master_send(client, tx_data, sizeof(tx_data));
+		if (ret == sizeof(tx_data))
+			return 0;
+		else if (ret != -EIO && ret != -EREMOTEIO)
+			break;
+	}
+
+	dev_err(&client->dev, "I2C write fail after %d retries, ret=%d\n",
+		retry, ret);
+	return -EIO;
+}
+
+static int cef168_i2c_read(struct cef168_device *cef168_dev,
+			   struct cef168_data *rx_data)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&cef168_dev->sd);
+
+	int ret = i2c_master_recv(client, (char *)rx_data,
+				  sizeof(struct cef168_data));
+	if (ret != sizeof(struct cef168_data)) {
+		dev_err(&client->dev, "I2C read fail, ret=%d\n", ret);
+		return -EIO;
+	}
+
+	u8 computed_crc = crc8(cef168_crc8_table, (const u8 *)rx_data,
+			       sizeof(struct cef168_data) - 1, CRC8_INIT_VALUE);
+	if (computed_crc != rx_data->crc8) {
+		dev_err(&client->dev,
+			"CRC mismatch calculated=0x%02X read=0x%02X\n",
+			computed_crc, rx_data->crc8);
+		return -EIO;
+	}
+
+	rx_data->moving_time = le16_to_cpu(rx_data->moving_time);
+	rx_data->focus_position_min = le16_to_cpu(rx_data->focus_position_min);
+	rx_data->focus_position_max = le16_to_cpu(rx_data->focus_position_max);
+	rx_data->focus_position_cur = le16_to_cpu(rx_data->focus_position_cur);
+	rx_data->focus_distance_min = le16_to_cpu(rx_data->focus_distance_min);
+	rx_data->focus_distance_max = le16_to_cpu(rx_data->focus_distance_max);
+
+	return 0;
+}
+
+static int cef168_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct cef168_device *dev = to_cef168(ctrl);
+	u8 cmd;
+
+	switch (ctrl->id) {
+	case V4L2_CID_FOCUS_ABSOLUTE:
+		return cef168_i2c_write(dev, INP_SET_FOCUS, ctrl->val);
+	case V4L2_CID_FOCUS_RELATIVE:
+		cmd = ctrl->val < 0 ? INP_SET_FOCUS_N : INP_SET_FOCUS_P;
+		return cef168_i2c_write(dev, cmd, abs(ctrl->val));
+	case V4L2_CID_IRIS_ABSOLUTE:
+		return cef168_i2c_write(dev, INP_SET_APERTURE, ctrl->val);
+	case V4L2_CID_IRIS_RELATIVE:
+		cmd = ctrl->val < 0 ? INP_SET_APERTURE_N : INP_SET_APERTURE_P;
+		return cef168_i2c_write(dev, cmd, abs(ctrl->val));
+	case CEF168_V4L2_CID_CUSTOM(calibrate):
+		return cef168_i2c_write(dev, INP_CALIBRATE, 0);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int cef168_get_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct cef168_device *dev = to_cef168(ctrl);
+	int rval;
+
+	if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE &&
+	    ctrl->id != CEF168_V4L2_CID_CUSTOM(data) &&
+	    ctrl->id != CEF168_V4L2_CID_CUSTOM(focus_range) &&
+	    ctrl->id != CEF168_V4L2_CID_CUSTOM(lens_id))
+		return -EINVAL;
+
+	struct cef168_data data;
+
+	rval = cef168_i2c_read(dev, &data);
+	if (rval < 0)
+		return rval;
+
+	switch (ctrl->id) {
+	case V4L2_CID_FOCUS_ABSOLUTE:
+		ctrl->val = data.focus_position_cur;
+		return 0;
+	case CEF168_V4L2_CID_CUSTOM(focus_range):
+		ctrl->p_new.p_u32[0] =
+			(u32)le32_to_cpu(((u32)data.focus_position_min << 16) |
+					 data.focus_position_max);
+		return 0;
+	case CEF168_V4L2_CID_CUSTOM(lens_id):
+		ctrl->p_new.p_u8[0] = data.lens_id;
+		return 0;
+	case CEF168_V4L2_CID_CUSTOM(data):
+		memcpy(ctrl->p_new.p_u8, &data, sizeof(data));
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct v4l2_ctrl_ops cef168_ctrl_ops = {
+	.g_volatile_ctrl = cef168_get_ctrl,
+	.s_ctrl = cef168_set_ctrl,
+};
+
+static const struct v4l2_ctrl_config cef168_lens_id_ctrl = {
+	.ops = &cef168_ctrl_ops,
+	.id = CEF168_V4L2_CID_CUSTOM(lens_id),
+	.type = V4L2_CTRL_TYPE_U8,
+	.name = "Lens ID",
+	.min = 0,
+	.max = U8_MAX,
+	.step = 1,
+	.def = 0,
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
+static const struct v4l2_ctrl_config cef168_focus_range_ctrl = {
+	.ops = &cef168_ctrl_ops,
+	.id = CEF168_V4L2_CID_CUSTOM(focus_range),
+	.type = V4L2_CTRL_TYPE_U32,
+	.name = "Focus Range",
+	.min = 0,
+	.max = U32_MAX,
+	.step = 1,
+	.def = 0,
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
+static const struct v4l2_ctrl_config cef168_data_ctrl = {
+	.ops = &cef168_ctrl_ops,
+	.id = CEF168_V4L2_CID_CUSTOM(data),
+	.type = V4L2_CTRL_TYPE_U8,
+	.name = "Data",
+	.min = 0,
+	.max = U8_MAX,
+	.step = 1,
+	.def = 0,
+	.dims = { sizeof(struct cef168_data) / sizeof(u8) },
+	.elem_size = sizeof(u8),
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
+static const struct v4l2_ctrl_config cef168_calibrate_ctrl = {
+	.ops = &cef168_ctrl_ops,
+	.id = CEF168_V4L2_CID_CUSTOM(calibrate),
+	.type = V4L2_CTRL_TYPE_BUTTON,
+	.name = "Calibrate",
+};
+
+static int cef168_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int cef168_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops cef168_int_ops = {
+	.open = cef168_open,
+	.close = cef168_close,
+};
+
+static const struct v4l2_subdev_core_ops cef168_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops cef168_ops = {
+	.core = &cef168_core_ops,
+};
+
+static void cef168_subdev_cleanup(struct cef168_device *cef168_dev)
+{
+	v4l2_async_unregister_subdev(&cef168_dev->sd);
+	v4l2_ctrl_handler_free(&cef168_dev->ctrls);
+	media_entity_cleanup(&cef168_dev->sd.entity);
+}
+
+static int cef168_init_controls(struct cef168_device *dev)
+{
+	struct v4l2_ctrl *ctrl;
+	struct v4l2_ctrl_handler *hdl = &dev->ctrls;
+	const struct v4l2_ctrl_ops *ops = &cef168_ctrl_ops;
+
+	v4l2_ctrl_handler_init(hdl, 8);
+
+	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0, S16_MAX,
+				 1, 0);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE |
+			       V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_RELATIVE, S16_MIN, S16_MAX,
+			  1, 0);
+	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_IRIS_ABSOLUTE, 0, S16_MAX,
+				 1, 0);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
+			       V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_IRIS_RELATIVE, S16_MIN, S16_MAX, 1,
+			  0);
+	v4l2_ctrl_new_custom(hdl, &cef168_calibrate_ctrl, NULL);
+	v4l2_ctrl_new_custom(hdl, &cef168_focus_range_ctrl, NULL);
+	v4l2_ctrl_new_custom(hdl, &cef168_data_ctrl, NULL);
+	v4l2_ctrl_new_custom(hdl, &cef168_lens_id_ctrl, NULL);
+
+	if (hdl->error)
+		dev_err(dev->sd.dev, "%s fail error: 0x%x\n", __func__,
+			hdl->error);
+	dev->sd.ctrl_handler = hdl;
+	return hdl->error;
+}
+
+static int cef168_probe(struct i2c_client *client)
+{
+	struct cef168_device *cef168_dev;
+	int rval;
+
+	cef168_dev =
+		devm_kzalloc(&client->dev, sizeof(*cef168_dev), GFP_KERNEL);
+	if (cef168_dev == NULL)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&cef168_dev->sd, client, &cef168_ops);
+	cef168_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+				V4L2_SUBDEV_FL_HAS_EVENTS;
+	cef168_dev->sd.internal_ops = &cef168_int_ops;
+
+	rval = cef168_init_controls(cef168_dev);
+	if (rval)
+		goto err_cleanup;
+
+	rval = media_entity_pads_init(&cef168_dev->sd.entity, 0, NULL);
+	if (rval < 0)
+		goto err_cleanup;
+
+	cef168_dev->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	rval = v4l2_async_register_subdev(&cef168_dev->sd);
+	if (rval < 0)
+		goto err_cleanup;
+
+	crc8_populate_msb(cef168_crc8_table, CEF_CRC8_POLYNOMIAL);
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
+	return 0;
+
+err_cleanup:
+	v4l2_ctrl_handler_free(&cef168_dev->ctrls);
+	media_entity_cleanup(&cef168_dev->sd.entity);
+
+	return rval;
+}
+
+static void cef168_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct cef168_device *cef168_dev = sd_to_cef168(sd);
+
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+	cef168_subdev_cleanup(cef168_dev);
+}
+
+static const struct i2c_device_id cef168_id_table[] = { { CEF168_NAME, 0 },
+							{ { 0 } } };
+MODULE_DEVICE_TABLE(i2c, cef168_id_table);
+
+static const struct of_device_id cef168_of_table[] = {
+	{ .compatible = "pinefeat,cef168" },
+	{ { 0 } }
+};
+MODULE_DEVICE_TABLE(of, cef168_of_table);
+
+static struct i2c_driver cef168_i2c_driver = {
+		.driver = {
+				.name = CEF168_NAME,
+				.of_match_table = cef168_of_table,
+		},
+		.probe = cef168_probe,
+		.remove = cef168_remove,
+		.id_table = cef168_id_table,
+};
+
+module_i2c_driver(cef168_i2c_driver);
+
+MODULE_AUTHOR("support@pinefeat.co.uk>");
+MODULE_DESCRIPTION("CEF168 lens driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/cef168.h b/drivers/media/i2c/cef168.h
new file mode 100644
index 000000000000..cdce1a19bda0
--- /dev/null
+++ b/drivers/media/i2c/cef168.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Pinefeat cef168 lens driver
+ *
+ * Copyright (c) 2025 Pinefeat LLP
+ */
+
+#ifndef CEF168_CEF168_H
+#define CEF168_CEF168_H
+
+#define CEF168_NAME "cef168"
+
+#define CEF168_V4L2_CID_CUSTOM(ctrl) \
+	((V4L2_CID_USER_BASE | 168) + custom_##ctrl)
+
+enum { custom_lens_id, custom_data, custom_focus_range, custom_calibrate };
+
+/**
+ * cef168 data structure
+ */
+struct cef168_data {
+	__u8 lens_id;
+	__u8 moving : 1;
+	__u8 calibrating : 2;
+	__u16 moving_time;
+	__u16 focus_position_min;
+	__u16 focus_position_max;
+	__u16 focus_position_cur;
+	__u16 focus_distance_min;
+	__u16 focus_distance_max;
+	__u8 crc8;
+} __packed;
+
+/*
+ * cef168 I2C protocol commands
+ */
+#define INP_CALIBRATE 0x22
+#define INP_SET_FOCUS 0x80
+#define INP_SET_FOCUS_P 0x81
+#define INP_SET_FOCUS_N 0x82
+#define INP_SET_APERTURE 0x7A
+#define INP_SET_APERTURE_P 0x7B
+#define INP_SET_APERTURE_N 0x7C
+
+#define CEF_CRC8_POLYNOMIAL 168
+
+#ifdef DECLARE_CRC8_TABLE
+DECLARE_CRC8_TABLE(cef168_crc8_table);
+#endif
+
+#endif //CEF168_CEF168_H
-- 
2.34.1


