Return-Path: <linux-media+bounces-62012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH4lO38oC2pAEAUAu9opvQ
	(envelope-from <linux-media+bounces-62012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:55:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A556F540
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BFBE30B0C31
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BB43F20F4;
	Mon, 18 May 2026 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtOuIhiE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF33C3016E0
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115330; cv=none; b=UZEqT1Rr+4XyzMdGqI1l6Zvmfk7An0UgkVDKYL+fOBm0IRI9zTqIySwOFTjyWaDUyKs3z2Fk/wzBLoRh//zf0afyTEM14rk9Cwc/Uqv3KCjGnSm00Dauw/rDYdWj9bb/Fpdl3sg/IIcrdQbOL4H7k0dcPSq+BqFvkaUd1n2RyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115330; c=relaxed/simple;
	bh=Cy1kJ4rFopfeY8WoIvwuo1icLY/akZbENU7TB1mXsD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hudIzem4rsgBFshFmpBNnUplui5iwJ87l40+ADuQ107bBZHesrZZDFD1wKmU1K0GMWJn22r1scb8Ou60CRxOSm4/B/n3dhmoI//eNVebLWQEvkTWwfPNzqGx0w5VoeLQNNBRU6SV/3zHCNusA7hoo1LWC48rPYio6/q6iFVWUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtOuIhiE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF57C2BCB7;
	Mon, 18 May 2026 14:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115329;
	bh=Cy1kJ4rFopfeY8WoIvwuo1icLY/akZbENU7TB1mXsD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VtOuIhiEcItRryalv5xmv6hIuCaRSPMCV7n0ePsJ6kPPbYEWYvEtdBfpFAc20E5d3
	 sfs2f3ETyoEF01WCObW1L1kcgc7u/xmn/YcwslEveIHL74KOVQo/MlxWlXje6xlKq/
	 zTSBTanucd3f/iPcStAPCMNw9i9niZrR7+Qf62Z/4bq5H2PickEKZQg5Xi2/reVWkE
	 21s7VJU3nMmXJB8QwKjCDy9hcmyFlnofL08ZUPMT3U1s8F3IkeEi3Gk6MkeVLwvV5V
	 r9KcHgYASFL1ngeT6JLNOml1sIZVtzpnaUTPhs5urRvqEbl/9156mwwDJwZ1Fyt/u+
	 kca1aNrMadFXw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 3/4] media: cec: core: add LIP support
Date: Mon, 18 May 2026 16:40:34 +0200
Message-ID: <9fb27f4a2133cf46b8e0fc126c2d1ef8b1bc30e1.1779115235.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779115235.git.hverkuil+cisco@kernel.org>
References: <cover.1779115235.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62012-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F9A556F540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the new CEC LIP opcodes.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 8f7244ac1d43..a90cb84a4b4d 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1098,6 +1098,15 @@ static const u8 cec_msg_size[256] = {
 	[CEC_MSG_REQUEST_CURRENT_LATENCY] = 4 | BCAST,
 	[CEC_MSG_REPORT_CURRENT_LATENCY] = 6 | BCAST,
 	[CEC_MSG_CDC_MESSAGE] = 2 | BCAST,
+	[CEC_MSG_REQUEST_LIP_SUPPORT] = 4 | DIRECTED,
+	[CEC_MSG_REPORT_LIP_SUPPORT] = 6 | DIRECTED,
+	[CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY] = 6 | DIRECTED,
+	[CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY] = 6 | DIRECTED,
+	[CEC_MSG_REQUEST_AUDIO_LATENCY] = 3 | DIRECTED,
+	[CEC_MSG_REPORT_AUDIO_LATENCY] = 4 | DIRECTED,
+	[CEC_MSG_REQUEST_VIDEO_LATENCY] = 5 | DIRECTED,
+	[CEC_MSG_REPORT_VIDEO_LATENCY] = 4 | DIRECTED,
+	[CEC_MSG_UPDATE_SQID] = 6 | DIRECTED,
 };
 
 /* Called by the CEC adapter if a message is received */
-- 
2.53.0


