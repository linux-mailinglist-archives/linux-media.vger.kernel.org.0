Return-Path: <linux-media+bounces-39685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD2B23B2B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76A0C5A029E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429A2E611E;
	Tue, 12 Aug 2025 21:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g7KEk/pB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D32E1C69
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035284; cv=none; b=WBWY514SvF1IU0ZOfie1JwX0JbK/qTpmMI/mCg/pad9UtcNmEhP/NSNV3E+oUTDu4dyjfChCdVOBmqGOF4IiFJUMtTp65Aa5CTVDSD7Z6/ywCS0a0B76Xbc1z9tpeUh79MxwIWAyN3XOpzuHI0nAPsHE6SxxEP86/q2ih8qhbC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035284; c=relaxed/simple;
	bh=uNk9tdawqUZf18CJHUYQ7cz30OhtszgMoM61KhuQjuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6IsHShbXyjbRrbi7+ZiR9+ft0TpIOd3LanSWYGB4m5bPzv0zxmSre3WOFC1bVCFVvGw0kAEw6t8xPP0MGuFKoIGuUuBJU4l5nMPkleH/vRvI5D/Mv6BXsXyaYl+C3ZCESpa6Ct9+zDgj2qoOmO2/5EzXN78TKHQPwp92z/qhwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g7KEk/pB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 131CA4A4;
	Tue, 12 Aug 2025 23:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035229;
	bh=uNk9tdawqUZf18CJHUYQ7cz30OhtszgMoM61KhuQjuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g7KEk/pBvaTLHwdhnhZsLVMJX9Li5MYeMtJcEh7xxQpq4vv3uuebZ9Hh82K8idray
	 6Y8TKeaOLum2k8p/kFfGhRRilPjPqsQFrph54FhYqiYwF5SUGKhgkPReem958Tidv+
	 erJFathD8xJNY6q6PpXFL+aSkeIzE/WceEo89zCA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Zhi Mao <zhi.mao@mediatek.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 49/72] media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:45:57 +0300
Message-ID: <20250812214620.30425-50-laurent.pinchart@ideasonboard.com>
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


