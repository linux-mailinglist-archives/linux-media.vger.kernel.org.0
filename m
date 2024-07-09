Return-Path: <linux-media+bounces-14762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A816292BB2F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 15:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8332864B5
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 13:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A0416A37C;
	Tue,  9 Jul 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vsK0Pj19"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9932615ECCD;
	Tue,  9 Jul 2024 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720531784; cv=none; b=lUgTJ163sJDQ+vDxUYgxtmmeOaNJPkeFP6CcHPjVLgBW4qL82Z4pYSxeEH8jWARFFntB8IIoCsDiE+uF+c3GKOo3HDJqhyD1yN//Nm82IS0mZf5u6XEkZdxK4y2tvEzlwBHaV4ne4CWOjv3Xk9WhWR1I51d4KljLuEK+H7vpy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720531784; c=relaxed/simple;
	bh=BIAGA/xdb813eVwYF0mDyEQotEBqAv+D1upXRs3vpLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cs2WKv6E+OOcDIgfTFzBOt3Vn0MiIi1f7EmSflMTf5mdZEZMUJICfqVprlkjsVE7j0jZ9li76/RbK9t6Skiv98X4Kuo7yyN8TNotd1i6hNNFIPQUwHwVO6WGN1UB0jznFLoa1oz6kPbenSdg78Au8YsXKY+qgnDJfddTVJMIapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vsK0Pj19; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 629ED23D0;
	Tue,  9 Jul 2024 15:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720531732;
	bh=BIAGA/xdb813eVwYF0mDyEQotEBqAv+D1upXRs3vpLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vsK0Pj19Q6Yvn/cy91GB6zPlOPMNmByxVtVHHNBIW1J1rPVtnjyF2SWCsB8KtGKL5
	 mKzN43C4tAvLSP8VK3HvnY3K9KzNX5HM3BQRxPPQbcWvYBrz/hBMMnrm3dpidSExnp
	 0FL74cRHFo9bg/XU1+AUoQbBQDga0Yt661Wk5/kw=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v6 13/18] media: platform: Fill stats buffer on ISP_START
Date: Tue,  9 Jul 2024 14:29:01 +0100
Message-Id: <20240709132906.3198927-14-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ISP_START, fill the stats buffer by reading out the metering space
in the ISP's memory. This is done for the non-active config just as
the dma transfer of the registers is. To acheive that, move the
checking of the current config outside of mali_c55_swap_next_config()
so we can use it for both functions.

Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v6:

	- None

Changes in v5:

	- New patch

 .../platform/arm/mali-c55/mali-c55-core.c     | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index eedc8f450184..ed0db34767a4 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -567,15 +567,9 @@ static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
 	return 0;
 }
 
-static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
+static void mali_c55_swap_next_config(struct mali_c55 *mali_c55, u32 next_config)
 {
 	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
-	u32 curr_config, next_config;
-
-	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ);
-	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
-		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
-	next_config = curr_config ^ 1;
 
 	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
 			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
@@ -588,6 +582,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 {
 	struct device *dev = context;
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
+	u32 curr_config, next_config;
 	u32 interrupt_status;
 	unsigned int i, j;
 
@@ -612,7 +607,30 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 			for (j = i; j < MALI_C55_NUM_CAP_DEVS; j++)
 				mali_c55_set_next_buffer(&mali_c55->cap_devs[j]);
 
-			mali_c55_swap_next_config(mali_c55);
+			/*
+			 * When the ISP starts a frame we have some work to do:
+			 *
+			 * 1. Copy over the config for the **next** frame
+			 * 2. Read out the metering stats for the **last** frame
+			 */
+
+			curr_config = mali_c55_read(mali_c55,
+						    MALI_C55_REG_PING_PONG_READ);
+			curr_config &= MALI_C55_REG_PING_PONG_READ_MASK;
+			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
+			next_config = curr_config ^ 1;
+
+			/*
+			 * The ordering of these two is currently important as
+			 * mali_c55_stats_fill_buffer() is asynchronous whereas
+			 * mali_c55_swap_next_config() is not.
+			 *
+			 * TODO: Should mali_c55_swap_next_config() be async?
+			 */
+			mali_c55_stats_fill_buffer(mali_c55,
+				next_config ? MALI_C55_CONFIG_PING :
+				MALI_C55_CONFIG_PONG);
+			mali_c55_swap_next_config(mali_c55, next_config);
 
 			break;
 		case MALI_C55_IRQ_ISP_DONE:
-- 
2.34.1


