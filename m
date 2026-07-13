Return-Path: <linux-media+bounces-67526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t3LvEVlZVWrqnAAAu9opvQ
	(envelope-from <linux-media+bounces-67526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:32:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EB74F45A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:32:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=BzaAWcJR;
	dkim=pass header.d=mess.org header.s=2020 header.b=TwulCmiu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67526-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67526-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 571B7303AA04
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF56F36AB54;
	Mon, 13 Jul 2026 21:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816C363C46;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=cfYhxUf9RhV8uAuYxmHSqSQDBQbIEDjLAL1w9mz45Zskaw4CMN+dVShIY3/5JW4ZK+vtALy4eSZwsKzCUZBxIHVTct+b/5g3DfxsDbW9ZI3UhSUrRPegasEPquq9BObpbsCcgA5HQVIXDhHKSM5ds7ixNR/38Eku7ITVsWPO6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAGJpCTNzqBBdFwjuxAftjm3RjcR0kgZ9h2MhP2l9WeUYLWPqGt3upgoaf88ej3GkDSk2dOtOMNv09McZ30M6jzBPsuDEzCcTFmy/7WsDLQqAvJfh+sONqSwTWf6y5SsdbsU/IC4p+3E+2ZFeyW+debK20Jz6deRhNcLDjnzjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BzaAWcJR; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=TwulCmiu; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978286; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzaAWcJRf1fuSNITS63VgWSbr5lHBUYPKoff1N5GWbBgQ04oVw1h1G7iv+ARRXZbK
	 hkwuS6fqsIu3Sz2Gvsq9h3W6H1Ohncx5mafktXZCBn95eKDt0Eg1AJ3KUAzinXST3F
	 3VTGKAs4x1DUJ1k5oPHBi4xDL0fs3MMiY14DoY43Lg+w5cQOuiV58mK6cMXxHNfNUz
	 fkXuz1NTt052BtFRYHhGZ1Ps9jN+GBVTmVqMG/Ho9vb4pYKsacwtQlLWHyQAIXY+ul
	 JyDJk7UF8a94sf8CYVQfsIdfdl6oVo6KYz4IBENULe56rcvGXxMcPXxkG0sx9bK9f8
	 bpi9xqSgYOJNA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 1BA3B41EFD; Mon, 13 Jul 2026 22:31:26 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TwulCmiugN+lltjlfM2DqYPhNlI8LGpTve9ADDH1HsnZk6DXgFJtqy720R/WLdars
	 VXtpl95Oem7oVX2JL/SBdYtJAN5VvfPl/pRwGFR/WLTOr6m+yjmk7lBMIt5TFppa9F
	 jcjjDIEAAo37DPh7bUTQKWN8pSDyw2/VU+OSVhe9fPfQH2f8E8FQ4kLEPD8SusxDTJ
	 poGEom10IdzicSlkAIiHwE8w5QCVc19C1dNb5pQ+z5yaiAtetmKo+OErEhhKoGNcuw
	 gbBFgK95aEfxgFt+v8O3Fafh0IIdNFGXQEIZEfl4YPf9qOkDEpuLzl5YVzMwsIUDIT
	 hLZI/lrhAFfxg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id AC44540A3B;
	Mon, 13 Jul 2026 22:31:24 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Mon, 13 Jul 2026 22:31:01 +0100
Message-ID: <5f880faac5530202a07dcf92329476608bbabfc1.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67526-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[vger.kernel.org,mess.org,kernel.org,linaro.org,baylibre.com,googlemail.com,phystech.edu];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:viktor.prutyanov@phystech.edu,m:mchehab+huawei@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mess.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A76EB74F45A

clk_prepare_enable() needs a call to clk_disable_unprepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index fded2c256f2a..e7bb107e6a84 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -288,8 +288,8 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	if (!np)
 		return -ENODEV;
 
-	clock = devm_clk_get(ir->dev, "xtal");
-	if (IS_ERR(clock) || clk_prepare_enable(clock))
+	clock = devm_clk_get_enabled(ir->dev, "xtal");
+	if (IS_ERR(clock))
 		return -ENODEV;
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
-- 
2.55.0


