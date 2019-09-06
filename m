Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03EAAB76F
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391334AbfIFLzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:55:33 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41019 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390223AbfIFLzd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so3369900pgg.8
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OhbUrYZqce0AMoF+F11Glo98JJ+mfowWQPDmtjNy0c=;
        b=j0fpr0SZSekbxfXZ1FC/pKVVDJOVri+GMbhaUUg0GN7iFcJUJbsxYR2ufhju7H4jFa
         Jv5dNhGX1Oqtv4RcGth4eaQdF8yVq5LeliVMFrfqFwvuiRhpX30n+RWuTHUTalX6WKus
         REzcBschvcwWBSNcVBdtu2HD0ERIb/mvo+mT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OhbUrYZqce0AMoF+F11Glo98JJ+mfowWQPDmtjNy0c=;
        b=VNGy39WbtCtmZcq3B63qU56csl4AyBW3gARLulYWUe/qq18Bi7smOgKBYbiHbBLGy1
         Bl2DR+J3DrvWjPh3kNPwi/21/xEa9feMpuAKXb+O03xcVM3zAmAsMpa5kVGwNUuaHkxR
         M4nHVpDEWTn9kpO1Bz45Eb/FZTftzDPGqD3gU8Nye4KEIssylYijBbtgCPC6SqLdaUtB
         i+loLvIO08WHrEa1xVWrsfZyNIIGc7Z/UrzeFe/9tghkzP7JOko+88nri7X7rBql2tf7
         c0ef46biimq4+XB64dj5F/WuE25+1yDFFZymExy9pG6ID/vl51dTqqz2EkTCEmvExFR1
         HKog==
X-Gm-Message-State: APjAAAUOyBRwy6lX2m7XuL/kFxDbE+idIoV9UeffqWMvYu0vhFp68wYr
        Xv5VQPSMnFANOwcXgMRampj0zg==
X-Google-Smtp-Source: APXvYqy4WC4joqsKUtL19abRcSKOqjJJ+pZZ5uFtnSaqIUEDo7bsKgApsUMm4LCY1XtDNk4LXigH1g==
X-Received: by 2002:a17:90a:264a:: with SMTP id l68mr9420784pje.74.1567770932661;
        Fri, 06 Sep 2019 04:55:32 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:32 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 01/13] media: mtk-vcodec: vdec: fix incorrect pointer dereference
Date:   Fri,  6 Sep 2019 20:55:01 +0900
Message-Id: <20190906115513.159705-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

mtk_q_data::fmt is actually a pointer and must be dereferenced as such.
This went under the radar because mtk_v4l2_debug() evaluates to nothing
unless DEBUG is defined.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: split into its own commit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 26a55c3e807e..653f111532ab 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -284,7 +284,7 @@ static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
 		fmt = &mtk_video_formats[k];
 		if (fmt->fourcc == pixelformat) {
 			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
-				dst_q_data->fmt.fourcc, pixelformat);
+				dst_q_data->fmt->fourcc, pixelformat);
 			dst_q_data->fmt = fmt;
 			return;
 		}
-- 
2.23.0.187.g17f5b7556c-goog

