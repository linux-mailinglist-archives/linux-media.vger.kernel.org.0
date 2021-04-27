Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527D636C4DC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237842AbhD0LRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235915AbhD0LQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:16:54 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA291C061761
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:10 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t2-20020a17090a0242b0290155433387beso1194244pje.1
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NeuaYr+AFNS6zFyhjEclvaB+RiQlE5bnT3MqlgX4tYM=;
        b=NM92KqfkwK8D3MAj2A2IAOebWPxBDpy9nSUs6JX+LRjwpxE0EIEV6xkPFinBPMwPcJ
         7z4RGCGDQ1uTLDWFAbWnbv131GzqbJY3okRp8m3cMGKPOVIsWF3TlS8P+ko8Pe8XwWgf
         4/Ju9NNy1J/ngY8tL+zqPRbuxYBveekRdsRnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NeuaYr+AFNS6zFyhjEclvaB+RiQlE5bnT3MqlgX4tYM=;
        b=PpAkHTPme+OagLwVkXrFGtA13GJ9wr0YJYxF6FVaL6VP3ewGqajXac6T70sRxu/Ntu
         P3dWWa2Vl0yg3Lw2GzHI3zlaTm+Vbdo9xmAE03fhKydgblpysk924o+lAoaeo2Lriaby
         N4z2pk8Dsxg45UwjdCN5UnhQu+DK2DLBYUj02V02KVxk1QCjkWdMwyxPNguGugpunOze
         Wz+GY2zbwviUKl7NPFxLboh8K/b0xUnZk5/DQr7PNw34x+x7RB3rnM9FKrqzE3pG8+Hh
         qCTuOX7JEadGcR5xUXPtJI2zNiVJSnOJfOkINyoCnp50/GGdmcarsvKeWlVBQLMbBmgr
         oJTg==
X-Gm-Message-State: AOAM532mk4BGoLg6ZaPuMQnbrJqNzcZR31sQMs1UAD/zyHqsrd+D5r7c
        97oQ+OgkkSZJOdaBNw8WAhPAkrFeennYLg==
X-Google-Smtp-Source: ABdhPJyutim3aaPgcxoEFFLupS3n22kco1aCh6AI2C6Fs/kJN99bNeQBf5nXs1moTycGo7zNU8lGPg==
X-Received: by 2002:a17:902:9a0a:b029:e6:bf00:8a36 with SMTP id v10-20020a1709029a0ab02900e6bf008a36mr24255695plp.51.1619522170256;
        Tue, 27 Apr 2021 04:16:10 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:b182:d363:32d0:53a2])
        by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:16:09 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 12/15] media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
Date:   Tue, 27 Apr 2021 20:15:23 +0900
Message-Id: <20210427111526.1772293-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling S_FMT or TRY_FMT on the OUTPUT queue should adjust the
resolution to the limits supported by the hardware. Until now this was
only done on the CAPTURE queue, which could make clients believe that
unsupported resolutions can be used when they set the coded size on the
OUTPUT queue.

In the case of the stateless decoder, the problem was even bigger since
subsequently calling G_FMT on the CAPTURE queue would result in the
unclamped resolution being returned, further inducing the client into
error.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 4ef4b68ec9bd..0fafe8f9e1b9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -223,19 +223,19 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
+				MTK_VDEC_MIN_W,
+				MTK_VDEC_MAX_W);
+	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
+				MTK_VDEC_MIN_H,
+				MTK_VDEC_MAX_H);
+
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
-		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H);
-		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W);
-
 		/*
 		 * Find next closer width align 64, heign align 64, size align
 		 * 64 rectangle
-- 
2.31.1.498.g6c1eba8ee3d-goog

