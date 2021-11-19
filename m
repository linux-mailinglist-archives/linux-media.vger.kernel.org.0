Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E371245687E
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 04:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhKSDS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 22:18:27 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:56585 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231129AbhKSDS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 22:18:26 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 3BA3E2B00BDE;
        Thu, 18 Nov 2021 22:15:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 18 Nov 2021 22:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=h3Hk7f2yCSyGf
        a4CWbT3bM125byZdGI9jFEAsPjrUwQ=; b=AxLhODWqienBU8Do+yo3CcUcBJMPM
        V9OqhuvQNJL7vrum6akxrmQtxtCGu+xcm8rv1mVgwIOI0EDGi3ZznGsU2kkxaMK4
        +WAlppjRlRkhxgPkoZxx4/1uAtml/Zs5vDVIOEgqLJy46CseiMlhUs5nW3OhVsly
        Itu5PGaXleD5nlg5kC09oIcX7JV93cvwwIEgVkvrc+89BhzZ31dQXQal4g9zVf/P
        zsYWNC1GKO7X7zDh1feW9BolfIxb77cnsxbGCCoA6vFtElFSw7FCE1KSE1zLwYZO
        xTRGI6L+KUX/tdW1PYYnt+bw+B4nh3QbLagnryT+daLW4ezz/2lie955A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=h3Hk7f2yCSyGfa4CWbT3bM125byZdGI9jFEAsPjrUwQ=; b=a18hLt/8
        FDtoWwMqL0CVOaUonM77tS0iE2MWRCJHfq6c6xqH28qiL0MPBM9cxMdvc9CpwRTy
        EZNkz4Yy8icloqT0TdY0g13nMVvIbGZaYSUbaT8Cwt2Go3JBAgjveyTK561xb1Eq
        bc8RyMOT7cwOIkP1MEtw/Uzy6jOqXztZ2t8sx4AuuGRJTpoAnH+kmPFdul1GmYh/
        Ym+VzXOK0VfsbYiN0WanBowiLWIDYDOgT3rtbXgu1XTxP9BfJ7E4wcTfmMEXtbg6
        jX/fufl6HgWbPU5lgjQLIE3dpa9abrH9IADaNq5c69ZZ4UkUaK1Grm9gmaz2qlu3
        uTNYbyb36/g0pQ==
X-ME-Sender: <xms:yxaXYX0g1TolDVBhEp7dyXJ4p3rZOhwujk9_RKnaFXx6e1gU7RFAPA>
    <xme:yxaXYWE_ISmQbVe12PiM2-6Cta_exn_pBkkWrIjMX6QJWufwNG5aVejT4YizKOlfk
    t2-_bLDYlAeytnXqA>
X-ME-Received: <xmr:yxaXYX565eR4F0zm02SDbMHUbnjNXiYLM4JFGS0tCgbANhv-P7UdIf-gf9ADfHuBr7Wy3E-445d5TOKvCzhMgrfN2o8oXQ8-x0xu84HF15K8NV0LLKpfuCr6hS_tstANN6G1LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:yxaXYc3HzRZRK5lIcD_hgggUZyEhAswXF1efdZMxWVIG2RAuOcNt4g>
    <xmx:yxaXYaEEYMrTxMXo5Nn2XN1Zj20rgOYhLtrceSzHAe76PeKxP4zGhg>
    <xmx:yxaXYd86XdK1EOrpbR3uJ5apiGbWTD-3giZA0WOTFFijBfexOc1PJw>
    <xmx:yxaXYRcNQB7D4Xsjlmnoy0Fg2yQtk6ZLnx2a_QK5t7CGoa0QBS2m0Uo4GlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 22:15:22 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: cedrus: Add support for the D1 variant
Date:   Thu, 18 Nov 2021 21:15:18 -0600
Message-Id: <20211119031519.23430-2-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119031519.23430-1-samuel@sholland.org>
References: <20211119031519.23430-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

D1 has a unique variant of the video engine, which appears to drop the
VP8 support found on most earlier variants.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/staging/media/sunxi/cedrus/cedrus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c76fc97d97a0..4a4b714b0f26 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -580,6 +580,14 @@ static const struct cedrus_variant sun8i_r40_cedrus_variant = {
 	.mod_rate	= 297000000,
 };
 
+static const struct cedrus_variant sun20i_d1_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC,
+	.mod_rate	= 432000000,
+};
+
 static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
@@ -637,6 +645,10 @@ static const struct of_device_id cedrus_dt_match[] = {
 		.compatible = "allwinner,sun8i-r40-video-engine",
 		.data = &sun8i_r40_cedrus_variant,
 	},
+	{
+		.compatible = "allwinner,sun20i-d1-video-engine",
+		.data = &sun20i_d1_cedrus_variant,
+	},
 	{
 		.compatible = "allwinner,sun50i-a64-video-engine",
 		.data = &sun50i_a64_cedrus_variant,
-- 
2.32.0

