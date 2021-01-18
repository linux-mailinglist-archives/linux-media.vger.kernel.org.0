Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C622F99A7
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 07:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732483AbhARGCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 01:02:36 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:47323 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731743AbhARGB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 01:01:57 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 5F37C1660;
        Mon, 18 Jan 2021 01:00:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 18 Jan 2021 01:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=TiYp14NjYhNaG
        DavfUkENnnnnmh73vB4utXtV8iWYX0=; b=FPg4r9tRpwRmswroWGsQxOq3qILvr
        nsXHfX+BuWNW1+RQ/l02+H6LFJDlyx+3Folfg9N3/EpSM4jFyUHRaHfVcky3jmWQ
        7PupsshJ+AiVSibidgbD1duvnCQ7xepROMNBRj1vPZkhQn48fqXIkJdkLoDKezhD
        gSE1n12ysiQo91AMYW7o+RcOfC84q0YtfdAW8AS3mCgOUb5RnmJeHWp5DteTqBR+
        xJaXjT+IH4J7ghw0rKUBIgTL6yLmbZxgA0xl6MhVNO+qASTVKmW8iiS20HczQl6k
        sdpXDKJpJLuvENgk8kx4oSXX3lptAPtwQRigbvb29yJ3m/o6xL0oLZJnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=TiYp14NjYhNaGDavfUkENnnnnmh73vB4utXtV8iWYX0=; b=SU6iRwRq
        F7T64xbv8yTN9dgjmPfyWfTiqmT1ZC0jChmvsFGKJ1BbrsIh8qsfN/94G+Jg3egf
        3VKGsbIJY+6iGQOyVOe+euXHrnOvOELnyXBhaNwWDkeh/Vy8kP1fzU4e5PmpWzdX
        Ae4Hyl5h3mtKpcjKXLvgBNpq+YJSfORoJHyEccC/wa+Iw5/8akGlsGH9agTkv9H1
        5ClysimHBD0XNStaI99broATyJMGySgw0XgLnvmwJcLUWqNqlxfMCnA1lWE9V/en
        F0gXVtmk1gTg3k93KfE5UUeN7B8qK0dYTXzfXlD5k33GYN+hD83xphIkTWMlUEvD
        Cpl0xA3XveRuQA==
X-ME-Sender: <xms:EiQFYNVzXe94ZdcuRGiEcbm3kl3sIUquBX0gFoqs-HqHrZnGypSkEg>
    <xme:EiQFYNgwrcdN1tDjyC21On64ub2wK6M_0PpkDWl5sVupSxpweRF9KnFzZSskFAKF4
    a1zMKK2FHrvXmi07Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:EiQFYGTR5JbG_KN0N4t8KrI4F78iJkADco4X3TcWOdt6Hu9Jk1VOGQ>
    <xmx:EiQFYIHsZ1WGGiYD1hPSoiS8_q5m4DRA27h1Uo-ml2-P96EC_7H52g>
    <xmx:EiQFYGmipq8pQLv1fmO7apE20N58u3tR0CVhJ6AbPx7SlMfKjxyZIg>
    <xmx:EyQFYDqVs9yastR_9ch8vmwPmUKzLIEmy75Vf7ZhVdk1tgZ9O4Pf2g>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 69C47108005F;
        Mon, 18 Jan 2021 01:00:50 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 2/4] media: sunxi-cir: Remove unnecessary spinlock
Date:   Mon, 18 Jan 2021 00:00:46 -0600
Message-Id: <20210118060048.22267-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118060048.22267-1-samuel@sholland.org>
References: <20210118060048.22267-1-samuel@sholland.org>
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

