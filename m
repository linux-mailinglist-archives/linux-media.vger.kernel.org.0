Return-Path: <linux-media+bounces-37395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C60B00AA9
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90E313B2D2D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CDD2F4326;
	Thu, 10 Jul 2025 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rkaE53mf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D752EF9DA
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169806; cv=none; b=PyTj/0gYQ8Efm+60EIoBoLLpp34N8CHR6ULnT+oPs0xIXZVgllCxP77nqdjLfRhZuWamkG5BnrtdzHoX4WOm7RvvxSfTgA6GHC5a6cyRbZsRIB7SeLKW+G1UUxVn/g9qV8lGpBxGHTqs1+cLUB6Cy8yI6remaxp13KAyfJ2w4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169806; c=relaxed/simple;
	bh=KqUbD8TBG2yZkkwfm/sR8Q0GMdXn0W2gi/x8zpSPj3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/Mwkux9qIRFfUK2NhcaJEGrE+kEAJ3pT45BRMMkJ0edXCb4Dy7gS+cU8odSOnlZz4JZKOeA0Q1S7MvnX+uP6DrIG0XCg6xoFVNyzdR5BmsQIfvpbEtWxdMzlp/XijHyJ8NxsgahUCvGOvLvbeZSpG3P2G/nIllNhXWuOHLmAoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rkaE53mf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 35F211A9A;
	Thu, 10 Jul 2025 19:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169774;
	bh=KqUbD8TBG2yZkkwfm/sR8Q0GMdXn0W2gi/x8zpSPj3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rkaE53mfPP0JquTxpk2yxrtHghFBBfDWlopdkj1HD6rFBzXrPVzUnFIJeNbu6WIcK
	 ukcFi3DwDftb19a11NOYIF+y9PvZ2Hxs4SvoP530KBxDKHdFt0cj+raQXbsxQ7FOXt
	 I+ZAFzmCE79jFweqNKyZjjolG6PDDrv1UH/q7BGQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 52/72] media: i2c: ov7251: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:48 +0300
Message-ID: <20250710174808.5361-53-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
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


