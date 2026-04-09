Return-Path: <linux-media+bounces-58329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JpSC3mv12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:54:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF53CB9CF
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6978D3037996
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22AE3B52EB;
	Thu,  9 Apr 2026 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WQH9jp1/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED73A5459;
	Thu,  9 Apr 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742588; cv=none; b=B08YZL0rbYGyKNoTw8mkgrOyt9jHEAmnTabTjRbocYDAkUGk8HFQmYo22Kl73Z8AuywpnKbtplrchpbicCkKkGxOnwcmWYiHmjl4ATEga1Lfd2QtrHk/rCltSyYFgD8g+DNcdnExUCaCsKwhUl2opfcQpsUqUB35pNEUeSKf2N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742588; c=relaxed/simple;
	bh=Accc1DDK59ZqoGajH/rYDRfinvJ7K8paT0pHNtx24w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvSS5ckTIWsAKdnREhDkfqcon3LV2yAUDZ13dbdDHzfLHNW6VPI27uvAKssjkY9C02Fa/f6lNUxhtTd19Kq4hc8yzK+qp8LEZBQ87UT1FmbvQQ/3aBmz1gB9PAS7ZSqETAUvFMhD8mZJcmEA6HlHMYTjrDxgJDdWRggCfPd1gvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WQH9jp1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57965C4CEF7;
	Thu,  9 Apr 2026 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775742587;
	bh=Accc1DDK59ZqoGajH/rYDRfinvJ7K8paT0pHNtx24w0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQH9jp1/kHy0PEbkH1WQaylDACvj/DqUGwPtg00UUmIKUWzf4BZTU1L9i5lixxtrJ
	 /zrZfH5/6O1/gwzWv4iCwVh4iOWQgU9dA8EQtJrHsp2wW7opcUidWoiPyQTI3l5Pou
	 8/X6yW50v8T4HzOU2MxXJiKKjRMMjDadZzIadOK8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 2/3] media: stv090x: bound DiSEqC reply length to msg[] size
Date: Thu,  9 Apr 2026 15:49:45 +0200
Message-ID: <2026040943-goliath-both-2ee5@gregkh>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Accc1DDK59ZqoGajH/rYDRfinvJ7K8paT0pHNtx24w0=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnX11XYCU3YVVBzM1V+be/mO8ryPLsebgjX3NRTJy4ae +XZdvYjHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRg+UMC1aYMR8syYkv/Oe4 wUvq6qaa+R8uRDEsWHzVP6Wde5rzPMsp3i/TyxVTvN8/BAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58329-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 71AF53CB9CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FIFO_BYTENBR_FIELD register field is 4 bits wide, giving a length
of 0..15, but reply->msg is __u8[4] in struct dvb_diseqc_slave_reply.
A faulty or malicious DiSEqC slave (or i2c bus glitch) reporting more
than 4 bytes will the array and clobber the stack.

The stb0899, tda10071, and s5h1420 drivers all properly bound the FIFO
count against sizeof(reply->msg) before the read loop, so do the same
thing in this driver.

Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Fixes: e415c689a884 ("V4L/DVB (11579): Initial go at TT S2-1600")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/dvb-frontends/stv090x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index 657df713865e..d4bf6d28961a 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -3902,6 +3902,8 @@ static int stv090x_recv_slave_reply(struct dvb_frontend *fe, struct dvb_diseqc_s
 
 	if (rx_end) {
 		reply->msg_len = STV090x_GETFIELD_Px(reg, FIFO_BYTENBR_FIELD);
+		if (reply->msg_len > sizeof(reply->msg))
+			reply->msg_len = sizeof(reply->msg);
 		for (i = 0; i < reply->msg_len; i++)
 			reply->msg[i] = STV090x_READ_DEMOD(state, DISRXDATA);
 	}
-- 
2.53.0


