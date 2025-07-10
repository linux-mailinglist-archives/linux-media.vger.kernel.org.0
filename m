Return-Path: <linux-media+bounces-37401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F68B00AB0
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1DC3B6AAB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390142F49E9;
	Thu, 10 Jul 2025 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PLPNeVeH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382A62F199C
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169815; cv=none; b=B1b9yoS5mo6/xmuFoqwm1QC/7j6ykgv+Z9l6wcDMfleJX1mOa6xzn6sVcErymg1nttfj5ygAXn9Jn1LogMiBv72IqYsDup925vu9jHjIOAogwN52WmQkACMfSMaghUphYnpAwsdWn+BP75jt5Uuw98TJrrslX+OeeyI8beIkseE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169815; c=relaxed/simple;
	bh=enPy3nOpbJnqIlwJYkdoHvfbVXzCtykILoeh2j+eGxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Giw6VzWKhTECosjFxq7nQsRTq6C4SNiOOIB9+iD439cvALGIbH8dQnbqDbWXVDotvIyeuGsx1LLb1PtwCgQkyS5XPVgzgpIckrGtb01h0j8DtQpr4eysv1PaQkUep5mOVdd8uLR9dDNTzry006rtG2R1EBnlSrzVJ+gYoohtJw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PLPNeVeH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0113BB2B;
	Thu, 10 Jul 2025 19:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169784;
	bh=enPy3nOpbJnqIlwJYkdoHvfbVXzCtykILoeh2j+eGxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLPNeVeHR1Hu+K3eFE1VFZ+X22hyorBX8cwhyR6yi1B086IQjcqMIz+YSSj1aCxKk
	 MGBC1CMi2JrMNyX/0ezph/BAQkSdhzPlVzBBoCxpvt9V472Woxe/Erudqwxn0R/FVX
	 DoresXAfyoOHvGBMFDJPX0WAMREyIKIzxtXcM3LE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH 58/72] media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:47:54 +0300
Message-ID: <20250710174808.5361-59-laurent.pinchart@ideasonboard.com>
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
encourage copying deprecated behaviour for OF platforms in new drivers,
and lead to differences in behaviour between drivers. Instead, drivers
that need to preserve the deprecated OF behaviour should use the
devm_v4l2_sensor_clk_get_legacy() helper.

This driver supports OF platforms only. The "clocks" and
"clock-frequency" properties were initially mandatory in the DT bindings
and were both set in the upstream DT sources. The driver retrieves the
clock, retrieves and ignores the clock rate from the clock-frequency
property, and sets the clock rate to a fixed value. This is deprecated
behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/gc05a2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index 4dadd25e6c90..8ba17f80fffe 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -1235,16 +1235,12 @@ static int gc05a2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gc05a2->regmap),
 				     "failed to init CCI\n");
 
-	gc05a2->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	gc05a2->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, true,
+						       GC05A2_DEFAULT_CLK_FREQ);
 	if (IS_ERR(gc05a2->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc05a2->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(gc05a2->xclk, GC05A2_DEFAULT_CLK_FREQ);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to set xclk frequency\n");
-
 	ret = gc05a2_get_regulators(dev, gc05a2);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
-- 
Regards,

Laurent Pinchart


