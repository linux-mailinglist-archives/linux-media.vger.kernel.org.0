Return-Path: <linux-media+bounces-36272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FEDAEDA8E
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DB79177B02
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557FC25B2E1;
	Mon, 30 Jun 2025 11:14:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B0F1A3154
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282042; cv=none; b=mJ6J2YHKUr2mYTnca6aiHOJFmEdNOz1q2Kg2ZLoa/xpNr4b7GAcw9nHL74JRD5fmfwvdYYqf9vZq6U0gLcoFjYVTwkujq+FZhwGCU0JKhitM1DZcGUepwZr7VfYQcAO2VDxXeB4UWXMbM4p+GyU6SS4IFK0Gk1R9ZHq7otnxsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282042; c=relaxed/simple;
	bh=sawXNCappZY7Dnr/RpwjCaFLSxrvAdvB2MNWgFZw1g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3BlZ8eSrQ2uxGMNo8l5lrf/82+qFvyciGWNPc2h+XC5n5ePVf6OYjD/2wV69oCYpcWnLEjQRppADoZoIAKlSwSs70VexQZG1vw3paI/wpkGGNH6iaASi6SXdi7B3Ner+uEmpzZgxYxs5l04FuN5j31oP/7DwLNO0UuELaw/Vkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCD7C4CEE3;
	Mon, 30 Jun 2025 11:14:00 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/5] media: cec: core: add glitch error injection
Date: Mon, 30 Jun 2025 13:08:46 +0200
Message-ID: <8accc0fc09a31a39c8bc5af95d69841f28acce55.1751281730.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751281730.git.hverkuil@xs4all.nl>
References: <cover.1751281730.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for inserting 'glitches' after a falling and/or
rising edge. This tests what happens when there are little voltage
spikes after falling or rising edges, which can be caused due to
noise or reflections on the CEC line.

A proper CEC implementation will deglitch this, but a poor implementation
can create a Low Drive pulse in response, effectively making CEC unusable.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/cec/core/cec-pin-error-inj.c | 48 +++++++++++++++++++++-
 drivers/media/cec/core/cec-pin-priv.h      |  7 ++++
 drivers/media/cec/core/cec-pin.c           | 29 +++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
index 6e61a04b8168..68cbd83dfd6e 100644
--- a/drivers/media/cec/core/cec-pin-error-inj.c
+++ b/drivers/media/cec/core/cec-pin-error-inj.c
@@ -95,6 +95,10 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 		pin->tx_custom_pulse = false;
 		pin->tx_custom_low_usecs = CEC_TIM_CUSTOM_DEFAULT;
 		pin->tx_custom_high_usecs = CEC_TIM_CUSTOM_DEFAULT;
+		pin->tx_glitch_low_usecs = CEC_TIM_GLITCH_DEFAULT;
+		pin->tx_glitch_high_usecs = CEC_TIM_GLITCH_DEFAULT;
+		pin->tx_glitch_falling_edge = false;
+		pin->tx_glitch_rising_edge = false;
 		return true;
 	}
 	if (!strcmp(token, "rx-clear")) {
@@ -111,6 +115,10 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 		pin->tx_custom_pulse = false;
 		pin->tx_custom_low_usecs = CEC_TIM_CUSTOM_DEFAULT;
 		pin->tx_custom_high_usecs = CEC_TIM_CUSTOM_DEFAULT;
+		pin->tx_glitch_low_usecs = CEC_TIM_GLITCH_DEFAULT;
+		pin->tx_glitch_high_usecs = CEC_TIM_GLITCH_DEFAULT;
+		pin->tx_glitch_falling_edge = false;
+		pin->tx_glitch_rising_edge = false;
 		return true;
 	}
 	if (!strcmp(token, "tx-ignore-nack-until-eom")) {
@@ -122,6 +130,14 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 		cec_pin_start_timer(pin);
 		return true;
 	}
+	if (!strcmp(token, "tx-glitch-falling-edge")) {
+		pin->tx_glitch_falling_edge = true;
+		return true;
+	}
+	if (!strcmp(token, "tx-glitch-rising-edge")) {
+		pin->tx_glitch_rising_edge = true;
+		return true;
+	}
 	if (!p)
 		return false;
 
@@ -139,7 +155,23 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 
 		if (kstrtou32(p, 0, &usecs) || usecs > 10000000)
 			return false;
-		pin->tx_custom_high_usecs = usecs;
+		pin->tx_glitch_high_usecs = usecs;
+		return true;
+	}
+	if (!strcmp(token, "tx-glitch-low-usecs")) {
+		u32 usecs;
+
+		if (kstrtou32(p, 0, &usecs) || usecs > 100)
+			return false;
+		pin->tx_glitch_low_usecs = usecs;
+		return true;
+	}
+	if (!strcmp(token, "tx-glitch-high-usecs")) {
+		u32 usecs;
+
+		if (kstrtou32(p, 0, &usecs) || usecs > 100)
+			return false;
+		pin->tx_glitch_high_usecs = usecs;
 		return true;
 	}
 
@@ -285,6 +317,10 @@ int cec_pin_error_inj_show(struct cec_adapter *adap, struct seq_file *sf)
 	seq_puts(sf, "#   tx-custom-low-usecs <usecs>        define the 'low' time for the custom pulse\n");
 	seq_puts(sf, "#   tx-custom-high-usecs <usecs>       define the 'high' time for the custom pulse\n");
 	seq_puts(sf, "#   tx-custom-pulse                    transmit the custom pulse once the bus is idle\n");
+	seq_puts(sf, "#   tx-glitch-low-usecs <usecs>        define the 'low' time for the glitch pulse\n");
+	seq_puts(sf, "#   tx-glitch-high-usecs <usecs>       define the 'high' time for the glitch pulse\n");
+	seq_puts(sf, "#   tx-glitch-falling-edge             send the glitch pulse after every falling edge\n");
+	seq_puts(sf, "#   tx-glitch-rising-edge              send the glitch pulse after every rising edge\n");
 	seq_puts(sf, "#\n");
 	seq_puts(sf, "# TX error injection:\n");
 	seq_puts(sf, "#   <op>[,<mode>] tx-no-eom            don't set the EOM bit\n");
@@ -334,6 +370,10 @@ int cec_pin_error_inj_show(struct cec_adapter *adap, struct seq_file *sf)
 
 	if (pin->tx_ignore_nack_until_eom)
 		seq_puts(sf, "tx-ignore-nack-until-eom\n");
+	if (pin->tx_glitch_falling_edge)
+		seq_puts(sf, "tx-glitch-falling-edge\n");
+	if (pin->tx_glitch_rising_edge)
+		seq_puts(sf, "tx-glitch-rising-edge\n");
 	if (pin->tx_custom_pulse)
 		seq_puts(sf, "tx-custom-pulse\n");
 	if (pin->tx_custom_low_usecs != CEC_TIM_CUSTOM_DEFAULT)
@@ -342,5 +382,11 @@ int cec_pin_error_inj_show(struct cec_adapter *adap, struct seq_file *sf)
 	if (pin->tx_custom_high_usecs != CEC_TIM_CUSTOM_DEFAULT)
 		seq_printf(sf, "tx-custom-high-usecs %u\n",
 			   pin->tx_custom_high_usecs);
+	if (pin->tx_glitch_low_usecs != CEC_TIM_GLITCH_DEFAULT)
+		seq_printf(sf, "tx-glitch-low-usecs %u\n",
+			   pin->tx_glitch_low_usecs);
+	if (pin->tx_glitch_high_usecs != CEC_TIM_GLITCH_DEFAULT)
+		seq_printf(sf, "tx-glitch-high-usecs %u\n",
+			   pin->tx_glitch_high_usecs);
 	return 0;
 }
diff --git a/drivers/media/cec/core/cec-pin-priv.h b/drivers/media/cec/core/cec-pin-priv.h
index 156a9f81be94..88eefcb60ab8 100644
--- a/drivers/media/cec/core/cec-pin-priv.h
+++ b/drivers/media/cec/core/cec-pin-priv.h
@@ -164,6 +164,9 @@ enum cec_pin_state {
 /* The default for the low/high time of the custom pulse */
 #define CEC_TIM_CUSTOM_DEFAULT				1000
 
+/* The default for the low/high time of the glitch pulse */
+#define CEC_TIM_GLITCH_DEFAULT				1
+
 #define CEC_NUM_PIN_EVENTS				128
 #define CEC_PIN_EVENT_FL_IS_HIGH			(1 << 0)
 #define CEC_PIN_EVENT_FL_DROPPED			(1 << 1)
@@ -227,10 +230,14 @@ struct cec_pin {
 
 	u32				tx_custom_low_usecs;
 	u32				tx_custom_high_usecs;
+	u32				tx_glitch_low_usecs;
+	u32				tx_glitch_high_usecs;
 	bool				tx_ignore_nack_until_eom;
 	bool				tx_custom_pulse;
 	bool				tx_generated_poll;
 	bool				tx_post_eom;
+	bool				tx_glitch_falling_edge;
+	bool				tx_glitch_rising_edge;
 	u8				tx_extra_bytes;
 	u32				tx_low_drive_cnt;
 #ifdef CONFIG_CEC_PIN_ERROR_INJ
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 59ac12113f3a..f3b0febf0f1c 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -142,15 +142,42 @@ static bool cec_pin_read(struct cec_pin *pin)
 	return v;
 }
 
+static void cec_pin_insert_glitch(struct cec_pin *pin, bool rising_edge)
+{
+	/*
+	 * Insert a short glitch after the falling or rising edge to
+	 * simulate reflections on the CEC line. This can be used to
+	 * test deglitch filters, which should be present in CEC devices
+	 * to deal with noise on the line.
+	 */
+	if (!pin->tx_glitch_high_usecs || !pin->tx_glitch_low_usecs)
+		return;
+	if (rising_edge) {
+		udelay(pin->tx_glitch_high_usecs);
+		call_void_pin_op(pin, low);
+		udelay(pin->tx_glitch_low_usecs);
+		call_void_pin_op(pin, high);
+	} else {
+		udelay(pin->tx_glitch_low_usecs);
+		call_void_pin_op(pin, high);
+		udelay(pin->tx_glitch_high_usecs);
+		call_void_pin_op(pin, low);
+	}
+}
+
 static void cec_pin_low(struct cec_pin *pin)
 {
 	call_void_pin_op(pin, low);
+	if (pin->tx_glitch_falling_edge && pin->adap->cec_pin_is_high)
+		cec_pin_insert_glitch(pin, false);
 	cec_pin_update(pin, false, false);
 }
 
 static bool cec_pin_high(struct cec_pin *pin)
 {
 	call_void_pin_op(pin, high);
+	if (pin->tx_glitch_rising_edge && !pin->adap->cec_pin_is_high)
+		cec_pin_insert_glitch(pin, true);
 	return cec_pin_read(pin);
 }
 
@@ -1350,6 +1377,8 @@ struct cec_adapter *cec_pin_allocate_adapter(const struct cec_pin_ops *pin_ops,
 	init_waitqueue_head(&pin->kthread_waitq);
 	pin->tx_custom_low_usecs = CEC_TIM_CUSTOM_DEFAULT;
 	pin->tx_custom_high_usecs = CEC_TIM_CUSTOM_DEFAULT;
+	pin->tx_glitch_low_usecs = CEC_TIM_GLITCH_DEFAULT;
+	pin->tx_glitch_high_usecs = CEC_TIM_GLITCH_DEFAULT;
 
 	adap = cec_allocate_adapter(&cec_pin_adap_ops, priv, name,
 			    caps | CEC_CAP_MONITOR_ALL | CEC_CAP_MONITOR_PIN,
-- 
2.47.2


