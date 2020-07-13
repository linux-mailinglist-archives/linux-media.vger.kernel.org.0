Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A55321CF61
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgGMGKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbgGMGKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:10:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73173C061794
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 207so5557741pfu.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gB83jD2FpTYfBDRkUJH8DvVVofs2yRFQbXc2yeSZvmk=;
        b=mQneNRTvRh7TEV8oSckX8BzrplvT9JWTPgTge++Ykp1B5RphqvW7GoZJ7CuLCG5NUG
         ALY50gHRt/NcNRLiQoXmQFstFkEHgQkNYkl7cQQe6wc1diyCVsgb0FDopMACd33C9vqe
         SGZDpkH8trEfdC9w/dw0KWhHA4PTUTO9iYCas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gB83jD2FpTYfBDRkUJH8DvVVofs2yRFQbXc2yeSZvmk=;
        b=s6Oy+bjBGb3fWvwIf10gfyVaATaNTYF2nIxBrRwQbizZbTyDHjCliMvY3i6akyT1qT
         AgXXvnFyB1uf9L7LHb1ly9F5lLnrTTavgHvKd4E0XsKrdAi91YY1oog4gZQ66WXT4BdL
         VZerjgLNU9xa2D0y08ZJYteMEhNqRaBVwLRFwEShHazUbifLl04+yzEBckdRZnAaLYWl
         cQ/+wWayWDSfnO0kRnDgHJBHsUb73yy5wspVobXPiWYFcxO56oOeAGN4AaRGR1GF3JjV
         JJFXrFkggHqh+8r5TUp0HFPn1njCTNa0I5g7oXVsLVz4xbGB81FAiW9n3DMcl+Rg4oCR
         G/vg==
X-Gm-Message-State: AOAM53210mSlA7aEaYwvJbxPZugIu/9DwCcSS17QRwWOjgGyVB8XusW3
        fh1IgVK52eB2LoFvRUmj621M/A==
X-Google-Smtp-Source: ABdhPJw7xh/m0JWlcTmFBX/gTdG+Hj4V1YLkVAmb10CsnxvzrbYdCbIFz51djjnYzpvhScMv8yE81Q==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr66187991pgh.255.1594620600025;
        Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:59 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 16/16] media: mtk-vcodec: venc: fix invalid time per frame in S_PARM
Date:   Mon, 13 Jul 2020 15:08:42 +0900
Message-Id: <20200713060842.471356-17-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance expects the driver to adjust the time per frame if it is
invalid (numerator or denominator set to 0). Adjust it to the default
value in these cases.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 09baac2dbc36..82b04714f750 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -200,14 +200,18 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -EINVAL;
 
-	ctx->enc_params.framerate_num =
-			a->parm.output.timeperframe.denominator;
-	ctx->enc_params.framerate_denom =
-			a->parm.output.timeperframe.numerator;
+	if (timeperframe->numerator == 0 || timeperframe->denominator == 0) {
+		timeperframe->numerator = MTK_DEFAULT_FRAMERATE_NUM;
+		timeperframe->denominator = MTK_DEFAULT_FRAMERATE_DENOM;
+	}
+
+	ctx->enc_params.framerate_num = timeperframe->denominator;
+	ctx->enc_params.framerate_denom = timeperframe->numerator;
 	ctx->param_change |= MTK_ENCODE_PARAM_FRAMERATE;
 
 	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-- 
2.27.0.383.g050319c2ae-goog

