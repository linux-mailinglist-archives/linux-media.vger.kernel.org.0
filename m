Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1CE20AE0A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbgFZIGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbgFZIGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD85DC08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r18so4618995pgk.11
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sui+aE36W22DqtS2fgsG54iRuVi4BhJkSmMBR5vkIvo=;
        b=f8w7ucx1BwENgxJR/Rc1pSalVXftgwFc0KkcZbAs/TcppB9xRQDLPkJNPWLBHngmxf
         +I/rAXJjvWJX37+ZaQHg0f1px3DVH8/oo6ANHkBcm9F3LrqCUIkTvKyMC78TcLHx02lB
         YSwHRp+hLpwilQul5ijJegqktK8N6qIeJ+TPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sui+aE36W22DqtS2fgsG54iRuVi4BhJkSmMBR5vkIvo=;
        b=Y8uAEN4sQ1raRu7GZNAA8l+udV2EAArq9l49JGidnvI0s8A2Q7uPslMLw3vgGHUHMX
         ajoxi4Vm3z6qq5IaZVZqcusAilAZIJgvWvO7Wz0PyWhYiaWZnxsEcBdGCC2hANJU0289
         4k4LIHb35YFP01AepDuJGt8M5lSIUW/D1RiurWTtMY8ZQRTTK3dn9Hdm35ivXZP7osaQ
         EU1GM9VZApfoy6cOZYx1mgsTwqo3kioZM05rFn0oD4+h/qplCDoUfHd/DejCyEoQYeyU
         l9PC5IaLYv63xHsMjd0maDPh5HgGoL3LtDNw7Hxlif+oqzMiDXgk38p4l8TsoWbvWCLB
         KaYw==
X-Gm-Message-State: AOAM5312TltD5pvy+xhrClcXqPMLngD+51UNxBQtD+AK+tvD68CCaAUT
        nZ7ZlJMOebXZFq9Rxvkw/bCSVg==
X-Google-Smtp-Source: ABdhPJzZ7MWGk9jvC+DPhRc7+KTbwzgKCEciabh8q+jgkASL1WbRsleAMj3y90vF2Ou1wTEbTB2X+Q==
X-Received: by 2002:aa7:8dc1:: with SMTP id j1mr1625300pfr.194.1593158765373;
        Fri, 26 Jun 2020 01:06:05 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:04 -0700 (PDT)
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
Subject: [PATCH v2 11/18] media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
Date:   Fri, 26 Jun 2020 17:04:35 +0900
Message-Id: <20200626080442.292309-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control is required by v4l2-compliance for encoders. A value of 1
should be suitable for all scenarios.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f2ba19c32400..f833aee4a06f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1206,6 +1206,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+			  1, 1, 1, 1);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
 			  ctx->dev->venc_pdata->min_bitrate,
 			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
-- 
2.27.0.212.ge8ba1cc988-goog

