Return-Path: <linux-media+bounces-48767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA9CBCE3C
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A6A8300A360
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6CD126C03;
	Mon, 15 Dec 2025 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daqdv/HL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAE32AAAB
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785605; cv=none; b=H9Vl4nKRyaIsynrr7e7C+uxhwOMlVASH1ts+SNNyGqRaXoXNWB5AuS0Hz82A/dKz2rDv0hq4EXaO5xZqWdo4HSAaCLmXn7CQ2F0yI9SsWwlCIEOkf8RIApT9ynXLhvBjyJVQIXs/pD9R/E9uR+nexBw3kQJvEGIqKk2G4SFxipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785605; c=relaxed/simple;
	bh=S+QajaHzhMvLS2JRipW3P7MVgnRieoXf1lQPjPIplP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulb2zEZUIRemTHjeK7MuEy4iOneMplzLMXPWN57PTyTbG0b/CVllcuuQwgmyQOJmRN78HmkEvIk5ASn3Y5Je0JHLJrlaxVegxvnwTE26WFq+RDGKX10jlOkZmebkwMn84oquV+UUlHshydsJRul+2Bt2jbaw11R+IClVr9bopIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daqdv/HL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so1553772a91.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 00:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765785601; x=1766390401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVq5X5G8+PFfQeBURVXYlaXATVvipW+nlg+9mMKRKDI=;
        b=daqdv/HLak7WnGPVjzZR6Nf+fzRvhNxq0Eq/nDAKLJL95Zjr2l8DGeeW9zdF5opnJi
         Hsy8HDTiEb0o4idj4Fo/l7Da4DilITDIi89gtzPk/OJD4VK6EUrOjlAGIifERuy4QbjV
         54gppbVVs3XNUzxeQpNnekTz2yKZxZuZuLDkWMafguFOIW+8sodNCffQaGaSxELQk05S
         XDB463wk+yhJyGcBVwh4IoBpuPqrh3WGH6PNQFI1yW9XWiRyEn2+3/RFiEFobNdqHxUu
         GWWnY3RCbw8mQAtPOoxTfJnEQIdM6SMw1hzvpML8s4HdNMk0F/eh20/Rt4jQZQtcbMv6
         r2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765785601; x=1766390401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVq5X5G8+PFfQeBURVXYlaXATVvipW+nlg+9mMKRKDI=;
        b=k9soi2ml/laAQfO+JfzvrE/NaL6OK+sEbvhSRFFv4VQQuGgi/eDc1javwE0mhRmIYH
         Sa0rkif+ecwbRJtgtdwmgziCOoBK9b28RdexPrVTrE1/RvxD4zCAUdcrFJzE3MWMQyDt
         mjN8aIKNgBYd1XbLT1z+fTRrQVPvQ1EgHH/0ZKNmq6MKBMLxS6KBY9YjSIeNdKBo/AGa
         4DcUH7sHZZS1X2fpcKk3X77OmXhmUehQFnYKAugdlMmHydsJdSiLd6kKToR/SyXiCN0h
         sgSsfX8jzaxvwR4HtjYSlINnDCSxqNC77KfKtIRIFTG26+jyQVVe1fhwQ5swcjr270TO
         pd1g==
X-Forwarded-Encrypted: i=1; AJvYcCVToqy3EuDAQZhpUAbBIaXrjWZ/F9Mzl/Ex6b2NOsKU8y1+NNP3KFaMZNnZK3elJSUxZ4v0+/gboBesSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUM0JuwZ9C8LZVQH95xeFUxWW675vyIiiFWh00zundWEdFOxsQ
	3QV6oyYU+z47FBZRFgngHVShxQq7P1jhbAYp8oVgX753XUs0u2Efq2zX
X-Gm-Gg: AY/fxX6GMzkDOVNH0fKdhZ8CjIqHCSvf0mLwTcczfcFhuVnYqvUchTs7pspb5jfF1Ic
	B2GcSrSWzHWHJA0+mr9n8abcISOM6XdtQBHVMRZlxinVU7o3N6oqOM1VP0snmaZ7ahZ9UZYFdqr
	Hq1K58EKbpveC30OTXO0ck9hcZeU/gjv7Cb7zsviO5n53vYmJY3lf8xY7hcVHdmCxmlBJWQnGUh
	o9GFMLfKqud0vMomtq6mVtUDtSKyRRuZg/TO5wGkEg6P1K8WUAF0IT4hlXvGdnWeuBIJRDOa8Gi
	POyTy+OhYPQDQ01P+5oDW2o3g4psrMm/4ru+JlR3DqnYPKksPICWZxYJDtgqi2Smr7ani6rhujN
	1BPcPWCJV3MH/cRSVtMNxwEqoABRCcsrLQSyWsk3qACDhSXGKw6Aq7NZO1KYycnXLRHMrNhLneh
	FfMFxoF10tcoM=
X-Google-Smtp-Source: AGHT+IH0Z8IA6f60bMQEwqioNDR+p6dck/IMqlctISvchHLxc7gnD0PN55794kLTN3d7b9unB3b+lw==
X-Received: by 2002:a05:7022:7f07:b0:119:e56b:91ec with SMTP id a92af1059eb24-11f34bf7bf5mr5063327c88.29.1765785601105;
        Mon, 15 Dec 2025 00:00:01 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm43637473c88.12.2025.12.14.23.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:00:00 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 1/4] media: i2c: et8ek8: et8ek8_driver: add support for crc configuration via device tree
Date: Sun, 14 Dec 2025 23:58:32 -0800
Message-ID: <fca7331649892206b92f1c63aedac6050a2d8d4a.1765782992.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1765782992.git.alex.t.tran@gmail.com>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retrieve the configuration for CRC from the device tree instead
using the hard coded USE_CRC macro. If there is an issue
retrieving the endpoint node or the CRC property then the default
of 1 is used and the driver does not fail to maintain backward
compatibility.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 49 +++++++++++++++++++-----
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 2cb7b7187..4ef92359c 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -29,6 +29,7 @@
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 #include "et8ek8_reg.h"
@@ -45,6 +46,7 @@ struct et8ek8_sensor {
 	struct regulator *vana;
 	struct clk *ext_clk;
 	u32 xclk_freq;
+	u32 use_crc;
 
 	u16 version;
 
@@ -130,8 +132,6 @@ static struct et8ek8_gain {
 
 #define ET8EK8_I2C_DELAY	3	/* msec delay b/w accesses */
 
-#define USE_CRC			1
-
 /*
  * Register access helpers
  *
@@ -844,20 +844,16 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 	if (rval)
 		goto out;
 
-#ifdef USE_CRC
 	rval = et8ek8_i2c_read_reg(client, ET8EK8_REG_8BIT, 0x1263, &val);
 	if (rval)
 		goto out;
-#if USE_CRC /* TODO get crc setting from DT */
-	val |= BIT(4);
-#else
-	val &= ~BIT(4);
-#endif
+	if (sensor->use_crc)
+		val |= BIT(4);
+	else
+		val &= ~BIT(4);
 	rval = et8ek8_i2c_write_reg(client, ET8EK8_REG_8BIT, 0x1263, val);
 	if (rval)
 		goto out;
-#endif
-
 out:
 	if (rval)
 		et8ek8_power_off(sensor);
@@ -1396,6 +1392,34 @@ static int __maybe_unused et8ek8_resume(struct device *dev)
 	return __et8ek8_set_power(sensor, true);
 }
 
+static int et8ek8_parse_fwnode(struct device *dev, struct et8ek8_sensor *sensor)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CCP2,
+	};
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep) {
+		dev_warn(dev, "could not get endpoint node\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	if (ret) {
+		dev_warn(dev, "parsing endpoint node failed\n");
+		goto done;
+	}
+
+	fwnode_property_read_u32(ep, "crc", &sensor->use_crc);
+done:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	fwnode_handle_put(ep);
+	return ret;
+}
+
 static int et8ek8_probe(struct i2c_client *client)
 {
 	struct et8ek8_sensor *sensor;
@@ -1406,6 +1430,11 @@ static int et8ek8_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
+	sensor->use_crc = 1;
+	ret = et8ek8_parse_fwnode(dev, sensor);
+	if (ret)
+		dev_warn(dev, "parsing endpoint failed\n");
+
 	sensor->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(sensor->reset)) {
 		dev_dbg(&client->dev, "could not request reset gpio\n");
-- 
2.51.0


