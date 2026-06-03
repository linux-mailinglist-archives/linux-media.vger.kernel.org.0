Return-Path: <linux-media+bounces-63483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDRtEdq/H2qEpQAAu9opvQ
	(envelope-from <linux-media+bounces-63483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:47:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B66956345A2
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:47:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=PUHPw+QR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63483-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63483-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C76DA30D2FE9
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13D539B94F;
	Wed,  3 Jun 2026 05:42:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536C389DEC;
	Wed,  3 Jun 2026 05:42:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465370; cv=none; b=uQzc+ZbDRHpp1JS7VJz37lWiTgufcrxAdMyYqRHGFr05ZdTDywTnkEXx3CeBLCFLRqBZtNygDELTCTGMQ2H8T7gfVGirN7J74UAXCK/P729uT7h3I862etloS6EgEti4e5FdWiMtDoNJehyFkGdSMxL2QjowvlaV6NbaP4wpe1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465370; c=relaxed/simple;
	bh=9oa6dE9aT3gKoh8IBbtYIv2EOuo4hP4LPcKbuoA0+20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFUcTsxJnRRGA7tt24OkshrhWNUTe+yuPbO28SGeEEg/mzRFqlF0LyfhDXtuxXHlaFI20O7zLB3I9OnejwUnfRka3sqnjHI8Nny86aLWFJhXr5zjcpn/kWbrIwRNbtoxM8asPXxqYz8sKIB7YnBs9HiW2UMpCKLODXAlTzw1Mwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=PUHPw+QR; arc=none smtp.client-ip=136.144.136.18
Received: from submission11.mail.transip.nl (unknown [10.103.8.162])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gVc6S1lpnzkQNZy;
	Wed,  3 Jun 2026 07:42:40 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission11.mail.transip.nl (Postfix) with ESMTPA id 4gVc6R4s56z3R3nyc;
	Wed,  3 Jun 2026 07:42:39 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Robert Foss <robert.foss@linaro.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 2/2] media: qcom: camss: vfe-17x: silence wm-done IRQ on unmapped WMs
Date: Wed,  3 Jun 2026 07:42:38 +0200
Message-ID: <20260603054238.562902-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603054238.562902-1-github.com@herrie.org>
References: <20260603054238.562902-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission11.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780465359; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=0ysqzWib1F7EylyF9A4oGev7RuUOO55xC88Wv+C+zQo=;
 b=PUHPw+QRBfEfKHn03yaBI5QS21mKVpJ9KjTJlWeYAfA4HzXwHR0Ti+uwL0hcb800Iji3dL
 43eiL+qaJ06CSdVG1CC82akHfKqljlk5AJRAgyRrCgDL8oW+1cIHcc1wKZeiVMVqhAhinp
 KuXlmJoo0NgIwEWBjL2AJxZmsmzE1rkSjZoAhRbT7K2So3IzJ7FOJk+UC3DYQM4zApNsKw
 XM7q3kt/spy4EY8a+LRpEaiCn44KWjssYwWGKouyUSMUGpzIfaDmXiNbEhCfjmipPkCKqh
 29ScWLqv7rmfgqJQyXBKhn2uwZN3I8kEov/R2Ntog+ZinORX/mQGY0E+leVCnQ==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com,mleia.com,kernel.org,herrie.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63483-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:robert.foss@linaro.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vz@mleia.com,m:mchehab@kernel.org,m:github.com@herrie.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B66956345A2

vfe_isr_wm_done() handles the per-write-master "frame complete" IRQ.
On VFE 1.7x configurations where a Write Master is allocated to a
secondary purpose (e.g. statistics or DMI buffers) it is not mapped
to any output line, so vfe->wm_output_map[wm] is VFE_LINE_NONE.

Today the function takes the output spinlock first and only then
checks for VFE_LINE_NONE, emitting a rate-limited "Received wm done
for unmapped index" error each time. The error is harmless but it
spams dmesg when a stats path is configured.

Move the VFE_LINE_NONE test in front of the spinlock and return
silently: an unmapped WM simply has nothing to deliver to userspace.
While at it, hoist the wm_output_map[] dereference into a local for
readability.

No functional change for mapped Write Masters.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 3ad0c3be005f..f639ac02410b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -507,21 +507,36 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
  */
 static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 {
-	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
+	struct vfe_line *line;
 	struct camss_buffer *ready_buf;
 	struct vfe_output *output;
 	unsigned long flags;
+	int wm_output;
 	u32 index;
 	u64 ts = ktime_get_ns();
 
+	/*
+	 * Some VFE modes route data to secondary WMs that aren't mapped
+	 * to output lines. Silently ignore their IRQs.
+	 *
+	 * vfe->wm_output_map[wm] is written from the stream stop/start
+	 * paths under output_lock held as a mutex; this ISR runs in
+	 * atomic context and cannot take it. Snapshot the value once
+	 * with READ_ONCE() so the check below and the array index that
+	 * follows operate on the same value: otherwise a concurrent
+	 * write of VFE_LINE_NONE (-1) between the two loads would let
+	 * the function pass the check and then dereference
+	 * &vfe->line[-1].
+	 */
+	wm_output = READ_ONCE(vfe->wm_output_map[wm]);
+	if (wm_output == VFE_LINE_NONE)
+		return;
+
+	line = &vfe->line[wm_output];
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Received wm done for unmapped index\n");
-		goto out_unlock;
-	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output;
+	output = &line->output;
 
 	ready_buf = output->buf[0];
 	if (!ready_buf) {
-- 
2.43.0


