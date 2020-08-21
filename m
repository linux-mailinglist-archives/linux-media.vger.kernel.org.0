Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0398A24D2C7
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728805AbgHUKiV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgHUKhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:37:13 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C385C061347
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:13 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q1so648489pjd.1
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekjLtdTB1tlhAjxDSbKswQOhIE9zJ8hB2G5KwSjR5pQ=;
        b=m/R1f9ToXYY/+PVRjHvpCuIsIRuwpVURsaigb7iTY1yPgNsKT2u77UDTwskqBOgKUl
         NnMNY+4zlpvL6GG3zSdsKdM8sqYlEzBFlHMLF+/yYAbr574opDOqS3Xb66vt+PXwigCu
         QMjtcqHyNGLhDz7x95f3PRqPyFPyTHeeWXEHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekjLtdTB1tlhAjxDSbKswQOhIE9zJ8hB2G5KwSjR5pQ=;
        b=DrrS2H4NW3jv4u3zfyJtpRbQ3NTPhdQAjjTVgPvt4Q9WN6qmljivp3Hc1Y/J+4Ev05
         jJVlICTAXEHgOM+ir26Jn2Z0SlQAdLYoOJDDloare3Zq3r+Bj1YVVxydpEwltq9wHkyJ
         TzJyDsjzHPGV5gu9I9fIxRyKNptpRLfk2mHBlwB4jctbIRwztQQXitT50R2rBZRNQyGT
         Op598TAfocieeOLciCv2f7PqeSlF9oSiL6InIFCxB8nNuNDs5ug6bw51QhdNa3XiaO1G
         YHZ7dO9NrDzhU6bBvyM83JqhQr1MyOcX+r1M3RPKSISx9/kz6aY4/L22EOT7SURI7W+/
         0Brw==
X-Gm-Message-State: AOAM531OurFtmuLNddorUrGfA4xnr4ygT5BR8ClhpdyyYY/bEaaEQGQk
        hVuWR4nru0a7exzyO8087Pb3Rg==
X-Google-Smtp-Source: ABdhPJzcIKlchcjtfsSPdntvdlGRT/ghRkAj3ul1YF/GP+TM/O6jn9gAhwaC+lY4FoWRJt/Km/XZ2g==
X-Received: by 2002:a17:90a:cd06:: with SMTP id d6mr1933357pju.202.1598006232939;
        Fri, 21 Aug 2020 03:37:12 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:37:12 -0700 (PDT)
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
Subject: [PATCH v4 12/17] media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
Date:   Fri, 21 Aug 2020 19:36:03 +0900
Message-Id: <20200821103608.2310097-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control is required by v4l2-compliance for encoders. A value of 1
should be suitable for all scenarios.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
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
2.28.0.297.g1956fa8f8d-goog

