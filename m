Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B7220ADEF
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbgFZIG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgFZIG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:27 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C46C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g67so3732834pgc.8
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=evtrCYHSdHnuBRytP/f+jrOFkvug6jATLmDqRSZ+8hQ=;
        b=BViNojs9YIai+UQ26YKPc1Gyi2EqGuh9US29Lyjnq64nTD6Sua6s9TpttvyM1p5+dg
         gOdYTif5UB5tXvI4hchPwtbdMKFdasEtaf6vn6DfmMHoafNdsnsxn2toJUNy5G6Umv4Q
         ULDjoAXmqcURsZh3Knw87m5QS0qnUjJgQzs+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=evtrCYHSdHnuBRytP/f+jrOFkvug6jATLmDqRSZ+8hQ=;
        b=dVVCMsRZkUxuPSuY1t1Sb0TyDalaKOUTiIE05lABBsAAPg/SxPot4LWTaAroHov2+v
         d7jtjoyTy8tVbaZ5smfHmFJHusmNaCymz1CoY7m7sQUvsMIiPiOak9wspTyo1lamf3gs
         hEu1+59xLPOPzsyhlSrZWpbSJ4D9Nsn2QAggj4XdUj20J6pnaJgW5MN7inBuvqD2/xHA
         SnGeU+SD1aOAxS9n27CiS36S34gOyHDYrOtm0iu1usn1cJCTvKktkXyM9So2gaUKRgui
         nDJm1bqGyyF6NqUznxIDNh1OYo1T3zYlqkpIPqUuNCfQiGr9TznwzcT2X8h+9FoIiv1k
         cj3Q==
X-Gm-Message-State: AOAM531QhOEcysCt0eOMslCIxtAoSADJ4fyXmhXGlaLgxf/wqxI2Xa1I
        G5EyP0XxQn97znmkI7N1t/E/85Q8RhLcPg==
X-Google-Smtp-Source: ABdhPJy3zAAopqxOej7DoxBkHLfq5ZCjDR98UaQJgPW5fCnUtFw9ztF6Gjw128Pr5KHLMZEmeWmYCw==
X-Received: by 2002:a65:6089:: with SMTP id t9mr1726244pgu.236.1593158786871;
        Fri, 26 Jun 2020 01:06:26 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:26 -0700 (PDT)
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
Subject: [PATCH v2 18/18] media: mtk-vcodec: venc: fix invalid time per frame in S_PARM
Date:   Fri, 26 Jun 2020 17:04:42 +0900
Message-Id: <20200626080442.292309-19-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
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
index c9756a4748ef..1b4be2493aa5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -201,14 +201,18 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -ENOTTY;
 
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
2.27.0.212.ge8ba1cc988-goog

