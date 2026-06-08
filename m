Return-Path: <linux-media+bounces-64104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwUUKxkJJmoIRQIAu9opvQ
	(envelope-from <linux-media+bounces-64104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 02:13:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA2651FCB
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 02:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rCBPgTFq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64104-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64104-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88DBD30177B6
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 00:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482EE1C69D;
	Mon,  8 Jun 2026 00:11:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BF5477E
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 00:11:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780877501; cv=none; b=RB4AJc+a/7mK2Jk2cBl55i6c6Wag23oNbdYn9bEOM8nk1xvJwoUBx2bd7oR7BG7ZPOS+c2j75GwcWKTNdCd9oNTG6JwGY4s+oIRalkKOFLr13HLzAT4BU52GaYGhiadDG7VeNfrfKwLgHdi6o0D6OEGjpBuruDU532HT553wgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780877501; c=relaxed/simple;
	bh=vOOayBGohK0QwvzYe3v0W8+80VsNtvUxtjNMIUanpho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yt5O8P7MxL8VSoTZ0HhNN5mTQ8e+UfZkm0TSSL+d+Nq5KaeMi99IwME68ND23+mP7DA+OpYt/RMSvypcKeu00Iy+iJXU+DZxhUHaQsro2tt8r6xo0phVs5prjCwrhSpojll0ESu5X7QR6m9eea4HLhHyYVginJutudnkMR/X3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCBPgTFq; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-307631dbfedso8337504eec.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 17:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780877499; x=1781482299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oi4kLzuZyCKw08FN9wJbFhp23jSNbW+hFaRRXMRqEt8=;
        b=rCBPgTFqO1vo4GhfaZc00r4zmZUsxfaE24zncPAO+vDECojQZxRoN3SJK38ddji80/
         j95U8h3JiQrKP1/iNFh59zVM3E+lmFRs3mLiDstzqOrRlhB39vR2OSaOeaXrDl9GSUSO
         trxVA4p+niqHsT1/Z59Htj4z/TNz+S5ArtspU6Yv9MYq/0hR0KIPjzRevdgpKVLe15SB
         1YlNwljJ26qGRxpQSDlnWBDltZwbHu5qrOlq1M9ByJ05j/DPq6lusKgliqknAly5Xl2O
         TvIw1sq1vrxk9gBU3+yKHt4kAd9zFfNtY9JhkuBmb9Xft7gnFsyLwoip6qAgpKMaiotW
         Wj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780877499; x=1781482299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi4kLzuZyCKw08FN9wJbFhp23jSNbW+hFaRRXMRqEt8=;
        b=ByKSeBJlNq5zca3lUiGdKbWdu79vQGgoVy7bWvHj8xfj7MUexevHJt4xpVBO/EUfMu
         sjwyMTu6auCVzji54YH4coSTNgFJ7HJA3Hj/pfCwsiWSW3Fd0NeaUBP45U6RIa7VPFef
         X8sFcAGL+B1Tpg8/Tajlogbf6iek/qQCUIoCRp2weHfnu5rydDqLcgeHpYsSbT5tCue7
         P7PecjswuNHOdKok0PlDrKAtdsNxNTj/LKio43Aju5AtBFZUjNmgk/WysMG0MG30lg1j
         r/J1XBLliTpUfHUpltE+H8yWjkDH5g3rUlzhYxbRpVtfpkshRsDXLtmx/v2WAMmCYZH+
         cZWg==
X-Gm-Message-State: AOJu0Yw38FGYiwvXN3llEvEJ+cyCZiFFrLcsDOMMCt/rbI2wb0B0Vx7V
	EwXhbB1/wRMGnEZRC9afHtFuqjlIpKkXNLlM6FplY7GlCeaklPXdJ3M28zvwwkQD
X-Gm-Gg: Acq92OESSOCej0V6CTa+dBBm36iNsyyFF4fHqOTC63BWvrASB4kT93KwhNx0xy2tIeo
	2L6qgDJhZC7PdOWq4u7gy5h0oBVhzZN03W4KK4oe6F5mwmz9mCWP16GCWHCQuyE2AFfSrnDrdmR
	as5Cwq9c3jJsCqdGGfbXuwTMl32v8zvGU0rB/gyCQGBqD7BWoSosFDpJhF3FjlABbXpE036uhfx
	MgMpQa2hV7gL4D5a/J6UdCn2/Xezv6PrdEguS7d1jTC7SQMDLThHtOVhfO0jjvhJxC/OQNxMz0P
	lzknHr2hGMMqGZ91j90Zq1fq9gogth7pAbSlMjSM2Nbp9wI/mPGTuOwlImYt3X6SqJPTrn1cJ66
	c+pLqS1NjMRjnn6OpflJdj3TmAyQy+/sSxWPlaDZn5vfxaq1ZMnaxQsTuj84dH0swkffdbXFrNi
	a30z75LR3OAYBX376e2/4vsGQlpSNT9TtNg0Qeq44+ROf2nLoiUgNybTrBOxrvz6X7hw==
X-Received: by 2002:a05:7300:f193:b0:304:de28:1b16 with SMTP id 5a478bee46e88-3077b7830aemr7591327eec.28.1780877499460;
        Sun, 07 Jun 2026 17:11:39 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm19713471eec.23.2026.06.07.17.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:11:39 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM check
Date: Mon,  8 Jun 2026 00:11:28 +0000
Message-Id: <20260608001128.80090-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64104-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FAA2651FCB

Guard hardware register access in the threaded IRQ handler with
pm_runtime_get_if_active().

A possible ordering exists where the top-half IRQ handler returns
IRQ_WAKE_THREAD, runtime PM suspend powers down the VPU, and the
threaded IRQ handler subsequently runs and accesses hardware
registers through iris_vpu_clear_interrupt().

Avoid touching registers when the device is no longer active by
skipping interrupt processing when runtime PM indicates that the
device is suspended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v4:
- Clarify the possible ordering between IRQ_WAKE_THREAD,
  runtime PM suspend, and the threaded IRQ handler.
- Describe the race condition motivating the runtime PM check.

v3:
- Remove the early enable_irq() from the PM-inactive early-return path.
- IRQ re-enablement is already handled by iris_vpu_power_on() after power-on.

v2:
- Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use().
- Handle negative runtime PM return values correctly.
- Return IRQ_NONE when interrupt processing is skipped.

 drivers/media/platform/qcom/iris/iris_hfi_common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88..ab2ec1e75309 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -100,10 +100,17 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
+	int ret;
 
 	if (!core)
 		return IRQ_NONE;
 
+	if (IS_ENABLED(CONFIG_PM)) {
+		ret = pm_runtime_get_if_active(core->dev);
+		if (ret <= 0)
+			return IRQ_NONE;
+	}
+
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
@@ -111,6 +118,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 
 	core->hfi_response_ops->hfi_response_handler(core);
 
+	pm_runtime_put_autosuspend(core->dev);
+
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
 
-- 
2.34.1


