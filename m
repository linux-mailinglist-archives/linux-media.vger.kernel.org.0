Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CC224D2B5
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbgHUKhu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728754AbgHUKh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:37:27 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A69C061345
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:27 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t6so648844pjr.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DufvN1VHKhvycaUKRq7bCN3zR8+vkOiC/Y9oiV+15/w=;
        b=HvtvAHLNuEBtOSAUa+7D7d50ohlMgLoBYEZZbiVTcm9izI+AGbs6y8jlsmWnkcMU3N
         q4AP13L+wM7iufOmGvaxPVQsglfouW9tD/iCeCQcaJurm3jux6JjQMo7YVc2GHQ4GNH4
         PkOXOLKnCislXsGbtjcFFMwQR625Ue9zBxPVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DufvN1VHKhvycaUKRq7bCN3zR8+vkOiC/Y9oiV+15/w=;
        b=WcX+LgH8ThEVpm15U32q9rqfVMyRPUTl6Fa02MQB0QTRZXwbTDY+955Ku91S6pSaNu
         /5ryyzEE4Tg3l/Nws9d/b6lPkXVjoPiPWK3dO/d78Izuly4/yBzPFgEeyS07XQIHhYt2
         wmYim+y8DOved5WomJU7DQJf+haf1VAL/VCyqjiKpqioK9X58S8ulUdiRpCgieHJ+yt8
         rOAfNAoOpOYd6+q/nyM7C0sxZjJQKMpcY/1g6VXBToVbOgYF30gAB/+fB/DRoKr5UhV5
         g6Cty1n8+MwQ736qKqkxl/9ohPYZ0wC2KPQryykEqwyhd+SoAPa+3O9ca+ur6J9ZGQ6F
         KLnA==
X-Gm-Message-State: AOAM5315KcnOhdljvahdcrI80a33/E2HScUpbdrOdHlOZT43+1k7Kcet
        d7U8pkAo7a/RU5xuuw31eew7UA==
X-Google-Smtp-Source: ABdhPJwDddg8xE6aw1cgQorjp++aUtEmKN10tnGi0rgs5jvKyG1NLD77bBM5fWtyTpMsucUd1d2s/Q==
X-Received: by 2002:a17:90a:bd15:: with SMTP id y21mr1898704pjr.144.1598006247152;
        Fri, 21 Aug 2020 03:37:27 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:37:26 -0700 (PDT)
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
Subject: [PATCH v4 16/17] media: mtk-vcodec: venc: set default time per frame
Date:   Fri, 21 Aug 2020 19:36:07 +0900
Message-Id: <20200821103608.2310097-17-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
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
2.28.0.297.g1956fa8f8d-goog

