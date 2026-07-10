Return-Path: <linux-media+bounces-67274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zKRxBoLTUGpk5gIAu9opvQ
	(envelope-from <linux-media+bounces-67274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B198473A022
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=M3d4mqqV;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67274-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67274-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1A61303B14C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A20D410D32;
	Fri, 10 Jul 2026 11:11:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF23FBB73
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681907; cv=none; b=b34Dj6tCkGcgWn3UFtvG6vKhHmX1O8J3MSISiOr6WOhVJi8kst8/CWNbXvkfqWitRk94TcprT6TV0ydaC/9yPs6Os/YNIUig5iLQPY3NIM3dIEcPpHVblyuMFr/emzNvbgfgX06tJd+fD8ypuft7VkPKY2YYlNkvdHvTxdT6Ows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681907; c=relaxed/simple;
	bh=vuJ1BFYaQGNqoobgOEMVZZFnO+hWET+ZN328TOsEm88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9EH7bbQbYXsTJNwjcwT5TC+ZGwwIQk2s3R21jCq/BD22gKPwA7jeejI2prhefXskB6KId58qT4rG1nrQs28CeRRWGkrcjgrIcBzEBH8BwBRf5JB6M5kBQBLEdoJ5kcqNc3NFPDncML18ji3R+D+6nYCS0En6Kw1uhS1jb1j1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3d4mqqV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C661C1F00A3A;
	Fri, 10 Jul 2026 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681906;
	bh=3wBKkHqa0Lj5MFHJj49jW3m1VnC/eyOmtwB3OjFtXhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M3d4mqqVWRo8YTMPCBVGyx9qq4GCHnIWQZk1Ug8sFByTwPTd37fmtwpOBsIMC/bde
	 5/eRu0/6hpajGqQNpNRCrYpll9ksQGte+Z1/Y0gjQwr7/QsK821No5gCCowQAk+/Ov
	 qXbolCkEBy6Pe6HOm0/XMmiUNrRY9g+pF0vIPrsxqsJhfkRSPaLQFyj7F/IFKpTwmq
	 WvwXFWyxDiGQiYskCHuNPV/mlthsyA3nxYlkpB9+2sYc8bbbF0Turd7sHs8k1I8Onf
	 p8hZP/2dUYEtzjb4jumsSWKlQNti3gVROcYFGFV5XpM3v1cIjJuNrAU2z7uqtBjNJc
	 gSPhveu6wr1cg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 1/8] media: cec/core: max_retries -> max_attempts
Date: Fri, 10 Jul 2026 13:07:29 +0200
Message-ID: <c8c6cfe3ebd5690165c9116bb7e5e67545b828cb.1783681656.git.hverkuil+cisco@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-67274-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B198473A022

Rename max_retries to max_attempts. This counter really
is for the number of attempts, not the number of retries.

Also increase the number of attempts from 2 to 3.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index de0c4fcd8dfe..e9dce0dfd102 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1317,7 +1317,7 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 {
 	struct cec_log_addrs *las = &adap->log_addrs;
 	struct cec_msg msg = { };
-	const unsigned int max_retries = 2;
+	const unsigned int max_attempts = 3;
 	unsigned int i;
 	int err;
 
@@ -1328,7 +1328,7 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 	msg.len = 1;
 	msg.msg[0] = (log_addr << 4) | log_addr;
 
-	for (i = 0; i < max_retries; i++) {
+	for (i = 0; i < max_attempts; i++) {
 		err = cec_transmit_msg_fh(adap, &msg, NULL, true);
 
 		/*
@@ -1357,19 +1357,19 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 		if (msg.tx_status & CEC_TX_STATUS_NACK)
 			break;
 		/*
-		 * Retry up to max_retries times if the message was neither
+		 * Do up to max_attempts if the message was neither
 		 * OKed or NACKed. This can happen due to e.g. a Lost
 		 * Arbitration condition.
 		 */
 	}
 
 	/*
-	 * If we are unable to get an OK or a NACK after max_retries attempts
+	 * If we are unable to get an OK or a NACK after max_attempts
 	 * (and note that each attempt already consists of four polls), then
 	 * we assume that something is really weird and that it is not a
 	 * good idea to try and claim this logical address.
 	 */
-	if (i == max_retries) {
+	if (i == max_attempts) {
 		dprintk(0, "polling for LA %u failed with tx_status=0x%04x\n",
 			log_addr, msg.tx_status);
 		return 0;
-- 
2.53.0


