Return-Path: <linux-media+bounces-39472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67153B2177A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B534B3A811A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730162E4278;
	Mon, 11 Aug 2025 21:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="cRkwjqFi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740782E336B
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947904; cv=none; b=O8eDv8IaeN44oBsI2+SUfKDfzZ9O8GRpMiI+8qZPQ4Rc7hVqo1Typ6vFdBmEg9UwYCYER37/39XSqiJz8YAfM/eiSo5/qVYLYyL6Bj97Mmmjp5XmOgbF3gxNSsqAua7GdYGGq9/JatDeDB6/Ml/QGfsDpA56mD3iQoO+SK/97Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947904; c=relaxed/simple;
	bh=ffr9SzJa7cXbTumlucNTIkWUH5ssDXBeVH00KWVYk54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h7aco+N6ms+RAQglFZ3gPoNfP8yzb9irITYOPt9LV5TnE+512taejlfFJ30RqjK8aZHAuseQokdllIxpDa93Twnp0Z16CkpNdnswcOdNULXfGh585pqPBLoStqRCn1IKtjr4KPyMj0jmbQMaF1T29sQmlwheB+rS4c1WBrTlWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=cRkwjqFi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b8de193b60so2757308f8f.0
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 14:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1754947900; x=1755552700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2fhfRn8Bvae5tiQX9dls8GG8o2lN99or21sd4P+jR4=;
        b=cRkwjqFiMbPsgKx1L+mNQsie2JBllnbyISsx5q+cBbCWDy3peeeDXyBeGqiCWbJy2h
         SbMcUBIJUl076AxX23GszliSEGSS27KCsZPU46nhQ9uEklsbsYkKkCg28SPlEccpD6TC
         zmrPK8f1rMRths6vwera18OACTIPt001m+evHJsSlBCylyMS4gNM/rue7HcbQ7AVvzOa
         wkpaC6KLZK5uphr/S1/ROLRD7kFX0X6uFSNPzXr1QjR7Aht0rruRgQvPnz3b2Q1ovznk
         pdLF2HEZKGHHRXd+hgLyrsPyaZyr7ypCz4PeMs2/PfLjNx/vEmLEGUM973TJ7TTMod8O
         lShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754947900; x=1755552700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2fhfRn8Bvae5tiQX9dls8GG8o2lN99or21sd4P+jR4=;
        b=bgR/VJMmK44CEZ0OGYi2ZGWsMxoRRD9bMRv7vaIXa8YuMItPTQ8yY+EwjcA3N2ChTb
         cecXcLZswa+ZLmqOryGHut2Tsq2zsyDQR4rKj70g7FM7ri4D1qhNyxexhxbNimKKV6dD
         Vmenrm+WSv7emw4Yk644MYCF7xPEcSdjF/2ZHgYEg6bqidzltwt9Upb3KkuT4VkZdgBp
         c+Qk+gJzuBbqbSTdb1zG9EFmWxGDTMjQsTn0kQYzE+UKe/SWDYTcObPV5yFxHKFGqe9n
         SUMpS7iRTbyLZ7pYqr1M98ZnwWyriOuHBwAb305a8x9f05qt2mcH24IMBsNLQ/1GnXRJ
         W0iw==
X-Forwarded-Encrypted: i=1; AJvYcCUM2H0obyxROcP2+zLeSIGcnGbD5ddjnbB92bA0bOu0AIcQw9FQ9lWJHH9CMNBQebs2+1QA3BjiSQXJ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7f4wTnmbyn+SEhINlFoO6wbHfbYbFKzVi/VQV1bcDK13yC4Y
	JloZ//dQuHSKKQCr04EuVc8Dp2YBAHLn4kU8ewTtcbG0TaTDNstUgTxF/aJH72RGzXI=
X-Gm-Gg: ASbGnctoV2p4/Rg4GlKly0w1u4GwUUegolY7/Z0lIN1YJp47QPOXcCWV08biCQ1oGaS
	nJqjYB76M/FYNv10yC+j01rVFq8QfslGa1hxvB5H8o0N971j66R1yIMEn/l8dZGkoIbECH27Kl2
	lbn6LAO5ec6VjBlnouxQogznvz0M3+BkSIpbqogBqV2JIXga8tnHM94b55YQ6UaTjUHEs00kwET
	7N7J4mdkSLhNuCGmmG4DeEYdwvaKR81uVsE+TSBlVtxiCFRfcNYnAphPNUUgmTVlzmty39wt2wY
	63+5l8MaMbBtmOWOhkoQOTK1bZavML6nKtodaNpOH7aOjfihLJQGeCNw8GbG6C4GUNCclAA/0pT
	Kq2hJXg+G5roEK1T/pxXRk8KoYRn2472oHcJHPQCuskvBG+wn
X-Google-Smtp-Source: AGHT+IG+iqBMbGzEpeHof0rjboPnFgFM0XgBYxPcKIogUeosDobZmZLrTnnogTdoV+nZLZHtgKFrEA==
X-Received: by 2002:a05:6000:2911:b0:3b7:8d70:ed05 with SMTP id ffacd0b85a97d-3b910fdb8fcmr1083173f8f.5.1754947899632;
        Mon, 11 Aug 2025 14:31:39 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:f8cb:3493:2eed:8d11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c485444sm42397387f8f.66.2025.08.11.14.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 14:31:39 -0700 (PDT)
From: Alexander Smirnov <asmirnou@pinefeat.co.uk>
X-Google-Original-From: Alexander Smirnov <aliaksandr.smirnou@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: [PATCH v2 2/2] media/i2c: Pinefeat cef168 lens control board driver
Date: Mon, 11 Aug 2025 22:31:02 +0100
Message-Id: <20250811213102.15703-3-aliaksandr.smirnou@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811213102.15703-1-aliaksandr.smirnou@gmail.com>
References: <20250811213102.15703-1-aliaksandr.smirnou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliaksandr Smirnou <support@pinefeat.co.uk>

Add support for the Pinefeat cef168 lens control board that provides
electronic focus and aperture control for Canon EF & EF-S lenses on
non-Canon camera bodies.

Signed-off-by: Aliaksandr Smirnou <support@pinefeat.co.uk>
---
 MAINTAINERS                |   2 +
 drivers/media/i2c/Kconfig  |   8 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/cef168.c | 337 +++++++++++++++++++++++++++++++++++++
 drivers/media/i2c/cef168.h |  51 ++++++
 5 files changed, 399 insertions(+)
 create mode 100644 drivers/media/i2c/cef168.c
 create mode 100644 drivers/media/i2c/cef168.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 811c6a150029..922efc000722 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19990,6 +19990,8 @@ M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
 L:	linux-media@vger.kernel.org
 S:	Supported
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
index 000000000000..db3f97e7e9dc
--- /dev/null
+++ b/drivers/media/i2c/cef168.c
@@ -0,0 +1,337 @@
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
+	cef168_dev = devm_kzalloc(&client->dev, sizeof(*cef168_dev),
+				  GFP_KERNEL);
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
+static const struct of_device_id cef168_of_table[] = {
+	{ .compatible = "pinefeat,cef168" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cef168_of_table);
+
+static struct i2c_driver cef168_i2c_driver = {
+	.driver = {
+		.name = CEF168_NAME,
+		.of_match_table = cef168_of_table,
+	},
+	.probe = cef168_probe,
+	.remove = cef168_remove,
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


