Return-Path: <linux-media+bounces-64769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bUqwJu52LWqGggQAu9opvQ
	(envelope-from <linux-media+bounces-64769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 17:27:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066467EE8D
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 17:27:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64769-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64769-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DF9830067AE
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9229339705;
	Sat, 13 Jun 2026 15:27:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE12E5B2A;
	Sat, 13 Jun 2026 15:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364447; cv=none; b=BezCZbXoWrlNlUM+Rlbab6D96Ir05EZZynkkqZvXBRDexthosa69aHe2BAC2XqlvoFEIPFfrGsSaHoXVcnOOHeRsva6RruXWw9ImKx2JtTTN4wyr4HLCHzMbMjszPpa/4vFQjJ6tE9epYrWUy9BnycTgV2BbpggxT9Ut365Ko8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364447; c=relaxed/simple;
	bh=Ia+K5OKQ20aA0EOylQsTIY2CEYdx+V8IhQf1h2n5i+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXyUTCQqYUw3RSV24/hKUMjKPuDqkZY5iVJuMPX09qTST1uPiq0/mR/oZQ0al/fi7v+NJSAX2ZCau6b+TUTdnqkUXXc2s8/FBaE+EpalrRAY/q1jWz7ffTLtKK9UXSiZ+N4wFQ7bsG7fnf36dKYc8r5TqAslkMEMsBzaI8gqU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6A5D837002F7;
	Sat, 13 Jun 2026 15:27:16 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 634B4B45526; Sat, 13 Jun 2026 15:27:14 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 1C25BB4551C;
	Sat, 13 Jun 2026 15:26:58 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v10 2/6] clk: sunxi-ng: v3s: Remove exported clock definitions
Date: Sat, 13 Jun 2026 17:26:51 +0200
Message-ID: <20260613152655.212490-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613152655.212490-1-paulk@sys-base.io>
References: <20260613152655.212490-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64769-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:yong.deng@magewell.com,m:paulk@sys-base.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:mripard@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4066467EE8D

V3s MBUS and DRAM clock definitions are now exported in the dt-bindings
header. We can remove the duplicated definitons in the clock driver.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
index 345cdbbab362..c933ef016570 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
@@ -39,14 +39,10 @@
 
 /* The first bunch of module clocks are exported */
 
-#define CLK_DRAM		58
-
 /* All the DRAM gates are exported */
 
 /* Some more module clocks are exported */
 
-#define CLK_MBUS		72
-
 /* And the GPU module clock is exported */
 
 #define CLK_PLL_DDR1		74
-- 
2.54.0


