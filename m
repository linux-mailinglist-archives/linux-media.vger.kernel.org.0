Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C286B21CF60
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbgGMGJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbgGMGJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:09:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B17C061794
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so1896692plo.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bQh/36jCZcDByG+9nx4Kj3oZ/1DPecGh3s/vB7rmmZs=;
        b=DzaaXGKEpgVhqKOYBrv2Ua3uko6Tg//W4TOh35bm6GY9/BkI0zqcEeLc6TZXpm7Sfm
         /XgTqZwkYtLSEtoNNHrfGrLK/G/na3RKiExc3Z/NTkrILxC1ZYUiffZ4XZ29QZ9QsAFB
         V9RuE+kPzERAWf/+jzRmBghIJRvi65l8g9G+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bQh/36jCZcDByG+9nx4Kj3oZ/1DPecGh3s/vB7rmmZs=;
        b=fJyebZ2Yrsem9w3fT+nk8waUegRPr/HXHVdD+yMPaz90Qv3o9tHctkTa3w5nRpJeto
         KQuFaxGXsiBz0nWKjWij1G/uU5DrqsMiqISdhmh7lbYwSFYDWTEgErnaa3Mh/mul+f8j
         ggqC0BBj0YLFYr84XvLuplKZQIOnv/igMZ0vFeWInnoZcsSsjcKzYQBTpCiRa59VMf6z
         GcVPgB6BWjNfqAqejLQPGOnzpbm21CBad5JSnxGV6fkZlHpIWeGH8/uBwFT5kYkx8+up
         arflIGY2TwAITNjXf2MF86xqRcXFDvevsPzgwa4+xBzenZVcGIkdcePp6Rcy9X2Kb1KY
         BxeQ==
X-Gm-Message-State: AOAM533yWf0J9+cNK11DTo6S8FETrX7xCGzBkk+Uke+IEylbUCGm5SXn
        MS87b8CK0QU0B8s9iRhojRosGA==
X-Google-Smtp-Source: ABdhPJxi6dRFSoNOfpe8svPhA4stIApLXMgBoBr29yqAkj6fN7ebrXCw8Sp2gNNc+/KJEwH9NIvggg==
X-Received: by 2002:a17:90a:71c1:: with SMTP id m1mr18559733pjs.22.1594620596992;
        Sun, 12 Jul 2020 23:09:56 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:56 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 15/16] media: mtk-vcodec: venc: set default time per frame
Date:   Mon, 13 Jul 2020 15:08:41 +0900
Message-Id: <20200713060842.471356-16-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The time per frame was left initialized to 0/0, which make the driver
fail v4l2-compliance, and also leaves it potentially exposed to doing a
division by zero.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 1b79185cf922..09baac2dbc36 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -24,6 +24,9 @@
 #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
 #define MTK_MAX_CTRLS_HINT	20
 
+#define MTK_DEFAULT_FRAMERATE_NUM 1001
+#define MTK_DEFAULT_FRAMERATE_DENOM 30000
+
 static void mtk_venc_worker(struct work_struct *work);
 
 static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
@@ -1197,6 +1200,8 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
 		DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
 	ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] = 0;
 
+	ctx->enc_params.framerate_num = MTK_DEFAULT_FRAMERATE_NUM;
+	ctx->enc_params.framerate_denom = MTK_DEFAULT_FRAMERATE_DENOM;
 }
 
 int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
-- 
2.27.0.383.g050319c2ae-goog

