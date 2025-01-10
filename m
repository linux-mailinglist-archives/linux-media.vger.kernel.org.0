Return-Path: <linux-media+bounces-24589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5DA08B29
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB22162463
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A2F20C023;
	Fri, 10 Jan 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R1/um2UO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFAA20B804;
	Fri, 10 Jan 2025 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500529; cv=none; b=Z1i+Td63UEwBxMlr8mX9cfH8FFZueBZbEPJ1I+r7AcIHOP3n4/kk0xU/XV2CunBttjtF3PB8udHJJLlfk2Z35rXMStxFoDqn8cclkTWV0PeyFjmBeuAZZVXMRw5JB/AGEt9XC911UA0sB33eNXQt1rmkVYeW8N/0i9jJV+a/M3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500529; c=relaxed/simple;
	bh=LqsWKWLvcjKl8miOWsCgojhD6f1dXEtfdcZMlaaNP+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvYWF7U3ttZV9pXl9gCcHfk8yKxw3GS626DErfm2KygzGAP7VAFHxjRB00DMZ18WVebABU0Ja9SCxpbVUfenGK2SNQeTFueGD4/ZNuKFGqoxOqlnnAKz+FoMzUBOFfnZ297P/+a72H5mTV92/kBkFHU62gyUDEneQgRZF0C3CvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R1/um2UO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6883F1AA2;
	Fri, 10 Jan 2025 10:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500455;
	bh=LqsWKWLvcjKl8miOWsCgojhD6f1dXEtfdcZMlaaNP+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R1/um2UO60x8MEx+ko4vbopj/UBOIfslJFb0EUgnS+oohE949n1fVnBjvtI4ruqJV
	 o2P5RcLjSMBC9/wmQJxjbazcHOob9RK784qyjldYTBLKKuTfoZvs644Lw4IkxN81b5
	 d2FDFSTVPidxeilskadpJYoMEwnAB6Rx9JpfzzAQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:09 +0200
Subject: [PATCH 09/19] media: i2c: ds90ub960: Add UB9702 specific registers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-9-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2258;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LqsWKWLvcjKl8miOWsCgojhD6f1dXEtfdcZMlaaNP+4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUTvX5jG2zGkVxu7XXHlXLlfvHrJbZcJEsnn
 NsMaTanZGOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEwAKCRD6PaqMvJYe
 9YecD/wMKXtAX0Ml8FHRhQKXgNIqW7oHnBN5k4trkA49mXX4sI095YtGhYLoyQhVuDD4waKEMHS
 7ohtldMmLPBWVYQsRUeoxO6+44Ku0YtuubaKWq0EXa5VQQNGitQul7b8jCcEe2QVtC+18fQsWs8
 +RytaYz3/oQkkGjnaHqo0aKLdpy3Yq5kut4sr81iEGX5Q/z08Umr7u82PExy74ndhPhogqVfT2/
 5wOgfnzFHBFPsvTOg3lKp5X9qCtfRZi04rIq2MuhdVNl7djW/644ZPlw4EMqhT6AgAOkN0tZUvZ
 7yyTJAbzVLG6lxhOe/ha2761r/PBmEuMblptI1hoo3gAnj9lm7ap5WyA3UpDAD47RelI/6Px5hq
 QAOoo9WornwV1jjPIJS2Nls4gzkc5WQY6+UY9opjt/lBSO/+Xo2IW0IC632jR9IbawgZSI3DnWt
 HXZG/mj+4a8t8C6rs7td4cIz8GKYWW8S8PWz5EP/fknfgJmNFDkEfsDo84t0cvjfjEBf5POaOcJ
 x9M2XJsVZaIyoABCNg32QKfQ1++JDIjEoGdW0zQgShRJ71BZaq+cnsHREFv5gvkf3/BvZoT1KHT
 aVP2ajVZ0NMAhtyx7/N17DI1WnQGCqsII2ad1A27f2Ur2ilqjqDomAOfSGbzANq4UdTEJsBSkd7
 ueQgx0zpIUfn5Hg==
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


