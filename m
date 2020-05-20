Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68E51DAD5A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgETI2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgETI2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:28:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E708C061A0F
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:28:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t40so913429pjb.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7r9YYLSengfvIHUlMZpd1/OKiqgkBJxQNdhHXmT2kHQ=;
        b=C93DKS4xFKdMVXRIcDg5fcDM2zqHijY2EhSpnpYZsnMbYay2ejfBUKzqodhrnh3THR
         sC7lFT7pRwyack7HULavoEH9E7LXK/W8VCGIzA9e0FKPV0+P/CX239QSrjV0E+YjHP5B
         RghgWtPmBt2PrecXJNvZntTPB+L80s/MQ2gUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7r9YYLSengfvIHUlMZpd1/OKiqgkBJxQNdhHXmT2kHQ=;
        b=Vn404Tj4MKDV1zwMOftsPqpmER7rbcq0h/f4A605heSIg2XP5y+yn7P/YqvJXm9U8Z
         RlYGhYAd2DZHXGPK9Xwy5DS9XAVqh5/PQoG6Q57OwzWpMfQaU4zXUyK7U481ZviAp+sL
         s+Y+k/kTwlUX9kLiJVST7+OQNULFffafYwKbGb1kZsbc3P/JgKNxk8UvwY77EhtwvGfc
         U8u5Gq6Xa4VHK1MJxY7duWVOQR/OHcjL916wm7Hmw68Pe/5xCS80JBakxmlGKQCdhl9i
         UwGnuRNh7U1AcslQFSGuCkcYUm4JFw87RVvtUaVVL8/CvcVp7ot695U8RbMpt8rypGev
         5YQQ==
X-Gm-Message-State: AOAM531Qrle76VzFZmCyqQo4ykBnuugHa25YMS/ojzCJmxp6mDjlIJxq
        XUSZ2MeyLa/wPDGnHhJfIH59sg==
X-Google-Smtp-Source: ABdhPJwK6gNDvdtF1BxVTkUj1Iwdy0j31hahJ+SecDW8ZT0OXwTdw7Ix5QWKcjBtqKtbFMdy09WdPA==
X-Received: by 2002:a17:902:9a46:: with SMTP id x6mr3402053plv.52.1589963288729;
        Wed, 20 May 2020 01:28:08 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:28:07 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 08/10] media: mtk-vcodec: add support for MT8183 encoder
Date:   Wed, 20 May 2020 17:27:21 +0900
Message-Id: <20200520082723.96136-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable encoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 59b4b750666b..a271611750ad 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
 
 enum mtk_chip {
 	MTK_MT8173,
+	MTK_MT8183,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index c8a4b85a81c4..b8fe408dd6c7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -62,6 +62,14 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
 	},
 };
 
+static const struct mtk_video_fmt mtk_video_formats_capture_mt8183[] =  {
+	{
+		.fourcc = V4L2_PIX_FMT_H264,
+		.type = MTK_FMT_ENC,
+		.num_planes = 1,
+	},
+};
+
 /* Wake up context wait_queue */
 static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
 {
@@ -424,8 +432,22 @@ static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
 	.max_bitrate = 4000000,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.chip = MTK_MT8183,
+	.has_lt_irq = false,
+	.uses_ext = true,
+	.capture_formats = mtk_video_formats_capture_mt8183,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
+	/* MT8183 supports the same output formats as MT8173 */
+	.output_formats = mtk_video_formats_output_mt8173,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.min_bitrate = 64,
+	.max_bitrate = 40000000,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
+	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
-- 
2.26.2.761.g0e0b3e54be-goog

