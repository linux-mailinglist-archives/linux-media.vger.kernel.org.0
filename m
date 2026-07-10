Return-Path: <linux-media+bounces-67262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QadwH6/BUGpo4gIAu9opvQ
	(envelope-from <linux-media+bounces-67262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:55:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD17394DF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j1WFMmXT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67262-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67262-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5917A301842D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91D23FB7E9;
	Fri, 10 Jul 2026 09:55:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF343FB7FC;
	Fri, 10 Jul 2026 09:55:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677347; cv=none; b=KJGibmjnnl8qJZtl3QAw5+N2aJ3vATtny8MP79kyXapm+JR3cp2annMvoNekxU+Aebz9YTSXIUTeO+K6AqxNOvSIRxhOtBILYGkNFvM9vu6tsE/cGurDx+jmXXsINC9YPsZEjRa+3V6un6c4cFOyb+3riv7s75I0Q18e4Ph1H8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677347; c=relaxed/simple;
	bh=dpP89IwkrCSY+Boby5eNr2aYXV66uMY7j4AKUwAFQpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSpeNlJ4Z6Mmh1uzKVqpOTN1EWrM9jXFh72IwTwgDQ61ugQj3XmnBOjX14dbvueF4x7SOSX8zV61pCx56+hts0/UD+Re6A4bDzOLJ7/pc/zL9ms5MVfKQjsg/1h2xXz3/yBwsjOX0BiXVMlP3P5iEVcpIkKo2mwa6syro3qT9CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1WFMmXT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14231F00A3A;
	Fri, 10 Jul 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677345;
	bh=iQaqxXqn28vzApdMPz4KwrKOsJTQN2cyIuhVC9UIpl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j1WFMmXTaY0PtHQIbk86URk7AajHzUCyoh+3vsidmjmZEvQ3NeLq7w+B7PNvejsJl
	 JsmtxK0oc6kE3jJMGUV8XAA9qYU1L+ZH4HLzlPzp5GaQyYL4KDxJ4DWVHiucq49d4Z
	 toCn5rvo4FdwCT//wjjBvrKnd1jvBVYQLoSxCH6RAZ3vdXm/bEBC7apNmaD8haZnXi
	 /QXhinHXPh1aPcfmFOBX34+u4OJH3Uh473xP4xTSc9nWgUsecopHay2Efv1GXFYQji
	 8et6aZ1nveFNnX+iYs7ds/xdJGDxr4YcO0j4FYOfp5r+XC2YYdNT3Fgp19eFpPGjZ0
	 5XT//WtIKWUHQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 1/2] media: cec: tegra_cec: don't break off msg on NACK
Date: Fri, 10 Jul 2026 11:53:17 +0200
Message-ID: <7e50d6027e1676650d52905cd20eb212c01cd3e5.1783677198.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783677198.git.hverkuil+cisco@kernel.org>
References: <cover.1783677198.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67262-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:thierry.reding@kernel.org,m:linux-tegra@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1FD17394DF

The Tegra CEC hardware has a bug where, if the first attempt
to transmit a message is NACKed so the transmit is aborted,
then the second attempt can contain corrupt data.

Ensure that the full message is always transmitted to avoid hitting
this bug.

I suspect some internal state is not reset in the case of aborting
a message due to a NACK.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index fe66336e734f..f8ffaeb78118 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -243,7 +243,18 @@ static int tegra_cec_adap_enable(struct cec_adapter *adap, bool enable)
 		  TEGRA_CEC_INT_MASK_RX_REGISTER_FULL |
 		  TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED);
 
-	cec_write(cec, TEGRA_CEC_HW_CONTROL, TEGRA_CEC_HWCTRL_TX_RX_MODE);
+	/*
+	 * TX_NAK_MODE ensures that the whole message is transmitted even
+	 * if each byte is NACKed. Without this flag the retransmit of the
+	 * messages after a NACK can be corrupt. This is a bug in the hardware.
+	 *
+	 * While less efficient, in practice you rarely transmit messages
+	 * that can be NACKed, with the exception of POLL messages which
+	 * are just one byte anyway.
+	 */
+	cec_write(cec, TEGRA_CEC_HW_CONTROL,
+		  TEGRA_CEC_HWCTRL_TX_RX_MODE |
+		  TEGRA_CEC_HWCTRL_TX_NAK_MODE);
 	return 0;
 }
 
-- 
2.53.0


