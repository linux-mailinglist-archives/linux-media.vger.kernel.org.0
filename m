Return-Path: <linux-media+bounces-67376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ttnBJ0DU2ouWAMAu9opvQ
	(envelope-from <linux-media+bounces-67376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 05:01:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E3E743A05
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 05:01:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PiL2Vajb;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67376-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67376-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A9633031833
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 03:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D1E36E466;
	Sun, 12 Jul 2026 03:00:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E0C36A01A;
	Sun, 12 Jul 2026 03:00:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825221; cv=none; b=dj3kW6bZyaJyI7LXVezLZBQ9zGmZVSStk3mRTCp4sBfgrReHD5kx16ptVOFPVg6SC9jpOJhhHDS7Eka5ymVNgD3P1rI/9stV9uIH6bPNtlFLxYoRQmYUU7UErmrxmNYST7cWYPrC73P40bz0EhvDchVQtPnvW8xiFEKmT81fkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825221; c=relaxed/simple;
	bh=q2s2FOvbicJk+TqrHhjlreyNpWh5i3wgKoewp4eJcKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXwxA/7nxNFiFRn/N6vv2qN+4CEjRDTiJDeYLGic9vVT1FGevuicWzY/sWu0ntUZ/JMsaQUxyRlQojB/DloEFt1FnFjg5kvYGt26iC9z02o12jTQNUrjyxJwxaiY6ixz4mDNfwuOpYN5ISBJFhGFjX8XA9bLIDOR9rIHEktgbE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiL2Vajb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6491F00A3E;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=+kKJ3JnDN7CMAEU7BuJ5mn/TOdxuZKO16Ai+J9jrTaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PiL2VajbblouMJbCl4hJb0obOawgU6W0DNq/OopJ6+VjFtINEurqUTitTDfoV2K5+
	 XDnRBIpfY9iQMkmobm9cHAqbdGIUbbfGiPj0fH3miLZ8S0lFm1DJD+JC1fQznpl93/
	 ZA57Y1/MmPmkWWzCQASiJucyVaI9MtJtQX3+AS1ErYbLOsusM/Het3OLx8/lhNgEQe
	 Mp/dj+B8DDqrWs2ILYYK47A74i7MmjOcdyK7D1XML+yMIOKi19XvF+6GjgWIgNX6FJ
	 MfpJ4UkdhO7DLPFwRKTOfdGqvbIH50jiVMg4SYHM4QlNovoZ3bLWkAnVUK3Cg56whH
	 hfEl9CR0Jsy3A==
Received: by wens.tw (Postfix, from userid 1000)
	id 050F260162; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 4/7] staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 12 Jul 2026 11:00:07 +0800
Message-ID: <20260712030011.3778169-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67376-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92E3E743A05

The Allwinner H616 SoC has a video engine hardware block like the one
found on previous generations such as the H6. In addition to the
currently supported features of the H6, it also includes a VP9 decoder.
Support for VP9 will be added separately.

Add the compatible for the H616 variant, using the H6 variant data.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v2:
- Drop "drivers:" from subject

Changes since v1:
- Updated commit message on VP9 decoder status
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index bbd186b8035b..ac0217976670 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -696,6 +696,10 @@ static const struct of_device_id cedrus_dt_match[] = {
 		.compatible = "allwinner,sun50i-h6-video-engine",
 		.data = &sun50i_h6_cedrus_variant,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-video-engine",
+		.data = &sun50i_h6_cedrus_variant,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cedrus_dt_match);
-- 
2.47.3


