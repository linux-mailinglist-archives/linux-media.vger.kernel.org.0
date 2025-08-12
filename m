Return-Path: <linux-media+bounces-39692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B817CB23B3C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D506E730E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A918E2E7163;
	Tue, 12 Aug 2025 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ph/1QPhL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA792E06EA
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035296; cv=none; b=RGKomgU1Hrin/TMt/captatiXnE9+7hOhSBGnYzUS7Jfc+k/FIgSBchtLxQjfwi4HPHWsylOCVrM9SQGDhP4UhJarCWegkTqc9c0YxCz2pOU//S4pZ+cgyClkCFlQZFbayNHj3grc5wB5GdUGUXmWGHE7Kv+R2YEhDHKeChuO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035296; c=relaxed/simple;
	bh=mJq7J8nV31F6G2mMkb4YgGBs5cQNZxd9UErbxARXrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lt3R2xU+MCUtXsGV1JbeAex9UV5JNXON/bXFRVK7lHG3O7bhs2rmhftIh/pDyFGVVAQv7dagA08/lrDWxxj4JoLCJdSAqyW9AYl6iPIxDDAr9jp6rHnmHTNWEedkPrdBCR1b69fCn0DrABLPLbVAT6O981HyZrf0ELPnbs/F0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ph/1QPhL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6FD511123;
	Tue, 12 Aug 2025 23:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035240;
	bh=mJq7J8nV31F6G2mMkb4YgGBs5cQNZxd9UErbxARXrb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ph/1QPhLvVbMSzcdaqSBACQd7T+k8jr4tgefx2l39b3J2GZuvnLJMfAZPbjfW1S1F
	 M6gkvOwWSP0Z3QdlxgbfC7AHP3G07GTufnB/X4r/ezyun/jAHZ500ENNY8abP6Dpcn
	 g5pI1cevC/AxpZ7vW9cCTNSOFCD6LrxwGcmO56Hk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 56/72] media: i2c: ov5645: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:46:04 +0300
Message-ID: <20250812214620.30425-57-laurent.pinchart@ideasonboard.com>
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
encourage copying deprecated behaviour for OF platforms in new drivers,
and lead to differences in behaviour between drivers. Instead, drivers
that need to preserve the deprecated OF behaviour should use the
devm_v4l2_sensor_clk_get_legacy() helper.

This driver supports OF platforms only. The "clocks" property has always
been specified as mandatory in the DT bindings and the "clock-frequency"
property has always been optional. Both the "clocks" and
"clock-frequency" properties are set in the upstream DT sources. The
driver retrieves the clock, retrieves the clock rate from the
"clock-frequency" property, and sets the clock rate to the retrieved
rate. If the rate does not match the expected rates, the driver fails
probing. This is deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 70b4cdb1b9af..a383e1a41b17 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1044,27 +1044,18 @@ static int ov5645_probe(struct i2c_client *client)
 				     "invalid bus type, must be CSI2\n");
 
 	/* get system clock (xclk) */
-	ov5645->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	ov5645->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, false, 0);
 	if (IS_ERR(ov5645->xclk))
 		return dev_err_probe(dev, PTR_ERR(ov5645->xclk),
 				     "could not get xclk");
 
-	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "could not get xclk frequency\n");
-
 	/* external clock must be 24MHz, allow 1% tolerance */
+	xclk_freq = clk_get_rate(ov5645->xclk);
 	if (xclk_freq < 23760000 || xclk_freq > 24240000)
 		return dev_err_probe(dev, -EINVAL,
 				     "unsupported xclk frequency %u\n",
 				     xclk_freq);
 
-	ret = clk_set_rate(ov5645->xclk, xclk_freq);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "could not set xclk frequency\n");
-
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
 		ov5645->supplies[i].supply = ov5645_supply_name[i];
 
-- 
Regards,

Laurent Pinchart


