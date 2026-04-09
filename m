Return-Path: <linux-media+bounces-58331-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LMkA9Wv12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58331-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:55:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE93CBA0C
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70F2D30674FF
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ED23C276B;
	Thu,  9 Apr 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1hPGGuhf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7DD3AC0F2;
	Thu,  9 Apr 2026 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742596; cv=none; b=guaIc4NO2ay3mysZnqA9b+fycfDglkpbdG7Qm+fba14u1Qsj0AZmABZaGx6GcGi8xa+9itmxC2fcDpWp64KuM12OQpUo4LhN5GYMC+RxR4szMJqqtOU1U8NG8fhUqCmqjIb2yai4/6yhzEd+U6T7XHowWbshKZ8L7fSllHPGeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742596; c=relaxed/simple;
	bh=97xYRe7oX1AaIVjWvu0MEYS7PvyoNJ2dyboXx71xStI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pC3GHBKm9ugWCN6b8/2kO9X4TSrC+aC52+OoTrCEVkub60Ns8RF+Ou4TGIPTC4QQB/SeQzd6DTNJ3QP2c+uMHBQcpnhfOmRzd4pVOsLDFU5Mh+PxzbTRGzNbFoQNp6Tun1G2He79fCOlgGOnFqNuVcdKhifvR6vLb0fiidu44AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1hPGGuhf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE17C4CEF7;
	Thu,  9 Apr 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775742595;
	bh=97xYRe7oX1AaIVjWvu0MEYS7PvyoNJ2dyboXx71xStI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1hPGGuhf/tqwBqkId0zyrcAnOe235mHgWO0IcNUpKVNu2qVNTTauE7jiTzWrFirdi
	 adUiKqgUbdlDGsHEOqCZWrXkFK8Fx/t+Hog0sUbVJjF03rLOCzirLjUyQnXus6RJUK
	 9DRAYN/x6kbRvwm46TaB719e3pYuqOMV6TrLvMXs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 3/3] media: stv0900: bound DiSEqC reply length to msg[] size
Date: Thu,  9 Apr 2026 15:49:46 +0200
Message-ID: <2026040944-postwar-sway-810f@gregkh>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026040943-finishing-daredevil-d6e0@gregkh>
References: <2026040943-finishing-daredevil-d6e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 34
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=97xYRe7oX1AaIVjWvu0MEYS7PvyoNJ2dyboXx71xStI=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnX11W8PJVy8vycVr1Qts0fZ+hu2+B0wuTExi0MD25c8 RTo/a2+qSOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmcngiw/wwa1W1zalSGrKv OmqWrpnG9HZjBCfD/NDl7Rl7V52Zu3DJ9+gNNs/Wei3czAgA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58331-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BEE93CBA0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FIFO_BYTENBR field is 4 bits (mask 0x0f), giving a length of 0..15
but reply->msg is __u8[4] in struct dvb_diseqc_slave_reply.  A faulty or
malicious device reporting more than 4 bytes will the array and clobber
the stack.

The stb0899, tda10071, and s5h1420 drivers all properly bound the FIFO
count against sizeof(reply->msg) before the read loop, so do the same
thing in this driver.

Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Fixes: 99277b3824e4 ("V4L/DVB (10803): Add core code for ST STV0900 dual demodulator.")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/dvb-frontends/stv0900_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/stv0900_core.c b/drivers/media/dvb-frontends/stv0900_core.c
index d15c55de2723..0ca6b6d81273 100644
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -1773,6 +1773,8 @@ static int stv0900_recv_slave_reply(struct dvb_frontend *fe,
 
 	if (stv0900_get_bits(intp, RX_END)) {
 		reply->msg_len = stv0900_get_bits(intp, FIFO_BYTENBR);
+		if (reply->msg_len > sizeof(reply->msg))
+			reply->msg_len = sizeof(reply->msg);
 
 		for (i = 0; i < reply->msg_len; i++)
 			reply->msg[i] = stv0900_read_reg(intp, DISRXDATA);
-- 
2.53.0


