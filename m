Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963AC3E2260
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242705AbhHFEQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhHFEQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:19 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D4CC061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:04 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t101-20020a25aaee0000b0290578c0c455b2so8293312ybi.13
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FlUyCuv7nkwXTSJ3TTeSOKCRVd1rmSaLBcPma8bxmIM=;
        b=pMYzDnLMqRNNyVX7IyuBXL5iUhkbKDXXpG0CxRp58y7sq4gjNrB3bz4oxGfwUiKR64
         VjThSogoktlM+DG5BrtqtQvZ0bR0uRyK3tnL78Pr82fGOVHWURGaGEh9juJVyas8h8kN
         g/VZ0mB5H86LnfK7zM5awlyoPkGBLet+GtFWs7V/ql2mpIsO8jX7+DaCxcgeid0NWltU
         dOMbnMntZ3UdQe+MWCyEwz+5Xe2qrPfHqTUBBmyVX8vxNNHCRvjM1213/jShbPO84Dzg
         +00LwAAKtR6qMy1HbI6IjgozhgFWeSjF0y83cCRfypy0vz3Dco/Z42vUkKi1nibgoQl+
         L/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FlUyCuv7nkwXTSJ3TTeSOKCRVd1rmSaLBcPma8bxmIM=;
        b=aSAQnVWvX5ZS7G0lcOAKO/I6DTeGkj924/Wmo/LDPj664KZWFfwQspInxQa7JMuW1Y
         cWknHWdrDAtrwo1i7R7tiaHIOAC519dyuFghklh4m+kzkhTWFhXzak6W4/7Nwuq0yPTL
         ytxkEoim7009KScphpZ/1vgF12Oj3ENJBXx2YofsIH7UNUAUgC0OkrpMy1Bpi1dBRN1G
         sDo58h9tPajXmomzBLTUYeBvU2VEX/KQFHgSYaSIexdDMLz0bWjBut+psoLxAveq+zUc
         Pjjgn/Z3J3yxZVEqMBu2oclJH2YtERllWJazu+LjfWdRkAvIiyWUJu0KGejt1UNFrJEm
         eKlw==
X-Gm-Message-State: AOAM530HtwVtlnvkyXTP48jO6BYThLvflR2BYwXXXTpdbrpbt4ZXLb65
        xk4dC28zII4U3+zXJqnS2lXC02nJ5u7F
X-Google-Smtp-Source: ABdhPJxQsftZR7o7MRHdKIkC/yVIzT3BAW7EZW5HLGDHihPAsV9sxnwfsKyRFnWdjjB/0CB/Lo9V4t1gqchB
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:7810:: with SMTP id
 t16mr10800664ybc.352.1628223363503; Thu, 05 Aug 2021 21:16:03 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:19 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 03/14] media: mtk-vcodec: vdec: clamp OUTPUT resolution to
 hardware limits
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 1a633b485a69..16e057f73789 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -649,19 +649,17 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width =
+		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, MTK_VDEC_MAX_W);
+	pix_fmt_mp->height =
+		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, MTK_VDEC_MAX_H);
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
2.32.0.605.g8dce9f2422-goog

