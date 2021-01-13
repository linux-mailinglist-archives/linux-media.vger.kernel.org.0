Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668872F435D
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 05:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbhAMEwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 23:52:41 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43559 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726367AbhAMEwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 23:52:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 9EF451A84;
        Tue, 12 Jan 2021 23:51:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=TiYp14NjYhNaG
        DavfUkENnnnnmh73vB4utXtV8iWYX0=; b=qCLbWtk/M+ckGcMdYO965LqCFPohV
        0pIsMOVjausLkz5/hBdCI4OaS6QJ3gm1z4MkpeFouqT1Yo39lrELhq7VvsdVK+mK
        XTaWN2VYdcpeyDe1N1/ll2yzT9BE1qakwUsj7X6O/XTU3xHBDTZHSQlyeX+Mbb40
        ks0sjZk/bmHBan55pvsfiBjt8jRsWkWwlblpt2ZCfYr2EmfLqZHkbBaGpYROErVc
        OVxmRCK/zw0ifcyxmvVOljbPy55ARUOIQOq4H5M64dmosixbvYMILN3jTWhV/sBH
        brY5HSHBJHzUqAkqwLh2IWNrJfbYGjxM05XlcpxbGMkpRX0LrUIDgN04A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=TiYp14NjYhNaGDavfUkENnnnnmh73vB4utXtV8iWYX0=; b=q3bxNVUH
        ctYdAmPvOX/PW5lLmNA6M8vlki9xZXsbU8FtScR/8i8o0uzkigpKkaHQjdZK1+lq
        CRF0uCpxucYue/ds8tYc5g9om9N5GUHoRJPkxLpFbqMLIf4lcFiSNKzzh3+lE/Mm
        O9/K0Udjx4d90Ib9GEDw0gqsY1MXl5JmQKiiNJJnoKwEbH5SB1Suaj3hFUOUWWkN
        9crkc6NKL5xhq9UckB9xRaHbzvcILx4rxy9Wnxf63ZYhhotP0WmdL3Yz3S/Lrr3F
        DsSaICF/n23/gXef/9V4mKAi5rTmZVF+DPZplP+jTzMpL0aZcuk+fGw6281cb3lJ
        Z0LD4hhoY797SQ==
X-ME-Sender: <xms:Vnz-Xwrxy5Tx1Y-wXBBEO8IlujRwzC7gK4TQB-vp6L2ODS0LRF8LPQ>
    <xme:Vnz-X2q5kr7XhZIz5t_AmcNdgqzYE29aqt61nPV9irG9Zn9yyJfQQ9Ik9GsPkvpF6
    7hX7Eci48l8TosIJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:Vnz-X1OGJsgTwqbYCsivX-yAur8v8z_suVHlL7zic-wWv5xOnqPSvg>
    <xmx:Vnz-X34vfejgQjVokF2Y-JM7Vio3UbArzi3YY3ZK-8qHD38PLK0WkQ>
    <xmx:Vnz-X_4wZL7SbicYukkiE_pNSvAk0jlWZHYsjdIqW6tJL3olfGlGBA>
    <xmx:Vnz-X8usnwMJmQsZKEauEb0f5K2S-Ut3nwkWkqdiyxYY5CEthYYbVw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id AABC3240062;
        Tue, 12 Jan 2021 23:51:33 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/4] media: sunxi-cir: Remove unnecessary spinlock
Date:   Tue, 12 Jan 2021 22:51:30 -0600
Message-Id: <20210113045132.31430-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113045132.31430-1-samuel@sholland.org>
References: <20210113045132.31430-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only one register, SUNXI_IR_CIR_REG, is accessed from outside the
interrupt handler, and that register is not accessed from inside it.
As there is no overlap between different contexts, no lock is needed.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/media/rc/sunxi-cir.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 0a7f7eab3cc3..48be400421cd 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -86,7 +86,6 @@ struct sunxi_ir_quirks {
 };
 
 struct sunxi_ir {
-	spinlock_t      ir_lock;
 	struct rc_dev   *rc;
 	void __iomem    *base;
 	int             irq;
@@ -105,8 +104,6 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 	struct sunxi_ir *ir = dev_id;
 	struct ir_raw_event rawir = {};
 
-	spin_lock(&ir->ir_lock);
-
 	status = readl(ir->base + SUNXI_IR_RXSTA_REG);
 
 	/* clean all pending statuses */
@@ -137,8 +134,6 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 		ir_raw_event_handle(ir->rc);
 	}
 
-	spin_unlock(&ir->ir_lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -160,17 +155,14 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
 {
 	struct sunxi_ir *ir = rc_dev->priv;
 	unsigned int base_clk = clk_get_rate(ir->clk);
-	unsigned long flags;
 
 	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
 
 	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
 
-	spin_lock_irqsave(&ir->ir_lock, flags);
 	/* Set noise threshold and idle threshold */
 	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
 	       ir->base + SUNXI_IR_CIR_REG);
-	spin_unlock_irqrestore(&ir->ir_lock, flags);
 
 	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
 
@@ -199,8 +191,6 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	spin_lock_init(&ir->ir_lock);
-
 	ir->fifo_size = quirks->fifo_size;
 
 	/* Clock */
-- 
2.26.2

