Return-Path: <linux-media+bounces-62020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHntDdYyC2qgEgUAu9opvQ
	(envelope-from <linux-media+bounces-62020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:40:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A342057024A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5659306C58A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF153F871A;
	Mon, 18 May 2026 15:35:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C1F3F23A3;
	Mon, 18 May 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118545; cv=none; b=jicK5rD0xIPXZbvBp/LAA/xJY311x11e0275uztg5gzrGJgf0huWXqoTOMk6Gr70uuC0uSrO8ig65TeyHeGnK6lPJBGGwvhAYE4RZQBHFPiSxyWHP25Vt5cjdST47j4q8L5e/kB/3YBn9iZK7OUJcqhvKAlG1xXIeiHKbVp+hfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118545; c=relaxed/simple;
	bh=sYIhf9JmRahZxPSD9uuyJqPOBKnqcQVlrS2lbbbjpi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUyKF+lcN9LR3+VM5r0JuwUzhxftbmM+LZxZuheOmvYXEgNuKjtE54xvNuoqxOGKwtNY/8KKDHIdljrJ1kGOaBjj+5lXN+TJGE48bkttxdiqgWu+f/k4eF7rFtJ2F9DSIwaNeiCwkbRf9ZMb6/BiMzg25qAB7Y/uUVrO4Yx3wUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 7B1AC1F8005A;
	Mon, 18 May 2026 15:35:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E3146B407FE; Mon, 18 May 2026 15:35:40 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 2C7BDB407FE;
	Mon, 18 May 2026 15:33:42 +0000 (UTC)
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
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v9 3/9] clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
Date: Mon, 18 May 2026 17:33:32 +0200
Message-ID: <20260518153339.619947-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62020-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com,bootlin.com];
	DMARC_NA(0.00)[sys-base.io];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sholland.org:email,sys-base.io:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A342057024A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

In order to declare a mbus node for the v3s, expose its associated
clocks to the public header.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      | 4 ----
 include/dt-bindings/clock/sun8i-v3s-ccu.h | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

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
diff --git a/include/dt-bindings/clock/sun8i-v3s-ccu.h b/include/dt-bindings/clock/sun8i-v3s-ccu.h
index c4055629c9f9..d635bffd6914 100644
--- a/include/dt-bindings/clock/sun8i-v3s-ccu.h
+++ b/include/dt-bindings/clock/sun8i-v3s-ccu.h
@@ -87,7 +87,7 @@
 #define CLK_SPI0		55
 #define CLK_USB_PHY0		56
 #define CLK_USB_OHCI0		57
-
+#define CLK_DRAM		58
 #define CLK_DRAM_VE		59
 #define CLK_DRAM_CSI		60
 #define CLK_DRAM_EHCI		61
@@ -101,7 +101,7 @@
 #define CLK_VE			69
 #define CLK_AC_DIG		70
 #define CLK_AVS			71
-
+#define CLK_MBUS		72
 #define CLK_MIPI_CSI		73
 
 /* Clocks not available on V3s */
-- 
2.54.0


