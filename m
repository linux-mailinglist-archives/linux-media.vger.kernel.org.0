Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149A02F435A
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 05:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbhAMEwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 23:52:21 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56865 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726018AbhAMEwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 23:52:20 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 663C01A64;
        Tue, 12 Jan 2021 23:51:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PCzIct4KNFkp6
        L3U4mDgTn4G0wrBfrLXfjdNwrVAjZQ=; b=Sr91CA8VsbVff8KnqJA8EGU4jmLHv
        wOQg5/Ebb5Uc3oXac/q0RAt+XodIsq7RacLgvhMgbZovZfhPLcb0F8JnHemXaWHP
        GHbhHGI3V8mfbH789188yAX3rKmg63jLYAKiiUZWkDaJN1QImpKzYLXPYkahV8G4
        JJKb8PEYCKoZlcf4bs4GsxpMt8NiEInsPXkEkw6LZPUyp2XTxPVVNO87XLwlAYxd
        VFLum/HkXXnCdq4n9N30ewiPnUwcr2sx9nf0JM0bXNP8Ba1HRzFiduA18iDLOf9f
        JZsFZB6bnLkua8H3acEjSGrbOsDMLAi9GxN/TbAYmgfpvQRjtZbwYsiWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=PCzIct4KNFkp6L3U4mDgTn4G0wrBfrLXfjdNwrVAjZQ=; b=LJBYi4cq
        jFMkSIxaQVTZ+gTCXE0ufe4wktk48GakMc5bKKfblXQ0ctAjaCBonsLo0L5SAQ4H
        3SSGpAaDKIAvA67XRBMAdUbsR2JIHBnON+OPKS14s30M+96PwPM24N4X5akeR64O
        BQW8wCmPS+QG8Y4zagbxoAPy0ScBTo7k3SFBU/rHPSzCa1VxuXRZXabEaxpbjnwV
        A53onNPiWnbijlVo1ilEMGNKPwkyXuQoq2+00+glLKo2Prdl4jIWrjYJKAI+q+Be
        LTBy6XXR4wkJTZRy6pnqliW7PAnJ3Fuzoo2Rm8IJA3RbHo3bWt6YXuKoGesKfwyN
        76Zpsm9UM+cocg==
X-ME-Sender: <xms:VXz-X8QQRXldJL55TUVsgMj1JqbPyUrNyCx4DlBDf3COck5uO0yPig>
    <xme:VXz-X5xXHmR65IktHCARh_Ipxr9Ovw_EkYDbMckUliyUfnI2ohnxncAPXikSa7IoN
    b5ucj0lXzCy0wB5SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:VXz-X53N0eZ42ufTep2JXYRBPFU4duUPSz2hdcjUT9Bys4QTYzXQ7A>
    <xmx:VXz-XwAGr72O9g3GS857EsE4zsj7MTE6zDHzXhYliSFsoRgtmrz2wA>
    <xmx:VXz-X1hSLccJq1Gn2PJUutFBCxcY9NYvwa-PomkFYO5j4Ljo_lYgDQ>
    <xmx:Vnz-XwUv6BiXsCW_7m103zAt_cx5nzwQusfsxO8TYsw_VG1swcr2Aw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4824E24005E;
        Tue, 12 Jan 2021 23:51:33 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/4] media: sunxi-cir: Clean up dead register writes
Date:   Tue, 12 Jan 2021 22:51:29 -0600
Message-Id: <20210113045132.31430-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113045132.31430-1-samuel@sholland.org>
References: <20210113045132.31430-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The register writes during driver removal occur after the device is
already put back in reset, so they never had any effect.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/media/rc/sunxi-cir.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 8555c7798706..0a7f7eab3cc3 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -342,22 +342,12 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 
 static int sunxi_ir_remove(struct platform_device *pdev)
 {
-	unsigned long flags;
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(ir->clk);
 	clk_disable_unprepare(ir->apb_clk);
 	reset_control_assert(ir->rst);
 
-	spin_lock_irqsave(&ir->ir_lock, flags);
-	/* disable IR IRQ */
-	writel(0, ir->base + SUNXI_IR_RXINT_REG);
-	/* clear All Rx Interrupt Status */
-	writel(REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
-	/* disable IR */
-	writel(0, ir->base + SUNXI_IR_CTL_REG);
-	spin_unlock_irqrestore(&ir->ir_lock, flags);
-
 	rc_unregister_device(ir->rc);
 	return 0;
 }
-- 
2.26.2

