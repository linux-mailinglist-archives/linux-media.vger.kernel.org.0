Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458162F4361
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 05:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhAMEwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 23:52:45 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37185 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbhAMEwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 23:52:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6CEA61A98;
        Tue, 12 Jan 2021 23:51:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:51:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=ShOwykOk3rSnz
        klCoW5PQa5WqRMT3Vxxh+HMfWymvtk=; b=HL2IFPwvUEd8MxkJj1jonsK6s7Y0C
        fCNIfOgFo1yAiBEBnpoSOoG8J1trlQakrrlMn4lNSHsnGD5OR92Yn72fVnlGzx0T
        M+cdi7YlkPorXwUTsqBOs9/Mv4E/OPdNICGsIPpdQGfrhxGCCld5/paQ45Mi5RuR
        TRWCZ8VYjKHBEVN+HVXZPUijUDZSGRJg9TUeZ4EJA7pdbXDqTPzizmebuLyp5pKJ
        59/k3vOJuvN9t24qlznFJCHHR+OCXDVcqBDSviABGsvdSOSpIvY+zGlJ5N0IcoTN
        svXkslDzYfM9vdyGIk72ehB764r27seuoWgWiMe51MzhMeitr28z7kceg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ShOwykOk3rSnzklCoW5PQa5WqRMT3Vxxh+HMfWymvtk=; b=YFDkxPoo
        TmIrELCm4qonBUPoRI+TWhkWCpNYOZf/+bEpgXWKVRbvR3tA4S8FQ/98CrKkVFx8
        PFPeotEGPFF1SSVuB4HufwfsdOCgFQBM3P2tL0nCsR+6Ffpgkcgw7qXkqcEa8nts
        UIk09V+7EnGK0QaVt8guDTzyOyrRnnl2HpLQe/6cWO6cPC/vFbRLs5iN/NeOl4U2
        R4LrXgkkZ5YRVBnQbv2wvB4nK7+fkq0Txbv0EdkrwI1iM4nn/dsTCRpJL9DUlf36
        Spxto74LOp0fTHbt9kOZaJomZBZClr13hfRIJYc6wj5CmE8LRTCJIZLZG2QTd9H+
        +qPAhgxieHVX0g==
X-ME-Sender: <xms:Vnz-X8AHriibEptU0zYPO6pmVAJ-_OsENVsCeh39JxNu6UU0zg6z1w>
    <xme:Vnz-X-joBZrwr8VT4jq2Y7LGFRaxHAFdZMQH9z8a7s4LXTUP9i8CQqOzIHfDQICkg
    AnMEJ_3MyAWTTw-Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:Vnz-X_nyBMH9CNbV3o7fe6GW9QjqR4sXq5LkV0CclI40XyJn3S9bKA>
    <xmx:Vnz-XyyW1tHh6HMSJ_N3mq42TlMxCGDU7Gd1htzDtywVHxFltjMOyA>
    <xmx:Vnz-XxQ9HfgPFRqaZ8Qu61CwqAaldaB4m7tA3fCnW8RwwCpSZgc56Q>
    <xmx:V3z-XwHdrN4w_o9mw_I8-mwB3xdrJP8_LyOtE64RhGoaqVto1XQZdA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7BB4C240065;
        Tue, 12 Jan 2021 23:51:34 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 4/4] media: sunxi-cir: Implement suspend/resume/shutdown callbacks
Date:   Tue, 12 Jan 2021 22:51:32 -0600
Message-Id: <20210113045132.31430-5-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113045132.31430-1-samuel@sholland.org>
References: <20210113045132.31430-1-samuel@sholland.org>
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
index ccb9d6b4225d..a0bdbf6f66c9 100644
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

