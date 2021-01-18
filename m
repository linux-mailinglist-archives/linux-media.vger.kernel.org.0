Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE482F99A3
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 07:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732455AbhARGB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 01:01:59 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33593 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732323AbhARGBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 01:01:49 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 2BBFF1654;
        Mon, 18 Jan 2021 01:00:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 18 Jan 2021 01:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=APUXW7opGCrXk
        J0FX4uaEp3rryEdb5R1fRBATUuYTOM=; b=qsSVq+hOyAm1CHFlR4JOonLTl7qxh
        4I18dJqO6AbzXerv2cGxKkY025xWiUgwIABvQhnKeBaMHUZ/IZ+OdRs36esqk/mJ
        2iEzCnowIJTfpRQjKalVf5BgsC2xStuQGIRrrKhdCDfhUTJImzpCW7c8HnaOeqmx
        rOsBmiwKaUqcjp0iemBUcrtIJjh75hJyLaPcbPKqTmRi6w8Xg6m8BwJoYbFjyST2
        1TSP4ajVcmJCR9cihC9RWNc87F/cR2kWDj3dHW2yhdfui939LGLLL2SEShlyZkqZ
        O7FgrWOYQyU2RSguSjVFyUGnmzD8BWjs5rxSmn6Clp73N9g7TJ6VygUHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=APUXW7opGCrXkJ0FX4uaEp3rryEdb5R1fRBATUuYTOM=; b=OUn2j+Jt
        cqoXjF7mevlqrYIaBGXjgh3UuTwRi8orDT2pA/S2h0yxCZJnzvbUndNv5hgNGJZq
        cGKdSI2YytzbgsvVC8v0dr5dwqHo+sgXaQySk4dW8RQMZVHv/xKu12QqseqR7OZr
        nyzpvxewQbuBiTWChqwgwPuHIv7/tBfsRvTa64D72mpvlrlZsHrhLnhjYLnPVHZ7
        DEANBedxmrJxnlTSkaMtb28Wrsj7vVyOcGnTLgsZ4oawuD+k94Oy7Ctc9vrupEtl
        zlorgT25rdyz3lmxzxbwKvWbQ8FrrbgnZTbmy1T4OyKWFaiR+9SQSjRfoUkgnMms
        6vQzIczdrTANdw==
X-ME-Sender: <xms:EyQFYBOkc3OHRAKmZiaKlBWptvf6vlAhW8VHKdrIzZPAR_iJHZQxFQ>
    <xme:EyQFYD8KIBGwjLrcx-uyXn0KcbHjdXPfQRPEefB21YTMAO7bSC4x7voOcBv2nwxUC
    8s0wXsi1Atgmfn_JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:EyQFYARPTR_kwefbiR8mfr65grPRiGLpBCmeLzvYDE3VdzQu5V5nxQ>
    <xmx:EyQFYNuoe11JDupCtyjhx8YDZ8KcFZF1e5b1G5FqI1Ie5fYqUj0cCA>
    <xmx:EyQFYJdrg7c34T3-YFi2SWfvJ8zUuUAVnuY48lsGv3qcTwMzEQS6-g>
    <xmx:EyQFYBQ0rluPfyMLbHYMtm2wbpnHIqLoqsLZA4y2coVpmOY6WCtBYw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3A5391080067;
        Mon, 18 Jan 2021 01:00:51 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 4/4] media: sunxi-cir: Implement suspend/resume/shutdown callbacks
Date:   Mon, 18 Jan 2021 00:00:48 -0600
Message-Id: <20210118060048.22267-5-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118060048.22267-1-samuel@sholland.org>
References: <20210118060048.22267-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To save power, gate/reset the hardware block while the system is
asleep or powered off.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/media/rc/sunxi-cir.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 2d099da8d3cc..168e1d2c876a 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -234,6 +234,20 @@ static void sunxi_ir_hw_exit(struct device *dev)
 	reset_control_assert(ir->rst);
 }
 
+static int __maybe_unused sunxi_ir_suspend(struct device *dev)
+{
+	sunxi_ir_hw_exit(dev);
+
+	return 0;
+}
+
+static int __maybe_unused sunxi_ir_resume(struct device *dev)
+{
+	return sunxi_ir_hw_init(dev);
+}
+
+static SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
+
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -362,6 +376,11 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void sunxi_ir_shutdown(struct platform_device *pdev)
+{
+	sunxi_ir_hw_exit(&pdev->dev);
+}
+
 static const struct sunxi_ir_quirks sun4i_a10_ir_quirks = {
 	.has_reset = false,
 	.fifo_size = 16,
@@ -397,9 +416,11 @@ MODULE_DEVICE_TABLE(of, sunxi_ir_match);
 static struct platform_driver sunxi_ir_driver = {
 	.probe          = sunxi_ir_probe,
 	.remove         = sunxi_ir_remove,
+	.shutdown       = sunxi_ir_shutdown,
 	.driver = {
 		.name = SUNXI_IR_DEV,
 		.of_match_table = sunxi_ir_match,
+		.pm = &sunxi_ir_pm_ops,
 	},
 };
 
-- 
2.26.2

