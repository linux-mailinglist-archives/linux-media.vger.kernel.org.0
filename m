Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44AD05631F5
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 12:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbiGAKxV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 06:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbiGAKxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 06:53:16 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921031FCE4
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 03:53:14 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d5so2008123plo.12
        for <linux-media@vger.kernel.org>; Fri, 01 Jul 2022 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ljX4VHxLEnJH6CxFcKPCMc5PmhMdDAHdoJtj9hiur4A=;
        b=ZJnV0EvEevnHaF+V45Jfd/vZCRzSzdRu+irbWKzuk44igljTEEObfiqNT4/id84ew8
         7LivaevSw+4G+bwl8ZyCUeOaZp07/xdf0+jrkbHA5CHHEgH33hoqd8rMrihn5oMudQuY
         aBsMIJICDEJxnECnNaZF0mmMNd3PMDVHVtKOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljX4VHxLEnJH6CxFcKPCMc5PmhMdDAHdoJtj9hiur4A=;
        b=s8zD6V5m8srwiUJme1ghI2+6YCv9VhZ1s9Gevzh95fV37xGDFzaMkbXTQohN3DOZKZ
         v/+7mrBLajIMcSH3dsh7ejgeNraNCeLBINpXEVyFrZSCHmSu3XqOqg+vEbghETELQYC7
         G0ZJrbBrHXOnyAEz7vpgVOejGLxNj4x3k1g8RCsnALD6MoDsL6rine5OGaXRQSEEO+bR
         07EgZ00f7HTAR4i1mk0N5Sbb0C8ERvjpMi/qezFi2KP0fg1oXWu67kQS1iY37ftcCiH5
         FLkcCjDf2CdsdF7ljqIKX57WhGHLrKn41AoqMPEjQqH1vT1uG44ufpW9Z2gptWL/93zp
         kqHA==
X-Gm-Message-State: AJIora+57G09rTSGRixaD0vvWP/bb/a8ESJ4weEreVSmmg5BJ2gehICp
        A6PhOFxA9ji7OLqUwcDdhIr4sw==
X-Google-Smtp-Source: AGRyM1tgfY+HHtcbLfi96MHFfZj/RaDV0HbBWEhSC7TBeizj9KXzshRAWOyabhIS2FBHMwG4J9iaYg==
X-Received: by 2002:a17:902:bb8f:b0:16a:80e7:e5d9 with SMTP id m15-20020a170902bb8f00b0016a80e7e5d9mr20663846pls.25.1656672794162;
        Fri, 01 Jul 2022 03:53:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:13 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 4/6] media: mediatek: vcodec: Revert driver name change in encoder capabilities
Date:   Fri,  1 Jul 2022 18:52:35 +0800
Message-Id: <20220701105237.932332-5-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This partially reverts commit fd9f8050e355d7fd1e126cd207b06c96cde7f783.

The driver name field should contain the actual driver name, not some
otherwise unused string macro from the driver. To make this clear,
copy the name from the driver's name field.

Fixes: fd9f8050e355 ("media: mediatek: vcodec: Change encoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 4140b4dd85bf..dc6aada882d9 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -22,6 +22,7 @@
 #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
 #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
 #define MTK_VCODEC_ENC_NAME	"mtk-vcodec-enc"
+#define MTK_PLATFORM_STR	"platform:mt8173"
 
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index ccc753074816..30aac54d97fa 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -232,11 +232,13 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
 	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
 
-	strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
-	strscpy(cap->card, MTK_VCODEC_ENC_NAME, sizeof(cap->card));
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
+	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog

