Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630DF2F99A4
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 07:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732459AbhARGCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 01:02:03 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43775 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732291AbhARGBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 01:01:49 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id ED3C21653;
        Mon, 18 Jan 2021 01:00:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 18 Jan 2021 01:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PCzIct4KNFkp6
        L3U4mDgTn4G0wrBfrLXfjdNwrVAjZQ=; b=kpc9PZrZxLp+AZplawmNIvAlNMP5j
        3C4hVk7Z0KYQvmHUmshyN7B3U4mZYeXg2HzTCeqo3yCkOs/i0rIVvPNeeW/ARPB5
        w08mMp6t2+To45VlgIVriOazAxQ+Hg3TdQeBKlvU6Wc6WXzhwB9VZO/+QjLxFfCy
        jt2qxb5rJc8mp9VwIBMsWkYdwvA2vlGrVKYaG6/L5i/Jutr+758l+oXou/65aB6O
        /kvOZTkshNPLI4zVaYMcI6hQ5FiG4EKhJKJ6/DJLFhyi/tMlCXjuQUcGXcn6CCk/
        WFCKR2tLS5PEiliZ5FJ1btPUbhk5LV0kbBCbK8ifyPAZVQyJTxx7Yg5cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=PCzIct4KNFkp6L3U4mDgTn4G0wrBfrLXfjdNwrVAjZQ=; b=fLzM+Y75
        RAhGYZ180HKNVqUB8uzZ/+8hlh8PaHBswY86RGk2C+rrc16gqQQu6ZaRy5oP4JgI
        kwc7bmu8oFENInmL6SyUsFw2LsAaTAdNQ8X7ZjwJtHQ7hWx6Y9ARlW3I0ODnVQXw
        NdYZzaVoahKihTw0MLO/MVA61YR94ySmOIZOfR9LBkoT288TtqQSylwGt8xxCE9q
        cLmNcyId3/ewnE6NvtWSsS9qymILecmC+bLMfuZtqUyC1znRIlxoh/4252SqEaIO
        ye6Fb1M+PDc5+b1edxQlEosNcZ/eW9XWjqjdafyDIF+jVxdbTOQUCtVxIYujUvoa
        C7xZwK/4u+DUbg==
X-ME-Sender: <xms:EiQFYAUNBcrNLpg1aC6BEunOQ_uvroDj8qcjIbMSseAN0rrOrBQq6w>
    <xme:EiQFYLfvof9e-V8TZymgdtaxhUF40WZDj2yZTnh-GgWruxDyErGy_r3Pzv1Pt82Yx
    qU9sIG1fCO5APe8CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:EiQFYMsNGKeMpbmE0vvejcMRprZJOYfd-DP6oLS2e-dZ3ZFmY69BhQ>
    <xmx:EiQFYK9rZwhrMHaxw41AwyddRqW24FPsRgc64DHF6_RmqOaV021LHQ>
    <xmx:EiQFYH3QMbuzHjGIry4XuOXyY6mHFi2SQt43ewThAmG7JwIJxLvyMA>
    <xmx:EiQFYEQjajlMwAsDWpQipdpYxjA1wYXnP_FwrBkI_s8urPVtN6XyRg>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 080551080057;
        Mon, 18 Jan 2021 01:00:50 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/4] media: sunxi-cir: Clean up dead register writes
Date:   Mon, 18 Jan 2021 00:00:45 -0600
Message-Id: <20210118060048.22267-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118060048.22267-1-samuel@sholland.org>
References: <20210118060048.22267-1-samuel@sholland.org>
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

