Return-Path: <linux-media+bounces-31662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3461CAA85D3
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B00D189AC9C
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8E41991BF;
	Sun,  4 May 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmREyYqe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6069C13D
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353635; cv=none; b=h8B0b0iSFEj2xGVsXZft7iTTYkv95TmCwPCQAv98UsS5mnNJl7DKKZ9uUshfyb9MVXxewkMAP6nvWLdvJcowp2MHFovufsb/1ErbvzzEUY7WZOaBTj5UElEoYWXhKro0PNX9sZmzcGD++bC7BWYS+8+ENNThjlB4QeYGAYIi3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353635; c=relaxed/simple;
	bh=bvC0BQtfp2b9J+3XaSmjvMaLfkCLlX9XjeiHOQaAJqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MF1Ax6Y2ziceEnnyFHCrXY1fubOW97UGr24Kizi5qEMa2etfoQ469JR6D1db5V2Spb5DIhC5TdBW++r1iiHvDXPg+ZOx97iGJmhWHygzAEdGkcL8+fxAqDdMbPeiGZKOtZMQquf1hJtAcA/8VG8RmS8mIXLs1doY7O8x0HWnTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmREyYqe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wP/8r552zwJme8w/ZtyfDKRBo0lLtYbWvY6L9kruW8=;
	b=NmREyYqep3e+DtXL4/Q1xxEpx7iqQvVDb0wtu/Zau4W98OMMd9KLDyehbzDn/2nY7l4HF1
	YPEE7WWL3oz+7axgqLrB8tb/k5FsodOGE4yiVYq8xRzYEcVVbOqA0s19/P3MU8JaIk4F6w
	QbPDo8fNMtMAEUfRZIHcgYA30x5pZUc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-YHljO2YvM3uULtIyKvb61g-1; Sun,
 04 May 2025 06:13:47 -0400
X-MC-Unique: YHljO2YvM3uULtIyKvb61g-1
X-Mimecast-MFC-AGG-ID: YHljO2YvM3uULtIyKvb61g_1746353626
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8969D180048E;
	Sun,  4 May 2025 10:13:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8ABAA1800352;
	Sun,  4 May 2025 10:13:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 02/13] media: mt9m114: Add support for clock-frequency property
Date: Sun,  4 May 2025 12:13:23 +0200
Message-ID: <20250504101336.18748-3-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support for platforms that do not have a clock provider, but instead
specify the clock frequency by using the "clock-frequency" property.

E.g. ACPI platforms turn the clock on/off through ACPI power-resources
depending on the runtime-pm state, so there is no clock provider.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..be1d2ec64b89 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -377,6 +377,7 @@ struct mt9m114 {
 	struct gpio_desc *reset;
 	struct regulator_bulk_data supplies[3];
 	struct v4l2_fwnode_endpoint bus_cfg;
+	u32 clk_freq;
 
 	struct {
 		unsigned int m;
@@ -2122,14 +2123,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 
 	/* Perform a hard reset if available, or a soft reset otherwise. */
 	if (sensor->reset) {
-		long freq = clk_get_rate(sensor->clk);
 		unsigned int duration;
 
 		/*
 		 * The minimum duration is 50 clock cycles, thus typically
 		 * around 2µs. Double it to be safe.
 		 */
-		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
+		duration = DIV_ROUND_UP(2 * 50 * 1000000, sensor->clk_freq);
 
 		gpiod_set_value(sensor->reset, 1);
 		fsleep(duration);
@@ -2249,7 +2249,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
 	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
 	 */
-	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
+	sensor->pixrate = sensor->clk_freq * sensor->pll.m
 			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
 
 	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
@@ -2360,13 +2360,25 @@ static int mt9m114_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire clocks, GPIOs and regulators. */
-	sensor->clk = devm_clk_get(dev, NULL);
+	sensor->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(sensor->clk)) {
 		ret = PTR_ERR(sensor->clk);
 		dev_err_probe(dev, ret, "Failed to get clock\n");
 		goto error_ep_free;
 	}
 
+	if (sensor->clk) {
+		sensor->clk_freq = clk_get_rate(sensor->clk);
+	} else {
+		ret = fwnode_property_read_u32(dev_fwnode(dev),
+					       "clock-frequency",
+					       &sensor->clk_freq);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to read clock-freq\n");
+			goto error_ep_free;
+		}
+	}
+
 	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
-- 
2.49.0


