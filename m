Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEDA55CBA3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiF0LZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 07:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234872AbiF0LZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 07:25:06 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA1D65B5
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:25:03 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g20-20020a17090a579400b001ed52939d72so3663438pji.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7dXRxtZvr+s2XVNzWzC29rU2+VQvIIaYQPfnDdLc66o=;
        b=lCQwBZgKD56DJpohXiDdqChHVRMNjjSIqJXaJj7O+tImuokhzYLrf/x9F8WeAVXDLm
         QqC1o5Dd3iwCQnUcchQy2Yzm2viR+3DCLfQGVlr9mtRWSOsI3uJUFUi3FhZoVvQcx7aq
         FXZGJKa1Z/lT4IQCHxJq7hiO1ySSh4/+6HQk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7dXRxtZvr+s2XVNzWzC29rU2+VQvIIaYQPfnDdLc66o=;
        b=4IoKzgFLB5vGibM10bPPBHiYMFe8LGZhyvcHH77cpiMh10I4DAL5GLWzfVqHsvwdPE
         rlGtDxRC/2OWJJdN/p2Y6fC5+eG/LI0Z+2fGgQ7mHi+pd5D2cJR3MPc7v4UyB9sfiU7q
         O6AtuEtSmC1Ox8AHzKnU68b7CWZMcN6gHEVb3KMb+7a0EVc8j1YmFf3fEru2NJoKLkEk
         eb8X3/O0H/9Mx41Dl0rIQzlZt5B3OdP+WNRuevwkj/IoOGUGkTjdygKuSJO9+cZXJ5jF
         fpa2L5963bc98IccpinB9wyt2HVRrM2YnPGAi2HFXaSZWzwoVGVZpY1aXpRCpo4ewofi
         VIZQ==
X-Gm-Message-State: AJIora98npIv+3PEAfnSvRCySkIOkp59gNJE8RCx0KhC4+P3N2TJXIXB
        EwASr6Qp/Vckb/zkncsz+3OFgQ==
X-Google-Smtp-Source: AGRyM1viOHWHl84VVlTGqpixiZ6FlTpaaah53khsejDs3LQ40SRGD8i9SytWAXzQY+IU7V1myB2eqQ==
X-Received: by 2002:a17:902:f10b:b0:16a:198f:bedb with SMTP id e11-20020a170902f10b00b0016a198fbedbmr14357909plb.16.1656329102608;
        Mon, 27 Jun 2022 04:25:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:25:02 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 2/4] media: mediatek: vcodec: dec: Set default max resolution based on format
Date:   Mon, 27 Jun 2022 19:24:00 +0800
Message-Id: <20220627112402.2332046-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220627112402.2332046-1-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
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

In commit b018be06f3c7 ("media: mediatek: vcodec: Read max resolution
from dec_capability") the driver ended up blindly setting the maximum
resolution to 1080p, even if the hardware and default output format
supported up to 4K. This would only be overridden by a subsequent
S_FMT call.

Correctly initialize the maximum resolution based on the default output
format.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec.c  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index fcb4b8131c49..f1b82d4c5be5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -169,6 +169,16 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->sizeimage[0] = DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
 	q_data->bytesperline[0] = 0;
 
+	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+	    q_data->fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
+		mtk_v4l2_debug(3, "4K is enabled");
+		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
+		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
+	} else {
+		ctx->max_width = MTK_VDEC_MAX_W;
+		ctx->max_height = MTK_VDEC_MAX_H;
+	}
+
 	q_data = &ctx->q_data[MTK_Q_DATA_DST];
 	memset(q_data, 0, sizeof(struct mtk_q_data));
 	q_data->visible_width = DFT_CFG_WIDTH;
@@ -177,8 +187,6 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->coded_height = DFT_CFG_HEIGHT;
 	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
 	q_data->field = V4L2_FIELD_NONE;
-	ctx->max_width = MTK_VDEC_MAX_W;
-	ctx->max_height = MTK_VDEC_MAX_H;
 
 	v4l_bound_align_image(&q_data->coded_width,
 				MTK_VDEC_MIN_W,
-- 
2.37.0.rc0.161.g10f37bed90-goog

