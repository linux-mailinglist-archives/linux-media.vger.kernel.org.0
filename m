Return-Path: <linux-media+bounces-37402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA69B00AB2
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE1364844CD
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1502F49F0;
	Thu, 10 Jul 2025 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lIpw7B/r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3132F49E4
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169817; cv=none; b=k7RRsjpi1jRYORYTqGXJOAU3NNYa6HCXzQ9V4JQ1nZnqyYytxGdD8vHbSgAmTBWrmZlJsGbfE37CzeN5GYpmdekAEUeRKH4i8YgY9ZqDI/1+hGCDakW+xzRVuHXgBACy7medmo+LBDOZ0UjzDHAaH4VneiQzZBTAIwxtktvuw7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169817; c=relaxed/simple;
	bh=uNk9tdawqUZf18CJHUYQ7cz30OhtszgMoM61KhuQjuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaQhqxIlFFsFtuEtVaGi9Rq6EiuR2ZaYZ0IaeJ10gCreC5bmgzsjv2F4W+mTpj4o2Yjj8Jwe9DfYMTu8d94m8BHb9yFv9+jTf9At2c1no10FIamrGnGLBSbGx5ipU+EcKxNQ2dp6bSbaaatdqliu4W9QW5mhrqc6289xjWs2AnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lIpw7B/r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9C8CD3DC;
	Thu, 10 Jul 2025 19:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169785;
	bh=uNk9tdawqUZf18CJHUYQ7cz30OhtszgMoM61KhuQjuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lIpw7B/rlSze5xVljyxYJAvaheAu4KE9vIU/wszGyTF8tpExbvoiYSm9AcxIMM2lY
	 HybXL2z7cQIpZxYGl1wCAZtfCbUAaGtLPx1nnjKrmQFs8ne/Boj8kq8pYgF5yH6c1r
	 GgBBuXGbhutNH05aNo+zy5TlZec+xLGm8xDGbMbc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH 59/72] media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:47:55 +0300
Message-ID: <20250710174808.5361-60-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/gc08a3.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/gc08a3.c b/drivers/media/i2c/gc08a3.c
index 5d38dfa9878e..11fd936db9c3 100644
--- a/drivers/media/i2c/gc08a3.c
+++ b/drivers/media/i2c/gc08a3.c
@@ -1199,16 +1199,12 @@ static int gc08a3_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gc08a3->regmap),
 				     "failed to init CCI\n");
 
-	gc08a3->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	gc08a3->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, true,
+						       GC08A3_DEFAULT_CLK_FREQ);
 	if (IS_ERR(gc08a3->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc08a3->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(gc08a3->xclk, GC08A3_DEFAULT_CLK_FREQ);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to set xclk frequency\n");
-
 	ret = gc08a3_get_regulators(dev, gc08a3);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
-- 
Regards,

Laurent Pinchart


