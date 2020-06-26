Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFC320AE04
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgFZIHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729284AbgFZIGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B288C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:24 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r18so4619306pgk.11
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/SQkaIkQYThWAWodZ31ujagTBZlI1iDzzrB4vJVM6s=;
        b=AeFZoIN/fr4cIMvuYSHhq5dGMtYtBpPIl51KTcus8jLUWyrsd3bW/QasAwLiUnyKVY
         XZpKXuglmID8LOTPDjHjFNu2TwHeN1HZkNaV3zQfD9hr5pTYjtzScffE2nRLKxx6ik91
         TzRISkAX1ZMMqV6aGLGPlhHGNAFPFkw14UNIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/SQkaIkQYThWAWodZ31ujagTBZlI1iDzzrB4vJVM6s=;
        b=jP/UFqWimz1DVcT5qSjoIm9b6Chksd4PW56HiKPH1ksHZq9LVO9rs3p/2sCpRho/8a
         lCTsxw5SzWLxTWmUGCgz8/FJ7TBVpsIi5liOjktLxjnnBjpt8C1E2HSIvcJ1WgCFb880
         U7GeyHQSEFDAcwozR1uOZEtwqRkSbWeyRQdOBAS5ZqW9cjU1gPIsMuX4U3JHSSPFtWLV
         HNzX7DpHY0wBqcqtaAAx1gOQ7QLhW6VAaLEUAm9YvtKohHnR1NR/iMOdd6bP/5lwMxKW
         me2Fb+hm2UJUuhnWgpbJ5yN81LaZrDyjV7L61LL6Bih37gCPIWMMrG9Z9KmDcuWu4WV5
         QE5g==
X-Gm-Message-State: AOAM530fMpxTSV5Dx3zfuITazbkopr0ZOu5C+gpAam/q2eiXEei9wN/v
        AcIQpA1B4aLLWS3fWpm5KowuJ8iQIPhhuw==
X-Google-Smtp-Source: ABdhPJzcGcfKhOrU39qKlXLmxNs5YJdjrelLysgC2xeVATizxK3iWSsOEOtEmDWKAZT2UkkJEJdMbA==
X-Received: by 2002:a63:9246:: with SMTP id s6mr1658143pgn.22.1593158783791;
        Fri, 26 Jun 2020 01:06:23 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:23 -0700 (PDT)
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
Subject: [PATCH v2 17/18] media: mtk-vcodec: venc: set default time per frame
Date:   Fri, 26 Jun 2020 17:04:41 +0900
Message-Id: <20200626080442.292309-18-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
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
index 346a33c6869d..c9756a4748ef 100644
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
@@ -1199,6 +1202,8 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
 		DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
 	ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] = 0;
 
+	ctx->enc_params.framerate_num = MTK_DEFAULT_FRAMERATE_NUM;
+	ctx->enc_params.framerate_denom = MTK_DEFAULT_FRAMERATE_DENOM;
 }
 
 int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
-- 
2.27.0.212.ge8ba1cc988-goog

