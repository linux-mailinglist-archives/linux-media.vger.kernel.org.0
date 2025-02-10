Return-Path: <linux-media+bounces-25873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D422A2E64B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362CE3A931D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9E61C4A06;
	Mon, 10 Feb 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Mhx9SsUt"
X-Original-To: linux-media@vger.kernel.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF111C07C6
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175698; cv=none; b=aCKpX/R47setCzdG+fCSYeDTBACAMFGqPOHr8lkhjvL7NPolGyKZQvzwHQINUMXgMH7lFdOOYdH0efqlSEhb8UuwqyQxBPXOmJWtAxhziDiTbQApTV6vnxon8Xnaxjy4tO9uyWIkz/mHaHkqd72MUqbaRki1dRTyJownQ+18dSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175698; c=relaxed/simple;
	bh=+LOzBTGhH5B3UV2t8GcpDgCFnM0o7P5ERB31Po4SRpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9ju92aJIio2YGfIoJQ7TzdytpG1G0bOwukR1GGXZ0I04AB12hhZvPHQuG5wFMBYJXxSb4vBH8WYawp/LULtS5niN0GDlOvRG3W1ga7zKL5yrGEoNply8JluVLlW+nOuomSe819wsC5fuDJcGYSvIEvlaTZiXg49W01pja2+esI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Mhx9SsUt; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1739175693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d/LiHxu7rXsjVphqf8bNbNa/SaROfhj8tAchzj9/30=;
	b=Mhx9SsUtliJd00sVU2UpgJSgSzuP3DiUQK3xe33yLMXak7bYVqRcnxfw+OA+gFGhBQb0OM
	/+cS88Vaa0WjHWahbIbWjl4e1FPnkqH5CbJB26fOJZBklUcKeSZJ4yhvtMCQ1ZNVx0AIWo
	EJeQhXbQ4VOpDbIYH6cmS12XDiuEHdw7GPfSTgCu3BlRdCAlRHF4hpb6UzeHWY+LIgBeGA
	TzQ7CBo03gVjRu/9HlQsikZ4gQ1qwMbmJHWsMKlzGvzHBTp78Et6drnuinIjT/UvVLA6fC
	5RXnDAmaUryHQpjPt9bnr/Ytp3UOX3TYs0Y1iR56GmLOh5TIjoZnYbWRboW/Rw==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] media: i2c: dw9719: increase tOPR wait time
Date: Mon, 10 Feb 2025 05:19:18 -0300
Message-ID: <20250210082035.8670-4-val@packett.cool>
In-Reply-To: <20250210082035.8670-1-val@packett.cool>
References: <20250210082035.8670-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use usleep_range and a named define, and increase from 100 to 200us
because in practice 100us turns out to be too low, particularly after
a suspend-resume cycle.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/media/i2c/dw9719.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index b6859cfd216c..f2cf3bcd4dd3 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -20,6 +20,8 @@
 #define DW9719_MAX_FOCUS_POS	1023
 #define DW9719_CTRL_STEPS	16
 #define DW9719_CTRL_DELAY_US	1000
+/* 100 us is not enough on resume */
+#define DW9719_T_OPR_US				200
 
 #define DW9719_INFO			CCI_REG8(0)
 #define DW9719_ID			0xF1
@@ -85,8 +87,8 @@ static int dw9719_power_up(struct dw9719_device *dw9719)
 	/* Jiggle SCL pin to wake up device */
 	cci_write(dw9719->regmap, DW9719_CONTROL, 1, &ret);
 
-	/* Need 100us to transit from SHUTDOWN to STANDBY */
-	fsleep(100);
+	/* Need tOPR to transition from SHUTDOWN to STANDBY */
+	usleep_range(DW9719_T_OPR_US, DW9719_T_OPR_US + 10);
 
 	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
 	cci_write(dw9719->regmap, DW9719_MODE,
-- 
2.48.1


