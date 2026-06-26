Return-Path: <linux-media+bounces-65693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NTSzFIQzPmqSBQkAu9opvQ
	(envelope-from <linux-media+bounces-65693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 10:08:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4C6CB380
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 10:08:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=obgdnlmQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65693-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65693-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57706300252F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06593ACA43;
	Fri, 26 Jun 2026 08:08:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2F3AD520
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 08:08:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461303; cv=none; b=PiNFY8pd7w0FVgG73bgJXL0702NGPAlDKdKAuoxSNeYJ1eYsSKdQ1XActNhUrrTkdFKW0ZgfWcPm5D4cQnRUzSH/Of5QDRUtLFv0n0O9sNR+zbsS4/Oi1igkO6w8DZ2sY853NpqaOFTe4ZYgOaRh0Zf0x2NrCJlibam0B69YWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461303; c=relaxed/simple;
	bh=SFnUDavIiYIsJ9XoqgY2IG8NgWcE6leLr7ttBz31hcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=au9GHtCIyKms3ydgtIf9DOkIqGnhK+9gIHsbHUrrrKc7hQRkDNEqZajF6ZKfZCIR5LgSad48vSr7jiTWTPv2Zxyw3zMiDlsKROdIIFsr8Z0up/PXy8DD0NdDaAn4jA1YgAF2psCDaoabTe6I7NsLjfFetbBjzt8+TVzZM7uRY90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obgdnlmQ; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c7f1db3ad4so6412715ad.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461299; x=1783066099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ+T6+y+X164UlZgYnR/gHm8zQJ/SCwnhWnfxubn/vg=;
        b=obgdnlmQICTTvoWsxdI71X2VGZKhl+MJ9JBnM78IrykBsPhcF4ApGhT0n4oPLZUjIc
         NeEHslrXBK++7DAZaI48O1USv6YWHpefTa6pHpHY6qC/y2Vfn9xAgHGrEuoCo3Ny9ghM
         rRkB1NgLhHay3CdWEx55yoQCrqggCF56xw7NT6eZ8YvLOAomD8IRHjQ0q6DWdGP2I+Ll
         SEloaotLGXxwMcgtYR8YHdcbnfE9OvMSzsjwAxIh21qv6Q9bo/e6y6CdYhmbltWG6R6y
         TNlfS0w6Y7SVoXlCANKDPdfCtHCH8P+QFLhnmbWaRgAH0U0AYAwvXZ6u3FvL2hdRfODj
         Vcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461299; x=1783066099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJ+T6+y+X164UlZgYnR/gHm8zQJ/SCwnhWnfxubn/vg=;
        b=rsSoGnsZKfEmjNZQVOzdrEhy5UwySVaDowVW4yCmC45uTUFjGKqfxk7BBEZJAcMISl
         hoVWcDSmN8h7m/eVv2wfQF5mzJM58KRDgOuUwtV9Af4fMrV/+2YMAsvlcpUdeVrtJRpP
         F3TyXGl0x7tKjgRm2bMzIPCLVnFohmNsQjFuFFmSiL+4a1/s4rpIIK1d11qDvOAYD6EW
         /uEeleKiUVGHFRU5AUkfRGFPKpQZqNltW3YjaU2cwfhI3LaCr2jbO+4F6aqO+mm5iiIb
         v34unVtsEVpZl7M/WURb2X6g7yAaVULREBBrys+DIi/WqgtIDP7ImmgKlZJGhD7WAA3j
         vEMg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm8Z1P1M1ZiBct8U8tzMeU7FynhAUJ18AQWsHlg+M/OHfVHYM+ea9kNAupkAAB4dgbYR8AtagOYzhyFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Vr/1n9ZMI6q73OqjyG/RvG3I4r2lBzpLF5QY8ujBbc3t4kx4
	WSOe5Bmhw2sTIOjkOXgaB0M/5doCg8vFvNLiqNe7FvMkr7PI1fjqUJw3
X-Gm-Gg: AfdE7cmUt2F7dbtq3TouiE0LbP0BxerA4tuuM4w7kyDDtKWYjd+QI+snJQHuWeGoXwQ
	ZVWqyrUBRJQGIML4Do76YqL6wL1idICunPQ2iv3+Xs7tTR0fkye3h8L9om1uu/aqnmACtmIJGtH
	e+yUM8+McbO2wrP4zEgobbr+/lLcNxX6TepUxfGIAVQvZ7HuyfxBGdV+rrTOmOkCSfzjzpHV61/
	wKYNKxZg2pOvXRGIWQC6yy35F8lA/JK4nwjtCOsSr9hYsYIcNvF5+LNowXrGlJ8gQCgE0Bg5yPd
	x9sVLHMBCKvvlXiY4khTLOZOAT/yn6cA4StAl9ejl/ImzkmlQjaH1wL1GHqgVETNJPmIMEgPEDe
	Euh964gZxY03S1SyiacXumpEQUnx41y3eosHi6n8FB3A7a0btfB2yFI4Cw3YGywGk+j+ercYKs+
	+ZdkcE0I2KuBH9oHwUbf/nVmFP9g1zn9//k38Z/PE7EeSYhcSSjbN8ufQiztXuwTFvBowYP/ykS
	0tjAj55kKGTr+e+1RQNYR9cFFA+Qaa2J2l1me03+BuYtQ==
X-Received: by 2002:a17:903:2ec3:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2c7fca71861mr63811095ad.23.1782461298919;
        Fri, 26 Jun 2026 01:08:18 -0700 (PDT)
Received: from bass-virtual-machine.. ([36.112.122.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm35714085ad.29.2026.06.26.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:08:18 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] media: cec-pin: Fix event FIFO ordering
Date: Fri, 26 Jun 2026 16:08:06 +0800
Message-Id: <20260626080806.4012817-1-hanguidong02@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65693-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,m:baijiaju1990@gmail.com,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51A4C6CB380

cec_pin_update() fills work_pin_events[] and work_pin_ts[], then
increments work_pin_num_events. cec_pin_thread_func() uses that counter
to decide when to read the FIFO entries.

Do not let the counter update be observed without the event update. Also
do not let a freed slot be reused before the thread has finished reading
it. Use release operations when publishing an entry and releasing a slot,
and acquire operations when consuming those counter updates.

Leave the other work_pin_num_events users as they do not participate in
this FIFO publication path.

Fixes: ea5c8ef29668 ("media: cec-pin: add low-level pin hardware support")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Found by auditing atomic operations used for synchronization.
A similar fix can be found in 6df8e84aa6b5.
---
 drivers/media/cec/core/cec-pin.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 6e1c39102832..085fc12067af 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -115,7 +115,7 @@ static void cec_pin_update(struct cec_pin *pin, bool v, bool force)
 		return;
 
 	pin->adap->cec_pin_is_high = v;
-	if (atomic_read(&pin->work_pin_num_events) < CEC_NUM_PIN_EVENTS) {
+	if (atomic_read_acquire(&pin->work_pin_num_events) < CEC_NUM_PIN_EVENTS) {
 		u8 ev = v;
 
 		if (pin->work_pin_events_dropped) {
@@ -126,7 +126,7 @@ static void cec_pin_update(struct cec_pin *pin, bool v, bool force)
 		pin->work_pin_ts[pin->work_pin_events_wr] = ktime_get();
 		pin->work_pin_events_wr =
 			(pin->work_pin_events_wr + 1) % CEC_NUM_PIN_EVENTS;
-		atomic_inc(&pin->work_pin_num_events);
+		atomic_inc_return_release(&pin->work_pin_num_events);
 	} else {
 		pin->work_pin_events_dropped = true;
 		pin->work_pin_events_dropped_cnt++;
@@ -1101,7 +1101,7 @@ static int cec_pin_thread_func(void *_adap)
 						     pin->work_tx_ts);
 		}
 
-		while (atomic_read(&pin->work_pin_num_events)) {
+		while (atomic_read_acquire(&pin->work_pin_num_events)) {
 			unsigned int idx = pin->work_pin_events_rd;
 			u8 v = pin->work_pin_events[idx];
 
@@ -1110,7 +1110,7 @@ static int cec_pin_thread_func(void *_adap)
 						v & CEC_PIN_EVENT_FL_DROPPED,
 						pin->work_pin_ts[idx]);
 			pin->work_pin_events_rd = (idx + 1) % CEC_NUM_PIN_EVENTS;
-			atomic_dec(&pin->work_pin_num_events);
+			atomic_dec_return_release(&pin->work_pin_num_events);
 		}
 
 		switch (atomic_xchg(&pin->work_irq_change,
-- 
2.34.1


