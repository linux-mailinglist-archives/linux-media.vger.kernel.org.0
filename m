Return-Path: <linux-media+bounces-22780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 120469E68CF
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9CA18868F0
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B621F943B;
	Fri,  6 Dec 2024 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CgcjtdZy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E651F540B;
	Fri,  6 Dec 2024 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473647; cv=none; b=XJHCn6OthmuXevoSZPpSXwDRyn25E6LQloIAr2I5YEfKT0oJvjg0pmDGkxY212xrOYLjUWCMlvzavaqcRRwN0gMefjOwf/A25R6+SVNTok5A2ED42MWi6MdLcC77nKeySe1BnEMbUoEUCwrOWyhUG08BBhoidgIxGk0fTWaaniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473647; c=relaxed/simple;
	bh=7q9AdqxzcussrLZkhgtJewGXlU51mmi9YmOjG59P03Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFS/kArE9weeSuxAC9az2vNLuXsC5XUy5Tm+M1XdNVQrU4xM71S087thEoYskffFwqjTffHkef+qtecn2bSixZyjj+qOGw8kD0l9WPa3W5RFD6TRalmRvvvNHuji5MuMOhSGzIefyF2F5ayzShDH3cHmnBhQnn8SVUD2cZ6pVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CgcjtdZy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A7A0186E;
	Fri,  6 Dec 2024 09:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473608;
	bh=7q9AdqxzcussrLZkhgtJewGXlU51mmi9YmOjG59P03Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CgcjtdZyrxbqkEHwXqPmpRXjv95SKDj/4HAY79rE0bsd2Tvd7As87nLvYSylZO2P4
	 r5BVHsWK/DjcZfbsx1e3rPbc/EPjAj2tYiufmi5v259C/ciSq7FIQbv1sJATvmbxp+
	 /Di48AFNr7w+P1jjH9q+ponXxLFsvx+KIE3Lh5SQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:42 +0200
Subject: [PATCH v4 06/15] media: i2c: ds90ub960: Use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-6-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=7q9AdqxzcussrLZkhgtJewGXlU51mmi9YmOjG59P03Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVdDSn2UNs3KgkyUGjhb9Sw7orXzey2z4CH/
 V0s1tsAHaaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XQAKCRD6PaqMvJYe
 9eQND/sHoG1UbRPMa8I7TF1cR6ZS7qnFKDwH9tUPkjNftLjMN3UbgUKXVYGQra2tfw32H8KNMxH
 EpyNO0hl/qWvb0CT7enINnJ+nbRrrjPEH6X0tkl6+qL68eJaQNP2u9CLb/0kRSSZna6+TUV46bK
 wYbjuQEEZZIRg43FnGojiqRH3Km/ja2enJTSV7Rd5lUJNpgDn/F5/2DO+TgbkMpK80fh1RYMOQk
 EyMzQphuAOdp8anv5RePX+JLml95AinMTaH8CT+0YhvLASyUiSa0XbeLQR+mbyRb6i1xWJ83x4m
 54ItJkJtXGQHS2squM2R7fLVfxOA0ttDcxd3XZ5UvrBDl9ex5RsL2xnIjGxKg/3qQmjVy+DIP5Z
 8KMxIVLoYq0ACfEum+1eI/G7vVknWQP9qAxI+TtrYMDowxng7h/7xwNjMwu8UPlCKen0DxGeHcp
 lKhPHc1ueOr6YBodpTo3WBWKgl9khM9Xy/99V66o14cr3a8G5lfR8bIgUSJihc1ij8b+gBR36+a
 cjFN3o/YEzh4zfJQbfEU/KBNPMPOaIbEY5Z8ufEZ01Pa1r93iROKnJUam+eB3ZL3hJzMAS90h6u
 dCLD7py/XWFobLxZL4MxL8HJM/6Gey+2O8epKN+FNlpTFO7gbCoGPQ2WnnbFtavYL4IqEkC0PZC
 Oe07mGf52z1LkZg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use HZ_PER_MHZ instead of 1000000U.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index bfffa14e2049..84631909635c 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -43,6 +43,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 #include <linux/workqueue.h>
 
 #include <media/i2c/ds90ub9xx.h>
@@ -52,7 +53,7 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define MHZ(v) ((u32)((v) * 1000000U))
+#define MHZ(v) ((u32)((v) * HZ_PER_MHZ))
 
 #define UB960_POLL_TIME_MS	500
 
@@ -1579,7 +1580,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 
 		if (priv->hw_data->is_ub9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
-				nport, (v * 1000000ULL) >> 8);
+				nport, ((u64)v * HZ_PER_MHZ) >> 8);
 		} else {
 			ret = ub960_rxport_get_strobe_pos(priv, nport,
 							  &strobe_pos);
@@ -1593,7 +1594,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			dev_dbg(dev,
 				"\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
 				nport, strobe_pos, eq_level,
-				(v * 1000000ULL) >> 8);
+				((u64)v * HZ_PER_MHZ) >> 8);
 		}
 	}
 
@@ -3066,7 +3067,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\trx_port_sts2 %#02x\n", v);
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v16);
-		dev_info(dev, "\tlink freq %llu Hz\n", (v16 * 1000000ULL) >> 8);
+		dev_info(dev, "\tlink freq %llu Hz\n", ((u64)v16 * HZ_PER_MHZ) >> 8);
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v16);
 		dev_info(dev, "\tparity errors %u\n", v16);
@@ -3866,7 +3867,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 
 	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
 		!!(dev_sts & BIT(4)), refclk_freq,
-		clk_get_rate(priv->refclk) / 1000000);
+		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
 
 	/* Disable all RX ports by default */
 	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);

-- 
2.43.0


