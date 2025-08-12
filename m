Return-Path: <linux-media+bounces-39678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB7B23B22
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2A5588606
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC0B2E5B1C;
	Tue, 12 Aug 2025 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p0CmyF+I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F822D59F7
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035271; cv=none; b=OB6Z7KZPK9lDVNR19lQUVl8bHc9l8ZwfHQfmaj9T60z54SsUcBd8YD2oIv1oOZ9C4Ia59K5zHGmC5ppnvhf6fsmtkbOPiXGhq9GlA4yY913LDZULLQc0cQla3NlsTdgdLSr/1tqATHH8naz9n5umf86sO69F/cC5VkOjQPGO6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035271; c=relaxed/simple;
	bh=KqUbD8TBG2yZkkwfm/sR8Q0GMdXn0W2gi/x8zpSPj3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzbnvvQ5qvuMf/Iiy63rhzMJnh02uZv9pKWDru7Hs8PkqsTAj78puH1/wsg5Qv2cDXMLDobgY1oGgY0h2rzr4lVkb9DwrLRlei5JthtLyku6R4/Dyaz+ifZKQfSnvQ24XlQyxsU57AdE4dQKE55xFygX0zRVhUzBS77uKwPWxz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p0CmyF+I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CBE9210D4;
	Tue, 12 Aug 2025 23:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035216;
	bh=KqUbD8TBG2yZkkwfm/sR8Q0GMdXn0W2gi/x8zpSPj3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0CmyF+IG5wyTWpAbjo8yl64c04sbke7LYOq5bCU+DqlwjHDCNaxlNXOiQqsJjant
	 7G7ftb5GmUn4lZQsADUTpUxodMUPcT7ubDYN/U8XbYZfwNqhugYOT9WMcb3K42rg1n
	 KbO0uVa8tMXkvFUjz63Z+AdP+ODm5M7wgKNg9yTs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 42/72] media: i2c: ov7251: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:50 +0300
Message-ID: <20250812214620.30425-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several camera sensor drivers access the "clock-frequency" property
directly to retrieve the external clock rate, or modify the clock rate
of the external clock programmatically. Both behaviours are valid on a
subset of ACPI platforms, but are considered deprecated on OF platforms,
and do not support ACPI platforms that implement MIPI DisCo for Imaging.
Implementing them manually in drivers is deprecated, as that can
encourage cargo-cult and lead to differences in behaviour between
drivers. Instead, drivers should use the devm_v4l2_sensor_clk_get()
helper.

This driver supports ACPI and OF platforms. The "clocks" property has
always been specified as mandatory in the DT bindings and the
"clock-frequency" property has always been optional. The driver
retrieves the clock and its rate if present, and falls back to
retrieving the rate from the "clock-frequency" property otherwise. If
the rate does not match one of the supported rates, the driver fails
probing.

If a clock is available and the "clock-frequency" property is set, the
driver sets the rate of the clock to the value of the property. It does
however use the rate initially retrieved from the clock for further
calculations, which is a bug if the rates don't match, and would prevent
the sensor from functioning properly. We can therefore assume that this
case never occurs, and that the driver behaves correctly for ACPI, and
for OF platforms that comply with the documented DT bindings.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov7251.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 31a42d81e970..27afc3fc0175 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1630,7 +1630,6 @@ static int ov7251_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
-	unsigned int rate = 0, clk_rate = 0;
 	int ret;
 	int i;
 
@@ -1646,33 +1645,12 @@ static int ov7251_probe(struct i2c_client *client)
 		return ret;
 
 	/* get system clock (xclk) */
-	ov7251->xclk = devm_clk_get_optional(dev, NULL);
+	ov7251->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov7251->xclk))
 		return dev_err_probe(dev, PTR_ERR(ov7251->xclk),
 				     "could not get xclk");
 
-	/*
-	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
-	 * ACPI. We also need to support the IPU3 case which will have both an
-	 * external clock AND a clock-frequency property.
-	 */
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &rate);
-	if (ret && !ov7251->xclk)
-		return dev_err_probe(dev, ret, "invalid clock config\n");
-
-	clk_rate = clk_get_rate(ov7251->xclk);
-	ov7251->xclk_freq = clk_rate ? clk_rate : rate;
-
-	if (ov7251->xclk_freq == 0)
-		return dev_err_probe(dev, -EINVAL, "invalid clock frequency\n");
-
-	if (!ret && ov7251->xclk) {
-		ret = clk_set_rate(ov7251->xclk, rate);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "failed to set clock rate\n");
-	}
+	ov7251->xclk_freq = clk_get_rate(ov7251->xclk);
 
 	for (i = 0; i < ARRAY_SIZE(supported_xclk_rates); i++)
 		if (ov7251->xclk_freq == supported_xclk_rates[i])
-- 
Regards,

Laurent Pinchart


