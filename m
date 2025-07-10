Return-Path: <linux-media+bounces-37408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6000EB00AB7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2263A8E2B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F942F4A19;
	Thu, 10 Jul 2025 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RVDuwHSf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD192F4A0C
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169826; cv=none; b=Aflt6YtLaeeuLcFZwUcwjdDrD03rjsK2rSfmwhYuI4MHpRIDepJza6VLK5OjIIL4j/2p0iTDS549XGWOx/CfaQIZyLIjHeG4WnYfM0hdoQ14FKfkCFvcHa9ojI0CTx9UhQOCTETbOjeoZmLmz/zk1dk53tEkm6b8Fr8q8DEEbcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169826; c=relaxed/simple;
	bh=J57xbnd9CiJ89ZhnSDag6pJZiN2grIfnuma6dezuKkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPJOQGa/VlxwyOtemV0WDrELD8Cf+I7rHQi99ik7dM42Rp57/bs01cK6j7jr+cInXIy2BCVFSjYV87EqyTIWBJ5MYWy+ehMdGrDfATEMecvme7yDCq7Pk8rLxNsh4822/2QiOKr9Fx0K+dXKk8ZD0JmD39jrTph+1eKA8RqOeHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RVDuwHSf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 356971A9A;
	Thu, 10 Jul 2025 19:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169795;
	bh=J57xbnd9CiJ89ZhnSDag6pJZiN2grIfnuma6dezuKkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVDuwHSf28fE+EVD4ZmcgqLH8Btvxdo1tOIv2rx6e9S1vv6KB97O/sM8EpYNSVz/E
	 7eA3pO/pq3FCIsnM6Y4J76P5qcLuRKlYVJVnGxHPeEwbzW/89jJezzMyhHGh/kq8XI
	 JIWzelpiWp3MSQO2E/LqFxMxx8PZigdOF3Q1ijrs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>
Subject: [PATCH 65/72] media: i2c: ov2685: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:01 +0300
Message-ID: <20250710174808.5361-66-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. The "clocks" property has always
been specified as mandatory in the DT bindings and the "clock-frequency"
property has never been allowed. The "clocks" property has always been
set in the upstream DT sources, and the "clock-frequency" never. The
driver retrieves the clock, and sets its rate to a fixed value. This is
deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2685.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index c435799514b9..4911a4eea126 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -783,16 +783,12 @@ static int ov2685_probe(struct i2c_client *client)
 	ov2685->client = client;
 	ov2685->cur_mode = &supported_modes[0];
 
-	ov2685->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
+	ov2685->xvclk = devm_v4l2_sensor_clk_get_legacy(dev, "xvclk", true,
+							OV2685_XVCLK_FREQ);
 	if (IS_ERR(ov2685->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov2685->xvclk),
 				     "Failed to get xvclk\n");
 
-	ret = clk_set_rate(ov2685->xvclk, OV2685_XVCLK_FREQ);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set xvclk rate (24MHz)\n");
-		return ret;
-	}
 	if (clk_get_rate(ov2685->xvclk) != OV2685_XVCLK_FREQ)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
-- 
Regards,

Laurent Pinchart


