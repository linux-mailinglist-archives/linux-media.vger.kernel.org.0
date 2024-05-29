Return-Path: <linux-media+bounces-12177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534F8D3AF9
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1762CB27969
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089191836D2;
	Wed, 29 May 2024 15:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vElfIQmj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112C1802C7;
	Wed, 29 May 2024 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996581; cv=none; b=VjeMmye7TmY3p/ZwQpDC+5smksoW17SQsm6dzXjCAo/lizRuueZChaedrkWHlvbj+yZfWDYlNCtdENabkOLfffeSl59WrN/bnYqRh8LE+UWJL4q7LkPhF9KGUfT6Ju2lEkWaJamriw9yQpd0L3fN7798U3zr1zWMBPN7UIWmPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996581; c=relaxed/simple;
	bh=1VZKD/7iXkmlYhIgC1bcHRQA7bBFUpGOqE0+BrQtj9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PDtG12pYkBv7JlO+4OXBBfOQex0KeYcwlL8ovR2OYqjhaQPwsUXfUtSZgNkogS4LuNCshFfBhmCKeRnbh2pVyMAqTtnAnrjRrE9e3Da35WmzoBKAi12Rokqd7rxTvyjVfbDKhPX1cNW2dwwEe3Ku4VQ+JF3GeTC7/wKE4LuCIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vElfIQmj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9573F2F79;
	Wed, 29 May 2024 17:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716996563;
	bh=1VZKD/7iXkmlYhIgC1bcHRQA7bBFUpGOqE0+BrQtj9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vElfIQmjIYkFvXgK2ynoHG95MW/051It+iKrA7QK6wtQtq+8GAcKljmKHLvEFRvBq
	 0Ntx2QRKNe9MWPsO58ULGqUKe1HWgFSDd3EVInPFEuogPbIyp1JBrBay0p7J0+DuqH
	 1Q5tdWCRmb3nuS199C/6CkazSTsx/8LylaXni5aA=
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
	dan.scally@ideasonboard.com
Subject: [PATCH v5 11/16] media: platform: Fill stats buffer on ISP_START
Date: Wed, 29 May 2024 16:28:53 +0100
Message-Id: <20240529152858.183799-12-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529152858.183799-1-dan.scally@ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
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
Changes in v5:

	- New patch

 .../platform/arm/mali-c55/mali-c55-core.c     | 35 ++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 9ea70010876c..2cf8b1169604 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -420,15 +420,9 @@ static u32 mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
 	return version;
 }
 
-static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
+static void mali_c55_swap_next_config(struct mali_c55 *mali_c55, u32 next_config)
 {
 	struct mali_c55_ctx *ctx = mali_c55_get_active_context(mali_c55);
-	u32 curr_config, next_config;
-
-	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ, false);
-	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
-		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
-	next_config = curr_config ^ 1;
 
 	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
 			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK, next_config);
@@ -440,6 +434,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 {
 	struct device *dev = context;
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
+	u32 curr_config, next_config;
 	u32 interrupt_status;
 	unsigned int i, j;
 
@@ -465,7 +460,31 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
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
+						    MALI_C55_REG_PING_PONG_READ,
+						    false);
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


