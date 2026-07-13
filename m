Return-Path: <linux-media+bounces-67527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZVWzEvZZVWoMnQAAu9opvQ
	(envelope-from <linux-media+bounces-67527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:34:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4174F48C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=VOGD8gWa;
	dkim=pass header.d=mess.org header.s=2020 header.b=cXuqPrmi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67527-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67527-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 819EA31431EC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28A936D9E0;
	Mon, 13 Jul 2026 21:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A3363C45;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=XLtERcjdlMDqUDi9AUqFlMpV6UJrQY6TjG15r7i9BDo5ZfXKVi5JXZL22vZ+XFb98qyZRindyMC3uE2xLO7PWGiSoCimZoEqBtidZr//Q4GtNkLKMHZXI692vV/rWyN25R9XcUMkJ69LUK+PysBagdgw1/3wTwESlPnT8fSM54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6YQrqwTqRkmGrqtz5qR+Kn2wosQ7GRhj+jvEHGN+ijZ0Is5U7jelmbh9Es9ONJVQljwrgBjMwf+auJAZL8CZR5urMRugKKc+3CUya6KLVLcRBOvA8avH8u4BB25XgxLSbMy9yGS8xtZq+rovvwN6oO83UpriIr3X1kmZoiF15M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=VOGD8gWa; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=cXuqPrmi; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978287; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOGD8gWa+quOr9YeBp/h4VX9sJ9uaqQjyOFcR76rg3f5qxMTBi8DP03P235wN7C3x
	 bvY8yFfAgFo+86daHResImzh+blajKWKV+Y7/FuWvzaCmM0RYzx2VrX92pa7hX1TVH
	 evMNRbikEaH6DRswKiCeW1Nw1U6oMdxxLx//KZvP8XAnr8tLVQMj6bcIxog4Dh/uj1
	 +FJ27Q1EDl4RWf/tqBu1ujRNxunw69XGkRJl9RpxJcEJuuUucYS6hDWFnJ8zgA6WfL
	 d7yPq/cz2j6aWwgOnOdmCCc27H3WJ+V6DOYQKXEURUN4JgsZSi/Pz1PUE1AnTHxJZV
	 vFnKc5UCdl5eg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 5E26441F04; Mon, 13 Jul 2026 22:31:27 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978286; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXuqPrmidt0dnxcHe8V5AM1bmdamGmL8yswwwk8ITkwdMjNvUAPU59YsldlUNIxKl
	 NxZw3IPA1tlC5rDViDXGtYbfcQVNf3o0dU6k5U9E/66FLD8krs0PWONQH0v9ZwsRHM
	 sBNUlTsXmm6tV9PmE/x2dRZhEM+tnD1u6AMo8zYu/sGJkq7r3LqAehVdMsQ/2TfWO4
	 OacQFJw79kk6acd+K/ZJRKqNA7ZNRCTQ43CNIpVmULtycChVOvhYHznLNaQaCtt1Ny
	 Rier5SZK8mI9GAmHTfo03FsLjMeGFz4g6Zl7Ni89jR88Ix5N/++0+Ff/L1o7T4HMGK
	 O9uQWEvp5qWcA==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 13A9241EFB;
	Mon, 13 Jul 2026 22:31:26 +0100 (BST)
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
Subject: [PATCH v2 09/11] media: meson-ir-tx: Ensure probe error is propagated
Date: Mon, 13 Jul 2026 22:31:03 +0100
Message-ID: <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67527-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FA4174F48C

devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
propagated else the probe will not be deferred, it will fail instead.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index abb107d19e8c..174d5135e1bb 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 
 	clock = devm_clk_get_enabled(ir->dev, "xtal");
 	if (IS_ERR(clock))
-		return -ENODEV;
+		return PTR_ERR(clock);
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
 	ir->clk_rate = clk_get_rate(clock) / 3;
@@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	ir->dev = dev;
 	ir->carrier = MIRTX_DEFAULT_CARRIER;
-- 
2.55.0


