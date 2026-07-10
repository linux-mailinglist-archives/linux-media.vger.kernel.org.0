Return-Path: <linux-media+bounces-67261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w3H2EyTEUGoM4wIAu9opvQ
	(envelope-from <linux-media+bounces-67261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:06:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B47396F7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:06:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fP4bq/1s";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67261-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67261-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12DA43037FD1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C813FBB6A;
	Fri, 10 Jul 2026 09:55:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1AF3FAE09;
	Fri, 10 Jul 2026 09:55:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677345; cv=none; b=QYVW6mRZoAE4emFrTVouUuXXZerpdfviYnl/XYmaltscuqfVq2+E0v2Yg+9jkzGVAHxPkHn9W3GbChfVJfrzy6qrEO9yaLSeq/O9Oi6zrwsefAncxznsc18Hgf29/YOXjDK+nKaITm6IXzogSYHJWq3mrOdZOOzKhiO9+YBsKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677345; c=relaxed/simple;
	bh=tWY6C3t6udzI1h7GbvMkiPpLFinalxm0AV1s8uBNDNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXH9GaQb3kCmX5HKWqL6VFbfTrf4W+5Nd29kJnmM5t2RvPi0w6EwGQOHnHBbX2A2gBpBjkr4taQDiolp+uFHP0KhzvvblIoNZuEOGMazOQhp1/SuYBG16rq/Ah0iJiUVsqIBG1xGYHa1MrgZFrqkRNyOiM27Nal/dJFv28r82BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fP4bq/1s; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4141F000E9;
	Fri, 10 Jul 2026 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677344;
	bh=p1sLo3Nek8v6onAKaQJIjAiKOK5QMb+gDS7RP7xgleo=;
	h=From:To:Cc:Subject:Date;
	b=fP4bq/1syHhLNPHolhHFItheoC9Nk5+sBll+Us1tEYbxySzF8nXprUEbz4jpA4Bk0
	 y891c4Ocy0x8GKower/NZVTry+H9P89ztTVtOryy8HRJd6Cxy94iZEwSggsQMGOsfT
	 DWp8JK0YLfUuqjZS//fFAkliq20ziA2STC/hSO4fXInN+qtOKFem1MbcA+1CLjFOWK
	 EbQ4TOp05s2yj7yKvh+GP3I8d96ENhDePXAKt/2p2BfnOcuid1ygE7ZBl1RvLJjh8g
	 C6auxzX6UKedW1MQ8AT3QYIBxNVzg7BBHg7mYM9zcFHUtVDEFFrHHldsvBQEj7QqTq
	 2FRN2RefahG2w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 0/2] media: tegra_cec: a fix and an enhancement
Date: Fri, 10 Jul 2026 11:53:16 +0200
Message-ID: <cover.1783677198.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67261-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:thierry.reding@kernel.org,m:linux-tegra@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
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
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A33B47396F7

Two tegra_cec patches: the first works around a HW bug where, if
a transmit was NACKed, the retransmit would contain corrupt data.

The second logs when a Low Drive is received (i.e. generated by
another CEC device). This helps debug issues with (typically) bad
cables or CEC voltages.

Regards,

	Hans

Hans Verkuil (2):
  media: cec: tegra_cec: don't break off msg on NACK
  media: cec: tegra_cec: keep track of number of Rx Low Drives

 drivers/media/cec/platform/tegra/tegra_cec.c | 32 +++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

-- 
2.53.0


