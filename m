Return-Path: <linux-media+bounces-67281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pj2ODD/UUGqV5gIAu9opvQ
	(envelope-from <linux-media+bounces-67281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:15:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6473A0A8
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:15:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LYETkVEA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67281-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67281-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6393053DCB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35F9411689;
	Fri, 10 Jul 2026 11:11:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA50413D8C
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681915; cv=none; b=DyKzCb+P94d6D1+qYP6ljoc8yLvxhWKnKbGdMRDBYUzehZ2hdIn+fK8tH7XHiPIXDcqH8Bxdfpm9YnrJc5fNH1mkLv4yz+Gkwh+t8+fmKPuS24MqTa79FCKwxPGkGWk+cKBLSaJ3UYti3RhadEtbwt9L2tcI8V7+CZ4FP17xiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681915; c=relaxed/simple;
	bh=kQqGrE36JDYSiEsOwIhpJmpo0QE0OqEwZgHWA8xlnuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8wkv+66ey2k+QZeEg70Y5APmQbDoBI3/LtX5irQJ5TJhI2bpKs+4mltbTOrzb+S1vyTLc3W6qHHeShIfw3DomeBAB0by7of3ATcFC9MxL3+DRMSBEvD8PVuoVQ9wz8kd2R/UQuyZLFqYFLwCNDW0WvelRgbIH+h35OJLfrD64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYETkVEA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B142A1F00AC4;
	Fri, 10 Jul 2026 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681913;
	bh=NspizvqwfjDN9N+iA513nJWJOFxKXm14AWeRRCZKBuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYETkVEAOwV1NFEk3fJYzFfg5vujBuP92Qsu08/q/G5af801iLuyC74D8B+mGrc2J
	 owh50U7Ppz5vbZ5Do/IQ+W6mvJemxF2sd+x+CEXONIqFOOQi+CFOgUfs8Rxf1LEZYN
	 q2RtC68q4zvSDWH3SvcDrWbhcJoPI5bEt+G9WpYCc7jHDl3jyrihxkiXapKUsnqPqH
	 lkeSGtl4QF3g7qUqYDzPZZ9fcUwbcH867Eu0y/YvEE7rGfh/gCtVwg6TSAIzzT7uw5
	 OsZaJI9b4zoIfo+t7/LRCEyHPiR7RrbL2e5NGhRAGQgueLdYDdSJPH28BdCZoH2fXN
	 rq9igvZTFodTg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 7/8] media: cec/core: cec-pin: toggle rx_toggle when arb lost
Date: Fri, 10 Jul 2026 13:07:35 +0200
Message-ID: <98fce8520f0fda15cb75384d410991207c09d264.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67281-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66F6473A0A8

If we inject an Arbitration Lost error, then manually toggle rx_toggle
instead of waiting for cec_pin_to_idle(). When handling the Arbitration
Lost error injection we are switching to TX mode, and as a result when
cec_pin_to_idle() is called when the transmit ends it would never toggle
rx_toggle since it is no longer in RX mode.

Without this change the 'any,toggle rx-arb-lost' error injection
would, once it is on, always stay on.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-pin.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 085fc12067af..6a0ee32e8401 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -692,7 +692,6 @@ static void cec_pin_rx_states(struct cec_pin *pin, ktime_t ts)
 		v = cec_pin_read(pin);
 		if (!v)
 			break;
-		pin->state = CEC_ST_RX_START_BIT_HIGH;
 		delta = ktime_us_delta(ts, pin->ts);
 		/* Start bit low is too short, go back to idle */
 		if (delta < CEC_TIM_START_BIT_LOW_MIN - CEC_TIM_IDLE_SAMPLE) {
@@ -703,7 +702,16 @@ static void cec_pin_rx_states(struct cec_pin *pin, ktime_t ts)
 			cec_pin_to_idle(pin);
 			break;
 		}
+		pin->state = CEC_ST_RX_START_BIT_HIGH;
 		if (rx_arb_lost(pin, &poll)) {
+			/*
+			 * Normally rx_toggle is toggled in cec_pin_to_idle()
+			 * when we're in an RX state, but here we switch to TX
+			 * mode, so cec_pin_to_idle() sees a TX mode and never
+			 * toggles rx_toggle. So toggle it here as a special
+			 * corner case.
+			 */
+			pin->rx_toggle ^= 1;
 			cec_msg_init(&pin->tx_msg, poll >> 4, poll & 0xf);
 			pin->tx_generated_poll = true;
 			pin->tx_extra_bytes = 0;
-- 
2.53.0


