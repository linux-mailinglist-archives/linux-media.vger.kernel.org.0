Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC6C3890D6
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347649AbhESOcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347595AbhESOcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:32:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EB1C061760
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:40 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id g18so8358865pfr.2
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/JegrmtPw3esG/3ONCAiiuwrewSM2bmGc32IKl+Wak=;
        b=e/0683k5vnhao0MCIfGZACYaPEVYU2bl/WZxt7NjbMOfkAlfCxAViAbId0UB7Odl5V
         SsztA8+oVVyffcTEsp5QwfYpVYqZk+652QCCg/MwyMdZO/HdZY071TP+ofLANRFg7oFM
         pcjAJ9UprGKmqPVzdvMePFt3nDM7UKv2N3RiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/JegrmtPw3esG/3ONCAiiuwrewSM2bmGc32IKl+Wak=;
        b=hEtBC/oGUTxnpyujHCFlJyr0nubWWpy7eBR7T9HSGzzE2aAhGAggAXttyXIJFvv6IA
         iKdIoPVl+/8RO/XvK70MgMv30Eoes+CfXPvWR68VHP2LxTj5SavuQxyrAxGEn17Xxbwi
         VbWo8RZCmufFupnNzLNK9NpYDec58tJe9t5pPNfUSKapF9LY4pgkAk9LCl1yezl1FDOU
         xUMm7p2RaBXH20GPQbS+5B4NYMjn7LtfvGpJNUxsMt3IRvMsz0XCdPbt3lStBHrlv32B
         M6WXPKhspZxuVEqkP3TtejnQOOwMHzRfowLH6kFHqJT24A1zlkqby6LFmVs6m0oneJH3
         dREw==
X-Gm-Message-State: AOAM5304/gLiuYyrgJyVI5WHzFYGw9+sf6AXyUAA25Rg7iEA1266wIXL
        7kIrlrfbqHif09ZS1vQK2hB+oA==
X-Google-Smtp-Source: ABdhPJwj+dDw2M/xBSoFiLwfOMAGPnq2OgavxTLnltYVk7rgjWKTjHRU0Xtzoj+g2ZXxX7RNqOlCsw==
X-Received: by 2002:a63:38d:: with SMTP id 135mr11417309pgd.285.1621434640225;
        Wed, 19 May 2021 07:30:40 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:87ab:ff82:1544:697])
        by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:30:39 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 01/14] media: mtk-vcodec: vdec: Support H264 profile control
Date:   Wed, 19 May 2021 23:29:58 +0900
Message-Id: <20210519143011.1175546-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hirokazu Honda <hiroh@chromium.org>

Add H264 profiles supported by the MediaTek 8173 decoder.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
[acourbot: fix commit log a bit, move to mtk_vcodec_dec.c]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..8df8bcfe5e9c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1421,6 +1421,16 @@ int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+	/*
+	 * H264. Baseline / Extended decoding is not supported.
+	 */
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+			       &mtk_vcodec_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			       BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			       BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
 
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
-- 
2.31.1.751.gd2f1c929bd-goog

