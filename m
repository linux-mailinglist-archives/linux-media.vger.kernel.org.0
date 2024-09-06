Return-Path: <linux-media+bounces-17801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8A96F857
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9B5B1F25AC5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0AA1D4148;
	Fri,  6 Sep 2024 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nmYtq/Ci"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138D1D2F6D;
	Fri,  6 Sep 2024 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636884; cv=none; b=Rbu1G2+01sX28+K8wBFs0riBlSFs1djWX5bOQlUSjBvH1sJQr4SB9l/hJxQujYJKfEsJeTh3wbzYwmFuZa9KpOnPR3zH2nq2IN9yVb/iC1tR220qesIXnv+iPITSz1e1X2xZM1TAHZaYp0tLaWmsSswlfrbQt9lDskCuz5FItpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636884; c=relaxed/simple;
	bh=fdBL6+UH4YwcgUMre57P76rVe6EtTBlV1eAamcn7QnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjnW17RX+08vGXDKmul3LrCzR6ZSNU/bKsOkhkf4lfyR8h1MgjOjCVf5QtmICkkjgCOy5Y5Zg9mADNJ6OD2/+piXGtz5WNsOJ0N2JM+65Ngf6n7oJtbA+ueUICqSpU2TmP1v+vpPblp/rbpq8zGS1Ey/F/By0SXFeHcvzLQcI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nmYtq/Ci; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45F368A9;
	Fri,  6 Sep 2024 17:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725636794;
	bh=fdBL6+UH4YwcgUMre57P76rVe6EtTBlV1eAamcn7QnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmYtq/Ci4XMwnKqD4v2VbQ11d2XDispxgUnWsRzxJvtcWNAqjmM0aUprWkuB53irS
	 rJ0QeS6H/0F5rQxTdNt8ziK5bEdvhSMuPNjqs4chR6lg24FIcVglKrk/vHPMYW1iOv
	 RxYU/9lLGANyxUsNkLvG1BswO2MY3OwTKbugjzF0=
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
Subject: [PATCH v7 12/17] media: platform: Fill stats buffer on ISP_START
Date: Fri,  6 Sep 2024 16:34:01 +0100
Message-Id: <20240906153406.650105-13-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906153406.650105-1-dan.scally@ideasonboard.com>
References: <20240906153406.650105-1-dan.scally@ideasonboard.com>
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
Changes in v7:

	- Reworked how the config is swapped on ISP start

Changes in v6:

	- None

Changes in v5:

	- New patch

 .../platform/arm/mali-c55/mali-c55-core.c     | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f1dd9c8960cd..f5cce6e24df5 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -617,12 +617,6 @@ static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
 static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
-	u32 curr_config;
-
-	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ);
-	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
-		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
-	mali_c55->next_config = curr_config ^ 1;
 
 	mali_c55_config_write(ctx, mali_c55->next_config ?
 			      MALI_C55_CONFIG_PING : MALI_C55_CONFIG_PONG,
@@ -644,6 +638,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
 	u32 interrupt_status;
 	unsigned int i, j;
+	u32 curr_config;
 
 	interrupt_status = mali_c55_read(mali_c55,
 					 MALI_C55_REG_INTERRUPT_STATUS_VECTOR);
@@ -666,6 +661,22 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 			for (j = i; j < MALI_C55_NUM_CAP_DEVS; j++)
 				mali_c55_set_next_buffer(&mali_c55->cap_devs[j]);
 
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
+			mali_c55->next_config = curr_config ^ 1;
+
+			mali_c55_stats_fill_buffer(mali_c55,
+				mali_c55->next_config ? MALI_C55_CONFIG_PING :
+				MALI_C55_CONFIG_PONG);
 			mali_c55_swap_next_config(mali_c55);
 
 			break;
-- 
2.34.1


