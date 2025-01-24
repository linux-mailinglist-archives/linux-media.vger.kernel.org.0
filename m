Return-Path: <linux-media+bounces-25278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D26A1B905
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72AF61710C7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBCF1ADC96;
	Fri, 24 Jan 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ESki67Xv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC70322068B;
	Fri, 24 Jan 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731914; cv=none; b=OpA6YrxhLsNpZTriTJvR3aXmHJ/GfDZq2trjfQ7dQaLiCSEASfN8K1LvgSJmO/undfA1XDNnqvQFkMIZdh/VwisWi2toShww5kYhgSExcOSxyY2PUjqQds0Hizz65reF9KMSq/cjVucblYru3fup4D1Sech3ASIN3jXD9QSsB3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731914; c=relaxed/simple;
	bh=LqsWKWLvcjKl8miOWsCgojhD6f1dXEtfdcZMlaaNP+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2qDLpxF7X16lTdFOAGg9h7Ejdy8PrseL4IjcpxiaaUTirFwCkpmyP3L83GqbvnIaJSGRExXXaHglV6759b+ZviCmpMFCb0RTuG4vaCE9/LNJCL4EAaRhpgdQgDloNTlijASiomK2tw114rQjUx9gd7v3V3SB38AhTIzn8eEZw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ESki67Xv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0EE64AD;
	Fri, 24 Jan 2025 16:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731834;
	bh=LqsWKWLvcjKl8miOWsCgojhD6f1dXEtfdcZMlaaNP+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ESki67XvT1O9QYvcf0v7P5oyLc9FQkhNqXwnyo80JVYYeGJ02b6nbS6rq15PrPhdG
	 XuNN/fxAYobII+UnSt46WfxHbQUgs4R9mfs9ZNlfK2hZnoOfwZgjqI1VKp+Zu0j8RR
	 BSkxo0LhMrgVvaXj1KGyH6IRnVl9fyc2b418QVSE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:47 +0200
Subject: [PATCH v2 10/22] media: i2c: ds90ub960: Add UB9702 specific
 registers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-10-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2258;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LqsWKWLvcjKl8miOWsCgojhD6f1dXEtfdcZMlaaNP+4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68vBiwDQMuRJ1vmqyMsBHzPi0pfZ9zcaM/f5
 UI7cIoi7G+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLwAKCRD6PaqMvJYe
 9bviD/9kfY+C/vllRxpHujazTCIDh0j0ZYO7Uuej2XAVUGTGyWy8/nHYMwkDS3gGAC6WhSDXnOR
 eQg7hryuSyhA33pwslnXaHyK6Nv3Qp7AIxzzzux9bO7OZiS+odr8YQdlf4iIl+xg7fnU7Q67F/Y
 hmdMBOp9AJBSPBT4pkawsdMCDNGdW5beGp/4XDa1Q0os90WtrUOZk+3UQRo/34WOIcSm9XfkqPX
 Z3euBpEcSbMa9rNqBfQyczF1fSsxYdHCMQx96zQxiRO5y+Y3SbrnaIbCZh0fh2kKsH3rfj0i3Im
 6y8HJSunYHBdg8dRJfnFhtshdehPQj03MOyCJA6q0Zl2UYhst/WTlu4+HmsVwKS2LQcJkFPgeM8
 4Fq9gaUdIt26l2AkvFsx9dbj+5J1C4xOpIxft/lWmAopEy1sa5NDChufy+Lpk0oJ+kXqDp+rB9h
 McHEXECkzcRGhUYyr/Rq4P8IuMqvA0llGS+t2a0AUFYr99VR/8YczMd+UwyaDWHIPcGuftGUPfD
 JkgPghJy8VTVkK5FkX9Ga4WbLETYxUDOndd7tF4knJHftb6CtjeH1iTvW51Ob43ueWc5JtXNsJb
 20LFipfqNk/rf+3cjY4P3wfOhwEokJ7Hxibmea/LHuvVuqzM2R71lisovskvYyp44Ym/D53KNES
 TOKYc1meTa4S8Cw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add UB9702 specific registers which will be used in the following
patches.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index fc910d13d7db..a890097ad105 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -391,12 +391,47 @@
 
 /* UB9702 Registers */
 
+#define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
 #define UB9702_SR_REFCLK_FREQ			0x3d
+#define UB9702_RR_RX_CTL_1			0x80
+#define UB9702_RR_RX_CTL_2			0x87
 #define UB9702_RR_VC_ID_MAP(x)			(0xa0 + (x))
 #define UB9702_SR_FPD_RATE_CFG			0xc2
 #define UB9702_SR_CSI_PLL_DIV			0xc9
+#define UB9702_RR_RX_SM_SEL_2			0xd4
 #define UB9702_RR_CHANNEL_MODE			0xe4
 
+#define UB9702_IND_TARGET_SAR_ADC		0x0a
+
+#define UB9702_IR_RX_ANA_FPD_BC_CTL0		0x04
+#define UB9702_IR_RX_ANA_FPD_BC_CTL1		0x0d
+#define UB9702_IR_RX_ANA_FPD_BC_CTL2		0x1b
+#define UB9702_IR_RX_ANA_SYSTEM_INIT_REG0	0x21
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL6		0x27
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL7		0x28
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL10		0x2b
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL11		0x2c
+#define UB9702_IR_RX_ANA_EQ_ADAPT_CTRL		0x2e
+#define UB9702_IR_RX_ANA_AEQ_CFG_1		0x34
+#define UB9702_IR_RX_ANA_AEQ_CFG_2		0x4d
+#define UB9702_IR_RX_ANA_GAIN_CTRL_0		0x71
+#define UB9702_IR_RX_ANA_GAIN_CTRL_0		0x71
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_1		0x72
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_2		0x73
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_3		0x74
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_6		0x77
+#define UB9702_IR_RX_ANA_AEQ_CFG_3		0x79
+#define UB9702_IR_RX_ANA_AEQ_CFG_4		0x85
+#define UB9702_IR_RX_ANA_EQ_CTRL_SEL_15		0x87
+#define UB9702_IR_RX_ANA_EQ_CTRL_SEL_24		0x90
+#define UB9702_IR_RX_ANA_EQ_CTRL_SEL_38		0x9e
+#define UB9702_IR_RX_ANA_FPD3_CDR_CTRL_SEL_5	0xa5
+#define UB9702_IR_RX_ANA_FPD3_AEQ_CTRL_SEL_1	0xa8
+#define UB9702_IR_RX_ANA_EQ_OVERRIDE_CTRL	0xf0
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_8		0xf1
+
+#define UB9702_IR_CSI_ANA_CSIPLL_REG_1		0x92
+
 /* EQ related */
 
 #define UB960_MIN_AEQ_STROBE_POS -7

-- 
2.43.0


