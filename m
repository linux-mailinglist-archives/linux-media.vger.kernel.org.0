Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C306B8FBB
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 11:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjCNKXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 06:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCNKXQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 06:23:16 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6A15FE94
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 03:22:48 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id i3so16063370plg.6
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678789367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=helyLAaSkHezCDHRaiPEnQcGx2qVQUT/bMk+TbB5Rk8=;
        b=bYvaecdDD3x6Hr9bDFOAZzQPuTYOvrXzOL2W3Z+W8i6brWc5Ctp8SyoWm2aVQpeEgb
         6DIfZYAAyXId56J9EwmapBH2fqXJff9mRmVFyNPtdlY6dHsezZZGzTIaNsKWeWFZro93
         xjxNL0a1AR576oyFoGzpXuNQtGpZbBjuJ2Zv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678789367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=helyLAaSkHezCDHRaiPEnQcGx2qVQUT/bMk+TbB5Rk8=;
        b=HdkNLwhTOIm+gSfjSVycDDIqQllQUWmUY2fBBpkqryE8nYwU28a9QCjJ/Gquhsw9Hz
         ReukgAQTW5K6BPAIiUNs0ee+KNKqB2/XkqHXV7bGW3yFsUFOCeVMYGgfgBQwM9R2idLV
         Sy78wJEY0uGF+O3l1LhMGaRHuft//Vtvvmxsa79RfunOxz8jw1o/2yv+R26YF2Wkww89
         dKxtiM6bA0iLQIqhbQeAg4q1RcYXhvj1YxLyyyKXCQULMc4+yyia3vXxtp++2WZvbdkC
         7xl57EqPMkyuEGgOuvoVrD8LfQDFealKKNe6au7KcegwW+RQahvvw9bRFaKpZ6+lDHMp
         a78A==
X-Gm-Message-State: AO0yUKUUI0xZyuewg/+3X6jnvMpX8H8FqkTqQ1aZIKfIJCnk7vQ7gkST
        u4epEtxWDtp3GxycdTYdpBhgfbP2PnZO4HTyXsQ=
X-Google-Smtp-Source: AK7set9qMrH1n8EpNSZoO1e/VzYoi2/xCMSAQ7Q4krIxrlPWf/u8a4TA/vrS/7VRxRZOGEdKrwLXwA==
X-Received: by 2002:a17:903:481:b0:1a0:5bb1:3f13 with SMTP id jj1-20020a170903048100b001a05bb13f13mr3142238plb.39.1678789367645;
        Tue, 14 Mar 2023 03:22:47 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:3718:fdeb:7d7e:b6c0])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b0019cb131b8a5sm1417194plj.32.2023.03.14.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 03:22:47 -0700 (PDT)
From:   Pin-yen Lin <treapking@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        Chen-Yu Tsai <wenst@chromium.org>,
        Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2] media: mediatek: vcodec: Use 4K frame size when supported by stateful decoder
Date:   Tue, 14 Mar 2023 18:22:41 +0800
Message-Id: <20230314102241.1971120-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After commit b018be06f3c7 ("media: mediatek: vcodec: Read max resolution
from dec_capability"), the stateful video decoder driver never really
sets its output frame size to 4K.

Parse the decoder capability reported by the firmware, and update the
output frame size in mtk_init_vdec_params to enable 4K frame size when
available.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- Rebase to media_tree/master

 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c        | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index 035c86e7809f..29991551cf61 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -11,7 +11,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
-static const struct mtk_video_fmt mtk_video_formats[] = {
+static struct mtk_video_fmt mtk_video_formats[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_DEC,
@@ -580,6 +580,16 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 {
+	unsigned int i;
+
+	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) {
+		for (i = 0; i < num_supported_formats; i++) {
+			mtk_video_formats[i].frmsize.max_width =
+				VCODEC_DEC_4K_CODED_WIDTH;
+			mtk_video_formats[i].frmsize.max_height =
+				VCODEC_DEC_4K_CODED_HEIGHT;
+		}
+	}
 }
 
 static struct vb2_ops mtk_vdec_frame_vb2_ops = {
-- 
2.40.0.rc1.284.g88254d51c5-goog

