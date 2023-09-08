Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D31F7987DA
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 15:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243578AbjIHN3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 09:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243555AbjIHN3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 09:29:12 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE741BC1
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 06:29:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c1e780aa95so15381845ad.3
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694179748; x=1694784548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fTqSPosGVFRSuNbuDzcDh8MPrifrDs8eg/tRpTv6/E=;
        b=S/6Ktyxahte69BF8wIV8rn2HryXahP7SvQqUxAWzqpxjbP8luJKRC2N5gycAQ8WNrO
         V/ITDrX04wzc8uLXMC84jzhLs1X/aKjxD4hIfDaUqnnNhGT8+/zwOaIxJUQoXEfY0bFW
         TXEbHnR5mJQBSnUYIAKQmyI2zEcNuXUTjQWkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694179748; x=1694784548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fTqSPosGVFRSuNbuDzcDh8MPrifrDs8eg/tRpTv6/E=;
        b=c4Vx9ukaycf8K0ybhWwUm2QQbxhc85bApdA4QQlUn0NMp+U+ox2dLMu1kM9r1Rk6eY
         +bAqH6R2SEh94JP1xG0JmWBvaH17G0cuXawcWUbP/CC+wvMAfqM8bcn3GD3HBnWnhJ1p
         R5pJvfVSAVXl2vbSS0AmUHTIwTzuEjotpuWngzxyVmYXCdVWvul7kJ06hSf11xpVxpTR
         p22hU1/K4zlUo30F9IwklSKBS9xE0iULYmBoU1KLZK8m6pWCwlRBntICnq5BqVW7ik/H
         zrdBUO8aySS8yycvR0yBo38ZbY3ScmFVXGyAkzsl1Zlrxc0rhD4Cl+P5CRWHP8sJYdcR
         EkTQ==
X-Gm-Message-State: AOJu0YyiuSccr0/Ea6NAmWahIAcdRDiWr/PB+TuUMxkVUCsfn6Crtm5r
        nPDHL9h+MGjxVJzQolDgnllSYw==
X-Google-Smtp-Source: AGHT+IHWCBplIrjcCzuUpgb9NC4rnhznC4Bx+ZzE6bt7VuZlgtVVJg0EhVEiMWW50/fNxqh+vxaWSQ==
X-Received: by 2002:a17:902:ce82:b0:1bd:c7e2:462 with SMTP id f2-20020a170902ce8200b001bdc7e20462mr3029639plg.11.1694179747803;
        Fri, 08 Sep 2023 06:29:07 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2f7e:9c4:ed14:b826])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902778c00b001bc6536051bsm1562560pll.184.2023.09.08.06.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:29:07 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH] media: mtk-jpegenc: Fix bug in JPEG encode quality selection
Date:   Fri,  8 Sep 2023 21:28:04 +0800
Message-ID: <20230908132839.2034566-1-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver uses the upper-bound approach to decide the target JPEG
encode quality, but there's a logic bug that if the desired quality is
higher than what the driver can support, the driver falls back to using
the worst quality.

Fix the bug by assuming using the best quality in the beginning, and
with trivial refactor to avoid long lines.

Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 2bbc48c7402c..f8fa3b841ccf 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -127,6 +127,7 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 	u32 img_stride;
 	u32 mem_stride;
 	u32 i, enc_quality;
+	u32 nr_enc_quality = ARRAY_SIZE(mtk_jpeg_enc_quality);
 
 	value = width << 16 | height;
 	writel(value, base + JPEG_ENC_IMG_SIZE);
@@ -157,8 +158,8 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 	writel(img_stride, base + JPEG_ENC_IMG_STRIDE);
 	writel(mem_stride, base + JPEG_ENC_STRIDE);
 
-	enc_quality = mtk_jpeg_enc_quality[0].hardware_value;
-	for (i = 0; i < ARRAY_SIZE(mtk_jpeg_enc_quality); i++) {
+	enc_quality = mtk_jpeg_enc_quality[nr_enc_quality - 1].hardware_value;
+	for (i = 0; i < nr_enc_quality; i++) {
 		if (ctx->enc_quality <= mtk_jpeg_enc_quality[i].quality_param) {
 			enc_quality = mtk_jpeg_enc_quality[i].hardware_value;
 			break;
-- 
2.42.0.283.g2d96d420d3-goog

