Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DC956D316
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 04:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiGKCvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 22:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiGKCvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 22:51:16 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0BF186D9
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 19:51:14 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8A93C3200406;
        Sun, 10 Jul 2022 22:51:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 10 Jul 2022 22:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657507873; x=1657594273; bh=WfedgCAne9
        Vvh18evuXxz77nYdVEdYOfWNpN6Ox40xA=; b=qR8NHwvJQ2M+XXhkNZERSsIpae
        SiBXDGMTnqXOsElsBqzNKUBADSQ1CK/aJ5U+iMto45+72ZZFOIuGj+Wqiy88i/sM
        4YJtjVFL//MSWYLuTJ6XvqY2L+O0FNf+RnfhR55Hb1DOC41Dmvm5uAg5Nh+wgatu
        SKxfguAza7gTKII+xo8SUs/3V/8R4s9uEOr9vZZiKMN651M8GhrHYvQdc2Omgyj1
        ulZAhni36t4rCzxefCVV+JmPVSksgUILJEPnt69lIpMcBP5fg7VUduSBP1cTgpGp
        vVG/vTwkMauzGkskniMDGyjH68e2X34tUcuJy5Z+9SMSYo1TtCqF/vbJKcCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657507873; x=1657594273; bh=WfedgCAne9Vvh18evuXxz77nYdVE
        dYOfWNpN6Ox40xA=; b=UFk0xl2LSbX6m5mNFB0HK6FnKU4cvuCeDL/vOuB2eIQX
        12EOXDidDUoj1cvuD3Qgk3sGm9vX+q9YBawqWEN/JOb6WJp9Kds8FU3taVQh+I8Q
        1pRp7TPvpYkLtA7PihSoWZ7zyCnWU+5MArRFjUX/4TXCLwO6wKZgf72c95+YwoWw
        4fLDEFFnVpPnGwgq2ONyXLsy1rRPk3Gfaf7+P3IKGNHikEDQGFvhHUfcc0MW1qS1
        0be7vZT1WG4MqcLlaF91VYiNnPimRmMRSKkTz1E6CAihY6bdC9FafCmA9DSNQsN3
        alOzU75mCdWh/T3r9LNdZan2L+9cowzJV0OhBW9aFQ==
X-ME-Sender: <xms:IJDLYjOdHMCOyTkKhwfMmg5IyFj64uyZKKR7rj5EzvQ4xgf4NMzIhA>
    <xme:IJDLYt_cZO4tybiH43YCN_3x2zSYJ8lVxnpvz6r6FiaGsbK4Czh71jxi_XJzPchaS
    NQQoDE6xh2ZAHKwV4A>
X-ME-Received: <xmr:IJDLYiS9VhaoLdsguQ3CZiYxObU4DbYwTRBUx3LQ4xakYM0vXa8oJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:IJDLYntM8EoNwEOJr16GDXyc9R4tz3cRDS0QAJ8_OkMYqlKbInPjEQ>
    <xmx:IJDLYrfWrjTx9morvMzmn6xj7SE-ShOHwNjzPjLi0c6yWw4zuQkzxA>
    <xmx:IJDLYj1y9KYPiPWQ5nCCmveznyWQQtAQAFUrwdcNljpr3PVQwa9KZw>
    <xmx:IZDLYi7jKdhruZlYvQnWs61fBLiJenrKjHmNYtoyEFqwGI4l9rGJ8w>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 22:51:10 -0400 (EDT)
Date:   Mon, 11 Jul 2022 05:51:07 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 46/55] media: rkisp1: debug: Add dump file in debugfs
 for MI buffer registers
Message-ID: <20220711025107.xkws7mliucwxjjgn@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-47-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-47-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:07, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>Add a register dump file in debugfs for some of the buffer-related
>registers in MI, for the base address, the size, and the offset. Also
>dump the appropriate shadow registers.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++++++++
> 1 file changed, 21 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>index e76dc2b164b6..1a59c00fabdd 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>@@ -121,6 +121,24 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
> }
> DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
>
>+static int rkisp1_debug_dump_mi_mp_y_offs_cnt_show(struct seq_file *m, void *p)
>+{
>+	static const struct rkisp1_debug_register registers[] = {
>+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT),
>+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT2),
>+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_SHD),
>+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
>+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
>+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_SHD),
>+		RKISP1_DEBUG_REG(MI_MP_Y_OFFS_CNT_SHD),
>+		{ /* Sentinel */ },
>+	};
>+	struct rkisp1_device *rkisp1 = m->private;
>+
>+	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
>+}
>+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp_y_offs_cnt);
>+
> #define RKISP1_DEBUG_DATA_COUNT_BINS	32
> #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
>
>@@ -214,6 +232,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> 	debugfs_create_file("srsz", 0444, regs_dir,
> 			    &rkisp1->resizer_devs[RKISP1_SELFPATH],
> 			    &rkisp1_debug_dump_rsz_regs_fops);
>+
>+	debugfs_create_file("mi_mp_y_bufs", 0444, regs_dir, rkisp1,
>+			    &rkisp1_debug_dump_mi_mp_y_offs_cnt_fops);

You didn't change the file name as Laurent suggested

thanks,
Dafna

> }
>
> void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
