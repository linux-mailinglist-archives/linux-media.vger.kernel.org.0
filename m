Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021B624D2CD
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbgHUKit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgHUKgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:36:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E5BC061343
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n3so622802pjq.1
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wSZSbDZ08cylSEX/G8IrfjovP8UHcDWFoSMCGLeK/OE=;
        b=R+zAOoZHsNc/stod/r/22gFK6RbLZtdiNUGAaLfmTULxkEppYgt/JtzLl+/kg+PIoa
         Cn+eEXY+M2apC2Klr5JWM02ho9+2TEBh45Viqjg9UsCOaH7VZMTCfeZB5vN4pES1P4Sy
         Gr53ndmfioz+ugcsmrGOsngymjRQUKuQdjkOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wSZSbDZ08cylSEX/G8IrfjovP8UHcDWFoSMCGLeK/OE=;
        b=gCO/Kgj05kQOHXHX7VY5kwiOCjtvRzE39ctwhwRPBynD9tFMf3bEmPH0UucCyHa/Wo
         WmJr7Tg6BAWH1gZFXDo6U17lPOE8ymNmUgh6SIzhaPXCydgH9VhDgqvzarHh+cM6kUGF
         Chn0a5XKj58Lo8PYesQuUtwWA3sbG4pG8DM1vHoXfRqIk5TIrD6EkEnU3Y66izAS38GM
         Oevy3/vxWCai99jtuTOawixfIjrwAMC1aQw7VOlL+5T+BrpppkcN1mAHtlhPq2lEl1Ex
         YBVI4DCa1kw7KOiwcyw4tdXelPY6IxpBxU2O5nt56O17r5QkKWOqWsrg/wIox1+ZL6OO
         z5eg==
X-Gm-Message-State: AOAM530FUt/EQOaUipgkXF2a0Kxz+ePQ5DDFKdmwCfnNS1Re3/PQiIP4
        SHyomxfNaC456rTKnx6sfhOa6YRmKBnyJPx4
X-Google-Smtp-Source: ABdhPJxOimO6yUX1CD+nnRroMZNOhDxgH6Dc+cxLXKfy60hZyujyWWzQxkjkFARUJ+QFUULBwkeb5g==
X-Received: by 2002:a17:902:c286:: with SMTP id i6mr1820004pld.63.1598006212707;
        Fri, 21 Aug 2020 03:36:52 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:36:51 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 06/17] media: mtk-vcodec: venc: specify bitrate range per-chip
Date:   Fri, 21 Aug 2020 19:35:57 +0900
Message-Id: <20200821103608.2310097-7-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
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
index 1676c26eb229..e4b28fefcc95 100644
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
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
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
index 379b6638f7a9..602f6a9c13e3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -386,6 +386,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
 	.chip = MTK_MT8173,
 	.has_lt_irq = true,
+	.min_bitrate = 1,
+	.max_bitrate = 4000000,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
-- 
2.28.0.297.g1956fa8f8d-goog

