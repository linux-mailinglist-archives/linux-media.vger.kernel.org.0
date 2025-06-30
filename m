Return-Path: <linux-media+bounces-36273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AAAEDA8F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D62177B01
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B2D25B30E;
	Mon, 30 Jun 2025 11:14:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11C425B2FD
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282042; cv=none; b=pYVBPgF9DHqH8UjIIXUT9VswYcNprdW2cr4UtzBu9XfHL3xky4LlBrsyAX9a98hij1DEBbQVn/g5zfBq/sZDAgr+X/HZS2Ie/c0NQ8f4WdssOWuD0Ic3C+Ayy4HtWZ/lNW7c88a7wqzggUihXtBpMZkexj1CVBmfknV7FB9YSHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282042; c=relaxed/simple;
	bh=JMGEwEUheuFKDSMKpdDWD41T0lyTn2o/63HWpFtZ/2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ce78EVbbjs+Nn762d53H6FbKM93P2W4FpLsJqsCFUgPW1iFBS3gEHTb8yYC1NHRbWZa/A77L6vvSOgF4DB/JPNmJYIHiH+/5YrRp8Yj5T+yVFZMzJQBI2NmNoz+5BcXBIB5DUH6v6q4XzOy2a7UsP8FamAyd7X0a5CdcH6aqA7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CAAC4CEEB;
	Mon, 30 Jun 2025 11:14:01 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/5] media: cec: core: add rx-no-low-drive setting
Date: Mon, 30 Jun 2025 13:08:47 +0200
Message-ID: <3997f6234d150bd5b61c4d8b7138037116fb0320.1751281730.git.hverkuil@xs4all.nl>
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

If rx-no-low-drive is set, then the CEC pin framework will disable
the detection of situations where a Low Drive has to be generated.

So if this is set, then we will never generate Low Drives.

This helps testing whether other CEC devices generate Low Drive
pulses by ensuring it is not us that is generating them.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/cec/core/cec-pin-error-inj.c | 11 +++++++++++
 drivers/media/cec/core/cec-pin-priv.h      |  1 +
 drivers/media/cec/core/cec-pin.c           |  2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
index 68cbd83dfd6e..d9e613c7ce3f 100644
--- a/drivers/media/cec/core/cec-pin-error-inj.c
+++ b/drivers/media/cec/core/cec-pin-error-inj.c
@@ -91,6 +91,7 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 	if (!strcmp(token, "clear")) {
 		memset(pin->error_inj, 0, sizeof(pin->error_inj));
 		pin->rx_toggle = pin->tx_toggle = false;
+		pin->rx_no_low_drive = false;
 		pin->tx_ignore_nack_until_eom = false;
 		pin->tx_custom_pulse = false;
 		pin->tx_custom_low_usecs = CEC_TIM_CUSTOM_DEFAULT;
@@ -105,6 +106,7 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 		for (i = 0; i <= CEC_ERROR_INJ_OP_ANY; i++)
 			pin->error_inj[i] &= ~CEC_ERROR_INJ_RX_MASK;
 		pin->rx_toggle = false;
+		pin->rx_no_low_drive = false;
 		return true;
 	}
 	if (!strcmp(token, "tx-clear")) {
@@ -121,6 +123,10 @@ bool cec_pin_error_inj_parse_line(struct cec_adapter *adap, char *line)
 		pin->tx_glitch_rising_edge = false;
 		return true;
 	}
+	if (!strcmp(token, "rx-no-low-drive")) {
+		pin->rx_no_low_drive = true;
+		return true;
+	}
 	if (!strcmp(token, "tx-ignore-nack-until-eom")) {
 		pin->tx_ignore_nack_until_eom = true;
 		return true;
@@ -305,6 +311,9 @@ int cec_pin_error_inj_show(struct cec_adapter *adap, struct seq_file *sf)
 	seq_puts(sf, "#   <op> rx-clear  clear all rx error injections for <op>\n");
 	seq_puts(sf, "#   <op> tx-clear  clear all tx error injections for <op>\n");
 	seq_puts(sf, "#\n");
+	seq_puts(sf, "# RX error injection settings:\n");
+	seq_puts(sf, "#   rx-no-low-drive                    do not generate low-drive pulses\n");
+	seq_puts(sf, "#\n");
 	seq_puts(sf, "# RX error injection:\n");
 	seq_puts(sf, "#   <op>[,<mode>] rx-nack              NACK the message instead of sending an ACK\n");
 	seq_puts(sf, "#   <op>[,<mode>] rx-low-drive <bit>   force a low-drive condition at this bit position\n");
@@ -368,6 +377,8 @@ int cec_pin_error_inj_show(struct cec_adapter *adap, struct seq_file *sf)
 		}
 	}
 
+	if (pin->rx_no_low_drive)
+		seq_puts(sf, "rx-no-low-drive\n");
 	if (pin->tx_ignore_nack_until_eom)
 		seq_puts(sf, "tx-ignore-nack-until-eom\n");
 	if (pin->tx_glitch_falling_edge)
diff --git a/drivers/media/cec/core/cec-pin-priv.h b/drivers/media/cec/core/cec-pin-priv.h
index 88eefcb60ab8..e7801be9adb9 100644
--- a/drivers/media/cec/core/cec-pin-priv.h
+++ b/drivers/media/cec/core/cec-pin-priv.h
@@ -228,6 +228,7 @@ struct cec_pin {
 	u32				timer_max_overrun;
 	u32				timer_sum_overrun;
 
+	bool				rx_no_low_drive;
 	u32				tx_custom_low_usecs;
 	u32				tx_custom_high_usecs;
 	u32				tx_glitch_low_usecs;
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index f3b0febf0f1c..4d7155281daa 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -797,7 +797,7 @@ static void cec_pin_rx_states(struct cec_pin *pin, ktime_t ts)
 		 * Go to low drive state when the total bit time is
 		 * too short.
 		 */
-		if (delta < CEC_TIM_DATA_BIT_TOTAL_MIN) {
+		if (delta < CEC_TIM_DATA_BIT_TOTAL_MIN && !pin->rx_no_low_drive) {
 			if (!pin->rx_data_bit_too_short_cnt++) {
 				pin->rx_data_bit_too_short_ts = ktime_to_ns(pin->ts);
 				pin->rx_data_bit_too_short_delta = delta;
-- 
2.47.2


