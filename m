Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1824E20AE34
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgFZIIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729136AbgFZIFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:05:46 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994EFC08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:05:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so1660280pgf.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xHNRou80y9oPK1XHkY4t+2RP3g08PmvW2/CQnpLKVto=;
        b=HXd8cN7WAwO9yXq0bU783f15thXywJzamPxWe9xXZ4bcbJvz8TFq7+Gma6SIN+40hM
         DmQsLlFiGud8fA6ewGlYd9YVUDm8GVLwmJU3ZDSUG15sc0DG7wzRlEaw0MCiO48TaBhB
         wNAeceavH0x/cC0f/ak2YlxFQbXeM2+SjLbME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xHNRou80y9oPK1XHkY4t+2RP3g08PmvW2/CQnpLKVto=;
        b=fqeNdBI1n2gIvMzY75f+HMIC3QzoJ7/T4GxTbsg8QPlrB3i37ZlTzq1+V7wP5TEnt2
         PbxPYrV/Xc3ekpcz28oDiviKvn4r3HUmc/QY1misdmUqCLnqEfnYbngBkQjvssokAnsZ
         gJkZGOnS75nxFkLgDzaIvv/WRTnElgNNgmByoNN54PgKVKn03kOTshdPLHSZKL82zNIu
         JIFSfUWz8dg8IfvzrAIADpcAx6RU85BOplryJtUGGzH7wW7NVstfcUe7oVvA5e/s6wlK
         TinmqbJTM4hvu0Oi8lv1IZM6RZ8KW/+GdCiMS2S5W/YIhtElD5zIgd7oediPXCERmHIn
         vvpg==
X-Gm-Message-State: AOAM533AW8BIrNDItRPaxBZnV/QdwQankuFEyJqBllVSPYyW7y1iGHx4
        MteypxFGEWLCAx/7Nyh6+R1dxg==
X-Google-Smtp-Source: ABdhPJy+YEcSOIUz859rpa74XW+WHGJIXKdl+x6O21q/qCBPJQdhlzc9iwX2umrqS3Gsu/B1P+pw4A==
X-Received: by 2002:aa7:87d3:: with SMTP id i19mr1572926pfo.203.1593158746196;
        Fri, 26 Jun 2020 01:05:46 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:05:45 -0700 (PDT)
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
Subject: [PATCH v2 05/18] media: mtk-vcodec: venc: specify bitrate range per-chip
Date:   Fri, 26 Jun 2020 17:04:29 +0900
Message-Id: <20200626080442.292309-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Different chips have different supported bitrate ranges. Move the min
and max supported bitrates to the platform data.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 4 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c     | 3 ++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index e7b155e7432e..b8f913de8d80 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -311,12 +311,16 @@ enum mtk_chip {
  *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @has_lt_irq: whether the encoder uses the LT irq
+ * @min_birate: minimum supported encoding bitrate
+ * @max_bitrate: maximum supported encoding bitrate
  */
 struct mtk_vcodec_enc_pdata {
 	enum mtk_chip chip;
 
 	bool uses_ext;
 	bool has_lt_irq;
+	unsigned long min_bitrate;
+	unsigned long max_bitrate;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index d469ff6464b2..50ba9da59153 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1232,7 +1232,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
-			1, 4000000, 1, 4000000);
+			  ctx->dev->venc_pdata->min_bitrate,
+			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_B_FRAMES,
 			0, 2, 1, 0);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index c1365209263e..221fa0303075 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -380,6 +380,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
 	.chip = MTK_MT8173,
 	.has_lt_irq = true,
+	.min_bitrate = 1,
+	.max_bitrate = 4000000,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
-- 
2.27.0.212.ge8ba1cc988-goog

